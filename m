From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: [PATCH v9 1/4] reiserfs: Add security prefix to xattr name in reiserfs_security_write()
Date: Wed, 29 Mar 2023 15:04:12 +0200
Message-ID: <20230329130415.2312521-2-roberto.sassu@huaweicloud.com>
References: <20230329130415.2312521-1-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20230329130415.2312521-1-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, stable@vger.kernel.org

From: Roberto Sassu <roberto.sassu@huawei.com>

Reiserfs sets a security xattr at inode creation time in two stages: first,
it calls reiserfs_security_init() to obtain the xattr from active LSMs;
then, it calls reiserfs_security_write() to actually write that xattr.

Unfortunately, it seems there is a wrong expectation that LSMs provide the
full xattr name in the form 'security.<suffix>'. However, LSMs always
provided just the suffix, causing reiserfs to not write the xattr at all
(if the suffix is shorter than the prefix), or to write an xattr with the
wrong name.

Add a temporary buffer in reiserfs_security_write(), and write to it the
full xattr name, before passing it to reiserfs_xattr_set_handle().

Since the 'security.' prefix is always prepended, remove the name length
check.

Cc: stable@vger.kernel.org # v2.6.x
Fixes: 57fe60df6241 ("reiserfs: add atomic addition of selinux attributes during inode creation")
Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 fs/reiserfs/xattr_security.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/reiserfs/xattr_security.c b/fs/reiserfs/xattr_security.c
index 6bffdf9a4fd..b0c354ab113 100644
--- a/fs/reiserfs/xattr_security.c
+++ b/fs/reiserfs/xattr_security.c
@@ -95,11 +95,13 @@ int reiserfs_security_write(struct reiserfs_transaction_handle *th,
 			    struct inode *inode,
 			    struct reiserfs_security_handle *sec)
 {
+	char xattr_name[XATTR_NAME_MAX + 1];
 	int error;
-	if (strlen(sec->name) < sizeof(XATTR_SECURITY_PREFIX))
-		return -EINVAL;
 
-	error = reiserfs_xattr_set_handle(th, inode, sec->name, sec->value,
+	snprintf(xattr_name, sizeof(xattr_name), "%s%s", XATTR_SECURITY_PREFIX,
+		 sec->name);
+
+	error = reiserfs_xattr_set_handle(th, inode, xattr_name, sec->value,
 					  sec->length, XATTR_CREATE);
 	if (error == -ENODATA || error == -EOPNOTSUPP)
 		error = 0;
-- 
2.25.1

