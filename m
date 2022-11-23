From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: [PATCH v5 3/6] security: Remove security_old_inode_init_security()
Date: Wed, 23 Nov 2022 10:51:59 +0100
Message-ID: <20221123095202.599252-4-roberto.sassu@huaweicloud.com>
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

As the remaining two users reiserfs and ocfs2 switched to
security_inode_init_security(), security_old_inode_init_security() can be
now removed.

Out-of-tree kernel modules should switch to security_inode_init_security()
too.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 include/linux/security.h | 12 ------------
 security/security.c      | 11 -----------
 2 files changed, 23 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index ca1b7109c0db..c682fc96ed61 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -336,9 +336,6 @@ int security_inode_init_security(struct inode *inode, struct inode *dir,
 int security_inode_init_security_anon(struct inode *inode,
 				      const struct qstr *name,
 				      const struct inode *context_inode);
-int security_old_inode_init_security(struct inode *inode, struct inode *dir,
-				     const struct qstr *qstr, const char **name,
-				     void **value, size_t *len);
 int security_inode_create(struct inode *dir, struct dentry *dentry, umode_t mode);
 int security_inode_link(struct dentry *old_dentry, struct inode *dir,
 			 struct dentry *new_dentry);
@@ -771,15 +768,6 @@ static inline int security_inode_init_security_anon(struct inode *inode,
 	return 0;
 }
 
-static inline int security_old_inode_init_security(struct inode *inode,
-						   struct inode *dir,
-						   const struct qstr *qstr,
-						   const char **name,
-						   void **value, size_t *len)
-{
-	return -EOPNOTSUPP;
-}
-
 static inline int security_inode_create(struct inode *dir,
 					 struct dentry *dentry,
 					 umode_t mode)
diff --git a/security/security.c b/security/security.c
index 79d82cb6e469..e2857446fd32 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1132,17 +1132,6 @@ int security_inode_init_security_anon(struct inode *inode,
 			     context_inode);
 }
 
-int security_old_inode_init_security(struct inode *inode, struct inode *dir,
-				     const struct qstr *qstr, const char **name,
-				     void **value, size_t *len)
-{
-	if (unlikely(IS_PRIVATE(inode)))
-		return -EOPNOTSUPP;
-	return call_int_hook(inode_init_security, -EOPNOTSUPP, inode, dir,
-			     qstr, name, value, len);
-}
-EXPORT_SYMBOL(security_old_inode_init_security);
-
 #ifdef CONFIG_SECURITY_PATH
 int security_path_mknod(const struct path *dir, struct dentry *dentry, umode_t mode,
 			unsigned int dev)
-- 
2.25.1

