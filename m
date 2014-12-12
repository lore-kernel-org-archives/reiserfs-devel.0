From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 3/6] reiser4: iterate over extents in discard_atom
Date: Sat, 13 Dec 2014 00:10:29 +0300
Message-ID: <1418418632-18396-4-git-send-email-intelfx100@gmail.com>
References: <1418418632-18396-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jaDNw7HeAxpCy/bpsBkBoX2p9/V6wwKcsEVCnuhlWQ8=;
        b=PxYk5qU+LxL0JNNB1fNV0KyE5VBJuBDlev3IRKOICoY0tsU3rWsu/eY2rQPnqhq9SD
         Gl7fbWjALqjZEy7U+EB1knoZahOODaO4zV2Qa2/7moKHucojvc21a2jjW6bBoEwy2UzM
         YQlAhrW3QRwligJEQ49gY+LtbBPPqeZ7DBQmgxwz/gLcwLfbvV5Ydq0hjzhwT0Fa54eD
         Frn3yluMeEYm/G0zjUpO+DWZ6EBESp5uBfcplufbJbGDkEyeGkLsCb2M6dnA1qQi7RuA
         4bgQBT5EVMvBbR8KtRDb2ICvxzlKmX/oV/7w2EZ6/kiSfq8KI3gNo2u64PTVa6sUuhQX
         xxlQ==
In-Reply-To: <1418418632-18396-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>

From: Edward Shishkin <edward.shishkin@gmail.com>

. add discard_sorted_merged_extents();
. add mount options to specify erase unit and alignment;
. verify and set discard params to the super-block at mount time;
---
 fs/reiser4/blocknrlist.c |  10 ++
 fs/reiser4/discard.c     | 378 +++++++++++++++++++++++++++++++++++++++++++----
 fs/reiser4/discard.h     |   8 +-
 fs/reiser4/forward.h     |   1 +
 fs/reiser4/init_super.c  |   4 +
 fs/reiser4/super.h       |   4 +
 fs/reiser4/txnmgr.h      |   2 +
 7 files changed, 377 insertions(+), 30 deletions(-)

diff --git a/fs/reiser4/blocknrlist.c b/fs/reiser4/blocknrlist.c
index 39a4a9b..806c59d 100644
--- a/fs/reiser4/blocknrlist.c
+++ b/fs/reiser4/blocknrlist.c
@@ -26,6 +26,16 @@ struct blocknr_list_entry {
 
 #define blocknr_list_entry(ptr) list_entry(ptr, blocknr_list_entry, link)
 
+reiser4_block_nr blocknr_list_entry_start(struct list_head *ptr)
+{
+	return blocknr_list_entry(ptr)->start;
+}
+
+reiser4_block_nr blocknr_list_entry_len(struct list_head *ptr)
+{
+	return blocknr_list_entry(ptr)->len;
+}
+
 static void blocknr_list_entry_init(blocknr_list_entry *entry)
 {
 	assert("intelfx-11", entry != NULL);
diff --git a/fs/reiser4/discard.c b/fs/reiser4/discard.c
index 7a07afc..a8c5336 100644
--- a/fs/reiser4/discard.c
+++ b/fs/reiser4/discard.c
@@ -23,13 +23,6 @@
  * that have since been allocated again and issue discards for everything still
  * valid. This is what discard.[ch] is here for.
  *
- * However, simply iterating through the recorded extents is not enough:
- * - if a single extent is smaller than the erase unit, then this particular
- *   extent won't be discarded even if it is surrounded by enough free blocks
- *   to constitute a whole erase unit;
- * - we won't be able to merge small adjacent extents forming an extent long
- *   enough to be discarded.
- *
  * MECHANISM:
  *
  * During the transaction deallocated extents are recorded in atom's delete
@@ -58,10 +51,9 @@
  * any data. Thus we can avoid any checks for blocks directly present in the
  * discard set.
  *
- * For now, we don't perform "padding" of extents to erase unit boundaries.
- * This means if extents are not aligned with the device's erase unit lattice,
- * the partial erase units at head and tail of extents are truncated by kernel
- * (in blkdev_issue_discard()).
+ * However, we pad each extent from both sides to erase unit boundaries,
+ * and these paddings still have to be checked if they fall outside of initial
+ * extent.
  *
  * So, at commit time the following actions take place:
  * - delete sets are merged to form the discard set;
@@ -70,6 +62,7 @@
  * - for each extent, a single call to blkdev_issue_discard() is done.
  */
 
+#include "forward.h"
 #include "discard.h"
 #include "context.h"
 #include "debug.h"
@@ -79,37 +72,366 @@
 #include <linux/slab.h>
 #include <linux/fs.h>
 #include <linux/blkdev.h>
+#include <linux/lcm.h>
+
+/*
+ * For 1-dimension integer lattice (a,b) (a - offset, b - step)
+ * find its minimal sub-lattice which can be represented in the
+ * more coarse grained (scaled with factor r >= 1) coordinates.
+ * If representation is impossible, return 1. Otherwise return 0.
+ *
+ * @a - offset of the lattice in the initial coordinates;
+ * @b - step of the lattice in the initial coordinates;
+ * @x - offset of the sub-lattice in the scaled coordinates;
+ * @y - step of the sub-lattice in the scaled coordinates;
+ * @r - scale factor.
+ */
+static int convert_lattice_params(int *x, int *y, int a, int b, int r)
+{
+	assert("edward-1635", b != 0);
+	assert("edward-1636", r >= 1);
+
+	if (a % r)
+		return 1;
+	*x = a / r;
+	*y = lcm(b, r) / r;
+
+	/* normalize offset */
+	*x = *x % *y;
+	return 0;
+}
+
+#define MAX_DISCARD_UNIT_BYTES (1 << 20)
+
+/*
+ * Verify customer's or kernel's discard params
+ * at mount time. Re-calculate their values (to be
+ * in blocks) and store them in the superblock.
+ *
+ * Pre-conditions: superblock contains customer's
+ * discard params in bytes (if it was specified at
+ * mount time).
+ */
+void check_discard_params(struct super_block *sb)
+{
+	int ret;
+	reiser4_super_info_data *sbinfo;
+	discard_params *sb_discard;
+	struct queue_limits *limits;
+	int unit;
+	int offset;
+
+	if (!reiser4_is_set(sb, REISER4_DISCARD))
+		return;
+
+	sbinfo = get_super_private(sb);
+	limits = &bdev_get_queue(sb->s_bdev)->limits;
+	sb_discard = &sbinfo->discard;
+
+	if (sb_discard->unit) {
+		/*
+		 * discard params were specified by customer
+		 */
+		unit = sb_discard->unit;
+		offset = sb_discard->offset;
+	}
+	else {
+		/*
+		 * grab discard params from the kernel
+		 */
+		unit = limits->discard_granularity;
+		offset = bdev_discard_alignment(sb->s_bdev);
+	}
+	if (unit == 0)
+		goto disable;
+	if (unit > MAX_DISCARD_UNIT_BYTES) {
+		warning("", "%s: unsupported erase unit (%d)", sb->s_id, unit);
+		goto disable;
+	}
+	ret = convert_lattice_params(&sb_discard->offset,
+				     &sb_discard->unit,
+				     offset,
+				     unit,
+				     sb->s_blocksize);
+	if (ret) {
+		warning("", "%s: unsupported alignment (%d)", sb->s_id, offset);
+		goto disable;
+	}
+	if (sb_discard->unit > MAX_DISCARD_UNIT_BYTES / sb->s_blocksize) {
+		warning("", "%s: unsupported erase unit (%d)", sb->s_id, unit);
+		goto disable;
+	}
+	printk("reiser4: %s: enable discard support "
+	       "(erase unit %u blocks, alignment %u blocks)\n",
+	       sb->s_id, sb_discard->unit, sb_discard->offset);
+	return;
+disable:
+	warning("", "%s: disable discard support", sb->s_id);
+	clear_bit(REISER4_DISCARD, &sbinfo->fs_flags);
+	return;
+}
 
 static int __discard_extent(struct block_device *bdev, sector_t start,
                             sector_t len)
 {
 	assert("intelfx-21", bdev != NULL);
 
-	return blkdev_issue_discard(bdev, start, len, reiser4_ctx_gfp_mask_get(),
-	                            0);
+	return blkdev_issue_discard(bdev, start, len,
+				    reiser4_ctx_gfp_mask_get(), 0);
 }
 
-static int discard_extent(txn_atom *atom UNUSED_ARG,
-                          const reiser4_block_nr* start,
-                          const reiser4_block_nr* len,
-                          void *data UNUSED_ARG)
+/*
+ * Return size of head padding of an extent on a lattice
+ * with step @ulen and offset @uoff.
+ * @start - the start offset of the extent.
+ */
+static int extent_get_headp(reiser4_block_nr start, int uoff, int ulen)
 {
+	__u64 headp;
+	headp = ulen + start - uoff;
+	headp = do_div(headp, ulen);
+	return headp;
+}
+
+/*
+ * Return size of tail padding of an extent on a lattice
+ * with step @ulen and offset @uoff.
+ * @end - the end offset of the extent.
+ */
+static int extent_get_tailp(reiser4_block_nr end, int uoff, int ulen)
+{
+	__u64 tailp;
+	tailp = ulen + end - uoff;
+	tailp = do_div(tailp, ulen);
+	if (tailp)
+		tailp = ulen - tailp;
+	return tailp;
+}
+
+static inline struct list_head *get_next_at(struct list_head *pos,
+					    struct list_head *head)
+{
+	assert("edward-1631", pos != NULL);
+	assert("edward-1632", head != NULL);
+	assert("edward-1633", pos != head);
+
+	return pos->next == head ? NULL : pos->next;
+}
+
+static inline int check_free_blocks(const reiser4_block_nr start,
+				    const reiser4_block_nr len)
+{
+	return reiser4_check_blocks(&start, &len, 0);
+}
+
+/* Make sure that extents are sorted and merged */
+#if REISER4_DEBUG
+static inline void check_blocknr_list_at(struct list_head *pos,
+					 struct list_head *head)
+{
+	struct list_head *next;
+
+	if (pos == NULL)
+		return;
+	next = get_next_at(pos, head);
+	if (next == NULL)
+		return;
+	if (blocknr_list_entry_start(next) <=
+	    blocknr_list_entry_start(pos) + blocknr_list_entry_len(pos))
+		warning("edward-1634",
+			"discard bad pair of extents: (%llu,%llu), (%llu,%llu)",
+			(unsigned long long)blocknr_list_entry_start(pos),
+			(unsigned long long)blocknr_list_entry_len(pos),
+			(unsigned long long)blocknr_list_entry_start(next),
+			(unsigned long long)blocknr_list_entry_len(next));
+}
+#else
+#define check_blocknr_list_at(pos, head) noop
+#endif
+
+/*
+ * discard_sorted_merged_extents() - scan the list of sorted and
+ * merged extents and check head and tail paddings of each
+ * extent in the working space map. Try to "glue" the nearby
+ * extents. Discard the (glued) extents with padded (or cut)
+ * head and tail.
+ *
+ * Pre-conditions: @head points to the list of sorted and
+ * merged extents.
+ *
+ * Local variables:
+ *
+ * d_uni - discard unit size (in blocks);
+ * d_off - discard alignment (in blocks);
+ *
+ * start - offset of the first block of the extent;
+ * len - length of the extent;
+ * end - offset of the first block beyond extent;
+ *
+ * headp - size of head padding of the extent;
+ * tailp - size of tail padding of the extent;
+ *
+ * astart - actual start to discard (offset of the head padding);
+ * alen - actual length to discard (length of glued aligned and padded extents).
+ *
+ * Terminology in the comments:
+ *
+ * head - a part of extent at the beginning;
+ * tail - a part of extent at the end.
+ */
+
+static int discard_sorted_merged_extents(struct list_head *head)
+{
+	int ret;
 	struct super_block *sb = reiser4_get_current_sb();
-	struct block_device *bdev = sb->s_bdev;
+	int d_uni;
+	int d_off;
+	struct list_head *pos;
+	int headp_is_known_dirty = 0;
 
-	sector_t extent_start_sec, extent_len_sec;
+	d_off = get_super_private(sb)->discard.offset;
+	d_uni = get_super_private(sb)->discard.unit;
 
-	const int sec_per_blk = sb->s_blocksize >> 9;
+	for (pos = head->next; pos != head; pos = pos->next) {
+		int headp;
+		int tailp;
+		reiser4_block_nr start;
+		reiser4_block_nr len;
+		reiser4_block_nr end;
+		reiser4_block_nr astart; __s64 alen;
 
-	/* we assume block = N * sector */
-	assert("intelfx-7", sec_per_blk > 0);
+		check_blocknr_list_at(pos, head);
 
-	/* convert extent to sectors */
-	extent_start_sec = *start * sec_per_blk;
-	extent_len_sec = *len * sec_per_blk;
+		start = blocknr_list_entry_start(pos);
+		len = blocknr_list_entry_len(pos);
+		/*
+		 * Step I. Cut or pad the head of extent
+		 *
+		 * This extent wasn't glued
+		 */
+		headp = extent_get_headp(start, d_off, d_uni);
 
-	/* discard the extent, don't pad it to erase unit boundaries for now */
-	return __discard_extent(bdev, extent_start_sec, extent_len_sec);
+		if (headp == 0) {
+			/*
+			 * empty head padding
+			 */
+			assert("edward-1635", headp_is_known_dirty == 0);
+			astart = start;
+			alen = len;
+		} else if (!headp_is_known_dirty &&
+			   check_free_blocks(start - headp, headp)) {
+			/*
+			 * head padding is clean,
+			 * pad the head
+			 */
+			astart = start - headp;
+			alen = len + headp;
+		} else {
+			/*
+			 * head padding is dirty,
+			 * cut the head
+			 */
+			headp_is_known_dirty = 0;
+			astart = start + (d_uni - headp);
+			alen = len - (d_uni - headp);
+		}
+
+		/*
+		 * Step II. Try to glue all nearby extents to the tail
+		 *          Cut or pad the tail of the last extent.
+		 */
+		end = start + len;
+		tailp = extent_get_tailp(end, d_off, d_uni);
+
+		/*
+		 * This "gluing" loop updates @pos, @end, @tailp, @alen
+		 */
+		while (1) {
+			struct list_head *next;
+
+			next = get_next_at(pos, head);
+			check_blocknr_list_at(next, head);
+
+			if (next && (end + tailp >= blocknr_list_entry_start(next))) {
+				/*
+				 * try to glue the next extent
+				 */
+				reiser4_block_nr next_start;
+				reiser4_block_nr next_len;
+
+				next_start = blocknr_list_entry_start(next);
+				next_len = blocknr_list_entry_len(next);
+
+				if (check_free_blocks(end, next_start - end)) {
+					/*
+					 * jump to the glued extent
+					 */
+					if (end + tailp < next_start + next_len) {
+						/*
+						 * the glued extent doesn't
+						 * fit into the tail padding,
+						 * so update the last one
+						 */
+						tailp = extent_get_tailp(next_start + next_len,
+									 d_off, d_uni);
+						alen += (next_start + next_len - end);
+					}
+					pos = next;
+					end = next_start + next_len;
+					/*
+					 * try to glue more extents
+					 */
+					continue;
+				} else {
+					/*
+					 * gluing failed, cut the tail
+					 */
+					if (end + tailp > next_start)
+						headp_is_known_dirty = 1;
+
+					alen -= (d_uni - tailp);
+					break;
+				}
+
+			} else {
+				/*
+				 * nothing to glue:
+				 * this is the last extent, or the next
+				 * extent is too far. So just check the
+				 * rest of tail padding and finish with
+				 * the extent
+				 */
+				if (tailp == 0)
+					break;
+				else if (check_free_blocks(end, tailp))
+					/*
+					 * tail padding is clean,
+					 * pad the tail
+					 */
+					alen += tailp;
+				else
+					/*
+					 * tail padding is dirty,
+					 * cut the tail
+					 */
+					alen -= (d_uni - tailp);
+				break;
+			}
+		}
+
+		/*
+		 * Step III. Discard the result
+		 */
+		if (alen > 0) {
+			ret = __discard_extent(sb->s_bdev,
+					       astart * (sb->s_blocksize >> 9),
+					       alen * (sb->s_blocksize >> 9));
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
 }
 
 int discard_atom(txn_atom *atom, struct list_head *processed_set)
@@ -140,7 +462,7 @@ int discard_atom(txn_atom *atom, struct list_head *processed_set)
 	blocknr_list_sort_and_join(&discard_set);
 
 	/* Perform actual dirty work. */
-	ret = blocknr_list_iterator(NULL, &discard_set, &discard_extent, NULL, 0);
+	ret = discard_sorted_merged_extents(&discard_set);
 
 	/* Add processed extents to the temporary list. */
 	blocknr_list_merge(&discard_set, processed_set);
diff --git a/fs/reiser4/discard.h b/fs/reiser4/discard.h
index 5f0d0d8..6fb6756 100644
--- a/fs/reiser4/discard.h
+++ b/fs/reiser4/discard.h
@@ -6,8 +6,12 @@
 #if !defined(__FS_REISER4_DISCARD_H__)
 #define __FS_REISER4_DISCARD_H__
 
-#include "forward.h"
-#include "dformat.h"
+struct discard_params {
+	int offset; /* discard offset in blocks */
+	int unit; /* erase unit size in blocks */
+};
+
+extern void check_discard_params(struct super_block *sb);
 
 /**
  * Issue discard requests for all block extents recorded in @atom's delete sets,
diff --git a/fs/reiser4/forward.h b/fs/reiser4/forward.h
index 9170c2b..b0ae506 100644
--- a/fs/reiser4/forward.h
+++ b/fs/reiser4/forward.h
@@ -34,6 +34,7 @@ typedef struct reiser4_journal reiser4_journal;
 typedef struct txn_atom txn_atom;
 typedef struct txn_handle txn_handle;
 typedef struct txn_mgr txn_mgr;
+typedef struct discard_params discard_params;
 typedef struct reiser4_dir_entry_desc reiser4_dir_entry_desc;
 typedef struct reiser4_context reiser4_context;
 typedef struct carry_level carry_level;
diff --git a/fs/reiser4/init_super.c b/fs/reiser4/init_super.c
index 1ff8dad..c5da5d0 100644
--- a/fs/reiser4/init_super.c
+++ b/fs/reiser4/init_super.c
@@ -407,6 +407,9 @@ static noinline void push_sb_field_opts(struct opt_desc **p,
 	/* carry flags used for insert operations */
 	PUSH_SB_FIELD_OPT(tree.carry.insert_flags, "%u");
 
+	PUSH_SB_FIELD_OPT(discard.unit, "%u");
+	PUSH_SB_FIELD_OPT(discard.offset, "%u");
+
 #ifdef CONFIG_REISER4_BADBLOCKS
 	/*
 	 * Alternative master superblock location in case if it's original
@@ -573,6 +576,7 @@ int reiser4_init_super_data(struct super_block *super, char *opt_string)
 		warning("nikita-2497", "optimal_io_size is too small");
 		return RETERR(-EINVAL);
 	}
+	check_discard_params(super);
 	return result;
 }
 
diff --git a/fs/reiser4/super.h b/fs/reiser4/super.h
index 895c3f3..68d23fc 100644
--- a/fs/reiser4/super.h
+++ b/fs/reiser4/super.h
@@ -12,6 +12,7 @@
 #include "entd.h"
 #include "wander.h"
 #include "fsdata.h"
+#include "discard.h"
 #include "plugin/object.h"
 #include "plugin/space/space_allocator.h"
 
@@ -206,6 +207,9 @@ struct reiser4_super_info_data {
 	/* transaction manager */
 	txn_mgr tmgr;
 
+	/* discard params */
+	discard_params discard;
+
 	/* ent thread */
 	entd_context entd;
 
diff --git a/fs/reiser4/txnmgr.h b/fs/reiser4/txnmgr.h
index 72b84a2..0350e8f 100644
--- a/fs/reiser4/txnmgr.h
+++ b/fs/reiser4/txnmgr.h
@@ -509,6 +509,8 @@ extern void blocknr_list_init(struct list_head *blist);
 extern void blocknr_list_destroy(struct list_head *blist);
 extern void blocknr_list_merge(struct list_head *from, struct list_head *to);
 extern void blocknr_list_sort_and_join(struct list_head *blist);
+extern reiser4_block_nr blocknr_list_entry_start(struct list_head *blist);
+extern reiser4_block_nr blocknr_list_entry_len(struct list_head *blist);
 /**
  * The @atom should be locked.
  */
-- 
2.1.3

