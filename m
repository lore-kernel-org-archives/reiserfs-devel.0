From: jeffm@suse.com
Subject: [patch 15/40] reiserfs: remove i_has_xattr_dir
Date: Mon, 11 Jun 2007 15:03:24 -0400
Message-ID: <20070611190630.966451967@suse.com>
References: <20070611190309.532091171@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs-remove-i_has_xattr_dir.diff
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

 With the changes to xattr root locking, the i_has_xattr_dir flag
 is no longer needed. This patch removes it.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

---
 fs/reiserfs/xattr.c |    7 -------
 1 file changed, 7 deletions(-)

--- a/fs/reiserfs/xattr.c	2007-06-11 14:49:36.000000000 -0400
+++ b/fs/reiserfs/xattr.c	2007-06-11 14:50:07.000000000 -0400
@@ -393,7 +393,6 @@ reiserfs_xattr_set(struct inode *inode, 
 
 	xahash = xattr_hash(buffer, buffer_size);
 	xinode = fp->f_path.dentry->d_inode;
-	REISERFS_I(inode)->i_flags |= i_has_xattr_dir;
 
 	/* we need to copy it off.. */
 	if (xinode->i_nlink > 1) {
@@ -512,7 +511,6 @@ reiserfs_xattr_get(const struct inode *i
 
 	xinode = fp->f_path.dentry->d_inode;
 	isize = xinode->i_size;
-	REISERFS_I(inode)->i_flags |= i_has_xattr_dir;
 
 	/* Just return the size needed */
 	if (buffer == NULL) {
@@ -732,9 +730,6 @@ int reiserfs_delete_xattrs(struct inode 
 	fput(fp);
 
       out:
-	if (!err)
-		REISERFS_I(inode)->i_flags =
-		    REISERFS_I(inode)->i_flags & ~i_has_xattr_dir;
 	return err;
 }
 
@@ -968,8 +963,6 @@ ssize_t reiserfs_listxattr(struct dentry
 	buf.r_pos = 0;
 	buf.r_inode = dentry->d_inode;
 
-	REISERFS_I(dentry->d_inode)->i_flags |= i_has_xattr_dir;
-
 	err = xattr_readdir(fp, reiserfs_listxattr_filler, &buf);
 	if (err)
 		goto out_dir;

-- 
Jeff Mahoney
SUSE Labs

