From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 04/11] reiserfs: make per-inode xattr locking more fine grained
Date: Mon, 20 Feb 2006 15:14:58 -0500
Message-ID: <20060220201458.GA23253@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28097-reiserfs=m.gmane.org@namesys.com>
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


 The per-inode locking can be made more fine-grained to surround just the
 interaction with the filesystem itself. This really only applies to protecting
 reads during a write, since concurrent writes are barred with inode->i_mutex
 at the vfs level.

 fs/reiserfs/xattr.c            |   32 ++++++++++++++++++--------------
 fs/reiserfs/xattr_acl.c        |    7 +------
 include/linux/reiserfs_xattr.h |   21 ---------------------
 3 files changed, 19 insertions(+), 41 deletions(-)

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/xattr_acl.c linux-2.6.15-staging2/fs/reiserfs/xattr_acl.c
--- linux-2.6.15-staging1/fs/reiserfs/xattr_acl.c	2006-02-13 14:21:05.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/xattr_acl.c	2006-02-13 14:21:05.000000000 -0500
@@ -418,9 +418,7 @@ int reiserfs_cache_default_acl(struct in
 	int ret = 0;
 	if (reiserfs_posixacl(inode->i_sb) && !is_reiserfs_priv_object(inode)) {
 		struct posix_acl *acl;
-		reiserfs_read_lock_xattr_i(inode);
 		acl = reiserfs_get_acl(inode, ACL_TYPE_DEFAULT);
-		reiserfs_read_unlock_xattr_i(inode);
 		ret = acl ? 1 : 0;
 		posix_acl_release(acl);
 	}
@@ -451,11 +449,8 @@ int reiserfs_acl_chmod(struct inode *ino
 	if (!clone)
 		return -ENOMEM;
 	error = posix_acl_chmod_masq(clone, inode->i_mode);
-	if (!error) {
-		reiserfs_write_lock_xattr_i(inode);
+	if (!error)
 		error = reiserfs_set_acl(inode, ACL_TYPE_ACCESS, clone);
-		reiserfs_write_unlock_xattr_i(inode);
-	}
 	posix_acl_release(clone);
 	return error;
 }
diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/xattr.c linux-2.6.15-staging2/fs/reiserfs/xattr.c
--- linux-2.6.15-staging1/fs/reiserfs/xattr.c	2006-02-13 14:21:05.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/xattr.c	2006-02-13 14:21:05.000000000 -0500
@@ -390,6 +390,7 @@ reiserfs_xattr_set(struct inode *inode, 
 	if (get_inode_sd_version(inode) == STAT_DATA_V1)
 		return -EOPNOTSUPP;
 
+	down_write(&REISERFS_I(inode)->xattr_sem);
 	if (!buffer) {
 		struct reiserfs_xattr_handler *xah =
 					find_xattr_handler_prefix(name);
@@ -399,7 +400,9 @@ reiserfs_xattr_set(struct inode *inode, 
 			if (err)
 				goto out;
 		}
-		return reiserfs_xattr_del(inode, name);
+		err = reiserfs_xattr_del(inode, name);
+		up_write(&REISERFS_I(inode)->xattr_sem);
+		return err;
 	}
 
       open_file:
@@ -482,6 +485,7 @@ reiserfs_xattr_set(struct inode *inode, 
 	fput(fp);
 
       out:
+	up_write(&REISERFS_I(inode)->xattr_sem);
 	return err;
 }
 
@@ -508,6 +512,8 @@ reiserfs_xattr_get(const struct inode *i
 	if (get_inode_sd_version(inode) == STAT_DATA_V1)
 		return -EOPNOTSUPP;
 
+	down_read(&REISERFS_I(inode)->xattr_sem);
+
 	fp = open_xattr_file(inode, name, XATTR_REPLACE);
 	if (IS_ERR(fp)) {
 		up_read(&REISERFS_I(inode)->xattr_sem);
@@ -561,6 +567,7 @@ reiserfs_xattr_get(const struct inode *i
 	}
 
       out_dput:
+	up_read(&REISERFS_I(inode)->xattr_sem);
 	fput(fp);
 
       out:
@@ -659,13 +666,15 @@ int reiserfs_delete_xattrs(struct inode 
 	    !reiserfs_xattrs(inode->i_sb)) {
 		return 0;
 	}
+	down_write(&REISERFS_I(inode)->xattr_sem);
 	dir = open_xa_dir(inode, XATTR_REPLACE);
 	if (IS_ERR(dir)) {
 		err = PTR_ERR(dir);
 		goto out;
 	} else if (!dir->d_inode) {
 		dput(dir);
-		return 0;
+		err = 0;
+		goto out;
 	}
 
 	fp = dentry_open(dir, NULL, O_RDWR);
@@ -699,6 +708,7 @@ int reiserfs_delete_xattrs(struct inode 
 	fput(fp);
 
       out:
+	up_write(&REISERFS_I(inode)->xattr_sem);
 	if (!err)
 		REISERFS_I(inode)->i_flags =
 		    REISERFS_I(inode)->i_flags & ~i_has_xattr_dir;
@@ -750,6 +760,7 @@ int reiserfs_chown_xattrs(struct inode *
 	    !reiserfs_xattrs(inode->i_sb)) {
 		return 0;
 	}
+	down_write(&REISERFS_I(inode)->xattr_sem);
 	dir = open_xa_dir(inode, XATTR_REPLACE);
 	if (IS_ERR(dir)) {
 		if (PTR_ERR(dir) != -ENODATA)
@@ -788,6 +799,7 @@ int reiserfs_chown_xattrs(struct inode *
 
       out:
 	attrs->ia_valid = ia_valid;
+	up_write(&REISERFS_I(inode)->xattr_sem);
 	return err;
 }
 
@@ -807,9 +819,7 @@ reiserfs_getxattr(struct dentry * dentry
 	    get_inode_sd_version(dentry->d_inode) == STAT_DATA_V1)
 		return -EOPNOTSUPP;
 
-	reiserfs_read_lock_xattr_i(dentry->d_inode);
 	err = xah->get(dentry->d_inode, name, buffer, size);
-	reiserfs_read_unlock_xattr_i(dentry->d_inode);
 	return err;
 }
 
@@ -829,9 +839,7 @@ reiserfs_setxattr(struct dentry *dentry,
 	    get_inode_sd_version(dentry->d_inode) == STAT_DATA_V1)
 		return -EOPNOTSUPP;
 
-	reiserfs_write_lock_xattr_i(dentry->d_inode);
 	err = xah->set(dentry->d_inode, name, value, size, flags);
-	reiserfs_write_unlock_xattr_i(dentry->d_inode);
 	return err;
 }
 
@@ -849,7 +857,7 @@ int reiserfs_removexattr(struct dentry *
 	    get_inode_sd_version(dentry->d_inode) == STAT_DATA_V1)
 		return -EOPNOTSUPP;
 
-	reiserfs_write_lock_xattr_i(dentry->d_inode);
+	down_write(&REISERFS_I(dentry->d_inode)->xattr_sem);
 	/* Deletion pre-operation */
 	if (xah->del) {
 		err = xah->del(dentry->d_inode, name);
@@ -863,7 +871,7 @@ int reiserfs_removexattr(struct dentry *
 	mark_inode_dirty(dentry->d_inode);
 
       out:
-	reiserfs_write_unlock_xattr_i(dentry->d_inode);
+	up_write(&REISERFS_I(dentry->d_inode)->xattr_sem);
 	return err;
 }
 
@@ -926,7 +934,7 @@ ssize_t reiserfs_listxattr(struct dentry
 	    get_inode_sd_version(dentry->d_inode) == STAT_DATA_V1)
 		return -EOPNOTSUPP;
 
-	reiserfs_read_lock_xattr_i(dentry->d_inode);
+	down_read(&REISERFS_I(dentry->d_inode)->xattr_sem);
 	dir = open_xa_dir(dentry->d_inode, XATTR_REPLACE);
 	if (IS_ERR(dir)) {
 		err = PTR_ERR(dir);
@@ -962,7 +970,7 @@ ssize_t reiserfs_listxattr(struct dentry
 	fput(fp);
 
       out:
-	reiserfs_read_unlock_xattr_i(dentry->d_inode);
+	up_read(&REISERFS_I(dentry->d_inode)->xattr_sem);
 	return err;
 }
 
@@ -1164,12 +1172,8 @@ static int reiserfs_check_acl(struct ino
 	struct posix_acl *acl;
 	int error = -EAGAIN; /* do regular unix permission checks by default */
 
-	reiserfs_read_lock_xattr_i(inode);
-
 	acl = reiserfs_get_acl(inode, ACL_TYPE_ACCESS);
 
-	reiserfs_read_unlock_xattr_i(inode);
-
 	if (acl) {
 		if (!IS_ERR(acl)) {
 			error = posix_acl_permission(inode, acl, mask);
diff -ruNpX ../dontdiff linux-2.6.15-staging1/include/linux/reiserfs_xattr.h linux-2.6.15-staging2/include/linux/reiserfs_xattr.h
--- linux-2.6.15-staging1/include/linux/reiserfs_xattr.h	2006-02-13 14:21:05.000000000 -0500
+++ linux-2.6.15-staging2/include/linux/reiserfs_xattr.h	2006-02-13 14:21:05.000000000 -0500
@@ -57,23 +57,6 @@ extern struct reiserfs_xattr_handler sec
 int reiserfs_xattr_register_handlers(void) __init;
 void reiserfs_xattr_unregister_handlers(void);
 
-static inline void reiserfs_write_lock_xattr_i(struct inode *inode)
-{
-	down_write(&REISERFS_I(inode)->xattr_sem);
-}
-static inline void reiserfs_write_unlock_xattr_i(struct inode *inode)
-{
-	up_write(&REISERFS_I(inode)->xattr_sem);
-}
-static inline void reiserfs_read_lock_xattr_i(struct inode *inode)
-{
-	down_read(&REISERFS_I(inode)->xattr_sem);
-}
-
-static inline void reiserfs_read_unlock_xattr_i(struct inode *inode)
-{
-	up_read(&REISERFS_I(inode)->xattr_sem);
-}
 
 static inline void reiserfs_mark_inode_private(struct inode *inode)
 {
@@ -88,10 +71,6 @@ static inline void reiserfs_mark_inode_p
 #define reiserfs_setxattr NULL
 #define reiserfs_listxattr NULL
 #define reiserfs_removexattr NULL
-#define reiserfs_write_lock_xattrs(sb)
-#define reiserfs_write_unlock_xattrs(sb)
-#define reiserfs_read_lock_xattrs(sb)
-#define reiserfs_read_unlock_xattrs(sb)
 
 #define reiserfs_permission NULL
 
