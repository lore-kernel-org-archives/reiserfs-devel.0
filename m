From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv4 09/10] reiser4: block_alloc: add a "min_len" parameter to reiser4_blocknr_hint to limit allocated extent length from below.
Date: Sat, 13 Dec 2014 00:00:45 +0300
Message-ID: <1418418046-10933-10-git-send-email-intelfx100@gmail.com>
References: <1418418046-10933-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ngVhTAIDQalAvbQydpoKxY0geFTd1lKtfuZvhSFq/cI=;
        b=i67cRSYE6G+NthOcnYRbDbog4+5IWo66MVv38175+113XODx0zpSoN4jgZvTNKmmlT
         MDJbWuo01WmySZy+ltVkqBMk9EtlVYR1o3VhFlNkMqLgJfG8ThmJWu/ETC9z1qcx2dhh
         1fDvsOLOVJrw1k0Zkq6IDDJMbcppCDOKRQmL4LZD5vXP7n3fePNL7220JRU+NsCRiI6n
         PbtGy8Rlg4nvn9svownQCnF44/mfPEddSfH78RZJoiOicNbDFcitNz2DbBlZTdsPJ98h
         RJOR34IWx2v6w5f+ywz/UMebp7r10c/DXmGKNLS9C3kQlVBHZunQISMhbkKCe9WHqz3q
         wphQ==
In-Reply-To: <1418418046-10933-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

The default has been 1, that is, the first encountered free extent with any length
from 1 to requested is allocated and returned.

So, allow changing minimal extent length to allocate.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/block_alloc.h         |  2 ++
 fs/reiser4/plugin/space/bitmap.c | 20 +++++++++++++++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/fs/reiser4/block_alloc.h b/fs/reiser4/block_alloc.h
index 903bc8f..ac1a747 100644
--- a/fs/reiser4/block_alloc.h
+++ b/fs/reiser4/block_alloc.h
@@ -45,6 +45,8 @@ struct reiser4_blocknr_hint {
 	reiser4_block_nr blk;
 	/* if not zero, it is a region size we search for free blocks in */
 	reiser4_block_nr max_dist;
+	/* if not zero, minimal length of an extent to allocate */
+	reiser4_block_nr min_len;
 	/* level for allocation, may be useful have branch-level and higher
 	   write-optimized. */
 	tree_level level;
diff --git a/fs/reiser4/plugin/space/bitmap.c b/fs/reiser4/plugin/space/bitmap.c
index 0ce07da..7c0a1e4 100644
--- a/fs/reiser4/plugin/space/bitmap.c
+++ b/fs/reiser4/plugin/space/bitmap.c
@@ -1101,7 +1101,7 @@ static int alloc_blocks_forward(reiser4_blocknr_hint *hint, int needed,
 				reiser4_block_nr *start, reiser4_block_nr *len)
 {
 	struct super_block *super = get_current_context()->super;
-	int actual_len;
+	int min_len, actual_len;
 
 	reiser4_block_nr search_start;
 	reiser4_block_nr search_end;
@@ -1117,12 +1117,17 @@ static int alloc_blocks_forward(reiser4_blocknr_hint *hint, int needed,
 		    LIMIT(hint->blk + hint->max_dist,
 			  reiser4_block_count(super));
 
+	if (hint->min_len == 0)
+		min_len = 1;
+	else
+		min_len = (int)hint->min_len;
+
 	/* We use @hint -> blk as a search start and search from it to the end
 	   of the disk or in given region if @hint -> max_dist is not zero */
 	search_start = hint->blk;
 
 	actual_len =
-	    bitmap_alloc_forward(&search_start, &search_end, 1, needed);
+	    bitmap_alloc_forward(&search_start, &search_end, min_len, needed);
 
 	/* There is only one bitmap search if max_dist was specified, first
 	   pass was from the beginning of the bitmap, or if the monotonic flag
@@ -1134,7 +1139,7 @@ static int alloc_blocks_forward(reiser4_blocknr_hint *hint, int needed,
 		search_end = search_start;
 		search_start = 0;
 		actual_len =
-		    bitmap_alloc_forward(&search_start, &search_end, 1, needed);
+		    bitmap_alloc_forward(&search_start, &search_end, min_len, needed);
 	}
 	if (actual_len == 0)
 		return RETERR(-ENOSPC);
@@ -1151,7 +1156,7 @@ static int alloc_blocks_backward(reiser4_blocknr_hint * hint, int needed,
 {
 	reiser4_block_nr search_start;
 	reiser4_block_nr search_end;
-	int actual_len;
+	int min_len, actual_len;
 
 	ON_DEBUG(struct super_block *super = reiser4_get_current_sb());
 
@@ -1165,8 +1170,13 @@ static int alloc_blocks_backward(reiser4_blocknr_hint * hint, int needed,
 	else
 		search_end = search_start - hint->max_dist;
 
+	if (hint->min_len == 0)
+		min_len = 1;
+	else
+		min_len = (int)hint->min_len;
+
 	actual_len =
-	    bitmap_alloc_backward(&search_start, &search_end, 1, needed);
+	    bitmap_alloc_backward(&search_start, &search_end, min_len, needed);
 	if (actual_len == 0)
 		return RETERR(-ENOSPC);
 	if (actual_len < 0)
-- 
2.1.3

