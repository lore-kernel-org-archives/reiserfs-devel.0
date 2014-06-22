From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv6 3/5] reiser4: discard support: initial implementation using linked lists.
Date: Sun, 22 Jun 2014 14:48:44 +0400
Message-ID: <1403434126-6390-4-git-send-email-intelfx100@gmail.com>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ABcM1329DYWebGP4RvajkExUFHPhmgovv4xsEy/HHL8=;
        b=YukeTjWeSwZFrOWFlo9Q/Ee0viqOzF4kqwzZoo26XjxbjgCxaZABwTMcxDpxg3pX92
         X2x/YlzEfdYBGORMiUm8Z7I+AYHSatbOROL/YwEVuNoWofkuMtoQ59Mqrw4Ov9xhGZGv
         BppZD9wMTT2MRzEiAp5YA7tlobA4kRoOiZ3xfs5gK3CZzYCdt3NuGcjleB3pNkLEKPla
         4mo0ZHcFyjz1Gz1l4pxk8N8uYXiHdY/lwpV99gO5Rqlw1WWtlGNZRSV1sWaQZL0V4u+d
         vIE3hG56+h6oTLtt96RE8TCmo1pSPSThagzDmB4pWX7bGTp9/Dnh2i+F5v3vg+8gz4nB
         YV5Q==
In-Reply-To: <1403434126-6390-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

Implementation details:

- candidate extents are stored during the transaction to a linked list
- if an extent being added is adjacent to the last one, they are merged
  to prevent another allocation
- at commit time, the log is further sorted and extents are merged
- extents are further processed to align discard requests to erase unit
  boundaries, extending them to neighbour blocks if needed
- each erase unit is checked to be deallocated and submitted to discard
- processing stops at first failure (this does not fail atom commit)

For now (shortcomings):

- kernel-reported erase unit granularity and alignment offset are used
  as-is without any override (it may make sense in order to mitigate
  bogus values sometimes reported by kernel/hardware)
- processing each erase unit makes its own bitmap query to check
  allocation status; this is suboptimal when granularity is less than
  the block size (should not matter in practice as granularity almost
  never is that small)

Note on candidate block collection:

Another per-atom block set, ->aux_delete_set, has been added, containing
extents deallocated without BA_DEFER (i. e. blocks of the wandered
journal). When discard is enabled, storage of both delete sets is enabled.
They are stored using blocknr_lists, then spliced and sorted before
discarding, so all blocks that have been deallocated during the
transaction are considered for discarding.

Otherwise, only ->delete_set is maintained, and it is stored using
blocknr_set which is more memory efficient but inherently unordered (so it
cannot be used for the discard algorithm).

The only semantic-significant change to existing code is that
reiser4_post_commit_hook() does not clear ->delete_set (instead, it is
cleared either by discard_atom() or as part of atom's destruction). This is
OK because ->delete_set is not accessed after reiser4_post_commit_hook().

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/Makefile              |   1 +
 fs/reiser4/block_alloc.c         |  32 ++++--
 fs/reiser4/dformat.h             |   2 +
 fs/reiser4/discard.c             | 216 +++++++++++++++++++++++++++++++++++++++
 fs/reiser4/discard.h             |  31 ++++++
 fs/reiser4/init_super.c          |   2 +
 fs/reiser4/plugin/space/bitmap.c |   3 +-
 fs/reiser4/super.h               |   4 +-
 fs/reiser4/txnmgr.c              | 125 ++++++++++++++++++++--
 fs/reiser4/txnmgr.h              |  44 +++++++-
 10 files changed, 440 insertions(+), 20 deletions(-)
 create mode 100644 fs/reiser4/discard.c
 create mode 100644 fs/reiser4/discard.h

diff --git a/fs/reiser4/Makefile b/fs/reiser4/Makefile
index 9f07194..f50bb96 100644
--- a/fs/reiser4/Makefile
+++ b/fs/reiser4/Makefile
@@ -47,6 +47,7 @@ reiser4-y := \
 		   init_super.o \
 		   safe_link.o \
 		   blocknrlist.o \
+		   discard.o \
            \
 		   plugin/plugin.o \
 		   plugin/plugin_set.o \
diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 57b0836..e5ea7a4 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -992,6 +992,7 @@ reiser4_dealloc_blocks(const reiser4_block_nr * start,
 	int ret;
 	reiser4_context *ctx;
 	reiser4_super_info_data *sbinfo;
+	void *new_entry = NULL;
 
 	ctx = get_current_context();
 	sbinfo = get_super_private(ctx->super);
@@ -1007,17 +1008,13 @@ reiser4_dealloc_blocks(const reiser4_block_nr * start,
 	}
 
 	if (flags & BA_DEFER) {
-		blocknr_set_entry *bsep = NULL;
-
-		/* storing deleted block numbers in a blocknr set
-		   datastructure for further actual deletion */
+		/* store deleted block numbers in the atom's deferred delete set
+		   for further actual deletion */
 		do {
 			atom = get_current_atom_locked();
 			assert("zam-430", atom != NULL);
 
-			ret =
-			    blocknr_set_add_extent(atom, &atom->delete_set,
-						   &bsep, start, len);
+			ret = atom_dset_deferred_add_extent(atom, &new_entry, start, len);
 
 			if (ret == -ENOMEM)
 				return ret;
@@ -1031,6 +1028,25 @@ reiser4_dealloc_blocks(const reiser4_block_nr * start,
 		spin_unlock_atom(atom);
 
 	} else {
+		/* store deleted block numbers in the atom's immediate delete set
+		   for further processing */
+		do {
+			atom = get_current_atom_locked();
+			assert("intelfx-51", atom != NULL);
+
+			ret = atom_dset_immediate_add_extent(atom, &new_entry, start, len);
+
+			if (ret == -ENOMEM)
+				return ret;
+
+			/* This loop might spin at most two times */
+		} while (ret == -E_REPEAT);
+
+		assert("intelfx-52", ret == 0);
+		assert("intelfx-53", atom != NULL);
+
+		spin_unlock_atom(atom);
+
 		assert("zam-425", get_current_super_private() != NULL);
 		sa_dealloc_blocks(reiser4_get_space_allocator(ctx->super),
 				  *start, *len);
@@ -1128,7 +1144,7 @@ void reiser4_post_commit_hook(void)
 
 	/* do the block deallocation which was deferred
 	   until commit is done */
-	blocknr_set_iterator(atom, &atom->delete_set, apply_dset, NULL, 1);
+	atom_dset_deferred_apply(atom, apply_dset, NULL, 0);
 
 	assert("zam-504", get_current_super_private() != NULL);
 	sa_post_commit_hook();
diff --git a/fs/reiser4/dformat.h b/fs/reiser4/dformat.h
index 7943762..7316754 100644
--- a/fs/reiser4/dformat.h
+++ b/fs/reiser4/dformat.h
@@ -14,6 +14,8 @@
 #if !defined(__FS_REISER4_DFORMAT_H__)
 #define __FS_REISER4_DFORMAT_H__
 
+#include "debug.h"
+
 #include <asm/byteorder.h>
 #include <asm/unaligned.h>
 #include <linux/types.h>
diff --git a/fs/reiser4/discard.c b/fs/reiser4/discard.c
new file mode 100644
index 0000000..3c8ee89
--- /dev/null
+++ b/fs/reiser4/discard.c
@@ -0,0 +1,216 @@
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+ * reiser4/README */
+
+/* TRIM/discard interoperation subsystem for reiser4. */
+
+/*
+ * This subsystem is responsible for populating an atom's ->discard_set and
+ * (later) converting it into a series of discard calls to the kernel.
+ *
+ * The discard is an in-kernel interface for notifying the storage
+ * hardware about blocks that are being logically freed by the filesystem.
+ * This is done via calling the blkdev_issue_discard() function. There are
+ * restrictions on block ranges: they should constitute at least one erase unit
+ * in length and be correspondingly aligned. Otherwise a discard request will
+ * be ignored.
+ *
+ * The erase unit size is kept in struct queue_limits as discard_granularity.
+ * The offset from the partition start to the first erase unit is kept in
+ * struct queue_limits as discard_alignment.
+ *
+ * At atom level, we record numbers of all blocks that happen to be deallocated
+ * during the transaction. Then we read the generated set, filter out any blocks
+ * that have since been allocated again and issue discards for everything still
+ * valid. This is what discard.[ch] is here for.
+ *
+ * However, simply iterating through the recorded extents is not enough:
+ * - if a single extent is smaller than the erase unit, then this particular
+ *   extent won't be discarded even if it is surrounded by enough free blocks
+ *   to constitute a whole erase unit;
+ * - we won't be able to merge small adjacent extents forming an extent long
+ *   enough to be discarded.
+ *
+ * MECHANISM:
+ *
+ * During the transaction deallocated extents are recorded in atom's delete
+ * sets. There are two delete sets, because data in one of them (delete_set) is
+ * also used by other parts of reiser4. The second delete set (aux_delete_set)
+ * complements the first one and is maintained only when discard is enabled.
+ *
+ * Together these sets constitute "the discard set" -- blocks that have to be
+ * considered for discarding. On atom commit we will generate a minimal
+ * superset of the discard set, comprised of whole erase units.
+ *
+ * So, at commit time the following actions take place:
+ * - delete sets are merged to form the discard set;
+ * - elements of the discard set are sorted;
+ * - the discard set is iterated, joining any adjacent extents;
+ * - each of resulting extents is "covered" by erase units:
+ *   - its start is rounded down to the closest erase unit boundary;
+ *   - starting from this block, extents of erase unit length are created
+ *     until the original extent is fully covered;
+ * - the calculated erase units are checked to be fully deallocated;
+ * - remaining (valid) erase units are then passed to blkdev_issue_discard().
+ */
+
+#include "discard.h"
+#include "context.h"
+#include "debug.h"
+#include "txnmgr.h"
+#include "super.h"
+
+#include <linux/slab.h>
+#include <linux/fs.h>
+#include <linux/blkdev.h>
+
+static int __discard_extent(struct block_device *bdev, sector_t start,
+                            sector_t len)
+{
+	assert("intelfx-21", bdev != NULL);
+
+	return blkdev_issue_discard(bdev, start, len, reiser4_ctx_gfp_mask_get(),
+	                            0);
+}
+
+static int discard_extent(txn_atom *atom UNUSED_ARG,
+                          const reiser4_block_nr* start,
+                          const reiser4_block_nr* len,
+                          void *data UNUSED_ARG)
+{
+	struct super_block *sb = reiser4_get_current_sb();
+	struct block_device *bdev = sb->s_bdev;
+	struct queue_limits *limits = &bdev_get_queue(bdev)->limits;
+
+	sector_t extent_start_sec, extent_end_sec,
+	         unit_sec, request_start_sec = 0, request_len_sec = 0;
+	reiser4_block_nr unit_start_blk, unit_len_blk;
+	int ret, erase_unit_counter = 0;
+
+	const int sec_per_blk = sb->s_blocksize >> 9;
+
+	/* from blkdev_issue_discard():
+	 * Zero-sector (unknown) and one-sector granularities are the same.  */
+	const int granularity = max(limits->discard_granularity >> 9, 1U);
+	const int alignment = (bdev_discard_alignment(bdev) >> 9) % granularity;
+
+	/* we assume block = N * sector */
+	assert("intelfx-7", sec_per_blk > 0);
+
+	/* convert extent to sectors */
+	extent_start_sec = *start * sec_per_blk;
+	extent_end_sec = (*start + *len) * sec_per_blk;
+
+	/* round down extent start sector to an erase unit boundary */
+	unit_sec = extent_start_sec;
+	if (granularity > 1) {
+		sector_t tmp = extent_start_sec - alignment;
+		unit_sec -= sector_div(tmp, granularity);
+	}
+
+	/* iterate over erase units in the extent */
+	do {
+		/* considering erase unit:
+		 * [unit_sec; unit_sec + granularity) */
+
+		/* calculate block range for erase unit:
+		 * [unit_start_blk; unit_start_blk+unit_len_blk) */
+		unit_start_blk = unit_sec;
+		do_div(unit_start_blk, sec_per_blk);
+
+		if (granularity > 1) {
+			unit_len_blk = unit_sec + granularity - 1;
+			do_div(unit_len_blk, sec_per_blk);
+			++unit_len_blk;
+
+			assert("intelfx-22", unit_len_blk > unit_start_blk);
+
+			unit_len_blk -= unit_start_blk;
+		} else {
+			unit_len_blk = 1;
+		}
+
+		if (reiser4_check_blocks(&unit_start_blk, &unit_len_blk, 0)) {
+			/* OK. Add this unit to the accumulator.
+			 * We accumulate discard units to call blkdev_issue_discard()
+			 * not too frequently. */
+
+			if (request_len_sec > 0) {
+				request_len_sec += granularity;
+			} else {
+				request_start_sec = unit_sec;
+				request_len_sec = granularity;
+			}
+		} else {
+			/* This unit can't be discarded. Discard what's been accumulated
+			 * so far. */
+			if (request_len_sec > 0) {
+				ret = __discard_extent(bdev, request_start_sec, request_len_sec);
+				if (ret != 0) {
+					return ret;
+				}
+				request_len_sec = 0;
+			}
+		}
+
+		unit_sec += granularity;
+		++erase_unit_counter;
+	} while (unit_sec < extent_end_sec);
+
+	/* Discard the last accumulated request. */
+	if (request_len_sec > 0) {
+		ret = __discard_extent(bdev, request_start_sec, request_len_sec);
+		if (ret != 0) {
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+int discard_atom(txn_atom *atom)
+{
+	int ret;
+	struct list_head discard_set;
+
+	if (!reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+		spin_unlock_atom(atom);
+		return 0;
+	}
+
+	assert("intelfx-28", atom != NULL);
+
+	if (list_empty(&atom->discard.delete_set) &&
+	    list_empty(&atom->discard.aux_delete_set)) {
+		spin_unlock_atom(atom);
+		return 0;
+	}
+
+	/* Take the delete sets from the atom in order to release atom spinlock. */
+	blocknr_list_init(&discard_set);
+	blocknr_list_merge(&atom->discard.delete_set, &discard_set);
+	blocknr_list_merge(&atom->discard.aux_delete_set, &discard_set);
+	spin_unlock_atom(atom);
+
+	/* Sort the discard list, joining adjacent and overlapping extents. */
+	blocknr_list_sort_and_join(&discard_set);
+
+	/* Perform actual dirty work. */
+	ret = blocknr_list_iterator(NULL, &discard_set, &discard_extent, NULL, 1);
+	if (ret != 0) {
+		return ret;
+	}
+
+	/* Let's do this again for any new extents in the atom's discard set. */
+	return -E_REPEAT;
+}
+
+/* Make Linus happy.
+   Local variables:
+   c-indentation-style: "K&R"
+   mode-name: "LC"
+   c-basic-offset: 8
+   tab-width: 8
+   fill-column: 120
+   scroll-step: 1
+   End:
+*/
diff --git a/fs/reiser4/discard.h b/fs/reiser4/discard.h
new file mode 100644
index 0000000..ea46334
--- /dev/null
+++ b/fs/reiser4/discard.h
@@ -0,0 +1,31 @@
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+ * reiser4/README */
+
+/* TRIM/discard interoperation subsystem for reiser4. */
+
+#if !defined(__FS_REISER4_DISCARD_H__)
+#define __FS_REISER4_DISCARD_H__
+
+#include "forward.h"
+#include "dformat.h"
+
+/**
+ * Issue discard requests for all block extents recorded in @atom's delete sets,
+ * if discard is enabled. In this case the delete sets are cleared.
+ *
+ * @atom should be locked on entry and is unlocked on exit.
+ */
+extern int discard_atom(txn_atom *atom);
+
+/* __FS_REISER4_DISCARD_H__ */
+#endif
+
+/* Make Linus happy.
+   Local variables:
+   c-indentation-style: "K&R"
+   mode-name: "LC"
+   c-basic-offset: 8
+   tab-width: 8
+   fill-column: 120
+   End:
+*/
diff --git a/fs/reiser4/init_super.c b/fs/reiser4/init_super.c
index 620a0f5..1ff8dad 100644
--- a/fs/reiser4/init_super.c
+++ b/fs/reiser4/init_super.c
@@ -494,6 +494,8 @@ int reiser4_init_super_data(struct super_block *super, char *opt_string)
 	PUSH_BIT_OPT("atomic_write", REISER4_ATOMIC_WRITE);
 	/* disable use of write barriers in the reiser4 log writer. */
 	PUSH_BIT_OPT("no_write_barrier", REISER4_NO_WRITE_BARRIER);
+	/* enable issuing of discard requests */
+	PUSH_BIT_OPT("discard", REISER4_DISCARD);
 
 	PUSH_OPT(p, opts,
 	{
diff --git a/fs/reiser4/plugin/space/bitmap.c b/fs/reiser4/plugin/space/bitmap.c
index d8ff542..03bc5e7 100644
--- a/fs/reiser4/plugin/space/bitmap.c
+++ b/fs/reiser4/plugin/space/bitmap.c
@@ -1460,8 +1460,7 @@ int reiser4_pre_commit_hook_bitmap(void)
 		}
 	}
 
-	blocknr_set_iterator(atom, &atom->delete_set, apply_dset_to_commit_bmap,
-			     &blocks_freed, 0);
+	atom_dset_deferred_apply(atom, apply_dset_to_commit_bmap, &blocks_freed, 0);
 
 	blocks_freed -= atom->nr_blocks_allocated;
 
diff --git a/fs/reiser4/super.h b/fs/reiser4/super.h
index 0c73845..895c3f3 100644
--- a/fs/reiser4/super.h
+++ b/fs/reiser4/super.h
@@ -51,7 +51,9 @@ typedef enum {
 	/* enforce atomicity during write(2) */
 	REISER4_ATOMIC_WRITE = 6,
 	/* don't use write barriers in the log writer code. */
-	REISER4_NO_WRITE_BARRIER = 7
+	REISER4_NO_WRITE_BARRIER = 7,
+	/* enable issuing of discard requests */
+	REISER4_DISCARD = 8
 } reiser4_fs_flag;
 
 /*
diff --git a/fs/reiser4/txnmgr.c b/fs/reiser4/txnmgr.c
index 4950179..f27d1dc 100644
--- a/fs/reiser4/txnmgr.c
+++ b/fs/reiser4/txnmgr.c
@@ -233,6 +233,7 @@ year old --- define all technical terms used.
 #include "vfs_ops.h"
 #include "inode.h"
 #include "flush.h"
+#include "discard.h"
 
 #include <asm/atomic.h>
 #include <linux/types.h>
@@ -404,9 +405,10 @@ static void atom_init(txn_atom * atom)
 	INIT_LIST_HEAD(&atom->atom_link);
 	INIT_LIST_HEAD(&atom->fwaitfor_list);
 	INIT_LIST_HEAD(&atom->fwaiting_list);
-	blocknr_set_init(&atom->delete_set);
 	blocknr_set_init(&atom->wandered_map);
 
+	atom_dset_init(atom);
+
 	init_atom_fq_parts(atom);
 }
 
@@ -798,9 +800,10 @@ static void atom_free(txn_atom * atom)
 	       (atom->stage == ASTAGE_INVALID || atom->stage == ASTAGE_DONE));
 	atom->stage = ASTAGE_FREE;
 
-	blocknr_set_destroy(&atom->delete_set);
 	blocknr_set_destroy(&atom->wandered_map);
 
+	atom_dset_destroy(atom);
+
 	assert("jmacd-16", atom_isclean(atom));
 
 	spin_unlock_atom(atom);
@@ -1086,6 +1089,17 @@ static int commit_current_atom(long *nr_submitted, txn_atom ** atom)
 	if (ret < 0)
 		reiser4_panic("zam-597", "write log failed (%ld)\n", ret);
 
+	/* process and issue discard requests */
+	do {
+		spin_lock_atom(*atom);
+		ret = discard_atom(*atom);
+	} while (ret == -E_REPEAT);
+
+	if (ret) {
+		warning("intelfx-8", "discard atom failed (%ld)", ret);
+		ret = 0; /* the discard is optional, don't fail the commit */
+	}
+
 	/* The atom->ovrwr_nodes list is processed under commit mutex held
 	   because of bitmap nodes which are captured by special way in
 	   reiser4_pre_commit_hook_bitmap(), that way does not include
@@ -2938,9 +2952,11 @@ static void capture_fuse_into(txn_atom * small, txn_atom * large)
 	large->flags |= small->flags;
 
 	/* Merge blocknr sets. */
-	blocknr_set_merge(&small->delete_set, &large->delete_set);
 	blocknr_set_merge(&small->wandered_map, &large->wandered_map);
 
+	/* Merge delete sets. */
+	atom_dset_merge(small, large);
+
 	/* Merge allocated/deleted file counts */
 	large->nr_objects_deleted += small->nr_objects_deleted;
 	large->nr_objects_created += small->nr_objects_created;
@@ -3064,9 +3080,7 @@ reiser4_block_nr txnmgr_count_deleted_blocks(void)
 	list_for_each_entry(atom, &tmgr->atoms_list, atom_link) {
 		spin_lock_atom(atom);
 		if (atom_isopen(atom))
-			blocknr_set_iterator(
-				atom, &atom->delete_set,
-				count_deleted_blocks_actor, &result, 0);
+			atom_dset_deferred_apply(atom, count_deleted_blocks_actor, &result, 0);
 		spin_unlock_atom(atom);
 	}
 	spin_unlock_txnmgr(tmgr);
@@ -3074,6 +3088,105 @@ reiser4_block_nr txnmgr_count_deleted_blocks(void)
 	return result;
 }
 
+void atom_dset_init(txn_atom *atom)
+{
+	if (reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+		blocknr_list_init(&atom->discard.delete_set);
+		blocknr_list_init(&atom->discard.aux_delete_set);
+	} else {
+		blocknr_set_init(&atom->nodiscard.delete_set);
+	}
+}
+
+void atom_dset_destroy(txn_atom *atom)
+{
+	if (reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+		blocknr_list_destroy(&atom->discard.delete_set);
+		blocknr_list_destroy(&atom->discard.aux_delete_set);
+	} else {
+		blocknr_set_destroy(&atom->nodiscard.delete_set);
+	}
+}
+
+void atom_dset_merge(txn_atom *from, txn_atom *to)
+{
+	if (reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+		blocknr_list_merge(&from->discard.delete_set, &to->discard.delete_set);
+		blocknr_list_merge(&from->discard.aux_delete_set, &to->discard.aux_delete_set);
+	} else {
+		blocknr_set_merge(&from->nodiscard.delete_set, &to->nodiscard.delete_set);
+	}
+}
+
+int atom_dset_deferred_apply(txn_atom* atom,
+                             blocknr_set_actor_f actor,
+                             void *data,
+                             int delete)
+{
+	int ret;
+
+	if (reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+		ret = blocknr_list_iterator(atom,
+		                            &atom->discard.delete_set,
+		                            actor,
+		                            data,
+		                            delete);
+	} else {
+		ret = blocknr_set_iterator(atom,
+		                           &atom->nodiscard.delete_set,
+		                           actor,
+		                           data,
+		                           delete);
+	}
+
+	return ret;
+}
+
+extern int atom_dset_deferred_add_extent(txn_atom *atom,
+                                         void **new_entry,
+                                         const reiser4_block_nr *start,
+                                         const reiser4_block_nr *len)
+{
+	int ret;
+
+	if (reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+		ret = blocknr_list_add_extent(atom,
+		                              &atom->discard.delete_set,
+		                              (blocknr_list_entry**)new_entry,
+		                              start,
+		                              len);
+	} else {
+		ret = blocknr_set_add_extent(atom,
+		                             &atom->nodiscard.delete_set,
+		                             (blocknr_set_entry**)new_entry,
+		                             start,
+		                             len);
+	}
+
+	return ret;
+}
+
+extern int atom_dset_immediate_add_extent(txn_atom *atom,
+                                          void **new_entry,
+                                          const reiser4_block_nr *start,
+                                          const reiser4_block_nr *len)
+{
+	int ret;
+
+	if (reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+		ret = blocknr_list_add_extent(atom,
+		                             &atom->discard.aux_delete_set,
+		                             (blocknr_list_entry**)new_entry,
+		                             start,
+		                             len);
+	} else {
+		/* no-op */
+		ret = 0;
+	}
+
+	return ret;
+}
+
 /*
  * Local variables:
  * c-indentation-style: "K&R"
diff --git a/fs/reiser4/txnmgr.h b/fs/reiser4/txnmgr.h
index 18ca23d..02fc938 100644
--- a/fs/reiser4/txnmgr.h
+++ b/fs/reiser4/txnmgr.h
@@ -245,9 +245,26 @@ struct txn_atom {
 	/* Start time. */
 	unsigned long start_time;
 
-	/* The atom's delete set. It collects block numbers of the nodes
-	   which were deleted during the transaction. */
-	struct list_head delete_set;
+	/* The atom's delete sets.
+	   "simple" are blocknr_set instances and are used when discard is disabled.
+	   "discard" are blocknr_list instances and are used when discard is enabled. */
+	union {
+		struct {
+		/* The atom's delete set. It collects block numbers of the nodes
+		   which were deleted during the transaction. */
+			struct list_head delete_set;
+		} nodiscard;
+
+		struct {
+			/* The atom's delete set. It collects block numbers which were
+			   deallocated with BA_DEFER, i. e. of ordinary nodes. */
+			struct list_head delete_set;
+
+			/* The atom's auxiliary delete set. It collects block numbers
+			   which were deallocated without BA_DEFER, i. e. immediately. */
+			struct list_head aux_delete_set;
+		} discard;
+	};
 
 	/* The atom's wandered_block mapping. */
 	struct list_head wandered_map;
@@ -504,6 +521,27 @@ extern int blocknr_list_iterator(txn_atom *atom,
                                  void *data,
                                  int delete);
 
+/* These are wrappers for accessing and modifying atom's delete lists,
+   depending on whether discard is enabled or not.
+   If it is enabled. both deferred and immediate delete lists are maintained,
+   and (less memory efficient) blocknr_lists are used for storage. Otherwise, only
+   deferred delete list is maintained and blocknr_set is used for its storage. */
+extern void atom_dset_init(txn_atom *atom);
+extern void atom_dset_destroy(txn_atom *atom);
+extern void atom_dset_merge(txn_atom *from, txn_atom *to);
+extern int atom_dset_deferred_apply(txn_atom* atom,
+                                    blocknr_set_actor_f actor,
+                                    void *data,
+                                    int delete);
+extern int atom_dset_deferred_add_extent(txn_atom *atom,
+                                         void **new_entry,
+                                         const reiser4_block_nr *start,
+                                         const reiser4_block_nr *len);
+extern int atom_dset_immediate_add_extent(txn_atom *atom,
+                                          void **new_entry,
+                                          const reiser4_block_nr *start,
+                                          const reiser4_block_nr *len);
+
 /* flush code takes care about how to fuse flush queues */
 extern void flush_init_atom(txn_atom * atom);
 extern void flush_fuse_queues(txn_atom * large, txn_atom * small);
-- 
2.0.0

