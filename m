From: Edward Shishkin <edward@namesys.com>
Subject: [patch 1/2] reiser4: make methods supplied to vfs invariant
Date: Wed, 28 Nov 2007 04:05:34 +0300
Message-ID: <474CBEDE.2090305@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050807060202020104060306"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Reiserfs-list <reiserfs-devel@vger.kernel.org>
Cc: rvalles@es.gnu.org

This is a multi-part message in MIME format.
--------------050807060202020104060306
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Andrew,
please, apply.

Thanks,
Edward.

--------------050807060202020104060306
Content-Type: text/x-patch;
 name="reiser4-make-methods-supplied-for-vfs-invariant.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="reiser4-make-methods-supplied-for-vfs-invariant.patch"

Problem:
hangs when writing to reiser4 partition exported via nfs
(found by Roc Vall���s Dom���nech <rvalles@es.gnu.org>).

Bug:
vfs (which is not aware of reiser4 plugin conversion) uses
obsolete copy of @file->f_op, whereas old methods are not
aware about new structures. It leads to memory corruption.

Fixup:
Prevent collisions with vfs:
Make inode_ops, file_ops and a_ops supplied to vfs
invariant with respect to plugin conversion.

Signed-off-by: Edward Shishkin <edward@namesys.com>
---
 linux-2.6.23-mm1/fs/reiser4/as_ops.c                      |   40 +
 linux-2.6.23-mm1/fs/reiser4/inode.c                       |   20 
 linux-2.6.23-mm1/fs/reiser4/plugin/file/cryptcompress.c   |  107 ++---
 linux-2.6.23-mm1/fs/reiser4/plugin/file/file.c            |   44 --
 linux-2.6.23-mm1/fs/reiser4/plugin/file/file.h            |  166 +++++--
 linux-2.6.23-mm1/fs/reiser4/plugin/file/file_conversion.c |  204 ++++++---
 linux-2.6.23-mm1/fs/reiser4/plugin/file_ops.c             |   37 +
 linux-2.6.23-mm1/fs/reiser4/plugin/object.c               |  299 +++++++-------
 linux-2.6.23-mm1/fs/reiser4/plugin/plugin.h               |   73 ++-
 9 files changed, 590 insertions(+), 400 deletions(-)

--- linux-2.6.23-mm1/fs/reiser4/plugin/file/file.c.orig
+++ linux-2.6.23-mm1/fs/reiser4/plugin/file/file.c
@@ -1372,42 +1372,6 @@
 	return result;
 }
 
-/*
- * ->sync() method for unix file.
- *
- * We are trying to be smart here. Instead of committing all atoms (original
- * solution), we scan dirty pages of this file and commit all atoms they are
- * part of.
- *
- * Situation is complicated by anonymous pages: i.e., extent-less pages
- * dirtied through mmap. Fortunately sys_fsync() first calls
- * filemap_fdatawrite() that will ultimately call reiser4_writepages(), insert
- * all missing extents and capture anonymous pages.
- */
-int sync_unix_file(struct file *file, struct dentry *dentry, int datasync)
-{
-	reiser4_context *ctx;
-	txn_atom *atom;
-	reiser4_block_nr reserve;
-
-	ctx = reiser4_init_context(dentry->d_inode->i_sb);
-	if (IS_ERR(ctx))
-		return PTR_ERR(ctx);
-
-	reserve = estimate_update_common(dentry->d_inode);
-	if (reiser4_grab_space(reserve, BA_CAN_COMMIT)) {
-		reiser4_exit_context(ctx);
-		return RETERR(-ENOSPC);
-	}
-	write_sd_by_inode_common(dentry->d_inode);
-
-	atom = get_current_atom_locked();
-	spin_lock_txnh(ctx->trans);
-	force_commit_atom(ctx->trans);
-	reiser4_exit_context(ctx);
-	return 0;
-}
-
 /**
  * readpage_unix_file_nolock - readpage of struct address_space_operations
  * @file:
@@ -2126,7 +2090,7 @@
  * unix file plugin.
  */
 ssize_t write_unix_file(struct file *file, const char __user *buf,
-			size_t count, loff_t *pos)
+			size_t count, loff_t *pos, int *conv)
 {
 	int result;
 	reiser4_context *ctx;
@@ -2317,8 +2281,8 @@
 	if (result == 0 && ((file->f_flags & O_SYNC) || IS_SYNC(inode))) {
 		reiser4_txn_restart_current();
 		grab_space_enable();
-		result = sync_unix_file(file, file->f_dentry,
-					0 /* data and stat data */ );
+		result = reiser4_sync_file_common(file, file->f_dentry,
+						  0 /* data and stat data */);
 		if (result)
 			warning("reiser4-7", "failed to sync file %llu",
 				(unsigned long long)get_inode_oid(inode));
@@ -2703,7 +2667,7 @@
 }
 
 /**
- * delete_object_unix_file - delete_object of file_plugin
+ * delete_unix_file - delete_object of file_plugin
  * @inode: inode to be deleted
  *
  * Truncates file to length 0, removes stat data and safe link.
--- linux-2.6.23-mm1/fs/reiser4/plugin/file/file.h.orig
+++ linux-2.6.23-mm1/fs/reiser4/plugin/file/file.h
@@ -8,24 +8,70 @@
 #if !defined( __REISER4_FILE_H__ )
 #define __REISER4_FILE_H__
 
-/* declarations of functions implementing UNIX_FILE_PLUGIN_ID file plugin */
+/**
+ * Declarations of common/careful/generic methods.
+ * Suppose ->foo() is a vs method (of f_ops, i_ops, or a_ops);
+ * Then common reiser4 method for foo looks like reiser4_foo_common;
+ * careful method looks like reiser4_foo_careful;
+ * generic method looks like reiser4_foo.
+ *
+ * Common method is a simple instruction set eligible for more
+ * then one plugin id.
+ *
+ * Generic method looks at the plugin installed in inode's
+ * plugin set and calls its appropriate method.
+ *
+ * Careful method looks like generic method with protected pset
+ * (see plugin/file/file_conversion.c for details).
+ */
 
 /* inode operations */
-int setattr_unix_file(struct dentry *, struct iattr *);
+int reiser4_setattr_careful(struct dentry *, struct iattr *);
 
 /* file operations */
+ssize_t reiser4_read_careful(struct file *, char __user *buf,
+			     size_t count, loff_t *off);
+ssize_t reiser4_write_careful(struct file *, const char __user *buf,
+			      size_t count, loff_t * off);
+int reiser4_ioctl_careful(struct inode *inode, struct file *filp,
+			  unsigned int cmd, unsigned long arg);
+int reiser4_mmap_careful(struct file *, struct vm_area_struct *);
+int reiser4_open_careful(struct inode *inode, struct file *file);
+int reiser4_release_careful(struct inode *, struct file *);
+int reiser4_sync_file_common(struct file *, struct dentry *, int datasync);
+
+/* address space operations */
+int reiser4_readpage(struct file *, struct page *);
+int reiser4_readpages(struct file*, struct address_space*, struct list_head*,
+		      unsigned);
+int reiser4_writepages(struct address_space *, struct writeback_control *);
+int reiser4_prepare_write(struct file *, struct page *, unsigned from,
+			  unsigned to);
+int reiser4_commit_write(struct file *, struct page *, unsigned from,
+			 unsigned to);
+sector_t reiser4_bmap_careful(struct address_space *, sector_t lblock);
+
+/*
+ * Private methods of unix-file plugin
+ * (UNIX_FILE_PLUGIN_ID)
+ */
+
+/* private inode operations */
+int setattr_unix_file(struct dentry *, struct iattr *);
+
+/* private file operations */
+
 ssize_t read_unix_file(struct file *, char __user *buf, size_t read_amount,
 		       loff_t *off);
 ssize_t write_unix_file(struct file *, const char __user *buf, size_t write_amount,
-			loff_t * off);
+			loff_t * off, int * conv);
 int ioctl_unix_file(struct inode *, struct file *, unsigned int cmd,
 		    unsigned long arg);
 int mmap_unix_file(struct file *, struct vm_area_struct *);
 int open_unix_file(struct inode *, struct file *);
 int release_unix_file(struct inode *, struct file *);
-int sync_unix_file(struct file *, struct dentry *, int datasync);
 
-/* address space operations */
+/* private address space operations */
 int readpage_unix_file(struct file *, struct page *);
 int readpages_unix_file(struct file*, struct address_space*, struct list_head*, unsigned);
 int writepages_unix_file(struct address_space *, struct writeback_control *);
@@ -35,13 +81,68 @@
 			   unsigned to);
 sector_t bmap_unix_file(struct address_space *, sector_t lblock);
 
-/* file plugin operations */
+/* other private methods */
+int delete_object_unix_file(struct inode *);
 int flow_by_inode_unix_file(struct inode *, const char __user *buf,
 			    int user, loff_t, loff_t, rw_op, flow_t *);
 int owns_item_unix_file(const struct inode *, const coord_t *);
 void init_inode_data_unix_file(struct inode *, reiser4_object_create_data *,
 			       int create);
-int delete_object_unix_file(struct inode *);
+
+/*
+ * Private methods of cryptcompress file plugin
+ * (CRYPTCOMPRESS_FILE_PLUGIN_ID)
+ */
+
+/* private inode operations */
+int setattr_cryptcompress(struct dentry *, struct iattr *);
+
+/* private file operations */
+ssize_t read_cryptcompress(struct file *, char __user *buf,
+			   size_t count, loff_t *off);
+ssize_t write_cryptcompress(struct file *, const char __user *buf,
+			    size_t count, loff_t * off, int *conv);
+int ioctl_cryptcompress(struct inode *, struct file *, unsigned int cmd,
+			unsigned long arg);
+int mmap_cryptcompress(struct file *, struct vm_area_struct *);
+int open_cryptcompress(struct inode *, struct file *);
+int release_cryptcompress(struct inode *, struct file *);
+
+/* private address space operations */
+int readpage_cryptcompress(struct file *, struct page *);
+int readpages_cryptcompress(struct file*, struct address_space*,
+			    struct list_head*, unsigned);
+int writepages_cryptcompress(struct address_space *,
+			     struct writeback_control *);
+int prepare_write_cryptcompress(struct file *, struct page *, unsigned from,
+				unsigned to);
+int commit_write_cryptcompress(struct file *, struct page *, unsigned from,
+			       unsigned to);
+sector_t bmap_cryptcompress(struct address_space *, sector_t lblock);
+
+/* other private methods */
+int flow_by_inode_cryptcompress(struct inode *, const char __user *buf,
+				int user, loff_t, loff_t, rw_op, flow_t *);
+int key_by_inode_cryptcompress(struct inode *, loff_t off, reiser4_key *);
+int create_object_cryptcompress(struct inode *, struct inode *,
+				reiser4_object_create_data *);
+int delete_object_cryptcompress(struct inode *);
+void init_inode_data_cryptcompress(struct inode *, reiser4_object_create_data *,
+				   int create);
+int cut_tree_worker_cryptcompress(tap_t *, const reiser4_key * from_key,
+				  const reiser4_key * to_key,
+				  reiser4_key * smallest_removed,
+				  struct inode *object, int truncate,
+				  int *progress);
+void destroy_inode_cryptcompress(struct inode *);
+
+/*
+ * Private methods of symlink file plugin
+ * (SYMLINK_FILE_PLUGIN_ID)
+ */
+int reiser4_create_symlink(struct inode *symlink, struct inode *dir,
+			   reiser4_object_create_data *);
+void destroy_inode_symlink(struct inode *);
 
 /*
  * all the write into unix file is performed by item write method. Write method
@@ -183,57 +284,6 @@
 
 #endif
 
-/* declarations of functions implementing SYMLINK_FILE_PLUGIN_ID file plugin */
-int reiser4_create_symlink(struct inode *symlink, struct inode *dir,
-			   reiser4_object_create_data *);
-void destroy_inode_symlink(struct inode *);
-
-/* declarations of functions implementing CRYPTCOMPRESS_FILE_PLUGIN_ID
-   file plugin */
-
-/* inode operations */
-int setattr_cryptcompress(struct dentry *, struct iattr *);
-int prot_setattr_cryptcompress(struct dentry *, struct iattr *);
-
-/* file operations */
-ssize_t read_cryptcompress(struct file *, char __user *buf, size_t read_amount,
-			   loff_t * off);
-ssize_t prot_read_cryptcompress(struct file *, char __user *buf,
-				size_t read_amount, loff_t * off);
-
-ssize_t write_cryptcompress(struct file *, const char __user *buf, size_t write_amount,
-			    loff_t * off, int * conv);
-ssize_t prot_write_cryptcompress(struct file *, const char __user *buf, size_t write_amount,
-				 loff_t * off);
-int mmap_cryptcompress(struct file *, struct vm_area_struct *);
-int prot_mmap_cryptcompress(struct file *, struct vm_area_struct *);
-
-int release_cryptcompress(struct inode *, struct file *);
-int prot_release_cryptcompress(struct inode *, struct file *);
-
-/* address space operations */
-extern int readpage_cryptcompress(struct file *, struct page *);
-extern int writepages_cryptcompress(struct address_space *,
-				     struct writeback_control *);
-/* file plugin operations */
-int flow_by_inode_cryptcompress(struct inode *, const char __user *buf,
-				int user, loff_t, loff_t, rw_op, flow_t *);
-int key_by_inode_cryptcompress(struct inode *, loff_t off, reiser4_key *);
-int create_cryptcompress(struct inode *, struct inode *,
-			 reiser4_object_create_data *);
-int delete_object_cryptcompress(struct inode *);
-void init_inode_data_cryptcompress(struct inode *, reiser4_object_create_data *,
-				   int create);
-int cut_tree_worker_cryptcompress(tap_t *, const reiser4_key * from_key,
-				  const reiser4_key * to_key,
-				  reiser4_key * smallest_removed,
-				  struct inode *object, int truncate,
-				  int *progress);
-void destroy_inode_cryptcompress(struct inode *);
-int open_object_cryptcompress(struct inode * inode, struct file * file);
-
-extern reiser4_plugin_ops cryptcompress_plugin_ops;
-
 #define WRITE_GRANULARITY 32
 
 int tail2extent(struct unix_file_info *);
--- linux-2.6.23-mm1/fs/reiser4/plugin/file/file_conversion.c.orig
+++ linux-2.6.23-mm1/fs/reiser4/plugin/file/file_conversion.c
@@ -1,22 +1,30 @@
 /* Copyright 2001, 2002, 2003 by Hans Reiser,
    licensing governed by reiser4/README */
 
-/* This file contains hooks that converts (*) cryptcompress files to unix-files,
-   and a set of protected (**) methods of a cryptcompress file plugin to perform
-   such conversion.
-
-(*)
-   The conversion is performed for incompressible files to reduce cpu and memory
-   usage. If first logical cluster (64K by default) of a file is incompressible,
-   then we make a desicion, that the whole file is incompressible.
-   The conversion can be enabled via installing a special compression mode
-   plugin (CONVX_COMPRESSION_MODE_ID, see plugin/compress/compress_mode.c for
-   details).
-
-(**)
-   The protection means serialization of critical sections (readers and writers
-   of @pset->file)
-*/
+/* *
+ * This file contains a converter cryptcompress->unix_file, and O(1)-heuristic,
+ * which allows to assign for a regular file the most reasonable plugin to be
+ * managed by. Note, that we don't use back conversion because of compatibility
+ * reasons (see http://dev.namesys.com/Version4.X.Y for details).
+ *
+ * Currently used heuristic is very simple: if first complete logical cluster
+ * (64K by default) of a file is incompressible, then we make a decision, that
+ * the whole file is incompressible (*). When creating a file the conversion
+ * is enabled by default via installing a special "permitting" compression mode
+ * plugin (**) (CONVX_COMPRESSION_MODE_ID, see plugin/compress/compress_mode.c
+ * for details).
+ *
+ * The conversion is accompanied by rebuilding disk structures of a file, so it
+ * is important to protect them from being interacted with other plugins which
+ * don't expect them to be in such inconsistent state. For this to be protected
+ * we serialize readers and writers of pset. Writers are the processes which can
+ * change it with conversion purposes; other ones are readers. Serialization is
+ * performed via acquiring per-inode rw-semaphore (conv_sem).
+ *
+ * (*)  This heuristic can be easily changed as soon as we have a new,
+ *      better one.
+ * (**) Such solution allows to keep enable/disable state on disk.
+ */
 
 #include "../../inode.h"
 #include "../cluster.h"
@@ -26,26 +34,24 @@
 	 (inode_compression_mode_plugin(inode) ==		       \
 	  compression_mode_plugin_by_id(CONVX_COMPRESSION_MODE_ID))
 
-
-/* Located sections (readers and writers of @pset->file) are not
-   permanently critical: cryptcompress file can be converted only
-   if the conversion is enabled (see the macrio above). And we don't
-   convert unix files at all.
-   The following helper macro is a sanity check to decide if we
-   need to protect a located section.
-*/
+/**
+ * Located sections (readers and writers of @pset) are not permanently
+ * critical: cryptcompress file can be converted only if the conversion
+ * is enabled (see the macrio above). Also we don't perform back
+ * conversion. The following helper macro is a sanity check to decide
+ * if we need the protection (locks are always additional overheads).
+ */
 #define should_protect(inode)						\
 	(inode_file_plugin(inode) ==					\
 	 file_plugin_by_id(CRYPTCOMPRESS_FILE_PLUGIN_ID) &&		\
 	 conversion_enabled(inode))
-
-/* All protected methods have prefix "prot" in their names.
-   It is convenient to construct them by usual (unprotected) ones
-   using the following common macros:
-*/
-
+/**
+ * We'll speak about "passive" protection for readers and "active"
+ * protection for writers. All methods with active or passive protection
+ * has suffix "careful".
+ */
 /* Macro for passive protection.
-   method_cryptcompress contains only readers */
+   method_foo contains only readers */
 #define PROT_PASSIVE(type, method, args)				\
 ({							                \
 	type _result;							\
@@ -86,9 +92,11 @@
 		up_read(guard);						\
 })
 
-/* Macro for active protection.
-   active_expr contains readers and writers; after its
-   evaluation conversion should be disabled */
+/**
+ * Macro for active protection.
+ * active_expr contains writers of pset;
+ * NOTE: after evaluating active_expr conversion should be disabled.
+ */
 #define PROT_ACTIVE(type, method, args, active_expr)			\
 ({	                 						\
 	type _result = 0;						\
@@ -154,13 +162,12 @@
 	uf->ea_owner = NULL;
 	atomic_set(&uf->nr_neas, 0);
 #endif
-	inode->i_op =
-		&file_plugin_by_id(UNIX_FILE_PLUGIN_ID)->inode_ops;
-	inode->i_fop =
-		&file_plugin_by_id(UNIX_FILE_PLUGIN_ID)->file_ops;
-	inode->i_mapping->a_ops =
-		&file_plugin_by_id(UNIX_FILE_PLUGIN_ID)->as_ops;
-	file->f_op = inode->i_fop;
+	/**
+	 * we was carefull for file_ops, inode_ops and as_ops
+	 * to be invariant for plugin conversion, so there is
+	 * no need to update ones already installed in the
+	 * vfs's residence.
+	 */
 	return 0;
 }
 
@@ -278,9 +285,12 @@
 #define data_is_compressible(osize, isize)		\
 	(osize < fifty_persent(isize))
 
-/* This is called only once per file life.
-   Read first logical cluster (of index #0) and estimate its compressibility.
-   Save estimation result in @compressible */
+/**
+ * A simple O(1)-heuristic for compressibility.
+ * This is called not more then one time per file's life.
+ * Read first logical cluster (of index #0) and estimate its compressibility.
+ * Save estimation result in @compressible.
+ */
 static int read_check_compressibility(struct inode * inode,
 				      struct cluster_handle * clust,
 				      int * compressible)
@@ -443,7 +453,7 @@
 	assert("edward-1516", clust->pages[0]->index == 0);
 	assert("edward-1517", clust->hint != NULL);
 
-	/* release all cryptcompress-specific recources */
+	/* release all cryptcompress-specific resources */
 	cr_info = cryptcompress_inode_data(inode);
 	result = reserve_cryptcompress2unixfile(inode);
 	if (result)
@@ -523,40 +533,69 @@
 	return (attr->ia_valid & ATTR_SIZE ? disable_conversion(inode) : 0);
 }
 
-/* Protected methods of cryptcompress file plugin constructed
-   by the macros above */
+/**
+ * Here are wrappers with "protection", aka Reiser4 "careful" methods.
+ * They are used by vfs (as methods of file_ops, inode_ops or as_ops),
+ * which is not aware of plugin conversion performed by Reiser4.
+ */
 
-/* Wrappers with active protection for:
-   . write_cryptcompress;
-   . setattr_cryptcompress;
-*/
+/*
+ * Wrappers with active protection for:
+ *
+ * ->write();
+ * ->setattr();
+ */
 
-ssize_t prot_write_cryptcompress(struct file *file, const char __user *buf,
-				 size_t count, loff_t *off)
+/*
+ * Reiser4 write "careful" method.  Write a file in 2 steps:
+ *  . start write with initial file plugin,
+ *    switch to a new (more resonable) file plugin (if any);
+ *  . finish write with the new plugin.
+ */
+ssize_t reiser4_write_careful(struct file *file, const char __user *buf,
+			      size_t count, loff_t *off)
 {
 	int prot = 0;
 	int conv = 0;
-	ssize_t written_cr = 0;
-	ssize_t written_uf = 0;
+	ssize_t written_old = 0; /* bytes written with old plugin */
+	ssize_t written_new = 0; /* bytes written with new plugin */
 	struct inode * inode = file->f_dentry->d_inode;
 	struct rw_semaphore * guard = &reiser4_inode_data(inode)->conv_sem;
 
+	/**
+	 * First step.
+	 * Sanity check: if conversion is possible,
+	 * then protect pset.
+	 */
 	if (should_protect(inode)) {
 		prot = 1;
 		down_write(guard);
 	}
-	written_cr = write_cryptcompress(file, buf, count, off, &conv);
+	written_old = inode_file_plugin(inode)->write(file,
+						      buf,
+						      count,
+						      off, &conv);
 	if (prot)
 		up_write(guard);
-	if (written_cr < 0)
-		return written_cr;
-	if (conv)
-		written_uf = write_unix_file(file, buf + written_cr,
-					     count - written_cr, off);
-	return written_cr + (written_uf < 0 ? 0 : written_uf);
+	if (written_old < 0 || conv == 0)
+		return written_old;
+	/**
+	 * Conversion occurred.
+	 * Back conversion is impossible,
+	 * so don't protect at this step.
+	 */
+	assert("edward-1532",
+	       inode_file_plugin(inode) ==
+	       file_plugin_by_id(UNIX_FILE_PLUGIN_ID));
+
+	written_new = inode_file_plugin(inode)->write(file,
+						      buf + written_old,
+						      count - written_old,
+						      off, NULL);
+	return written_old + (written_new < 0 ? 0 : written_new);
 }
 
-int prot_setattr_cryptcompress(struct dentry *dentry, struct iattr *attr)
+int reiser4_setattr_careful(struct dentry *dentry, struct iattr *attr)
 {
 	struct inode * inode = dentry->d_inode;
 	return PROT_ACTIVE(int, setattr, (dentry, attr),
@@ -564,29 +603,50 @@
 }
 
 /* Wrappers with passive protection for:
-   . read_cryptcomperess;
-   . mmap_cryptcompress;
-   . release_cryptcompress;
-   . delete_object_cryptcompress.
-*/
-ssize_t prot_read_cryptcompress(struct file * file, char __user * buf,
-				size_t size, loff_t * off)
+ *
+ * ->open();
+ * ->read();
+ * ->ioctl();
+ * ->mmap();
+ * ->release();
+ * ->bmap().
+ */
+
+int reiser4_open_careful(struct inode *inode, struct file *file)
+{
+	return PROT_PASSIVE(int, open, (inode, file));
+}
+
+ssize_t reiser4_read_careful(struct file * file, char __user * buf,
+			     size_t size, loff_t * off)
 {
 	struct inode * inode = file->f_dentry->d_inode;
 	return PROT_PASSIVE(ssize_t, read, (file, buf, size, off));
 }
 
-int prot_mmap_cryptcompress(struct file *file, struct vm_area_struct *vma)
+int reiser4_ioctl_careful(struct inode *inode, struct file *filp,
+			  unsigned int cmd, unsigned long arg)
+{
+	return PROT_PASSIVE(int, ioctl, (inode, filp, cmd, arg));
+}
+
+int reiser4_mmap_careful(struct file *file, struct vm_area_struct *vma)
 {
 	struct inode *inode = file->f_dentry->d_inode;
 	return PROT_PASSIVE(int, mmap, (file, vma));
 }
 
-int prot_release_cryptcompress(struct inode *inode, struct file *file)
+int reiser4_release_careful(struct inode *inode, struct file *file)
 {
 	return PROT_PASSIVE(int, release, (inode, file));
 }
 
+sector_t reiser4_bmap_careful(struct address_space * mapping, sector_t lblock)
+{
+	struct inode *inode = mapping->host;
+	return PROT_PASSIVE(sector_t, bmap, (mapping, lblock));
+}
+
 /*
   Local variables:
   c-indentation-style: "K&R"
--- linux-2.6.23-mm1/fs/reiser4/plugin/object.c.orig
+++ linux-2.6.23-mm1/fs/reiser4/plugin/object.c
@@ -84,6 +84,92 @@
 	.change = change_file
 };
 
+static struct inode_operations         null_i_ops = {.create = NULL};
+static struct file_operations          null_f_ops = {.owner = NULL};
+static struct address_space_operations null_a_ops = {.writepage = NULL};
+
+/* VFS methods for regular files */
+static struct inode_operations regular_file_i_ops = {
+	.permission = reiser4_permission_common,
+	.setattr = reiser4_setattr_careful,
+	.getattr = reiser4_getattr_common
+};
+static struct file_operations regular_file_f_ops = {
+	.llseek = generic_file_llseek,
+	.read = reiser4_read_careful,
+	.write = reiser4_write_careful,
+	.aio_read = generic_file_aio_read,
+	.ioctl = reiser4_ioctl_careful,
+	.mmap = reiser4_mmap_careful,
+	.open = reiser4_open_careful,
+	.release = reiser4_release_careful,
+	.fsync = reiser4_sync_file_common
+};
+static struct address_space_operations regular_file_a_ops = {
+	.writepage = reiser4_writepage,
+	.readpage = reiser4_readpage,
+	.sync_page = block_sync_page,
+	.writepages = reiser4_writepages,
+	.set_page_dirty = reiser4_set_page_dirty,
+	.readpages = reiser4_readpages,
+	.prepare_write = reiser4_prepare_write,
+	.commit_write =	reiser4_commit_write,
+	.bmap = reiser4_bmap_careful,
+	.invalidatepage = reiser4_invalidatepage,
+	.releasepage = reiser4_releasepage
+};
+
+/* VFS methods for symlink files */
+static struct inode_operations symlink_file_i_ops = {
+	.readlink = generic_readlink,
+	.follow_link = reiser4_follow_link_common,
+	.permission = reiser4_permission_common,
+	.setattr = reiser4_setattr_common,
+	.getattr = reiser4_getattr_common
+};
+
+/* VFS methods for special files */
+static struct inode_operations special_file_i_ops = {
+	.permission = reiser4_permission_common,
+	.setattr = reiser4_setattr_common,
+	.getattr = reiser4_getattr_common
+};
+
+/* VFS methods for directories */
+static struct inode_operations directory_i_ops = {
+	.create = reiser4_create_common,
+	.lookup = reiser4_lookup_common,
+	.link = reiser4_link_common,
+	.unlink = reiser4_unlink_common,
+	.symlink = reiser4_symlink_common,
+	.mkdir = reiser4_mkdir_common,
+	.rmdir = reiser4_unlink_common,
+	.mknod = reiser4_mknod_common,
+	.rename = reiser4_rename_common,
+	.permission = reiser4_permission_common,
+	.setattr = reiser4_setattr_common,
+	.getattr = reiser4_getattr_common
+};
+static struct file_operations directory_f_ops = {
+	.llseek = reiser4_llseek_dir_common,
+	.read = generic_read_dir,
+	.readdir = reiser4_readdir_common,
+	.release = reiser4_release_dir_common,
+	.fsync = reiser4_sync_common
+};
+static struct address_space_operations directory_a_ops = {
+	.writepage = bugop,
+	.sync_page = bugop,
+	.writepages = dummyop,
+	.set_page_dirty = bugop,
+	.readpages = bugop,
+	.prepare_write = bugop,
+	.commit_write = bugop,
+	.bmap = bugop,
+	.invalidatepage = bugop,
+	.releasepage = bugop
+};
+
 /*
  * Definitions of object plugins.
  */
@@ -99,35 +185,37 @@
 			.desc = "regular file",
 			.linkage = {NULL, NULL},
 		},
-		.inode_ops = {
-			.permission = reiser4_permission_common,
-			.setattr = setattr_unix_file,
-			.getattr = reiser4_getattr_common
-		},
-		.file_ops = {
-			.llseek = generic_file_llseek,
-			.read = read_unix_file,
-			.write = write_unix_file,
-			.aio_read = generic_file_aio_read,
-			.ioctl = ioctl_unix_file,
-			.mmap = mmap_unix_file,
-			.open = open_unix_file,
-			.release = release_unix_file,
-			.fsync = sync_unix_file,
-		},
-		.as_ops = {
-			.writepage = reiser4_writepage,
-			.readpage = readpage_unix_file,
-			.sync_page = block_sync_page,
-			.writepages = writepages_unix_file,
-			.set_page_dirty = reiser4_set_page_dirty,
-			.readpages = readpages_unix_file,
-			.prepare_write = prepare_write_unix_file,
-			.commit_write =	commit_write_unix_file,
-			.bmap = bmap_unix_file,
-			.invalidatepage = reiser4_invalidatepage,
-			.releasepage = reiser4_releasepage
-		},
+		/*
+		 * invariant vfs ops
+		 */
+		.inode_ops = &regular_file_i_ops,
+		.file_ops = &regular_file_f_ops,
+		.as_ops = &regular_file_a_ops,
+		/*
+		 * private i_ops
+		 */
+		.setattr = setattr_unix_file,
+		.open = open_unix_file,
+		.read = read_unix_file,
+		.write = write_unix_file,
+		.ioctl = ioctl_unix_file,
+		.mmap = mmap_unix_file,
+		.release = release_unix_file,
+		/*
+		 * private f_ops
+		 */
+		.readpage = readpage_unix_file,
+		.readpages = readpages_unix_file,
+		.writepages = writepages_unix_file,
+		.prepare_write = prepare_write_unix_file,
+		.commit_write = commit_write_unix_file,
+		/*
+		 * private a_ops
+		 */
+		.bmap = bmap_unix_file,
+		/*
+		 * other private methods
+		 */
 		.write_sd_by_inode = write_sd_by_inode_common,
 		.flow_by_inode = flow_by_inode_unix_file,
 		.key_by_inode = key_by_inode_and_offset_common,
@@ -167,9 +255,9 @@
 			.desc = "directory",
 			.linkage = {NULL, NULL}
 		},
-		.inode_ops = {.create = NULL},
-		.file_ops = {.owner = NULL},
-		.as_ops = {.writepage = NULL},
+		.inode_ops = &null_i_ops,
+		.file_ops = &null_f_ops,
+		.as_ops = &null_a_ops,
 
 		.write_sd_by_inode = write_sd_by_inode_common,
 		.flow_by_inode = bugop,
@@ -211,16 +299,11 @@
 			.desc = "symbolic link",
 			.linkage = {NULL,NULL}
 		},
-		.inode_ops = {
-			.readlink = generic_readlink,
-			.follow_link = reiser4_follow_link_common,
-			.permission = reiser4_permission_common,
-			.setattr = reiser4_setattr_common,
-			.getattr = reiser4_getattr_common
-		},
-		/* inode->i_fop of symlink is initialized by NULL in setup_inode_ops */
-		.file_ops = {.owner = NULL},
-		.as_ops = {.writepage = NULL},
+		.inode_ops = &symlink_file_i_ops,
+		/* inode->i_fop of symlink is initialized
+		   by NULL in setup_inode_ops */
+		.file_ops = &null_f_ops,
+		.as_ops = &null_a_ops,
 
 		.write_sd_by_inode = write_sd_by_inode_common,
 		.set_plug_in_inode = set_plug_in_inode_common,
@@ -260,15 +343,11 @@
 			"special: fifo, device or socket",
 			.linkage = {NULL, NULL}
 		},
-		.inode_ops = {
-			.permission = reiser4_permission_common,
-			.setattr = reiser4_setattr_common,
-			.getattr = reiser4_getattr_common
-		},
+		.inode_ops = &special_file_i_ops,
 		/* file_ops of special files (sockets, block, char, fifo) are
 		   initialized by init_special_inode. */
-		.file_ops = {.owner = NULL},
-		.as_ops = {.writepage = NULL},
+		.file_ops = &null_f_ops,
+		.as_ops = &null_a_ops,
 
 		.write_sd_by_inode = write_sd_by_inode_common,
 		.set_plug_in_inode = set_plug_in_inode_common,
@@ -307,38 +386,32 @@
 			.desc = "cryptcompress file",
 			.linkage = {NULL, NULL}
 		},
-		.inode_ops = {
-			.permission = reiser4_permission_common,
-			.setattr = prot_setattr_cryptcompress,
-			.getattr = reiser4_getattr_common
-		},
-		.file_ops = {
-			.llseek = generic_file_llseek,
-			.read = prot_read_cryptcompress,
-			.write = prot_write_cryptcompress,
-			.aio_read = generic_file_aio_read,
-			.mmap = prot_mmap_cryptcompress,
-			.release = prot_release_cryptcompress,
-			.fsync = reiser4_sync_common,
-		},
-		.as_ops = {
-			.writepage = reiser4_writepage,
-			.readpage = readpage_cryptcompress,
-			.sync_page = block_sync_page,
-			.writepages = writepages_cryptcompress,
-			.set_page_dirty = reiser4_set_page_dirty,
-			.readpages = readpages_cryptcompress,
-			.prepare_write = prepare_write_common,
-			.invalidatepage = reiser4_invalidatepage,
-			.releasepage = reiser4_releasepage
-		},
+		.inode_ops = &regular_file_i_ops,
+		.file_ops = &regular_file_f_ops,
+		.as_ops = &regular_file_a_ops,
+
+		.setattr = setattr_cryptcompress,
+		.open = open_cryptcompress,
+		.read = read_cryptcompress,
+		.write = write_cryptcompress,
+		.ioctl = ioctl_cryptcompress,
+		.mmap = mmap_cryptcompress,
+		.release = release_cryptcompress,
+
+		.readpage = readpage_cryptcompress,
+		.readpages = readpages_cryptcompress,
+		.writepages = writepages_cryptcompress,
+		.prepare_write = prepare_write_cryptcompress,
+		.commit_write = commit_write_cryptcompress,
+
+		.bmap = bmap_cryptcompress,
+
 		.write_sd_by_inode = write_sd_by_inode_common,
 		.flow_by_inode = flow_by_inode_cryptcompress,
 		.key_by_inode = key_by_inode_cryptcompress,
 		.set_plug_in_inode = set_plug_in_inode_common,
 		.adjust_to_parent = adjust_to_parent_cryptcompress,
-		.create_object = create_cryptcompress,
-		.open_object = open_object_cryptcompress,
+		.create_object = create_object_cryptcompress,
 		.delete_object = delete_object_cryptcompress,
 		.add_link = reiser4_add_link_common,
 		.rem_link = reiser4_rem_link_common,
@@ -392,39 +465,10 @@
 			.desc = "hashed directory",
 			.linkage = {NULL, NULL}
 		},
-		.inode_ops = {
-			.create = reiser4_create_common,
-			.lookup = reiser4_lookup_common,
-			.link = reiser4_link_common,
-			.unlink = reiser4_unlink_common,
-			.symlink = reiser4_symlink_common,
-			.mkdir = reiser4_mkdir_common,
-			.rmdir = reiser4_unlink_common,
-			.mknod = reiser4_mknod_common,
-			.rename = reiser4_rename_common,
-			.permission = reiser4_permission_common,
-			.setattr = reiser4_setattr_common,
-			.getattr = reiser4_getattr_common
-		},
-		.file_ops = {
-			.llseek = reiser4_llseek_dir_common,
-			.read = generic_read_dir,
-			.readdir = reiser4_readdir_common,
-			.release = reiser4_release_dir_common,
-			.fsync = reiser4_sync_common
-		},
-		.as_ops = {
-			.writepage = bugop,
-			.sync_page = bugop,
-			.writepages = dummyop,
-			.set_page_dirty = bugop,
-			.readpages = bugop,
-			.prepare_write = bugop,
-			.commit_write = bugop,
-			.bmap = bugop,
-			.invalidatepage = bugop,
-			.releasepage = bugop
-		},
+		.inode_ops = &directory_i_ops,
+		.file_ops = &directory_f_ops,
+		.as_ops = &directory_a_ops,
+
 		.get_parent = get_parent_common,
 		.is_name_acceptable = is_name_acceptable_common,
 		.build_entry_key = build_entry_key_hashed,
@@ -452,39 +496,10 @@
 			.desc = "directory hashed with 31 bit hash",
 			.linkage = {NULL, NULL}
 		},
-		.inode_ops = {
-			.create = reiser4_create_common,
-			.lookup = reiser4_lookup_common,
-			.link = reiser4_link_common,
-			.unlink = reiser4_unlink_common,
-			.symlink = reiser4_symlink_common,
-			.mkdir = reiser4_mkdir_common,
-			.rmdir = reiser4_unlink_common,
-			.mknod = reiser4_mknod_common,
-			.rename = reiser4_rename_common,
-			.permission = reiser4_permission_common,
-			.setattr = reiser4_setattr_common,
-			.getattr = reiser4_getattr_common
-		},
-		.file_ops = {
-			.llseek = reiser4_llseek_dir_common,
-			.read =	generic_read_dir,
-			.readdir = reiser4_readdir_common,
-			.release = reiser4_release_dir_common,
-			.fsync = reiser4_sync_common
-		},
-		.as_ops = {
-			.writepage = bugop,
-			.sync_page = bugop,
-			.writepages = dummyop,
-			.set_page_dirty = bugop,
-			.readpages = bugop,
-			.prepare_write = bugop,
-			.commit_write = bugop,
-			.bmap = bugop,
-			.invalidatepage = bugop,
-			.releasepage = bugop
-		},
+		.inode_ops = &directory_i_ops,
+		.file_ops = &directory_f_ops,
+		.as_ops = &directory_a_ops,
+
 		.get_parent = get_parent_common,
 		.is_name_acceptable = is_name_acceptable_common,
 		.build_entry_key = build_entry_key_seekable,
--- linux-2.6.23-mm1/fs/reiser4/plugin/plugin.h.orig
+++ linux-2.6.23-mm1/fs/reiser4/plugin/plugin.h
@@ -199,20 +199,61 @@
 	/* generic fields */
 	plugin_header h;
 
-	struct inode_operations inode_ops;
-	struct file_operations file_ops;
-	struct address_space_operations as_ops;
-
+	/* VFS methods.
+	 * Must be invariant with respect to plugin conversion.
+	 * It can be achieved by using "common" methods, which
+	 * are the same for all plugins that take participation in
+	 * conversion, or by using "generic" or "careful" methods,
+	 * which provide automatic redirection to proper private
+	 * plugin methods ("careful" are the same as "generic",
+	 * but with protection of pset and other disk structures
+	 * from being rebuilt during conversion.
+	 */
+	struct inode_operations * inode_ops;
+	struct file_operations * file_ops;
+	struct address_space_operations * as_ops;
+	/**
+	 * Private methods. These are optional. If used they will allow you
+	 * to minimize the amount of code needed to implement a deviation
+	 * from some other method that also uses them.
+	 */
+	/*
+	 * private inode_ops
+	 */
+	int (*setattr)(struct dentry *, struct iattr *);
+	/*
+	 * private file_ops
+	 */
+	/* do whatever is necessary to do when object is opened */
+	int (*open) (struct inode * inode, struct file * file);
+	ssize_t (*read) (struct file *, char __user *buf, size_t read_amount,
+			loff_t *off);
+	/* write a file;
+	 * perform file plugin conversion (if needed);
+	 * set @*conv to 1, if the conversion occurred */
+	ssize_t (*write) (struct file *, const char __user *buf,
+			  size_t write_amount, loff_t * off, int * conv);
+	int (*ioctl) (struct inode *inode, struct file *filp,
+		      unsigned int cmd, unsigned long arg);
+	int (*mmap) (struct file *, struct vm_area_struct *);
+	int (*release) (struct inode *, struct file *);
+	/*
+	 * private a_ops
+	 */
+	int (*readpage) (struct file *file, struct page *page);
+	int (*readpages)(struct file *file, struct address_space *mapping,
+			  struct list_head *pages, unsigned nr_pages);
+	int (*writepages)(struct address_space *mapping,
+			  struct writeback_control *wbc);
+	int (*prepare_write)(struct file *file, struct page *page,
+			     unsigned from, unsigned to);
+	int (*commit_write)(struct file *file, struct page *page,
+			    unsigned from, unsigned to);
+	sector_t (*bmap) (struct address_space * mapping, sector_t lblock);
+	/* other private methods */
 	/* save inode cached stat-data onto disk. It was called
 	   reiserfs_update_sd() in 3.x */
 	int (*write_sd_by_inode) (struct inode *);
-
-	/*
-	 * private methods: These are optional.  If used they will allow you to
-	 * minimize the amount of code needed to implement a deviation from
-	 * some other method that also uses them.
-	 */
-
 	/*
 	 * Construct flow into @flow according to user-supplied data.
 	 *
@@ -242,7 +283,6 @@
 	int (*flow_by_inode) (struct inode *, const char __user *buf,
 			      int user, loff_t size,
 			      loff_t off, rw_op op, flow_t *);
-
 	/*
 	 * Return the key used to retrieve an offset of a file. It is used by
 	 * default implementation of ->flow_by_inode() method
@@ -273,9 +313,6 @@
 	 */
 	int (*create_object) (struct inode *object, struct inode *parent,
 			      reiser4_object_create_data *);
-
-	/* this does whatever is necessary to do when object is opened */
-	int (*open_object) (struct inode * inode, struct file * file);
 	/*
 	 * this method should check REISER4_NO_SD and set REISER4_NO_SD on
 	 * success. Deletion of an object usually includes removal of items
@@ -397,9 +434,9 @@
 	/* generic fields */
 	plugin_header h;
 
-	struct inode_operations inode_ops;
-	struct file_operations file_ops;
-	struct address_space_operations as_ops;
+	struct inode_operations * inode_ops;
+	struct file_operations * file_ops;
+	struct address_space_operations * as_ops;
 
 	/*
 	 * private methods: These are optional.  If used they will allow you to
--- linux-2.6.23-mm1/fs/reiser4/as_ops.c.orig
+++ linux-2.6.23-mm1/fs/reiser4/as_ops.c
@@ -326,6 +326,46 @@
 	}
 }
 
+int reiser4_readpage(struct file *file, struct page *page)
+{
+	assert("edward-1533", PageLocked(page));
+	assert("edward-1534", !PageUptodate(page));
+	assert("edward-1535", page->mapping && page->mapping->host);
+
+	return inode_file_plugin(page->mapping->host)->readpage(file, page);
+}
+
+int reiser4_readpages(struct file *file, struct address_space *mapping,
+		      struct list_head *pages, unsigned nr_pages)
+{
+	return inode_file_plugin(mapping->host)->readpages(file, mapping,
+							   pages, nr_pages);
+}
+
+int reiser4_writepages(struct address_space *mapping,
+		       struct writeback_control *wbc)
+{
+	return inode_file_plugin(mapping->host)->writepages(mapping, wbc);
+}
+
+int reiser4_prepare_write(struct file *file, struct page *page,
+			  unsigned from, unsigned to)
+{
+	return inode_file_plugin(file->f_dentry->d_inode)->prepare_write(file,
+									 page,
+									 from,
+									 to);
+}
+
+int reiser4_commit_write(struct file *file, struct page *page,
+			 unsigned from, unsigned to)
+{
+	return inode_file_plugin(file->f_dentry->d_inode)->commit_write(file,
+									page,
+									from,
+									to);
+}
+
 /* Make Linus happy.
    Local variables:
    c-indentation-style: "K&R"
--- linux-2.6.23-mm1/fs/reiser4/plugin/file/cryptcompress.c.orig
+++ linux-2.6.23-mm1/fs/reiser4/plugin/file/cryptcompress.c
@@ -266,6 +266,7 @@
 	info->inst = 0;
 }
 
+#if 0
 static int is_crypto_info_instantiated(struct reiser4_crypto_info * info)
 {
 	return info->inst;
@@ -277,6 +278,7 @@
 	return inode_crypto_info(inode) &&
 		is_crypto_info_instantiated(inode_crypto_info(inode));
 }
+#endif
 
 static void free_crypto_info (struct inode * inode)
 {
@@ -467,7 +469,7 @@
 	return 0;
 }
 
-/* ->destroy_inode() method of the cryptcompress plugin */
+/* plugin->destroy_inode() */
 void destroy_inode_cryptcompress(struct inode * inode)
 {
 	assert("edward-1464", INODE_PGCOUNT(inode) == 0);
@@ -475,15 +477,14 @@
 	return;
 }
 
-/* ->create() method of the cryptcompress plugin
-
+/* plugin->create_object():
 . install plugins
 . attach crypto info if specified
 . attach compression info if specified
 . attach cluster info
 */
-int create_cryptcompress(struct inode *object, struct inode *parent,
-			 reiser4_object_create_data * data)
+int create_object_cryptcompress(struct inode *object, struct inode *parent,
+				reiser4_object_create_data * data)
 {
 	int result;
 	reiser4_inode *info;
@@ -523,33 +524,9 @@
 	return result;
 }
 
-/* ->open_object() method of the cryptcompress plugin */
-int open_object_cryptcompress(struct inode * inode, struct file * file)
+/* plugin->open() */
+int open_cryptcompress(struct inode * inode, struct file * file)
 {
-	int result;
-	struct inode * parent;
-
-	assert("edward-1394", inode != NULL);
-	assert("edward-1395", file != NULL);
-	assert("edward-1396", file != NULL);
-	assert("edward-1397", file->f_dentry->d_inode == inode);
-	assert("edward-1398", file->f_dentry->d_parent != NULL);
-	assert("edward-1399", file->f_dentry->d_parent->d_inode != NULL);
-	assert("edward-698",
-	       inode_file_plugin(inode) ==
-	       file_plugin_by_id(CRYPTCOMPRESS_FILE_PLUGIN_ID));
-	result = inode_check_cluster(inode);
-	if (result)
-		return result;
-	result = inode_init_compression(inode);
-	if (result)
-		return result;
-	if (!need_cipher(inode))
-		/* the file is not to be ciphered */
-		return 0;
-	parent = file->f_dentry->d_parent->d_inode;
-	if (!inode_has_cipher_key(inode))
-		return RETERR(-EINVAL);
 	return 0;
 }
 
@@ -2671,6 +2648,7 @@
 	clust->tc.len = 0;
 }
 
+/* the heart of write_cryptcompress */
 static loff_t do_write_cryptcompress(struct file *file, struct inode *inode,
 				     const char __user *buf, size_t to_write,
 				     loff_t pos, int *conv_occured)
@@ -2831,14 +2809,11 @@
 }
 
 /**
- * write_cryptcompress - write of struct file_operations
+ * plugin->write()
  * @file: file to write to
  * @buf: address of user-space buffer
  * @read_amount: number of bytes to write
  * @off: position in file to write to
- *
- * This is implementation of vfs's write method of struct file_operations for
- * cryptcompress plugin.
  */
 ssize_t write_cryptcompress(struct file *file, const char __user *buf,
 			    size_t count, loff_t *off, int *conv)
@@ -2887,6 +2862,7 @@
 	return result;
 }
 
+/* plugin->readpages */
 int readpages_cryptcompress(struct file *file, struct address_space *mapping,
 			    struct list_head *pages, unsigned nr_pages)
 {
@@ -2919,14 +2895,11 @@
 }
 
 /**
- * read_cryptcompress - read of struct file_operations
+ * plugin->read
  * @file: file to read from
  * @buf: address of user-space buffer
  * @read_amount: number of bytes to read
  * @off: position in file to read from
- *
- * This is implementation of vfs's read method of struct file_operations for
- * cryptcompress plugin.
  */
 ssize_t read_cryptcompress(struct file * file, char __user *buf, size_t size,
 			   loff_t * off)
@@ -3060,6 +3033,8 @@
 }
 
 #define CRC_CUT_TREE_MIN_ITERATIONS 64
+
+/* plugin->cut_tree_worker */
 int cut_tree_worker_cryptcompress(tap_t * tap, const reiser4_key * from_key,
 				  const reiser4_key * to_key,
 				  reiser4_key * smallest_removed,
@@ -3419,8 +3394,10 @@
 	return result;
 }
 
-/* This is called in setattr_cryptcompress when it is used to truncate,
- * and in delete_cryptcompress */
+/**
+ * This is called in setattr_cryptcompress when it is used to truncate,
+ * and in delete_object_cryptcompress
+ */
 static int cryptcompress_truncate(struct inode *inode,	/* old size */
 				  loff_t new_size,	/* new size */
 				  int update_sd)
@@ -3583,8 +3560,7 @@
 	return result;
 }
 
-/* This is implementation of vfs's writepages method of struct
-   address_space_operations */
+/* plugin->writepages */
 int writepages_cryptcompress(struct address_space *mapping,
 			     struct writeback_control *wbc)
 {
@@ -3661,7 +3637,14 @@
 	return result;
 }
 
-/* plugin->u.file.mmap */
+/* plugin->ioctl */
+int ioctl_cryptcompress(struct inode *inode, struct file *filp,
+			unsigned int cmd, unsigned long arg)
+{
+	return 0;
+}
+
+/* plugin->mmap */
 int mmap_cryptcompress(struct file *file, struct vm_area_struct *vma)
 {
 	int result;
@@ -3688,12 +3671,7 @@
 	return result;
 }
 
-/* plugin->u.file.release */
-/* plugin->u.file.get_block */
-
-/* this is implementation of delete method of file plugin for
- * cryptcompress objects
- */
+/* plugin->delete_object */
 int delete_object_cryptcompress(struct inode *inode)
 {
 	int result;
@@ -3720,8 +3698,10 @@
 	return reiser4_delete_object_common(inode);
 }
 
-/* plugin->u.file.setattr method
-   This implements actual truncate (see comments in reiser4/page_cache.c) */
+/*
+ * plugin->setattr
+ * This implements actual truncate (see comments in reiser4/page_cache.c)
+ */
 int setattr_cryptcompress(struct dentry *dentry, struct iattr *attr)
 {
 	int result;
@@ -3765,11 +3745,7 @@
 	return result;
 }
 
-/*
- * release_cryptcompress - release of struct file_operations
- * @inode: inode of released file
- * @file: file to release
- */
+/* plugin->release */
 int release_cryptcompress(struct inode *inode, struct file *file)
 {
 	reiser4_context *ctx = reiser4_init_context(inode->i_sb);
@@ -3781,14 +3757,25 @@
 	return 0;
 }
 
-#if 0
+/* plugin->prepare_write */
 int prepare_write_cryptcompress(struct file *file, struct page *page,
 				unsigned from, unsigned to)
 {
-	return prepare_write_common(file, page, from, to);
+	return 0;
 }
-#endif  /*  0  */
 
+/* plugin->commit_write */
+int commit_write_cryptcompress(struct file *file, struct page *page,
+			       unsigned from, unsigned to)
+{
+	return 0;
+}
+
+/* plugin->bmap */
+sector_t bmap_cryptcompress(struct address_space *mapping, sector_t lblock)
+{
+	return -EINVAL;
+}
 
 /*
   Local variables:
--- linux-2.6.23-mm1/fs/reiser4/plugin/file_ops.c.orig
+++ linux-2.6.23-mm1/fs/reiser4/plugin/file_ops.c
@@ -58,6 +58,43 @@
 	return result;
 }
 
+/*
+ * common sync method for regular files.
+ *
+ * We are trying to be smart here. Instead of committing all atoms (original
+ * solution), we scan dirty pages of this file and commit all atoms they are
+ * part of.
+ *
+ * Situation is complicated by anonymous pages: i.e., extent-less pages
+ * dirtied through mmap. Fortunately sys_fsync() first calls
+ * filemap_fdatawrite() that will ultimately call reiser4_writepages(), insert
+ * all missing extents and capture anonymous pages.
+ */
+int reiser4_sync_file_common(struct file *file,
+			     struct dentry *dentry, int datasync)
+{
+	reiser4_context *ctx;
+	txn_atom *atom;
+	reiser4_block_nr reserve;
+
+	ctx = reiser4_init_context(dentry->d_inode->i_sb);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	reserve = estimate_update_common(dentry->d_inode);
+	if (reiser4_grab_space(reserve, BA_CAN_COMMIT)) {
+		reiser4_exit_context(ctx);
+		return RETERR(-ENOSPC);
+	}
+	write_sd_by_inode_common(dentry->d_inode);
+
+	atom = get_current_atom_locked();
+	spin_lock_txnh(ctx->trans);
+	force_commit_atom(ctx->trans);
+	reiser4_exit_context(ctx);
+	return 0;
+}
+
 /* this is common implementation of vfs's sendfile method of struct
    file_operations
 
--- linux-2.6.23-mm1/fs/reiser4/inode.c.orig
+++ linux-2.6.23-mm1/fs/reiser4/inode.c
@@ -151,38 +151,38 @@
 				rdev = data->rdev;
 			inode->i_blocks = 0;
 			assert("vs-42", fplug->h.id == SPECIAL_FILE_PLUGIN_ID);
-			inode->i_op = &file_plugins[fplug->h.id].inode_ops;
+			inode->i_op = file_plugins[fplug->h.id].inode_ops;
 			/* initialize inode->i_fop and inode->i_rdev for block and char
 			   devices */
 			init_special_inode(inode, inode->i_mode, rdev);
 			/* all address space operations are null */
 			inode->i_mapping->a_ops =
-			    &file_plugins[fplug->h.id].as_ops;
+			    file_plugins[fplug->h.id].as_ops;
 			break;
 		}
 	case S_IFLNK:
 		assert("vs-46", fplug != NULL);
 		assert("vs-42", fplug->h.id == SYMLINK_FILE_PLUGIN_ID);
-		inode->i_op = &file_plugins[fplug->h.id].inode_ops;
+		inode->i_op = file_plugins[fplug->h.id].inode_ops;
 		inode->i_fop = NULL;
 		/* all address space operations are null */
-		inode->i_mapping->a_ops = &file_plugins[fplug->h.id].as_ops;
+		inode->i_mapping->a_ops = file_plugins[fplug->h.id].as_ops;
 		break;
 	case S_IFDIR:
 		assert("vs-46", dplug != NULL);
 		assert("vs-43", (dplug->h.id == HASHED_DIR_PLUGIN_ID ||
 				 dplug->h.id == SEEKABLE_HASHED_DIR_PLUGIN_ID));
-		inode->i_op = &dir_plugins[dplug->h.id].inode_ops;
-		inode->i_fop = &dir_plugins[dplug->h.id].file_ops;
-		inode->i_mapping->a_ops = &dir_plugins[dplug->h.id].as_ops;
+		inode->i_op = dir_plugins[dplug->h.id].inode_ops;
+		inode->i_fop = dir_plugins[dplug->h.id].file_ops;
+		inode->i_mapping->a_ops = dir_plugins[dplug->h.id].as_ops;
 		break;
 	case S_IFREG:
 		assert("vs-46", fplug != NULL);
 		assert("vs-43", (fplug->h.id == UNIX_FILE_PLUGIN_ID ||
 				 fplug->h.id == CRYPTCOMPRESS_FILE_PLUGIN_ID));
-		inode->i_op = &file_plugins[fplug->h.id].inode_ops;
-		inode->i_fop = &file_plugins[fplug->h.id].file_ops;
-		inode->i_mapping->a_ops = &file_plugins[fplug->h.id].as_ops;
+		inode->i_op = file_plugins[fplug->h.id].inode_ops;
+		inode->i_fop = file_plugins[fplug->h.id].file_ops;
+		inode->i_mapping->a_ops = file_plugins[fplug->h.id].as_ops;
 		break;
 	default:
 		warning("nikita-291", "wrong file mode: %o for %llu",

--------------050807060202020104060306--
