From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: [PATCH v9 4/4] evm: Support multiple LSMs providing an xattr
Date: Wed, 29 Mar 2023 15:04:15 +0200
Message-ID: <20230329130415.2312521-5-roberto.sassu@huaweicloud.com>
References: <20230329130415.2312521-1-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20230329130415.2312521-1-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

From: Roberto Sassu <roberto.sassu@huawei.com>

Currently, evm_inode_init_security() processes a single LSM xattr from the
array passed by security_inode_init_security(), and calculates the HMAC on
it and other inode metadata.

As the LSM infrastructure now can pass to EVM an array with multiple
xattrs, scan them until the terminator (xattr name NULL), and calculate the
HMAC on all of them.

Also, double check that the xattrs array terminator is the first non-filled
slot (obtained with lsm_find_xattr_slot()). Consumers of the xattrs array,
such as the initxattrs() callbacks, rely on the terminator.

Finally, change the name of the lsm_xattr parameter of evm_init_hmac() to
xattrs, to reflect the new type of information passed.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 security/integrity/evm/evm.h        |  4 +++-
 security/integrity/evm/evm_crypto.c | 11 +++++++++--
 security/integrity/evm/evm_main.c   | 29 +++++++++++++++++++++++++----
 3 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/security/integrity/evm/evm.h b/security/integrity/evm/evm.h
index f8b8c5004fc..53bd7fec93f 100644
--- a/security/integrity/evm/evm.h
+++ b/security/integrity/evm/evm.h
@@ -46,6 +46,8 @@ struct evm_digest {
 	char digest[IMA_MAX_DIGEST_SIZE];
 } __packed;
 
+int evm_protected_xattr(const char *req_xattr_name);
+
 int evm_init_key(void);
 int evm_update_evmxattr(struct dentry *dentry,
 			const char *req_xattr_name,
@@ -58,7 +60,7 @@ int evm_calc_hash(struct dentry *dentry, const char *req_xattr_name,
 		  const char *req_xattr_value,
 		  size_t req_xattr_value_len, char type,
 		  struct evm_digest *data);
-int evm_init_hmac(struct inode *inode, const struct xattr *xattr,
+int evm_init_hmac(struct inode *inode, const struct xattr *xattrs,
 		  char *hmac_val);
 int evm_init_secfs(void);
 
diff --git a/security/integrity/evm/evm_crypto.c b/security/integrity/evm/evm_crypto.c
index 033804f5a5f..0fdd382b58e 100644
--- a/security/integrity/evm/evm_crypto.c
+++ b/security/integrity/evm/evm_crypto.c
@@ -385,10 +385,11 @@ int evm_update_evmxattr(struct dentry *dentry, const char *xattr_name,
 	return rc;
 }
 
-int evm_init_hmac(struct inode *inode, const struct xattr *lsm_xattr,
+int evm_init_hmac(struct inode *inode, const struct xattr *xattrs,
 		  char *hmac_val)
 {
 	struct shash_desc *desc;
+	const struct xattr *xattr;
 
 	desc = init_desc(EVM_XATTR_HMAC, HASH_ALGO_SHA1);
 	if (IS_ERR(desc)) {
@@ -396,7 +397,13 @@ int evm_init_hmac(struct inode *inode, const struct xattr *lsm_xattr,
 		return PTR_ERR(desc);
 	}
 
-	crypto_shash_update(desc, lsm_xattr->value, lsm_xattr->value_len);
+	for (xattr = xattrs; xattr->name != NULL; xattr++) {
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
index 9e75759150c..6cbd739cf84 100644
--- a/security/integrity/evm/evm_main.c
+++ b/security/integrity/evm/evm_main.c
@@ -306,7 +306,7 @@ static int evm_protected_xattr_common(const char *req_xattr_name,
 	return found;
 }
 
-static int evm_protected_xattr(const char *req_xattr_name)
+int evm_protected_xattr(const char *req_xattr_name)
 {
 	return evm_protected_xattr_common(req_xattr_name, false);
 }
@@ -870,14 +870,35 @@ int evm_inode_init_security(struct inode *inode, struct inode *dir,
 			    int *num_filled_xattrs)
 {
 	struct evm_xattr *xattr_data;
-	struct xattr *evm_xattr;
+	struct xattr *xattr, *evm_xattr;
+	bool evm_protected_xattrs = false;
 	int rc;
 
-	if (!(evm_initialized & EVM_INIT_HMAC) || !xattrs ||
-	    !evm_protected_xattr(xattrs->name))
+	if (!(evm_initialized & EVM_INIT_HMAC) || !xattrs)
+		return -EOPNOTSUPP;
+
+	/*
+	 * security_inode_init_security() makes sure that the xattrs array is
+	 * contiguous, there is enough space for security.evm, and that there is
+	 * a terminator at the end of the array.
+	 */
+	for (xattr = xattrs; xattr->name != NULL; xattr++) {
+		if (evm_protected_xattr(xattr->name))
+			evm_protected_xattrs = true;
+	}
+
+	/* EVM xattr not needed. */
+	if (!evm_protected_xattrs)
 		return -EOPNOTSUPP;
 
 	evm_xattr = lsm_find_xattr_slot(xattrs, num_filled_xattrs);
+	/*
+	 * Array terminator (xattr name = NULL) must be the first non-filled
+	 * xattr slot.
+	 */
+	WARN_ONCE(evm_xattr != xattr,
+		  "%s: xattrs terminator is not the first non-filled slot\n",
+		  __func__);
 
 	xattr_data = kzalloc(sizeof(*xattr_data), GFP_NOFS);
 	if (!xattr_data)
-- 
2.25.1

