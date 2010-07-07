From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 5/6] reiser4: change fsync signature
Date: Wed, 07 Jul 2010 02:21:33 +0200
Message-ID: <4C33C88D.1040503@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040804090608090703030105"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------040804090608090703030105
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------040804090608090703030105
Content-Type: text/plain;
 name="reiser4-fsync-change-signature.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-fsync-change-signature.patch"

Change signatures of
. reiser4_sync_common();
. reiser4_sync_file_common()
in accordance with ->fsync() of file_operations

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/plugin/file/file.c |    2 +-
 fs/reiser4/plugin/file/file.h |    2 +-
 fs/reiser4/plugin/file_ops.c  |    7 ++++---
 fs/reiser4/plugin/object.h    |    2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

--- mmotm.orig/fs/reiser4/plugin/file/file.c
+++ mmotm/fs/reiser4/plugin/file/file.c
@@ -2243,7 +2243,7 @@ ssize_t write_unix_file(struct file *fil
 	if (result == 0 && ((file->f_flags & O_SYNC) || IS_SYNC(inode))) {
 		reiser4_txn_restart_current();
 		grab_space_enable();
-		result = reiser4_sync_file_common(file, file->f_dentry,
+		result = reiser4_sync_file_common(file,
 						  0 /* data and stat data */);
 		if (result)
 			warning("reiser4-7", "failed to sync file %llu",
--- mmotm.orig/fs/reiser4/plugin/file/file.h
+++ mmotm/fs/reiser4/plugin/file/file.h
@@ -52,7 +52,7 @@ int reiser4_ioctl_careful(struct inode *
 int reiser4_mmap_careful(struct file *, struct vm_area_struct *);
 int reiser4_open_careful(struct inode *inode, struct file *file);
 int reiser4_release_careful(struct inode *, struct file *);
-int reiser4_sync_file_common(struct file *, struct dentry *, int datasync);
+int reiser4_sync_file_common(struct file *, int datasync);
 
 /* address space operations */
 int reiser4_readpage(struct file *, struct page *);
--- mmotm.orig/fs/reiser4/plugin/file_ops.c
+++ mmotm/fs/reiser4/plugin/file_ops.c
@@ -43,10 +43,11 @@ int reiser4_release_dir_common(struct in
 /* this is common implementation of vfs's fsync method of struct
    file_operations
 */
-int reiser4_sync_common(struct file *file, struct dentry *dentry, int datasync)
+int reiser4_sync_common(struct file *file, int datasync)
 {
 	reiser4_context *ctx;
 	int result;
+	struct dentry *dentry = file->f_path.dentry;
 
 	ctx = reiser4_init_context(dentry->d_inode->i_sb);
 	if (IS_ERR(ctx))
@@ -70,12 +71,12 @@ int reiser4_sync_common(struct file *fil
  * filemap_fdatawrite() that will ultimately call reiser4_writepages(), insert
  * all missing extents and capture anonymous pages.
  */
-int reiser4_sync_file_common(struct file *file,
-			     struct dentry *dentry, int datasync)
+int reiser4_sync_file_common(struct file *file, int datasync)
 {
 	reiser4_context *ctx;
 	txn_atom *atom;
 	reiser4_block_nr reserve;
+	struct dentry *dentry = file->f_path.dentry;
 
 	ctx = reiser4_init_context(dentry->d_inode->i_sb);
 	if (IS_ERR(ctx))
--- mmotm.orig/fs/reiser4/plugin/object.h
+++ mmotm/fs/reiser4/plugin/object.h
@@ -34,7 +34,7 @@ int reiser4_getattr_common(struct vfsmou
 loff_t reiser4_llseek_dir_common(struct file *, loff_t off, int origin);
 int reiser4_readdir_common(struct file *, void *dirent, filldir_t);
 int reiser4_release_dir_common(struct inode *, struct file *);
-int reiser4_sync_common(struct file *, struct dentry *, int datasync);
+int reiser4_sync_common(struct file *, int datasync);
 
 
 /* file plugin operations: common implementations */

--------------040804090608090703030105--
