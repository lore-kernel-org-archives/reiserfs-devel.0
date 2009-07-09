From: Eugene Kapun <abacabadabacaba@gmail.com>
Subject: [PATCH 2/3] reiserfs: add mount option that disables extended attributes
 support
Date: Thu, 09 Jul 2009 22:05:09 +0400
Message-ID: <4A563155.8020904@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:x-enigmail-version
         :content-type:content-transfer-encoding;
        bh=ydy0DCgdsvUe/1wQo9Zv+XkpkqERbVagN8ccuEHQSv8=;
        b=iJQgAyKwjXQ+fPXxKM8CeCWWafqI7aGVZ6YzkXZ5bCjOs2atOb6k1V1HiAYL91HwQr
         idxbVfhN8z6APicCv1BsgDA12DlZF73RWgb/9s9/Fycm/KSkjeHRjHely9pgmNn2TlkZ
         TDEFfBv54X3WrYRKS1Cl4kvv5+MOQoilfV9Tw=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

From: Eugene Kapun <abacabadabacaba@gmail.com>

Adds mount option which disables extended attributes support for that
mount. This can be used to fix problems related to extended attributes
and to emulate old reiserfs behavior.
Signed-off-by: Eugene Kapun <abacabadabacaba@gmail.com>
---
This patch applies to linux-2.6.31-rc2-git4.
This patch depends on patch 1/3 (reiserfs: make extended attributes
support more configurable).
This patch adds option to mount ReiserFS partition without extended
attributes support. This can help if partition is otherwise unmountable
or is used with older kernels which don't support extended attributes
on ReiserFS.

 fs/reiserfs/dir.c              |    6 ++++--
 fs/reiserfs/super.c            |   13 ++++++++++++-
 fs/reiserfs/xattr.c            |   19 ++++++++++++++-----
 fs/reiserfs/xattr_acl.c        |    7 ++++++-
 include/linux/reiserfs_fs_sb.h |    2 ++
 5 files changed, 38 insertions(+), 9 deletions(-)

diff -uprN linux-2.6.31-rc2-git3.1/fs/reiserfs/dir.c linux-2.6.31-rc2-git3.2/fs/reiserfs/dir.c
--- linux-2.6.31-rc2-git3.1/fs/reiserfs/dir.c	2009-07-09 14:04:37.000000000 +0400
+++ linux-2.6.31-rc2-git3.2/fs/reiserfs/dir.c	2009-07-09 15:01:10.000000000 +0400
@@ -45,9 +45,11 @@ static inline bool is_privroot_deh(struc
 				   struct reiserfs_de_head *deh)
 {
 #ifdef CONFIG_REISERFS_FS_EXTENDED
-	struct dentry *privroot = REISERFS_SB(dir->d_sb)->priv_root;
-	if (reiserfs_expose_privroot(dir->d_sb))
+	struct dentry *privroot;
+	if (!reiserfs_extended(dir->d_sb) ||
+		reiserfs_expose_privroot(dir->d_sb))
 		return 0;
+	privroot = REISERFS_SB(dir->d_sb)->priv_root;
 	return (dir == dir->d_parent && privroot->d_inode &&
 	        deh->deh_objectid == INODE_PKEY(privroot->d_inode)->k_objectid);
 #else
diff -uprN linux-2.6.31-rc2-git3.1/fs/reiserfs/super.c linux-2.6.31-rc2-git3.2/fs/reiserfs/super.c
--- linux-2.6.31-rc2-git3.1/fs/reiserfs/super.c	2009-07-09 14:34:03.000000000 +0400
+++ linux-2.6.31-rc2-git3.2/fs/reiserfs/super.c	2009-07-09 15:03:10.000000000 +0400
@@ -445,7 +445,7 @@ int remove_save_link(struct inode *inode
 static void reiserfs_kill_sb(struct super_block *s)
 {
 #ifdef CONFIG_REISERFS_FS_EXTENDED
-	if (REISERFS_SB(s)) {
+	if (REISERFS_SB(s) && reiserfs_extended(s)) {
 		if (REISERFS_SB(s)->xattr_root) {
 			d_invalidate(REISERFS_SB(s)->xattr_root);
 			dput(REISERFS_SB(s)->xattr_root);
@@ -879,7 +879,15 @@ static int reiserfs_parse_options(struct
 		{"attrs",.setmask = 1 << REISERFS_ATTRS},
 		{"noattrs",.clrmask = 1 << REISERFS_ATTRS},
 #ifdef CONFIG_REISERFS_FS_EXTENDED
+		{"ext", .setmask = 1 << REISERFS_EXTENDED},
+		{"noext", .clrmask = 1 << REISERFS_EXTENDED},
 		{"expose_privroot", .setmask = 1 << REISERFS_EXPOSE_PRIVROOT},
+		{"noexpose_privroot", .clrmask = 1 << REISERFS_EXPOSE_PRIVROOT},
+#else
+		{"ext", .setmask = 1 << REISERFS_UNSUPPORTED_OPT},
+		{"noext", .clrmask = 1 << REISERFS_UNSUPPORTED_OPT},
+		{"expose_privroot", .setmask = 1 << REISERFS_UNSUPPORTED_OPT},
+		{"noexpose_privroot", .clrmask = 1 << REISERFS_UNSUPPORTED_OPT},
 #endif
 #ifdef CONFIG_REISERFS_FS_XATTR
 		{"user_xattr",.setmask = 1 << REISERFS_XATTRS_USER},
@@ -1627,6 +1635,9 @@ static int reiserfs_fill_super(struct su
 	/* Set default values for options: non-aggressive tails, RO on errors */
 	REISERFS_SB(s)->s_mount_opt |= (1 << REISERFS_SMALLTAIL);
 	REISERFS_SB(s)->s_mount_opt |= (1 << REISERFS_ERROR_RO);
+#ifdef CONFIG_REISERFS_FS_EXTENDED
+	REISERFS_SB(s)->s_mount_opt |= (1 << REISERFS_EXTENDED);
+#endif
 	/* no preallocation minimum, be smart in
 	   reiserfs_file_write instead */
 	REISERFS_SB(s)->s_alloc_options.preallocmin = 0;
diff -uprN linux-2.6.31-rc2-git3.1/fs/reiserfs/xattr_acl.c linux-2.6.31-rc2-git3.2/fs/reiserfs/xattr_acl.c
--- linux-2.6.31-rc2-git3.1/fs/reiserfs/xattr_acl.c	2009-07-09 14:01:57.000000000 +0400
+++ linux-2.6.31-rc2-git3.2/fs/reiserfs/xattr_acl.c	2009-07-09 15:03:58.000000000 +0400
@@ -328,6 +328,9 @@ reiserfs_inherit_default_acl(struct reis
 	struct posix_acl *acl;
 	int err = 0;
 
+	if (!reiserfs_extended(inode->i_sb))
+		return 0;
+
 	/* ACLs only get applied to files and directories */
 	if (S_ISLNK(inode->i_mode))
 		return 0;
@@ -414,7 +417,7 @@ int reiserfs_cache_default_acl(struct in
 	struct posix_acl *acl;
 	int nblocks = 0;
 
-	if (IS_PRIVATE(inode))
+	if (!reiserfs_extended(inode->i_sb) || IS_PRIVATE(inode))
 		return 0;
 
 	acl = reiserfs_get_acl(inode, ACL_TYPE_DEFAULT);
@@ -439,6 +442,8 @@ int reiserfs_cache_default_acl(struct in
 	return nblocks;
 }
 
+/* reiserfs_setattr already checks that
+ * POSIX ACLs are enabled before calling this */
 int reiserfs_acl_chmod(struct inode *inode)
 {
 	struct posix_acl *acl, *clone;
diff -uprN linux-2.6.31-rc2-git3.1/fs/reiserfs/xattr.c linux-2.6.31-rc2-git3.2/fs/reiserfs/xattr.c
--- linux-2.6.31-rc2-git3.1/fs/reiserfs/xattr.c	2009-07-09 14:15:03.000000000 +0400
+++ linux-2.6.31-rc2-git3.2/fs/reiserfs/xattr.c	2009-07-09 15:06:12.000000000 +0400
@@ -320,7 +320,10 @@ static int chown_one_xattr(struct dentry
 /* No i_mutex, but the inode is unconnected. */
 int reiserfs_delete_xattrs(struct inode *inode)
 {
-	int err = reiserfs_for_each_xattr(inode, delete_one_xattr, NULL);
+	int err;
+	if (!reiserfs_extended(inode->i_sb))
+		return 0;
+	err = reiserfs_for_each_xattr(inode, delete_one_xattr, NULL);
 	if (err)
 		reiserfs_warning(inode->i_sb, "jdm-20004",
 				 "Couldn't delete all xattrs (%d)\n", err);
@@ -330,7 +333,10 @@ int reiserfs_delete_xattrs(struct inode 
 /* inode->i_mutex: down */
 int reiserfs_chown_xattrs(struct inode *inode, struct iattr *attrs)
 {
-	int err = reiserfs_for_each_xattr(inode, chown_one_xattr, attrs);
+	int err;
+	if (!reiserfs_extended(inode->i_sb))
+		return 0;
+	err = reiserfs_for_each_xattr(inode, chown_one_xattr, attrs);
 	if (err)
 		reiserfs_warning(inode->i_sb, "jdm-20007",
 				 "Couldn't chown all xattrs (%d)\n", err);
@@ -976,7 +982,8 @@ int reiserfs_lookup_privroot(struct supe
 {
 	struct dentry *dentry;
 	int err = 0;
-
+	if (!reiserfs_extended(s))
+		return 0;
 	/* If we don't have the privroot located yet - go find it */
 	mutex_lock(&s->s_root->d_inode->i_mutex);
 	dentry = lookup_one_len(PRIVROOT_NAME, s->s_root,
@@ -1000,8 +1007,10 @@ int reiserfs_lookup_privroot(struct supe
 int reiserfs_xattr_init(struct super_block *s, int mount_flags)
 {
 	int err = 0;
-	struct dentry *privroot = REISERFS_SB(s)->priv_root;
-
+	struct dentry *privroot;
+	if (!reiserfs_extended(s))
+		return 0;
+	privroot = REISERFS_SB(s)->priv_root;
 	err = xattr_mount_check(s);
 	if (err)
 		goto error;
diff -uprN linux-2.6.31-rc2-git3.1/include/linux/reiserfs_fs_sb.h linux-2.6.31-rc2-git3.2/include/linux/reiserfs_fs_sb.h
--- linux-2.6.31-rc2-git3.1/include/linux/reiserfs_fs_sb.h	2009-07-09 14:18:49.000000000 +0400
+++ linux-2.6.31-rc2-git3.2/include/linux/reiserfs_fs_sb.h	2009-07-09 15:06:59.000000000 +0400
@@ -454,6 +454,7 @@ enum reiserfs_mount_options {
 	REISERFS_HASHED_RELOCATION,
 	REISERFS_ATTRS,
 #ifdef CONFIG_REISERFS_FS_EXTENDED
+	REISERFS_EXTENDED,
 	REISERFS_EXPOSE_PRIVROOT,
 #endif
 #ifdef CONFIG_REISERFS_FS_XATTR
@@ -497,6 +498,7 @@ enum reiserfs_mount_options {
 #define reiserfs_data_log(s) (REISERFS_SB(s)->s_mount_opt & (1 << REISERFS_DATA_LOG))
 #define reiserfs_data_ordered(s) (REISERFS_SB(s)->s_mount_opt & (1 << REISERFS_DATA_ORDERED))
 #define reiserfs_data_writeback(s) (REISERFS_SB(s)->s_mount_opt & (1 << REISERFS_DATA_WRITEBACK))
+#define reiserfs_extended(s) (REISERFS_SB(s)->s_mount_opt & (1 << REISERFS_EXTENDED))
 #define reiserfs_expose_privroot(s) (REISERFS_SB(s)->s_mount_opt & (1 << REISERFS_EXPOSE_PRIVROOT))
 #ifdef CONFIG_REISERFS_FS_XATTR
 #define reiserfs_xattrs_user(s) (REISERFS_SB(s)->s_mount_opt & (1 << REISERFS_XATTRS_USER))


