From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv2 2/5] reiser4: discard support: initial implementation using extent lists.
Date: Tue,  6 May 2014 09:30:20 +0400
Message-ID: <1399354223-5334-3-git-send-email-intelfx100@gmail.com>
References: <1399354223-5334-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2U7oIP1WGCYPOP8bkS+MfEx/aoqPWsgfssIyrbcOti8=;
        b=H+tZYJ/ljJOJHnNfPMoWH/DAtpferQw+Fl9ZnglimHyv08Hl3G1Cw9clA0GNuuQ2mF
         G1G/ijSbiIkoS+DnIjfbGYYSolXxA3jcJf7Fhz1iyKdmAhRfEYxvhm0Qw4iRpfhzrbBU
         kxhZDI9BoamhWVrvz0E8+DMhXhpOrpSaxtarRvmj+9VuP5pipdOuSSA9pmM6KuJC43LI
         ah4mMzXVPaZon4OWopT/d/5YY425K/q++EPPMa7acPnXtVjixwy02wvFSES72J7ZTlzs
         6LaSI3uAElVsyuOT01lWnw3sb+DlAOwLJLzXiF8pl6E8X2SIcTNRffALRrsmBOUXjqNm
         MBiQ==
In-Reply-To: <1399354223-5334-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Implementation details:

- deallocated extents are logged to a linked list/queue
- if an extent being added is adjacent to the last one, they are merged
  to prevent another allocation
- at commit time, the log is further sorted and extents are merged
- extents are further processed to align discard requests to erase unit
  boundaries, extending them to neighbour blocks if needed
- each erase unit is checked to be deallocated and submitted to discard
- processing stops at first failure (this does not fail atom commit)

For now (shortcomings):

- discard functionality is enabled unconditionally
- kernel-reported erase unit granularity and alignment offset are used
  as-is without any override (it may make sense in order to mitigate
  bogus values sometimes reported by kernel/hardware)
- processing each erase unit makes its own bitmap query to check
  allocation status; this is suboptimal when granularity is less than
  the block size (should not matter in practice as granularity almost
  never is that small)

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/Makefile              |   1 +
 fs/reiser4/block_alloc.c         |  22 ++
 fs/reiser4/dformat.h             |   2 +
 fs/reiser4/discard.c             | 439 +++++++++++++++++++++++++++++++++++++++
 fs/reiser4/discard.h             |  38 ++++
 fs/reiser4/forward.h             |   1 +
 fs/reiser4/plugin/space/bitmap.c |   3 +-
 fs/reiser4/txnmgr.c              |  19 ++
 fs/reiser4/txnmgr.h              |   5 +
 9 files changed, 529 insertions(+), 1 deletion(-)
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
index cec0e6b..b6f90a8 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -9,6 +9,7 @@ reiser4/README */
 #include "block_alloc.h"
 #include "tree.h"
 #include "super.h"
+#include "discard.h"
 
 #include <linux/types.h>	/* for __u??  */
 #include <linux/fs.h>		/* for struct super_block  */
@@ -969,6 +970,7 @@ reiser4_dealloc_blocks(const reiser4_block_nr * start,
 	int ret;
 	reiser4_context *ctx;
 	reiser4_super_info_data *sbinfo;
+	discard_set_entry *dsep = NULL;
 
 	ctx = get_current_context();
 	sbinfo = get_super_private(ctx->super);
@@ -983,6 +985,26 @@ reiser4_dealloc_blocks(const reiser4_block_nr * start,
 		spin_unlock_reiser4_super(sbinfo);
 	}
 
+	/* store deallocated extent in the discard "candidate" set */
+	do {
+		atom = get_current_atom_locked();
+		assert("intelfx-1", atom != NULL);
+
+		ret = discard_set_add_extent(atom, &dsep, start, len);
+
+		if (ret == -ENOMEM) {
+			warning("intelfx-2", "could not add extent to discard set (%d)",
+			        ret);
+			break;
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
index 0000000..6f8bbfa
--- /dev/null
+++ b/fs/reiser4/discard.c
@@ -0,0 +1,439 @@
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
+ * - we won't be able to merge small adjacent ranges forming a range long
+ *   enough to be discarded.
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
+	entry = (discard_set_entry *)kmalloc(sizeof(discard_set_entry),
+	                                     reiser4_ctx_gfp_mask_get());
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
+		reiser4_log("discard",
+		            "Merging extents: [%llu; %llu) and [%llu; %llu)",
+		            to->start, to->end, start, end);
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
+static int discard_set_entry_compare(void* priv UNUSED_ARG,
+                                     struct list_head *a, struct list_head *b)
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
+static int __discard_extent(struct block_device *bdev, sector_t start,
+                            sector_t len)
+{
+	reiser4_log("discard", "DISCARDING: [%llu; %llu)",
+	            (unsigned long long)start,
+	            (unsigned long long)(start + len));
+
+	return blkdev_issue_discard(bdev, start, len, reiser4_ctx_gfp_mask_get(),
+	                            0);
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
+	reiser4_log("discard", "Extent {blk}: [%llu; %llu)",
+	            (unsigned long long)e->start,
+	            (unsigned long long)e->end);
+
+	/* convert extent to sectors */
+	extent_start_sec = e->start * sec_per_blk;
+	extent_end_sec = e->end * sec_per_blk;
+
+	reiser4_log("discard", "Extent {sec}: [%llu; %llu)",
+	            (unsigned long long)extent_start_sec,
+	            (unsigned long long)extent_end_sec);
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
+		reiser4_log("discard", "Erase unit %d {sec}: [%llu; %llu)",
+		            erase_unit_counter,
+		            (unsigned long long)unit_sec,
+		            (unsigned long long)(unit_sec + granularity));
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
+			reiser4_log("discard",
+			            "Erase unit %d: request updated: [%llu; %llu)",
+			            erase_unit_counter,
+			            (unsigned long long)request_start_sec,
+			            (unsigned long long)(request_start_sec +
+			                                 request_len_sec));
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
+	reiser4_log("discard", "Extent done");
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
+	reiser4_log("discard", "Discarding: %d extents",
+	            extent_count);
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
+	list_sort(NULL, &discard_set, discard_set_entry_compare);
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
+		while (!discard_set_entry_merge_entry(entry, next_entry)) {
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
index 5bfa71b..19a234b 100644
--- a/fs/reiser4/plugin/space/bitmap.c
+++ b/fs/reiser4/plugin/space/bitmap.c
@@ -1268,7 +1268,8 @@ int reiser4_check_blocks_bitmap(const reiser4_block_nr * start,
 		end = *start + *len - 1;
 	} else {
 		/* end is used as temporary len here */
-		check_block_range(start, &(end = 1));
+		end = 1;
+		check_block_range(start, &end);
 		end = *start;
 	}
 
diff --git a/fs/reiser4/txnmgr.c b/fs/reiser4/txnmgr.c
index 8b305a4..2c04be6 100644
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
@@ -1086,6 +1091,17 @@ static int commit_current_atom(long *nr_submitted, txn_atom ** atom)
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
@@ -3021,6 +3037,9 @@ static void capture_fuse_into(txn_atom * small, txn_atom * large)
 	blocknr_set_merge(&small->delete_set, &large->delete_set);
 	blocknr_set_merge(&small->wandered_map, &large->wandered_map);
 
+	/* Merge discard candidate sets. */
+	discard_set_merge(small, large);
+
 	/* Merge allocated/deleted file counts */
 	large->nr_objects_deleted += small->nr_objects_deleted;
 	large->nr_objects_created += small->nr_objects_created;
diff --git a/fs/reiser4/txnmgr.h b/fs/reiser4/txnmgr.h
index 034a3fe..7e06826 100644
--- a/fs/reiser4/txnmgr.h
+++ b/fs/reiser4/txnmgr.h
@@ -252,6 +252,11 @@ struct txn_atom {
 	/* The atom's wandered_block mapping. */
 	struct list_head wandered_map;
 
+	/* The atom's discard candidate set. It collects all extents which were
+	   at least once deallocated during the transaction. See discard.c for
+	   details. */
+	struct list_head discard_set;
+
 	/* The transaction's list of dirty captured nodes--per level.  Index
 	   by (level). dirty_nodes[0] is for znode-above-root */
 	struct list_head dirty_nodes[REAL_MAX_ZTREE_HEIGHT + 1];
-- 
1.9.2

