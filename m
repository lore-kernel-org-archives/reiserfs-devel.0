From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: [PATCH v5 5/6] evm: Align evm_inode_init_security() definition with LSM infrastructure
Date: Wed, 23 Nov 2022 10:52:01 +0100
Message-ID: <20221123095202.599252-6-roberto.sassu@huaweicloud.com>
References: <20221123095202.599252-1-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20221123095202.599252-1-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

From: Roberto Sassu <roberto.sassu@huawei.com>

Change the evm_inode_init_security() definition to align with the LSM
infrastructure, in preparation for moving IMA and EVM to that
infrastructure. Keep the existing behavior of including in the HMAC
calculation only the xattr the first LSM provides.

Changing the evm_inode_init_security() definition requires passing only the
xattr array allocated by security_inode_init_security(), instead of the
first LSM xattr and the place where the EVM xattr should be filled. In lieu
of passing the EVM xattr, EVM must position itself after the last filled
xattr (by checking the xattr name), since only the beginning of the xattr
array is given.

Currently, the LSM infrastructure makes sure that there is space for the
EVM xattr in the xattr array. If EVM is moved to the LSM infrastructure,
it will use the xattr reservation mechanism to achieve the same, as the
other LSMs.

Finally, make evm_inode_init_security() return value compatible with the
inode_init_security hook conventions, i.e. return -EOPNOTSUPP if it is not
setting an xattr.

EVM is a bit tricky, because xattrs is both an input and an output. If it
was just output, EVM should have returned zero if xattrs is NULL. But,
since xattrs is also input, EVM is unable to do its calculations, so return
-EOPNOTSUPP and handle this error in security_inode_init_security().

Don't change the return value in the inline function
evm_inode_init_security() in include/linux/evm.h, as the function will be
removed if EVM is moved to the LSM infrastructure.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 include/linux/evm.h               | 12 ++++++------
 security/integrity/evm/evm_main.c | 20 +++++++++++++-------
 security/security.c               |  5 ++---
 3 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/include/linux/evm.h b/include/linux/evm.h
index aa63e0b3c0a2..3bb2ae9fe098 100644
--- a/include/linux/evm.h
+++ b/include/linux/evm.h
@@ -35,9 +35,9 @@ extern int evm_inode_removexattr(struct user_namespace *mnt_userns,
 				 struct dentry *dentry, const char *xattr_name);
 extern void evm_inode_post_removexattr(struct dentry *dentry,
 				       const char *xattr_name);
-extern int evm_inode_init_security(struct inode *inode,
-				   const struct xattr *xattr_array,
-				   struct xattr *evm);
+extern int evm_inode_init_security(struct inode *inode, struct inode *dir,
+				   const struct qstr *qstr,
+				   struct xattr *xattrs);
 extern bool evm_revalidate_status(const char *xattr_name);
 extern int evm_protected_xattr_if_enabled(const char *req_xattr_name);
 extern int evm_read_protected_xattrs(struct dentry *dentry, u8 *buffer,
@@ -108,9 +108,9 @@ static inline void evm_inode_post_removexattr(struct dentry *dentry,
 	return;
 }
 
-static inline int evm_inode_init_security(struct inode *inode,
-					  const struct xattr *xattr_array,
-					  struct xattr *evm)
+static inline int evm_inode_init_security(struct inode *inode, struct inode *dir,
+					  const struct qstr *qstr,
+					  struct xattr *xattrs)
 {
 	return 0;
 }
diff --git a/security/integrity/evm/evm_main.c b/security/integrity/evm/evm_main.c
index 23d484e05e6f..0a312cafb7de 100644
--- a/security/integrity/evm/evm_main.c
+++ b/security/integrity/evm/evm_main.c
@@ -845,23 +845,29 @@ void evm_inode_post_setattr(struct dentry *dentry, int ia_valid)
 /*
  * evm_inode_init_security - initializes security.evm HMAC value
  */
-int evm_inode_init_security(struct inode *inode,
-				 const struct xattr *lsm_xattr,
-				 struct xattr *evm_xattr)
+int evm_inode_init_security(struct inode *inode, struct inode *dir,
+			    const struct qstr *qstr,
+			    struct xattr *xattrs)
 {
 	struct evm_xattr *xattr_data;
+	struct xattr *xattr, *evm_xattr;
 	int rc;
 
-	if (!(evm_initialized & EVM_INIT_HMAC) ||
-	    !evm_protected_xattr(lsm_xattr->name))
-		return 0;
+	if (!(evm_initialized & EVM_INIT_HMAC) || !xattrs ||
+	    !evm_protected_xattr(xattrs->name))
+		return -EOPNOTSUPP;
+
+	for (xattr = xattrs; xattr->value != NULL; xattr++)
+		;
+
+	evm_xattr = xattr;
 
 	xattr_data = kzalloc(sizeof(*xattr_data), GFP_NOFS);
 	if (!xattr_data)
 		return -ENOMEM;
 
 	xattr_data->data.type = EVM_XATTR_HMAC;
-	rc = evm_init_hmac(inode, lsm_xattr, xattr_data->digest);
+	rc = evm_init_hmac(inode, xattrs, xattr_data->digest);
 	if (rc < 0)
 		goto out;
 
diff --git a/security/security.c b/security/security.c
index 26aaa5850867..d256bd223ef4 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1184,9 +1184,8 @@ int security_inode_init_security(struct inode *inode, struct inode *dir,
 	if (!num_filled_xattrs)
 		goto out;
 
-	ret = evm_inode_init_security(inode, new_xattrs,
-				      new_xattrs + num_filled_xattrs);
-	if (ret)
+	ret = evm_inode_init_security(inode, dir, qstr, new_xattrs);
+	if (ret && ret != -EOPNOTSUPP)
 		goto out;
 	ret = initxattrs(inode, new_xattrs, fs_data);
 out:
-- 
2.25.1

