From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH] reiserfs: Initialize sec->length in reiserfs_security_init().
Date: Thu, 11 May 2023 23:48:45 +0900
Message-ID: <a800496b-cae9-81bf-c79e-d8342418c5be@I-love.SAKURA.ne.jp>
References: <000000000000d368dd05fb5dd7d3@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <000000000000d368dd05fb5dd7d3@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: syzbot <syzbot+00a3779539a23cbee38c@syzkaller.appspotmail.com>, syzkaller-bugs@googlegroups.com, Paul Moore <paul@paul-moore.com>, Roberto Sassu <roberto.sassu@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>, Casey Schaufler <casey@schaufler-ca.com>
Cc: reiserfs-devel@vger.kernel.org, glider@google.com, linux-fsdevel@vger.kernel.org

syzbot is reporting that sec->length is not initialized.

Since security_inode_init_security() returns 0 when initxattrs is provided
but call_int_hook(inode_init_security) returned -EOPNOTSUPP, control will
reach to "if (sec->length && ...) {" without initializing sec->length.

Reported-by: syzbot <syzbot+00a3779539a23cbee38c@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=00a3779539a23cbee38c
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Fixes: 52ca4b6435a4 ("reiserfs: Switch to security_inode_init_security()")
---
 fs/reiserfs/xattr_security.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/reiserfs/xattr_security.c b/fs/reiserfs/xattr_security.c
index 6e0a099dd788..078dd8cc312f 100644
--- a/fs/reiserfs/xattr_security.c
+++ b/fs/reiserfs/xattr_security.c
@@ -67,6 +67,7 @@ int reiserfs_security_init(struct inode *dir, struct inode *inode,
 
 	sec->name = NULL;
 	sec->value = NULL;
+	sec->length = 0;
 
 	/* Don't add selinux attributes on xattrs - they'll never get used */
 	if (IS_PRIVATE(dir))
-- 
2.18.4

