From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 1/6] reiser4: block_alloc: split block allocation accounting logic into separate functions for re-use.
Date: Sat, 13 Dec 2014 00:10:27 +0300
Message-ID: <1418418632-18396-2-git-send-email-intelfx100@gmail.com>
References: <1418418632-18396-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wnzYZMgWr0NL/dkRC4ffaB4Y/vKYmQrVDCsb4Sz9HnM=;
        b=WQriU+AutjeFu2WlciiEFtfK5MD16UJx8MNnKA4xO9rxRvmKI6EjFP6sPR2B5J5hqu
         4xNnvPEkKfwjc4ilnkkQ1Dc0DoOzraxLnYFv/1vYPrTfaZOYVUoGgDwYgzFATY70Pq0J
         0Smv/+YgVeV6iLTVFPrhILkXfkxPTRpsOhS6MRz2aA9aLeh+zzhj0BoSLptjXjczSB0c
         5T4q/4uxTBxcV+QkgkIWk+sHdHbhhAq4Lsb7tvhioUGZvu1DDGjH5k97S2F3AOCJ4Azl
         g7hWcnZAYiTEHBXjXTlLUiOnfDzsZ1+C03b4J0MsYnDYYfwrTgIG8E6TADrQBtvrn+Wr
         blfw==
In-Reply-To: <1418418632-18396-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

This logic is also needed for the "exact" block allocation function which will
be added in the next commit.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/block_alloc.c | 139 +++++++++++++++++++++++++++++------------------
 1 file changed, 87 insertions(+), 52 deletions(-)

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 324b11c..be1a795 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -634,6 +634,76 @@ void get_blocknr_hint_default(reiser4_block_nr * result)
 	spin_unlock_reiser4_super(sbinfo);
 }
 
+static int reiser4_alloc_blocks_pre(reiser4_block_nr len,
+				    block_stage_t block_stage,
+				    reiser4_ba_flags_t flags)
+{
+	int ret = 0;
+
+	/* VITALY: allocator should grab this for internal/tx-lists/similar
+	   only. */
+/* VS-FIXME-HANS: why is this comment above addressed to vitaly (from vitaly)?*/
+	if (block_stage == BLOCK_NOT_COUNTED) {
+		ret = reiser4_grab_space_force(len, flags);
+	}
+
+	return ret;
+}
+
+static void reiser4_alloc_blocks_post_success(reiser4_block_nr blk,
+					      reiser4_block_nr len,
+					      block_stage_t block_stage,
+					      reiser4_ba_flags_t flags)
+{
+	reiser4_context *ctx;
+	reiser4_super_info_data *sbinfo;
+
+	ctx = get_current_context();
+	sbinfo = get_super_private(ctx->super);
+
+	assert("zam-680", blk < reiser4_block_count(ctx->super));
+	assert("zam-681", blk + len <= reiser4_block_count(ctx->super));
+
+	if (flags & BA_PERMANENT) {
+		/* we assume that current atom exists at this moment */
+		txn_atom *atom = get_current_atom_locked();
+		atom->nr_blocks_allocated += len;
+		spin_unlock_atom(atom);
+	}
+
+	switch (block_stage) {
+	case BLOCK_NOT_COUNTED:
+	case BLOCK_GRABBED:
+		grabbed2used(ctx, sbinfo, len);
+		break;
+	case BLOCK_UNALLOCATED:
+		fake_allocated2used(sbinfo, len, flags);
+		break;
+	case BLOCK_FLUSH_RESERVED:
+		{
+			txn_atom *atom = get_current_atom_locked();
+			flush_reserved2used(atom, len);
+			spin_unlock_atom(atom);
+		}
+		break;
+	default:
+		impossible("zam-531", "wrong block stage");
+	}
+}
+
+static void reiser4_alloc_blocks_post_failure(reiser4_block_nr len,
+					      block_stage_t block_stage)
+{
+	reiser4_context *ctx;
+	reiser4_super_info_data *sbinfo;
+
+	ctx = get_current_context();
+	sbinfo = get_super_private(ctx->super);
+
+	if (block_stage == BLOCK_NOT_COUNTED)
+		grabbed2free(ctx, sbinfo, len);
+}
+
 /* Allocate "real" disk blocks by calling a proper space allocation plugin
  * method. Blocks are allocated in one contiguous disk region. The plugin
  * independent part accounts blocks by subtracting allocated amount from grabbed
@@ -651,74 +721,39 @@ void get_blocknr_hint_default(reiser4_block_nr * result)
  *
  * @return -- 0 if success, error code otherwise.
  */
-int
-reiser4_alloc_blocks(reiser4_blocknr_hint * hint, reiser4_block_nr * blk,
-		     reiser4_block_nr * len, reiser4_ba_flags_t flags)
+int reiser4_alloc_blocks(reiser4_blocknr_hint * hint, reiser4_block_nr * blk,
+			 reiser4_block_nr * len, reiser4_ba_flags_t flags)
 {
-	__u64 needed = *len;
-	reiser4_context *ctx;
-	reiser4_super_info_data *sbinfo;
 	int ret;
+	reiser4_context *ctx;
 
 	assert("zam-986", hint != NULL);
+	assert("intelfx-68", blk != NULL);
+	assert("intelfx-69", len != NULL);
 
 	ctx = get_current_context();
-	sbinfo = get_super_private(ctx->super);
 
 	/* For write-optimized data we use default search start value, which is
 	 * close to last write location. */
 	if (flags & BA_USE_DEFAULT_SEARCH_START)
 		get_blocknr_hint_default(&hint->blk);
 
-	/* VITALY: allocator should grab this for internal/tx-lists/similar
-	   only. */
-/* VS-FIXME-HANS: why is this comment above addressed to vitaly (from vitaly)?*/
-	if (hint->block_stage == BLOCK_NOT_COUNTED) {
-		ret = reiser4_grab_space_force(*len, flags);
-		if (ret != 0)
-			return ret;
+	ret = reiser4_alloc_blocks_pre(*len, hint->block_stage, flags);
+
+	if (ret != 0) {
+		return ret;
 	}
 
-	ret =
-	    sa_alloc_blocks(reiser4_get_space_allocator(ctx->super),
-			    hint, (int)needed, blk, len);
+	ret = sa_alloc_blocks(reiser4_get_space_allocator(ctx->super),
+			      hint, (int)*len, blk, len);
 
-	if (!ret) {
-		assert("zam-680", *blk < reiser4_block_count(ctx->super));
-		assert("zam-681",
-		       *blk + *len <= reiser4_block_count(ctx->super));
-
-		if (flags & BA_PERMANENT) {
-			/* we assume that current atom exists at this moment */
-			txn_atom *atom = get_current_atom_locked();
-			atom->nr_blocks_allocated += *len;
-			spin_unlock_atom(atom);
-		}
-
-		switch (hint->block_stage) {
-		case BLOCK_NOT_COUNTED:
-		case BLOCK_GRABBED:
-			grabbed2used(ctx, sbinfo, *len);
-			break;
-		case BLOCK_UNALLOCATED:
-			fake_allocated2used(sbinfo, *len, flags);
-			break;
-		case BLOCK_FLUSH_RESERVED:
-			{
-				txn_atom *atom = get_current_atom_locked();
-				flush_reserved2used(atom, *len);
-				spin_unlock_atom(atom);
-			}
-			break;
-		default:
-			impossible("zam-531", "wrong block stage");
-		}
+	if (ret == 0) {
+		reiser4_alloc_blocks_post_success(*blk, *len, hint->block_stage,
+						  flags);
 	} else {
-		assert("zam-821",
-		       ergo(hint->max_dist == 0
-			    && !hint->backward, ret != -ENOSPC));
-		if (hint->block_stage == BLOCK_NOT_COUNTED)
-			grabbed2free(ctx, sbinfo, needed);
+		assert("zam-821", ergo(hint->max_dist == 0 && !hint->backward,
+				       ret != -ENOSPC));
+		reiser4_alloc_blocks_post_failure(*len, hint->block_stage);
 	}
 
 	return ret;
-- 
2.1.3

