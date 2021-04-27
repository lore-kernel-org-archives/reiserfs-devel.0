From: Roberto Sassu <roberto.sassu@huawei.com>
Subject: [PATCH v3 2/6] security: Rewrite security_old_inode_init_security()
Date: Tue, 27 Apr 2021 13:37:28 +0200
Message-ID: <20210427113732.471066-3-roberto.sassu@huawei.com>
References: <20210427113732.471066-1-roberto.sassu@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20210427113732.471066-1-roberto.sassu@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zohar@linux.ibm.com, jmorris@namei.org, paul@paul-moore.com, casey@schaufler-ca.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, reiserfs-devel@vger.kernel.org, selinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>

With upcoming changes, LSMs will be able to write their xattrs in the
reserved slots. Boundary checking will be performed to ensure that LSMs
don't write outside the passed xattr array. However, the xattr array is
created only in security_inode_init_security() and not in
security_old_inode_init_security().

Instead of duplicating the code for array allocation, this patch calls
security_inode_init_security() from security_old_inode_init_security() and
introduces a new callback, called security_initxattrs(), to copy the first
element of the xattr array allocated by former function into the
destination pointer provided by the latter function.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 security/security.c | 41 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/security/security.c b/security/security.c
index 7f14e59c4f8e..692a148ce764 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1024,6 +1024,20 @@ int security_dentry_create_files_as(struct dentry *dentry, int mode,
 }
 EXPORT_SYMBOL(security_dentry_create_files_as);
 
+static int security_initxattrs(struct inode *inode, const struct xattr *xattrs,
+			       void *fs_info)
+{
+	struct xattr *dest = (struct xattr *)fs_info;
+
+	if (!dest)
+		return 0;
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
@@ -1053,8 +1067,14 @@ int security_inode_init_security(struct inode *inode, struct inode *dir,
 		goto out;
 	ret = initxattrs(inode, new_xattrs, fs_data);
 out:
-	for (xattr = new_xattrs; xattr->value != NULL; xattr++)
+	for (xattr = new_xattrs; xattr->value != NULL; xattr++) {
+		if (xattr == new_xattrs && initxattrs == &security_initxattrs &&
+		    !ret && fs_data != NULL)
+			continue;
 		kfree(xattr->value);
+	}
+	if (initxattrs == &security_initxattrs)
+		return ret;
 	return (ret == -EOPNOTSUPP) ? 0 : ret;
 }
 EXPORT_SYMBOL(security_inode_init_security);
@@ -1071,10 +1091,25 @@ int security_old_inode_init_security(struct inode *inode, struct inode *dir,
 				     const struct qstr *qstr, const char **name,
 				     void **value, size_t *len)
 {
+	struct xattr xattr = { .name = NULL, .value = NULL, .value_len = 0 };
+	struct xattr *lsm_xattr = (name && value && len) ? &xattr : NULL;
+	int ret;
+
 	if (unlikely(IS_PRIVATE(inode)))
 		return -EOPNOTSUPP;
-	return call_int_hook(inode_init_security, -EOPNOTSUPP, inode, dir,
-			     qstr, name, value, len);
+
+	ret = security_inode_init_security(inode, dir, qstr,
+					   security_initxattrs, lsm_xattr);
+	if (ret)
+		return ret;
+
+	if (lsm_xattr) {
+		*name = lsm_xattr->name;
+		*value = lsm_xattr->value;
+		*len = lsm_xattr->value_len;
+	}
+
+	return 0;
 }
 EXPORT_SYMBOL(security_old_inode_init_security);
 
-- 
2.25.1

