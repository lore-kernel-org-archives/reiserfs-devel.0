From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv2 2/7] reiser4: block_alloc: add a "forward" parameter to reiser4_blocknr_hint to allocate blocks only in forward direction.
Date: Sun, 17 Aug 2014 20:26:30 +0400
Message-ID: <1408292795-1841-3-git-send-email-intelfx100@gmail.com>
References: <1408292795-1841-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mleSlEoSgie93V0hPsaILHcvR8iCZQ7UBO6f7XH4SmY=;
        b=kf4JjT0Yl9wyJPxp+JSn/KvTBw7+/p5vB1RapcZOOrUqxLlM/mMwLwqu2nUOYsp7le
         RUOIOFpCqJzbuj3UkHcQYMgXM4gD0tJut4Sqkq7Zk8TQlWvHeEXh4fq0MaWt61FxIG8E
         jOnP7uUwk4MPp3QJO1Nt9fXixGQetWs72HWG15hqrEbUrRAmvbZ9fkTmjEO6GpG9+Z5K
         VW6YqZ8OWVJ0VlTa8v7Ay7kq0TYLUj+QnKpbPYLDyP2j7aT3TY+IhgRTENKeTSglZDkf
         c0dPPGCEXZbyUTn4tzBloWuOPJoUB0yH813OZVydFRqj+Z+IiUnz7/k0SmlcAtd6xwq4
         K6zA==
In-Reply-To: <1408292795-1841-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/block_alloc.h         | 5 +++--
 fs/reiser4/plugin/space/bitmap.c | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/reiser4/block_alloc.h b/fs/reiser4/block_alloc.h
index bfc6be9..08b3941 100644
--- a/fs/reiser4/block_alloc.h
+++ b/fs/reiser4/block_alloc.h
@@ -51,9 +51,10 @@ struct reiser4_blocknr_hint {
 	/* block allocator assumes that blocks, which will be mapped to disk,
 	   are in this specified block_stage */
 	block_stage_t block_stage;
-	/* If direction = 1 allocate blocks in backward direction from the end
-	 * of disk to the beginning of disk.  */
+	/* Allocate blocks only in backward direction starting from blk. */
 	unsigned int backward:1;
+	/* Allocate blocks only in forward direction starting from blk. */
+	unsigned int forward:1;
 
 };
 
diff --git a/fs/reiser4/plugin/space/bitmap.c b/fs/reiser4/plugin/space/bitmap.c
index 3da3f6b..9beaf66 100644
--- a/fs/reiser4/plugin/space/bitmap.c
+++ b/fs/reiser4/plugin/space/bitmap.c
@@ -1127,7 +1127,8 @@ static int alloc_blocks_forward(reiser4_blocknr_hint *hint, int needed,
 	/* There is only one bitmap search if max_dist was specified or first
 	   pass was from the beginning of the bitmap. We also do one pass for
 	   scanning bitmap in backward direction. */
-	if (!(actual_len != 0 || hint->max_dist != 0 || search_start == 0)) {
+	if (actual_len == 0 && search_start != 0 &&
+	    hint->max_dist == 0 && hint->forward == 0) {
 		/* next step is a scanning from 0 to search_start */
 		search_end = search_start;
 		search_start = 0;
-- 
2.0.4

