From: Jeffrey Mahoney <jeffm@novell.com>
Subject: [PATCH 5/5] reiserfs: cleaning up const checks
Date: Sat, 20 Nov 2004 19:13:47 -0500
Message-ID: <20041121001347.GF979@locomotive.unixthugs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22456-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: ReiserFS List <reiserfs-list@namesys.com>

This patch cleans up some warnings in the const qualifiers introduced by
the reiserfs/selinux patches.

Signed-off-by: Jeff Mahoney <jeffm@novell.com>

diff -ruNpX dontdiff linux-2.6.9/fs/reiserfs/xattr.c linux-2.6.9.selinux/fs=
/reiserfs/xattr.c
--- linux-2.6.9/fs/reiserfs/xattr.c	2004-11-19 14:40:53.000000000 -0500
+++ linux-2.6.9.selinux/fs/reiserfs/xattr.c	2004-11-20 18:03:57.523322224 -=
0500
@@ -134,7 +134,7 @@ get_xa_root (struct super_block *s)
  * If flags allow, the tree to the directory may be created. If creation is
  * prohibited, -ENODATA is returned. */
 static struct dentry *
-open_xa_dir (const struct inode *inode, int flags)
+open_xa_dir (struct inode *inode, int flags)
 {
     struct dentry *xaroot, *xadir;
     char namebuf[17];
@@ -193,7 +193,7 @@ open_xa_dir (const struct inode *inode,=20
  * for the inode. If flags allow, the file is created. Otherwise, a
  * valid or negative dentry, or an error is returned. */
 static struct dentry *
-get_xa_file_dentry (const struct inode *inode, const char *name, int flags)
+get_xa_file_dentry (struct inode *inode, const char *name, int flags)
 {
     struct dentry *xadir, *xafile;
     int err =3D 0;
@@ -244,7 +244,7 @@ out:
=20
 /* Opens a file pointer to the attribute associated with inode */
 static struct file *
-open_xa_file (const struct inode *inode, const char *name, int flags)
+open_xa_file (struct inode *inode, const char *name, int flags)
 {
     struct dentry *xafile;
     struct file *fp;
@@ -610,7 +610,7 @@ out:
  * inode->i_sem: down
  */
 int
-reiserfs_xattr_get (const struct inode *inode, const char *name, void *buf=
fer,
+reiserfs_xattr_get (struct inode *inode, const char *name, void *buffer,
                     size_t buffer_size)
 {
     ssize_t err =3D 0;
diff -ruNpX dontdiff linux-2.6.9/include/linux/reiserfs_xattr.h linux-2.6.9=
=2Eselinux/include/linux/reiserfs_xattr.h
--- linux-2.6.9/include/linux/reiserfs_xattr.h	2004-08-14 01:38:11.00000000=
0 -0400
+++ linux-2.6.9.selinux/include/linux/reiserfs_xattr.h	2004-11-20 17:00:26.=
000000000 -0500
@@ -46,7 +47,7 @@ int reiserfs_permission (struct inode *i
 int reiserfs_permission_locked (struct inode *inode, int mask, struct name=
idata *nd);
=20
 int reiserfs_xattr_del (struct inode *, const char *);
-int reiserfs_xattr_get (const struct inode *, const char *, void *, size_t=
);
+int reiserfs_xattr_get (struct inode *, const char *, void *, size_t);
 int reiserfs_xattr_set (struct inode *, const char *, const void *,
                                size_t, int);
=20
--=20
Jeff Mahoney
SuSE Labs
