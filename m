From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv2 1/3] reiser4: deferred (BA_DEFER) deallocations do not make use of target stage.
Date: Mon,  8 Sep 2014 22:43:49 +0400
Message-ID: <1410201831-11722-2-git-send-email-intelfx100@gmail.com>
References: <1410201831-11722-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=T46W9CfXsECJZe2Dor1R1/vl4h5CsXux18WOiRH/w3M=;
        b=ySIzaYIMlT/PRy5xQnwTsakCVPR2eHPdQEXTMzdYB92vUmEhqEkUYECg2NpBEiIdVj
         fBiXoTFeqbUX6kXp2V7zFqr53FB3KJWzWj0SdsDPTb35TsIJS+M75CnDa/NK8jXaFTEt
         H/QEKKM59vY/L8bi4K8X0a15ljFP0voyDDvaOW4DJLxrvlMB+CPrQ8L+GPDgkl0+gIsw
         hBeVhj5prMpCbO6YAuOWuPX0uq8qTX401FDvzBuFASyvAdAOoY5E3wjylp3gGpnzilcE
         9uZK5nLb8I3IZmDdNev4CARA1dITqyNWVU+NWqdPvphNBlP0qBJYldmzV4HwtqsP+K2N
         5CkQ==
In-Reply-To: <1410201831-11722-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

...so remove it (set to 0) in all cases to avoid confusion.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/block_alloc.c  |  6 ++++++
 fs/reiser4/plugin/txmod.c | 15 +++++----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 324b11c..6e7030a 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -1010,6 +1010,12 @@ reiser4_dealloc_blocks(const reiser4_block_nr * start,
 
 	if ((flags & BA_DEFER) ||
 	    reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+		/*
+		 * These blocks will be later deallocated by apply_dset().
+		 * It is equivalent to a non-deferred deallocation with target
+		 * stage BLOCK_NOT_COUNTED.
+		 */
+
 		/* store deleted block numbers in the atom's deferred delete set
 		   for further actual deletion */
 		do {
diff --git a/fs/reiser4/plugin/txmod.c b/fs/reiser4/plugin/txmod.c
index 63d461f..5982b4c 100644
--- a/fs/reiser4/plugin/txmod.c
+++ b/fs/reiser4/plugin/txmod.c
@@ -287,8 +287,7 @@ static int forward_relocate_unformatted(flush_pos_t *flush_pos,
 		 * on relocating - free nodes which are going to be
 		 * relocated
 		 */
-		reiser4_dealloc_blocks(&start, &allocated,
-				       BLOCK_ALLOCATED, BA_DEFER);
+		reiser4_dealloc_blocks(&start, &allocated, 0, BA_DEFER);
 
 	/* assign new block numbers to protected nodes */
 	assign_real_blocknrs(flush_pos, oid, index, allocated, first_allocated);
@@ -386,16 +385,13 @@ static squeeze_result squeeze_relocate_unformatted(znode *left,
 	result = put_unit_to_end(left, key, &copy_extent);
 
 	if (result == -E_NODE_FULL) {
-		int target_block_stage;
 		/*
 		 * free blocks which were just allocated
 		 */
-		target_block_stage =
-			(state ==
-			 ALLOCATED_EXTENT) ? BLOCK_FLUSH_RESERVED :
-			BLOCK_UNALLOCATED;
 		reiser4_dealloc_blocks(&first_allocated, &allocated,
-				       target_block_stage,
+				       (state == ALLOCATED_EXTENT)
+				       ? BLOCK_FLUSH_RESERVED
+				       : BLOCK_UNALLOCATED,
 				       BA_PERMANENT);
 		/*
 		 * rewind the preceder
@@ -408,8 +404,7 @@ static squeeze_result squeeze_relocate_unformatted(znode *left,
 		/*
 		 * free nodes which were relocated
 		 */
-		reiser4_dealloc_blocks(&start, &allocated,
-				       BLOCK_ALLOCATED, BA_DEFER);
+		reiser4_dealloc_blocks(&start, &allocated, 0, BA_DEFER);
 	}
 	/*
 	 * assign new block numbers to protected nodes
-- 
2.1.0

