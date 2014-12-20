From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4: precise discard - general case
Date: Sat, 20 Dec 2014 21:24:45 +0100
Message-ID: <5495DB0D.1080005@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090008060304060707080903"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :content-type;
        bh=mlkDmVbFWA4hWIcgcIDROYRON/WnWLPVcf5VxoXO80Y=;
        b=H4Bv9osI9dhOU6fmSBj1L1Fin6WM3xtTFnbnyb2cCz0eL4eHjJDj2se6soGvO9CZ0Z
         iwQdu2DK3WrCGw4AcTHQvAdpPsddW/Gyt9gpBKpnINGg5wDGrAwZZIuk9+WHd2XMZbU0
         lxK9gmyefAf01x7iuTBFVz4mAnXrmr935aMiVAfk11sqLiymhKGwhXnPY6fw/7gO1Suu
         ztkkdOtmf6ZZyEBL7Yb+1TlAxY/7bwLkMYGtM3zCypI6GB09o9xFViYTvzaygMy9Aynq
         MPkcS9o7g5cUhcWELquJp86f71nJF0BHQ07ImPpDIENjgo+zoWQvAknbU8gXqJwI8AJS
         ZwVg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>
Cc: Ivan Shapovalov <intelfx100@gmail.com>

This is a multi-part message in MIME format.
--------------090008060304060707080903
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

This is the promised generalization, which is supposed to work for all 
discard
offsets and all discard unit sizes without any restrictions.

Complications in comparison with the previous implementation:

In this general case we need "precise" coordinates, where every 
individual byte
can be addressed. All local variables, which represent precise 
coordinates are
denoted with "prefixes" (a_len, d_off, p_tailp, etc). Local variables, 
which represent
"non-precise" coordinates (they are usually of type reiser4_block_nr) 
are denoted
without prefixes (start, len, end, tailp, etc).

Blocks, which contain head and tail paddings are now calculated using the
function size_in_blocks(), which actually is an expression for the 
minimal number
of blocks containing the precise extent.

The next trouble is "peculiarity in 0", encountered when calculating the 
blocks of
head padding. if discard offset is different from 0, then the first 
discard unit of the
partition is partial (its other part doesn't belong to our partition, so 
we can not
discard it). We handle this peculiarity by an additional check.

In other bits everything is the same.

Possible optimization: If discard unit sizes are always powers of 2, 
then it makes
sense to replace "do_div(offset, unit_size)" with "offset & (unit_size - 
1)".

Mount options discard.offset=xxx,discard.unit=yyy are to emulate various
discard unit sizes and offsets on devices _without_ trim support (e.g. 
HDDs).
This is only for debugging purposes, don't use it for real SSD devices: 
the kernel
retrieves the discard parameters on its own.

This patch is against the patch series of Ivan Shapovalov:
http://marc.info/?l=reiserfs-devel&m=141841865432082&w=2

Current status: not well-tested.

Edward.

--------------090008060304060707080903
Content-Type: text/x-patch;
 name="7-reiser4-precise-discard-generic-case.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="7-reiser4-precise-discard-generic-case.patch"

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/discard.c |  213 +++++++++++++++++++++++++--------------------------
 1 file changed, 106 insertions(+), 107 deletions(-)

--- a/fs/reiser4/discard.c
+++ b/fs/reiser4/discard.c
@@ -68,39 +68,13 @@
 #include "debug.h"
 #include "txnmgr.h"
 #include "super.h"
+#include "plugin/cluster.h"
 
 #include <linux/slab.h>
 #include <linux/fs.h>
 #include <linux/blkdev.h>
 #include <linux/lcm.h>
 
-/*
- * For 1-dimension integer lattice (a,b) (a - offset, b - step)
- * find its minimal sub-lattice which can be represented in the
- * more coarse grained (scaled with factor r >= 1) coordinates.
- * If representation is impossible, return 1. Otherwise return 0.
- *
- * @a - offset of the lattice in the initial coordinates;
- * @b - step of the lattice in the initial coordinates;
- * @x - offset of the sub-lattice in the scaled coordinates;
- * @y - step of the sub-lattice in the scaled coordinates;
- * @r - scale factor.
- */
-static int convert_lattice_params(int *x, int *y, int a, int b, int r)
-{
-	assert("edward-1635", b != 0);
-	assert("edward-1636", r >= 1);
-
-	if (a % r)
-		return 1;
-	*x = a / r;
-	*y = lcm(b, r) / r;
-
-	/* normalize offset */
-	*x = *x % *y;
-	return 0;
-}
-
 #define MAX_DISCARD_UNIT_BYTES (1 << 20)
 
 /*
@@ -114,7 +88,6 @@ static int convert_lattice_params(int *x
  */
 void check_discard_params(struct super_block *sb)
 {
-	int ret;
 	reiser4_super_info_data *sbinfo;
 	discard_params *sb_discard;
 	struct queue_limits *limits;
@@ -148,21 +121,11 @@ void check_discard_params(struct super_b
 		warning("", "%s: unsupported erase unit (%d)", sb->s_id, unit);
 		goto disable;
 	}
-	ret = convert_lattice_params(&sb_discard->offset,
-				     &sb_discard->unit,
-				     offset,
-				     unit,
-				     sb->s_blocksize);
-	if (ret) {
-		warning("", "%s: unsupported alignment (%d)", sb->s_id, offset);
-		goto disable;
-	}
-	if (sb_discard->unit > MAX_DISCARD_UNIT_BYTES / sb->s_blocksize) {
-		warning("", "%s: unsupported erase unit (%d)", sb->s_id, unit);
-		goto disable;
-	}
+	sb_discard->offset = offset;
+	sb_discard->unit = unit;
+
 	printk("reiser4: %s: enable discard support "
-	       "(erase unit %u blocks, alignment %u blocks)\n",
+	       "(erase unit %u bytes, alignment %u bytes)\n",
 	       sb->s_id, sb_discard->unit, sb_discard->offset);
 	return;
 disable:
@@ -171,8 +134,8 @@ disable:
 	return;
 }
 
-static int __discard_extent(struct block_device *bdev, sector_t start,
-                            sector_t len)
+static int discard_precise_extent(struct block_device *bdev, sector_t start,
+				  sector_t len)
 {
 	assert("intelfx-21", bdev != NULL);
 
@@ -181,27 +144,31 @@ static int __discard_extent(struct block
 }
 
 /*
- * Return size of head padding of an extent on a lattice
- * with step @ulen and offset @uoff.
- * @start - the start offset of the extent.
+ * @start - start of precise extent (offset of the first byte);
+ * return lenght of the head padding in bytes
  */
-static int extent_get_headp(reiser4_block_nr start, int uoff, int ulen)
+static int precise_extent_headp(__u64 start, int uoff, int ulen)
 {
 	__u64 headp;
-	headp = ulen + start - uoff;
+
+	assert("edward-1636", uoff < ulen);
+
+	headp = start + ulen - uoff;
 	headp = do_div(headp, ulen);
 	return headp;
 }
 
 /*
- * Return size of tail padding of an extent on a lattice
- * with step @ulen and offset @uoff.
- * @end - the end offset of the extent.
+ * @end - end of precise extent (offset of the last byte + 1);
+ * return lenght of the tail padding in bytes
  */
-static int extent_get_tailp(reiser4_block_nr end, int uoff, int ulen)
+static int precise_extent_tailp(__u64 end, int uoff, int ulen)
 {
 	__u64 tailp;
-	tailp = ulen + end - uoff;
+
+	assert("edward-1637", uoff < ulen);
+
+	tailp = end + ulen - uoff;
 	tailp = do_div(tailp, ulen);
 	if (tailp)
 		tailp = ulen - tailp;
@@ -228,8 +195,9 @@ static inline int check_free_blocks(cons
 	 * The discard code is ran after the pre-commit hook so deallocated block
 	 * accounting is already done.
 	 */
-	return reiser4_alloc_blocks_exact (&start, &len, BLOCK_NOT_COUNTED,
-					   BA_FORMATTED) == 0;
+	return reiser4_alloc_blocks_exact(&start,
+					  &len,
+					  BLOCK_NOT_COUNTED, BA_FORMATTED) == 0;
 }
 
 /* Make sure that extents are sorted and merged */
@@ -258,34 +226,33 @@ static inline void check_blocknr_list_at
 #endif
 
 /*
- * discard_sorted_merged_extents() - scan the list of sorted and
- * merged extents and check head and tail paddings of each
- * extent in the working space map. Try to "glue" the nearby
- * extents. Discard the (glued) extents with padded (or cut)
- * head and tail.
- * The paddings, if any, are allocated before discarding, and the list
+ * discard_precise_extents() - scan the list of sorted and merged extents and
+ * check head and tail paddings of each extent in the working space map. Try to
+ * "glue" the nearby extents. Discard the resulted (glued, padded, or cut)
+ * extents.
+ *
+ * Head and tail paddings, if any, are allocated before discarding, and the list
  * is updated to contain all new allocations.
  *
- * Pre-conditions: @head points to the list of sorted and
- * merged extents.
+ * Pre-conditions: @head points to the list of sorted and merged extents.
  *
  * Local variables:
  *
- * d_uni - discard unit size (in blocks);
- * d_off - discard alignment (in blocks);
+ * d_uni - discard unit size (in bytes);
+ * d_off - discard alignment (in bytes);
  *
- * start - offset of the first block of the extent;
- * len - length of the extent;
- * end - offset of the first block beyond extent;
+ * start - start of extent (in blocks);
+ * len - length of extent (in blocks);
+ * end - end of extent (last block + 1);
  *
- * headp - size of head padding of the extent;
- * tailp - size of tail padding of the extent;
+ * headp - size of head padding of extent (in blocks);
+ * tailp - size of tail padding of extent (in blocks);
  *
- * astart - actual start to discard (offset of the head padding);
- * alen - actual length to discard (length of glued aligned and padded extents).
+ * a_start - start of resulted (glued, aligned and padded) extent to discard;
+ * a_len - length of resulted (glued, aligned and padded) extent to discard;
  *
- * estart - start of extent to be written back to the list
- * eend - end (last block + 1) of extent to be written back to the list
+ * estart - start of extent to be written back to the list (in blocks);
+ * eend - end (last block + 1) of extent to be written back to the list;
  *
  * Terminology in the comments:
  *
@@ -293,14 +260,15 @@ static inline void check_blocknr_list_at
  * tail - a part of extent at the end.
  */
 
-static int discard_sorted_merged_extents(struct list_head *head)
+static int discard_precise_extents(struct list_head *head)
 {
 	int ret;
-	struct super_block *sb = reiser4_get_current_sb();
 	int d_uni;
 	int d_off;
 	struct list_head *pos;
+	struct super_block *sb = reiser4_get_current_sb();
 	int headp_is_known_dirty = 0;
+	int blkbits = sb->s_blocksize_bits;
 
 	d_off = get_super_private(sb)->discard.offset;
 	d_uni = get_super_private(sb)->discard.unit;
@@ -308,61 +276,82 @@ static int discard_sorted_merged_extents
 	for (pos = head->next; pos != head; pos = pos->next) {
 		int headp;
 		int tailp;
+
+		int p_headp;
+		int p_tailp;
+
 		reiser4_block_nr start;
 		reiser4_block_nr len;
 		reiser4_block_nr end;
-		reiser4_block_nr astart; __s64 alen;
+
 		reiser4_block_nr estart, eend;
 
+		__u64 a_start;
+		__s64 a_len;
+
+		__u64 p_start;
+		__u64 p_len;
+		__u64 p_end;
+
 		check_blocknr_list_at(pos, head);
 
 		start = blocknr_list_entry_start(pos);
 		len = blocknr_list_entry_len(pos);
 		estart = start;
 
+		p_start = start << blkbits;
+		p_len = len << blkbits;
+
 		/*
 		 * Step I. Cut or pad the head of extent
 		 *
 		 * This extent wasn't glued
 		 */
-		headp = extent_get_headp(start, d_off, d_uni);
+
+		p_headp = precise_extent_headp(p_start, d_off, d_uni);
+		headp = size_in_blocks(p_headp, blkbits);
 
 		if (headp == 0) {
 			/*
 			 * empty head padding
 			 */
 			assert("edward-1635", headp_is_known_dirty == 0);
-			astart = start;
-			alen = len;
-		} else if (!headp_is_known_dirty &&
-			   check_free_blocks(start - headp, headp)) {
+			a_start = p_start;
+			a_len = p_len;
+		}
+		else if (p_start >= p_headp /* discard unit is complete */ &&
+			 !headp_is_known_dirty &&
+			 check_free_blocks(start - headp, headp)) {
 			/*
-			 * head padding is clean,
 			 * pad the head
 			 */
-			astart = start - headp;
-			alen = len + headp;
+			a_start = p_start - p_headp;
+			a_len = p_len + p_headp;
 			estart -= headp;
 		} else {
 			/*
 			 * head padding is dirty,
+			 * or discard unit is incomplete (can not
+			 * check blocks outside of the partition),
 			 * cut the head
 			 */
 			headp_is_known_dirty = 0;
-			astart = start + (d_uni - headp);
-			alen = len - (d_uni - headp);
+			a_start = p_start + (d_uni - p_headp);
+			a_len = p_len - (d_uni - p_headp);
 		}
-
 		/*
 		 * Step II. Try to glue all nearby extents to the tail
 		 *          Cut or pad the tail of the last extent.
 		 */
 		end = start + len;
 		eend = end;
-		tailp = extent_get_tailp(end, d_off, d_uni);
+		p_end = end << blkbits;
 
+		p_tailp = precise_extent_tailp(p_end, d_off, d_uni);
+		tailp = size_in_blocks(p_tailp, blkbits);
 		/*
-		 * This "gluing" loop updates @end, @tailp, @alen, @eend
+		 * This "gluing" loop updates
+		 * @end, @p_end, @tailp, @p_tailp, @a_len, @eend
 		 */
 		while (1) {
 			struct list_head *next;
@@ -370,23 +359,36 @@ static int discard_sorted_merged_extents
 			next = get_next_at(pos, head);
 			check_blocknr_list_at(next, head);
 
-			if (next && (end + tailp >= blocknr_list_entry_start(next))) {
+			if (next && (p_end + p_tailp >= blocknr_list_entry_start(next) << blkbits)) {
 				/*
 				 * try to glue the next extent
 				 */
 				reiser4_block_nr next_start;
 				reiser4_block_nr next_len;
 
+				__u64 p_next_start;
+				__u64 p_next_len;
+
 				next_start = blocknr_list_entry_start(next);
 				next_len = blocknr_list_entry_len(next);
 
+				p_next_start = next_start << blkbits;
+				p_next_len = next_len << blkbits;
+
+				/*
+				 * check space between the extents;
+				 * if it is free, then allocate it
+				 */
 				if (check_free_blocks(end, next_start - end)) {
 					/*
 					 * jump to the glued extent
 					 */
-					alen += (next_start + next_len - end);
+					a_len += (p_next_start + p_next_len - p_end);
 					end = next_start + next_len;
-					tailp = extent_get_tailp(end, d_off, d_uni);
+					p_end = end << blkbits;
+
+					p_tailp = precise_extent_tailp(p_end, d_off, d_uni);
+					tailp = size_in_blocks(p_tailp, blkbits);
 					eend = end;
 					/*
 					 * remove the glued extent from the list
@@ -403,10 +405,10 @@ static int discard_sorted_merged_extents
 					/*
 					 * gluing failed, cut the tail
 					 */
-					if (end + tailp > next_start)
+					if (p_end + p_tailp > p_next_start)
 						headp_is_known_dirty = 1;
 
-					alen -= (d_uni - tailp);
+					a_len -= (d_uni - p_tailp);
 					break;
 				}
 
@@ -425,14 +427,14 @@ static int discard_sorted_merged_extents
 					 * tail padding is clean,
 					 * pad the tail
 					 */
-					alen += tailp;
+					a_len += p_tailp;
 					eend += tailp;
 				} else
 					/*
 					 * tail padding is dirty,
 					 * cut the tail
 					 */
-					alen -= (d_uni - tailp);
+					a_len -= (d_uni - p_tailp);
 				break;
 			}
 		}
@@ -440,12 +442,10 @@ static int discard_sorted_merged_extents
 		/*
 		 * Step III. Discard the result
 		 */
-		if (alen > 0) {
+		if (a_len > 0) {
 			assert("intelfx-74", estart < eend);
 			assert("intelfx-75", estart <= start);
-			assert("intelfx-76", estart <= astart);
 			assert("intelfx-77", start + len <= eend);
-			assert("intelfx-78", astart + alen <= eend);
 
 			/* here @eend becomes length */
 			eend -= estart;
@@ -453,9 +453,8 @@ static int discard_sorted_merged_extents
 			       reiser4_check_blocks(&estart, &eend, 1));
 			blocknr_list_update_extent(pos, &estart, &eend);
 
-			ret = __discard_extent(sb->s_bdev,
-					       astart * (sb->s_blocksize >> 9),
-					       alen * (sb->s_blocksize >> 9));
+			ret = discard_precise_extent(sb->s_bdev,
+						     a_start >> 9, a_len >> 9);
 			if (ret)
 				return ret;
 		}
@@ -475,7 +474,7 @@ int discard_atom(txn_atom *atom, struct
 	}
 
 	assert("intelfx-28", atom != NULL);
-	assert("intelfx-59", processed_entries != NULL);
+	assert("intelfx-59", processed_set != NULL);
 
 	if (list_empty(&atom->discard.delete_set)) {
 		/* Nothing left to discard. */
@@ -492,7 +491,7 @@ int discard_atom(txn_atom *atom, struct
 	blocknr_list_sort_and_join(&discard_set);
 
 	/* Perform actual dirty work. The discard set may change at this point. */
-	ret = discard_sorted_merged_extents(&discard_set);
+	ret = discard_precise_extents(&discard_set);
 
 	/* Add processed extents to the temporary list. */
 	blocknr_list_merge(&discard_set, processed_set);
@@ -508,7 +507,7 @@ int discard_atom(txn_atom *atom, struct
 void discard_atom_post(txn_atom *atom, struct list_head *processed_set)
 {
 	assert("intelfx-60", atom != NULL);
-	assert("intelfx-61", processed_entries != NULL);
+	assert("intelfx-61", processed_set != NULL);
 
 	if (!reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
 		spin_unlock_atom(atom);

--------------090008060304060707080903--
