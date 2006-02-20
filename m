From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 08/11] reiserfs: add per-file data=ordered mode and use it for xattrs
Date: Mon, 20 Feb 2006 15:14:58 -0500
Message-ID: <20060220201458.GA23299@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28104-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: "E. Gryaznova" <grev@namesys.com>


 This patch allows a per-file data=ordered mode similar to the per-file
 data=journal mode implemented now. This functionality isn't yet exported,
 but the main use of this code is to allow xattrs to be ordered even if the
 the file system is mounted with data=writeback.

 fs/reiserfs/file.c            |    2 +-
 fs/reiserfs/inode.c           |    2 +-
 fs/reiserfs/xattr.c           |    4 ++++
 include/linux/reiserfs_fs.h   |    8 ++++++++
 include/linux/reiserfs_fs_i.h |    1 +
 5 files changed, 15 insertions(+), 2 deletions(-)

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/file.c linux-2.6.15-staging2/fs/reiserfs/file.c
--- linux-2.6.15-staging1/fs/reiserfs/file.c	2006-02-13 11:07:04.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/file.c	2006-02-13 14:21:12.000000000 -0500
@@ -784,7 +784,7 @@ int reiserfs_commit_page(struct inode *i
 				/* do data=ordered on any page past the end
 				 * of file and any buffer marked BH_New.
 				 */
-				if (reiserfs_data_ordered(inode->i_sb) &&
+				if (reiserfs_file_data_ordered(inode) &&
 				    (new || page->index >= i_size_index)) {
 					reiserfs_add_ordered_list(inode, bh);
 				}
diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/inode.c linux-2.6.15-staging2/fs/reiserfs/inode.c
--- linux-2.6.15-staging1/fs/reiserfs/inode.c	2006-02-13 14:21:05.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/inode.c	2006-02-13 14:21:12.000000000 -0500
@@ -750,7 +750,7 @@ int reiserfs_get_block(struct inode *ino
 			}
 			set_buffer_new(bh_result);
 			if (buffer_dirty(bh_result)
-			    && reiserfs_data_ordered(inode->i_sb))
+			    && reiserfs_file_data_ordered(inode))
 				reiserfs_add_ordered_list(inode, bh_result);
 			put_block_num(item, pos_in_item, allocated_block_nr);
 			unfm_ptr = allocated_block_nr;
diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/xattr.c linux-2.6.15-staging2/fs/reiserfs/xattr.c
--- linux-2.6.15-staging1/fs/reiserfs/xattr.c	2006-02-13 14:21:12.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/xattr.c	2006-02-13 14:21:12.000000000 -0500
@@ -464,6 +464,10 @@ reiserfs_xattr_set(struct inode *inode, 
 	gfp_mask = mapping_gfp_mask(xinode->i_mapping);
 	mapping_set_gfp_mask(xinode->i_mapping, gfp_mask & ~__GFP_FS);
 
+	/* If we're in writeback mode, we still need to order xattr writes */
+	if (reiserfs_data_writeback(xinode->i_sb))
+		REISERFS_I(xinode)->i_flags |= i_data_ordered;
+
 	set_fs(KERNEL_DS);
 	err = fp->f_op->write(fp, (char *)&rxh, sizeof (rxh), &pos);
 	set_fs(old_fs);
diff -ruNpX ../dontdiff linux-2.6.15-staging1/include/linux/reiserfs_fs.h linux-2.6.15-staging2/include/linux/reiserfs_fs.h
--- linux-2.6.15-staging1/include/linux/reiserfs_fs.h	2006-02-13 14:21:05.000000000 -0500
+++ linux-2.6.15-staging2/include/linux/reiserfs_fs.h	2006-02-13 14:21:12.000000000 -0500
@@ -1694,6 +1694,14 @@ static inline int reiserfs_file_data_log
 	return 0;
 }
 
+static inline int reiserfs_file_data_ordered(struct inode *inode)
+{
+	if (reiserfs_data_ordered(inode->i_sb) ||
+	    (REISERFS_I(inode)->i_flags & i_data_ordered))
+		return 1;
+	return 0;
+}
+
 static inline int reiserfs_transaction_running(struct super_block *s)
 {
 	struct reiserfs_transaction_handle *th = current->journal_info;
diff -ruNpX ../dontdiff linux-2.6.15-staging1/include/linux/reiserfs_fs_i.h linux-2.6.15-staging2/include/linux/reiserfs_fs_i.h
--- linux-2.6.15-staging1/include/linux/reiserfs_fs_i.h	2006-01-02 22:21:10.000000000 -0500
+++ linux-2.6.15-staging2/include/linux/reiserfs_fs_i.h	2006-02-13 14:21:12.000000000 -0500
@@ -25,6 +25,7 @@ typedef enum {
 	i_link_saved_truncate_mask = 0x0020,
 	i_has_xattr_dir = 0x0040,
 	i_data_log = 0x0080,
+	i_data_ordered = 0x0100,
 } reiserfs_inode_flags;
 
 struct reiserfs_inode_info {
