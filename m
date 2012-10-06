From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH 03/22] reiserfs: drop vmtruncate
Date: Sat, 06 Oct 2012 10:12:47 +0200
Message-ID: <506FE7FF.5060201@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :content-type:content-transfer-encoding;
        bh=2y9WXQqrDC+2q3YjqMDz3dRQMo2GuGRhJbyjzm+d6Ng=;
        b=eTH7TaZp0UphHnu2EKmg7ynYJ+j8WMVTh8ej3xmXXXwuW37LPUWIiAchwyCPfV8fDE
         YNkAs3o+hTta6LvRysMtXVcOabDSnyWF1WyvTMF5UJWHcZt9R7AJ5Tb0h62xJT+faGgV
         kX5O4lBlMCi+ln2RDIp3hjASAgR4azuW6Q+EaAEeW9zP40SLI6W6qn/SwTFDnuZWkNDR
         YNTjghzBmlFfIwE2ggnfFIjKPgbIV9MSjM7WD9/I5+CZY2MGl0SDn+yqrUI8fiv5D2F7
         GyYgLtkJKvmPj7CUmEHaRb5zt9JdwYLoXP38v5k+O+oMl1Xtd4xbJq5TgX8usG6mevNu
         b1/Q==
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Jan Kara <jack@suse.cz>

Removed vmtruncate.

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
index 4648555..8133483 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -3078,8 +3078,10 @@ static ssize_t reiserfs_direct_IO(int rw, struct kiocb *iocb,
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
@@ -3192,8 +3194,13 @@ int reiserfs_setattr(struct dentry *dentry, struct iattr *attr)
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
