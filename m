From: Andreas Gruenbacher <agruenba@redhat.com>
Subject: [PATCH] xattr: Export xattr_resolve_name
Date: Wed, 13 Apr 2016 17:40:34 +0200
Message-ID: <1460562034-31461-1-git-send-email-agruenba@redhat.com>
References: <1460552239-30041-1-git-send-email-agruenba@redhat.com>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1460552239-30041-1-git-send-email-agruenba@redhat.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, reiserfs-devel@vger.kernel.org
Cc: Andreas Gruenbacher <agruenba@redhat.com>, linux-fsdevel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>

Export xattr_resolve_name and make it easier to use by filesystems.
Use it to remove reiserfs's own copy of the same functionality.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/reiserfs/xattr.c   | 47 +++++++----------------------------------------
 fs/xattr.c            | 20 ++++++++++++--------
 include/linux/xattr.h |  4 ++++
 3 files changed, 23 insertions(+), 48 deletions(-)

diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 28f5f8b..08b8dc4 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -732,40 +732,6 @@ out:
 }
 
 /*
- * In order to implement different sets of xattr operations for each xattr
- * prefix with the generic xattr API, a filesystem should create a
- * null-terminated array of struct xattr_handler (one for each prefix) and
- * hang a pointer to it off of the s_xattr field of the superblock.
- *
- * The generic_fooxattr() functions will use this list to dispatch xattr
- * operations to the correct xattr_handler.
- */
-#define for_each_xattr_handler(handlers, handler)		\
-		for ((handler) = *(handlers)++;			\
-			(handler) != NULL;			\
-			(handler) = *(handlers)++)
-
-/* This is the implementation for the xattr plugin infrastructure */
-static inline const struct xattr_handler *
-find_xattr_handler_prefix(const struct xattr_handler **handlers,
-			   const char *name)
-{
-	const struct xattr_handler *xah;
-
-	if (!handlers)
-		return NULL;
-
-	for_each_xattr_handler(handlers, xah) {
-		const char *prefix = xattr_prefix(xah);
-		if (strncmp(prefix, name, strlen(prefix)) == 0)
-			break;
-	}
-
-	return xah;
-}
-
-
-/*
  * Inode operation getxattr()
  */
 ssize_t
@@ -774,7 +740,9 @@ reiserfs_getxattr(struct dentry * dentry, const char *name, void *buffer,
 {
 	const struct xattr_handler *handler;
 
-	handler = find_xattr_handler_prefix(dentry->d_sb->s_xattr, name);
+	handler = xattr_resolve_name(dentry->d_sb, name, NULL);
+	if (IS_ERR(handler))
+		return PTR_ERR(handler);
 
 	if (!handler || get_inode_sd_version(d_inode(dentry)) == STAT_DATA_V1)
 		return -EOPNOTSUPP;
@@ -793,7 +761,7 @@ reiserfs_setxattr(struct dentry *dentry, const char *name, const void *value,
 {
 	const struct xattr_handler *handler;
 
-	handler = find_xattr_handler_prefix(dentry->d_sb->s_xattr, name);
+	handler = xattr_resolve_name(dentry->d_sb, name, NULL);
 
 	if (!handler || get_inode_sd_version(d_inode(dentry)) == STAT_DATA_V1)
 		return -EOPNOTSUPP;
@@ -810,7 +778,7 @@ int reiserfs_removexattr(struct dentry *dentry, const char *name)
 {
 	const struct xattr_handler *handler;
 
-	handler = find_xattr_handler_prefix(dentry->d_sb->s_xattr, name);
+	handler = xattr_resolve_name(dentry->d_sb, name, NULL);
 
 	if (!handler || get_inode_sd_version(d_inode(dentry)) == STAT_DATA_V1)
 		return -EOPNOTSUPP;
@@ -838,9 +806,8 @@ static int listxattr_filler(struct dir_context *ctx, const char *name,
 	    (namelen != 1 && (name[1] != '.' || namelen != 2))) {
 		const struct xattr_handler *handler;
 
-		handler = find_xattr_handler_prefix(b->dentry->d_sb->s_xattr,
-						    name);
-		if (!handler /* Unsupported xattr name */ ||
+		handler = xattr_resolve_name(b->dentry->d_sb, name, NULL);
+		if (IS_ERR(handler) /* Unsupported xattr name */ ||
 		    (handler->list && !handler->list(b->dentry)))
 			return 0;
 		size = namelen + 1;
diff --git a/fs/xattr.c b/fs/xattr.c
index afadc1b..096a3fc 100644
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -655,30 +655,34 @@ strcmp_prefix(const char *a, const char *a_prefix)
 /*
  * Find the xattr_handler with the matching prefix.
  */
-static const struct xattr_handler *
-xattr_resolve_name(const struct xattr_handler **handlers, const char **name)
+const struct xattr_handler *
+xattr_resolve_name(const struct super_block *sb, const char *name,
+		   const char **suffix)
 {
+	const struct xattr_handler **handlers = sb->s_xattr;
 	const struct xattr_handler *handler;
 
-	if (!*name)
+	if (!name)
 		return ERR_PTR(-EINVAL);
 
 	for_each_xattr_handler(handlers, handler) {
 		const char *n;
 
-		n = strcmp_prefix(*name, xattr_prefix(handler));
+		n = strcmp_prefix(name, xattr_prefix(handler));
 		if (n) {
 			if (!handler->prefix ^ !*n) {
 				if (*n)
 					continue;
 				return ERR_PTR(-EINVAL);
 			}
-			*name = n;
+			if (suffix)
+				*suffix = n;
 			return handler;
 		}
 	}
 	return ERR_PTR(-EOPNOTSUPP);
 }
+EXPORT_SYMBOL(xattr_resolve_name);
 
 /*
  * Find the handler for the prefix and dispatch its get() operation.
@@ -688,7 +692,7 @@ generic_getxattr(struct dentry *dentry, const char *name, void *buffer, size_t s
 {
 	const struct xattr_handler *handler;
 
-	handler = xattr_resolve_name(dentry->d_sb->s_xattr, &name);
+	handler = xattr_resolve_name(dentry->d_sb, name, &name);
 	if (IS_ERR(handler))
 		return PTR_ERR(handler);
 	return handler->get(handler, dentry, name, buffer, size);
@@ -741,7 +745,7 @@ generic_setxattr(struct dentry *dentry, const char *name, const void *value, siz
 
 	if (size == 0)
 		value = "";  /* empty EA, do not remove */
-	handler = xattr_resolve_name(dentry->d_sb->s_xattr, &name);
+	handler = xattr_resolve_name(dentry->d_sb, name, &name);
 	if (IS_ERR(handler))
 		return PTR_ERR(handler);
 	return handler->set(handler, dentry, name, value, size, flags);
@@ -756,7 +760,7 @@ generic_removexattr(struct dentry *dentry, const char *name)
 {
 	const struct xattr_handler *handler;
 
-	handler = xattr_resolve_name(dentry->d_sb->s_xattr, &name);
+	handler = xattr_resolve_name(dentry->d_sb, name, &name);
 	if (IS_ERR(handler))
 		return PTR_ERR(handler);
 	return handler->set(handler, dentry, name, NULL, 0, XATTR_REPLACE);
diff --git a/include/linux/xattr.h b/include/linux/xattr.h
index 4457541..0a53a17 100644
--- a/include/linux/xattr.h
+++ b/include/linux/xattr.h
@@ -51,6 +51,10 @@ int __vfs_setxattr_noperm(struct dentry *, const char *, const void *, size_t, i
 int vfs_setxattr(struct dentry *, const char *, const void *, size_t, int);
 int vfs_removexattr(struct dentry *, const char *);
 
+struct super_block;
+const struct xattr_handler *xattr_resolve_name(const struct super_block *,
+					       const char *name,
+					       const char **suffix);
 ssize_t generic_getxattr(struct dentry *dentry, const char *name, void *buffer, size_t size);
 ssize_t generic_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size);
 int generic_setxattr(struct dentry *dentry, const char *name, const void *value, size_t size, int flags);
-- 
2.5.5

