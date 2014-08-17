From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv3 8/9] reiser4: block_alloc: add a "min_len" parameter to reiser4_blocknr_hint to limit allocated extent length from below.
Date: Mon, 18 Aug 2014 01:52:58 +0400
Message-ID: <1408312379-1990-9-git-send-email-intelfx100@gmail.com>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KydFUoLzqBIPQdI+IQwURuEujSqYgCb6H47bWZtbBYA=;
        b=swvMZfTjc5bfUPpFDYEdsYQJeIFIqaF0fPuB8vTiY+k3+osLCw4lAzfDTdI5hC6af6
         H2iqBSerfqOEUWevdx4TakcyrpPwFrObSwDxLNshI/aFFSxOooYlZzXMKO1EYvDVc7QP
         mlC+ja1Ry2t840m5I+o+GQtUc0ygs8jOTG3T97TlpLzfkVpRErJzHw7e66yGor3rvFtI
         wLcHuNazI2PsCxUt429al1RHR4dZco9IrFy9JDPGqduQxmUlth3k8dF3+cGx8YMRHqrS
         lTJDGJNC9bYsfG7TU54Ag5phbEg68sR75RfIbIf0HPCJ0UJ1CeUZdnpesPKOf5y+CO/t
         SQNg==
In-Reply-To: <1408312379-1990-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

The default has been 1, that is, the first encountered free extent with any length
from 1 to requested is allocated and returned.

So, allow changing minimal extent length to allocate.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/block_alloc.h         |  2 ++
 fs/reiser4/plugin/space/bitmap.c | 18 ++++++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/fs/reiser4/block_alloc.h b/fs/reiser4/block_alloc.h
index 08b3941..16f9810 100644
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
index 9beaf66..8309cf9 100644
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
 
 	/* There is only one bitmap search if max_dist was specified or first
 	   pass was from the beginning of the bitmap. We also do one pass for
@@ -1150,7 +1155,7 @@ static int alloc_blocks_backward(reiser4_blocknr_hint * hint, int needed,
 {
 	reiser4_block_nr search_start;
 	reiser4_block_nr search_end;
-	int actual_len;
+	int min_len, actual_len;
 
 	ON_DEBUG(struct super_block *super = reiser4_get_current_sb());
 
@@ -1164,8 +1169,13 @@ static int alloc_blocks_backward(reiser4_blocknr_hint * hint, int needed,
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
2.0.4

