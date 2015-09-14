From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH] reiser4: fix supported flags check in reiser4_rename2_common().
Date: Mon, 14 Sep 2015 05:21:20 +0300
Message-ID: <1442197280-31580-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=pIqQPXY0UPmLfi5yVoSZ0fcuPTJM69UyElbGRTYSRjg=;
        b=x7RoQiLonYgYEfRffXcd05jlr+oV97upAo22yPXlnfjjGWumjo23YrLmrgtClaaHTU
         rcjqkDripfuDQmPdegahRDDCHagZDyrMysncMdEDN7bhMMm27sXCadt3opjXEpNJleOf
         zTtsPFBHku+/Wqq5zoGUZV/Fp8IQkcX1U1l0v6vnlREwJWO53EDUn2KbZQjNhdPUjdjh
         sU0k+9g0y1A2njeFgSGmmnAFNi6YnuL29KjWz5bWgXiq/NBEKKsXy59Jxr9YuJfFIS18
         Y1913G4v1ujKLvUA0kBfWSnU+sfrUgSHZ+P+e7Juqi83spWQKRhR5a+TD6KtudWXCL3k
         mQxA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>

---

This was left behind some time ago. I've just spotted a relevant warning.

 fs/reiser4/plugin/inode_ops_rename.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiser4/plugin/inode_ops_rename.c b/fs/reiser4/plugin/inode_ops_rename.c
index 6744e14..ddb7bf5 100644
--- a/fs/reiser4/plugin/inode_ops_rename.c
+++ b/fs/reiser4/plugin/inode_ops_rename.c
@@ -435,7 +435,7 @@ int reiser4_rename2_common(struct inode *old_dir /* directory where @old
 	 * We support:
 	 * - RENAME_NOREPLACE (no-op)
 	 */
-	if (flags & supported_flags != flags)
+	if ((flags & supported_flags) != flags)
 		return RETERR(-EINVAL);
 
 	old_entry = kzalloc(3 * sizeof(*old_entry) + 2 * sizeof(*new_lh) +
-- 
2.5.1

