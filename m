From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: [PATCH] Smack modifications for: security: Allow all LSMs to provide xattrs for inode_init_security hook
Date: Tue, 11 Apr 2023 19:23:37 +0200
Message-ID: <20230411172337.340518-1-roberto.sassu@huaweicloud.com>
References: <c7f38789-fe47-8289-e73a-4d07fbaf791d@schaufler-ca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <c7f38789-fe47-8289-e73a-4d07fbaf791d@schaufler-ca.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

From: Roberto Sassu <roberto.sassu@huawei.com>

Very very quick modification. Not tested.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 security/smack/smack.h     |  2 +-
 security/smack/smack_lsm.c | 42 ++++++++++++++++++++------------------
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/security/smack/smack.h b/security/smack/smack.h
index e2239be7bd6..f00c8498c60 100644
--- a/security/smack/smack.h
+++ b/security/smack/smack.h
@@ -127,7 +127,7 @@ struct task_smack {
 
 #define	SMK_INODE_INSTANT	0x01	/* inode is instantiated */
 #define	SMK_INODE_TRANSMUTE	0x02	/* directory is transmuting */
-#define	SMK_INODE_CHANGED	0x04	/* smack was transmuted */
+#define	SMK_INODE_CHANGED	0x04	/* smack was transmuted (unused) */
 #define	SMK_INODE_IMPURE	0x08	/* involved in an impure transaction */
 
 /*
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 8392983334b..b43820bdbd0 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -54,12 +54,12 @@
 
 /*
  * Smack uses multiple xattrs.
- * SMACK64 - for access control, SMACK64EXEC - label for the program,
- * SMACK64MMAP - controls library loading,
+ * SMACK64 - for access control,
  * SMACK64TRANSMUTE - label initialization,
- * Not saved on files - SMACK64IPIN and SMACK64IPOUT
+ * Not saved on files - SMACK64IPIN and SMACK64IPOUT,
+ * Must be set explicitly - SMACK64EXEC and SMACK64MMAP
  */
-#define SMACK_INODE_INIT_XATTRS 4
+#define SMACK_INODE_INIT_XATTRS 2
 
 #ifdef SMACK_IPV6_PORT_LABELING
 static DEFINE_MUTEX(smack_ipv6_lock);
@@ -957,11 +957,11 @@ static int smack_inode_init_security(struct inode *inode, struct inode *dir,
 				     const struct qstr *qstr,
 				     struct xattr *xattrs, int *xattr_count)
 {
-	struct inode_smack *issp = smack_inode(inode);
 	struct smack_known *skp = smk_of_current();
 	struct smack_known *isp = smk_of_inode(inode);
 	struct smack_known *dsp = smk_of_inode(dir);
 	struct xattr *xattr = lsm_get_xattr_slot(xattrs, xattr_count);
+	struct xattr *xattr2;
 	int may;
 
 	if (xattr) {
@@ -979,7 +979,17 @@ static int smack_inode_init_security(struct inode *inode, struct inode *dir,
 		if (may > 0 && ((may & MAY_TRANSMUTE) != 0) &&
 		    smk_inode_transmutable(dir)) {
 			isp = dsp;
-			issp->smk_flags |= SMK_INODE_CHANGED;
+			xattr2 = lsm_get_xattr_slot(xattrs, xattr_count);
+			if (xattr2) {
+				xattr2->value = kmemdup(TRANS_TRUE,
+							TRANS_TRUE_SIZE,
+							GFP_NOFS);
+				if (xattr2->value == NULL)
+					return -ENOMEM;
+
+				xattr2->value_len = TRANS_TRUE_SIZE;
+				xattr2->name = XATTR_NAME_SMACKTRANSMUTE;
+			}
 		}
 
 		xattr->value = kstrdup(isp->smk_known, GFP_NOFS);
@@ -3512,20 +3522,12 @@ static void smack_d_instantiate(struct dentry *opt_dentry, struct inode *inode)
 			 * If there is a transmute attribute on the
 			 * directory mark the inode.
 			 */
-			if (isp->smk_flags & SMK_INODE_CHANGED) {
-				isp->smk_flags &= ~SMK_INODE_CHANGED;
-				rc = __vfs_setxattr(&nop_mnt_idmap, dp, inode,
-					XATTR_NAME_SMACKTRANSMUTE,
-					TRANS_TRUE, TRANS_TRUE_SIZE,
-					0);
-			} else {
-				rc = __vfs_getxattr(dp, inode,
-					XATTR_NAME_SMACKTRANSMUTE, trattr,
-					TRANS_TRUE_SIZE);
-				if (rc >= 0 && strncmp(trattr, TRANS_TRUE,
-						       TRANS_TRUE_SIZE) != 0)
-					rc = -EINVAL;
-			}
+			rc = __vfs_getxattr(dp, inode,
+					    XATTR_NAME_SMACKTRANSMUTE, trattr,
+					    TRANS_TRUE_SIZE);
+			if (rc >= 0 && strncmp(trattr, TRANS_TRUE,
+					       TRANS_TRUE_SIZE) != 0)
+				rc = -EINVAL;
 			if (rc >= 0)
 				transflag = SMK_INODE_TRANSMUTE;
 		}
-- 
2.25.1

