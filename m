From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 05/11] reiserfs: make i_has_xattr_dir flag more sane
Date: Mon, 20 Feb 2006 15:14:58 -0500
Message-ID: <20060220201458.GA23265@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28105-reiserfs=m.gmane.org@namesys.com>
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


 With the simplification of open/lookups, there is only one place that the
 xattr dir is found, and only one place where it is deleted. This patch
 simplifies the setting of the i_has_xattr_dir flag.

 The flag itself is unused at this point, but will be used in one of the
 following patches to make an educated guess at how many blocks will be
 required to journal the write.

 fs/reiserfs/xattr.c |   11 ++++-------
 1 files changed, 4 insertions(+), 7 deletions(-)

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/xattr.c linux-2.6.15-staging2/fs/reiserfs/xattr.c
--- linux-2.6.15-staging1/fs/reiserfs/xattr.c	2006-02-13 14:21:07.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/xattr.c	2006-02-13 14:21:07.000000000 -0500
@@ -130,6 +130,7 @@ static struct dentry *open_xa_dir(const 
 			goto out_err;
 		}
 	}
+	REISERFS_I(inode)->i_flags |= i_has_xattr_dir;
 	mutex_unlock(&xaroot->d_inode->i_mutex);
 
       out:
@@ -413,7 +414,6 @@ reiserfs_xattr_set(struct inode *inode, 
 	}
 
 	xinode = fp->f_dentry->d_inode;
-	REISERFS_I(inode)->i_flags |= i_has_xattr_dir;
 
 	/* we need to copy it off.. */
 	if (xinode->i_nlink > 1) {
@@ -523,7 +523,6 @@ reiserfs_xattr_get(const struct inode *i
 
 	xinode = fp->f_dentry->d_inode;
 	isize = i_size_read(xinode) - sizeof (rxh);
-	REISERFS_I(inode)->i_flags |= i_has_xattr_dir;
 
 	/* Just return the size needed */
 	if (buffer == NULL) {
@@ -698,6 +697,9 @@ int reiserfs_delete_xattrs(struct inode 
 		err = vfs_rmdir(root->d_inode, dir);
 		mutex_unlock(&root->d_inode->i_mutex);
 		dput(root);
+		if (!err)
+			REISERFS_I(inode)->i_flags =
+				REISERFS_I(inode)->i_flags & ~i_has_xattr_dir;
 	} else {
 		reiserfs_warning(inode->i_sb,
 				 "Couldn't remove all entries in directory");
@@ -709,9 +711,6 @@ int reiserfs_delete_xattrs(struct inode 
 
       out:
 	up_write(&REISERFS_I(inode)->xattr_sem);
-	if (!err)
-		REISERFS_I(inode)->i_flags =
-		    REISERFS_I(inode)->i_flags & ~i_has_xattr_dir;
 	return err;
 }
 
@@ -955,8 +954,6 @@ ssize_t reiserfs_listxattr(struct dentry
 	buf.r_pos = 0;
 	buf.r_inode = dentry->d_inode;
 
-	REISERFS_I(dentry->d_inode)->i_flags |= i_has_xattr_dir;
-
 	err = xattr_readdir(fp, reiserfs_listxattr_filler, &buf);
 	if (err)
 		goto out_dir;
