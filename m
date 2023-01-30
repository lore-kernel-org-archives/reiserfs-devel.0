From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH v2 7/8] reiserfs: rework ->listxattr() implementation
Date: Mon, 30 Jan 2023 17:42:03 +0100
Message-ID: <20230125-fs-acl-remove-generic-xattr-handlers-v2-7-214cfb88bb56@kernel.org>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v2-0-214cfb88bb56@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675096942;
        bh=i0YI8OSddVGPlJSubxQWDiYL1rKWSm2PPvG0VMIn/dk=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=QUe5t5BQRRCG8AgCUBf1B4XbCTSHbNKb5IoDlb4oLMTL9FQIjjjpHL6PTgANIg0Op
         Bhw+k71YNfN2fIGUb0A9QlJpeZdRNQmF8TvQO5cJP7TuMg7EJuisGS6TE5zCKqpdFD
         /ODkNAMFSvNdnIuH5lIDJylswPswB4EZPwvb19e/O5J0xBL4mitUyHpL2D2GAsw3Ha
         5xc8hwO7S93FL8LNFPsAnryIdrstwhNB91J/RUFhJf6/zFcy+sIQGjrdW43WerqgAt
         VghgvSi0gSeGb1hrnFbjQ/oJACYGMtP2FshIEu+kprRNa4MVK017zB7+Z4qyAQN2ko
         IA0768FNsUa4Q==
In-Reply-To: <20230125-fs-acl-remove-generic-xattr-handlers-v2-0-214cfb88bb56@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4480; i=brauner@kernel.org;
 h=from:subject:message-id; bh=i0YI8OSddVGPlJSubxQWDiYL1rKWSm2PPvG0VMIn/dk=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMSRf/xx3ffGx7KImzVilSxN3vNFIF5ra8YHj8O877X8yw3pW
 LWqz6ShlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiIxz1Gho07dXuf+6tvfutf/ub+c2
 bZmX5c3rtnRN+LUHnzRaz0ziRGhmZet42VbuwSBY28G54ZM7/d+UFXxGz7gQuvNmqXnm7fywUA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Seth Forshee <sforshee@kernel.org>, "Christian Brauner (Microsoft)" <brauner@kernel.org>, reiserfs-devel@vger.kernel.org

Rework reiserfs so it doesn't have to rely on the dummy xattr handlers
in its s_xattr list anymore as this is completely unused for setting and
getting posix acls. Only leave them around for the sake of ->listxattr().

This is somewhat clumsy but reiserfs is marked deprecated and will be
removed in the future anway so I don't feel too bad about it.

Cc: reiserfs-devel@vger.kernel.org
Signed-off-by: Christian Brauner (Microsoft) <brauner@kernel.org>
---
Changes in v2:
- Rework patch to account for reiserfs quirks.
---
 fs/reiserfs/reiserfs.h |  2 +-
 fs/reiserfs/xattr.c    | 70 +++++++++++++++++++++++++++-----------------------
 2 files changed, 39 insertions(+), 33 deletions(-)

diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index 3aa928ec527a..14726fd353c4 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -1166,7 +1166,7 @@ static inline int bmap_would_wrap(unsigned bmap_nr)
 	return bmap_nr > ((1LL << 16) - 1);
 }
 
-extern const struct xattr_handler *reiserfs_xattr_handlers[];
+extern const struct xattr_handler **reiserfs_xattr_handlers;
 
 /*
  * this says about version of key of all items (but stat data) the
diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 2c326b57d4bc..66574fcbe7a9 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -52,6 +52,7 @@
 #include <linux/quotaops.h>
 #include <linux/security.h>
 #include <linux/posix_acl_xattr.h>
+#include <linux/xattr.h>
 
 #define PRIVROOT_NAME ".reiserfs_priv"
 #define XAROOT_NAME   "xattrs"
@@ -770,23 +771,49 @@ reiserfs_xattr_get(struct inode *inode, const char *name, void *buffer,
 			(handler) != NULL;			\
 			(handler) = *(handlers)++)
 
+static const struct xattr_handler *reiserfs_xattr_handlers_max[] = {
+#ifdef CONFIG_REISERFS_FS_POSIX_ACL
+	&posix_acl_access_xattr_handler,
+	&posix_acl_default_xattr_handler,
+#endif
+#ifdef CONFIG_REISERFS_FS_XATTR
+	&reiserfs_xattr_user_handler,
+	&reiserfs_xattr_trusted_handler,
+#endif
+#ifdef CONFIG_REISERFS_FS_SECURITY
+	&reiserfs_xattr_security_handler,
+#endif
+	NULL
+};
+
+/* Actual operations that are exported to VFS-land */
+#ifdef CONFIG_REISERFS_FS_POSIX_ACL
+const struct xattr_handler **reiserfs_xattr_handlers =
+	reiserfs_xattr_handlers_max + 2;
+#else
+const struct xattr_handler **reiserfs_xattr_handlers =
+	reiserfs_xattr_handlers_max;
+#endif
+
 /* This is the implementation for the xattr plugin infrastructure */
-static inline const struct xattr_handler *
-find_xattr_handler_prefix(const struct xattr_handler **handlers,
-			   const char *name)
+static inline bool reiserfs_xattr_list(const char *name, struct dentry *dentry)
 {
-	const struct xattr_handler *xah;
-
-	if (!handlers)
-		return NULL;
+	const struct xattr_handler *xah = NULL;
+	const struct xattr_handler **handlers = reiserfs_xattr_handlers_max;
 
 	for_each_xattr_handler(handlers, xah) {
 		const char *prefix = xattr_prefix(xah);
-		if (strncmp(prefix, name, strlen(prefix)) == 0)
-			break;
+
+		if (strncmp(prefix, name, strlen(prefix)))
+			continue;
+
+		if (!xattr_handler_can_list(xah, dentry))
+			return false;
+
+		return true;
 	}
 
-	return xah;
+	return false;
 }
 
 struct listxattr_buf {
@@ -807,12 +834,7 @@ static bool listxattr_filler(struct dir_context *ctx, const char *name,
 
 	if (name[0] != '.' ||
 	    (namelen != 1 && (name[1] != '.' || namelen != 2))) {
-		const struct xattr_handler *handler;
-
-		handler = find_xattr_handler_prefix(b->dentry->d_sb->s_xattr,
-						    name);
-		if (!handler /* Unsupported xattr name */ ||
-		    (handler->list && !handler->list(b->dentry)))
+		if (!reiserfs_xattr_list(name, b->dentry))
 			return true;
 		size = namelen + 1;
 		if (b->buf) {
@@ -902,22 +924,6 @@ void reiserfs_xattr_unregister_handlers(void) {}
 static int create_privroot(struct dentry *dentry) { return 0; }
 #endif
 
-/* Actual operations that are exported to VFS-land */
-const struct xattr_handler *reiserfs_xattr_handlers[] = {
-#ifdef CONFIG_REISERFS_FS_XATTR
-	&reiserfs_xattr_user_handler,
-	&reiserfs_xattr_trusted_handler,
-#endif
-#ifdef CONFIG_REISERFS_FS_SECURITY
-	&reiserfs_xattr_security_handler,
-#endif
-#ifdef CONFIG_REISERFS_FS_POSIX_ACL
-	&posix_acl_access_xattr_handler,
-	&posix_acl_default_xattr_handler,
-#endif
-	NULL
-};
-
 static int xattr_mount_check(struct super_block *s)
 {
 	/*

-- 
2.34.1

