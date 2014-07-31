From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv7 6/6] reiser4: discard support: initial implementation using blocknr_list, without extent padding.
Date: Thu, 31 Jul 2014 14:19:49 +0400
Message-ID: <1406801989-6884-7-git-send-email-intelfx100@gmail.com>
References: <1406801989-6884-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5j99BjWL9/jJH5DwGc3KG7pYCHNVHnUs9XkHJtoC75A=;
        b=fpmxM7P4/UuKy7WZkyywCQmi3oXy7rlYO56O/sXxGLiCOFfVedsqQZeakvTGfgkKRu
         jABOJOy4gVtfb3cYWbjWpdJcxcm/AGSMbrODLHBqVwiWiumCIh/F53djM3v+gslg06t9
         Y42Z7cx8uXnq8R9TSkNymIqztygu/QD5KzhfBA7bAiP8VRGPKqTkTO5KBfl8ZmzSRuOa
         AFNDb9Y0v9RKAGDlAehtUQp8P0ZWUXcHWdrxNs7knwyiKisVPHSZNoOxI3jQMSFoq1Cm
         T1deu1oKDx/hArcoNKvnZeU0Wnm81/087wglLSoC6UzsINRL9+Cyc4lo/vMK1x7H4mNx
         pDaQ==
In-Reply-To: <1406801989-6884-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

Now reiser4_post_write_back_hook() is used for discarding and completing
deferred deallocations. The invocation of this hook has been moved past
immediate deallocations in the wandered logs code. Also, when discard is
enabled, immediate deallocations are made deferred, and discard procedure
takes place before any deallocations are completed. This allows to avoid
costly bitmap checks at discard time.

Implementation details:

- before discarding, the delete set is sorted and extents are merged
- each extent is submitted to discard as-is (blocks in all extents
  are still marked as allocated at this point, so there can be no races)
- processing stops at first failure (this does not fail atom commit)

For now (shortcomings):

- extents are not padded to erase unit boundaries

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/Makefile              |   1 +
 fs/reiser4/block_alloc.c         |  44 +++++++---
 fs/reiser4/dformat.h             |   2 +
 fs/reiser4/discard.c             | 179 +++++++++++++++++++++++++++++++++++++++
 fs/reiser4/discard.h             |  42 +++++++++
 fs/reiser4/init_super.c          |   2 +
 fs/reiser4/plugin/space/bitmap.c |   3 +-
 fs/reiser4/super.h               |   4 +-
 fs/reiser4/txnmgr.c              |  90 ++++++++++++++++++--
 fs/reiser4/txnmgr.h              |  37 +++++++-
 fs/reiser4/wander.c              |   3 +-
 11 files changed, 381 insertions(+), 26 deletions(-)
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
index 59515c3..324b11c 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -9,6 +9,7 @@ reiser4/README */
 #include "block_alloc.h"
 #include "tree.h"
 #include "super.h"
+#include "discard.h"
 
 #include <linux/types.h>	/* for __u??  */
 #include <linux/fs.h>		/* for struct super_block  */
@@ -992,6 +993,7 @@ reiser4_dealloc_blocks(const reiser4_block_nr * start,
 	int ret;
 	reiser4_context *ctx;
 	reiser4_super_info_data *sbinfo;
+	void *new_entry = NULL;
 
 	ctx = get_current_context();
 	sbinfo = get_super_private(ctx->super);
@@ -1006,18 +1008,15 @@ reiser4_dealloc_blocks(const reiser4_block_nr * start,
 		spin_unlock_reiser4_super(sbinfo);
 	}
 
-	if (flags & BA_DEFER) {
-		blocknr_set_entry *bsep = NULL;
-
-		/* storing deleted block numbers in a blocknr set
-		   datastructure for further actual deletion */
+	if ((flags & BA_DEFER) ||
+	    reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
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
@@ -1120,15 +1119,13 @@ apply_dset(txn_atom * atom UNUSED_ARG, const reiser4_block_nr * a,
 
 void reiser4_post_commit_hook(void)
 {
+#ifdef REISER4_DEBUG
 	txn_atom *atom;
 
 	atom = get_current_atom_locked();
 	assert("zam-452", atom->stage == ASTAGE_POST_COMMIT);
 	spin_unlock_atom(atom);
-
-	/* do the block deallocation which was deferred
-	   until commit is done */
-	blocknr_set_iterator(atom, &atom->delete_set, apply_dset, NULL, 1);
+#endif
 
 	assert("zam-504", get_current_super_private() != NULL);
 	sa_post_commit_hook();
@@ -1136,8 +1133,29 @@ void reiser4_post_commit_hook(void)
 
 void reiser4_post_write_back_hook(void)
 {
-	assert("zam-504", get_current_super_private() != NULL);
+	struct list_head discarded_set;
+	txn_atom *atom;
+	int ret;
 
+	/* process and issue discard requests */
+	blocknr_list_init (&discarded_set);
+	do {
+		atom = get_current_atom_locked();
+		ret = discard_atom(atom, &discarded_set);
+	} while (ret == -E_REPEAT);
+
+	if (ret) {
+		warning("intelfx-8", "discard atom failed (%d)", ret);
+	}
+
+	atom = get_current_atom_locked();
+	discard_atom_post(atom, &discarded_set);
+
+	/* do the block deallocation which was deferred
+	   until commit is done */
+	atom_dset_deferred_apply(atom, apply_dset, NULL, 1);
+
+	assert("zam-504", get_current_super_private() != NULL);
 	sa_post_write_back_hook();
 }
 
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
index 0000000..7a07afc
--- /dev/null
+++ b/fs/reiser4/discard.c
@@ -0,0 +1,179 @@
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
+ * set. In reiser4, there are two methods to deallocate a block:
+ * 1. deferred deallocation, enabled by BA_DEFER flag to reiser4_dealloc_block().
+ *    In this mode, blocks are stored to delete set instead of being marked free
+ *    immediately. After committing the transaction, the delete set is "applied"
+ *    by the block allocator and all these blocks are marked free in memory
+ *    (see reiser4_post_write_back_hook()).
+ *    Space management plugins also read the delete set to update on-disk
+ *    allocation records (see reiser4_pre_commit_hook()).
+ * 2. immediate deallocation (the opposite).
+ *    In this mode, blocks are marked free immediately. This is used by the
+ *    journal subsystem to manage space used by the journal records, so these
+ *    allocations are not visible to the space management plugins and never hit
+ *    the disk.
+ *
+ * When discard is enabled, all immediate deallocations become deferred. This
+ * is OK because journal's allocations happen after reiser4_pre_commit_hook()
+ * where the on-disk space allocation records are updated. So, in this mode
+ * the atom's delete set becomes "the discard set" -- list of blocks that have
+ * to be considered for discarding.
+ *
+ * Discarding is performed before completing deferred deallocations, hence all
+ * extents in the discard set are still marked as allocated and cannot contain
+ * any data. Thus we can avoid any checks for blocks directly present in the
+ * discard set.
+ *
+ * For now, we don't perform "padding" of extents to erase unit boundaries.
+ * This means if extents are not aligned with the device's erase unit lattice,
+ * the partial erase units at head and tail of extents are truncated by kernel
+ * (in blkdev_issue_discard()).
+ *
+ * So, at commit time the following actions take place:
+ * - delete sets are merged to form the discard set;
+ * - elements of the discard set are sorted;
+ * - the discard set is iterated, joining any adjacent extents;
+ * - for each extent, a single call to blkdev_issue_discard() is done.
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
+
+	sector_t extent_start_sec, extent_len_sec;
+
+	const int sec_per_blk = sb->s_blocksize >> 9;
+
+	/* we assume block = N * sector */
+	assert("intelfx-7", sec_per_blk > 0);
+
+	/* convert extent to sectors */
+	extent_start_sec = *start * sec_per_blk;
+	extent_len_sec = *len * sec_per_blk;
+
+	/* discard the extent, don't pad it to erase unit boundaries for now */
+	return __discard_extent(bdev, extent_start_sec, extent_len_sec);
+}
+
+int discard_atom(txn_atom *atom, struct list_head *processed_set)
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
+	assert("intelfx-59", processed_entries != NULL);
+
+	if (list_empty(&atom->discard.delete_set)) {
+		/* Nothing left to discard. */
+		spin_unlock_atom(atom);
+		return 0;
+	}
+
+	/* Take the delete sets from the atom in order to release atom spinlock. */
+	blocknr_list_init(&discard_set);
+	blocknr_list_merge(&atom->discard.delete_set, &discard_set);
+	spin_unlock_atom(atom);
+
+	/* Sort the discard list, joining adjacent and overlapping extents. */
+	blocknr_list_sort_and_join(&discard_set);
+
+	/* Perform actual dirty work. */
+	ret = blocknr_list_iterator(NULL, &discard_set, &discard_extent, NULL, 0);
+
+	/* Add processed extents to the temporary list. */
+	blocknr_list_merge(&discard_set, processed_set);
+
+	if (ret != 0) {
+		return ret;
+	}
+
+	/* Let's do this again for any new extents in the atom's discard set. */
+	return -E_REPEAT;
+}
+
+void discard_atom_post(txn_atom *atom, struct list_head *processed_set)
+{
+	assert("intelfx-60", atom != NULL);
+	assert("intelfx-61", processed_entries != NULL);
+
+	if (!reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+		spin_unlock_atom(atom);
+		return;
+	}
+
+	blocknr_list_merge(processed_set, &atom->discard.delete_set);
+	spin_unlock_atom(atom);
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
index 0000000..5f0d0d8
--- /dev/null
+++ b/fs/reiser4/discard.h
@@ -0,0 +1,42 @@
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
+ * if discard is enabled. The extents processed are removed from the @atom's
+ * delete sets and stored in @processed_set.
+ *
+ * @atom must be locked on entry and is unlocked on exit.
+ * @processed_set must be initialized with blocknr_list_init().
+ */
+extern int discard_atom(txn_atom *atom, struct list_head *processed_set);
+
+/**
+ * Splices @processed_set back to @atom's delete set.
+ * Must be called after discard_atom() loop, using the same @processed_set.
+ *
+ * @atom must be locked on entry and is unlocked on exit.
+ * @processed_set must be the same as passed to discard_atom().
+ */
+extern void discard_atom_post(txn_atom *atom, struct list_head *processed_set);
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
index bd41fb9..3da3f6b 100644
--- a/fs/reiser4/plugin/space/bitmap.c
+++ b/fs/reiser4/plugin/space/bitmap.c
@@ -1458,8 +1458,7 @@ int reiser4_pre_commit_hook_bitmap(void)
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
index 4950179..d73ecb9 100644
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
@@ -2938,9 +2941,11 @@ static void capture_fuse_into(txn_atom * small, txn_atom * large)
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
@@ -3064,9 +3069,7 @@ reiser4_block_nr txnmgr_count_deleted_blocks(void)
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
@@ -3074,6 +3077,81 @@ reiser4_block_nr txnmgr_count_deleted_blocks(void)
 	return result;
 }
 
+void atom_dset_init(txn_atom *atom)
+{
+	if (reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+		blocknr_list_init(&atom->discard.delete_set);
+	} else {
+		blocknr_set_init(&atom->nodiscard.delete_set);
+	}
+}
+
+void atom_dset_destroy(txn_atom *atom)
+{
+	if (reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+		blocknr_list_destroy(&atom->discard.delete_set);
+	} else {
+		blocknr_set_destroy(&atom->nodiscard.delete_set);
+	}
+}
+
+void atom_dset_merge(txn_atom *from, txn_atom *to)
+{
+	if (reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
+		blocknr_list_merge(&from->discard.delete_set, &to->discard.delete_set);
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
 /*
  * Local variables:
  * c-indentation-style: "K&R"
diff --git a/fs/reiser4/txnmgr.h b/fs/reiser4/txnmgr.h
index 0dee787..72b84a2 100644
--- a/fs/reiser4/txnmgr.h
+++ b/fs/reiser4/txnmgr.h
@@ -245,9 +245,24 @@ struct txn_atom {
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
+			/* The atom's delete set. It collects all blocks that have been
+			   deallocated (both immediate and deferred) during the transaction.
+			   These blocks are considered for discarding at commit time.
+			   For details see discard.c */
+			struct list_head delete_set;
+		} discard;
+	};
 
 	/* The atom's wandered_block mapping. */
 	struct list_head wandered_map;
@@ -508,6 +523,22 @@ extern int blocknr_list_iterator(txn_atom *atom,
                                  void *data,
                                  int delete);
 
+/* These are wrappers for accessing and modifying atom's delete lists,
+   depending on whether discard is enabled or not.
+   If it is enabled, (less memory efficient) blocknr_list is used for delete
+   list storage. Otherwise, blocknr_set is used for this purpose. */
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
+
 /* flush code takes care about how to fuse flush queues */
 extern void flush_init_atom(txn_atom * atom);
 extern void flush_fuse_queues(txn_atom * large, txn_atom * small);
diff --git a/fs/reiser4/wander.c b/fs/reiser4/wander.c
index 4e29de8..04ddec6 100644
--- a/fs/reiser4/wander.c
+++ b/fs/reiser4/wander.c
@@ -1252,7 +1252,6 @@ int reiser4_write_logs(long *nr_submitted)
 	reiser4_post_commit_hook();
 
 	ret = write_tx_back(&ch);
-	reiser4_post_write_back_hook();
 
       up_and_ret:
 	if (ret) {
@@ -1265,6 +1264,8 @@ int reiser4_write_logs(long *nr_submitted)
 	dealloc_tx_list(&ch);
 	dealloc_wmap(&ch);
 
+	reiser4_post_write_back_hook();
+
 	put_overwrite_set(&ch);
 
 	done_commit_handle(&ch);
-- 
2.0.3

