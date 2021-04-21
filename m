From: Roberto Sassu <roberto.sassu@huawei.com>
Subject: [PATCH v2 2/6] reiserfs: Add missing calls to reiserfs_security_free()
Date: Wed, 21 Apr 2021 18:19:21 +0200
Message-ID: <20210421161925.968825-3-roberto.sassu@huawei.com>
References: <20210421161925.968825-1-roberto.sassu@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20210421161925.968825-1-roberto.sassu@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zohar@linux.ibm.com, jmorris@namei.org, paul@paul-moore.com, casey@schaufler-ca.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>, stable@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

Commit 57fe60df6241 ("reiserfs: add atomic addition of selinux attributes
during inode creation") defined reiserfs_security_free() to free the name
and value of a security xattr allocated by the active LSM through
security_old_inode_init_security(). However, this function is not called
in the reiserfs code.

Thus, this patch adds a call to reiserfs_security_free() whenever
reiserfs_security_init() is called, and initializes value to NULL, to avoid
to call kfree() on an uninitialized pointer.

Fixes: 57fe60df6241 ("reiserfs: add atomic addition of selinux attributes during inode creation")
Cc: stable@vger.kernel.org
Cc: Jeff Mahoney <jeffm@suse.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Reported-by: Mimi Zohar <zohar@linux.ibm.com>
Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 fs/reiserfs/namei.c          | 4 ++++
 fs/reiserfs/xattr_security.c | 1 +
 2 files changed, 5 insertions(+)

diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index e6eb05e2b2f1..6b5c51a77fae 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -695,6 +695,7 @@ static int reiserfs_create(struct user_namespace *mnt_userns, struct inode *dir,
 
 out_failed:
 	reiserfs_write_unlock(dir->i_sb);
+	reiserfs_security_free(&security);
 	return retval;
 }
 
@@ -778,6 +779,7 @@ static int reiserfs_mknod(struct user_namespace *mnt_userns, struct inode *dir,
 
 out_failed:
 	reiserfs_write_unlock(dir->i_sb);
+	reiserfs_security_free(&security);
 	return retval;
 }
 
@@ -877,6 +879,7 @@ static int reiserfs_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
 	retval = journal_end(&th);
 out_failed:
 	reiserfs_write_unlock(dir->i_sb);
+	reiserfs_security_free(&security);
 	return retval;
 }
 
@@ -1193,6 +1196,7 @@ static int reiserfs_symlink(struct user_namespace *mnt_userns,
 	retval = journal_end(&th);
 out_failed:
 	reiserfs_write_unlock(parent_dir->i_sb);
+	reiserfs_security_free(&security);
 	return retval;
 }
 
diff --git a/fs/reiserfs/xattr_security.c b/fs/reiserfs/xattr_security.c
index bb2a0062e0e5..b1ad93b60475 100644
--- a/fs/reiserfs/xattr_security.c
+++ b/fs/reiserfs/xattr_security.c
@@ -50,6 +50,7 @@ int reiserfs_security_init(struct inode *dir, struct inode *inode,
 	int error;
 
 	sec->name = NULL;
+	sec->value = NULL;
 
 	/* Don't add selinux attributes on xattrs - they'll never get used */
 	if (IS_PRIVATE(dir))
-- 
2.25.1

