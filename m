From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 6/6] reiser4: discard: allocate extent paddings.
Date: Sat, 13 Dec 2014 00:10:32 +0300
Message-ID: <1418418632-18396-7-git-send-email-intelfx100@gmail.com>
References: <1418418632-18396-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=INoZQMzv0qrdyxMccK/5zbC5XAoCmNoM/NNBQl8qkt8=;
        b=pe7wdtW6Qc2JHv+rY147EcmswXW4ZyOzMVcPE+FEBj6bpJ6EAcem40tCJUT+TJKfS5
         QzozyoujKK+Soq3Th+pexLo3mAPyTA1nyRLqn67YaMtLTObyt28yomou7myDDMCjek9s
         Vj+D9FfUg6MG9Rqhq1T6AerXaXM3LGIKlEsMV1tkun2lQ12oRRnjXjlCPSjOLqvHFSBt
         xEfumfzPGdcpj5SmWsiuvaOAiplFLxv24Cf5QtwGx+WPeXGbOAuEDmnxC0WvHBnyI62G
         pQP8zO+83xAKdRuAJNCzYhxW52njE0wjztgEuhaVYK0JYvMaB3a2m9H0z/1AOh+d5JFW
         HS1A==
In-Reply-To: <1418418632-18396-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Subsequent deallocation of newly allocated padding blocks is ensured by
writing the actual discarded extents back to the discard set.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/discard.c | 50 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 6 deletions(-)

diff --git a/fs/reiser4/discard.c b/fs/reiser4/discard.c
index 86ff6e4..68865d2 100644
--- a/fs/reiser4/discard.c
+++ b/fs/reiser4/discard.c
@@ -221,7 +221,15 @@ static inline struct list_head *get_next_at(struct list_head *pos,
 static inline int check_free_blocks(const reiser4_block_nr start,
 				    const reiser4_block_nr len)
 {
-	return reiser4_check_blocks(&start, &len, 0);
+	/*
+	 * NOTE: we do not use BA_PERMANENT in out allocations
+	 * even though these blocks are later deallocated with BA_DEFER
+	 * (via updating the delete set with newly allocated blocks).
+	 * The discard code is ran after the pre-commit hook so deallocated block
+	 * accounting is already done.
+	 */
+	return reiser4_alloc_blocks_exact (&start, &len, BLOCK_NOT_COUNTED,
+					   BA_FORMATTED) == 0;
 }
 
 /* Make sure that extents are sorted and merged */
@@ -255,6 +263,8 @@ static inline void check_blocknr_list_at(struct list_head *pos,
  * extent in the working space map. Try to "glue" the nearby
  * extents. Discard the (glued) extents with padded (or cut)
  * head and tail.
+ * The paddings, if any, are allocated before discarding, and the list
+ * is updated to contain all new allocations.
  *
  * Pre-conditions: @head points to the list of sorted and
  * merged extents.
@@ -274,6 +284,9 @@ static inline void check_blocknr_list_at(struct list_head *pos,
  * astart - actual start to discard (offset of the head padding);
  * alen - actual length to discard (length of glued aligned and padded extents).
  *
+ * estart - start of extent to be written back to the list
+ * eend - end (last block + 1) of extent to be written back to the list
+ *
  * Terminology in the comments:
  *
  * head - a part of extent at the beginning;
@@ -299,11 +312,14 @@ static int discard_sorted_merged_extents(struct list_head *head)
 		reiser4_block_nr len;
 		reiser4_block_nr end;
 		reiser4_block_nr astart; __s64 alen;
+		reiser4_block_nr estart, eend;
 
 		check_blocknr_list_at(pos, head);
 
 		start = blocknr_list_entry_start(pos);
 		len = blocknr_list_entry_len(pos);
+		estart = start;
+
 		/*
 		 * Step I. Cut or pad the head of extent
 		 *
@@ -326,6 +342,7 @@ static int discard_sorted_merged_extents(struct list_head *head)
 			 */
 			astart = start - headp;
 			alen = len + headp;
+			estart -= headp;
 		} else {
 			/*
 			 * head padding is dirty,
@@ -341,10 +358,11 @@ static int discard_sorted_merged_extents(struct list_head *head)
 		 *          Cut or pad the tail of the last extent.
 		 */
 		end = start + len;
+		eend = end;
 		tailp = extent_get_tailp(end, d_off, d_uni);
 
 		/*
-		 * This "gluing" loop updates @pos, @end, @tailp, @alen
+		 * This "gluing" loop updates @end, @tailp, @alen, @eend
 		 */
 		while (1) {
 			struct list_head *next;
@@ -366,10 +384,17 @@ static int discard_sorted_merged_extents(struct list_head *head)
 					/*
 					 * jump to the glued extent
 					 */
-					pos = next;
 					alen += (next_start + next_len - end);
 					end = next_start + next_len;
 					tailp = extent_get_tailp(end, d_off, d_uni);
+					eend = end;
+					/*
+					 * remove the glued extent from the list
+					 *
+					 * (don't update pos, current next->next
+					 * will become pos->next)
+					 */
+					blocknr_list_del(next);
 					/*
 					 * try to glue more extents
 					 */
@@ -395,13 +420,14 @@ static int discard_sorted_merged_extents(struct list_head *head)
 				 */
 				if (tailp == 0)
 					break;
-				else if (check_free_blocks(end, tailp))
+				else if (check_free_blocks(end, tailp)) {
 					/*
 					 * tail padding is clean,
 					 * pad the tail
 					 */
 					alen += tailp;
-				else
+					eend += tailp;
+				} else
 					/*
 					 * tail padding is dirty,
 					 * cut the tail
@@ -415,6 +441,18 @@ static int discard_sorted_merged_extents(struct list_head *head)
 		 * Step III. Discard the result
 		 */
 		if (alen > 0) {
+			assert("intelfx-74", estart < eend);
+			assert("intelfx-75", estart <= start);
+			assert("intelfx-76", estart <= astart);
+			assert("intelfx-77", start + len <= eend);
+			assert("intelfx-78", astart + alen <= eend);
+
+			/* here @eend becomes length */
+			eend -= estart;
+			assert("intelfx-79",
+			       reiser4_check_blocks(&estart, &eend, 1));
+			blocknr_list_update_extent(pos, &estart, &eend);
+
 			ret = __discard_extent(sb->s_bdev,
 					       astart * (sb->s_blocksize >> 9),
 					       alen * (sb->s_blocksize >> 9));
@@ -453,7 +491,7 @@ int discard_atom(txn_atom *atom, struct list_head *processed_set)
 	/* Sort the discard list, joining adjacent and overlapping extents. */
 	blocknr_list_sort_and_join(&discard_set);
 
-	/* Perform actual dirty work. */
+	/* Perform actual dirty work. The discard set may change at this point. */
 	ret = discard_sorted_merged_extents(&discard_set);
 
 	/* Add processed extents to the temporary list. */
-- 
2.1.3

