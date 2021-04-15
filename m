From: Roberto Sassu <roberto.sassu@huawei.com>
Subject: [PATCH 5/5] evm: Support multiple LSMs providing an xattr
Date: Thu, 15 Apr 2021 12:04:35 +0200
Message-ID: <20210415100435.18619-6-roberto.sassu@huawei.com>
References: <20210415100435.18619-1-roberto.sassu@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20210415100435.18619-1-roberto.sassu@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zohar@linux.ibm.com, jmorris@namei.org, paul@paul-moore.com, casey@schaufler-ca.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>

Currently, evm_inode_init_security() takes as input a single LSM xattr,
passed by security_inode_init_security(), and calculates the HMAC on it and
other inode metadata.

Given that initxattrs(), called by security_inode_init_security(), expects
that this array is terminated when the xattr name is set to NULL, this
patch reuses the same assumption for evm_inode_init_security() to scan all
xattrs and to calculate the HMAC on all of them.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 security/integrity/evm/evm.h        |  2 ++
 security/integrity/evm/evm_crypto.c |  9 ++++++++-
 security/integrity/evm/evm_main.c   | 15 +++++++++++----
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/security/integrity/evm/evm.h b/security/integrity/evm/evm.h
index ae590f71ce7d..24eac42b9f32 100644
--- a/security/integrity/evm/evm.h
+++ b/security/integrity/evm/evm.h
@@ -49,6 +49,8 @@ struct evm_digest {
 	char digest[IMA_MAX_DIGEST_SIZE];
 } __packed;
 
+int evm_protected_xattr(const char *req_xattr_name);
+
 int evm_init_key(void);
 int __init evm_init_crypto(void);
 int evm_update_evmxattr(struct dentry *dentry,
diff --git a/security/integrity/evm/evm_crypto.c b/security/integrity/evm/evm_crypto.c
index b66264b53d5d..35c5eec0517d 100644
--- a/security/integrity/evm/evm_crypto.c
+++ b/security/integrity/evm/evm_crypto.c
@@ -358,6 +358,7 @@ int evm_init_hmac(struct inode *inode, const struct xattr *lsm_xattr,
 		  char *hmac_val)
 {
 	struct shash_desc *desc;
+	const struct xattr *xattr;
 
 	desc = init_desc(EVM_XATTR_HMAC, evm_hash_algo);
 	if (IS_ERR(desc)) {
@@ -365,7 +366,13 @@ int evm_init_hmac(struct inode *inode, const struct xattr *lsm_xattr,
 		return PTR_ERR(desc);
 	}
 
-	crypto_shash_update(desc, lsm_xattr->value, lsm_xattr->value_len);
+	for (xattr = lsm_xattr; xattr->name != NULL; xattr++) {
+		if (!evm_protected_xattr(xattr->name))
+			continue;
+
+		crypto_shash_update(desc, xattr->value, xattr->value_len);
+	}
+
 	hmac_add_misc(desc, inode, EVM_XATTR_HMAC, hmac_val);
 	kfree(desc);
 	return 0;
diff --git a/security/integrity/evm/evm_main.c b/security/integrity/evm/evm_main.c
index a5069d69a893..fde366149499 100644
--- a/security/integrity/evm/evm_main.c
+++ b/security/integrity/evm/evm_main.c
@@ -260,7 +260,7 @@ static enum integrity_status evm_verify_hmac(struct dentry *dentry,
 	return evm_status;
 }
 
-static int evm_protected_xattr(const char *req_xattr_name)
+int evm_protected_xattr(const char *req_xattr_name)
 {
 	int namelen;
 	int found = 0;
@@ -712,14 +712,21 @@ int evm_inode_init_security(struct inode *inode, struct inode *dir,
 			    void **value, size_t *len,
 			    struct xattr *lsm_xattrs)
 {
+	struct xattr *xattr;
 	struct evm_xattr *xattr_data;
-	int rc;
+	int rc, evm_protected_xattrs = 0;
 
 	if (!name || !value || !len || !lsm_xattrs)
 		return 0;
 
-	if (!(evm_initialized & EVM_INIT_HMAC) ||
-	    !evm_protected_xattr(lsm_xattrs->name))
+	if (!(evm_initialized & EVM_INIT_HMAC))
+		return -EOPNOTSUPP;
+
+	for (xattr = lsm_xattrs; xattr && xattr->name != NULL; xattr++)
+		if (evm_protected_xattr(xattr->name))
+			evm_protected_xattrs++;
+
+	if (!evm_protected_xattrs)
 		return -EOPNOTSUPP;
 
 	xattr_data = kzalloc(sizeof(*xattr_data), GFP_NOFS);
-- 
2.26.2

