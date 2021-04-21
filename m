From: Roberto Sassu <roberto.sassu@huawei.com>
Subject: [PATCH v2 1/6] xattr: Complete constify ->name member of "struct xattr"
Date: Wed, 21 Apr 2021 18:19:20 +0200
Message-ID: <20210421161925.968825-2-roberto.sassu@huawei.com>
References: <20210421161925.968825-1-roberto.sassu@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20210421161925.968825-1-roberto.sassu@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zohar@linux.ibm.com, jmorris@namei.org, paul@paul-moore.com, casey@schaufler-ca.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>, stable@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

This patch completes commit 9548906b2bb7 ('xattr: Constify ->name member of
"struct xattr"'). It fixes the documentation of the inode_init_security
hook, by removing the xattr name from the objects that are expected to be
allocated by LSMs (only the value is allocated).

Also, it removes the kfree() of name and setting it to NULL in
reiserfs_security_free().

Fixes: 9548906b2bb7 ('xattr: Constify ->name member of "struct xattr"')
Cc: stable@vger.kernel.org
Cc: Jeff Mahoney <jeffm@suse.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 fs/reiserfs/xattr_security.c | 2 --
 include/linux/lsm_hooks.h    | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/reiserfs/xattr_security.c b/fs/reiserfs/xattr_security.c
index 8965c8e5e172..bb2a0062e0e5 100644
--- a/fs/reiserfs/xattr_security.c
+++ b/fs/reiserfs/xattr_security.c
@@ -95,9 +95,7 @@ int reiserfs_security_write(struct reiserfs_transaction_handle *th,
 
 void reiserfs_security_free(struct reiserfs_security_handle *sec)
 {
-	kfree(sec->name);
 	kfree(sec->value);
-	sec->name = NULL;
 	sec->value = NULL;
 }
 
diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index fb7f3193753d..c5498f5174ce 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -219,8 +219,8 @@
  *	This hook is called by the fs code as part of the inode creation
  *	transaction and provides for atomic labeling of the inode, unlike
  *	the post_create/mkdir/... hooks called by the VFS.  The hook function
- *	is expected to allocate the name and value via kmalloc, with the caller
- *	being responsible for calling kfree after using them.
+ *	is expected to allocate the value via kmalloc, with the caller
+ *	being responsible for calling kfree after using it.
  *	If the security module does not use security attributes or does
  *	not wish to put a security attribute on this particular inode,
  *	then it should return -EOPNOTSUPP to skip this processing.
-- 
2.25.1

