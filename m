From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: [PATCH v4 2/5] security: Rewrite security_old_inode_init_security()
Date: Thu, 10 Nov 2022 10:46:36 +0100
Message-ID: <20221110094639.3086409-3-roberto.sassu@huaweicloud.com>
References: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

From: Roberto Sassu <roberto.sassu@huawei.com>

Rewrite security_old_inode_init_security() to call
security_inode_init_security() before making changes to support multiple
LSMs providing xattrs. Do it so that the required changes are done only in
one place.

Define the security_initxattrs() callback and pass it to
security_inode_init_security() as argument, to obtain the first xattr
provided by LSMs.

This behavior is a bit different from the current one. Before this patch
calling call_int_hook() could cause multiple LSMs to provide an xattr,
since call_int_hook() does not stop when an LSM returns zero. The caller of
security_old_inode_init_security() receives the last xattr set. The pointer
of the xattr value of previous LSMs is lost, causing memory leaks.

However, in practice, this scenario does not happen as the only in-tree
LSMs providing an xattr at inode creation time are SELinux and Smack, which
are mutually exclusive.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 security/security.c | 58 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/security/security.c b/security/security.c
index 79d82cb6e469..a0e9b4ce2341 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1089,20 +1089,34 @@ int security_dentry_create_files_as(struct dentry *dentry, int mode,
 }
 EXPORT_SYMBOL(security_dentry_create_files_as);
 
+static int security_initxattrs(struct inode *inode, const struct xattr *xattrs,
+			       void *fs_info)
+{
+	struct xattr *dest = (struct xattr *)fs_info;
+
+	dest->name = xattrs->name;
+	dest->value = xattrs->value;
+	dest->value_len = xattrs->value_len;
+	return 0;
+}
+
 int security_inode_init_security(struct inode *inode, struct inode *dir,
 				 const struct qstr *qstr,
 				 const initxattrs initxattrs, void *fs_data)
 {
 	struct xattr new_xattrs[MAX_LSM_EVM_XATTR + 1];
 	struct xattr *lsm_xattr, *evm_xattr, *xattr;
-	int ret;
+	int ret = -EOPNOTSUPP;
 
 	if (unlikely(IS_PRIVATE(inode)))
-		return 0;
+		goto out_exit;
 
-	if (!initxattrs)
-		return call_int_hook(inode_init_security, -EOPNOTSUPP, inode,
-				     dir, qstr, NULL, NULL, NULL);
+	if (!initxattrs ||
+	    (initxattrs == &security_initxattrs && !fs_data)) {
+		ret = call_int_hook(inode_init_security, -EOPNOTSUPP, inode,
+				    dir, qstr, NULL, NULL, NULL);
+		goto out_exit;
+	}
 	memset(new_xattrs, 0, sizeof(new_xattrs));
 	lsm_xattr = new_xattrs;
 	ret = call_int_hook(inode_init_security, -EOPNOTSUPP, inode, dir, qstr,
@@ -1118,8 +1132,19 @@ int security_inode_init_security(struct inode *inode, struct inode *dir,
 		goto out;
 	ret = initxattrs(inode, new_xattrs, fs_data);
 out:
-	for (xattr = new_xattrs; xattr->value != NULL; xattr++)
+	for (xattr = new_xattrs; xattr->value != NULL; xattr++) {
+		/*
+		 * Xattr value freed by the caller of
+		 * security_old_inode_init_security().
+		 */
+		if (xattr == new_xattrs && initxattrs == &security_initxattrs &&
+		    !ret)
+			continue;
 		kfree(xattr->value);
+	}
+out_exit:
+	if (initxattrs == &security_initxattrs)
+		return ret;
 	return (ret == -EOPNOTSUPP) ? 0 : ret;
 }
 EXPORT_SYMBOL(security_inode_init_security);
@@ -1136,10 +1161,23 @@ int security_old_inode_init_security(struct inode *inode, struct inode *dir,
 				     const struct qstr *qstr, const char **name,
 				     void **value, size_t *len)
 {
-	if (unlikely(IS_PRIVATE(inode)))
-		return -EOPNOTSUPP;
-	return call_int_hook(inode_init_security, -EOPNOTSUPP, inode, dir,
-			     qstr, name, value, len);
+	struct xattr xattr = {};
+	struct xattr *lsm_xattr = (value) ? &xattr : NULL;
+	int ret;
+
+	ret = security_inode_init_security(inode, dir, qstr,
+					   security_initxattrs, lsm_xattr);
+	if (ret)
+		return ret;
+
+	if (name)
+		*name = lsm_xattr->name;
+	if (value)
+		*value = lsm_xattr->value;
+	if (len)
+		*len = lsm_xattr->value_len;
+
+	return 0;
 }
 EXPORT_SYMBOL(security_old_inode_init_security);
 
-- 
2.25.1

