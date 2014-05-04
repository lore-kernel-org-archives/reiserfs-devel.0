From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCH] reiser4: discard support: initial implementation using extent lists.
Date: Sun,  4 May 2014 22:11:28 +0400
Message-ID: <1399227088-13665-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=nkt/mivd38xzoLLnZ1+9Rc0MDZjB8IoXa8n1wHawpvo=;
        b=A97XUtzBHpJ+53o77fbwBYg2sxRiQbdcrRPXJD3nUBHm7FnkmOw27RqkSlEFQsr9Qn
         Su6hrgYDy2iZPgZFeWQb6L40FP6jUO5apcVKX7Fc5v2KkD4GQjH++C6FCfhcOVTUYj99
         ZTJrkloywhUPSGDs2nha/HCKVzNSbOF49KU3HP1TTrzr1GEmkikc11k94ca2HKkjNM59
         FJovvjl0f2TISrZiAKoJKfoQX/htLqT157rI32sY2HmCTiYYDz0ijF0oQ2jiZuPsuRQN
         6MR/BG2zJJxEox0H7f+EMwLvvAV8HdITz1eueCIym/MGDO51o4i15tZnirvqbKgVpT/X
         H/Iw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

- extents are pre-merged when adding, if possible
  (if an extent is adjacent to the last one)
- extents are sorted and finally merged at commit time
- allocator's check_blocks() has been adapted to return int instead of
  asserting success
- -E_REPEAT loop has been used to work around the fact that
  blkdev_issue_discard() sleeps

Discard functionality is now enabled unconditionally.
Issuing of discard requests should stop (untested) after a first failure
encountered; discard failure does not fail atom commit.

Kernel-reported granularity (erase unit size) is now used.
It could make sense to allow manual override, because sometimes (e. g. here)
granularity is reported as 1 sector.

Processing of each erase unit makes its own bitmap check. This implementation
is suboptimal in cases when granularity is less than the block size (the
same block is checked multiple times, once per each erase unit).

And it floods the kernel log.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---

It seems not to crash the fs.
BTW, what is reiser4 assert policy? Should I assert-check each and every
pointer and every invariant condition I can invent?

 fs/reiser4/Makefile                       |   1 +
 fs/reiser4/block_alloc.c                  |  38 ++-
 fs/reiser4/block_alloc.h                  |  14 +-
 fs/reiser4/dformat.h                      |   2 +
 fs/reiser4/discard.c                      | 434 ++++++++++++++++++++++++++++++
 fs/reiser4/discard.h                      |  38 +++
 fs/reiser4/forward.h                      |   1 +
 fs/reiser4/plugin/space/bitmap.c          |  77 ++++--
 fs/reiser4/plugin/space/bitmap.h          |   2 +-
 fs/reiser4/plugin/space/space_allocator.h |   4 +-
 fs/reiser4/txnmgr.c                       |  21 ++
 fs/reiser4/txnmgr.h                       |   7 +
 fs/reiser4/znode.c                        |   9 +-
 13 files changed, 594 insertions(+), 54 deletions(-)
 create mode 100644 fs/reiser4/discard.c
 create mode 100644 fs/reiser4/discard.h

diff --git a/fs/reiser4/Makefile b/fs/reiser4/Makefile
index 746aa32f..f992cf9 100644
--- a/fs/reiser4/Makefile
+++ b/fs/reiser4/Makefile
@@ -46,6 +46,7 @@ reiser4-y := \
 		   status_flags.o \
 		   init_super.o \
 		   safe_link.o \
+		   discard.o \
            \
 		   plugin/plugin.o \
 		   plugin/plugin_set.o \
diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 6aa8418..293349f 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -9,6 +9,7 @@ reiser4/README */
 #include "block_alloc.h"
 #include "tree.h"
 #include "super.h"
+#include "discard.h"
 
 #include <linux/types.h>	/* for __u??  */
 #include <linux/fs.h>		/* for struct super_block  */
@@ -939,26 +940,14 @@ static void used2free(reiser4_super_info_data * sbinfo, __u64 count)
 	spin_unlock_reiser4_super(sbinfo);
 }
 
-#if REISER4_DEBUG
-
 /* check "allocated" state of given block range */
-static void
+int
 reiser4_check_blocks(const reiser4_block_nr * start,
 		     const reiser4_block_nr * len, int desired)
 {
-	sa_check_blocks(start, len, desired);
+	return sa_check_blocks(start, len, desired);
 }
 
-/* check "allocated" state of given block */
-void reiser4_check_block(const reiser4_block_nr * block, int desired)
-{
-	const reiser4_block_nr one = 1;
-
-	reiser4_check_blocks(block, &one, desired);
-}
-
-#endif
-
 /* Blocks deallocation function may do an actual deallocation through space
    plugin allocation or store deleted block numbers in atom's delete_set data
    structure depend on @defer parameter. */
@@ -981,6 +970,7 @@ reiser4_dealloc_blocks(const reiser4_block_nr * start,
 	int ret;
 	reiser4_context *ctx;
 	reiser4_super_info_data *sbinfo;
+	discard_set_entry *dsep = NULL;
 
 	ctx = get_current_context();
 	sbinfo = get_super_private(ctx->super);
@@ -995,6 +985,26 @@ reiser4_dealloc_blocks(const reiser4_block_nr * start,
 		spin_unlock_reiser4_super(sbinfo);
 	}
 
+	/* XXX: store block numbers for further discard */
+	do {
+		atom = get_current_atom_locked();
+		assert("intelfx-1", atom != NULL);
+
+		ret = discard_set_add_extent(atom, &dsep, start, len);
+
+		if (ret == -ENOMEM) {
+		    warning("intelfx-2", "could not add extent (start %llu len %llu) to discard set: %d",
+			    (unsigned long long) *start, (unsigned long long) *len, ret);
+		    break;
+		}
+
+		/* This loop might spin at most two times */
+	} while (ret == -E_REPEAT);
+
+	assert("intelfx-3", ret == 0 || ret == -ENOMEM);
+
+	spin_unlock_atom(atom);
+
 	if (flags & BA_DEFER) {
 		blocknr_set_entry *bsep = NULL;
 
diff --git a/fs/reiser4/block_alloc.h b/fs/reiser4/block_alloc.h
index 689efc1..a4e98af 100644
--- a/fs/reiser4/block_alloc.h
+++ b/fs/reiser4/block_alloc.h
@@ -150,15 +150,15 @@ extern void cluster_reserved2free(int count);
 
 extern int reiser4_check_block_counters(const struct super_block *);
 
-#if REISER4_DEBUG
 
-extern void reiser4_check_block(const reiser4_block_nr *, int);
+extern int reiser4_check_blocks(const reiser4_block_nr *start,
+                                const reiser4_block_nr *len, int desired);
 
-#else
-
-#  define reiser4_check_block(beg, val)        noop
-
-#endif
+static inline int reiser4_check_block(const reiser4_block_nr *start,
+                                      int desired)
+{
+	return reiser4_check_blocks(start, NULL, desired);
+}
 
 extern int reiser4_pre_commit_hook(void);
 extern void reiser4_post_commit_hook(void);
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
index 0000000..9b6a4e3
--- /dev/null
+++ b/fs/reiser4/discard.c
@@ -0,0 +1,434 @@
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
+ * The offset from the partition start to the first erase unit is kept in struct
+ * queue_limits as discard_alignment.
+ *
+ * At atom level, we log all blocks that happen to be deallocated at least once.
+ * Then we have to read the log, filter out any blocks that have since been
+ * allocated again and issue discards for everything still valid. This is what
+ * discard.[ch] is here for.
+ *
+ * The log is ->discard_set of struct txn_atom. Simply iterating through the
+ * logged block ranges is not enough:
+ * - if a single logged range is smaller than the erase unit, then this
+ *   particular range won't be discarded even if it is surrounded by enough
+ *   free blocks to constitute a whole erase unit;
+ * - we won't be able to merge small adjacent ranges forming a range long enough
+ *   to be discarded.
+ *
+ * MECHANISM:
+ *
+ * During the transaction deallocated extents are logged as-is to a data
+ * structure (let's call it "the discard set"). On atom commit we will generate
+ * a minimal superset of the discard set, but comprised of whole erase units.
+ *
+ * For now the discard set is a linked list.
+ *
+ * So, at commit time the following actions take place:
+ * - elements of the discard set are sorted;
+ * - the discard set is iterated, merging any adjacent extents;
+ * - each resulting extents is "covered" by erase units:
+ *   - its start is rounded down to the closest erase unit boundary;
+ *   - starting from this block, extents of erase unit length are created
+ *     until the original is fully covered
+ * - the calculated erase units are checked to be fully deallocated
+ * - remaining (valid) erase units are then passed to blkdev_issue_discard()
+ */
+
+#include "discard.h"
+#include "context.h"
+#include "debug.h"
+#include "txnmgr.h"
+#include "super.h"
+
+#include <linux/slab.h>
+#include <linux/list_sort.h>
+#include <linux/fs.h>
+#include <linux/blkdev.h>
+
+/**
+ * Represents an extent range [@start; @end).
+ */
+struct discard_set_entry {
+	reiser4_block_nr start, end;
+	struct list_head link;
+};
+
+#define discard_list_entry(ptr) list_entry(ptr, discard_set_entry, link)
+
+static void discard_set_entry_init(discard_set_entry *entry)
+{
+	entry->start = 0;
+	entry->end = 0;
+	INIT_LIST_HEAD(&entry->link);
+}
+
+static discard_set_entry *discard_set_entry_alloc(void)
+{
+	discard_set_entry *entry;
+
+	entry = (discard_set_entry *) kmalloc(sizeof(discard_set_entry),
+	                                      reiser4_ctx_gfp_mask_get());
+	if (entry == NULL) {
+		return NULL;
+	}
+
+	discard_set_entry_init(entry);
+
+	return entry;
+}
+
+static void discard_set_entry_free(discard_set_entry *entry)
+{
+	kfree(entry);
+}
+
+/**
+ * Given ranges @to and [@start; @end), if they overlap, their union
+ * is calculated and saved in @to.
+ */
+static int discard_set_entry_merge(discard_set_entry *to,
+                                   reiser4_block_nr start,
+                                   reiser4_block_nr end)
+{
+	if (to->start <= end && start <= to->end) {
+		reiser4_log ("discard", "Merging extents: [%llu; %llu) and [%llu; %llu)",
+		             to->start, to->end, start, end);
+
+		if (start < to->start) {
+			to->start = start;
+		}
+
+		if (end > to->end) {
+			to->end = end;
+		}
+
+		return 0;
+	}
+
+	return -1;
+}
+
+static int discard_set_entry_merge_entry(discard_set_entry *to,
+                                         discard_set_entry *from)
+{
+	return discard_set_entry_merge(to, from->start, from->end);
+}
+
+/**
+ * A comparison function for list_sort().
+ *
+ * "The comparison function @cmp must return a negative value if @a
+ * should sort before @b, and a positive value if @a should sort after
+ * @b. If @a and @b are equivalent, and their original relative
+ * ordering is to be preserved, @cmp must return 0."
+ */
+static int discard_set_entry_compare(void* priv, struct list_head *a,
+                                     struct list_head *b)
+{
+	discard_set_entry *entry_a, *entry_b;
+
+	entry_a = discard_list_entry(a);
+	entry_b = discard_list_entry(b);
+
+	/* First sort by starting block numbers... */
+	if (entry_a->start < entry_b->start) {
+		return -1;
+	}
+
+	if (entry_a->start > entry_b->start) {
+		return 1;
+	}
+
+	/** Then by ending block numbers.
+	 * If @a contains @b, it will be sorted before. */
+	if (entry_a->end > entry_b->end) {
+		return -1;
+	}
+
+	if (entry_a->end < entry_b->end) {
+		return 1;
+	}
+
+	return 0;
+}
+
+static int __discard_extent(struct block_device *bdev, sector_t start, sector_t len)
+{
+	reiser4_log("discard", "DISCARDING: [%llu; %llu)",
+	            (unsigned long long)start,
+	            (unsigned long long)(start + len));
+
+	return blkdev_issue_discard(bdev, start, len, reiser4_ctx_gfp_mask_get(), 0);
+}
+
+static int discard_extent(discard_set_entry *e)
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
+	reiser4_log ("discard", "Extent {blk}: [%llu; %llu)",
+	             (unsigned long long)e->start,
+	             (unsigned long long)e->end);
+
+	/* convert extent to sectors */
+	extent_start_sec = e->start * sec_per_blk;
+	extent_end_sec = e->end * sec_per_blk;
+
+	reiser4_log ("discard", "Extent {sec}: [%llu; %llu)",
+	             (unsigned long long)extent_start_sec,
+	             (unsigned long long)extent_end_sec);
+
+	/* round down extent start sector to an erase unit boundary */
+	unit_sec = extent_start_sec;
+	if (granularity > 1) {
+		unit_sec -= ((extent_start_sec - alignment) % granularity);
+	}
+
+	/* iterate over erase units in the extent */
+	do {
+		/* considering erase unit:
+		 * [unit_sec; unit_sec + granularity) */
+
+		reiser4_log ("discard", "Erase unit %d {sec}: [%llu; %llu)",
+		             erase_unit_counter,
+		             (unsigned long long)unit_sec,
+		             (unsigned long long)(unit_sec + granularity));
+
+		/* calculate block range for erase unit:
+		 * [unit_start_blk; unit_start_blk+unit_len_blk) */
+		unit_start_blk = unit_sec;
+		sector_div(unit_start_blk, sec_per_blk);
+
+		if (granularity > 1) {
+			unit_len_blk = unit_sec + granularity - 1;
+			sector_div(unit_len_blk, sec_per_blk);
+			unit_len_blk += 1 - unit_start_blk;
+		} else {
+			unit_len_blk = 1;
+		}
+
+		reiser4_log("discard", "Erase unit %d {blk}: [%llu; %llu)",
+		            erase_unit_counter,
+		            (unsigned long long)unit_start_blk,
+		            (unsigned long long)(unit_start_blk + unit_len_blk));
+
+		if (reiser4_check_blocks(&unit_start_blk, &unit_len_blk, 0)) {
+			/* OK. Add this unit to the accumulator.
+			 * We accumulate discard units to call blkdev_issue_discard()
+			 * not too frequently. */
+
+			reiser4_log("discard", "Erase unit %d: OK, adding to request",
+			            erase_unit_counter);
+
+			if (request_len_sec > 0) {
+				request_len_sec += granularity;
+			} else {
+				request_start_sec = unit_sec;
+				request_len_sec = granularity;
+			}
+
+			reiser4_log("discard", "Erase unit %d: request updated: [%llu; %llu)",
+			            erase_unit_counter,
+			            (unsigned long long)request_start_sec,
+			            (unsigned long long)(request_start_sec + request_len_sec));
+		} else {
+			/* This unit can't be discarded. Discard what's been accumulated
+			 * so far. */
+			if (request_len_sec > 0) {
+				if ((ret = __discard_extent(bdev, request_start_sec,
+				                            request_len_sec))) {
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
+		if ((ret = __discard_extent(bdev, request_start_sec,
+		                            request_len_sec))) {
+			return ret;
+		}
+	}
+
+	reiser4_log ("discard", "Extent done");
+
+	return 0;
+}
+
+static int __discard_list(struct list_head *list)
+{
+	struct list_head *pos;
+	struct discard_set_entry *entry;
+	int ret;
+	int extent_count = 0;
+
+	list_for_each(pos, list) {
+		entry = discard_list_entry(pos);
+
+		if ((ret = discard_extent(entry))) {
+			return ret;
+		}
+
+		++extent_count;
+	}
+
+	reiser4_log ("discard", "Discarding: %d extents",
+	             extent_count);
+
+	return 0;
+}
+
+void discard_set_init(txn_atom *atom)
+{
+	INIT_LIST_HEAD(&atom->discard_set);
+}
+
+void discard_set_destroy(txn_atom *atom)
+{
+	struct list_head *pos, *tmp;
+	discard_set_entry *entry;
+
+	list_for_each_safe(pos, tmp, &atom->discard_set) {
+		entry = discard_list_entry(pos);
+		list_del_init(pos);
+		discard_set_entry_free(entry);
+	}
+}
+
+void discard_set_merge(txn_atom *from, txn_atom *to)
+{
+	list_splice_tail_init(&from->discard_set, &to->discard_set);
+}
+
+int discard_atom(txn_atom *atom)
+{
+	int ret;
+	struct list_head discard_set, *pos, *next;
+	struct discard_set_entry *entry, *next_entry;
+
+	if (list_empty(&atom->discard_set)) {
+		spin_unlock_atom(atom);
+		return 0;
+	}
+
+	/* Step 0. Take the discard set from the atom in order to release
+	 * atom spinlock. */
+	discard_set = atom->discard_set;
+	INIT_LIST_HEAD(&atom->discard_set);
+	spin_unlock_atom(atom);
+
+	/* Step 1. Sort the extent list. */
+	list_sort (NULL, &discard_set, discard_set_entry_compare);
+
+	/* Step 2. Join adjacent extents in the list. */
+	pos = discard_set.next;
+	next = pos->next;
+	entry = discard_list_entry(pos);
+
+	for (;
+	     next != &discard_set;
+	     pos = next, next = pos->next, entry = next_entry) {
+		next_entry = discard_list_entry(next);
+
+		while (!discard_set_entry_merge_entry (entry, next_entry)) {
+			list_del_init(next);
+			discard_set_entry_free(next_entry);
+
+			next = pos->next;
+			next_entry = discard_list_entry(next);
+		}
+	}
+
+	/* Step 3. Perform actual dirty work. */
+	if ((ret = __discard_list(&discard_set))) {
+		return ret;
+	}
+
+	/* Let's do this again for any new extents in the atom's discard set. */
+	return -E_REPEAT;
+}
+
+extern int discard_set_add_extent(txn_atom *atom,
+                                  discard_set_entry **new_entry,
+                                  const reiser4_block_nr *start,
+                                  const reiser4_block_nr *len)
+{
+	if (*new_entry == NULL) {
+		/*
+		 * Optimization: try to merge new extent into the last one.
+		 */
+		if (!list_empty(&atom->discard_set)) {
+			discard_set_entry *last_entry;
+			last_entry = discard_list_entry(atom->discard_set.prev);
+			if (!discard_set_entry_merge(last_entry, *start, *start + *len)) {
+				return 0;
+			}
+		}
+
+		/*
+		 * Otherwise, allocate a new entry and tell -E_REPEAT.
+		 * Next time we'll take the branch below.
+		 */
+		spin_unlock_atom(atom);
+		*new_entry = discard_set_entry_alloc();
+		return (*new_entry != NULL) ? -E_REPEAT : RETERR(-ENOMEM);
+	}
+
+	/*
+	 * The entry has been allocated beforehand, fill it and link to the list.
+	 */
+	(*new_entry)->start = *start;
+	(*new_entry)->end = *start + *len;
+	list_add_tail(&(*new_entry)->link, &atom->discard_set);
+
+	return 0;
+}
+
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
index 0000000..dc3d43c
--- /dev/null
+++ b/fs/reiser4/discard.h
@@ -0,0 +1,38 @@
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
+extern int discard_atom (txn_atom *atom);
+
+/**
+ * Adds a "candidate" extent to the "discard set" of the @atom.
+ * The @atom should be locked.
+ */
+extern int discard_set_add_extent(txn_atom *atom,
+                                  discard_set_entry **new_entry,
+                                  const reiser4_block_nr *start,
+                                  const reiser4_block_nr *len);
+
+extern void discard_set_init(txn_atom *atom);
+extern void discard_set_destroy(txn_atom *atom);
+extern void discard_set_merge(txn_atom *from, txn_atom *to);
+
+/* __FS_REISER4_DSCALE_H__ */
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
diff --git a/fs/reiser4/forward.h b/fs/reiser4/forward.h
index 15dbfdc..a83db08 100644
--- a/fs/reiser4/forward.h
+++ b/fs/reiser4/forward.h
@@ -38,6 +38,7 @@ typedef struct reiser4_dir_entry_desc reiser4_dir_entry_desc;
 typedef struct reiser4_context reiser4_context;
 typedef struct carry_level carry_level;
 typedef struct blocknr_set_entry blocknr_set_entry;
+typedef struct discard_set_entry discard_set_entry;
 /* super_block->s_fs_info points to this */
 typedef struct reiser4_super_info_data reiser4_super_info_data;
 /* next two objects are fields of reiser4_super_info_data */
diff --git a/fs/reiser4/plugin/space/bitmap.c b/fs/reiser4/plugin/space/bitmap.c
index 1d0fabf..5bfa71b 100644
--- a/fs/reiser4/plugin/space/bitmap.c
+++ b/fs/reiser4/plugin/space/bitmap.c
@@ -1222,29 +1222,13 @@ void reiser4_dealloc_blocks_bitmap(reiser4_space_allocator * allocator,
 	release_and_unlock_bnode(bnode);
 }
 
-/* plugin->u.space_allocator.check_blocks(). */
-void reiser4_check_blocks_bitmap(const reiser4_block_nr * start,
-				 const reiser4_block_nr * len, int desired)
+static int check_blocks_one_bitmap(bmap_nr_t bmap, bmap_off_t start_offset,
+                                    bmap_off_t end_offset, int desired)
 {
-#if REISER4_DEBUG
 	struct super_block *super = reiser4_get_current_sb();
-
-	bmap_nr_t bmap;
-	bmap_off_t start_offset;
-	bmap_off_t end_offset;
-
-	struct bitmap_node *bnode;
+	struct bitmap_node *bnode = get_bnode(super, bmap);
 	int ret;
 
-	assert("zam-622", len != NULL);
-	check_block_range(start, len);
-	parse_blocknr(start, &bmap, &start_offset);
-
-	end_offset = start_offset + *len;
-	assert("nikita-2214", end_offset <= bmap_bit_count(super->s_blocksize));
-
-	bnode = get_bnode(super, bmap);
-
 	assert("nikita-2215", bnode != NULL);
 
 	ret = load_and_lock_bnode(bnode);
@@ -1253,19 +1237,60 @@ void reiser4_check_blocks_bitmap(const reiser4_block_nr * start,
 	assert("nikita-2216", jnode_is_loaded(bnode->wjnode));
 
 	if (desired) {
-		assert("zam-623",
-		       reiser4_find_next_zero_bit(bnode_working_data(bnode),
+		ret = reiser4_find_next_zero_bit(bnode_working_data(bnode),
 						  end_offset, start_offset)
-		       >= end_offset);
+		      >= end_offset;
 	} else {
-		assert("zam-624",
-		       reiser4_find_next_set_bit(bnode_working_data(bnode),
+		ret = reiser4_find_next_set_bit(bnode_working_data(bnode),
 						 end_offset, start_offset)
-		       >= end_offset);
+		      >= end_offset;
 	}
 
 	release_and_unlock_bnode(bnode);
-#endif
+
+	return ret;
+}
+
+/* plugin->u.space_allocator.check_blocks(). */
+int reiser4_check_blocks_bitmap(const reiser4_block_nr * start,
+				 const reiser4_block_nr * len, int desired)
+{
+	struct super_block *super = reiser4_get_current_sb();
+
+	reiser4_block_nr end;
+	bmap_nr_t bmap, end_bmap;
+	bmap_off_t offset;
+	bmap_off_t end_offset;
+	const bmap_off_t max_offset = bmap_bit_count(super->s_blocksize);
+
+	if (len != NULL) {
+		check_block_range(start, len);
+		end = *start + *len - 1;
+	} else {
+		/* end is used as temporary len here */
+		check_block_range(start, &(end = 1));
+		end = *start;
+	}
+
+	parse_blocknr(start, &bmap, &offset);
+
+	if (end == *start) {
+		end_bmap = bmap;
+		end_offset = offset;
+	} else {
+		parse_blocknr(&end, &end_bmap, &end_offset);
+	}
+	++end_offset;
+
+	assert("intelfx-4", end_bmap >= bmap);
+	assert("intelfx-5", ergo(end_bmap == bmap, end_offset > offset));
+
+	for (; bmap < end_bmap; bmap++, offset = 0) {
+		if (!check_blocks_one_bitmap(bmap, offset, max_offset, desired)) {
+			return 0;
+		}
+	}
+	return check_blocks_one_bitmap(bmap, offset, end_offset, desired);
 }
 
 /* conditional insertion of @node into atom's overwrite set  if it was not there */
diff --git a/fs/reiser4/plugin/space/bitmap.h b/fs/reiser4/plugin/space/bitmap.h
index be867f1..4590498 100644
--- a/fs/reiser4/plugin/space/bitmap.h
+++ b/fs/reiser4/plugin/space/bitmap.h
@@ -19,7 +19,7 @@ extern int reiser4_alloc_blocks_bitmap(reiser4_space_allocator *,
 				       reiser4_blocknr_hint *, int needed,
 				       reiser4_block_nr * start,
 				       reiser4_block_nr * len);
-extern void reiser4_check_blocks_bitmap(const reiser4_block_nr *,
+extern int reiser4_check_blocks_bitmap(const reiser4_block_nr *,
 					const reiser4_block_nr *, int);
 extern void reiser4_dealloc_blocks_bitmap(reiser4_space_allocator *,
 					  reiser4_block_nr,
diff --git a/fs/reiser4/plugin/space/space_allocator.h b/fs/reiser4/plugin/space/space_allocator.h
index 5bfa9a3..71bfd11 100644
--- a/fs/reiser4/plugin/space/space_allocator.h
+++ b/fs/reiser4/plugin/space/space_allocator.h
@@ -29,9 +29,9 @@ static inline void sa_dealloc_blocks (reiser4_space_allocator * al, reiser4_bloc
 	reiser4_dealloc_blocks_##allocator (al, start, len);								\
 }															\
 															\
-static inline void sa_check_blocks (const reiser4_block_nr * start, const reiser4_block_nr * end, int desired) 		\
+static inline int sa_check_blocks (const reiser4_block_nr * start, const reiser4_block_nr * end, int desired) 		\
 {															\
-	reiser4_check_blocks_##allocator (start, end, desired);							        \
+	return reiser4_check_blocks_##allocator (start, end, desired);							        \
 }															\
 															\
 static inline void sa_pre_commit_hook (void)										\
diff --git a/fs/reiser4/txnmgr.c b/fs/reiser4/txnmgr.c
index 8b305a4..fe7ea04 100644
--- a/fs/reiser4/txnmgr.c
+++ b/fs/reiser4/txnmgr.c
@@ -233,6 +233,7 @@ year old --- define all technical terms used.
 #include "vfs_ops.h"
 #include "inode.h"
 #include "flush.h"
+#include "discard.h"
 
 #include <asm/atomic.h>
 #include <linux/types.h>
@@ -407,6 +408,8 @@ static void atom_init(txn_atom * atom)
 	blocknr_set_init(&atom->delete_set);
 	blocknr_set_init(&atom->wandered_map);
 
+	discard_set_init(atom);
+
 	init_atom_fq_parts(atom);
 }
 
@@ -801,6 +804,8 @@ static void atom_free(txn_atom * atom)
 	blocknr_set_destroy(&atom->delete_set);
 	blocknr_set_destroy(&atom->wandered_map);
 
+	discard_set_destroy(atom);
+
 	assert("jmacd-16", atom_isclean(atom));
 
 	spin_unlock_atom(atom);
@@ -1086,6 +1091,19 @@ static int commit_current_atom(long *nr_submitted, txn_atom ** atom)
 	if (ret < 0)
 		reiser4_panic("zam-597", "write log failed (%ld)\n", ret);
 
+	/* XXX: perform discards. Can this be moved out of tmgr mutex?
+	   whether this needs to be placed before/after reiser4_invalidate_list() calls? */
+
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
@@ -3021,6 +3039,9 @@ static void capture_fuse_into(txn_atom * small, txn_atom * large)
 	blocknr_set_merge(&small->delete_set, &large->delete_set);
 	blocknr_set_merge(&small->wandered_map, &large->wandered_map);
 
+	/* Merge discard candidate sets. */
+	discard_set_merge(small, large);
+
 	/* Merge allocated/deleted file counts */
 	large->nr_objects_deleted += small->nr_objects_deleted;
 	large->nr_objects_created += small->nr_objects_created;
diff --git a/fs/reiser4/txnmgr.h b/fs/reiser4/txnmgr.h
index 034a3fe..86fbcac 100644
--- a/fs/reiser4/txnmgr.h
+++ b/fs/reiser4/txnmgr.h
@@ -252,6 +252,13 @@ struct txn_atom {
 	/* The atom's wandered_block mapping. */
 	struct list_head wandered_map;
 
+	/* XXX: The atom's discard candidate set. It collects block numbers of all inodes
+	   which were at least once deallocated during the transaction.
+	   At commit time, this list is traversed to sort extents, merge them, calculate
+	   the minimal set of erase units encompassing given extents. Then actually free
+	   (deallocated) erase units are submitted to discard. */
+	struct list_head discard_set;
+
 	/* The transaction's list of dirty captured nodes--per level.  Index
 	   by (level). dirty_nodes[0] is for znode-above-root */
 	struct list_head dirty_nodes[REAL_MAX_ZTREE_HEIGHT + 1];
diff --git a/fs/reiser4/znode.c b/fs/reiser4/znode.c
index 4ff9714..08eab3d 100644
--- a/fs/reiser4/znode.c
+++ b/fs/reiser4/znode.c
@@ -534,10 +534,11 @@ znode *zget(reiser4_tree * tree,
 
 		write_unlock_tree(tree);
 	}
-#if REISER4_DEBUG
-	if (!reiser4_blocknr_is_fake(blocknr) && *blocknr != 0)
-		reiser4_check_block(blocknr, 1);
-#endif
+
+	assert("intelfx-6",
+	       ergo(!reiser4_blocknr_is_fake(blocknr) && *blocknr != 0,
+	            reiser4_check_block(blocknr, 1)));
+
 	/* Check for invalid tree level, return -EIO */
 	if (unlikely(znode_get_level(result) != level)) {
 		warning("jmacd-504",
-- 
1.9.2

