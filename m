From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 2/3] reiser4: block_alloc: sanitize grab_enabled modifications.
Date: Mon, 18 Aug 2014 18:14:42 +0400
Message-ID: <1408371283-1319-3-git-send-email-intelfx100@gmail.com>
References: <1408371283-1319-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wE6nLNTn6i0Qur0Q03rN/2XIoh0P6rZ7sjDBnogpsjM=;
        b=d84XRUi8+KV0AE624vSM6iS6nUQDP5L0nOVgqCvDKL1RmY6CrCDS9eKGo1GDrALsQ2
         8y54OU8iTisxnWohbeYp3I+SfHyyXyzhWvNSsU99/kZ00zPFALwwI3al3pn5EQlk/oYF
         Pidn7pZOgwNibPJbwtKKCjklArpGpoow2AS6xmW53iYPzOmERs3FGBTgjffI5ZcWUYZR
         +tsjGBymZJXfv95rnzuQhJJJGwqmZdkQZQ6BK6MAcCcNPS+o736UPP+YpSJ6wbeU331C
         FzKs08I8qpACK1jCfFdHhiOU9q4oiP5GWFBHkU5413ycNMQMUTOQpkY7hXSpq0Udu5CI
         28/g==
In-Reply-To: <1408371283-1319-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

- move all grab_enabled checks and modifications into reiser4_grab_space();
- only disable grab if not BA_FORCE;
- do not re-enable grab before doing second attempt in BA_CAN_COMMIT sequence
  (feels hackish and is unneeded after the first change).

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/block_alloc.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 7f9f910..a30f7b9 100644
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
+	if (!(flags & BA_FORCE) && (ret == 0)) {
+		/* disable grab space in current context */
+		ctx->grab_enabled = 0;
+	}
+
 	/*
 	 * allocation from reserved pool cannot fail. This is severe error.
 	 */
-- 
2.0.4

