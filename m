From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 2/2] reiser4: add different transaction models
Date: Mon, 05 May 2014 18:13:48 +0200
Message-ID: <5367B8BC.1040208@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080708020803080109080004"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=oF9bV9J0mQU7rR6IabVylMkzTLwAr6cCGA5cjOC2U/g=;
        b=LxXoLHImJn0a8rzdWv+CZFr6PkEn2UaQa/ZHWjit/rCkG38q5n6rYN+qXRswNd0UAm
         QGLMqnvfkyi+WmUuWcJelBDmomT+b+wrEQMfiZUIvOwso9D0FIQQp/LHDAHkGqafhieI
         En7cuHfuII7DkpcDAcdugrzSWcGdToqESz/27gvJ3Q7liKs6vwFKBRXTZMiNVFpQiN4d
         zvFokFkdQrrz8kBTNktq23dUWx2XOECn1X+y0kXJhaaRx+nm/3kvvF/u4Sb1v4lJ0TOI
         RROPcWkEnoeFAF29n+GfdZxW/ReVCBu3E2s1zB7tzVDGRwI3Az54SwGJgr24oE/5iWQc
         aKmg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080708020803080109080004
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------080708020803080109080004
Content-Type: text/x-patch;
 name="02-reiser4-different-transaction-models.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="02-reiser4-different-transaction-models.patch"

. Introduce a layer/interface REISER4_TXMOD_PLUGIN_TYPE called at
  flush time to perform high-level block allocation in various
  contexts;
. Add 2 TXMOD plugins (allocators):
  1) JOURNAL_TXMOD_ID, which implements classic Journalling
     transaction model;
  2) WA_TXMOD_ID, which implements classic Write-Anywhere (COW)
     transaction model;
. Add the single hardcoded allocation introduced by Hans and Josh as
  a (default) HYBRID_TXMOD_ID plugin;
. Add new mount options to specify the transaction models.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/Makefile                       |    1 
 fs/reiser4/block_alloc.c                  |   23 
 fs/reiser4/flush.c                        |  416 +---------
 fs/reiser4/init_super.c                   |   53 +
 fs/reiser4/plugin/item/extent_flush_ops.c |  388 ---------
 fs/reiser4/plugin/plugin.c                |    9 
 fs/reiser4/plugin/plugin.h                |   59 +
 fs/reiser4/plugin/plugin_header.h         |    1 
 fs/reiser4/plugin/txmod.c                 | 1244 ++++++++++++++++++++++++++++++
 fs/reiser4/super.h                        |    3 
 fs/reiser4/super_ops.c                    |    2 
 fs/reiser4/txnmgr.c                       |   80 -
 12 files changed, 1467 insertions(+), 812 deletions(-)

--- linux-3.13.orig/fs/reiser4/flush.c
+++ linux-3.13/fs/reiser4/flush.c
@@ -360,7 +360,7 @@
 
    Otherwise, there are two contexts in which we make a decision to relocate:
 
-   1. The REVERSE PARENT-FIRST context: Implemented in reverse_relocate_test().
+   1. The REVERSE PARENT-FIRST context: Implemented in reverse_allocate
    During the initial stages of flush, after scan-right completes, we want to
    ask the question: should we relocate this leaf node and thus dirty the parent
    node. Then if the node is a leftmost child its parent is its own parent-first
@@ -421,19 +421,13 @@ static int squeeze_right_non_twig(znode
 static int shift_one_internal_unit(znode * left, znode * right);
 
 /* Flush reverse parent-first relocation routines. */
-static int reverse_relocate_if_close_enough(const reiser4_block_nr * pblk,
-					    const reiser4_block_nr * nblk);
-static int reverse_relocate_test(jnode * node, const coord_t *parent_coord,
-				 flush_pos_t *pos);
-static int reverse_relocate_check_dirty_parent(jnode * node,
-					       const coord_t *parent_coord,
-					       flush_pos_t *pos);
+static int reverse_allocate_parent(jnode * node,
+				   const coord_t *parent_coord,
+				   flush_pos_t *pos);
 
 /* Flush allocate write-queueing functions: */
 static int allocate_znode(znode * node, const coord_t *parent_coord,
 			  flush_pos_t *pos);
-static int allocate_znode_update(znode * node, const coord_t *parent_coord,
-				 flush_pos_t *pos);
 static int lock_parent_and_allocate_znode(znode *, flush_pos_t *);
 
 /* Flush helper functions: */
@@ -471,8 +465,7 @@ assert("nikita-3435",							\
 /* This flush_cnt variable is used to track the number of concurrent flush
    operations, useful for debugging. It is initialized in txnmgr.c out of
    laziness (because flush has no static initializer function...) */
-ON_DEBUG(atomic_t flush_cnt;
-    )
+ON_DEBUG(atomic_t flush_cnt;)
 
 /* check fs backing device for write congestion */
 static int check_write_congestion(void)
@@ -596,12 +589,18 @@ done:
 	return ret;
 }
 
+static txmod_plugin *get_txmod_plugin(void)
+{
+	struct super_block *sb = reiser4_get_current_sb();
+	return txmod_plugin_by_id(get_super_private(sb)->txmod);
+}
+
 /* TODO LIST (no particular order): */
 /* I have labelled most of the legitimate FIXME comments in this file with
    letters to indicate which issue they relate to. There are a few miscellaneous
    FIXMEs with specific names mentioned instead that need to be
    inspected/resolved. */
-/* B. There is an issue described in reverse_relocate_test having to do with an
+/* B. There is an issue described in reverse_allocate having to do with an
    imprecise is_preceder? check having to do with partially-dirty extents. The
    code that sets preceder hints and computes the preceder is basically
    untested. Careful testing needs to be done that preceder calculations are
@@ -791,7 +790,7 @@ jnode_flush(jnode * node, long nr_to_wri
 	   info is set.
 
 	   This seems lazy, but it makes the initial calls to
-	   reverse_relocate_test (which ask "is it the pos->point the leftmost
+	   reverse_allocate (which ask "is it the pos->point the leftmost
 	   child of its parent") much easier because we know the first child
 	   already.  Nothing is broken by this, but the reasoning is subtle.
 	   Holding an extra reference on a jnode during flush can cause us to
@@ -1107,108 +1106,30 @@ flush_current_atom(int flags, long nr_to
 	return ret;
 }
 
-/* REVERSE PARENT-FIRST RELOCATION POLICIES */
-
-/* This implements the is-it-close-enough-to-its-preceder? test for relocation
-   in the reverse parent-first relocate context. Here all we know is the
-   preceder and the block number. Since we are going in reverse, the preceder
-   may still be relocated as well, so we can't ask the block allocator "is there
-   a closer block available to relocate?" here. In the _forward_ parent-first
-   relocate context (not here) we actually call the block allocator to try and
-   find a closer location. */
-static int
-reverse_relocate_if_close_enough(const reiser4_block_nr * pblk,
-				 const reiser4_block_nr * nblk)
-{
-	reiser4_block_nr dist;
-
-	assert("jmacd-7710", *pblk != 0 && *nblk != 0);
-	assert("jmacd-7711", !reiser4_blocknr_is_fake(pblk));
-	assert("jmacd-7712", !reiser4_blocknr_is_fake(nblk));
-
-	/* Distance is the absolute value. */
-	dist = (*pblk > *nblk) ? (*pblk - *nblk) : (*nblk - *pblk);
-
-	/* If the block is less than FLUSH_RELOCATE_DISTANCE blocks away from
-	   its preceder block, do not relocate. */
-	if (dist <= get_current_super_private()->flush.relocate_distance)
-		return 0;
-
-	return 1;
-}
-
-/* This function is a predicate that tests for relocation. Always called in the
-   reverse-parent-first context, when we are asking whether the current node
-   should be relocated in order to expand the flush by dirtying the parent level
-   (and thus proceeding to flush that level). When traversing in the forward
-   parent-first direction (not here), relocation decisions are handled in two
-   places: allocate_znode() and extent_needs_allocation(). */
-static int
-reverse_relocate_test(jnode * node, const coord_t *parent_coord,
-		      flush_pos_t *pos)
-{
-	reiser4_block_nr pblk = 0;
-	reiser4_block_nr nblk = 0;
-
-	assert("jmacd-8989", !jnode_is_root(node));
-
-	/*
-	 * This function is called only from the
-	 * reverse_relocate_check_dirty_parent() and only if the parent
-	 * node is clean. This implies that the parent has the real (i.e., not
-	 * fake) block number, and, so does the child, because otherwise the
-	 * parent would be dirty.
-	 */
-
-	/* New nodes are treated as if they are being relocated. */
-	if (JF_ISSET(node, JNODE_CREATED) ||
-	    (pos->leaf_relocate && jnode_get_level(node) == LEAF_LEVEL))
-		return 1;
-
-	/* Find the preceder. FIXME(B): When the child is an unformatted,
-	   previously existing node, the coord may be leftmost even though the
-	   child is not the parent-first preceder of the parent. If the first
-	   dirty node appears somewhere in the middle of the first extent unit,
-	   this preceder calculation is wrong.
-	   Needs more logic in here. */
-	if (coord_is_leftmost_unit(parent_coord)) {
-		pblk = *znode_get_block(parent_coord->node);
-	} else {
-		pblk = pos->preceder.blk;
-	}
-	check_preceder(pblk);
-
-	/* If (pblk == 0) then the preceder isn't allocated or isn't known:
-	   relocate. */
-	if (pblk == 0)
-		return 1;
-
-	nblk = *jnode_get_block(node);
-
-	if (reiser4_blocknr_is_fake(&nblk))
-		/* child is unallocated, mark parent dirty */
-		return 1;
-
-	return reverse_relocate_if_close_enough(&pblk, &nblk);
-}
-
-/* This function calls reverse_relocate_test to make a reverse-parent-first
-   relocation decision and then, if yes, it marks the parent dirty. */
-static int
-reverse_relocate_check_dirty_parent(jnode * node, const coord_t *parent_coord,
-				    flush_pos_t *pos)
+/**
+ * This function calls txmod->reverse_alloc_formatted() to make a
+ * reverse-parent-first relocation decision and then, if yes, it marks
+ * the parent dirty.
+ */
+static int reverse_allocate_parent(jnode * node,
+				   const coord_t *parent_coord,
+				   flush_pos_t *pos)
 {
 	int ret;
 
 	if (!JF_ISSET(ZJNODE(parent_coord->node), JNODE_DIRTY)) {
+		txmod_plugin *txmod_plug = get_txmod_plugin();
 
-		ret = reverse_relocate_test(node, parent_coord, pos);
+		if (!txmod_plug->reverse_alloc_formatted)
+			return 0;
+		ret = txmod_plug->reverse_alloc_formatted(node,
+							  parent_coord, pos);
 		if (ret < 0)
 			return ret;
-
-		/* FIXME-ZAM
-		  if parent is already relocated - we do not want to grab space,
-		  right? */
+		/*
+		 * FIXME-ZAM: if parent is already relocated -
+		 * we do not want to grab space, right?
+		 */
 		if (ret == 1) {
 			int grabbed;
 
@@ -1224,7 +1145,6 @@ reverse_relocate_check_dirty_parent(jnod
 			grabbed2free_mark(grabbed);
 		}
 	}
-
 	return 0;
 }
 
@@ -1277,9 +1197,7 @@ static int alloc_pos_and_ancestors(flush
 		/* The parent may not be dirty, in which case we should decide
 		   whether to relocate the child now. If decision is made to
 		   relocate the child, the parent is marked dirty. */
-		ret =
-		    reverse_relocate_check_dirty_parent(pos->child, &pos->coord,
-							pos);
+		ret = reverse_allocate_parent(pos->child, &pos->coord, pos);
 		if (ret)
 			goto exit;
 
@@ -1310,11 +1228,9 @@ static int alloc_pos_and_ancestors(flush
 			if (ret)
 				goto exit;
 
-			ret =
-			    reverse_relocate_check_dirty_parent(ZJNODE
-								(pos->lock.
-								 node), &pcoord,
-								pos);
+			ret = reverse_allocate_parent(ZJNODE(pos->lock.node),
+						      &pcoord,
+						      pos);
 			if (ret)
 				goto exit;
 
@@ -1376,9 +1292,8 @@ static int alloc_one_ancestor(const coor
 			goto exit;
 		}
 
-		ret =
-		    reverse_relocate_check_dirty_parent(ZJNODE(coord->node),
-							&acoord, pos);
+		ret = reverse_allocate_parent(ZJNODE(coord->node),
+					      &acoord, pos);
 		if (ret != 0)
 			goto exit;
 
@@ -1430,7 +1345,7 @@ static int set_preceder(const coord_t *c
 	init_load_count(&left_load);
 
 	/* FIXME(B): Same FIXME as in "Find the preceder" in
-	   reverse_relocate_test. coord_is_leftmost_unit is not the right test
+	   reverse_allocate. coord_is_leftmost_unit is not the right test
 	   if the unformatted child is in the middle of the first extent unit.*/
 	if (!coord_is_leftmost_unit(&coord)) {
 		coord_prev_unit(&coord);
@@ -1527,6 +1442,7 @@ static int squeeze_right_twig(znode * le
 	coord_t coord;		/* used to iterate over items */
 	reiser4_key stop_key;
 	reiser4_tree *tree;
+	txmod_plugin *txmod_plug = get_txmod_plugin();
 
 	assert("jmacd-2008", !node_is_empty(right));
 	coord_init_first_unit(&coord, right);
@@ -1540,7 +1456,9 @@ static int squeeze_right_twig(znode * le
 
 		/* stop_key is used to find what was copied and what to cut */
 		stop_key = *reiser4_min_key();
-		ret = squalloc_extent(left, &coord, pos, &stop_key);
+		ret = txmod_plug->squeeze_alloc_unformatted(left,
+							    &coord, pos,
+							    &stop_key);
 		if (ret != SQUEEZE_CONTINUE) {
 			ON_DEBUG(kfree(vp));
 			break;
@@ -2132,6 +2050,7 @@ static int squalloc_extent_should_stop(f
 static int handle_pos_on_twig(flush_pos_t *pos)
 {
 	int ret;
+	txmod_plugin *txmod_plug = get_txmod_plugin();
 
 	assert("zam-844", pos->state == POS_ON_EPOINT);
 	assert("zam-843", item_is_extent(&pos->coord));
@@ -2151,7 +2070,7 @@ static int handle_pos_on_twig(flush_pos_
 
 	while (pos_valid(pos) && coord_is_existing_unit(&pos->coord)
 	       && item_is_extent(&pos->coord)) {
-		ret = reiser4_alloc_extent(pos);
+		ret = txmod_plug->forward_alloc_unformatted(pos);
 		if (ret)
 			break;
 		coord_next_unit(&pos->coord);
@@ -2255,9 +2174,7 @@ became_dirty:
 
 		/* check clean twig for possible relocation */
 		if (!znode_check_flushprepped(right_lock.node)) {
-			ret =
-			    reverse_relocate_check_dirty_parent(child,
-								&at_right, pos);
+			ret = reverse_allocate_parent(child, &at_right, pos);
 			if (ret)
 				goto out;
 			if (JF_ISSET(ZJNODE(right_lock.node), JNODE_DIRTY))
@@ -2534,7 +2451,8 @@ static int squeeze_right_non_twig(znode
 		/* update delimiting keys of nodes which participated in
 		   shift. FIXME: it would be better to have this in shift
 		   node's operation. But it can not be done there. Nobody
-		   remembers why, though */
+		   remembers why, though
+		*/
 		tree = znode_get_tree(left);
 		write_lock_dk(tree);
 		update_znode_dkeys(left, right);
@@ -2675,250 +2593,20 @@ static int shift_one_internal_unit(znode
 	return moved ? SUBTREE_MOVED : SQUEEZE_TARGET_FULL;
 }
 
-/* Make the final relocate/wander decision during forward parent-first squalloc
-   for a znode. For unformatted nodes this is done in
-   plugin/item/extent.c:extent_needs_allocation(). */
-static int
-allocate_znode_loaded(znode * node,
-		      const coord_t *parent_coord, flush_pos_t *pos)
-{
-	int ret;
-	reiser4_super_info_data *sbinfo = get_current_super_private();
-	/* FIXME(D): We have the node write-locked and should have checked for !
-	   allocated() somewhere before reaching this point, but there can be a
-	   race, so this assertion is bogus. */
-	assert("jmacd-7987", !jnode_check_flushprepped(ZJNODE(node)));
-	assert("jmacd-7988", znode_is_write_locked(node));
-	assert("jmacd-7989", coord_is_invalid(parent_coord)
-	       || znode_is_write_locked(parent_coord->node));
-
-	if (ZF_ISSET(node, JNODE_REPACK) || ZF_ISSET(node, JNODE_CREATED) ||
-	    znode_is_root(node) ||
-	    /* We have enough nodes to relocate no matter what. */
-	    (pos->leaf_relocate != 0 && znode_get_level(node) == LEAF_LEVEL)) {
-		/* No need to decide with new nodes, they are treated the same
-		   as relocate. If the root node is dirty, relocate. */
-		if (pos->preceder.blk == 0) {
-			/* preceder is unknown and we have decided to relocate
-			   node -- using of default value for search start is
-			   better than search from block #0. */
-			get_blocknr_hint_default(&pos->preceder.blk);
-			check_preceder(pos->preceder.blk);
-		}
-
-		goto best_reloc;
-
-	} else if (pos->preceder.blk == 0) {
-		/* If we don't know the preceder, leave it where it is. */
-		jnode_make_wander(ZJNODE(node));
-	} else {
-		/* Make a decision based on block distance. */
-		reiser4_block_nr dist;
-		reiser4_block_nr nblk = *znode_get_block(node);
-
-		assert("jmacd-6172", !reiser4_blocknr_is_fake(&nblk));
-		assert("jmacd-6173", !reiser4_blocknr_is_fake(&pos->preceder.blk));
-		assert("jmacd-6174", pos->preceder.blk != 0);
-
-		if (pos->preceder.blk == nblk - 1) {
-			/* Ideal. */
-			jnode_make_wander(ZJNODE(node));
-		} else {
-
-			dist =
-			    (nblk <
-			     pos->preceder.blk) ? (pos->preceder.blk -
-						   nblk) : (nblk -
-							    pos->preceder.blk);
-
-			/* See if we can find a closer block
-			   (forward direction only). */
-			pos->preceder.max_dist =
-			    min((reiser4_block_nr) sbinfo->flush.
-				relocate_distance, dist);
-			pos->preceder.level = znode_get_level(node);
-
-			ret = allocate_znode_update(node, parent_coord, pos);
-
-			pos->preceder.max_dist = 0;
-
-			if (ret && (ret != -ENOSPC))
-				return ret;
-
-			if (ret == 0) {
-				/* Got a better allocation. */
-				znode_make_reloc(node, pos->fq);
-			} else if (dist < sbinfo->flush.relocate_distance) {
-				/* The present allocation is good enough. */
-				jnode_make_wander(ZJNODE(node));
-			} else {
-				/* Otherwise, try to relocate to the best
-				   position. */
-best_reloc:
-				ret =
-				    allocate_znode_update(node, parent_coord,
-							  pos);
-				if (ret != 0)
-					return ret;
-
-				/* set JNODE_RELOC bit _after_ node gets
-				   allocated */
-				znode_make_reloc(node, pos->fq);
-			}
-		}
-	}
-
-	/* This is the new preceder. */
-	pos->preceder.blk = *znode_get_block(node);
-	check_preceder(pos->preceder.blk);
-	pos->alloc_cnt += 1;
-
-	assert("jmacd-4277", !reiser4_blocknr_is_fake(&pos->preceder.blk));
-
-	return 0;
-}
-
-static int
-allocate_znode(znode * node, const coord_t *parent_coord, flush_pos_t *pos)
+static int allocate_znode(znode * node,
+			  const coord_t *parent_coord, flush_pos_t *pos)
 {
+	txmod_plugin *plug = get_txmod_plugin();
 	/*
 	 * perform znode allocation with znode pinned in memory to avoid races
 	 * with asynchronous emergency flush (which plays with
 	 * JNODE_FLUSH_RESERVED bit).
 	 */
-	return WITH_DATA(node, allocate_znode_loaded(node, parent_coord, pos));
+	return WITH_DATA(node, plug->forward_alloc_formatted(node,
+							     parent_coord,
+							     pos));
 }
 
-/* A subroutine of allocate_znode, this is called first to see if there is a
-   close position to relocate to. It may return ENOSPC if there is no close
-   position. If there is no close position it may not relocate. This takes care
-   of updating the parent node with the relocated block address. */
-static int
-allocate_znode_update(znode * node, const coord_t *parent_coord,
-		      flush_pos_t *pos)
-{
-	int ret;
-	reiser4_block_nr blk;
-	lock_handle uber_lock;
-	int flush_reserved_used = 0;
-	int grabbed;
-	reiser4_context *ctx;
-	reiser4_super_info_data *sbinfo;
-
-	init_lh(&uber_lock);
-
-	ctx = get_current_context();
-	sbinfo = get_super_private(ctx->super);
-
-	grabbed = ctx->grabbed_blocks;
-
-	/* discard e-flush allocation */
-	ret = zload(node);
-	if (ret)
-		return ret;
-
-	if (ZF_ISSET(node, JNODE_CREATED)) {
-		assert("zam-816", reiser4_blocknr_is_fake(znode_get_block(node)));
-		pos->preceder.block_stage = BLOCK_UNALLOCATED;
-	} else {
-		pos->preceder.block_stage = BLOCK_GRABBED;
-
-		/* The disk space for relocating the @node is already reserved
-		 * in "flush reserved" counter if @node is leaf, otherwise we
-		 * grab space using BA_RESERVED (means grab space from whole
-		 * disk not from only 95%). */
-		if (znode_get_level(node) == LEAF_LEVEL) {
-			/*
-			 * earlier (during do_jnode_make_dirty()) we decided
-			 * that @node can possibly go into overwrite set and
-			 * reserved block for its wandering location.
-			 */
-			txn_atom *atom = get_current_atom_locked();
-			assert("nikita-3449",
-			       ZF_ISSET(node, JNODE_FLUSH_RESERVED));
-			flush_reserved2grabbed(atom, (__u64) 1);
-			spin_unlock_atom(atom);
-			/*
-			 * we are trying to move node into relocate
-			 * set. Allocation of relocated position "uses"
-			 * reserved block.
-			 */
-			ZF_CLR(node, JNODE_FLUSH_RESERVED);
-			flush_reserved_used = 1;
-		} else {
-			ret = reiser4_grab_space_force((__u64) 1, BA_RESERVED);
-			if (ret != 0)
-				goto exit;
-		}
-	}
-
-	/* We may do not use 5% of reserved disk space here and flush will not
-	   pack tightly. */
-	ret = reiser4_alloc_block(&pos->preceder, &blk,
-				  BA_FORMATTED | BA_PERMANENT);
-	if (ret)
-		goto exit;
-
-	if (!ZF_ISSET(node, JNODE_CREATED) &&
-	    (ret =
-	     reiser4_dealloc_block(znode_get_block(node), 0,
-				   BA_DEFER | BA_FORMATTED)))
-		goto exit;
-
-	if (likely(!znode_is_root(node))) {
-		item_plugin *iplug;
-
-		iplug = item_plugin_by_coord(parent_coord);
-		assert("nikita-2954", iplug->f.update != NULL);
-		iplug->f.update(parent_coord, &blk);
-
-		znode_make_dirty(parent_coord->node);
-
-	} else {
-		reiser4_tree *tree = znode_get_tree(node);
-		znode *uber;
-
-		/* We take a longterm lock on the fake node in order to change
-		   the root block number.  This may cause atom fusion. */
-		ret = get_uber_znode(tree, ZNODE_WRITE_LOCK, ZNODE_LOCK_HIPRI,
-				     &uber_lock);
-		/* The fake node cannot be deleted, and we must have priority
-		   here, and may not be confused with ENOSPC. */
-		assert("jmacd-74412",
-		       ret != -EINVAL && ret != -E_DEADLOCK && ret != -ENOSPC);
-
-		if (ret)
-			goto exit;
-
-		uber = uber_lock.node;
-
-		write_lock_tree(tree);
-		tree->root_block = blk;
-		write_unlock_tree(tree);
-
-		znode_make_dirty(uber);
-	}
-
-	ret = znode_rehash(node, &blk);
-exit:
-	if (ret) {
-		/* Get flush reserved block back if something fails, because
-		 * callers assume that on error block wasn't relocated and its
-		 * flush reserved block wasn't used. */
-		if (flush_reserved_used) {
-			/*
-			 * ok, we failed to move node into relocate
-			 * set. Restore status quo.
-			 */
-			grabbed2flush_reserved((__u64) 1);
-			ZF_SET(node, JNODE_FLUSH_RESERVED);
-		}
-	}
-	zrelse(node);
-	done_lh(&uber_lock);
-	grabbed2free_mark(grabbed);
-	return ret;
-}
 
 /* JNODE INTERFACE */
 
--- linux-3.13.orig/fs/reiser4/init_super.c
+++ linux-3.13/fs/reiser4/init_super.c
@@ -82,6 +82,12 @@ typedef enum {
 	 * onerror=remount-ro
 	 */
 	OPT_ONEOF,
+
+	/*
+	 * option take one of txmod plugin labels.
+	 * Example is "txmod=journal" or "txmod=wa"
+	 */
+	OPT_TXMOD,
 } opt_type_t;
 
 #if 0
@@ -91,6 +97,8 @@ struct opt_bitmask_bit {
 };
 #endif
 
+#define MAX_ONEOF_LIST 10
+
 /* description of option parseable by parse_option() */
 struct opt_desc {
 	/* option name.
@@ -120,9 +128,12 @@ struct opt_desc {
 		} f;
 		struct {
 			int *result;
-			const char *list[10];
+			const char *list[MAX_ONEOF_LIST];
 		} oneof;
 		struct {
+			reiser4_txmod_id *result;
+		} txmod;
+		struct {
 			void *addr;
 			int nr_bits;
 			/* struct opt_bitmask_bit *bits; */
@@ -207,6 +218,30 @@ static int parse_option(char *opt_string
 			}
 			break;
 		}
+		break;
+	case OPT_TXMOD:
+		{
+			reiser4_txmod_id i = 0;
+
+			if (val_start == NULL) {
+				err_msg = "Value is missing";
+				result = RETERR(-EINVAL);
+				break;
+			}
+			err_msg = "Wrong option value";
+			result = RETERR(-EINVAL);
+			while (i < LAST_TXMOD_ID) {
+				if (!strcmp(txmod_plugins[i].h.label,
+					    val_start)) {
+					result = 0;
+					err_msg = NULL;
+					*opt->u.txmod.result = i;
+					break;
+				}
+				i++;
+			}
+			break;
+		}
 	default:
 		wrong_return_value("nikita-2100", "opt -> type");
 		break;
@@ -500,6 +535,22 @@ int reiser4_init_super_data(struct super
 		}
 	}
 	);
+
+	/*
+	 * What trancaction model (journal, cow, etc)
+	 * is used to commit transactions
+	 */
+	PUSH_OPT(p, opts,
+	{
+		.name = "txmod",
+		.type = OPT_TXMOD,
+		.u = {
+			.txmod = {
+				 .result = &sbinfo->txmod
+			 }
+		}
+	}
+	);
 
 	/* modify default settings to values set by mount options */
 	result = parse_options(opt_string, opts, p - opts);
--- linux-3.13.orig/fs/reiser4/plugin/item/extent_flush_ops.c
+++ linux-3.13/fs/reiser4/plugin/item/extent_flush_ops.c
@@ -281,30 +281,13 @@ int reiser4_scan_extent(flush_scan * sca
 	return ret;
 }
 
-/* ask block allocator for some blocks */
-static void extent_allocate_blocks(reiser4_blocknr_hint *preceder,
-				   reiser4_block_nr wanted_count,
-				   reiser4_block_nr *first_allocated,
-				   reiser4_block_nr *allocated,
-				   block_stage_t block_stage)
-{
-	*allocated = wanted_count;
-	preceder->max_dist = 0;	/* scan whole disk, if needed */
-
-	/* that number of blocks (wanted_count) is either in UNALLOCATED or in GRABBED */
-	preceder->block_stage = block_stage;
-
-	/* FIXME: we do not handle errors here now */
-	check_me("vs-420",
-		 reiser4_alloc_blocks(preceder, first_allocated, allocated,
-				      BA_PERMANENT) == 0);
-	/* update flush_pos's preceder to last allocated block number */
-	preceder->blk = *first_allocated + *allocated - 1;
-}
-
-/* when on flush time unallocated extent is to be replaced with allocated one it may happen that one unallocated extent
-   will have to be replaced with set of allocated extents. In this case insert_into_item will be called which may have
-   to add new nodes into tree. Space for that is taken from inviolable reserve (5%). */
+/**
+ * When on flush time unallocated extent is to be replaced with allocated one
+ * it may happen that one unallocated extent will have to be replaced with set
+ * of allocated extents. In this case insert_into_item will be called which may
+ * have to add new nodes into tree. Space for that is taken from inviolable
+ * reserve (5%).
+ */
 static reiser4_block_nr reserve_replace(void)
 {
 	reiser4_block_nr grabbed, needed;
@@ -355,7 +338,7 @@ static reiser4_block_nr extent_unit_star
  *
  * replace allocated extent with two allocated extents
  */
-static int split_allocated_extent(coord_t *coord, reiser4_block_nr pos_in_unit)
+int split_allocated_extent(coord_t *coord, reiser4_block_nr pos_in_unit)
 {
 	int result;
 	struct replace_handle *h;
@@ -446,14 +429,14 @@ static int try_to_merge_with_left(coord_
 }
 
 /**
- * conv_extent - replace extent with 2 ones
+ * convert_extent - replace extent with 2 ones
  * @coord: coordinate of extent to be replaced
  * @replace: extent to overwrite the one @coord is set to
  *
  * Overwrites extent @coord is set to and paste one extent unit after
  * overwritten one if @replace is shorter than initial extent
  */
-static int conv_extent(coord_t *coord, reiser4_extent *replace)
+int convert_extent(coord_t *coord, reiser4_extent *replace)
 {
 	int result;
 	struct replace_handle *h;
@@ -528,9 +511,9 @@ static int conv_extent(coord_t *coord, r
  * Assigns block numbers to each of @count jnodes. Index of first jnode is
  * @index. Jnodes get lookuped with jlookup.
  */
-static void assign_real_blocknrs(flush_pos_t *flush_pos, oid_t oid,
-				 unsigned long index, reiser4_block_nr count,
-				 reiser4_block_nr first)
+void assign_real_blocknrs(flush_pos_t *flush_pos, oid_t oid,
+			  unsigned long index, reiser4_block_nr count,
+			  reiser4_block_nr first)
 {
 	unsigned long i;
 	reiser4_tree *tree;
@@ -572,79 +555,6 @@ static void assign_real_blocknrs(flush_p
 }
 
 /**
- * make_node_ovrwr - assign node to overwrite set
- * @jnodes: overwrite set list head
- * @node: jnode to belong to overwrite set
- *
- * Sets OVRWR jnode state bit and puts @node to the end of list head @jnodes
- * which is an accumulator for nodes before they get to overwrite set list of
- * atom.
- */
-static void make_node_ovrwr(struct list_head *jnodes, jnode *node)
-{
-	spin_lock_jnode(node);
-
-	assert("zam-917", !JF_ISSET(node, JNODE_RELOC));
-	assert("zam-918", !JF_ISSET(node, JNODE_OVRWR));
-
-	JF_SET(node, JNODE_OVRWR);
-	list_move_tail(&node->capture_link, jnodes);
-	ON_DEBUG(count_jnode(node->atom, node, DIRTY_LIST, OVRWR_LIST, 0));
-
-	spin_unlock_jnode(node);
-}
-
-/**
- * mark_jnodes_overwrite - put bunch of jnodes to overwrite set
- * @flush_pos: flush position
- * @oid: objectid of file jnodes belong to
- * @index: starting index
- * @width: extent width
- *
- * Puts nodes of one extent (file objectid @oid, extent width @width) to atom's
- * overwrite set. Starting from the one with index @index. If end of slum is
- * detected (node is not found or flushprepped) - stop iterating and set flush
- * position's state to POS_INVALID.
- */
-static void mark_jnodes_overwrite(flush_pos_t *flush_pos, oid_t oid,
-				  unsigned long index, reiser4_block_nr width)
-{
-	unsigned long i;
-	reiser4_tree *tree;
-	jnode *node;
-	txn_atom *atom;
-	LIST_HEAD(jnodes);
-
-	tree = current_tree;
-
-	atom = atom_locked_by_fq(reiser4_pos_fq(flush_pos));
-	assert("vs-1478", atom);
-
-	for (i = flush_pos->pos_in_unit; i < width; i++, index++) {
-		node = jlookup(tree, oid, index);
-		if (!node) {
-			flush_pos->state = POS_INVALID;
-			break;
-		}
-		if (jnode_check_flushprepped(node)) {
-			flush_pos->state = POS_INVALID;
-			atomic_dec(&node->x_count);
-			break;
-		}
-		if (node->atom != atom) {
-			flush_pos->state = POS_INVALID;
-			atomic_dec(&node->x_count);
-			break;
-		}
-		make_node_ovrwr(&jnodes, node);
-		atomic_dec(&node->x_count);
-	}
-
-	list_splice_init(&jnodes, ATOM_OVRWR_LIST(atom)->prev);
-	spin_unlock_atom(atom);
-}
-
-/**
  * allocated_extent_slum_size
  * @flush_pos:
  * @oid:
@@ -653,8 +563,8 @@ static void mark_jnodes_overwrite(flush_
  *
  *
  */
-static int allocated_extent_slum_size(flush_pos_t *flush_pos, oid_t oid,
-				      unsigned long index, unsigned long count)
+int allocated_extent_slum_size(flush_pos_t *flush_pos, oid_t oid,
+			       unsigned long index, unsigned long count)
 {
 	unsigned long i;
 	reiser4_tree *tree;
@@ -697,140 +607,6 @@ static int allocated_extent_slum_size(fl
 	return nr;
 }
 
-/**
- * alloc_extent
- * @flush_pos:
- *
- *
- * this is called by handle_pos_on_twig to proceed extent unit flush_pos->coord
- * is set to. It is to prepare for flushing sequence of not flushprepped nodes
- * (slum). It supposes that slum starts at flush_pos->pos_in_unit position
- * within the extent. Slum gets to relocate set if flush_pos->leaf_relocate is
- * set to 1 and to overwrite set otherwise
- */
-int reiser4_alloc_extent(flush_pos_t *flush_pos)
-{
-	coord_t *coord;
-	reiser4_extent *ext;
-	reiser4_extent replace_ext;
-	oid_t oid;
-	reiser4_block_nr protected;
-	reiser4_block_nr start;
-	__u64 index;
-	__u64 width;
-	extent_state state;
-	int result;
-	reiser4_block_nr first_allocated;
-	__u64 allocated;
-	reiser4_key key;
-	block_stage_t block_stage;
-
-	assert("vs-1468", flush_pos->state == POS_ON_EPOINT);
-	assert("vs-1469", coord_is_existing_unit(&flush_pos->coord)
-	       && item_is_extent(&flush_pos->coord));
-
-	coord = &flush_pos->coord;
-
-	ext = extent_by_coord(coord);
-	state = state_of_extent(ext);
-	if (state == HOLE_EXTENT) {
-		flush_pos->state = POS_INVALID;
-		return 0;
-	}
-
-	item_key_by_coord(coord, &key);
-	oid = get_key_objectid(&key);
-	index = extent_unit_index(coord) + flush_pos->pos_in_unit;
-	start = extent_get_start(ext);
-	width = extent_get_width(ext);
-
-	assert("vs-1457", width > flush_pos->pos_in_unit);
-
-	if (flush_pos->leaf_relocate || state == UNALLOCATED_EXTENT) {
-		/* relocate */
-		if (flush_pos->pos_in_unit) {
-			/* split extent unit into two */
-			result =
-			    split_allocated_extent(coord,
-						   flush_pos->pos_in_unit);
-			flush_pos->pos_in_unit = 0;
-			return result;
-		}
-
-		/* limit number of nodes to allocate */
-		if (flush_pos->nr_to_write < width)
-			width = flush_pos->nr_to_write;
-
-		if (state == ALLOCATED_EXTENT) {
-			/*
-			 * all protected nodes are not flushprepped, therefore
-			 * they are counted as flush_reserved
-			 */
-			block_stage = BLOCK_FLUSH_RESERVED;
-			protected = allocated_extent_slum_size(flush_pos, oid,
-							       index, width);
-			if (protected == 0) {
-				flush_pos->state = POS_INVALID;
-				flush_pos->pos_in_unit = 0;
-				return 0;
- 			}
-		} else {
-			block_stage = BLOCK_UNALLOCATED;
-			protected = width;
-		}
-
-		/*
-		 * look at previous unit if possible. If it is allocated, make
-		 * preceder more precise
-		 */
-		if (coord->unit_pos &&
-		    (state_of_extent(ext - 1) == ALLOCATED_EXTENT))
-			reiser4_pos_hint(flush_pos)->blk =
-				extent_get_start(ext - 1) +
-				extent_get_width(ext - 1);
-
-		/* allocate new block numbers for protected nodes */
-		extent_allocate_blocks(reiser4_pos_hint(flush_pos),
-				       protected,
-				       &first_allocated, &allocated,
-				       block_stage);
-
-		if (state == ALLOCATED_EXTENT)
-			/*
-			 * on relocating - free nodes which are going to be
-			 * relocated
-			 */
-			reiser4_dealloc_blocks(&start, &allocated,
-					       BLOCK_ALLOCATED, BA_DEFER);
-
-		/* assign new block numbers to protected nodes */
-		assign_real_blocknrs(flush_pos, oid, index, allocated, first_allocated);
-
-		/* prepare extent which will replace current one */
-		reiser4_set_extent(&replace_ext, first_allocated, allocated);
-
-		/* adjust extent item */
-		result = conv_extent(coord, &replace_ext);
-		if (result != 0 && result != -ENOMEM) {
-			warning("vs-1461",
-				"Failed to allocate extent. Should not happen\n");
-			return result;
-		}
-
-		/*
-		 * break flush: we prepared for flushing as many blocks as we
-		 * were asked for
-		 */
-		if (flush_pos->nr_to_write == allocated)
-			flush_pos->state = POS_INVALID;
-	} else {
-		/* overwrite */
-		mark_jnodes_overwrite(flush_pos, oid, index, width);
-	}
-	flush_pos->pos_in_unit = 0;
-	return 0;
-}
-
 /* if @key is glueable to the item @coord is set to */
 static int must_insert(const coord_t *coord, const reiser4_key *key)
 {
@@ -842,10 +618,14 @@ static int must_insert(const coord_t *co
 	return 1;
 }
 
-/* copy extent @copy to the end of @node. It may have to either insert new item after the last one, or append last item,
-   or modify last unit of last item to have greater width */
-static int put_unit_to_end(znode *node, const reiser4_key *key,
-			   reiser4_extent *copy_ext)
+/**
+ * copy extent @copy to the end of @node.
+ * It may have to either insert new item after the last one,
+ * or append last item, or modify last unit of last item to have
+ * greater width
+ */
+int put_unit_to_end(znode *node,
+		    const reiser4_key *key, reiser4_extent *copy_ext)
 {
 	int result;
 	coord_t coord;
@@ -889,128 +669,6 @@ static int put_unit_to_end(znode *node,
 	return result;
 }
 
-/* @coord is set to extent unit */
-squeeze_result squalloc_extent(znode *left, const coord_t *coord,
-			       flush_pos_t *flush_pos,
-			       reiser4_key *stop_key)
-{
-	reiser4_extent *ext;
-	__u64 index;
-	__u64 width;
-	reiser4_block_nr start;
-	extent_state state;
-	oid_t oid;
-	reiser4_block_nr first_allocated;
-	__u64 allocated;
-	__u64 protected;
-	reiser4_extent copy_extent;
-	reiser4_key key;
-	int result;
-	block_stage_t block_stage;
-
-	assert("vs-1457", flush_pos->pos_in_unit == 0);
-	assert("vs-1467", coord_is_leftmost_unit(coord));
-	assert("vs-1467", item_is_extent(coord));
-
-	ext = extent_by_coord(coord);
-	index = extent_unit_index(coord);
-	start = extent_get_start(ext);
-	width = extent_get_width(ext);
-	state = state_of_extent(ext);
-	unit_key_by_coord(coord, &key);
-	oid = get_key_objectid(&key);
-
-	if ((flush_pos->leaf_relocate && state == ALLOCATED_EXTENT) ||
-	    (state == UNALLOCATED_EXTENT)) {
-		/* relocate */
-		if (state == ALLOCATED_EXTENT) {
-			/* all protected nodes are not flushprepped, therefore
-			 * they are counted as flush_reserved */
-			block_stage = BLOCK_FLUSH_RESERVED;
-			protected = allocated_extent_slum_size(flush_pos, oid,
-							       index, width);
-			if (protected == 0) {
-				flush_pos->state = POS_INVALID;
-				flush_pos->pos_in_unit = 0;
-				return 0;
- 			}
-		} else {
-			block_stage = BLOCK_UNALLOCATED;
-			protected = width;
-		}
-
-		/*
-		 * look at previous unit if possible. If it is allocated, make
-		 * preceder more precise
-		 */
-		if (coord->unit_pos &&
-		    (state_of_extent(ext - 1) == ALLOCATED_EXTENT))
-			reiser4_pos_hint(flush_pos)->blk =
-				extent_get_start(ext - 1) +
-				extent_get_width(ext - 1);
-
-		/* allocate new block numbers for protected nodes */
-		extent_allocate_blocks(reiser4_pos_hint(flush_pos),
-				       protected,
-				       &first_allocated, &allocated,
-				       block_stage);
-
-		/* prepare extent which will be copied to left */
-		reiser4_set_extent(&copy_extent, first_allocated, allocated);
-
-		result = put_unit_to_end(left, &key, &copy_extent);
-		if (result == -E_NODE_FULL) {
-			int target_block_stage;
-
-			/* free blocks which were just allocated */
-			target_block_stage =
-			    (state ==
-			     ALLOCATED_EXTENT) ? BLOCK_FLUSH_RESERVED :
-			    BLOCK_UNALLOCATED;
-			reiser4_dealloc_blocks(&first_allocated, &allocated,
-					       target_block_stage,
-					       BA_PERMANENT);
-
-			/* rewind the preceder. */
-			flush_pos->preceder.blk = first_allocated;
-			check_preceder(flush_pos->preceder.blk);
-
-			return SQUEEZE_TARGET_FULL;
-		}
-
-		if (state == ALLOCATED_EXTENT) {
-			/* free nodes which were relocated */
-			reiser4_dealloc_blocks(&start, &allocated,
-					       BLOCK_ALLOCATED, BA_DEFER);
-		}
-
-		/* assign new block numbers to protected nodes */
-		assign_real_blocknrs(flush_pos, oid, index, allocated,
-				     first_allocated);
-
-		set_key_offset(&key,
-			       get_key_offset(&key) +
-			       (allocated << current_blocksize_bits));
-	} else {
-		/*
-		 * overwrite: try to copy unit as it is to left neighbor and
-		 * make all first not flushprepped nodes overwrite nodes
-		 */
-		reiser4_set_extent(&copy_extent, start, width);
-		result = put_unit_to_end(left, &key, &copy_extent);
-		if (result == -E_NODE_FULL)
-			return SQUEEZE_TARGET_FULL;
-
-		if (state != HOLE_EXTENT)
-			mark_jnodes_overwrite(flush_pos, oid, index, width);
-		set_key_offset(&key,
-			       get_key_offset(&key) +
-			       (width << current_blocksize_bits));
-	}
-	*stop_key = key;
-	return SQUEEZE_CONTINUE;
-}
-
 int key_by_offset_extent(struct inode *inode, loff_t off, reiser4_key * key)
 {
 	return key_by_inode_and_offset_common(inode, off, key);
--- linux-3.13.orig/fs/reiser4/plugin/plugin.h
+++ linux-3.13/fs/reiser4/plugin/plugin.h
@@ -496,6 +496,48 @@ typedef struct formatting_plugin {
 	int (*have_tail) (const struct inode *inode, loff_t size);
 } formatting_plugin;
 
+/**
+ * Plugins of this interface implement different transaction models.
+ * Transaction model is a high-level block allocator, which assigns block
+ * numbers to dirty nodes, and, thereby, decides, how individual dirty
+ * nodes of an atom will be committed.
+  */
+typedef struct txmod_plugin {
+	/* generic fields */
+	plugin_header h;
+	/**
+	 * allocate blocks in the FORWARD PARENT-FIRST context
+	 * for formatted nodes
+	 */
+	int (*forward_alloc_formatted)(znode *node, const coord_t *parent_coord,
+			       flush_pos_t *pos); //was allocate_znode_loaded
+	/**
+	 * allocate blocks in the REVERSE PARENT-FIRST context
+	 * for formatted nodes
+	 */
+	int (*reverse_alloc_formatted)(jnode * node,
+				       const coord_t *parent_coord,
+				       flush_pos_t *pos); // was reverse_relocate_test
+	/**
+	 * allocate blocks in the FORWARD PARENT-FIRST context
+	 * for unformatted nodes.
+	 *
+	 * This is called by handle_pos_on_twig to proceed extent unit
+	 * flush_pos->coord is set to. It is to prepare for flushing
+	 * sequence of not flushprepped nodes (slum). It supposes that
+	 * slum starts at flush_pos->pos_in_unit position within the extent
+	 */
+	int (*forward_alloc_unformatted)(flush_pos_t *flush_pos); //was reiser4_alloc_extent
+	/**
+	 * allocale blocks for unformatted nodes in squeeze_right_twig().
+ 	 * @coord is set to extent unit
+	 */
+	squeeze_result (*squeeze_alloc_unformatted)(znode *left,
+				const coord_t *coord,
+				flush_pos_t *flush_pos,
+				reiser4_key *stop_key); // was_squalloc_extent
+} txmod_plugin;
+
 typedef struct hash_plugin {
 	/* generic fields */
 	plugin_header h;
@@ -689,6 +731,8 @@ union reiser4_plugin {
 	compression_mode_plugin compression_mode;
 	/* cluster plugin, used by object plugin */
 	cluster_plugin clust;
+	/* transaction mode plugin */
+	txmod_plugin txmod;
 	/* place-holder for new plugin types that can be registered
 	   dynamically, and used by other dynamically loaded plugins.  */
 	void *generic;
@@ -774,8 +818,7 @@ typedef enum {
 	LAST_CLUSTER_ID
 } reiser4_cluster_id;
 
-/* builtin tail-plugins */
-
+/* builtin tail packing policies */
 typedef enum {
 	NEVER_TAILS_FORMATTING_ID,
 	ALWAYS_TAILS_FORMATTING_ID,
@@ -783,6 +826,15 @@ typedef enum {
 	LAST_TAIL_FORMATTING_ID
 } reiser4_formatting_id;
 
+/* builtin transaction models */
+typedef enum {
+	HYBRID_TXMOD_ID,
+	JOURNAL_TXMOD_ID,
+	WA_TXMOD_ID,
+	LAST_TXMOD_ID
+} reiser4_txmod_id;
+
+
 /* data type used to pack parameters that we pass to vfs object creation
    function create_object() */
 struct reiser4_object_create_data {
@@ -869,6 +921,7 @@ PLUGIN_BY_ID(jnode_plugin, REISER4_JNODE
 PLUGIN_BY_ID(compression_mode_plugin, REISER4_COMPRESSION_MODE_PLUGIN_TYPE,
 	     compression_mode);
 PLUGIN_BY_ID(cluster_plugin, REISER4_CLUSTER_PLUGIN_TYPE, clust);
+PLUGIN_BY_ID(txmod_plugin, REISER4_TXMOD_PLUGIN_TYPE, txmod);
 
 extern int save_plugin_id(reiser4_plugin * plugin, d16 * area);
 
@@ -896,6 +949,8 @@ extern sd_ext_plugin sd_ext_plugins[LAST
 extern hash_plugin hash_plugins[LAST_HASH_ID];
 /* defined in fs/reiser4/plugin/fibration.c */
 extern fibration_plugin fibration_plugins[LAST_FIBRATION_ID];
+/* defined in fs/reiser4/plugin/txmod.c */
+extern txmod_plugin txmod_plugins[LAST_TXMOD_ID];
 /* defined in fs/reiser4/plugin/crypt.c */
 extern cipher_plugin cipher_plugins[LAST_CIPHER_ID];
 /* defined in fs/reiser4/plugin/digest.c */
--- linux-3.13.orig/fs/reiser4/super.h
+++ linux-3.13/fs/reiser4/super.h
@@ -131,6 +131,9 @@ struct reiser4_super_info_data {
 	/* space manager plugin */
 	reiser4_space_allocator space_allocator;
 
+	/* transaction model */
+	reiser4_txmod_id txmod;
+
 	/* reiser4 internal tree */
 	reiser4_tree tree;
 
--- linux-3.13.orig/fs/reiser4/txnmgr.c
+++ linux-3.13/fs/reiser4/txnmgr.c
@@ -2587,86 +2587,6 @@ count_jnode(txn_atom * atom, jnode * nod
 
 #endif
 
-/* Make node OVRWR and put it on atom->overwrite_nodes list, atom lock and jnode
- * lock should be taken before calling this function. */
-void jnode_make_wander_nolock(jnode * node)
-{
-	txn_atom *atom;
-
-	assert("nikita-2431", node != NULL);
-	assert("nikita-2432", !JF_ISSET(node, JNODE_RELOC));
-	assert("nikita-3153", JF_ISSET(node, JNODE_DIRTY));
-	assert("zam-897", !JF_ISSET(node, JNODE_FLUSH_QUEUED));
-	assert("nikita-3367", !reiser4_blocknr_is_fake(jnode_get_block(node)));
-
-	atom = node->atom;
-
-	assert("zam-895", atom != NULL);
-	assert("zam-894", atom_is_protected(atom));
-
-	JF_SET(node, JNODE_OVRWR);
-	/* move node to atom's overwrite list */
-	list_move_tail(&node->capture_link, ATOM_OVRWR_LIST(atom));
-	ON_DEBUG(count_jnode(atom, node, DIRTY_LIST, OVRWR_LIST, 1));
-}
-
-/* Same as jnode_make_wander_nolock, but all necessary locks are taken inside
- * this function. */
-void jnode_make_wander(jnode * node)
-{
-	txn_atom *atom;
-
-	spin_lock_jnode(node);
-	atom = jnode_get_atom(node);
-	assert("zam-913", atom != NULL);
-	assert("zam-914", !JF_ISSET(node, JNODE_RELOC));
-
-	jnode_make_wander_nolock(node);
-	spin_unlock_atom(atom);
-	spin_unlock_jnode(node);
-}
-
-/* this just sets RELOC bit  */
-static void jnode_make_reloc_nolock(flush_queue_t * fq, jnode * node)
-{
-	assert_spin_locked(&(node->guard));
-	assert("zam-916", JF_ISSET(node, JNODE_DIRTY));
-	assert("zam-917", !JF_ISSET(node, JNODE_RELOC));
-	assert("zam-918", !JF_ISSET(node, JNODE_OVRWR));
-	assert("zam-920", !JF_ISSET(node, JNODE_FLUSH_QUEUED));
-	assert("nikita-3367", !reiser4_blocknr_is_fake(jnode_get_block(node)));
-	jnode_set_reloc(node);
-}
-
-/* Make znode RELOC and put it on flush queue */
-void znode_make_reloc(znode * z, flush_queue_t * fq)
-{
-	jnode *node;
-	txn_atom *atom;
-
-	node = ZJNODE(z);
-	spin_lock_jnode(node);
-
-	atom = jnode_get_atom(node);
-	assert("zam-919", atom != NULL);
-
-	jnode_make_reloc_nolock(fq, node);
-	queue_jnode(fq, node);
-
-	spin_unlock_atom(atom);
-	spin_unlock_jnode(node);
-
-}
-
-/* Make unformatted node RELOC and put it on flush queue */
-void unformatted_make_reloc(jnode *node, flush_queue_t *fq)
-{
-	assert("vs-1479", jnode_is_unformatted(node));
-
-	jnode_make_reloc_nolock(fq, node);
-	queue_jnode(fq, node);
-}
-
 int reiser4_capture_super_block(struct super_block *s)
 {
 	int result;
--- linux-3.13.orig/fs/reiser4/plugin/plugin_header.h
+++ linux-3.13/fs/reiser4/plugin/plugin_header.h
@@ -28,6 +28,7 @@ typedef enum {
 	REISER4_COMPRESSION_PLUGIN_TYPE,      /* compression methods */
 	REISER4_COMPRESSION_MODE_PLUGIN_TYPE, /* dispatching policies */
 	REISER4_CLUSTER_PLUGIN_TYPE,          /* manage logical clusters */
+	REISER4_TXMOD_PLUGIN_TYPE,            /* transaction models */
 	REISER4_PLUGIN_TYPES
 } reiser4_plugin_type;
 
--- /dev/null
+++ linux-3.13/fs/reiser4/plugin/txmod.c
@@ -0,0 +1,1244 @@
+#include "../forward.h"
+#include "../debug.h"
+#include "../coord.h"
+#include "../plugin/plugin.h"
+#include "../jnode.h"
+#include "../znode.h"
+#include "../block_alloc.h"
+#include "../reiser4.h"
+#include "../flush.h"
+
+/*
+ * This file contains implementation of different transaction models.
+ *
+ * Transaction model is a high-level block allocator, which assigns block
+ * numbers to dirty nodes, and, thereby, decides, how those nodes will be
+ * committed.
+ *
+ * Every dirty node of reiser4 atom can be committed by either of the
+ * following two ways:
+ * 1) via journal;
+ * 2) using "write-anywhere" technique.
+ *
+ * If the allocator doesn't change on-disk location of a node, then
+ * this node will be committed using journalling technique (overwrite).
+ * Otherwise, it will be comitted via write-anywhere technique (relocate):
+ *
+ *            relocate  <----  allocate  --- >  overwrite
+ *
+ * So, in our interpretation the 2 traditional "classic" strategies in
+ * committing transactions (journalling and "write-anywhere") are just two
+ * boundary cases: 1) when all nodes are overwritten, and 2) when all nodes
+ * are relocated.
+ *
+ * Besides those 2 boundary cases we can implement in reiser4 the infinite
+ * set of their various combinations, so that user can choose what is really
+ * suitable for his needs.
+ */
+
+/* jnode_make_wander_nolock <- find_flush_start_jnode (special case for znode-above-root)
+                            <- jnode_make_wander  */
+void jnode_make_wander_nolock(jnode * node);
+
+/* jnode_make_wander <- txmod.forward_alloc_formatted */
+void jnode_make_wander(jnode * node);
+
+/* jnode_make_reloc_nolock <- znode_make_reloc
+                           <- unformatted_make_reloc */
+static void jnode_make_reloc_nolock(flush_queue_t * fq, jnode * node);
+
+
+
+                  /* Handle formatted nodes in forward context */
+
+
+/**
+ * txmod.forward_alloc_formatted <- allocate_znode <- alloc_pos_and_ancestors <- jnode_flush
+ *                                                 <- alloc_one_ancestor <- alloc_pos_and_ancestors <- jnode_flush
+ *                                                               <- alloc_one_ancestor (recursive)
+ *                                                 <- lock_parent_and_allocate_znode <- squalloc_upper_levels <- check_parents_and_squalloc_upper_levels <- squalloc_upper_levels (recursive)
+ *                                                                                                                                                       <- handle_pos_on_formatted
+ *                                                                                   <- handle_pos_on_formatted
+ *                                                                                   <- handle_pos_end_of_twig
+ *                                                 <- handle_pos_to_leaf
+ */
+void znode_make_reloc(znode * z, flush_queue_t * fq);
+
+
+                             /* Handle unformatted nodes */
+
+
+/* unformatted_make_reloc <- assign_real_blocknrs <- txmod.forward_alloc_unformatted
+                                                  <- txmod.squeeze_alloc_unformatted
+*/
+void unformatted_make_reloc(jnode *node, flush_queue_t *fq);
+
+static void forward_overwrite_unformatted(flush_pos_t *flush_pos, oid_t oid,
+				  unsigned long index, reiser4_block_nr width);
+
+/* mark_jnode_overwrite <- forward_overwrite_unformatted <- txmod.forward_alloc_unformatted
+                           squeeze_overwrite_unformatted <- txmod.squeeze_alloc_unformatted
+*/
+static void mark_jnode_overwrite(struct list_head *jnodes, jnode *node);
+
+int split_allocated_extent(coord_t *coord, reiser4_block_nr pos_in_unit);
+int allocated_extent_slum_size(flush_pos_t *flush_pos, oid_t oid,
+			       unsigned long index, unsigned long count);
+void allocate_blocks_unformatted(reiser4_blocknr_hint *preceder,
+				 reiser4_block_nr wanted_count,
+				 reiser4_block_nr *first_allocated,
+				 reiser4_block_nr *allocated,
+				 block_stage_t block_stage);
+void assign_real_blocknrs(flush_pos_t *flush_pos, oid_t oid,
+			  unsigned long index, reiser4_block_nr count,
+			  reiser4_block_nr first);
+int convert_extent(coord_t *coord, reiser4_extent *replace);
+int put_unit_to_end(znode *node,
+		    const reiser4_key *key, reiser4_extent *copy_ext);
+
+/*
+ * txmod.forward_alloc_unformatted <- handle_pos_on_twig
+ * txmod.squeeze_alloc_unformatted <- squeeze_right_twig
+ */
+
+/* Common functions */
+
+/**
+ * Mark node JNODE_OVRWR and put it on atom->overwrite_nodes list.
+ * Atom lock and jnode lock should be taken before calling this
+ * function.
+ */
+void jnode_make_wander_nolock(jnode * node)
+{
+	txn_atom *atom;
+
+	assert("nikita-2431", node != NULL);
+	assert("nikita-2432", !JF_ISSET(node, JNODE_RELOC));
+	assert("nikita-3153", JF_ISSET(node, JNODE_DIRTY));
+	assert("zam-897", !JF_ISSET(node, JNODE_FLUSH_QUEUED));
+	assert("nikita-3367", !reiser4_blocknr_is_fake(jnode_get_block(node)));
+
+	atom = node->atom;
+
+	assert("zam-895", atom != NULL);
+	assert("zam-894", atom_is_protected(atom));
+
+	JF_SET(node, JNODE_OVRWR);
+	/* move node to atom's overwrite list */
+	list_move_tail(&node->capture_link, ATOM_OVRWR_LIST(atom));
+	ON_DEBUG(count_jnode(atom, node, DIRTY_LIST, OVRWR_LIST, 1));
+}
+
+/*
+ * Same as jnode_make_wander_nolock, but all necessary locks
+ * are taken inside this function.
+ */
+void jnode_make_wander(jnode * node)
+{
+	txn_atom *atom;
+
+	spin_lock_jnode(node);
+	atom = jnode_get_atom(node);
+	assert("zam-913", atom != NULL);
+	assert("zam-914", !JF_ISSET(node, JNODE_RELOC));
+
+	jnode_make_wander_nolock(node);
+	spin_unlock_atom(atom);
+	spin_unlock_jnode(node);
+}
+
+/* this just sets RELOC bit  */
+static void jnode_make_reloc_nolock(flush_queue_t * fq, jnode * node)
+{
+	assert_spin_locked(&(node->guard));
+	assert("zam-916", JF_ISSET(node, JNODE_DIRTY));
+	assert("zam-917", !JF_ISSET(node, JNODE_RELOC));
+	assert("zam-918", !JF_ISSET(node, JNODE_OVRWR));
+	assert("zam-920", !JF_ISSET(node, JNODE_FLUSH_QUEUED));
+	assert("nikita-3367", !reiser4_blocknr_is_fake(jnode_get_block(node)));
+	jnode_set_reloc(node);
+}
+
+/*
+ * Mark znode RELOC and put it on flush queue
+ */
+void znode_make_reloc(znode * z, flush_queue_t * fq)
+{
+	jnode *node;
+	txn_atom *atom;
+
+	node = ZJNODE(z);
+	spin_lock_jnode(node);
+
+	atom = jnode_get_atom(node);
+	assert("zam-919", atom != NULL);
+
+	jnode_make_reloc_nolock(fq, node);
+	queue_jnode(fq, node);
+
+	spin_unlock_atom(atom);
+	spin_unlock_jnode(node);
+}
+
+/* Mark unformatted node RELOC and put it on flush queue */
+void unformatted_make_reloc(jnode *node, flush_queue_t *fq)
+{
+	assert("vs-1479", jnode_is_unformatted(node));
+
+	jnode_make_reloc_nolock(fq, node);
+	queue_jnode(fq, node);
+}
+
+/**
+ * mark_jnode_overwrite - assign node to overwrite set
+ * @jnodes: overwrite set list head
+ * @node: jnode to belong to overwrite set
+ *
+ * Sets OVRWR jnode state bit and puts @node to the end of list head @jnodes
+ * which is an accumulator for nodes before they get to overwrite set list of
+ * atom.
+ */
+static void mark_jnode_overwrite(struct list_head *jnodes, jnode *node)
+{
+	spin_lock_jnode(node);
+
+	assert("zam-917", !JF_ISSET(node, JNODE_RELOC));
+	assert("zam-918", !JF_ISSET(node, JNODE_OVRWR));
+
+	JF_SET(node, JNODE_OVRWR);
+	list_move_tail(&node->capture_link, jnodes);
+	ON_DEBUG(count_jnode(node->atom, node, DIRTY_LIST, OVRWR_LIST, 0));
+
+	spin_unlock_jnode(node);
+}
+
+static int forward_relocate_unformatted(flush_pos_t *flush_pos,
+					reiser4_extent *ext,
+					extent_state state,
+					oid_t oid, __u64 index,
+					__u64 width, int *exit)
+{
+	int result;
+	coord_t *coord;
+	reiser4_extent replace_ext;
+	reiser4_block_nr protected;
+	reiser4_block_nr start;
+	reiser4_block_nr first_allocated;
+	__u64 allocated;
+	block_stage_t block_stage;
+
+	*exit = 0;
+	coord = &flush_pos->coord;
+	start = extent_get_start(ext);
+
+	if (flush_pos->pos_in_unit) {
+		/*
+		 * split extent unit into two ones
+		 */
+		result = split_allocated_extent(coord,
+						flush_pos->pos_in_unit);
+		flush_pos->pos_in_unit = 0;
+		*exit = 1;
+		return result;
+	}
+	/*
+	 * limit number of nodes to allocate
+	 */
+	if (flush_pos->nr_to_write < width)
+		width = flush_pos->nr_to_write;
+
+	if (state == ALLOCATED_EXTENT) {
+		/*
+		 * all protected nodes are not flushprepped, therefore
+		 * they are counted as flush_reserved
+		 */
+		block_stage = BLOCK_FLUSH_RESERVED;
+		protected = allocated_extent_slum_size(flush_pos, oid,
+						       index, width);
+		if (protected == 0) {
+			flush_pos->state = POS_INVALID;
+			flush_pos->pos_in_unit = 0;
+			*exit = 1;
+			return 0;
+		}
+	} else {
+		block_stage = BLOCK_UNALLOCATED;
+		protected = width;
+	}
+	/*
+	 * look at previous unit if possible. If it is allocated, make
+	 * preceder more precise
+	 */
+	if (coord->unit_pos &&
+	    (state_of_extent(ext - 1) == ALLOCATED_EXTENT))
+		reiser4_pos_hint(flush_pos)->blk =
+			extent_get_start(ext - 1) +
+			extent_get_width(ext - 1);
+	/*
+	 * allocate new block numbers for protected nodes
+	 */
+	allocate_blocks_unformatted(reiser4_pos_hint(flush_pos),
+				    protected,
+				    &first_allocated, &allocated,
+				    block_stage);
+
+	if (state == ALLOCATED_EXTENT)
+		/*
+		 * on relocating - free nodes which are going to be
+		 * relocated
+		 */
+		reiser4_dealloc_blocks(&start, &allocated,
+				       BLOCK_ALLOCATED, BA_DEFER);
+
+	/* assign new block numbers to protected nodes */
+	assign_real_blocknrs(flush_pos, oid, index, allocated, first_allocated);
+
+	/* prepare extent which will replace current one */
+	reiser4_set_extent(&replace_ext, first_allocated, allocated);
+
+	/* adjust extent item */
+	result = convert_extent(coord, &replace_ext);
+	if (result != 0 && result != -ENOMEM) {
+		warning("vs-1461",
+			"Failed to allocate extent. Should not happen\n");
+		*exit = 1;
+		return result;
+	}
+	/*
+	 * break flush: we prepared for flushing as many blocks as we
+	 * were asked for
+	 */
+	if (flush_pos->nr_to_write == allocated)
+		flush_pos->state = POS_INVALID;
+	return 0;
+}
+
+static squeeze_result squeeze_relocate_unformatted(znode *left,
+						   const coord_t *coord,
+						   flush_pos_t *flush_pos,
+						   reiser4_key *key,
+						   reiser4_key *stop_key)
+{
+	int result;
+	reiser4_extent *ext;
+	__u64 index;
+	__u64 width;
+	reiser4_block_nr start;
+	extent_state state;
+	oid_t oid;
+	reiser4_block_nr first_allocated;
+	__u64 allocated;
+	__u64 protected;
+	reiser4_extent copy_extent;
+	block_stage_t block_stage;
+
+	assert("edward-1610", flush_pos->pos_in_unit == 0);
+	assert("edward-1611", coord_is_leftmost_unit(coord));
+	assert("edward-1612", item_is_extent(coord));
+
+	ext = extent_by_coord(coord);
+	index = extent_unit_index(coord);
+	start = extent_get_start(ext);
+	width = extent_get_width(ext);
+	state = state_of_extent(ext);
+	unit_key_by_coord(coord, key);
+	oid = get_key_objectid(key);
+
+	assert("edward-1613", state != HOLE_EXTENT);
+
+	if (state == ALLOCATED_EXTENT) {
+		/*
+		 * all protected nodes are not flushprepped,
+		 * therefore they are counted as flush_reserved
+		 */
+		block_stage = BLOCK_FLUSH_RESERVED;
+		protected = allocated_extent_slum_size(flush_pos, oid,
+						       index, width);
+		if (protected == 0) {
+			flush_pos->state = POS_INVALID;
+			flush_pos->pos_in_unit = 0;
+			return 0;
+		}
+	} else {
+		block_stage = BLOCK_UNALLOCATED;
+		protected = width;
+	}
+	/*
+	 * look at previous unit if possible. If it is allocated, make
+	 * preceder more precise
+	 */
+	if (coord->unit_pos &&
+	    (state_of_extent(ext - 1) == ALLOCATED_EXTENT))
+		reiser4_pos_hint(flush_pos)->blk =
+			extent_get_start(ext - 1) +
+			extent_get_width(ext - 1);
+	/*
+	 * allocate new block numbers for protected nodes
+	 */
+	allocate_blocks_unformatted(reiser4_pos_hint(flush_pos),
+				    protected,
+				    &first_allocated, &allocated,
+				    block_stage);
+	/*
+	 * prepare extent which will be copied to left
+	 */
+	reiser4_set_extent(&copy_extent, first_allocated, allocated);
+	result = put_unit_to_end(left, key, &copy_extent);
+
+	if (result == -E_NODE_FULL) {
+		int target_block_stage;
+		/*
+		 * free blocks which were just allocated
+		 */
+		target_block_stage =
+			(state ==
+			 ALLOCATED_EXTENT) ? BLOCK_FLUSH_RESERVED :
+			BLOCK_UNALLOCATED;
+		reiser4_dealloc_blocks(&first_allocated, &allocated,
+				       target_block_stage,
+				       BA_PERMANENT);
+		/*
+		 * rewind the preceder
+		 */
+		flush_pos->preceder.blk = first_allocated;
+		check_preceder(flush_pos->preceder.blk);
+		return SQUEEZE_TARGET_FULL;
+	}
+	if (state == ALLOCATED_EXTENT) {
+		/*
+		 * free nodes which were relocated
+		 */
+		reiser4_dealloc_blocks(&start, &allocated,
+				       BLOCK_ALLOCATED, BA_DEFER);
+	}
+	/*
+	 * assign new block numbers to protected nodes
+	 */
+	assign_real_blocknrs(flush_pos, oid, index, allocated,
+			     first_allocated);
+	set_key_offset(key,
+		       get_key_offset(key) +
+		       (allocated << current_blocksize_bits));
+	return SQUEEZE_CONTINUE;
+}
+
+/**
+ * forward_overwrite_unformatted - put bunch of jnodes to overwrite set
+ * @flush_pos: flush position
+ * @oid: objectid of file jnodes belong to
+ * @index: starting index
+ * @width: extent width
+ *
+ * Puts nodes of one extent (file objectid @oid, extent width @width) to atom's
+ * overwrite set. Starting from the one with index @index. If end of slum is
+ * detected (node is not found or flushprepped) - stop iterating and set flush
+ * position's state to POS_INVALID.
+ */
+static void forward_overwrite_unformatted(flush_pos_t *flush_pos, oid_t oid,
+					  unsigned long index,
+					  reiser4_block_nr width)
+{
+	unsigned long i;
+	reiser4_tree *tree;
+	jnode *node;
+	txn_atom *atom;
+	LIST_HEAD(jnodes);
+
+	tree = current_tree;
+
+	atom = atom_locked_by_fq(reiser4_pos_fq(flush_pos));
+	assert("vs-1478", atom);
+
+	for (i = flush_pos->pos_in_unit; i < width; i++, index++) {
+		node = jlookup(tree, oid, index);
+		if (!node) {
+			flush_pos->state = POS_INVALID;
+			break;
+		}
+		if (jnode_check_flushprepped(node)) {
+			flush_pos->state = POS_INVALID;
+			atomic_dec(&node->x_count);
+			break;
+		}
+		if (node->atom != atom) {
+			flush_pos->state = POS_INVALID;
+			atomic_dec(&node->x_count);
+			break;
+		}
+		mark_jnode_overwrite(&jnodes, node);
+		atomic_dec(&node->x_count);
+	}
+
+	list_splice_init(&jnodes, ATOM_OVRWR_LIST(atom)->prev);
+	spin_unlock_atom(atom);
+}
+
+static squeeze_result squeeze_overwrite_unformatted(znode *left,
+						    const coord_t *coord,
+						    flush_pos_t *flush_pos,
+						    reiser4_key *key,
+						    reiser4_key *stop_key)
+{
+	int result;
+	reiser4_extent *ext;
+	__u64 index;
+	__u64 width;
+	reiser4_block_nr start;
+	extent_state state;
+	oid_t oid;
+	reiser4_extent copy_extent;
+
+	assert("vs-1457", flush_pos->pos_in_unit == 0);
+	assert("vs-1467", coord_is_leftmost_unit(coord));
+	assert("vs-1467", item_is_extent(coord));
+
+	ext = extent_by_coord(coord);
+	index = extent_unit_index(coord);
+	start = extent_get_start(ext);
+	width = extent_get_width(ext);
+	state = state_of_extent(ext);
+	unit_key_by_coord(coord, key);
+	oid = get_key_objectid(key);
+	/*
+	 * try to copy unit as it is to left neighbor
+	 * and make all first not flushprepped nodes
+	 * overwrite nodes
+	 */
+	reiser4_set_extent(&copy_extent, start, width);
+
+	result = put_unit_to_end(left, key, &copy_extent);
+	if (result == -E_NODE_FULL)
+		return SQUEEZE_TARGET_FULL;
+
+	if (state != HOLE_EXTENT)
+		forward_overwrite_unformatted(flush_pos, oid, index, width);
+
+	set_key_offset(key,
+		      get_key_offset(key) + (width << current_blocksize_bits));
+	return SQUEEZE_CONTINUE;
+}
+
+/************************ HYBRID TRANSACTION MODEL ****************************/
+
+/**
+ * This is the default transaction model suggested by Josh MacDonald and
+ * Hans Reiser. This was the single hardcoded transaction mode till Feb 2014
+ * when Edward introduced pure Journalling and pure Write-Anywhere.
+ *
+ * In this mode all relocate-overwrite decisions are result of attempts to
+ * defragment atom's locality.
+ */
+
+/* REVERSE PARENT-FIRST RELOCATION POLICIES */
+
+/* This implements the is-it-close-enough-to-its-preceder? test for relocation
+   in the reverse parent-first relocate context. Here all we know is the
+   preceder and the block number. Since we are going in reverse, the preceder
+   may still be relocated as well, so we can't ask the block allocator "is there
+   a closer block available to relocate?" here. In the _forward_ parent-first
+   relocate context (not here) we actually call the block allocator to try and
+   find a closer location.
+*/
+static int reverse_try_defragment_if_close(const reiser4_block_nr * pblk,
+					   const reiser4_block_nr * nblk)
+{
+	reiser4_block_nr dist;
+
+	assert("jmacd-7710", *pblk != 0 && *nblk != 0);
+	assert("jmacd-7711", !reiser4_blocknr_is_fake(pblk));
+	assert("jmacd-7712", !reiser4_blocknr_is_fake(nblk));
+
+	/* Distance is the absolute value. */
+	dist = (*pblk > *nblk) ? (*pblk - *nblk) : (*nblk - *pblk);
+
+	/* If the block is less than FLUSH_RELOCATE_DISTANCE blocks away from
+	   its preceder block, do not relocate. */
+	if (dist <= get_current_super_private()->flush.relocate_distance)
+		return 0;
+
+	return 1;
+}
+
+/**
+ * This function is a predicate that tests for relocation. Always called in the
+ * reverse-parent-first context, when we are asking whether the current node
+ * should be relocated in order to expand the flush by dirtying the parent level
+ * (and thus proceeding to flush that level). When traversing in the forward
+ * parent-first direction (not here), relocation decisions are handled in two
+ * places: allocate_znode() and extent_needs_allocation().
+ */
+static int reverse_alloc_formatted_hybrid(jnode * node,
+					  const coord_t *parent_coord,
+					  flush_pos_t *pos)
+{
+	reiser4_block_nr pblk = 0;
+	reiser4_block_nr nblk = 0;
+
+	assert("jmacd-8989", !jnode_is_root(node));
+	/*
+	 * This function is called only from the
+	 * reverse_relocate_check_dirty_parent() and only if the parent
+	 * node is clean. This implies that the parent has the real (i.e., not
+	 * fake) block number, and, so does the child, because otherwise the
+	 * parent would be dirty.
+	 */
+
+	/* New nodes are treated as if they are being relocated. */
+	if (JF_ISSET(node, JNODE_CREATED) ||
+	    (pos->leaf_relocate && jnode_get_level(node) == LEAF_LEVEL))
+		return 1;
+
+	/* Find the preceder. FIXME(B): When the child is an unformatted,
+	   previously existing node, the coord may be leftmost even though the
+	   child is not the parent-first preceder of the parent. If the first
+	   dirty node appears somewhere in the middle of the first extent unit,
+	   this preceder calculation is wrong.
+	   Needs more logic in here. */
+	if (coord_is_leftmost_unit(parent_coord)) {
+		pblk = *znode_get_block(parent_coord->node);
+	} else {
+		pblk = pos->preceder.blk;
+	}
+	check_preceder(pblk);
+
+	/* If (pblk == 0) then the preceder isn't allocated or isn't known:
+	   relocate. */
+	if (pblk == 0)
+		return 1;
+
+	nblk = *jnode_get_block(node);
+
+	if (reiser4_blocknr_is_fake(&nblk))
+		/* child is unallocated, mark parent dirty */
+		return 1;
+
+	return reverse_try_defragment_if_close(&pblk, &nblk);
+}
+
+/**
+ * A subroutine of forward_alloc_formatted_hybrid(), this is called first to see
+ * if there is a close position to relocate to. It may return ENOSPC if there is
+ * no close position. If there is no close position it may not relocate. This
+ * takes care of updating the parent node with the relocated block address.
+ *
+ * was allocate_znode_update()
+ */
+static int forward_try_defragment_locality(znode * node,
+					   const coord_t *parent_coord,
+					   flush_pos_t *pos)
+{
+	int ret;
+	reiser4_block_nr blk;
+	lock_handle uber_lock;
+	int flush_reserved_used = 0;
+	int grabbed;
+	reiser4_context *ctx;
+	reiser4_super_info_data *sbinfo;
+
+	init_lh(&uber_lock);
+
+	ctx = get_current_context();
+	sbinfo = get_super_private(ctx->super);
+
+	grabbed = ctx->grabbed_blocks;
+
+	ret = zload(node);
+	if (ret)
+		return ret;
+
+	if (ZF_ISSET(node, JNODE_CREATED)) {
+		assert("zam-816", reiser4_blocknr_is_fake(znode_get_block(node)));
+		pos->preceder.block_stage = BLOCK_UNALLOCATED;
+	} else {
+		pos->preceder.block_stage = BLOCK_GRABBED;
+
+		/* The disk space for relocating the @node is already reserved
+		 * in "flush reserved" counter if @node is leaf, otherwise we
+		 * grab space using BA_RESERVED (means grab space from whole
+		 * disk not from only 95%). */
+		if (znode_get_level(node) == LEAF_LEVEL) {
+			/*
+			 * earlier (during do_jnode_make_dirty()) we decided
+			 * that @node can possibly go into overwrite set and
+			 * reserved block for its wandering location.
+			 */
+			txn_atom *atom = get_current_atom_locked();
+			assert("nikita-3449",
+			       ZF_ISSET(node, JNODE_FLUSH_RESERVED));
+			flush_reserved2grabbed(atom, (__u64) 1);
+			spin_unlock_atom(atom);
+			/*
+			 * we are trying to move node into relocate
+			 * set. Allocation of relocated position "uses"
+			 * reserved block.
+			 */
+			ZF_CLR(node, JNODE_FLUSH_RESERVED);
+			flush_reserved_used = 1;
+		} else {
+			ret = reiser4_grab_space_force((__u64) 1, BA_RESERVED);
+			if (ret != 0)
+				goto exit;
+		}
+	}
+
+	/* We may do not use 5% of reserved disk space here and flush will not
+	   pack tightly. */
+	ret = reiser4_alloc_block(&pos->preceder, &blk,
+				  BA_FORMATTED | BA_PERMANENT);
+	if (ret)
+		goto exit;
+
+	if (!ZF_ISSET(node, JNODE_CREATED) &&
+	    (ret = reiser4_dealloc_block(znode_get_block(node), 0,
+					 BA_DEFER | BA_FORMATTED)))
+		goto exit;
+
+	if (likely(!znode_is_root(node))) {
+		item_plugin *iplug;
+
+		iplug = item_plugin_by_coord(parent_coord);
+		assert("nikita-2954", iplug->f.update != NULL);
+		iplug->f.update(parent_coord, &blk);
+
+		znode_make_dirty(parent_coord->node);
+
+	} else {
+		reiser4_tree *tree = znode_get_tree(node);
+		znode *uber;
+
+		/* We take a longterm lock on the fake node in order to change
+		   the root block number.  This may cause atom fusion. */
+		ret = get_uber_znode(tree, ZNODE_WRITE_LOCK, ZNODE_LOCK_HIPRI,
+				     &uber_lock);
+		/* The fake node cannot be deleted, and we must have priority
+		   here, and may not be confused with ENOSPC. */
+		assert("jmacd-74412",
+		       ret != -EINVAL && ret != -E_DEADLOCK && ret != -ENOSPC);
+
+		if (ret)
+			goto exit;
+
+		uber = uber_lock.node;
+
+		write_lock_tree(tree);
+		tree->root_block = blk;
+		write_unlock_tree(tree);
+
+		znode_make_dirty(uber);
+	}
+	ret = znode_rehash(node, &blk);
+exit:
+	if (ret) {
+		/* Get flush reserved block back if something fails, because
+		 * callers assume that on error block wasn't relocated and its
+		 * flush reserved block wasn't used. */
+		if (flush_reserved_used) {
+			/*
+			 * ok, we failed to move node into relocate
+			 * set. Restore status quo.
+			 */
+			grabbed2flush_reserved((__u64) 1);
+			ZF_SET(node, JNODE_FLUSH_RESERVED);
+		}
+	}
+	zrelse(node);
+	done_lh(&uber_lock);
+	grabbed2free_mark(grabbed);
+	return ret;
+}
+
+/*
+ * Make the final relocate/wander decision during
+ * forward parent-first squalloc for a formatted node
+ */
+static int forward_alloc_formatted_hybrid(znode * node,
+					  const coord_t *parent_coord,
+					  flush_pos_t *pos)
+{
+	int ret;
+	reiser4_super_info_data *sbinfo = get_current_super_private();
+	/**
+ 	 * FIXME(D): We have the node write-locked and should have checked for !
+	 * allocated() somewhere before reaching this point, but there can be a
+	 * race, so this assertion is bogus.
+	 */
+	assert("edward-1614", znode_is_loaded(node));
+	assert("jmacd-7987", !jnode_check_flushprepped(ZJNODE(node)));
+	assert("jmacd-7988", znode_is_write_locked(node));
+	assert("jmacd-7989", coord_is_invalid(parent_coord)
+	       || znode_is_write_locked(parent_coord->node));
+
+	if (ZF_ISSET(node, JNODE_REPACK) || ZF_ISSET(node, JNODE_CREATED) ||
+	    znode_is_root(node) ||
+	    /*
+	     * We have enough nodes to relocate no matter what.
+	     */
+	    (pos->leaf_relocate != 0 && znode_get_level(node) == LEAF_LEVEL)) {
+		/*
+		 * No need to decide with new nodes, they are treated the same
+		 * as relocate. If the root node is dirty, relocate.
+		 */
+		if (pos->preceder.blk == 0) {
+			/*
+			 * preceder is unknown and we have decided to relocate
+			 * node -- using of default value for search start is
+			 * better than search from block #0.
+			 */
+			get_blocknr_hint_default(&pos->preceder.blk);
+			check_preceder(pos->preceder.blk);
+		}
+		goto best_reloc;
+
+	} else if (pos->preceder.blk == 0) {
+		/* If we don't know the preceder, leave it where it is. */
+		jnode_make_wander(ZJNODE(node));
+	} else {
+		/* Make a decision based on block distance. */
+		reiser4_block_nr dist;
+		reiser4_block_nr nblk = *znode_get_block(node);
+
+		assert("jmacd-6172", !reiser4_blocknr_is_fake(&nblk));
+		assert("jmacd-6173", !reiser4_blocknr_is_fake(&pos->preceder.blk));
+		assert("jmacd-6174", pos->preceder.blk != 0);
+
+		if (pos->preceder.blk == nblk - 1) {
+			/* Ideal. */
+			jnode_make_wander(ZJNODE(node));
+		} else {
+
+			dist =
+			    (nblk <
+			     pos->preceder.blk) ? (pos->preceder.blk -
+						   nblk) : (nblk -
+							    pos->preceder.blk);
+
+			/* See if we can find a closer block
+			   (forward direction only). */
+			pos->preceder.max_dist =
+			    min((reiser4_block_nr) sbinfo->flush.
+				relocate_distance, dist);
+			pos->preceder.level = znode_get_level(node);
+
+			ret = forward_try_defragment_locality(node,
+							      parent_coord,
+							      pos);
+			pos->preceder.max_dist = 0;
+
+			if (ret && (ret != -ENOSPC))
+				return ret;
+
+			if (ret == 0) {
+				/* Got a better allocation. */
+				znode_make_reloc(node, pos->fq);
+			} else if (dist < sbinfo->flush.relocate_distance) {
+				/* The present allocation is good enough. */
+				jnode_make_wander(ZJNODE(node));
+			} else {
+				/*
+				 * Otherwise, try to relocate to the best
+				 * position.
+				 */
+			best_reloc:
+				ret = forward_try_defragment_locality(node,
+								      parent_coord,
+								      pos);
+				if (ret != 0)
+					return ret;
+				/*
+				 * set JNODE_RELOC bit _after_ node gets
+				 * allocated
+				 */
+				znode_make_reloc(node, pos->fq);
+			}
+		}
+	}
+	/*
+	 * This is the new preceder
+	 */
+	pos->preceder.blk = *znode_get_block(node);
+	check_preceder(pos->preceder.blk);
+	pos->alloc_cnt += 1;
+
+	assert("jmacd-4277", !reiser4_blocknr_is_fake(&pos->preceder.blk));
+
+	return 0;
+}
+
+static int forward_alloc_unformatted_hybrid(flush_pos_t *flush_pos)
+{
+	coord_t *coord;
+	reiser4_extent *ext;
+	oid_t oid;
+	__u64 index;
+	__u64 width;
+	extent_state state;
+	reiser4_key key;
+
+	assert("vs-1468", flush_pos->state == POS_ON_EPOINT);
+	assert("vs-1469", coord_is_existing_unit(&flush_pos->coord)
+	       && item_is_extent(&flush_pos->coord));
+
+	coord = &flush_pos->coord;
+
+	ext = extent_by_coord(coord);
+	state = state_of_extent(ext);
+	if (state == HOLE_EXTENT) {
+		flush_pos->state = POS_INVALID;
+		return 0;
+	}
+	item_key_by_coord(coord, &key);
+	oid = get_key_objectid(&key);
+	index = extent_unit_index(coord) + flush_pos->pos_in_unit;
+	width = extent_get_width(ext);
+
+	assert("vs-1457", width > flush_pos->pos_in_unit);
+
+	if (flush_pos->leaf_relocate || state == UNALLOCATED_EXTENT) {
+		int exit;
+		int result;
+		result = forward_relocate_unformatted(flush_pos, ext, state,
+						      oid,
+						      index, width, &exit);
+		if (exit)
+			return result;
+	} else
+		forward_overwrite_unformatted(flush_pos, oid, index, width);
+
+	flush_pos->pos_in_unit = 0;
+	return 0;
+}
+
+static squeeze_result squeeze_alloc_unformatted_hybrid(znode *left,
+						       const coord_t *coord,
+						       flush_pos_t *flush_pos,
+						       reiser4_key *stop_key)
+{
+	squeeze_result ret;
+	reiser4_key key;
+	reiser4_extent *ext;
+	extent_state state;
+
+	ext = extent_by_coord(coord);
+	state = state_of_extent(ext);
+
+	if ((flush_pos->leaf_relocate && state == ALLOCATED_EXTENT) ||
+	    (state == UNALLOCATED_EXTENT))
+		/*
+		 * relocate
+		 */
+		ret = squeeze_relocate_unformatted(left, coord,
+						   flush_pos, &key, stop_key);
+	else
+		/*
+		 * (state == ALLOCATED_EXTENT && !flush_pos->leaf_relocate) ||
+		 *  state == HOLE_EXTENT - overwrite
+		 */
+		ret = squeeze_overwrite_unformatted(left, coord,
+						    flush_pos, &key, stop_key);
+	if (ret == SQUEEZE_CONTINUE)
+		*stop_key = key;
+	return ret;
+}
+
+/*********************** JOURNAL TRANSACTION MODEL ****************************/
+
+static int forward_alloc_formatted_journal(znode * node,
+					   const coord_t *parent_coord,
+					   flush_pos_t *pos)
+{
+	int ret;
+
+	if (ZF_ISSET(node, JNODE_CREATED)) {
+		if (pos->preceder.blk == 0) {
+			/*
+			 * preceder is unknown and we have decided to relocate
+			 * node -- using of default value for search start is
+			 * better than search from block #0.
+			 */
+			get_blocknr_hint_default(&pos->preceder.blk);
+			check_preceder(pos->preceder.blk);
+		}
+		ret = forward_try_defragment_locality(node,
+						      parent_coord,
+						      pos);
+		if (ret != 0) {
+			warning("edward-1615",
+				"forward defrag failed (%d)", ret);
+			return ret;
+		}
+		/*
+		 * set JNODE_RELOC bit _after_ node gets
+		 * allocated
+		 */
+		znode_make_reloc(node, pos->fq);
+	}
+	else
+		jnode_make_wander(ZJNODE(node));
+	/*
+	 * This is the new preceder
+	 */
+	pos->preceder.blk = *znode_get_block(node);
+	check_preceder(pos->preceder.blk);
+	pos->alloc_cnt += 1;
+
+	assert("edward-1616", !reiser4_blocknr_is_fake(&pos->preceder.blk));
+	return 0;
+}
+
+static int forward_alloc_unformatted_journal(flush_pos_t *flush_pos)
+{
+
+	coord_t *coord;
+	reiser4_extent *ext;
+	oid_t oid;
+	__u64 index;
+	__u64 width;
+	extent_state state;
+	reiser4_key key;
+
+	assert("edward-1617", flush_pos->state == POS_ON_EPOINT);
+	assert("edward-1618", coord_is_existing_unit(&flush_pos->coord)
+	       && item_is_extent(&flush_pos->coord));
+
+	coord = &flush_pos->coord;
+
+	ext = extent_by_coord(coord);
+	state = state_of_extent(ext);
+	if (state == HOLE_EXTENT) {
+		flush_pos->state = POS_INVALID;
+		return 0;
+	}
+	item_key_by_coord(coord, &key);
+	oid = get_key_objectid(&key);
+	index = extent_unit_index(coord) + flush_pos->pos_in_unit;
+	width = extent_get_width(ext);
+
+	assert("edward-1619", width > flush_pos->pos_in_unit);
+
+	if (state == UNALLOCATED_EXTENT) {
+		int exit;
+		int result;
+		result = forward_relocate_unformatted(flush_pos, ext, state,
+						      oid,
+						      index, width, &exit);
+		if (exit)
+			return result;
+	}
+	else
+		/*
+		 * state == ALLOCATED_EXTENT
+		 * keep old allocation
+		 */
+		forward_overwrite_unformatted(flush_pos, oid, index, width);
+
+	flush_pos->pos_in_unit = 0;
+	return 0;
+}
+
+static squeeze_result squeeze_alloc_unformatted_journal(znode *left,
+							const coord_t *coord,
+							flush_pos_t *flush_pos,
+							reiser4_key *stop_key)
+{
+	squeeze_result ret;
+	reiser4_key key;
+	reiser4_extent *ext;
+	extent_state state;
+
+	ext = extent_by_coord(coord);
+	state = state_of_extent(ext);
+
+	if (state == UNALLOCATED_EXTENT)
+		ret = squeeze_relocate_unformatted(left, coord,
+						   flush_pos, &key, stop_key);
+	else
+		/*
+		 * state == ALLOCATED_EXTENT || state == HOLE_EXTENT
+		 */
+		ret = squeeze_overwrite_unformatted(left, coord,
+						    flush_pos, &key, stop_key);
+	if (ret == SQUEEZE_CONTINUE)
+		*stop_key = key;
+	return ret;
+}
+
+/**********************  WA (Write-Anywhere) TRANSACTION MODEL  ***************/
+
+static int forward_alloc_formatted_wa(znode * node,
+				      const coord_t *parent_coord,
+				      flush_pos_t *pos)
+{
+	int ret;
+
+	assert("edward-1620", znode_is_loaded(node));
+	assert("edward-1621", !jnode_check_flushprepped(ZJNODE(node)));
+	assert("edward-1622", znode_is_write_locked(node));
+	assert("edward-1623", coord_is_invalid(parent_coord)
+	       || znode_is_write_locked(parent_coord->node));
+
+	if (pos->preceder.blk == 0) {
+		/*
+		 * preceder is unknown and we have decided to relocate
+		 * node -- using of default value for search start is
+		 * better than search from block #0.
+		 */
+		get_blocknr_hint_default(&pos->preceder.blk);
+		check_preceder(pos->preceder.blk);
+	}
+	ret = forward_try_defragment_locality(node, parent_coord, pos);
+	if (ret && (ret != -ENOSPC)) {
+		warning("edward-1624",
+			"forward defrag failed (%d)", ret);
+		return ret;
+	}
+	if (ret == 0)
+		znode_make_reloc(node, pos->fq);
+	else {
+		ret = forward_try_defragment_locality(node, parent_coord, pos);
+		if (ret) {
+			warning("edward-1625",
+				"forward defrag failed (%d)", ret);
+			return ret;
+		}
+		/* set JNODE_RELOC bit _after_ node gets allocated */
+		znode_make_reloc(node, pos->fq);
+	}
+	/*
+	 * This is the new preceder
+	 */
+	pos->preceder.blk = *znode_get_block(node);
+	check_preceder(pos->preceder.blk);
+	pos->alloc_cnt += 1;
+
+	assert("edward-1626", !reiser4_blocknr_is_fake(&pos->preceder.blk));
+	return 0;
+}
+
+static int forward_alloc_unformatted_wa(flush_pos_t *flush_pos)
+{
+	int exit;
+	int result;
+
+	coord_t *coord;
+	reiser4_extent *ext;
+	oid_t oid;
+	__u64 index;
+	__u64 width;
+	extent_state state;
+	reiser4_key key;
+
+	assert("edward-1627", flush_pos->state == POS_ON_EPOINT);
+	assert("edward-1628", coord_is_existing_unit(&flush_pos->coord)
+	       && item_is_extent(&flush_pos->coord));
+
+	coord = &flush_pos->coord;
+
+	ext = extent_by_coord(coord);
+	state = state_of_extent(ext);
+	if (state == HOLE_EXTENT) {
+		flush_pos->state = POS_INVALID;
+		return 0;
+	}
+
+	item_key_by_coord(coord, &key);
+	oid = get_key_objectid(&key);
+	index = extent_unit_index(coord) + flush_pos->pos_in_unit;
+	width = extent_get_width(ext);
+
+	assert("edward-1629", width > flush_pos->pos_in_unit);
+	assert("edward-1630",
+	       state == ALLOCATED_EXTENT || state == UNALLOCATED_EXTENT);
+	/*
+	 * always relocate
+	 */
+	result = forward_relocate_unformatted(flush_pos, ext, state, oid,
+					      index, width, &exit);
+	if (exit)
+		return result;
+	flush_pos->pos_in_unit = 0;
+	return 0;
+}
+
+static squeeze_result squeeze_alloc_unformatted_wa(znode *left,
+						   const coord_t *coord,
+						   flush_pos_t *flush_pos,
+						   reiser4_key *stop_key)
+{
+	squeeze_result ret;
+	reiser4_key key;
+	reiser4_extent *ext;
+	extent_state state;
+
+	ext = extent_by_coord(coord);
+	state = state_of_extent(ext);
+
+	if (state == HOLE_EXTENT)
+		/*
+		 * hole extents are handled in squeeze_overwrite
+		 */
+		ret = squeeze_overwrite_unformatted(left, coord,
+						    flush_pos, &key, stop_key);
+	else
+		ret = squeeze_relocate_unformatted(left, coord,
+						   flush_pos, &key, stop_key);
+	if (ret == SQUEEZE_CONTINUE)
+		*stop_key = key;
+	return ret;
+}
+
+/******************************************************************************/
+
+txmod_plugin txmod_plugins[LAST_TXMOD_ID] = {
+	[HYBRID_TXMOD_ID] = {
+		.h = {
+			.type_id = REISER4_TXMOD_PLUGIN_TYPE,
+			.id = HYBRID_TXMOD_ID,
+			.pops = NULL,
+			.label = "hybrid",
+			.desc =	"Hybrid Transaction Model",
+			.linkage = {NULL, NULL}
+		},
+		.forward_alloc_formatted = forward_alloc_formatted_hybrid,
+		.reverse_alloc_formatted = reverse_alloc_formatted_hybrid,
+		.forward_alloc_unformatted = forward_alloc_unformatted_hybrid,
+		.squeeze_alloc_unformatted = squeeze_alloc_unformatted_hybrid
+	},
+	[JOURNAL_TXMOD_ID] = {
+		.h = {
+			.type_id = REISER4_TXMOD_PLUGIN_TYPE,
+			.id = JOURNAL_TXMOD_ID,
+			.pops = NULL,
+			.label = "journal",
+			.desc = "Journalling Transaction Model",
+			.linkage = {NULL, NULL}
+		},
+		.forward_alloc_formatted = forward_alloc_formatted_journal,
+		.reverse_alloc_formatted = NULL,
+		.forward_alloc_unformatted = forward_alloc_unformatted_journal,
+		.squeeze_alloc_unformatted = squeeze_alloc_unformatted_journal
+	},
+	[WA_TXMOD_ID] = {
+		.h = {
+			.type_id = REISER4_TXMOD_PLUGIN_TYPE,
+			.id = WA_TXMOD_ID,
+			.pops = NULL,
+			.label = "wa",
+			.desc =	"Write-Anywhere Transaction Model",
+			.linkage = {NULL, NULL}
+		},
+		.forward_alloc_formatted = forward_alloc_formatted_wa,
+		.reverse_alloc_formatted = NULL,
+		.forward_alloc_unformatted = forward_alloc_unformatted_wa,
+		.squeeze_alloc_unformatted = squeeze_alloc_unformatted_wa
+	}
+};
+
+/*
+ * Local variables:
+ * c-indentation-style: "K&R"
+ * mode-name: "LC"
+ * c-basic-offset: 8
+ * tab-width: 8
+ * fill-column: 79
+ * End:
+ */
--- linux-3.13.orig/fs/reiser4/block_alloc.c
+++ linux-3.13/fs/reiser4/block_alloc.c
@@ -723,6 +723,29 @@ reiser4_alloc_blocks(reiser4_blocknr_hin
 	return ret;
 }
 
+/**
+ * ask block allocator for some unformatted blocks
+ */
+void allocate_blocks_unformatted(reiser4_blocknr_hint *preceder,
+				 reiser4_block_nr wanted_count,
+				 reiser4_block_nr *first_allocated,
+				 reiser4_block_nr *allocated,
+				 block_stage_t block_stage)
+{
+	*allocated = wanted_count;
+	preceder->max_dist = 0;	/* scan whole disk, if needed */
+
+	/* that number of blocks (wanted_count) is either in UNALLOCATED or in GRABBED */
+	preceder->block_stage = block_stage;
+
+	/* FIXME: we do not handle errors here now */
+	check_me("vs-420",
+		 reiser4_alloc_blocks(preceder, first_allocated, allocated,
+				      BA_PERMANENT) == 0);
+	/* update flush_pos's preceder to last allocated block number */
+	preceder->blk = *first_allocated + *allocated - 1;
+}
+
 /* used -> fake_allocated -> grabbed -> free */
 
 /* adjust sb block counters when @count unallocated blocks get unmapped from
--- linux-3.13.orig/fs/reiser4/Makefile
+++ linux-3.13/fs/reiser4/Makefile
@@ -52,6 +52,7 @@ reiser4-y := \
 		   plugin/node/node.o \
 		   plugin/object.o \
 		   plugin/cluster.o \
+		   plugin/txmod.o \
 		   plugin/inode_ops.o \
 		   plugin/inode_ops_rename.o \
 		   plugin/file_ops.o \
--- linux-3.13.orig/fs/reiser4/plugin/plugin.c
+++ linux-3.13/fs/reiser4/plugin/plugin.c
@@ -546,6 +546,15 @@ struct reiser4_plugin_type_data plugins[
 		.builtin = cluster_plugins,
 		.plugins_list = {NULL, NULL},
 		.size = sizeof(cluster_plugin)
+	},
+	[REISER4_TXMOD_PLUGIN_TYPE] = {
+		.type_id = REISER4_TXMOD_PLUGIN_TYPE,
+		.label = "txmod",
+		.desc = "Defines transaction model",
+		.builtin_num = sizeof_array(txmod_plugins),
+		.builtin = txmod_plugins,
+		.plugins_list = {NULL, NULL},
+		.size = sizeof(txmod_plugin)
 	}
 };
 
--- linux-3.13.orig/fs/reiser4/super_ops.c
+++ linux-3.13/fs/reiser4/super_ops.c
@@ -565,6 +565,8 @@ static int fill_super(struct super_block
 					   sbinfo->debugfs_root,
 					   &sbinfo->tmgr.id_count);
 	}
+	printk("reiser4: %s: using %s.\n", super->s_id,
+	       txmod_plugin_by_id(sbinfo->txmod)->h.desc);
 	return 0;
 
  failed_update_format_version:

--------------080708020803080109080004--
