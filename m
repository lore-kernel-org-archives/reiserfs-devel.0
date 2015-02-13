From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv5 02/10] reiser4: block_alloc: add a "monotonic_forward" parameter to reiser4_blocknr_hint to allocate blocks only in forward direction.
Date: Fri, 13 Feb 2015 03:48:11 +0300
Message-ID: <1423788499-30430-3-git-send-email-intelfx100@gmail.com>
References: <1423788499-30430-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kT6Bk6R3HF5LJzvWcdHGYTY2q0Qx8jfrK2Tdv9vxdsI=;
        b=MTuRAmAWWWK9V3ZREX4GRq/FQiXwZA2UavYjaJcrd/yYUitUtJwsq7ZL/68s5RAw13
         rFfFaXdccISlG1+Y+Uw3GuxK5omIm7hQpWxrL8b1HS88LagVkYQAfyxLBEr8v+HCkpEm
         QT9wRJOG4FD2igtYArcnI//fezv8tw2RaI+IvbTVrS7x7PLaTw4mQHsowaVbnwDoYAov
         kMqN9u5Y3vqmS4uE6NLlWuGu3MbwJ0U3rVh1GRP86sUNhTmlVCQ62gpB2igxRYs16c8E
         hnMbYcPZgHpGqcOiOR/wcdh6+cdqOYZzC/3/71gwYp1JJcxt5gQgpO6194C5fS9AKGea
         6nug==
In-Reply-To: <1423788499-30430-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/block_alloc.c         |  4 ++--
 fs/reiser4/block_alloc.h         |  5 +++--
 fs/reiser4/plugin/space/bitmap.c | 10 ++++++----
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 14dd378..56795ca 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -264,7 +264,7 @@ int reiser4_check_block_counters(const struct super_block *super)
 static int
 reiser4_grab(reiser4_context * ctx, __u64 count, reiser4_ba_flags_t flags)
 {
-	__s64 allowed_blocks;
+	__u64 allowed_blocks;
 	int ret = 0, use_reserved = flags & BA_RESERVED;
 	reiser4_super_info_data *sbinfo;
 
@@ -285,7 +285,7 @@ reiser4_grab(reiser4_context * ctx, __u64 count, reiser4_ba_flags_t flags)
 
 	if (flags & BA_SOME_SPACE) {
 		/* Reserve 25% of all free space */
-		if (allowed_blocks <= 0) {
+		if (allowed_blocks == 0) {
 			/* No space at all */
 			ret = RETERR(-ENOSPC);
 			goto unlock_and_ret;
diff --git a/fs/reiser4/block_alloc.h b/fs/reiser4/block_alloc.h
index bfc6be9..903bc8f 100644
--- a/fs/reiser4/block_alloc.h
+++ b/fs/reiser4/block_alloc.h
@@ -51,9 +51,10 @@ struct reiser4_blocknr_hint {
 	/* block allocator assumes that blocks, which will be mapped to disk,
 	   are in this specified block_stage */
 	block_stage_t block_stage;
-	/* If direction = 1 allocate blocks in backward direction from the end
-	 * of disk to the beginning of disk.  */
+	/* allocate blocks in backward direction */
 	unsigned int backward:1;
+	/* allocate blocks only in forward direction starting from blk */
+	unsigned int monotonic_forward:1;
 
 };
 
diff --git a/fs/reiser4/plugin/space/bitmap.c b/fs/reiser4/plugin/space/bitmap.c
index 3da3f6b..e56c336 100644
--- a/fs/reiser4/plugin/space/bitmap.c
+++ b/fs/reiser4/plugin/space/bitmap.c
@@ -1124,10 +1124,12 @@ static int alloc_blocks_forward(reiser4_blocknr_hint *hint, int needed,
 	actual_len =
 	    bitmap_alloc_forward(&search_start, &search_end, 1, needed);
 
-	/* There is only one bitmap search if max_dist was specified or first
-	   pass was from the beginning of the bitmap. We also do one pass for
-	   scanning bitmap in backward direction. */
-	if (!(actual_len != 0 || hint->max_dist != 0 || search_start == 0)) {
+	/* There is only one bitmap search if max_dist was specified, first
+	   pass was from the beginning of the bitmap, or if the monotonic flag
+	   has been set. Otherwise we also do one pass for scanning bitmap in
+	   backward direction. */
+	if (actual_len == 0 && search_start != 0 &&
+	    hint->max_dist == 0 && !hint->monotonic_forward) {
 		/* next step is a scanning from 0 to search_start */
 		search_end = search_start;
 		search_start = 0;
-- 
2.3.0

