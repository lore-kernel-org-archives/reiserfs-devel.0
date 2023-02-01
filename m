From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH v3 06/10] reiserfs: rework ->listxattr() implementation
Date: Wed, 01 Feb 2023 14:14:57 +0100
Message-ID: <20230125-fs-acl-remove-generic-xattr-handlers-v3-6-f760cc58967d@kernel.org>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675257344;
        bh=II0UajdE9ohwBxHvkJkD9FTLcof7NP2OWj60slCtwMA=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=ThnyH2S0ENQbgmpFC3cKvbHPPryZh0stW8SIUC2kaBKDj7Z0nb0P8KBYuq/4f6OHb
         j9sTmja+DKe8AUd+WBPz1xgmgILFLYdn6K7WqpBLe//QshH92SVZQl/3GeajDDU59Z
         urd27k+crzYc69xo8qiCIOQgr5AnuqGBO/rXuFCqRwW4mEicoQhJ3WeI+120j6LNsA
         T+wEHEelb+rLuCEpE9ySYu53NT7htEt/gM5pRcBnBIEjGUZqbRSHp7//4dM/58Y6rY
         ZX778OpuKo7Re7ajwCUG6ss4GgsFOp6IPQViVI4PAz5kKekB7bdu7mpEiPR5d3xOdU
         zc4jOD1ez0RNA==
In-Reply-To: <20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3107; i=brauner@kernel.org;
 h=from:subject:message-id; bh=II0UajdE9ohwBxHvkJkD9FTLcof7NP2OWj60slCtwMA=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMSTfSv00v2Drin+3m467byz/y9GR9IxFdA9XxNwpwQHXHge5
 MwhJd5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzkhh4jw+xJVzZ//nL2cVj0jadVPU
 c5DDkaHlaab3u6+GFzvVD4ZRmG/y67OZj4fruHeUV4zv+QauAx/ccuyyRjn9ne6g1Sr2xjGQA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Seth Forshee <sforshee@kernel.org>, "Christian Brauner (Microsoft)" <brauner@kernel.org>, reiserfs-devel@vger.kernel.org

Rework reiserfs so it doesn't have to rely on the dummy xattr handlers
in its s_xattr list anymore as this is completely unused for setting and
getting posix acls.

Cc: reiserfs-devel@vger.kernel.org
Signed-off-by: Christian Brauner (Microsoft) <brauner@kernel.org>
---
Changes in v3:
  - Patch unchanged.

Changes in v2:
- Rework patch to account for reiserfs quirks.
---
 fs/reiserfs/xattr.c | 46 +++++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 8b2d52443f41..0b949dc45484 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -52,6 +52,7 @@
 #include <linux/quotaops.h>
 #include <linux/security.h>
 #include <linux/posix_acl_xattr.h>
+#include <linux/xattr.h>
 
 #define PRIVROOT_NAME ".reiserfs_priv"
 #define XAROOT_NAME   "xattrs"
@@ -770,23 +771,34 @@ reiserfs_xattr_get(struct inode *inode, const char *name, void *buffer,
 			(handler) != NULL;			\
 			(handler) = *(handlers)++)
 
+static inline bool reiserfs_posix_acl_list(const char *name,
+					   struct dentry *dentry)
+{
+	return (posix_acl_type(name) >= 0) &&
+	       IS_POSIXACL(d_backing_inode(dentry));
+}
+
 /* This is the implementation for the xattr plugin infrastructure */
-static inline const struct xattr_handler *
-find_xattr_handler_prefix(const struct xattr_handler **handlers,
-			   const char *name)
+static inline bool reiserfs_xattr_list(const struct xattr_handler **handlers,
+				       const char *name, struct dentry *dentry)
 {
-	const struct xattr_handler *xah;
+	if (handlers) {
+		const struct xattr_handler *xah = NULL;
 
-	if (!handlers)
-		return NULL;
+		for_each_xattr_handler(handlers, xah) {
+			const char *prefix = xattr_prefix(xah);
 
-	for_each_xattr_handler(handlers, xah) {
-		const char *prefix = xattr_prefix(xah);
-		if (strncmp(prefix, name, strlen(prefix)) == 0)
-			break;
+			if (strncmp(prefix, name, strlen(prefix)))
+				continue;
+
+			if (!xattr_handler_can_list(xah, dentry))
+				return false;
+
+			return true;
+		}
 	}
 
-	return xah;
+	return reiserfs_posix_acl_list(name, dentry);
 }
 
 struct listxattr_buf {
@@ -807,12 +819,8 @@ static bool listxattr_filler(struct dir_context *ctx, const char *name,
 
 	if (name[0] != '.' ||
 	    (namelen != 1 && (name[1] != '.' || namelen != 2))) {
-		const struct xattr_handler *handler;
-
-		handler = find_xattr_handler_prefix(b->dentry->d_sb->s_xattr,
-						    name);
-		if (!handler /* Unsupported xattr name */ ||
-		    (handler->list && !handler->list(b->dentry)))
+		if (!reiserfs_xattr_list(b->dentry->d_sb->s_xattr, name,
+					 b->dentry))
 			return true;
 		size = namelen + 1;
 		if (b->buf) {
@@ -910,10 +918,6 @@ const struct xattr_handler *reiserfs_xattr_handlers[] = {
 #endif
 #ifdef CONFIG_REISERFS_FS_SECURITY
 	&reiserfs_xattr_security_handler,
-#endif
-#ifdef CONFIG_REISERFS_FS_POSIX_ACL
-	&posix_acl_access_xattr_handler,
-	&posix_acl_default_xattr_handler,
 #endif
 	NULL
 };

-- 
2.34.1

