From: Roberto Sassu <roberto.sassu@huawei.com>
Subject: [PATCH v3 6/6] evm: Support multiple LSMs providing an xattr
Date: Tue, 27 Apr 2021 13:37:32 +0200
Message-ID: <20210427113732.471066-7-roberto.sassu@huawei.com>
References: <20210427113732.471066-1-roberto.sassu@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20210427113732.471066-1-roberto.sassu@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zohar@linux.ibm.com, jmorris@namei.org, paul@paul-moore.com, casey@schaufler-ca.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, reiserfs-devel@vger.kernel.org, selinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>

Currently, evm_inode_init_security() processes a single LSM xattr from
the array passed by security_inode_init_security(), and calculates the
HMAC on it and other inode metadata.

Given that initxattrs(), called by security_inode_init_security(), expects
that this array is terminated when the xattr name is set to NULL, this
patch reuses the same assumption for to scan all xattrs and to calculate
the HMAC on all of them.

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
index d647bfd0adcd..cd2f46770646 100644
--- a/security/integrity/evm/evm_main.c
+++ b/security/integrity/evm/evm_main.c
@@ -261,7 +261,7 @@ static enum integrity_status evm_verify_hmac(struct dentry *dentry,
 	return evm_status;
 }
 
-static int evm_protected_xattr(const char *req_xattr_name)
+int evm_protected_xattr(const char *req_xattr_name)
 {
 	int namelen;
 	int found = 0;
@@ -713,15 +713,22 @@ int evm_inode_init_security(struct inode *inode, struct inode *dir,
 			    void *fs_data)
 {
 	struct evm_xattr *xattr_data;
+	struct xattr *xattr;
 	struct xattr *evm_xattr = lsm_find_xattr_slot(xattrs, base_slot,
 						      *base_slot + 1);
-	int rc;
+	int rc, evm_protected_xattrs = 0;
 
 	if (!xattrs || !xattrs->name)
 		return 0;
 
-	if (!(evm_initialized & EVM_INIT_HMAC) ||
-	    !evm_protected_xattr(xattrs->name))
+	if (!(evm_initialized & EVM_INIT_HMAC))
+		return -EOPNOTSUPP;
+
+	for (xattr = xattrs; xattr->name != NULL && xattr < evm_xattr; xattr++)
+		if (evm_protected_xattr(xattr->name))
+			evm_protected_xattrs++;
+
+	if (!evm_protected_xattrs)
 		return -EOPNOTSUPP;
 
 	xattr_data = kzalloc(sizeof(*xattr_data), GFP_NOFS);
-- 
2.25.1

