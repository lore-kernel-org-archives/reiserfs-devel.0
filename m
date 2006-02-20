From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 03/11] reiserfs: eliminate per-super xattr lock
Date: Mon, 20 Feb 2006 15:14:58 -0500
Message-ID: <20060220201458.GA23240@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28100-reiserfs=m.gmane.org@namesys.com>
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


 With the switch to using inode->i_mutex locking during lookups/creation in
 the xattr root, the per-super xattr lock is no longer needed.

 This patch removes it.

 fs/reiserfs/inode.c            |   12 ------
 fs/reiserfs/namei.c            |   29 ----------------
 fs/reiserfs/super.c            |    2 -
 fs/reiserfs/xattr.c            |   44 ++++--------------------
 fs/reiserfs/xattr_acl.c        |   74 ++++++++++++++++++-----------------------
 include/linux/reiserfs_fs.h    |    3 -
 include/linux/reiserfs_fs_sb.h |    1 
 include/linux/reiserfs_xattr.h |   18 ---------
 8 files changed, 42 insertions(+), 141 deletions(-)

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/inode.c linux-2.6.15-staging2/fs/reiserfs/inode.c
--- linux-2.6.15-staging1/fs/reiserfs/inode.c	2006-02-13 11:06:53.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/inode.c	2006-02-13 14:21:04.000000000 -0500
@@ -1987,17 +1987,7 @@ int reiserfs_new_inode(struct reiserfs_t
       out_inserted_sd:
 	inode->i_nlink = 0;
 	th->t_trans_id = 0;	/* so the caller can't use this handle later */
-
-	/* If we were inheriting an ACL, we need to release the lock so that
-	 * iput doesn't deadlock in reiserfs_delete_xattrs. The locking
-	 * code really needs to be reworked, but this will take care of it
-	 * for now. -jeffm */
-	if (REISERFS_I(dir)->i_acl_default && !IS_ERR(REISERFS_I(dir)->i_acl_default)) {
-		reiserfs_write_unlock_xattrs(dir->i_sb);
-		iput(inode);
-		reiserfs_write_lock_xattrs(dir->i_sb);
-	} else
-		iput(inode);
+	iput(inode);
 	return err;
 }
 
diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/namei.c linux-2.6.15-staging2/fs/reiserfs/namei.c
--- linux-2.6.15-staging1/fs/reiserfs/namei.c	2006-02-13 11:06:53.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/namei.c	2006-02-13 14:21:04.000000000 -0500
@@ -626,9 +626,6 @@ static int reiserfs_create(struct inode 
 
 	reiserfs_write_lock(dir->i_sb);
 
-	if (locked)
-		reiserfs_write_lock_xattrs(dir->i_sb);
-
 	retval = journal_begin(&th, dir->i_sb, jbegin_count);
 	if (retval) {
 		drop_new_inode(inode);
@@ -641,11 +638,6 @@ static int reiserfs_create(struct inode 
 	if (retval)
 		goto out_failed;
 
-	if (locked) {
-		reiserfs_write_unlock_xattrs(dir->i_sb);
-		locked = 0;
-	}
-
 	inode->i_op = &reiserfs_file_inode_operations;
 	inode->i_fop = &reiserfs_file_operations;
 	inode->i_mapping->a_ops = &reiserfs_address_space_operations;
@@ -670,8 +662,6 @@ static int reiserfs_create(struct inode 
 	retval = journal_end(&th, dir->i_sb, jbegin_count);
 
       out_failed:
-	if (locked)
-		reiserfs_write_unlock_xattrs(dir->i_sb);
 	reiserfs_write_unlock(dir->i_sb);
 	return retval;
 }
@@ -701,9 +691,6 @@ static int reiserfs_mknod(struct inode *
 
 	reiserfs_write_lock(dir->i_sb);
 
-	if (locked)
-		reiserfs_write_lock_xattrs(dir->i_sb);
-
 	retval = journal_begin(&th, dir->i_sb, jbegin_count);
 	if (retval) {
 		drop_new_inode(inode);
@@ -717,11 +704,6 @@ static int reiserfs_mknod(struct inode *
 		goto out_failed;
 	}
 
-	if (locked) {
-		reiserfs_write_unlock_xattrs(dir->i_sb);
-		locked = 0;
-	}
-
 	inode->i_op = &reiserfs_special_inode_operations;
 	init_special_inode(inode, inode->i_mode, rdev);
 
@@ -749,8 +731,6 @@ static int reiserfs_mknod(struct inode *
 	retval = journal_end(&th, dir->i_sb, jbegin_count);
 
       out_failed:
-	if (locked)
-		reiserfs_write_unlock_xattrs(dir->i_sb);
 	reiserfs_write_unlock(dir->i_sb);
 	return retval;
 }
@@ -780,8 +760,6 @@ static int reiserfs_mkdir(struct inode *
 	locked = reiserfs_cache_default_acl(dir);
 
 	reiserfs_write_lock(dir->i_sb);
-	if (locked)
-		reiserfs_write_lock_xattrs(dir->i_sb);
 
 	retval = journal_begin(&th, dir->i_sb, jbegin_count);
 	if (retval) {
@@ -803,11 +781,6 @@ static int reiserfs_mkdir(struct inode *
 		goto out_failed;
 	}
 
-	if (locked) {
-		reiserfs_write_unlock_xattrs(dir->i_sb);
-		locked = 0;
-	}
-
 	reiserfs_update_inode_transaction(inode);
 	reiserfs_update_inode_transaction(dir);
 
@@ -835,8 +808,6 @@ static int reiserfs_mkdir(struct inode *
 	d_instantiate(dentry, inode);
 	retval = journal_end(&th, dir->i_sb, jbegin_count);
       out_failed:
-	if (locked)
-		reiserfs_write_unlock_xattrs(dir->i_sb);
 	reiserfs_write_unlock(dir->i_sb);
 	return retval;
 }
diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/super.c linux-2.6.15-staging2/fs/reiserfs/super.c
--- linux-2.6.15-staging1/fs/reiserfs/super.c	2006-02-13 11:07:03.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/super.c	2006-02-13 14:21:04.000000000 -0500
@@ -1696,8 +1696,6 @@ static int reiserfs_fill_super(struct su
 	REISERFS_SB(s)->s_alloc_options.preallocmin = 0;
 	/* Preallocate by 16 blocks (17-1) at once */
 	REISERFS_SB(s)->s_alloc_options.preallocsize = 17;
-	/* Initialize the rwsem for xattr dir */
-	init_rwsem(&REISERFS_SB(s)->xattr_dir_sem);
 
 	/* setup default block allocator options */
 	reiserfs_init_alloc_options(s);
diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/xattr_acl.c linux-2.6.15-staging2/fs/reiserfs/xattr_acl.c
--- linux-2.6.15-staging1/fs/reiserfs/xattr_acl.c	2006-02-13 11:07:44.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/xattr_acl.c	2006-02-13 14:21:04.000000000 -0500
@@ -172,6 +172,29 @@ static void *posix_acl_to_disk(const str
 	return ERR_PTR(-EINVAL);
 }
 
+static inline void iset_acl(struct inode *inode, struct posix_acl **i_acl,
+                            struct posix_acl *acl)
+{
+	spin_lock(&inode->i_lock);
+	if (*i_acl != ERR_PTR(-ENODATA))
+		posix_acl_release(*i_acl);
+	*i_acl = posix_acl_dup(acl);
+	spin_unlock(&inode->i_lock);
+}
+
+static inline struct posix_acl *iget_acl(struct inode *inode,
+                                         struct posix_acl **i_acl)
+{
+	struct posix_acl *acl = ERR_PTR(-ENODATA);
+
+	spin_lock(&inode->i_lock);
+	if (*i_acl != ERR_PTR(-ENODATA))
+		acl = posix_acl_dup(*i_acl);
+	spin_unlock(&inode->i_lock);
+
+	return acl;
+}
+
 /*
  * Inode operation get_posix_acl().
  *
@@ -199,11 +222,11 @@ struct posix_acl *reiserfs_get_acl(struc
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (IS_ERR(*p_acl)) {
-		if (PTR_ERR(*p_acl) == -ENODATA)
-			return NULL;
-	} else if (*p_acl != NULL)
-		return posix_acl_dup(*p_acl);
+	acl = iget_acl(inode, p_acl);
+	if (acl && !IS_ERR(acl))
+		return acl;
+	else if (PTR_ERR(acl) == -ENODATA)
+		return NULL;
 
 	size = reiserfs_xattr_get(inode, name, NULL, 0);
 	if ((int)size < 0) {
@@ -229,7 +252,7 @@ struct posix_acl *reiserfs_get_acl(struc
 	} else {
 		acl = posix_acl_from_disk(value, retval);
 		if (!IS_ERR(acl))
-			*p_acl = posix_acl_dup(acl);
+			iset_acl(inode, p_acl, acl);
 	}
 
 	kfree(value);
@@ -300,16 +323,8 @@ reiserfs_set_acl(struct inode *inode, in
 
 	kfree(value);
 
-	if (!error) {
-		/* Release the old one */
-		if (!IS_ERR(*p_acl) && *p_acl)
-			posix_acl_release(*p_acl);
-
-		if (acl == NULL)
-			*p_acl = ERR_PTR(-ENODATA);
-		else
-			*p_acl = posix_acl_dup(acl);
-	}
+	if (!error)
+		iset_acl(inode, p_acl, acl);
 
 	return error;
 }
@@ -404,9 +419,7 @@ int reiserfs_cache_default_acl(struct in
 	if (reiserfs_posixacl(inode->i_sb) && !is_reiserfs_priv_object(inode)) {
 		struct posix_acl *acl;
 		reiserfs_read_lock_xattr_i(inode);
-		reiserfs_read_lock_xattrs(inode->i_sb);
 		acl = reiserfs_get_acl(inode, ACL_TYPE_DEFAULT);
-		reiserfs_read_unlock_xattrs(inode->i_sb);
 		reiserfs_read_unlock_xattr_i(inode);
 		ret = acl ? 1 : 0;
 		posix_acl_release(acl);
@@ -428,9 +441,7 @@ int reiserfs_acl_chmod(struct inode *ino
 		return 0;
 	}
 
-	reiserfs_read_lock_xattrs(inode->i_sb);
 	acl = reiserfs_get_acl(inode, ACL_TYPE_ACCESS);
-	reiserfs_read_unlock_xattrs(inode->i_sb);
 	if (!acl)
 		return 0;
 	if (IS_ERR(acl))
@@ -441,17 +452,8 @@ int reiserfs_acl_chmod(struct inode *ino
 		return -ENOMEM;
 	error = posix_acl_chmod_masq(clone, inode->i_mode);
 	if (!error) {
-		int lock = !has_xattr_dir(inode);
 		reiserfs_write_lock_xattr_i(inode);
-		if (lock)
-			reiserfs_write_lock_xattrs(inode->i_sb);
-		else
-			reiserfs_read_lock_xattrs(inode->i_sb);
 		error = reiserfs_set_acl(inode, ACL_TYPE_ACCESS, clone);
-		if (lock)
-			reiserfs_write_unlock_xattrs(inode->i_sb);
-		else
-			reiserfs_read_unlock_xattrs(inode->i_sb);
 		reiserfs_write_unlock_xattr_i(inode);
 	}
 	posix_acl_release(clone);
@@ -479,14 +481,9 @@ posix_acl_access_set(struct inode *inode
 static int posix_acl_access_del(struct inode *inode, const char *name)
 {
 	struct reiserfs_inode_info *reiserfs_i = REISERFS_I(inode);
-	struct posix_acl **acl = &reiserfs_i->i_acl_access;
 	if (strlen(name) != sizeof(POSIX_ACL_XATTR_ACCESS) - 1)
 		return -EINVAL;
-	if (!IS_ERR(*acl) && *acl) {
-		posix_acl_release(*acl);
-		*acl = ERR_PTR(-ENODATA);
-	}
-
+	iset_acl(inode, &reiserfs_i->i_acl_access, ERR_PTR(-ENODATA));
 	return 0;
 }
 
@@ -532,14 +529,9 @@ posix_acl_default_set(struct inode *inod
 static int posix_acl_default_del(struct inode *inode, const char *name)
 {
 	struct reiserfs_inode_info *reiserfs_i = REISERFS_I(inode);
-	struct posix_acl **acl = &reiserfs_i->i_acl_default;
 	if (strlen(name) != sizeof(POSIX_ACL_XATTR_DEFAULT) - 1)
 		return -EINVAL;
-	if (!IS_ERR(*acl) && *acl) {
-		posix_acl_release(*acl);
-		*acl = ERR_PTR(-ENODATA);
-	}
-
+	iset_acl(inode, &reiserfs_i->i_acl_default, ERR_PTR(-ENODATA));
 	return 0;
 }
 
diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/xattr.c linux-2.6.15-staging2/fs/reiserfs/xattr.c
--- linux-2.6.15-staging1/fs/reiserfs/xattr.c	2006-02-13 14:21:04.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/xattr.c	2006-02-13 14:21:04.000000000 -0500
@@ -27,6 +27,12 @@
  * these are special cases for filesystem ACLs, they are interpreted by the
  * kernel, in addition, they are negatively and positively cached and attached
  * to the inode so that unnecessary lookups are avoided.
+ *
+ * Locking works like so:
+ * The xattr root (/.reiserfs_priv/xattrs) is protected by its i_mutex.
+ * The xattr dir (/.reiserfs_priv/xattrs/<oid>.<gen>) is protected by
+ * inode->xattr_sem.
+ * The xattrs themselves are likewise protected by the xattr_sem.
  */
 
 #include <linux/reiserfs_fs.h>
@@ -139,6 +145,7 @@ static struct dentry *open_xa_dir(const 
 /* Returns a dentry corresponding to a specific extended attribute file
  * for the inode. If flags allow, the file is created. Otherwise, a
  * valid or negative dentry, or an error is returned. */
+/* We don't down xadir->i_mutex because inode->xattr_sem covers it */
 static struct file *open_xattr_file(const struct inode *inode,
                                     const char *name, int flags)
 {
@@ -151,8 +158,6 @@ static struct file *open_xattr_file(cons
 
 	BUG_ON(!xadir->d_inode);
 
-	mutex_lock(&xadir->d_inode->i_mutex);
-
 	xafile = lookup_one_len (name, xadir, strlen(name));
 	if (IS_ERR(xafile)) {
 		err = PTR_ERR(xafile);
@@ -174,12 +179,10 @@ static struct file *open_xattr_file(cons
 	}
 
 	dput(xadir);
-	mutex_unlock(&xadir->d_inode->i_mutex);
 
 	return dentry_open(xafile, NULL, O_RDWR);
 
       out_err:
-     	mutex_unlock(&xadir->d_inode->i_mutex);
      	dput(xafile);
 	dput(xadir);
 	return ERR_PTR(err);
@@ -350,16 +353,12 @@ int xattr_readdir(struct file *file, fil
 	int res = -ENOTDIR;
 	if (!file->f_op || !file->f_op->readdir)
 		goto out;
-	mutex_lock(&inode->i_mutex);
-//        down(&inode->i_zombie);
 	res = -ENOENT;
 	if (!IS_DEADDIR(inode)) {
 		lock_kernel();
 		res = __xattr_readdir(file, buf, filler);
 		unlock_kernel();
 	}
-//        up(&inode->i_zombie);
-	mutex_unlock(&inode->i_mutex);
       out:
 	return res;
 }
@@ -511,6 +510,7 @@ reiserfs_xattr_get(const struct inode *i
 
 	fp = open_xattr_file(inode, name, XATTR_REPLACE);
 	if (IS_ERR(fp)) {
+		up_read(&REISERFS_I(inode)->xattr_sem);
 		err = PTR_ERR(fp);
 		goto out;
 	}
@@ -659,9 +659,7 @@ int reiserfs_delete_xattrs(struct inode 
 	    !reiserfs_xattrs(inode->i_sb)) {
 		return 0;
 	}
-	reiserfs_read_lock_xattrs(inode->i_sb);
 	dir = open_xa_dir(inode, XATTR_REPLACE);
-	reiserfs_read_unlock_xattrs(inode->i_sb);
 	if (IS_ERR(dir)) {
 		err = PTR_ERR(dir);
 		goto out;
@@ -687,11 +685,9 @@ int reiserfs_delete_xattrs(struct inode 
 	/* Leftovers besides . and .. -- that's not good. */
 	if (dir->d_inode->i_nlink <= 2) {
 		root = dget(REISERFS_SB(inode->i_sb)->xattr_root);
-		reiserfs_write_lock_xattrs(inode->i_sb);
 		mutex_lock(&root->d_inode->i_mutex);
 		err = vfs_rmdir(root->d_inode, dir);
 		mutex_unlock(&root->d_inode->i_mutex);
-		reiserfs_write_unlock_xattrs(inode->i_sb);
 		dput(root);
 	} else {
 		reiserfs_warning(inode->i_sb,
@@ -754,9 +750,7 @@ int reiserfs_chown_xattrs(struct inode *
 	    !reiserfs_xattrs(inode->i_sb)) {
 		return 0;
 	}
-	reiserfs_read_lock_xattrs(inode->i_sb);
 	dir = open_xa_dir(inode, XATTR_REPLACE);
-	reiserfs_read_unlock_xattrs(inode->i_sb);
 	if (IS_ERR(dir)) {
 		if (PTR_ERR(dir) != -ENODATA)
 			err = PTR_ERR(dir);
@@ -801,7 +795,6 @@ int reiserfs_chown_xattrs(struct inode *
 
 /*
  * Inode operation getxattr()
- * Preliminary locking: we down dentry->d_inode->i_mutex
  */
 ssize_t
 reiserfs_getxattr(struct dentry * dentry, const char *name, void *buffer,
@@ -815,9 +808,7 @@ reiserfs_getxattr(struct dentry * dentry
 		return -EOPNOTSUPP;
 
 	reiserfs_read_lock_xattr_i(dentry->d_inode);
-	reiserfs_read_lock_xattrs(dentry->d_sb);
 	err = xah->get(dentry->d_inode, name, buffer, size);
-	reiserfs_read_unlock_xattrs(dentry->d_sb);
 	reiserfs_read_unlock_xattr_i(dentry->d_inode);
 	return err;
 }
@@ -833,23 +824,13 @@ reiserfs_setxattr(struct dentry *dentry,
 {
 	struct reiserfs_xattr_handler *xah = find_xattr_handler_prefix(name);
 	int err;
-	int lock;
 
 	if (!xah || !reiserfs_xattrs(dentry->d_sb) ||
 	    get_inode_sd_version(dentry->d_inode) == STAT_DATA_V1)
 		return -EOPNOTSUPP;
 
 	reiserfs_write_lock_xattr_i(dentry->d_inode);
-	lock = !has_xattr_dir(dentry->d_inode);
-	if (lock)
-		reiserfs_write_lock_xattrs(dentry->d_sb);
-	else
-		reiserfs_read_lock_xattrs(dentry->d_sb);
 	err = xah->set(dentry->d_inode, name, value, size, flags);
-	if (lock)
-		reiserfs_write_unlock_xattrs(dentry->d_sb);
-	else
-		reiserfs_read_unlock_xattrs(dentry->d_sb);
 	reiserfs_write_unlock_xattr_i(dentry->d_inode);
 	return err;
 }
@@ -869,8 +850,6 @@ int reiserfs_removexattr(struct dentry *
 		return -EOPNOTSUPP;
 
 	reiserfs_write_lock_xattr_i(dentry->d_inode);
-	reiserfs_read_lock_xattrs(dentry->d_sb);
-
 	/* Deletion pre-operation */
 	if (xah->del) {
 		err = xah->del(dentry->d_inode, name);
@@ -884,7 +863,6 @@ int reiserfs_removexattr(struct dentry *
 	mark_inode_dirty(dentry->d_inode);
 
       out:
-	reiserfs_read_unlock_xattrs(dentry->d_sb);
 	reiserfs_write_unlock_xattr_i(dentry->d_inode);
 	return err;
 }
@@ -933,8 +911,6 @@ reiserfs_listxattr_filler(void *buf, con
 
 /*
  * Inode operation listxattr()
- *
- * Preliminary locking: we down dentry->d_inode->i_mutex
  */
 ssize_t reiserfs_listxattr(struct dentry * dentry, char *buffer, size_t size)
 {
@@ -951,9 +927,7 @@ ssize_t reiserfs_listxattr(struct dentry
 		return -EOPNOTSUPP;
 
 	reiserfs_read_lock_xattr_i(dentry->d_inode);
-	reiserfs_read_lock_xattrs(dentry->d_sb);
 	dir = open_xa_dir(dentry->d_inode, XATTR_REPLACE);
-	reiserfs_read_unlock_xattrs(dentry->d_sb);
 	if (IS_ERR(dir)) {
 		err = PTR_ERR(dir);
 		if (err == -ENODATA)
@@ -1191,11 +1165,9 @@ static int reiserfs_check_acl(struct ino
 	int error = -EAGAIN; /* do regular unix permission checks by default */
 
 	reiserfs_read_lock_xattr_i(inode);
-	reiserfs_read_lock_xattrs(inode->i_sb);
 
 	acl = reiserfs_get_acl(inode, ACL_TYPE_ACCESS);
 
-	reiserfs_read_unlock_xattrs(inode->i_sb);
 	reiserfs_read_unlock_xattr_i(inode);
 
 	if (acl) {
diff -ruNpX ../dontdiff linux-2.6.15-staging1/include/linux/reiserfs_fs.h linux-2.6.15-staging2/include/linux/reiserfs_fs.h
--- linux-2.6.15-staging1/include/linux/reiserfs_fs.h	2006-02-13 11:06:54.000000000 -0500
+++ linux-2.6.15-staging2/include/linux/reiserfs_fs.h	2006-02-13 14:21:04.000000000 -0500
@@ -2180,7 +2180,4 @@ int reiserfs_ioctl(struct inode *inode, 
 #define reiserfs_write_lock( sb ) lock_kernel()
 #define reiserfs_write_unlock( sb ) unlock_kernel()
 
-/* xattr stuff */
-#define REISERFS_XATTR_DIR_SEM(s) (REISERFS_SB(s)->xattr_dir_sem)
-
 #endif				/* _LINUX_REISER_FS_H */
diff -ruNpX ../dontdiff linux-2.6.15-staging1/include/linux/reiserfs_fs_sb.h linux-2.6.15-staging2/include/linux/reiserfs_fs_sb.h
--- linux-2.6.15-staging1/include/linux/reiserfs_fs_sb.h	2006-02-13 11:06:54.000000000 -0500
+++ linux-2.6.15-staging2/include/linux/reiserfs_fs_sb.h	2006-02-13 14:21:04.000000000 -0500
@@ -402,7 +402,6 @@ struct reiserfs_sb_info {
 	spinlock_t bitmap_lock;	/* this lock on now only used to protect reserved_blocks variable */
 	struct dentry *priv_root;	/* root of /.reiserfs_priv */
 	struct dentry *xattr_root;	/* root of /.reiserfs_priv/.xa */
-	struct rw_semaphore xattr_dir_sem;
 
 	int j_errno;
 #ifdef CONFIG_QUOTA
diff -ruNpX ../dontdiff linux-2.6.15-staging1/include/linux/reiserfs_xattr.h linux-2.6.15-staging2/include/linux/reiserfs_xattr.h
--- linux-2.6.15-staging1/include/linux/reiserfs_xattr.h	2006-02-13 11:06:54.000000000 -0500
+++ linux-2.6.15-staging2/include/linux/reiserfs_xattr.h	2006-02-13 14:21:04.000000000 -0500
@@ -57,24 +57,6 @@ extern struct reiserfs_xattr_handler sec
 int reiserfs_xattr_register_handlers(void) __init;
 void reiserfs_xattr_unregister_handlers(void);
 
-static inline void reiserfs_write_lock_xattrs(struct super_block *sb)
-{
-	down_write(&REISERFS_XATTR_DIR_SEM(sb));
-}
-static inline void reiserfs_write_unlock_xattrs(struct super_block *sb)
-{
-	up_write(&REISERFS_XATTR_DIR_SEM(sb));
-}
-static inline void reiserfs_read_lock_xattrs(struct super_block *sb)
-{
-	down_read(&REISERFS_XATTR_DIR_SEM(sb));
-}
-
-static inline void reiserfs_read_unlock_xattrs(struct super_block *sb)
-{
-	up_read(&REISERFS_XATTR_DIR_SEM(sb));
-}
-
 static inline void reiserfs_write_lock_xattr_i(struct inode *inode)
 {
 	down_write(&REISERFS_I(inode)->xattr_sem);
