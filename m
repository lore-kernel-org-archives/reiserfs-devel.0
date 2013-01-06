From: Edward Shishkin <edward@redhat.com>
Subject: [patch] reiser4: fixups for 3.7
Date: Sun, 6 Jan 2013 21:22:16 +0100
Message-ID: <20130106212216.73d76776@zeta.brq.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com

This patch is against Linux-3.7 + the following two patches
from Ivan Shapovalov:
1) reiser4-3.7-whole.patch
2) 0001-reiser4-add-a-stub-for-address_space_operations-migr.patch

. Ifdef reiser4_migratepage to prevent compilation error
  in the case when CONFIG_MIGRATION is not defined;
. Use separate foo_bugop() instead of the common bugop()
  to understand in what stub the oops occured;
. Don't set zeros to the body of ctail item in debug mode
  (where extra-modifications are highly undesirable);
. Use "dispatch" prefix for file operations, which pass
  management to FILE plugins in accordance with inode's
  plugin table (pset);
. Update comments.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/as_ops.c                      |   14 +--
 fs/reiser4/context.h                     |   13 +-
 fs/reiser4/plugin/file/file.c            |    2 
 fs/reiser4/plugin/file/file.h            |   64 +++++--------
 fs/reiser4/plugin/file/file_conversion.c |   74 ++++++----------
 fs/reiser4/plugin/file_ops.c             |    4 
 fs/reiser4/plugin/item/ctail.c           |    5 -
 fs/reiser4/plugin/item/extent_file_ops.c |   20 ++--
 fs/reiser4/plugin/item/tail.c            |   17 ++-
 fs/reiser4/plugin/object.c               |  143 +++++++++++++++++++++++++------
 fs/reiser4/plugin/plugin.h               |   11 --
 fs/reiser4/super_ops.c                   |   10 +-
 fs/reiser4/txnmgr.c                      |    2 
 fs/reiser4/vfs_ops.c                     |   10 +-
 fs/reiser4/vfs_ops.h                     |    5 +
 15 files changed, 233 insertions(+), 161 deletions(-)

--- linux-3.7.1.orig/fs/reiser4/as_ops.c
+++ linux-3.7.1/fs/reiser4/as_ops.c
@@ -305,15 +305,17 @@ int reiser4_releasepage(struct page *pag
 	}
 }
 
+#ifdef CONFIG_MIGRATION
 int reiser4_migratepage(struct address_space *mapping, struct page *newpage,
 			struct page *page, enum migrate_mode mode)
 {
-	/* TODO: implement page migration (or prove it to be impossible)
+	/* TODO: implement movable mapping
 	 */
 	return fail_migrate_page(mapping, newpage, page);
 }
+#endif /* CONFIG_MIGRATION */
 
-int reiser4_readpage(struct file *file, struct page *page)
+int reiser4_readpage_dispatch(struct file *file, struct page *page)
 {
 	assert("edward-1533", PageLocked(page));
 	assert("edward-1534", !PageUptodate(page));
@@ -322,15 +324,15 @@ int reiser4_readpage(struct file *file,
 	return inode_file_plugin(page->mapping->host)->readpage(file, page);
 }
 
-int reiser4_readpages(struct file *file, struct address_space *mapping,
-		      struct list_head *pages, unsigned nr_pages)
+int reiser4_readpages_dispatch(struct file *file, struct address_space *mapping,
+			       struct list_head *pages, unsigned nr_pages)
 {
 	return inode_file_plugin(mapping->host)->readpages(file, mapping,
 							   pages, nr_pages);
 }
 
-int reiser4_writepages(struct address_space *mapping,
-		       struct writeback_control *wbc)
+int reiser4_writepages_dispatch(struct address_space *mapping,
+				struct writeback_control *wbc)
 {
 	return inode_file_plugin(mapping->host)->writepages(mapping, wbc);
 }
--- linux-3.7.1.orig/fs/reiser4/context.h
+++ linux-3.7.1/fs/reiser4/context.h
@@ -65,12 +65,13 @@ struct reiser4_context {
 
 	/* count non-trivial jnode_set_dirty() calls */
 	unsigned long nr_marked_dirty;
-
-	/* reiser4_writeback_inodes calls (via generic_writeback_sb_inodes)
-	 * reiser4_writepages for each of dirty inodes. Reiser4_writepages
-	 * captures pages. When number of pages captured in one
-	 * reiser4_sync_inodes reaches some threshold - some atoms get
-	 * flushed */
+	/*
+	 * reiser4_writeback_inodes calls (via generic_writeback_sb_inodes)
+	 * reiser4_writepages_dispatch for each of dirty inodes.
+	 * Reiser4_writepages_dispatch captures pages. When number of pages
+	 * captured in one reiser4_writeback_inodes reaches some threshold -
+	 * some atoms get flushed
+	 */
 	int nr_captured;
 	int nr_children;	/* number of child contexts */
 	struct page *locked_page; /* page that should be unlocked in
--- linux-3.7.1.orig/fs/reiser4/plugin/file/file.c
+++ linux-3.7.1/fs/reiser4/plugin/file/file.c
@@ -1150,7 +1150,7 @@ static int commit_file_atoms(struct inod
 		     * when we are called by
 		     * filemap_fdatawrite->
 		     *    do_writepages()->
-		     *       reiser4_writepages()
+		     *       reiser4_writepages_dispatch()
 		     *
 		     * inode->i_mapping->dirty_pages are spices into
 		     * ->io_pages, leaving ->dirty_pages dirty.
--- linux-3.7.1.orig/fs/reiser4/plugin/file/file.h
+++ linux-3.7.1/fs/reiser4/plugin/file/file.h
@@ -22,52 +22,40 @@ struct dispatch_context {
 	dispatch_state state;
 };
 
-/**
- * Declarations of common/careful/generic methods.
- * Suppose ->foo() is a vs method (of f_ops, i_ops, or a_ops);
- * Then common reiser4 method for foo looks like reiser4_foo_common;
- * careful method looks like reiser4_foo_careful;
- * generic method looks like reiser4_foo.
- *
- * Common method is a simple instruction set eligible for more
- * then one plugin id.
- *
- * Generic method looks at the plugin installed in inode's
- * plugin set and calls its appropriate method.
- *
- * Careful method looks like generic method with protected pset
- * (see plugin/file/file_conversion.c for details).
+/*
+ * Declarations of methods provided for VFS.
  */
 
 /* inode operations */
-int reiser4_setattr(struct dentry *, struct iattr *);
+int reiser4_setattr_dispatch(struct dentry *, struct iattr *);
 
 /* file operations */
-ssize_t reiser4_read_careful(struct file *, char __user *buf,
-			     size_t count, loff_t *off);
-ssize_t reiser4_write_careful(struct file *, const char __user *buf,
-			      size_t count, loff_t * off);
-long reiser4_ioctl_careful(struct file *filp, unsigned int cmd,
-			   unsigned long arg);
-int reiser4_mmap_careful(struct file *, struct vm_area_struct *);
-int reiser4_open_careful(struct inode *inode, struct file *file);
-int reiser4_release_careful(struct inode *, struct file *);
+ssize_t reiser4_read_dispatch(struct file *, char __user *buf,
+			      size_t count, loff_t *off);
+ssize_t reiser4_write_dispatch(struct file *, const char __user *buf,
+			       size_t count, loff_t * off);
+long reiser4_ioctl_dispatch(struct file *filp, unsigned int cmd,
+			    unsigned long arg);
+int reiser4_mmap_dispatch(struct file *, struct vm_area_struct *);
+int reiser4_open_dispatch(struct inode *inode, struct file *file);
+int reiser4_release_dispatch(struct inode *, struct file *);
 int reiser4_sync_file_common(struct file *, loff_t, loff_t, int datasync);
 
 /* address space operations */
-int reiser4_readpage(struct file *, struct page *);
-int reiser4_readpages(struct file*, struct address_space*, struct list_head*,
-		      unsigned);
-int reiser4_writepages(struct address_space *, struct writeback_control *);
-int reiser4_write_begin_careful(struct file *file,
-				struct address_space *mapping,
-				loff_t pos, unsigned len, unsigned flags,
-				struct page **pagep, void **fsdata);
-int reiser4_write_end_careful(struct file *file,
-			      struct address_space *mapping,
-			      loff_t pos, unsigned len, unsigned copied,
-			      struct page *page, void *fsdata);
-sector_t reiser4_bmap_careful(struct address_space *, sector_t lblock);
+int reiser4_readpage_dispatch(struct file *, struct page *);
+int reiser4_readpages_dispatch(struct file *, struct address_space *,
+			       struct list_head *, unsigned);
+int reiser4_writepages_dispatch(struct address_space *,
+				struct writeback_control *);
+int reiser4_write_begin_dispatch(struct file *file,
+				 struct address_space *mapping,
+				 loff_t pos, unsigned len, unsigned flags,
+				 struct page **pagep, void **fsdata);
+int reiser4_write_end_dispatch(struct file *file,
+			       struct address_space *mapping,
+			       loff_t pos, unsigned len, unsigned copied,
+			       struct page *page, void *fsdata);
+sector_t reiser4_bmap_dispatch(struct address_space *, sector_t lblock);
 
 /*
  * Private methods of unix-file plugin
--- linux-3.7.1.orig/fs/reiser4/plugin/file/file_conversion.c
+++ linux-3.7.1/fs/reiser4/plugin/file/file_conversion.c
@@ -509,24 +509,15 @@ static inline void done_dispatch_context
 		kfree(cont->pages);
 	}
 }
-/**
- * Here are wrappers with "protection", aka Reiser4 "careful" methods.
- * They are used by vfs (as methods of file_ops, inode_ops or as_ops),
- * which is not aware of plugin conversion performed by Reiser4.
- */
 
 /*
- * Wrappers with active protection for:
+ * ->write() VFS file operation
  *
- * ->write();
+ * performs "intelligent" conversion in the FILE interface.
+ * Write a file in 3 steps (2d and 3d steps are optional).
  */
-
-/*
- * ->write() file operation supplied to VFS.
- * Write a file in 3 steps (some of them can be optional).
- */
-ssize_t reiser4_write_careful(struct file *file, const char __user *buf,
-			      size_t count, loff_t *off)
+ssize_t reiser4_write_dispatch(struct file *file, const char __user *buf,
+			       size_t count, loff_t *off)
 {
 	int result;
 	reiser4_context *ctx;
@@ -593,7 +584,8 @@ ssize_t reiser4_write_careful(struct fil
 	return written_old + (written_new < 0 ? 0 : written_new);
 }
 
-/* Wrappers with passive protection for:
+/*
+ * Dispatchers with "passive" protection for:
  *
  * ->open();
  * ->read();
@@ -603,37 +595,37 @@ ssize_t reiser4_write_careful(struct fil
  * ->bmap().
  */
 
-int reiser4_open_careful(struct inode *inode, struct file *file)
+int reiser4_open_dispatch(struct inode *inode, struct file *file)
 {
 	return PROT_PASSIVE(int, open, (inode, file));
 }
 
-ssize_t reiser4_read_careful(struct file * file, char __user * buf,
-			     size_t size, loff_t * off)
+ssize_t reiser4_read_dispatch(struct file * file, char __user * buf,
+			      size_t size, loff_t * off)
 {
 	struct inode * inode = file->f_dentry->d_inode;
 	return PROT_PASSIVE(ssize_t, read, (file, buf, size, off));
 }
 
-long reiser4_ioctl_careful(struct file *filp, unsigned int cmd,
-			   unsigned long arg)
+long reiser4_ioctl_dispatch(struct file *filp, unsigned int cmd,
+			    unsigned long arg)
 {
 	struct inode * inode = filp->f_dentry->d_inode;
 	return PROT_PASSIVE(int, ioctl, (filp, cmd, arg));
 }
 
-int reiser4_mmap_careful(struct file *file, struct vm_area_struct *vma)
+int reiser4_mmap_dispatch(struct file *file, struct vm_area_struct *vma)
 {
 	struct inode *inode = file->f_dentry->d_inode;
 	return PROT_PASSIVE(int, mmap, (file, vma));
 }
 
-int reiser4_release_careful(struct inode *inode, struct file *file)
+int reiser4_release_dispatch(struct inode *inode, struct file *file)
 {
 	return PROT_PASSIVE(int, release, (inode, file));
 }
 
-sector_t reiser4_bmap_careful(struct address_space * mapping, sector_t lblock)
+sector_t reiser4_bmap_dispatch(struct address_space * mapping, sector_t lblock)
 {
 	struct inode *inode = mapping->host;
 	return PROT_PASSIVE(sector_t, bmap, (mapping, lblock));
@@ -645,13 +637,13 @@ sector_t reiser4_bmap_careful(struct add
  * reiser4_write_end() can not cope with
  * short writes for now.
  */
-int reiser4_write_begin_careful(struct file *file,
-				struct address_space *mapping,
-				loff_t pos,
-				unsigned len,
-				unsigned flags,
-				struct page **pagep,
-				void **fsdata)
+int reiser4_write_begin_dispatch(struct file *file,
+				 struct address_space *mapping,
+				 loff_t pos,
+				 unsigned len,
+				 unsigned flags,
+				 struct page **pagep,
+				 void **fsdata)
 {
 	int ret = 0;
 	struct page *page;
@@ -681,7 +673,7 @@ int reiser4_write_begin_careful(struct f
 	ret = PROT_PASSIVE(int, write_begin, (file, page, pos, len, fsdata));
 	if (unlikely(ret))
 		goto err1;
-	/* Success. Resorces will be released in write_end_careful */
+	/* Success. Resorces will be released in write_end_dispatch */
 	return 0;
  err1:
 	reiser4_exit_context(ctx);
@@ -691,13 +683,13 @@ int reiser4_write_begin_careful(struct f
 	return ret;
 }
 
-int reiser4_write_end_careful(struct file *file,
-			      struct address_space *mapping,
-			      loff_t pos,
-			      unsigned len,
-			      unsigned copied,
-			      struct page *page,
-			      void *fsdata)
+int reiser4_write_end_dispatch(struct file *file,
+			       struct address_space *mapping,
+			       loff_t pos,
+			       unsigned len,
+			       unsigned copied,
+			       struct page *page,
+			       void *fsdata)
 {
 	int ret;
 	reiser4_context *ctx;
@@ -722,11 +714,9 @@ int reiser4_write_end_careful(struct fil
 }
 
 /*
- * Wrappers without protection for:
- *
- * ->setattr()
+ * Dispatchers without protection
  */
-int reiser4_setattr(struct dentry *dentry, struct iattr *attr)
+int reiser4_setattr_dispatch(struct dentry *dentry, struct iattr *attr)
 {
 	return inode_file_plugin(dentry->d_inode)->setattr(dentry, attr);
 }
--- linux-3.7.1.orig/fs/reiser4/plugin/file_ops.c
+++ linux-3.7.1/fs/reiser4/plugin/file_ops.c
@@ -69,8 +69,8 @@ int reiser4_sync_common(struct file *fil
  *
  * Situation is complicated by anonymous pages: i.e., extent-less pages
  * dirtied through mmap. Fortunately sys_fsync() first calls
- * filemap_fdatawrite() that will ultimately call reiser4_writepages(), insert
- * all missing extents and capture anonymous pages.
+ * filemap_fdatawrite() that will ultimately call reiser4_writepages_dispatch,
+ * insert all missing extents and capture anonymous pages.
  */
 int reiser4_sync_file_common(struct file *file, loff_t start, loff_t end, int datasync)
 {
--- linux-3.7.1.orig/fs/reiser4/plugin/item/ctail.c
+++ linux-3.7.1/fs/reiser4/plugin/item/ctail.c
@@ -488,10 +488,7 @@ cut_or_kill_ctail_units(coord_t * coord,
 			   by units got freed */
 			count += sizeof(ctail_item_format);
 		}
-		if (REISER4_DEBUG)
-			memset(item, 0, count);
-	} else if (REISER4_DEBUG)
-		memset(item + sizeof(ctail_item_format) + from, 0, count);
+	}
 	return count;
 }
 
--- linux-3.7.1.orig/fs/reiser4/plugin/item/extent_file_ops.c
+++ linux-3.7.1/fs/reiser4/plugin/item/extent_file_ops.c
@@ -1301,14 +1301,18 @@ int reiser4_read_extent(struct file *fil
 }
 
 /*
-   plugin->s.file.readpage
-   reiser4_read->unix_file_read->page_cache_readahead->reiser4_readpage->unix_file_readpage->extent_readpage
-   or
-   filemap_fault->reiser4_readpage->readpage_unix_file->->readpage_extent
-
-   At the beginning: coord->node is read locked, zloaded, page is
-   locked, coord is set to existing unit inside of extent item (it is not necessary that coord matches to page->index)
-*/
+ * plugin->s.file.readpage
+ *
+ * reiser4_read->unix_file_read->page_cache_readahead->
+ * ->reiser4_readpage_dispatch->readpage_unix_file->readpage_extent
+ * or
+ * filemap_fault->reiser4_readpage_dispatch->readpage_unix_file->
+ * ->readpage_extent
+ *
+ * At the beginning: coord->node is read locked, zloaded, page is
+ * locked, coord is set to existing unit inside of extent item (it
+ * is not necessary that coord matches to page->index)
+ */
 int reiser4_readpage_extent(void *vp, struct page *page)
 {
 	uf_coord_t *uf_coord = vp;
--- linux-3.7.1.orig/fs/reiser4/plugin/item/tail.c
+++ linux-3.7.1/fs/reiser4/plugin/item/tail.c
@@ -404,13 +404,16 @@ static int do_readpage_tail(uf_coord_t *
 }
 
 /*
-   plugin->s.file.readpage
-   reiser4_read->unix_file_read->page_cache_readahead->reiser4_readpage->unix_file_readpage->readpage_tail
-   or
-   filemap_fault->reiser4_readpage->readpage_unix_file->->readpage_tail
-
-   At the beginning: coord->node is read locked, zloaded, page is locked, coord is set to existing unit inside of tail
-   item. */
+ * plugin->s.file.readpage
+ *
+ * reiser4_read_dispatch->read_unix_file->page_cache_readahead->
+ * ->reiser4_readpage_dispatch->readpage_unix_file->readpage_tail
+ * or
+ * filemap_fault->reiser4_readpage_dispatch->readpage_unix_file->readpage_tail
+ *
+ * At the beginning: coord->node is read locked, zloaded, page is locked,
+ * coord is set to existing unit inside of tail item.
+ */
 int readpage_tail(void *vp, struct page *page)
 {
 	uf_coord_t *uf_coord = vp;
--- linux-3.7.1.orig/fs/reiser4/plugin/object.c
+++ linux-3.7.1/fs/reiser4/plugin/object.c
@@ -53,7 +53,7 @@
 
 #include "../inode.h"
 
-static int _bugop(void)
+int _bugop(void)
 {
 	BUG_ON(1);
 	return 0;
@@ -61,6 +61,80 @@ static int _bugop(void)
 
 #define bugop ((void *)_bugop)
 
+static int writepage_bugop(struct page *page, struct writeback_control *wbc)
+{
+	BUG_ON(1);
+	return 0;
+}
+
+static int set_page_dirty_bugop(struct page *page)
+{
+	BUG_ON(1);
+	return 0;
+}
+
+static int readpages_bugop(struct file *filp, struct address_space *mapping,
+			   struct list_head *pages, unsigned nr_pages)
+{
+	BUG_ON(1);
+	return 0;
+}
+
+static int write_begin_bugop(struct file *filp, struct address_space *mapping,
+			     loff_t pos, unsigned len, unsigned flags,
+			     struct page **pagep, void **fsdata)
+{
+	BUG_ON(1);
+	return 0;
+}
+
+static int write_end_bugop(struct file *filp, struct address_space *mapping,
+			   loff_t pos, unsigned len, unsigned copied,
+			   struct page *page, void *fsdata)
+{
+	BUG_ON(1);
+	return 0;
+}
+
+static sector_t bmap_bugop(struct address_space *mapping, sector_t sector)
+{
+	BUG_ON(1);
+	return 0;
+}
+
+static void invalidatepage_bugop(struct page *page, unsigned long offset)
+{
+	BUG_ON(1);
+}
+
+static int releasepage_bugop(struct page *page, gfp_t gfp)
+{
+	BUG_ON(1);
+	return 0;
+}
+
+static int migratepage_bugop(struct address_space *mapping,
+			     struct page *page, struct page *newpage,
+			     enum migrate_mode mode)
+{
+	BUG_ON(1);
+	return 0;
+}
+
+static int flow_by_inode_bugop(struct inode *inode, const char __user *buf,
+			       int user, loff_t size,
+			       loff_t off, rw_op op, flow_t *f)
+{
+	BUG_ON(1);
+	return 0;
+}
+
+static int key_by_inode_bugop(struct inode *inode, loff_t off, reiser4_key *key)
+{
+	BUG_ON(1);
+	return 0;
+}
+
 static int _dummyop(void)
 {
 	return 0;
@@ -88,38 +162,53 @@ static struct inode_operations         n
 static struct file_operations          null_f_ops = {.owner = NULL};
 static struct address_space_operations null_a_ops = {.writepage = NULL};
 
-/* VFS methods for regular files */
+/*
+ * Reiser4 provides for VFS either dispatcher, or common (fop,
+ * iop, aop) method.
+ *
+ * Dispatchers (suffixed with "dispatch") pass management to
+ * proper plugin in accordance with plugin table (pset) located
+ * in the private part of inode.
+ *
+ * Common methods are NOT prefixed with "dispatch". They are
+ * the same for all plugins of FILE interface, and, hence, no
+ * dispatching is needed.
+ */
+
+/*
+ * VFS methods for regular files
+ */
 static struct inode_operations regular_file_i_ops = {
 	.permission = reiser4_permission_common,
-	.setattr = reiser4_setattr,
+	.setattr = reiser4_setattr_dispatch,
 	.getattr = reiser4_getattr_common
 };
 static struct file_operations regular_file_f_ops = {
 	.llseek = generic_file_llseek,
-	.read = reiser4_read_careful,
-	.write = reiser4_write_careful,
+	.read = reiser4_read_dispatch,
+	.write = reiser4_write_dispatch,
 	.aio_read = generic_file_aio_read,
-	.unlocked_ioctl = reiser4_ioctl_careful,
+	.unlocked_ioctl = reiser4_ioctl_dispatch,
 #ifdef CONFIG_COMPAT
-	.compat_ioctl = reiser4_ioctl_careful,
+	.compat_ioctl = reiser4_ioctl_dispatch,
 #endif
-	.mmap = reiser4_mmap_careful,
-	.open = reiser4_open_careful,
-	.release = reiser4_release_careful,
+	.mmap = reiser4_mmap_dispatch,
+	.open = reiser4_open_dispatch,
+	.release = reiser4_release_dispatch,
 	.fsync = reiser4_sync_file_common,
 	.splice_read = generic_file_splice_read,
 	.splice_write = generic_file_splice_write
 };
 static struct address_space_operations regular_file_a_ops = {
 	.writepage = reiser4_writepage,
-	.readpage = reiser4_readpage,
+	.readpage = reiser4_readpage_dispatch,
 	//.sync_page = block_sync_page,
-	.writepages = reiser4_writepages,
+	.writepages = reiser4_writepages_dispatch,
 	.set_page_dirty = reiser4_set_page_dirty,
-	.readpages = reiser4_readpages,
-	.write_begin = reiser4_write_begin_careful,
-	.write_end = reiser4_write_end_careful,
-	.bmap = reiser4_bmap_careful,
+	.readpages = reiser4_readpages_dispatch,
+	.write_begin = reiser4_write_begin_dispatch,
+	.write_end = reiser4_write_end_dispatch,
+	.bmap = reiser4_bmap_dispatch,
 	.invalidatepage = reiser4_invalidatepage,
 	.releasepage = reiser4_releasepage,
 	.migratepage = reiser4_migratepage
@@ -164,17 +253,17 @@ static struct file_operations directory_
 	.fsync = reiser4_sync_common
 };
 static struct address_space_operations directory_a_ops = {
-	.writepage = bugop,
+	.writepage = writepage_bugop,
 	//.sync_page = bugop,
 	.writepages = dummyop,
-	.set_page_dirty = bugop,
-	.readpages = bugop,
-	.write_begin = bugop,
-	.write_end = bugop,
-	.bmap = bugop,
-	.invalidatepage = bugop,
-	.releasepage = bugop,
-	.migratepage = bugop
+	.set_page_dirty = set_page_dirty_bugop,
+	.readpages = readpages_bugop,
+	.write_begin = write_begin_bugop,
+	.write_end = write_end_bugop,
+	.bmap = bmap_bugop,
+	.invalidatepage = invalidatepage_bugop,
+	.releasepage = releasepage_bugop,
+	.migratepage = migratepage_bugop
 };
 
 /*
@@ -267,8 +356,8 @@ file_plugin file_plugins[LAST_FILE_PLUGI
 		.as_ops = &null_a_ops,
 
 		.write_sd_by_inode = write_sd_by_inode_common,
-		.flow_by_inode = bugop,
-		.key_by_inode = bugop,
+		.flow_by_inode = flow_by_inode_bugop,
+		.key_by_inode = key_by_inode_bugop,
 		.set_plug_in_inode = set_plug_in_inode_common,
 		.adjust_to_parent = adjust_to_parent_common_dir,
 		.create_object = reiser4_create_object_common,
--- linux-3.7.1.orig/fs/reiser4/plugin/plugin.h
+++ linux-3.7.1/fs/reiser4/plugin/plugin.h
@@ -201,16 +201,7 @@ typedef struct file_plugin {
 	/* generic fields */
 	plugin_header h;
 
-	/* VFS methods.
-	 * Must be invariant with respect to plugin conversion.
-	 * It can be achieved by using "common" methods, which
-	 * are the same for all plugins that take participation in
-	 * conversion, or by using "generic" or "careful" methods,
-	 * which provide automatic redirection to proper private
-	 * plugin methods ("careful" are the same as "generic",
-	 * but with protection of pset and other disk structures
-	 * from being rebuilt during conversion.
-	 */
+	/* VFS methods */
 	struct inode_operations * inode_ops;
 	struct file_operations * file_ops;
 	struct address_space_operations * as_ops;
--- linux-3.7.1.orig/fs/reiser4/super_ops.c
+++ linux-3.7.1/fs/reiser4/super_ops.c
@@ -343,10 +343,12 @@ static int reiser4_statfs(struct dentry
  * @wb:
  * @wbc:
  *
- * This method is called by background and non-backgound writeback. Reiser4's
- * implementation uses generic_writeback_sb_inodes to call reiser4_writepages
- * for each of dirty inodes. reiser4_writepages handles pages dirtied via shared
- * mapping - dirty pages get into atoms. Writeout is called to flush some atoms.
+ * This method is called by background and non-backgound writeback.
+ * Reiser4's implementation uses generic_writeback_sb_inodes to call
+ * reiser4_writepages_dispatch for each of dirty inodes.
+ * reiser4_writepages_dispatch handles pages dirtied via shared
+ * mapping - dirty pages get into atoms. Writeout is called to flush
+ * some atoms.
  */
 static long reiser4_writeback_inodes(struct super_block *super,
 				     struct bdi_writeback *wb,
--- linux-3.7.1.orig/fs/reiser4/txnmgr.c
+++ linux-3.7.1/fs/reiser4/txnmgr.c
@@ -179,7 +179,7 @@ year old --- define all technical terms
  *
  *     When file is accessed through mmap(2) page is always created during
  *     page fault.
- *     After this (in reiser4_readpage()->reiser4_readpage_extent()):
+ *     After this (in reiser4_readpage_dispatch()->reiser4_readpage_extent()):
  *
  *         1. if access is made to non-hole page new jnode is created, (if
  *         necessary)
--- linux-3.7.1.orig/fs/reiser4/vfs_ops.c
+++ linux-3.7.1/fs/reiser4/vfs_ops.c
@@ -148,12 +148,12 @@ void reiser4_writeout(struct super_block
 	struct address_space *mapping;
 
 	/*
-	 * Performs early flushing, trying to free some memory. If there is
-	 * nothing to flush, commits some atoms.
+	 * Performs early flushing, trying to free some memory. If there
+	 * is nothing to flush, commits some atoms.
+	 *
+	 * Commit all atoms if reiser4_writepages_dispatch() is called
+	 * from sys_sync() or sys_fsync()
 	 */
-
-	/* Commit all atoms if reiser4_writepages() is called from sys_sync() or
-	   sys_fsync(). */
 	if (wbc->sync_mode != WB_SYNC_NONE) {
 		txnmgr_force_commit_all(sb, 0);
 		return;
--- linux-3.7.1.orig/fs/reiser4/vfs_ops.h
+++ linux-3.7.1/fs/reiser4/vfs_ops.h
@@ -24,8 +24,13 @@ int reiser4_writepage(struct page *, str
 int reiser4_set_page_dirty(struct page *);
 void reiser4_invalidatepage(struct page *, unsigned long offset);
 int reiser4_releasepage(struct page *, gfp_t);
+
+#ifdef CONFIG_MIGRATION
 int reiser4_migratepage(struct address_space *, struct page *,
 			struct page *, enum migrate_mode);
+#else
+#define reiser4_migratepage NULL
+#endif /* CONFIG_MIGRATION */
 
 extern int reiser4_update_sd(struct inode *);
 extern int reiser4_add_nlink(struct inode *, struct inode *, int);
