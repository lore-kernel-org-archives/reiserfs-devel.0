From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv2 2/3] reiser4: block_alloc: sanitize grab_enabled modifications.
Date: Thu, 23 Oct 2014 11:18:04 +0400
Message-ID: <1414048685-4224-3-git-send-email-intelfx100@gmail.com>
References: <1414048685-4224-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0o+qa/igtLB9d1LI5pOrAvWXWsuWvheAL/WX1t5I9o0=;
        b=BRJaZ5wCNPD1rpagm+eyu8aLhcxjNH2HyW0n91ids6s4djG2HJfvzLhvrHNxvBbxpF
         nm/mgSxdhcX1lmWd2F672CY6Kqu4yQxSW2Z20kAI7QipvgFD6CbOwPAmA/s0LO5DPUKN
         F1rJQQPep7d8KbBll2WsLjdk1CGVv6l2gCdYcdWR2LmJGDTAWyFReIXVK++U+v0Xva/1
         DMkRSBJWOCzgT08VTR5E/gKh7SsITCSU/7SiI1J7DHV070ki9OWtuUN0iBcei5VY3Wu+
         1wf03o3JdHELanwxSymutsR2KQ1SujJZcv24YfwUeTrJB2j8Rv/HQ51a1cKq7kOoT5k6
         vgfQ==
In-Reply-To: <1414048685-4224-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

- check and modify ctx->grab_enabled in reiser4_grab_space(), not reiser4_grab()
- do not re-enable grab before doing second attempt in BA_CAN_COMMIT sequence
  (it is unneeded given the first change)

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/block_alloc.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 7f9f910..9339de7 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -270,12 +270,6 @@ reiser4_grab(reiser4_context * ctx, __u64 count, reiser4_ba_flags_t flags)
 
 	assert("vs-1276", ctx == get_current_context());
 
-	/* Do not grab anything on ro-mounted fs. */
-	if (rofs_super(ctx->super)) {
-		ctx->grab_enabled = 0;
-		return 0;
-	}
-
 	sbinfo = get_super_private(ctx->super);
 
 	spin_lock_reiser4_super(sbinfo);
@@ -300,9 +294,6 @@ reiser4_grab(reiser4_context * ctx, __u64 count, reiser4_ba_flags_t flags)
 
 	assert("nikita-2986", reiser4_check_block_counters(ctx->super));
 
-	/* disable grab space in current context */
-	ctx->grab_enabled = 0;
-
 unlock_and_ret:
 	spin_unlock_reiser4_super(sbinfo);
 
@@ -321,6 +312,12 @@ int reiser4_grab_space(__u64 count, reiser4_ba_flags_t flags)
 	if (!(flags & BA_FORCE) && !is_grab_enabled(ctx))
 		return 0;
 
+	/* Do not grab anything on ro-mounted fs. */
+	if (rofs_super(ctx->super)) {
+		ctx->grab_enabled = 0;
+		return 0;
+	}
+
 	ret = reiser4_grab(ctx, count, flags);
 	if (ret == -ENOSPC) {
 
@@ -328,10 +325,15 @@ int reiser4_grab_space(__u64 count, reiser4_ba_flags_t flags)
 		   present */
 		if (flags & BA_CAN_COMMIT) {
 			txnmgr_force_commit_all(ctx->super, 0);
-			ctx->grab_enabled = 1;
 			ret = reiser4_grab(ctx, count, flags);
 		}
 	}
+
+	if (ret == 0) {
+		/* disable grab space in current context */
+		ctx->grab_enabled = 0;
+	}
+
 	/*
 	 * allocation from reserved pool cannot fail. This is severe error.
 	 */
-- 
2.1.2

