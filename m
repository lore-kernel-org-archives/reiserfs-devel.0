From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 02/11] reiserfs: simplify xattr internal file lookups/opens
Date: Mon, 20 Feb 2006 15:14:57 -0500
Message-ID: <20060220201457.GA23228@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28107-reiserfs=m.gmane.org@namesys.com>
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


 The xattr file open/lookup code is needlessly complex. We can use vfs-level
 operations to perform the same work, and also simplify the locking
 constraints. The locking advantages will be exploited in future patches.

 fs/reiserfs/xattr.c |  269 ++++++++++++++++++----------------------------------
 1 files changed, 98 insertions(+), 171 deletions(-)

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/xattr.c linux-2.6.15-staging2/fs/reiserfs/xattr.c
--- linux-2.6.15-staging1/fs/reiserfs/xattr.c	2006-02-13 14:21:02.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/xattr.c	2006-02-13 14:21:02.000000000 -0500
@@ -46,217 +46,143 @@
 #include <linux/stat.h>
 #include <asm/semaphore.h>
 
-#define FL_READONLY 128
-#define FL_DIR_SEM_HELD 256
 #define PRIVROOT_NAME ".reiserfs_priv"
 #define XAROOT_NAME   "xattrs"
 
 static struct reiserfs_xattr_handler *find_xattr_handler_prefix(const char
 								*prefix);
 
-static struct dentry *create_xa_root(struct super_block *sb)
+/* Opens the directory corresponding to the inode's extended attribute store.
+ * If flags allow, the tree to the directory may be created. If creation is
+ * prohibited, -ENODATA is returned. */
+static struct dentry *open_xa_dir(const struct inode *inode, int flags)
 {
-	struct dentry *privroot = dget(REISERFS_SB(sb)->priv_root);
-	struct dentry *xaroot;
+	struct dentry *xaroot, *xadir;
+	char namebuf[17];		/* 8 for oid, 8 for gen, 1 for NUL */
+	struct dentry *privroot = dget(REISERFS_SB(inode->i_sb)->priv_root);
+	int create_ok = (!flags || flags & XATTR_CREATE);
+	int err = 0;
 
-	/* This needs to be created at mount-time */
+	/* We don't create the privroot */
 	if (!privroot)
-		return ERR_PTR(-EOPNOTSUPP);
+		return ERR_PTR(-ENODATA);
 
-	xaroot = lookup_one_len(XAROOT_NAME, privroot, strlen(XAROOT_NAME));
-	if (IS_ERR(xaroot)) {
-		goto out;
-	} else if (!xaroot->d_inode) {
-		int err;
-		mutex_lock(&privroot->d_inode->i_mutex);
-		err =
-		    privroot->d_inode->i_op->mkdir(privroot->d_inode, xaroot,
-						   0700);
-		mutex_unlock(&privroot->d_inode->i_mutex);
+	xaroot = dget(REISERFS_SB(inode->i_sb)->xattr_root);
 
-		if (err) {
-			dput(xaroot);
-			dput(privroot);
-			return ERR_PTR(err);
+	if (!xaroot) {
+		mutex_lock(&privroot->d_inode->i_mutex);
+		xaroot = lookup_one_len(XAROOT_NAME, privroot,
+		                        strlen(XAROOT_NAME));
+		if (IS_ERR(xaroot)) {
+			mutex_unlock(&privroot->d_inode->i_mutex);
+			err = PTR_ERR(xaroot);
+			goto out_err;
 		}
-		REISERFS_SB(sb)->xattr_root = dget(xaroot);
-	}
-
-      out:
-	dput(privroot);
-	return xaroot;
-}
-
-/* This will return a dentry, or error, refering to the xa root directory.
- * If the xa root doesn't exist yet, the dentry will be returned without
- * an associated inode. This dentry can be used with ->mkdir to create
- * the xa directory. */
-static struct dentry *__get_xa_root(struct super_block *s)
-{
-	struct dentry *privroot = dget(REISERFS_SB(s)->priv_root);
-	struct dentry *xaroot = NULL;
+		if (!xaroot->d_inode) {
+			if (!create_ok) {
+				mutex_unlock(&privroot->d_inode->i_mutex);
+				err = -ENODATA;
+				goto out_err;
+			}
 
-	if (IS_ERR(privroot) || !privroot)
-		return privroot;
+			err = vfs_mkdir(privroot->d_inode, xaroot, 0700);
+			if (err) {
+				mutex_unlock(&privroot->d_inode->i_mutex);
+				goto out_err;
+			}
+		}
 
-	xaroot = lookup_one_len(XAROOT_NAME, privroot, strlen(XAROOT_NAME));
-	if (IS_ERR(xaroot)) {
-		goto out;
-	} else if (!xaroot->d_inode) {
-		dput(xaroot);
-		xaroot = NULL;
-		goto out;
+		REISERFS_SB(inode->i_sb)->xattr_root = dget(xaroot);
+		mutex_unlock(&privroot->d_inode->i_mutex);
 	}
 
-	REISERFS_SB(s)->xattr_root = dget(xaroot);
-
-      out:
-	dput(privroot);
-	return xaroot;
-}
-
-/* Returns the dentry (or NULL) referring to the root of the extended
- * attribute directory tree. If it has already been retrieved, it is used.
- * Otherwise, we attempt to retrieve it from disk. It may also return
- * a pointer-encoded error.
- */
-static inline struct dentry *get_xa_root(struct super_block *s)
-{
-	struct dentry *dentry = dget(REISERFS_SB(s)->xattr_root);
+	snprintf (namebuf, sizeof (namebuf), "%X.%X",
+	          le32_to_cpu(INODE_PKEY(inode)->k_objectid),
+		  inode->i_generation);
 
-	if (!dentry)
-		dentry = __get_xa_root(s);
+	mutex_lock(&xaroot->d_inode->i_mutex);
 
-	return dentry;
-}
-
-/* Opens the directory corresponding to the inode's extended attribute store.
- * If flags allow, the tree to the directory may be created. If creation is
- * prohibited, -ENODATA is returned. */
-static struct dentry *open_xa_dir(const struct inode *inode, int flags)
-{
-	struct dentry *xaroot, *xadir;
-	char namebuf[17];
-
-	xaroot = get_xa_root(inode->i_sb);
-	if (IS_ERR(xaroot)) {
-		return xaroot;
-	} else if (!xaroot) {
-		if (flags == 0 || flags & XATTR_CREATE) {
-			xaroot = create_xa_root(inode->i_sb);
-			if (IS_ERR(xaroot))
-				return xaroot;
-		}
-		if (!xaroot)
-			return ERR_PTR(-ENODATA);
-	}
-
-	/* ok, we have xaroot open */
-
-	snprintf(namebuf, sizeof(namebuf), "%X.%X",
-		 le32_to_cpu(INODE_PKEY(inode)->k_objectid),
-		 inode->i_generation);
 	xadir = lookup_one_len(namebuf, xaroot, strlen(namebuf));
 	if (IS_ERR(xadir)) {
-		dput(xaroot);
-		return xadir;
+		mutex_unlock(&xaroot->d_inode->i_mutex);
+		err = PTR_ERR(xadir);
+		goto out_err;
 	}
 
 	if (!xadir->d_inode) {
-		int err;
-		if (flags == 0 || flags & XATTR_CREATE) {
-			/* Although there is nothing else trying to create this directory,
-			 * another directory with the same hash may be created, so we need
-			 * to protect against that */
-			err =
-			    xaroot->d_inode->i_op->mkdir(xaroot->d_inode, xadir,
-							 0700);
-			if (err) {
-				dput(xaroot);
-				dput(xadir);
-				return ERR_PTR(err);
-			}
+		if (!create_ok) {
+			dput(xadir);
+			mutex_unlock(&xaroot->d_inode->i_mutex);
+			err = -ENODATA;
+			goto out_err;
 		}
-		if (!xadir->d_inode) {
-			dput(xaroot);
+
+		err = vfs_mkdir(xaroot->d_inode, xadir, 0700);
+		if (err) {
 			dput(xadir);
-			return ERR_PTR(-ENODATA);
+			mutex_unlock(&xaroot->d_inode->i_mutex);
+			goto out_err;
 		}
 	}
+	mutex_unlock(&xaroot->d_inode->i_mutex);
 
+      out:
 	dput(xaroot);
+	dput(privroot);
 	return xadir;
+
+      out_err:
+	xadir = ERR_PTR(err);
+	goto out;
 }
 
 /* Returns a dentry corresponding to a specific extended attribute file
  * for the inode. If flags allow, the file is created. Otherwise, a
  * valid or negative dentry, or an error is returned. */
-static struct dentry *get_xa_file_dentry(const struct inode *inode,
-					 const char *name, int flags)
+static struct file *open_xattr_file(const struct inode *inode,
+                                    const char *name, int flags)
 {
 	struct dentry *xadir, *xafile;
 	int err = 0;
 
 	xadir = open_xa_dir(inode, flags);
-	if (IS_ERR(xadir)) {
-		return ERR_PTR(PTR_ERR(xadir));
-	} else if (xadir && !xadir->d_inode) {
-		dput(xadir);
-		return ERR_PTR(-ENODATA);
-	}
+	if (IS_ERR(xadir))
+		return (struct file *)xadir;
 
-	xafile = lookup_one_len(name, xadir, strlen(name));
-	if (IS_ERR(xafile)) {
-		dput(xadir);
-		return ERR_PTR(PTR_ERR(xafile));
-	}
+	BUG_ON(!xadir->d_inode);
 
-	if (xafile->d_inode) {	/* file exists */
-		if (flags & XATTR_CREATE) {
-			err = -EEXIST;
-			dput(xafile);
-			goto out;
-		}
-	} else if (flags & XATTR_REPLACE || flags & FL_READONLY) {
-		goto out;
-	} else {
-		/* inode->i_mutex is down, so nothing else can try to create
-		 * the same xattr */
-		err = xadir->d_inode->i_op->create(xadir->d_inode, xafile,
-						   0700 | S_IFREG, NULL);
+	mutex_lock(&xadir->d_inode->i_mutex);
 
-		if (err) {
-			dput(xafile);
-			goto out;
-		}
+	xafile = lookup_one_len (name, xadir, strlen(name));
+	if (IS_ERR(xafile)) {
+		err = PTR_ERR(xafile);
+		goto out_err;
 	}
 
-      out:
-	dput(xadir);
-	if (err)
-		xafile = ERR_PTR(err);
-	return xafile;
-}
+	err = -EEXIST;
+	if (xafile->d_inode && flags & XATTR_CREATE)
+		goto out_err;
 
-/* Opens a file pointer to the attribute associated with inode */
-static struct file *open_xa_file(const struct inode *inode, const char *name,
-				 int flags)
-{
-	struct dentry *xafile;
-	struct file *fp;
+	if (!xafile->d_inode) {
+		err = -ENODATA;
+		if (flags & XATTR_REPLACE)
+			goto out_err;
 
-	xafile = get_xa_file_dentry(inode, name, flags);
-	if (IS_ERR(xafile))
-		return ERR_PTR(PTR_ERR(xafile));
-	else if (!xafile->d_inode) {
-		dput(xafile);
-		return ERR_PTR(-ENODATA);
+		err = vfs_create(xadir->d_inode, xafile, 0700|S_IFREG, NULL);
+		if (err)
+			goto out_err;
 	}
 
-	fp = dentry_open(xafile, NULL, O_RDWR);
-	/* dentry_open dputs the dentry if it fails */
+	dput(xadir);
+	mutex_unlock(&xadir->d_inode->i_mutex);
+
+	return dentry_open(xafile, NULL, O_RDWR);
 
-	return fp;
+      out_err:
+     	mutex_unlock(&xadir->d_inode->i_mutex);
+     	dput(xafile);
+	dput(xadir);
+	return ERR_PTR(err);
 }
 
 /*
@@ -478,7 +404,7 @@ reiserfs_xattr_set(struct inode *inode, 
 	}
 
       open_file:
-	fp = open_xa_file(inode, name, flags);
+	fp = open_xattr_file(inode, name, flags);
 	if (IS_ERR(fp)) {
 		err = PTR_ERR(fp);
 		goto out;
@@ -583,7 +509,7 @@ reiserfs_xattr_get(const struct inode *i
 	if (get_inode_sd_version(inode) == STAT_DATA_V1)
 		return -EOPNOTSUPP;
 
-	fp = open_xa_file(inode, name, FL_READONLY);
+	fp = open_xattr_file(inode, name, XATTR_REPLACE);
 	if (IS_ERR(fp)) {
 		err = PTR_ERR(fp);
 		goto out;
@@ -631,6 +557,7 @@ reiserfs_xattr_get(const struct inode *i
 				 "Invalid hash for xattr (%s) associated "
 				 "with %k", name, INODE_PKEY(inode));
 		err = -EIO;
+		goto out_dput;
 	}
 
       out_dput:
@@ -673,9 +600,7 @@ __reiserfs_xattr_del(struct dentry *xadi
 		return -EIO;
 	}
 
-	err = dir->i_op->unlink(dir, dentry);
-	if (!err)
-		d_delete(dentry);
+	err = vfs_unlink(xadir->d_inode, dentry);
 
       out_file:
 	dput(dentry);
@@ -689,7 +614,7 @@ int reiserfs_xattr_del(struct inode *ino
 	struct dentry *dir;
 	int err;
 
-	dir = open_xa_dir(inode, FL_READONLY);
+	dir = open_xa_dir(inode, XATTR_REPLACE);
 	if (IS_ERR(dir)) {
 		err = PTR_ERR(dir);
 		goto out;
@@ -735,7 +660,7 @@ int reiserfs_delete_xattrs(struct inode 
 		return 0;
 	}
 	reiserfs_read_lock_xattrs(inode->i_sb);
-	dir = open_xa_dir(inode, FL_READONLY);
+	dir = open_xa_dir(inode, XATTR_REPLACE);
 	reiserfs_read_unlock_xattrs(inode->i_sb);
 	if (IS_ERR(dir)) {
 		err = PTR_ERR(dir);
@@ -761,9 +686,11 @@ int reiserfs_delete_xattrs(struct inode 
 
 	/* Leftovers besides . and .. -- that's not good. */
 	if (dir->d_inode->i_nlink <= 2) {
-		root = get_xa_root(inode->i_sb);
+		root = dget(REISERFS_SB(inode->i_sb)->xattr_root);
 		reiserfs_write_lock_xattrs(inode->i_sb);
+		mutex_lock(&root->d_inode->i_mutex);
 		err = vfs_rmdir(root->d_inode, dir);
+		mutex_unlock(&root->d_inode->i_mutex);
 		reiserfs_write_unlock_xattrs(inode->i_sb);
 		dput(root);
 	} else {
@@ -828,7 +755,7 @@ int reiserfs_chown_xattrs(struct inode *
 		return 0;
 	}
 	reiserfs_read_lock_xattrs(inode->i_sb);
-	dir = open_xa_dir(inode, FL_READONLY);
+	dir = open_xa_dir(inode, XATTR_REPLACE);
 	reiserfs_read_unlock_xattrs(inode->i_sb);
 	if (IS_ERR(dir)) {
 		if (PTR_ERR(dir) != -ENODATA)
@@ -1025,7 +952,7 @@ ssize_t reiserfs_listxattr(struct dentry
 
 	reiserfs_read_lock_xattr_i(dentry->d_inode);
 	reiserfs_read_lock_xattrs(dentry->d_sb);
-	dir = open_xa_dir(dentry->d_inode, FL_READONLY);
+	dir = open_xa_dir(dentry->d_inode, XATTR_REPLACE);
 	reiserfs_read_unlock_xattrs(dentry->d_sb);
 	if (IS_ERR(dir)) {
 		err = PTR_ERR(dir);
