From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH 03/21] reiserfs: drop vmtruncate
Date: Sat, 15 Dec 2012 11:47:31 +0100
Message-ID: <50CC5543.9030206@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :content-type:content-transfer-encoding;
        bh=8TDJvYXMm/CYKS0tEZXuwF2AgdewTb7hpc5/bcjJOX0=;
        b=xZbhugESvyfD+KS4CvB1htVKRQUo35r2Ioum1a2CwbNg75K5Q/sI+e55ImLkyPh+W4
         cXgDc9VMLbJiHN+76nDezwP37zPzIu5Y19gLnm/+rnnjeUN/FJkCmCXhhF7TtfaN7ZvZ
         fjFql42cUswztq0N0lmm2CiWh+Q2bp9ZG6jHDSy0Yu2gTXNJbLZ3sNdRI+IveZ1sqBpv
         ne5XZKtDE7cyN6LqvRxkQoH3cTe9m5xXAkr9Q43kN/Y2sT50SpO0Q1gWTBN0ehR7de1u
         N4ypUI2YZP6sPbdMuT1sGT6i8icm5LoS2MbPSaACSKt7/vknhXdNNf96ZNTioSJrwqTo
         wZlA==
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux FS Devel <linux-fsdevel@vger.kernel.org>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>

Removed vmtruncate

Signed-off-by: Marco Stornelli <marco.stornelli@gmail.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/file.c     |    3 +--
 fs/reiserfs/inode.c    |   15 +++++++++++----
 fs/reiserfs/reiserfs.h |    1 +
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/fs/reiserfs/file.c b/fs/reiserfs/file.c
index 8375c92..50302d6 100644
--- a/fs/reiserfs/file.c
+++ b/fs/reiserfs/file.c
@@ -126,7 +126,7 @@ static int reiserfs_file_open(struct inode *inode, struct file *file)
 	return err;
 }
 
-static void reiserfs_vfs_truncate_file(struct inode *inode)
+void reiserfs_vfs_truncate_file(struct inode *inode)
 {
 	mutex_lock(&(REISERFS_I(inode)->tailpack));
 	reiserfs_truncate_file(inode, 1);
@@ -312,7 +312,6 @@ const struct file_operations reiserfs_file_operations = {
 };
 
 const struct inode_operations reiserfs_file_inode_operations = {
-	.truncate = reiserfs_vfs_truncate_file,
 	.setattr = reiserfs_setattr,
 	.setxattr = reiserfs_setxattr,
 	.getxattr = reiserfs_getxattr,
diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index d83736f..95d7680 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -3085,8 +3085,10 @@ static ssize_t reiserfs_direct_IO(int rw, struct kiocb *iocb,
 		loff_t isize = i_size_read(inode);
 		loff_t end = offset + iov_length(iov, nr_segs);
 
-		if (end > isize)
-			vmtruncate(inode, isize);
+		if ((end > isize) && inode_newsize_ok(inode, isize) == 0) {
+			truncate_setsize(inode, isize);
+			reiserfs_vfs_truncate_file(inode);
+		}
 	}
 
 	return ret;
@@ -3200,8 +3202,13 @@ int reiserfs_setattr(struct dentry *dentry, struct iattr *attr)
 	 */
 	reiserfs_write_unlock_once(inode->i_sb, depth);
 	if ((attr->ia_valid & ATTR_SIZE) &&
-	    attr->ia_size != i_size_read(inode))
-		error = vmtruncate(inode, attr->ia_size);
+	    attr->ia_size != i_size_read(inode)) {
+		error = inode_newsize_ok(inode, attr->ia_size);
+		if (!error) {
+			truncate_setsize(inode, attr->ia_size);
+			reiserfs_vfs_truncate_file(inode);
+		}
+	}
 
 	if (!error) {
 		setattr_copy(inode, attr);
diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index 33215f5..157e474 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -2455,6 +2455,7 @@ struct reiserfs_transaction_handle *reiserfs_persistent_transaction(struct
 								    *,
 								    int count);
 int reiserfs_end_persistent_transaction(struct reiserfs_transaction_handle *);
+void reiserfs_vfs_truncate_file(struct inode *inode);
 int reiserfs_commit_page(struct inode *inode, struct page *page,
 			 unsigned from, unsigned to);
 void reiserfs_flush_old_commits(struct super_block *);
-- 
1.7.3.4
