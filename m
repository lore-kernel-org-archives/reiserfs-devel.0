From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: [patch 30/41] reiserfs convert to new aops.
Date: Wed, 16 May 2007 21:22:58 +0400
Message-ID: <200705162122.58327.vs@namesys.com>
References: <20070514060619.689648000@wotan.suse.de> <200705142014.27237.vs@namesys.com> <20070514224042.GD5531@wotan.suse.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_y3zSGvuoHOkLDjE"
Return-path: <reiserfs-list-return-30651-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20070514224042.GD5531@wotan.suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nick Piggin <npiggin@suse.de>, reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

--Boundary-00=_y3zSGvuoHOkLDjE
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello, Nick

This is new version of the patch.

reiserfs_prepare_write and reiserfs_commit_write are still there, but they do not show themselves in any struct address_space_operations instance.

xattrs and ioctl use them directly.


--Boundary-00=_y3zSGvuoHOkLDjE
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="reiserfs-convert-to-new-aops.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiserfs-convert-to-new-aops.patch"


From: Vladimir Saveliev <vs@namesys.com>

Convert reiserfs to new aops

Signed-off-by: Vladimir Saveliev <vs@namesys.com>



diff -puN fs/reiserfs/inode.c~reiserfs-convert-to-new-aops fs/reiserfs/inode.c
--- linux-2.6.21-mm2/fs/reiserfs/inode.c~reiserfs-convert-to-new-aops	2007-05-16 20:13:36.000000000 +0300
+++ linux-2.6.21-mm2-vs/fs/reiserfs/inode.c	2007-05-16 20:13:36.000000000 +0300
@@ -16,11 +16,12 @@
 #include <linux/mpage.h>
 #include <linux/writeback.h>
 #include <linux/quotaops.h>
+#include <linux/swap.h>
 
-static int reiserfs_commit_write(struct file *f, struct page *page,
-				 unsigned from, unsigned to);
-static int reiserfs_prepare_write(struct file *f, struct page *page,
-				  unsigned from, unsigned to);
+int reiserfs_commit_write(struct file *f, struct page *page,
+			  unsigned from, unsigned to);
+int reiserfs_prepare_write(struct file *f, struct page *page,
+			   unsigned from, unsigned to);
 
 void reiserfs_delete_inode(struct inode *inode)
 {
@@ -2549,8 +2550,71 @@ static int reiserfs_writepage(struct pag
 	return reiserfs_write_full_page(page, wbc);
 }
 
-static int reiserfs_prepare_write(struct file *f, struct page *page,
-				  unsigned from, unsigned to)
+static int reiserfs_write_begin(struct file *file,
+				struct address_space *mapping,
+				loff_t pos, unsigned len, unsigned flags,
+				struct page **pagep, void **fsdata)
+{
+	struct inode *inode;
+	struct page *page;
+	pgoff_t index;
+	int ret;
+	int old_ref = 0;
+
+	index = pos >> PAGE_CACHE_SHIFT;
+	page = __grab_cache_page(mapping, index);
+	if (!page)
+		return -ENOMEM;
+	*pagep = page;
+
+	inode = mapping->host;
+	reiserfs_wait_on_write_block(inode->i_sb);
+	fix_tail_page_for_writing(page);
+	if (reiserfs_transaction_running(inode->i_sb)) {
+		struct reiserfs_transaction_handle *th;
+		th = (struct reiserfs_transaction_handle *)current->
+		    journal_info;
+		BUG_ON(!th->t_refcount);
+		BUG_ON(!th->t_trans_id);
+		old_ref = th->t_refcount;
+		th->t_refcount++;
+	}
+	ret = block_write_begin(file, mapping, pos, len, flags, pagep, fsdata,
+				reiserfs_get_block);
+	if (ret && reiserfs_transaction_running(inode->i_sb)) {
+		struct reiserfs_transaction_handle *th = current->journal_info;
+		/* this gets a little ugly.  If reiserfs_get_block returned an
+		 * error and left a transacstion running, we've got to close it,
+		 * and we've got to free handle if it was a persistent transaction.
+		 *
+		 * But, if we had nested into an existing transaction, we need
+		 * to just drop the ref count on the handle.
+		 *
+		 * If old_ref == 0, the transaction is from reiserfs_get_block,
+		 * and it was a persistent trans.  Otherwise, it was nested above.
+		 */
+		if (th->t_refcount > old_ref) {
+			if (old_ref)
+				th->t_refcount--;
+			else {
+				int err;
+				reiserfs_write_lock(inode->i_sb);
+				err = reiserfs_end_persistent_transaction(th);
+				reiserfs_write_unlock(inode->i_sb);
+				if (err)
+					ret = err;
+			}
+		}
+	}
+	if (ret) {
+		unlock_page(page);
+		page_cache_release(page);
+	}
+	return ret;
+}
+
+int reiserfs_prepare_write(struct file *f, struct page *page,
+			   unsigned from, unsigned to)
 {
 	struct inode *inode = page->mapping->host;
 	int ret;
@@ -2603,8 +2667,101 @@ static sector_t reiserfs_aop_bmap(struct
 	return generic_block_bmap(as, block, reiserfs_bmap);
 }
 
-static int reiserfs_commit_write(struct file *f, struct page *page,
-				 unsigned from, unsigned to)
+static int reiserfs_write_end(struct file *file, struct address_space *mapping,
+			      loff_t pos, unsigned len, unsigned copied,
+			      struct page *page, void *fsdata)
+{
+	struct inode *inode = page->mapping->host;
+	int ret = 0;
+	int update_sd = 0;
+	struct reiserfs_transaction_handle *th;
+	unsigned start;
+
+
+	reiserfs_wait_on_write_block(inode->i_sb);
+	if (reiserfs_transaction_running(inode->i_sb))
+		th = current->journal_info;
+	else
+		th = NULL;
+
+	start = pos & (PAGE_CACHE_SIZE - 1);
+	if (unlikely(copied < len)) {
+		if (!PageUptodate(page))
+			copied = 0;
+
+		page_zero_new_buffers(page, start + copied, start + len);
+	}
+	flush_dcache_page(page);
+
+	reiserfs_commit_page(inode, page, start, start + copied);
+	unlock_page(page);
+	mark_page_accessed(page);
+	page_cache_release(page);
+
+	/* generic_commit_write does this for us, but does not update the
+	 ** transaction tracking stuff when the size changes.  So, we have
+	 ** to do the i_size updates here.
+	 */
+	pos += copied;
+	if (pos > inode->i_size) {
+		struct reiserfs_transaction_handle myth;
+		reiserfs_write_lock(inode->i_sb);
+		/* If the file have grown beyond the border where it
+		   can have a tail, unmark it as needing a tail
+		   packing */
+		if ((have_large_tails(inode->i_sb)
+		     && inode->i_size > i_block_size(inode) * 4)
+		    || (have_small_tails(inode->i_sb)
+			&& inode->i_size > i_block_size(inode)))
+			REISERFS_I(inode)->i_flags &= ~i_pack_on_close_mask;
+
+		ret = journal_begin(&myth, inode->i_sb, 1);
+		if (ret) {
+			reiserfs_write_unlock(inode->i_sb);
+			goto journal_error;
+		}
+		reiserfs_update_inode_transaction(inode);
+		inode->i_size = pos;
+		/*
+		 * this will just nest into our transaction.  It's important
+		 * to use mark_inode_dirty so the inode gets pushed around on the
+		 * dirty lists, and so that O_SYNC works as expected
+		 */
+		mark_inode_dirty(inode);
+		reiserfs_update_sd(&myth, inode);
+		update_sd = 1;
+		ret = journal_end(&myth, inode->i_sb, 1);
+		reiserfs_write_unlock(inode->i_sb);
+		if (ret)
+			goto journal_error;
+	}
+	if (th) {
+		reiserfs_write_lock(inode->i_sb);
+		if (!update_sd)
+			mark_inode_dirty(inode);
+		ret = reiserfs_end_persistent_transaction(th);
+		reiserfs_write_unlock(inode->i_sb);
+		if (ret)
+			goto out;
+	}
+
+      out:
+	return ret == 0 ? copied : ret;
+
+      journal_error:
+	if (th) {
+		reiserfs_write_lock(inode->i_sb);
+		if (!update_sd)
+			reiserfs_update_sd(th, inode);
+		ret = reiserfs_end_persistent_transaction(th);
+		reiserfs_write_unlock(inode->i_sb);
+	}
+
+	return ret;
+}
+
+int reiserfs_commit_write(struct file *f, struct page *page,
+			  unsigned from, unsigned to)
 {
 	struct inode *inode = page->mapping->host;
 	loff_t pos = ((loff_t) page->index << PAGE_CACHE_SHIFT) + to;
@@ -2997,9 +3154,9 @@ const struct address_space_operations re
 	.readpages = reiserfs_readpages,
 	.releasepage = reiserfs_releasepage,
 	.invalidatepage = reiserfs_invalidatepage,
-	.sync_page = block_sync_page,
-	.prepare_write = reiserfs_prepare_write,
-	.commit_write = reiserfs_commit_write,
+	.sync_page = block_sync_page,	
+	.write_begin = reiserfs_write_begin,
+	.write_end = reiserfs_write_end,
 	.bmap = reiserfs_aop_bmap,
 	.direct_IO = reiserfs_direct_IO,
 	.set_page_dirty = reiserfs_set_page_dirty,
diff -puN fs/reiserfs/ioctl.c~reiserfs-convert-to-new-aops fs/reiserfs/ioctl.c
--- linux-2.6.21-mm2/fs/reiserfs/ioctl.c~reiserfs-convert-to-new-aops	2007-05-16 20:13:36.000000000 +0300
+++ linux-2.6.21-mm2-vs/fs/reiserfs/ioctl.c	2007-05-16 20:13:36.000000000 +0300
@@ -129,6 +129,10 @@ long reiserfs_compat_ioctl(struct file *
 }
 #endif
 
+int reiserfs_commit_write(struct file *f, struct page *page,
+			  unsigned from, unsigned to);
+int reiserfs_prepare_write(struct file *f, struct page *page,
+			   unsigned from, unsigned to);
 /*
 ** reiserfs_unpack
 ** Function try to convert tail from direct item into indirect.
@@ -176,15 +180,13 @@ static int reiserfs_unpack(struct inode 
 	if (!page) {
 		goto out;
 	}
-	retval =
-	    mapping->a_ops->prepare_write(NULL, page, write_from, write_from);
+	retval = reiserfs_prepare_write(NULL, page, write_from, write_from);
 	if (retval)
 		goto out_unlock;
 
 	/* conversion can change page contents, must flush */
 	flush_dcache_page(page);
-	retval =
-	    mapping->a_ops->commit_write(NULL, page, write_from, write_from);
+	retval = reiserfs_commit_write(NULL, page, write_from, write_from);
 	REISERFS_I(inode)->i_flags |= i_nopack_mask;
 
       out_unlock:
diff -puN fs/reiserfs/xattr.c~reiserfs-convert-to-new-aops fs/reiserfs/xattr.c
--- linux-2.6.21-mm2/fs/reiserfs/xattr.c~reiserfs-convert-to-new-aops	2007-05-16 20:13:36.000000000 +0300
+++ linux-2.6.21-mm2-vs/fs/reiserfs/xattr.c	2007-05-16 20:13:36.000000000 +0300
@@ -426,6 +426,12 @@ static inline __u32 xattr_hash(const cha
 	return csum_partial(msg, len, 0);
 }
 
+int reiserfs_commit_write(struct file *f, struct page *page,
+			  unsigned from, unsigned to);
+int reiserfs_prepare_write(struct file *f, struct page *page,
+			   unsigned from, unsigned to);
+
+
 /* Generic extended attribute operations that can be used by xa plugins */
 
 /*
@@ -512,15 +518,15 @@ reiserfs_xattr_set(struct inode *inode, 
 			rxh->h_hash = cpu_to_le32(xahash);
 		}
 
-		err = mapping->a_ops->prepare_write(fp, page, page_offset,
-						    page_offset + chunk + skip);
+		err = reiserfs_prepare_write(fp, page, page_offset,
+					    page_offset + chunk + skip);
 		if (!err) {
 			if (buffer)
 				memcpy(data + skip, buffer + buffer_pos, chunk);
 			err =
-			    mapping->a_ops->commit_write(fp, page, page_offset,
-							 page_offset + chunk +
-							 skip);
+			    reiserfs_commit_write(fp, page, page_offset,
+						  page_offset + chunk +
+						  skip);
 		}
 		unlock_page(page);
 		reiserfs_put_page(page);

_

--Boundary-00=_y3zSGvuoHOkLDjE--
