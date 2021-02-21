From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH] reiserfs: update reiserfs_xattrs_initialized() condition
Date: Sun, 21 Feb 2021 14:09:57 +0900
Message-ID: <20210221050957.3601-1-penguin-kernel@I-love.SAKURA.ne.jp>
References: <000000000000f5be7f05afcf862a@google.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <000000000000f5be7f05afcf862a@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org, mudongliangabcd@gmail.com, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, syzbot <syzbot+690cb1e51970435f9775@syzkaller.appspotmail.com>

syzbot is reporting NULL pointer dereference at reiserfs_security_init()
[1], for commit ab17c4f02156c4f7 ("reiserfs: fixup xattr_root caching") is
assuming that REISERFS_SB(s)->xattr_root != NULL in
reiserfs_xattr_jcreate_nblocks() despite that commit made
REISERFS_SB(sb)->priv_root != NULL && REISERFS_SB(s)->xattr_root == NULL
case possible.

I guess that commit 6cb4aff0a77cc0e6 ("reiserfs: fix oops while creating
privroot with selinux enabled") wanted to check xattr_root != NULL before
reiserfs_xattr_jcreate_nblocks(), for the changelog is talking about the
xattr root.

 The issue is that while creating the privroot during mount
 reiserfs_security_init calls reiserfs_xattr_jcreate_nblocks which
 dereferences the xattr root.  The xattr root doesn't exist, so we get an
 oops.

Therefore, update reiserfs_xattrs_initialized() to check both the privroot
and the xattr root.

[1] https://syzkaller.appspot.com/bug?id=8abaedbdeb32c861dc5340544284167dd0e46cde

Reported-and-tested-by: syzbot <syzbot+690cb1e51970435f9775@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Fixes: 6cb4aff0a77cc0e6 ("reiserfs: fix oops while creating privroot with selinux enabled")
---
 fs/reiserfs/xattr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/xattr.h b/fs/reiserfs/xattr.h
index c764352447ba..81bec2c80b25 100644
--- a/fs/reiserfs/xattr.h
+++ b/fs/reiserfs/xattr.h
@@ -43,7 +43,7 @@ void reiserfs_security_free(struct reiserfs_security_handle *sec);
 
 static inline int reiserfs_xattrs_initialized(struct super_block *sb)
 {
-	return REISERFS_SB(sb)->priv_root != NULL;
+	return REISERFS_SB(sb)->priv_root && REISERFS_SB(sb)->xattr_root;
 }
 
 #define xattr_size(size) ((size) + sizeof(struct reiserfs_xattr_header))
-- 
2.18.4

