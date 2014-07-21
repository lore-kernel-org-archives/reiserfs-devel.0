From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv2 3/3] reiser4: discard support: perform discard before all deallocations.
Date: Mon, 21 Jul 2014 22:19:31 +0400
Message-ID: <1405966771-12575-4-git-send-email-intelfx100@gmail.com>
References: <1405966771-12575-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bQGJXlVtfyYLjgdnxaAKZuqLRShTzbiXvRwZ5RRZn3U=;
        b=ZxeYUVm4bzRwmqOCW9LIG70ogGChM177s85bu6aklgY2M2gB88U0MlTRCgBK+Fc5mI
         Kxlx817UUfp8JhF2saYe/CRJzCWcNf3Z5yYXoB0mCTpZU9JUu6e4w2NGvd6nDayw/YCg
         BGBs7Nf8x7LfiPhzXYOVriiMCRLMnnU0SkyQZQuoZJT5o3JeTeMpG6CuuNsLJNwib4FM
         msxMU3dyOfbOGd1698UItVvv5LXqnSQsgwhN+/nqD0vq2GAmLrhS7A14yxNlAbNI9PHc
         tK6deaF2PPbL5kLuTXLQVlS07UVA+JjOAmuEW3SgH2Rud4SnJqI44lktDCcaAIJPD0cz
         TEOw==
In-Reply-To: <1405966771-12575-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

When discard is enabled, immediate deallocations are made deferred,
and thus discard procedure takes place right before any deallocation
is made. This allows to avoid costly bitmap checks at discard time.

Note that this commit itself is incomplete and needs a modified
discard_extent() function which does not check discarded extents
in the bitmap.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/block_alloc.c | 31 ++++++---------------
 fs/reiser4/discard.c     | 72 ++++++++++++++++++++++++++++++++++++------------
 fs/reiser4/discard.h     | 17 ++++++++++--
 fs/reiser4/txnmgr.c      | 24 ----------------
 fs/reiser4/txnmgr.h      | 13 ++-------
 5 files changed, 79 insertions(+), 78 deletions(-)

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 4ce2a16..98080a1 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -1007,7 +1007,8 @@ reiser4_dealloc_blocks(const reiser4_block_nr * start,
 		spin_unlock_reiser4_super(sbinfo);
 	}
 
-	if (flags & BA_DEFER) {
+	if ((flags & BA_DEFER) ||
+	    reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
 		/* store deleted block numbers in the atom's deferred delete set
 		   for further actual deletion */
 		do {
@@ -1028,25 +1029,6 @@ reiser4_dealloc_blocks(const reiser4_block_nr * start,
 		spin_unlock_atom(atom);
 
 	} else {
-		/* store deleted block numbers in the atom's immediate delete set
-		   for further processing */
-		do {
-			atom = get_current_atom_locked();
-			assert("intelfx-51", atom != NULL);
-
-			ret = atom_dset_immediate_add_extent(atom, &new_entry, start, len);
-
-			if (ret == -ENOMEM)
-				return ret;
-
-			/* This loop might spin at most two times */
-		} while (ret == -E_REPEAT);
-
-		assert("intelfx-52", ret == 0);
-		assert("intelfx-53", atom != NULL);
-
-		spin_unlock_atom(atom);
-
 		assert("zam-425", get_current_super_private() != NULL);
 		sa_dealloc_blocks(reiser4_get_space_allocator(ctx->super),
 				  *start, *len);
@@ -1150,22 +1132,27 @@ void reiser4_post_commit_hook(void)
 
 void reiser4_post_write_back_hook(void)
 {
+	struct list_head discarded_set;
 	txn_atom *atom;
 	int ret;
 
 	/* process and issue discard requests */
+	blocknr_list_init (&discarded_set);
 	do {
 		atom = get_current_atom_locked();
-		ret = discard_atom(*atom);
+		ret = discard_atom(atom, &discarded_set);
 	} while (ret == -E_REPEAT);
 
 	if (ret) {
 		warning("intelfx-8", "discard atom failed (%ld)", ret);
 	}
 
+	atom = get_current_atom_locked();
+	discard_atom_post(atom, &discarded_set);
+
 	/* do the block deallocation which was deferred
 	   until commit is done */
-	atom_dset_deferred_apply(atom, apply_dset, NULL, 0);
+	atom_dset_deferred_apply(atom, apply_dset, NULL, 1);
 
 	assert("zam-504", get_current_super_private() != NULL);
 	sa_post_write_back_hook();
diff --git a/fs/reiser4/discard.c b/fs/reiser4/discard.c
index 3c8ee89..8442619 100644
--- a/fs/reiser4/discard.c
+++ b/fs/reiser4/discard.c
@@ -33,24 +33,43 @@
  * MECHANISM:
  *
  * During the transaction deallocated extents are recorded in atom's delete
- * sets. There are two delete sets, because data in one of them (delete_set) is
- * also used by other parts of reiser4. The second delete set (aux_delete_set)
- * complements the first one and is maintained only when discard is enabled.
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
  *
- * Together these sets constitute "the discard set" -- blocks that have to be
- * considered for discarding. On atom commit we will generate a minimal
- * superset of the discard set, comprised of whole erase units.
+ * When discard is enabled, all immediate deallocations become deferred. This
+ * is OK because journal's allocations happen after reiser4_pre_commit_hook()
+ * where the on-disk space allocation records are updated. So, in this mode
+ * the atom's delete set becomes "the discard set" -- list of blocks that have
+ * to be considered for discarding.
+ *
+ * On atom commit we will generate a minimal superset of the discard set,
+ * comprised of whole erase units.
+ *
+ * Discarding is performed before completing deferred deallocations, hence all
+ * extents in the discard set are still marked as allocated and cannot contain
+ * any data. Thus we can avoid any checks for blocks directly present in the
+ * discard set.
+ *
+ * However, we pad each extent from both sides to erase unit boundaries, and
+ * these paddings still have to be checked if they fall outside of initial
+ * extent (may not happen if block size > erase unit size).
  *
  * So, at commit time the following actions take place:
  * - delete sets are merged to form the discard set;
  * - elements of the discard set are sorted;
  * - the discard set is iterated, joining any adjacent extents;
- * - each of resulting extents is "covered" by erase units:
- *   - its start is rounded down to the closest erase unit boundary;
- *   - starting from this block, extents of erase unit length are created
- *     until the original extent is fully covered;
- * - the calculated erase units are checked to be fully deallocated;
- * - remaining (valid) erase units are then passed to blkdev_issue_discard().
+ * - <TODO>
  */
 
 #include "discard.h"
@@ -167,7 +186,7 @@ static int discard_extent(txn_atom *atom UNUSED_ARG,
 	return 0;
 }
 
-int discard_atom(txn_atom *atom)
+int discard_atom(txn_atom *atom, struct list_head *processed_set)
 {
 	int ret;
 	struct list_head discard_set;
@@ -178,24 +197,27 @@ int discard_atom(txn_atom *atom)
 	}
 
 	assert("intelfx-28", atom != NULL);
+	assert("intelfx-59", processed_entries != NULL);
 
-	if (list_empty(&atom->discard.delete_set) &&
-	    list_empty(&atom->discard.aux_delete_set)) {
-		spin_unlock_atom(atom);
+	if (list_empty(&atom->discard.delete_set)) {
+		/* Nothing left to discard. */
 		return 0;
 	}
 
 	/* Take the delete sets from the atom in order to release atom spinlock. */
 	blocknr_list_init(&discard_set);
 	blocknr_list_merge(&atom->discard.delete_set, &discard_set);
-	blocknr_list_merge(&atom->discard.aux_delete_set, &discard_set);
 	spin_unlock_atom(atom);
 
 	/* Sort the discard list, joining adjacent and overlapping extents. */
 	blocknr_list_sort_and_join(&discard_set);
 
 	/* Perform actual dirty work. */
-	ret = blocknr_list_iterator(NULL, &discard_set, &discard_extent, NULL, 1);
+	ret = blocknr_list_iterator(NULL, &discard_set, &discard_extent, NULL, 0);
+
+	/* Add processed extents to the temporary list. */
+	blocknr_list_merge(&discard_set, processed_set);
+
 	if (ret != 0) {
 		return ret;
 	}
@@ -204,6 +226,20 @@ int discard_atom(txn_atom *atom)
 	return -E_REPEAT;
 }
 
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
 /* Make Linus happy.
    Local variables:
    c-indentation-style: "K&R"
diff --git a/fs/reiser4/discard.h b/fs/reiser4/discard.h
index ea46334..5f0d0d8 100644
--- a/fs/reiser4/discard.h
+++ b/fs/reiser4/discard.h
@@ -11,11 +11,22 @@
 
 /**
  * Issue discard requests for all block extents recorded in @atom's delete sets,
- * if discard is enabled. In this case the delete sets are cleared.
+ * if discard is enabled. The extents processed are removed from the @atom's
+ * delete sets and stored in @processed_set.
  *
- * @atom should be locked on entry and is unlocked on exit.
+ * @atom must be locked on entry and is unlocked on exit.
+ * @processed_set must be initialized with blocknr_list_init().
  */
-extern int discard_atom(txn_atom *atom);
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
 
 /* __FS_REISER4_DISCARD_H__ */
 #endif
diff --git a/fs/reiser4/txnmgr.c b/fs/reiser4/txnmgr.c
index 317bc4f..d73ecb9 100644
--- a/fs/reiser4/txnmgr.c
+++ b/fs/reiser4/txnmgr.c
@@ -3081,7 +3081,6 @@ void atom_dset_init(txn_atom *atom)
 {
 	if (reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
 		blocknr_list_init(&atom->discard.delete_set);
-		blocknr_list_init(&atom->discard.aux_delete_set);
 	} else {
 		blocknr_set_init(&atom->nodiscard.delete_set);
 	}
@@ -3091,7 +3090,6 @@ void atom_dset_destroy(txn_atom *atom)
 {
 	if (reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
 		blocknr_list_destroy(&atom->discard.delete_set);
-		blocknr_list_destroy(&atom->discard.aux_delete_set);
 	} else {
 		blocknr_set_destroy(&atom->nodiscard.delete_set);
 	}
@@ -3101,7 +3099,6 @@ void atom_dset_merge(txn_atom *from, txn_atom *to)
 {
 	if (reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
 		blocknr_list_merge(&from->discard.delete_set, &to->discard.delete_set);
-		blocknr_list_merge(&from->discard.aux_delete_set, &to->discard.aux_delete_set);
 	} else {
 		blocknr_set_merge(&from->nodiscard.delete_set, &to->nodiscard.delete_set);
 	}
@@ -3155,27 +3152,6 @@ extern int atom_dset_deferred_add_extent(txn_atom *atom,
 	return ret;
 }
 
-extern int atom_dset_immediate_add_extent(txn_atom *atom,
-                                          void **new_entry,
-                                          const reiser4_block_nr *start,
-                                          const reiser4_block_nr *len)
-{
-	int ret;
-
-	if (reiser4_is_set(reiser4_get_current_sb(), REISER4_DISCARD)) {
-		ret = blocknr_list_add_extent(atom,
-		                             &atom->discard.aux_delete_set,
-		                             (blocknr_list_entry**)new_entry,
-		                             start,
-		                             len);
-	} else {
-		/* no-op */
-		ret = 0;
-	}
-
-	return ret;
-}
-
 /*
  * Local variables:
  * c-indentation-style: "K&R"
diff --git a/fs/reiser4/txnmgr.h b/fs/reiser4/txnmgr.h
index 02757a9..05990d8 100644
--- a/fs/reiser4/txnmgr.h
+++ b/fs/reiser4/txnmgr.h
@@ -259,10 +259,6 @@ struct txn_atom {
 			/* The atom's delete set. It collects block numbers which were
 			   deallocated with BA_DEFER, i. e. of ordinary nodes. */
 			struct list_head delete_set;
-
-			/* The atom's auxiliary delete set. It collects block numbers
-			   which were deallocated without BA_DEFER, i. e. immediately. */
-			struct list_head aux_delete_set;
 		} discard;
 	};
 
@@ -527,9 +523,8 @@ extern int blocknr_list_iterator(txn_atom *atom,
 
 /* These are wrappers for accessing and modifying atom's delete lists,
    depending on whether discard is enabled or not.
-   If it is enabled. both deferred and immediate delete lists are maintained,
-   and (less memory efficient) blocknr_lists are used for storage. Otherwise, only
-   deferred delete list is maintained and blocknr_set is used for its storage. */
+   If it is enabled, (less memory efficient) blocknr_list is used for delete
+   list storage. Otherwise, blocknr_set is used for this purpose. */
 extern void atom_dset_init(txn_atom *atom);
 extern void atom_dset_destroy(txn_atom *atom);
 extern void atom_dset_merge(txn_atom *from, txn_atom *to);
@@ -541,10 +536,6 @@ extern int atom_dset_deferred_add_extent(txn_atom *atom,
                                          void **new_entry,
                                          const reiser4_block_nr *start,
                                          const reiser4_block_nr *len);
-extern int atom_dset_immediate_add_extent(txn_atom *atom,
-                                          void **new_entry,
-                                          const reiser4_block_nr *start,
-                                          const reiser4_block_nr *len);
 
 /* flush code takes care about how to fuse flush queues */
 extern void flush_init_atom(txn_atom * atom);
-- 
2.0.2

