From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 21/8] partial flush.c cleanup
Date: Tue, 23 Oct 2007 19:26:56 +0200
Message-ID: <1193160416.6236.103.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-2t7guL+HG1LPlY3yTVig"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-2t7guL+HG1LPlY3yTVig
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Got it from 
total: 73 errors, 558 warnings, 3625 lines checked
to
total: 2 errors, 212 warnings, 3673 lines checked

All of these warnings are 80chars in comments and explanations at the
beggining of the file.



--=-2t7guL+HG1LPlY3yTVig
Content-Disposition: attachment; filename=flush.c.patch
Content-Type: text/x-patch; name=flush.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- flush.c.orig	2007-10-23 17:17:01.000000000 +0200
+++ flush.c	2007-10-23 19:21:03.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 /* The design document for this file is at http://www.namesys.com/v4/v4.html. */
 
@@ -36,97 +37,104 @@
 
 /* IMPLEMENTATION NOTES */
 
-/* PARENT-FIRST: Some terminology: A parent-first traversal is a way of assigning a total
-   order to the nodes of the tree in which the parent is placed before its children, which
-   are ordered (recursively) in left-to-right order.  When we speak of a "parent-first preceder", it
-   describes the node that "came before in forward parent-first order".  When we speak of a
-   "parent-first follower", it describes the node that "comes next in parent-first
-   order" (alternatively the node that "came before in reverse parent-first order").
+/* PARENT-FIRST: Some terminology: A parent-first traversal is a way of
+   assigning a total order to the nodes of the tree in which the parent is
+   placed before its children, which are ordered (recursively) in left-to-right
+   order. When we speak of a "parent-first preceder", it describes the node that
+   "came before in forward parent-first order". When we speak of a "parent-first
+   follower", it describes the node that "comes next in parent-first order"
+   (alternatively the node that "came before in reverse parent-first order").
 
-   The following pseudo-code prints the nodes of a tree in forward parent-first order:
+   The following pseudo-code prints the nodes of a tree in forward parent-first
+   order:
 
    void parent_first (node)
    {
      print_node (node);
      if (node->level > leaf) {
        for (i = 0; i < num_children; i += 1) {
-         parent_first (node->child[i]);
+	 parent_first (node->child[i]);
        }
      }
    }
 */
 
-/* JUST WHAT ARE WE TRYING TO OPTIMIZE, HERE?  The idea is to optimize block allocation so
-   that a left-to-right scan of the tree's data (i.e., the leaves in left-to-right order)
-   can be accomplished with sequential reads, which results in reading nodes in their
-   parent-first order.  This is a read-optimization aspect of the flush algorithm, and
-   there is also a write-optimization aspect, which is that we wish to make large
-   sequential writes to the disk by allocating or reallocating blocks so that they can be
-   written in sequence.  Sometimes the read-optimization and write-optimization goals
-   conflict with each other, as we discuss in more detail below.
+/* JUST WHAT ARE WE TRYING TO OPTIMIZE, HERE?  The idea is to optimize block
+   allocation so that a left-to-right scan of the tree's data (i.e., the leaves
+   in left-to-right order) can be accomplished with sequential reads, which
+   results in reading nodes in their parent-first order. This is a
+   read-optimization aspect of the flush algorithm, and there is also a
+   write-optimization aspect, which is that we wish to make large sequential
+   writes to the disk by allocating or reallocating blocks so that they can be
+   written in sequence. Sometimes the read-optimization and write-optimization
+   goals conflict with each other, as we discuss in more detail below.
 */
 
-/* STATE BITS: The flush code revolves around the state of the jnodes it covers.  Here are
-   the relevant jnode->state bits and their relevence to flush:
+/* STATE BITS: The flush code revolves around the state of the jnodes it covers.
+   Here are the relevant jnode->state bits and their relevence to flush:
 
-     JNODE_DIRTY: If a node is dirty, it must be flushed.  But in order to be written it
-     must be allocated first.  In order to be considered allocated, the jnode must have
-     exactly one of { JNODE_OVRWR, JNODE_RELOC } set.  These two bits are exclusive, and
-     all dirtied jnodes eventually have one of these bits set during each transaction.
-
-     JNODE_CREATED: The node was freshly created in its transaction and has no previous
-     block address, so it is unconditionally assigned to be relocated, although this is
-     mainly for code-convenience.  It is not being 'relocated' from anything, but in
-     almost every regard it is treated as part of the relocate set.  The JNODE_CREATED bit
-     remains set even after JNODE_RELOC is set, so the actual relocate can be
-     distinguished from the created-and-allocated set easily: relocate-set members
-     (belonging to the preserve-set) have (JNODE_RELOC) set and created-set members which
-     have no previous location to preserve have (JNODE_RELOC | JNODE_CREATED) set.
-
-     JNODE_OVRWR: The node belongs to atom's overwrite set. The flush algorithm made the
-     decision to maintain the pre-existing location for this node and it will be written
-     to the wandered-log.
-
-     JNODE_RELOC: The flush algorithm made the decision to relocate this block (if it was
-     not created, see note above).  A block with JNODE_RELOC set is eligible for
-     early-flushing and may be submitted during flush_empty_queues.  When the JNODE_RELOC
-     bit is set on a znode, the parent node's internal item is modified and the znode is
-     rehashed.
-
-     JNODE_SQUEEZABLE: Before shifting everything left, the flush algorithm scans the node
-     and calls plugin->f.squeeze() method for its items. By this technology we update disk
-     clusters of cryptcompress objects. Also if leftmost point that was found by flush scan
-     has this flag (races with write(), rare case) the flush algorythm makes the decision
-     to pass it to squalloc() in spite of its flushprepped status for squeezing, not for
+     JNODE_DIRTY: If a node is dirty, it must be flushed. But in order to be
+     written it must be allocated first. In order to be considered allocated,
+     the jnode must have exactly one of { JNODE_OVRWR, JNODE_RELOC } set. These
+     two bits are exclusive, and all dirtied jnodes eventually have one of these
+     bits set during each transaction.
+
+     JNODE_CREATED: The node was freshly created in its transaction and has no
+     previous block address, so it is unconditionally assigned to be relocated,
+     although this is mainly for code-convenience. It is not being 'relocated'
+     from anything, but in almost every regard it is treated as part of the
+     relocate set. The JNODE_CREATED bit remains set even after JNODE_RELOC is
+     set, so the actual relocate can be distinguished from the
+     created-and-allocated set easily: relocate-set members (belonging to the
+     preserve-set) have (JNODE_RELOC) set and created-set members which have no
+     previous location to preserve have (JNODE_RELOC | JNODE_CREATED) set.
+
+     JNODE_OVRWR: The node belongs to atom's overwrite set. The flush algorithm
+     made the decision to maintain the pre-existing location for this node and
+     it will be written to the wandered-log.
+
+     JNODE_RELOC: The flush algorithm made the decision to relocate this block
+     (if it was not created, see note above). A block with JNODE_RELOC set is
+     eligible for early-flushing and may be submitted during flush_empty_queues.
+     When the JNODE_RELOC bit is set on a znode, the parent node's internal item
+     is modified and the znode is rehashed.
+
+     JNODE_SQUEEZABLE: Before shifting everything left, the flush algorithm
+     scans the node and calls plugin->f.squeeze() method for its items. By this
+     technology we update disk clusters of cryptcompress objects. Also if
+     leftmost point that was found by flush scan has this flag (races with
+     write(), rare case) the flush algorythm makes the decision to pass it to
+     squalloc() in spite of its flushprepped status for squeezing, not for
      repeated allocation.
 
-     JNODE_FLUSH_QUEUED: This bit is set when a call to flush enters the jnode into its
-     flush queue.  This means the jnode is not on any clean or dirty list, instead it is
-     moved to one of the flush queue (see flush_queue.h) object private list. This
-     prevents multiple concurrent flushes from attempting to start flushing from the
-     same node.
+     JNODE_FLUSH_QUEUED: This bit is set when a call to flush enters the jnode
+     into its flush queue. This means the jnode is not on any clean or dirty
+     list, instead it is moved to one of the flush queue (see flush_queue.h)
+     object private list. This prevents multiple concurrent flushes from
+     attempting to start flushing from the same node.
 
      (DEAD STATE BIT) JNODE_FLUSH_BUSY: This bit was set during the bottom-up
-     squeeze-and-allocate on a node while its children are actively being squeezed and
-     allocated.  This flag was created to avoid submitting a write request for a node
-     while its children are still being allocated and squeezed. Then flush queue was
-     re-implemented to allow unlimited number of nodes be queued. This flag support was
-     commented out in source code because we decided that there was no reason to submit
-     queued nodes before jnode_flush() finishes.  However, current code calls fq_write()
-     during a slum traversal and may submit "busy nodes" to disk. Probably we can
+     squeeze-and-allocate on a node while its children are actively being
+     squeezed and allocated. This flag was created to avoid submitting a write
+     request for a node while its children are still being allocated and
+     squeezed. Then flush queue was re-implemented to allow unlimited number of
+     nodes be queued. This flag support was commented out in source code because
+     we decided that there was no reason to submit queued nodes before
+     jnode_flush() finishes.  However, current code calls fq_write() during a
+     slum traversal and may submit "busy nodes" to disk. Probably we can
      re-enable the JNODE_FLUSH_BUSY bit support in future.
 
    With these state bits, we describe a test used frequently in the code below,
-   jnode_is_flushprepped() (and the spin-lock-taking jnode_check_flushprepped()).  The
-   test for "flushprepped" returns true if any of the following are true:
+   jnode_is_flushprepped()(and the spin-lock-taking jnode_check_flushprepped()).
+   The test for "flushprepped" returns true if any of the following are true:
 
      - The node is not dirty
      - The node has JNODE_RELOC set
      - The node has JNODE_OVRWR set
 
-   If either the node is not dirty or it has already been processed by flush (and assigned
-   JNODE_OVRWR or JNODE_RELOC), then it is prepped.  If jnode_is_flushprepped() returns
-   true then flush has work to do on that node.
+   If either the node is not dirty or it has already been processed by flush
+   (and assigned JNODE_OVRWR or JNODE_RELOC), then it is prepped. If
+   jnode_is_flushprepped() returns true then flush has work to do on that node.
 */
 
 /* FLUSH_PREP_ONCE_PER_TRANSACTION: Within a single transaction a node is never
@@ -381,12 +389,12 @@ static int scan_unformatted(flush_scan *
 static int scan_by_coord(flush_scan * scan);
 
 /* Initial flush-point ancestor allocation. */
-static int alloc_pos_and_ancestors(flush_pos_t * pos);
-static int alloc_one_ancestor(const coord_t * coord, flush_pos_t * pos);
-static int set_preceder(const coord_t * coord_in, flush_pos_t * pos);
+static int alloc_pos_and_ancestors(flush_pos_t *pos);
+static int alloc_one_ancestor(const coord_t *coord, flush_pos_t *pos);
+static int set_preceder(const coord_t *coord_in, flush_pos_t *pos);
 
 /* Main flush algorithm.  Note on abbreviation: "squeeze and allocate" == "squalloc". */
-static int squalloc(flush_pos_t * pos);
+static int squalloc(flush_pos_t *pos);
 
 /* Flush squeeze implementation. */
 static int squeeze_right_non_twig(znode * left, znode * right);
@@ -395,22 +403,22 @@ static int shift_one_internal_unit(znode
 /* Flush reverse parent-first relocation routines. */
 static int reverse_relocate_if_close_enough(const reiser4_block_nr * pblk,
 					    const reiser4_block_nr * nblk);
-static int reverse_relocate_test(jnode * node, const coord_t * parent_coord,
-				 flush_pos_t * pos);
+static int reverse_relocate_test(jnode * node, const coord_t *parent_coord,
+				 flush_pos_t *pos);
 static int reverse_relocate_check_dirty_parent(jnode * node,
-					       const coord_t * parent_coord,
-					       flush_pos_t * pos);
+					       const coord_t *parent_coord,
+					       flush_pos_t *pos);
 
 /* Flush allocate write-queueing functions: */
-static int allocate_znode(znode * node, const coord_t * parent_coord,
-			  flush_pos_t * pos);
-static int allocate_znode_update(znode * node, const coord_t * parent_coord,
-				 flush_pos_t * pos);
+static int allocate_znode(znode * node, const coord_t *parent_coord,
+			  flush_pos_t *pos);
+static int allocate_znode_update(znode * node, const coord_t *parent_coord,
+				 flush_pos_t *pos);
 static int lock_parent_and_allocate_znode(znode *, flush_pos_t *);
 
 /* Flush helper functions: */
 static int jnode_lock_parent_coord(jnode * node,
-				   coord_t * coord,
+				   coord_t *coord,
 				   lock_handle * parent_lh,
 				   load_count * parent_zh,
 				   znode_lock_mode mode, int try);
@@ -424,17 +432,17 @@ static int znode_check_flushprepped(znod
 }
 
 /* Flush position functions */
-static void pos_init(flush_pos_t * pos);
-static int pos_valid(flush_pos_t * pos);
-static void pos_done(flush_pos_t * pos);
-static int pos_stop(flush_pos_t * pos);
+static void pos_init(flush_pos_t *pos);
+static int pos_valid(flush_pos_t *pos);
+static void pos_done(flush_pos_t *pos);
+static int pos_stop(flush_pos_t *pos);
 
 /* check that @org is first jnode extent unit, if extent is unallocated,
  * because all jnodes of unallocated extent are dirty and of the same atom. */
 #define checkchild(scan)						\
 assert("nikita-3435",							\
        ergo(scan->direction == LEFT_SIDE &&				\
-            (scan->parent_coord.node->level == TWIG_LEVEL) &&           \
+	    (scan->parent_coord.node->level == TWIG_LEVEL) &&           \
 	    jnode_is_unformatted(scan->node) &&				\
 	    extent_is_unallocated(&scan->parent_coord),			\
 	    extent_unit_index(&scan->parent_coord) == index_jnode(scan->node)))
@@ -457,7 +465,7 @@ static int check_write_congestion(void)
 }
 
 /* conditionally write flush queue */
-static int write_prepped_nodes(flush_pos_t * pos)
+static int write_prepped_nodes(flush_pos_t *pos)
 {
 	int ret;
 
@@ -477,8 +485,8 @@ static int write_prepped_nodes(flush_pos
 
 /* Proper release all flush pos. resources then move flush position to new
    locked node */
-static void move_flush_pos(flush_pos_t * pos, lock_handle * new_lock,
-			   load_count * new_load, const coord_t * new_coord)
+static void move_flush_pos(flush_pos_t *pos, lock_handle * new_lock,
+			   load_count * new_load, const coord_t *new_coord)
 {
 	assert("zam-857", new_lock->node == new_load->node);
 
@@ -512,7 +520,7 @@ static int delete_empty_node(znode * nod
 }
 
 /* Prepare flush position for alloc_pos_and_ancestors() and squalloc() */
-static int prepare_flush_pos(flush_pos_t * pos, jnode * org)
+static int prepare_flush_pos(flush_pos_t *pos, jnode * org)
 {
 	int ret;
 	load_count load;
@@ -647,7 +655,7 @@ static int prepare_flush_pos(flush_pos_t
 
 static int
 jnode_flush(jnode * node, long nr_to_write, long *nr_written,
-	    flush_queue_t * fq, int flags)
+	    flush_queue_t *fq, int flags)
 {
 	long ret = 0;
 	flush_scan *right_scan;
@@ -694,9 +702,9 @@ jnode_flush(jnode * node, long nr_to_wri
 	scan_init(right_scan);
 	scan_init(left_scan);
 
-	/* First scan left and remember the leftmost scan position.  If the leftmost
-	   position is unformatted we remember its parent_coord.  We scan until counting
-	   FLUSH_SCAN_MAXNODES.
+	/* First scan left and remember the leftmost scan position. If the
+	   leftmost position is unformatted we remember its parent_coord. We
+	   scan until counting FLUSH_SCAN_MAXNODES.
 
 	   If starting @node is unformatted, at the beginning of left scan its
 	   parent (twig level node, containing extent item) will be long term
@@ -714,11 +722,12 @@ jnode_flush(jnode * node, long nr_to_wri
 	leftmost_in_slum = jref(left_scan->node);
 	scan_done(left_scan);
 
-	/* Then possibly go right to decide if we will use a policy of relocating leaves.
-	   This is only done if we did not scan past (and count) enough nodes during the
-	   leftward scan.  If we do scan right, we only care to go far enough to establish
-	   that at least FLUSH_RELOCATE_THRESHOLD number of nodes are being flushed.  The
-	   scan limit is the difference between left_scan.count and the threshold. */
+	/* Then possibly go right to decide if we will use a policy of
+	   relocating leaves. This is only done if we did not scan past (and
+	   count) enough nodes during the leftward scan. If we do scan right,
+	   we only care to go far enough to establish that at least
+	   FLUSH_RELOCATE_THRESHOLD number of nodes are being flushed. The scan
+	   limit is the difference between left_scan.count and the threshold. */
 
 	todo = sbinfo->flush.relocate_threshold - left_scan->count;
 	/* scan right is inherently deadlock prone, because we are
@@ -730,7 +739,8 @@ jnode_flush(jnode * node, long nr_to_wri
 			goto failed;
 	}
 
-	/* Only the right-scan count is needed, release any rightward locks right away. */
+	/* Only the right-scan count is needed, release any rightward locks
+	   right away. */
 	scan_done(right_scan);
 
 	/* ... and the answer is: we should relocate leaf nodes if at least
@@ -739,22 +749,25 @@ jnode_flush(jnode * node, long nr_to_wri
 	    (left_scan->count + right_scan->count >=
 	     sbinfo->flush.relocate_threshold);
 
-	/* Funny business here.  We set the 'point' in the flush_position at prior to
-	   starting squalloc regardless of whether the first point is
-	   formatted or unformatted.  Without this there would be an invariant, in the
-	   rest of the code, that if the flush_position is unformatted then
-	   flush_position->point is NULL and flush_position->parent_{lock,coord} is set,
-	   and if the flush_position is formatted then flush_position->point is non-NULL
-	   and no parent info is set.
-
-	   This seems lazy, but it makes the initial calls to reverse_relocate_test
-	   (which ask "is it the pos->point the leftmost child of its parent") much easier
-	   because we know the first child already.  Nothing is broken by this, but the
-	   reasoning is subtle.  Holding an extra reference on a jnode during flush can
-	   cause us to see nodes with HEARD_BANSHEE during squalloc, because nodes are not
-	   removed from sibling lists until they have zero reference count.  Flush would
-	   never observe a HEARD_BANSHEE node on the left-edge of flush, nodes are only
-	   deleted to the right.  So if nothing is broken, why fix it?
+	/* Funny business here.  We set the 'point' in the flush_position at
+	   prior to starting squalloc regardless of whether the first point is
+	   formatted or unformatted. Without this there would be an invariant,
+	   in the rest of the code, that if the flush_position is unformatted
+	   then flush_position->point is NULL and
+	   flush_position->parent_{lock,coord} is set, and if the flush_position
+	   is formatted then flush_position->point is non-NULL and no parent
+	   info is set.
+
+	   This seems lazy, but it makes the initial calls to
+	   reverse_relocate_test (which ask "is it the pos->point the leftmost
+	   child of its parent") much easier because we know the first child
+	   already.  Nothing is broken by this, but the reasoning is subtle.
+	   Holding an extra reference on a jnode during flush can cause us to
+	   see nodes with HEARD_BANSHEE during squalloc, because nodes are not
+	   removed from sibling lists until they have zero reference count.
+	   Flush would never observe a HEARD_BANSHEE node on the left-edge of
+	   flush, nodes are only deleted to the right. So if nothing is broken,
+	   why fix it?
 
 	   NOTE-NIKITA actually, flush can meet HEARD_BANSHEE node at any
 	   point and in any moment, because of the concurrent file system
@@ -789,7 +802,8 @@ jnode_flush(jnode * node, long nr_to_wri
 		goto failed;
 	}
 
-	/* Set pos->preceder and (re)allocate pos and its ancestors if it is needed  */
+	/* Set pos->preceder and (re)allocate pos and its ancestors if it is
+	   needed  */
 	ret = alloc_pos_and_ancestors(flush_pos);
 	if (ret)
 		goto failed;
@@ -800,55 +814,59 @@ jnode_flush(jnode * node, long nr_to_wri
 	if (ret)
 		goto failed;
 
-	/* FIXME_NFQUCMPD: Here, handle the twig-special case for unallocated children.
-	   First, the pos_stop() and pos_valid() routines should be modified
-	   so that pos_stop() sets a flush_position->stop flag to 1 without
-	   releasing the current position immediately--instead release it in
-	   pos_done().  This is a better implementation than the current one anyway.
-
-	   It is not clear that all fields of the flush_position should not be released,
-	   but at the very least the parent_lock, parent_coord, and parent_load should
-	   remain held because they are hold the last twig when pos_stop() is
-	   called.
-
-	   When we reach this point in the code, if the parent_coord is set to after the
-	   last item then we know that flush reached the end of a twig (and according to
-	   the new flush queueing design, we will return now).  If parent_coord is not
-	   past the last item, we should check if the current twig has any unallocated
-	   children to the right (we are not concerned with unallocated children to the
-	   left--in that case the twig itself should not have been allocated).  If the
-	   twig has unallocated children to the right, set the parent_coord to that
+	/* FIXME_NFQUCMPD: Here, handle the twig-special case for unallocated
+	   children. First, the pos_stop() and pos_valid() routines should be
+	   modified so that pos_stop() sets a flush_position->stop flag to 1
+	   without releasing the current position immediately--instead release
+	   it in pos_done(). This is a better implementation than the current
+	   one anyway.
+
+	   It is not clear that all fields of the flush_position should not be
+	   released, but at the very least the parent_lock, parent_coord, and
+	   parent_load should remain held because they are hold the last twig
+	   when pos_stop() is called.
+
+	   When we reach this point in the code, if the parent_coord is set to
+	   after the last item then we know that flush reached the end of a twig
+	   (and according to the new flush queueing design, we will return now).
+	   If parent_coord is not past the last item, we should check if the
+	   current twig has any unallocated children to the right (we are not
+	   concerned with unallocated children to the left--in that case the
+	   twig itself should not have been allocated). If the twig has
+	   unallocated children to the right, set the parent_coord to that
 	   position and then repeat the call to squalloc.
 
-	   Testing for unallocated children may be defined in two ways: if any internal
-	   item has a fake block number, it is unallocated; if any extent item is
-	   unallocated then all of its children are unallocated.  But there is a more
-	   aggressive approach: if there are any dirty children of the twig to the right
-	   of the current position, we may wish to relocate those nodes now.  Checking for
-	   potential relocation is more expensive as it requires knowing whether there are
-	   any dirty children that are not unallocated.  The extent_needs_allocation
-	   should be used after setting the correct preceder.
-
-	   When we reach the end of a twig at this point in the code, if the flush can
-	   continue (when the queue is ready) it will need some information on the future
-	   starting point.  That should be stored away in the flush_handle using a seal, I
-	   believe.  Holding a jref() on the future starting point may break other code
-	   that deletes that node.
+	   Testing for unallocated children may be defined in two ways: if any
+	   internal item has a fake block number, it is unallocated; if any
+	   extent item is unallocated then all of its children are unallocated.
+	   But there is a more aggressive approach: if there are any dirty
+	   children of the twig to the right of the current position, we may
+	   wish to relocate those nodes now. Checking for potential relocation
+	   is more expensive as it requires knowing whether there are any dirty
+	   children that are not unallocated. The extent_needs_allocation should
+	   be used after setting the correct preceder.
+
+	   When we reach the end of a twig at this point in the code, if the
+	   flush can continue (when the queue is ready) it will need some
+	   information on the future starting point. That should be stored away
+	   in the flush_handle using a seal, I believe. Holding a jref() on the
+	   future starting point may break other code that deletes that node.
 	 */
 
-	/* FIXME_NFQUCMPD: Also, we don't want to do any flushing when flush is called
-	   above the twig level.  If the VM calls flush above the twig level, do nothing
-	   and return (but figure out why this happens).  The txnmgr should be modified to
-	   only flush its leaf-level dirty list.  This will do all the necessary squeeze
-	   and allocate steps but leave unallocated branches and possibly unallocated
-	   twigs (when the twig's leftmost child is not dirty).  After flushing the leaf
-	   level, the remaining unallocated nodes should be given write-optimized
-	   locations.  (Possibly, the remaining unallocated twigs should be allocated just
-	   before their leftmost child.)
+	/* FIXME_NFQUCMPD: Also, we don't want to do any flushing when flush is
+	   called above the twig level.  If the VM calls flush above the twig
+	   level, do nothing and return (but figure out why this happens). The
+	   txnmgr should be modified to only flush its leaf-level dirty list.
+	   This will do all the necessary squeeze and allocate steps but leave
+	   unallocated branches and possibly unallocated twigs (when the twig's
+	   leftmost child is not dirty). After flushing the leaf level, the
+	   remaining unallocated nodes should be given write-optimized
+	   locations. (Possibly, the remaining unallocated twigs should be
+	   allocated just before their leftmost child.)
 	 */
 
 	/* Any failure reaches this point. */
-      failed:
+failed:
 
 	switch (ret) {
 	case -E_REPEAT:
@@ -856,9 +874,11 @@ jnode_flush(jnode * node, long nr_to_wri
 	case -E_DEADLOCK:
 	case -E_NO_NEIGHBOR:
 	case -ENOENT:
-		/* FIXME(C): Except for E_DEADLOCK, these should probably be handled properly
-		   in each case.  They already are handled in many cases. */
-		/* Something bad happened, but difficult to avoid...  Try again! */
+		/* FIXME(C): Except for E_DEADLOCK, these should probably be
+		   handled properly in each case. They already are handled in
+		   many cases. */
+		/* Something bad happened, but difficult to avoid... Try again!
+		*/
 		ret = 0;
 	}
 
@@ -889,7 +909,7 @@ jnode_flush(jnode * node, long nr_to_wri
  * turn rapid flush mode off.
  */
 
-static int rapid_flush(flush_pos_t * pos)
+static int rapid_flush(flush_pos_t *pos)
 {
 	if (!wbq_available())
 		return 0;
@@ -903,7 +923,7 @@ static int rapid_flush(flush_pos_t * pos
 
 #endif				/* REISER4_USE_RAPID_FLUSH */
 
-static jnode *find_flush_start_jnode(jnode *start, txn_atom *atom,
+static jnode *find_flush_start_jnode(jnode *start, txn_atom * atom,
 				     flush_queue_t *fq, int *nr_queued,
 				     int flags)
 {
@@ -919,13 +939,14 @@ static jnode *find_flush_start_jnode(jno
 		spin_unlock_jnode(start);
 	}
 	/*
-	 * In this loop we process all already prepped (RELOC or OVRWR) and dirtied again
-	 * nodes. The atom spin lock is not released until all dirty nodes processed or
-	 * not prepped node found in the atom dirty lists.
+	 * In this loop we process all already prepped (RELOC or OVRWR) and
+	 * dirtied again nodes. The atom spin lock is not released until all
+	 * dirty nodes processed or not prepped node found in the atom dirty
+	 * lists.
 	 */
 	while ((node = find_first_dirty_jnode(atom, flags))) {
 		spin_lock_jnode(node);
-	enter:
+enter:
 		assert("zam-881", JF_ISSET(node, JNODE_DIRTY));
 		assert("zam-898", !JF_ISSET(node, JNODE_OVRWR));
 
@@ -934,8 +955,9 @@ static jnode *find_flush_start_jnode(jno
 			list_move_tail(&node->capture_link, ATOM_WB_LIST(atom));
 
 			/*
-			 * jnode is not necessarily on dirty list: if it was dirtied when
-			 * it was on flush queue - it does not get moved to dirty list
+			 * jnode is not necessarily on dirty list: if it was
+			 * dirtied when it was on flush queue - it does not get
+			 * moved to dirty list
 			 */
 			ON_DEBUG(count_jnode(atom, node, NODE_LIST(node),
 					     WB_LIST, 1));
@@ -943,15 +965,17 @@ static jnode *find_flush_start_jnode(jno
 		} else if (jnode_is_znode(node)
 			   && znode_above_root(JZNODE(node))) {
 			/*
-			 * A special case for znode-above-root.  The above-root (fake)
-			 * znode is captured and dirtied when the tree height changes or
-			 * when the root node is relocated.  This causes atoms to fuse so
-			 * that changes at the root are serialized.  However, this node is
-			 * never flushed.  This special case used to be in lock.c to
-			 * prevent the above-root node from ever being captured, but now
-			 * that it is captured we simply prevent it from flushing.  The
-			 * log-writer code relies on this to properly log superblock
-			 * modifications of the tree height.
+			 * A special case for znode-above-root. The above-root
+			 * (fake) znode is captured and dirtied when the tree
+			 * height changes or when the root node is relocated.
+			 * This causes atoms to fuse so that changes at the root
+			 * are serialized.  However, this node is never flushed.
+			 * This special case used to be in lock.c to prevent the
+			 * above-root node from ever being captured, but now
+			 * that it is captured we simply prevent it from
+			 * flushing. The log-writer code relies on this to
+			 * properly log superblock modifications of the tree
+			 * height.
 			 */
 			jnode_make_wander_nolock(node);
 		} else if (JF_ISSET(node, JNODE_RELOC)) {
@@ -965,9 +989,9 @@ static jnode *find_flush_start_jnode(jno
 	return node;
 }
 
-/* Flush some nodes of current atom, usually slum, return -E_REPEAT if there are more nodes
- * to flush, return 0 if atom's dirty lists empty and keep current atom locked, return
- * other errors as they are. */
+/* Flush some nodes of current atom, usually slum, return -E_REPEAT if there are
+ * more nodes to flush, return 0 if atom's dirty lists empty and keep current
+ * atom locked, return other errors as they are. */
 int
 flush_current_atom(int flags, long nr_to_write, long *nr_submitted,
 		   txn_atom ** atom, jnode *start)
@@ -1053,12 +1077,13 @@ flush_current_atom(int flags, long nr_to
 
 /* REVERSE PARENT-FIRST RELOCATION POLICIES */
 
-/* This implements the is-it-close-enough-to-its-preceder? test for relocation in the
-   reverse parent-first relocate context.  Here all we know is the preceder and the block
-   number.  Since we are going in reverse, the preceder may still be relocated as well, so
-   we can't ask the block allocator "is there a closer block available to relocate?" here.
-   In the _forward_ parent-first relocate context (not here) we actually call the block
-   allocator to try and find a closer location. */
+/* This implements the is-it-close-enough-to-its-preceder? test for relocation
+   in the reverse parent-first relocate context. Here all we know is the
+   preceder and the block number. Since we are going in reverse, the preceder
+   may still be relocated as well, so we can't ask the block allocator "is there
+   a closer block available to relocate?" here. In the _forward_ parent-first
+   relocate context (not here) we actually call the block allocator to try and
+   find a closer location. */
 static int
 reverse_relocate_if_close_enough(const reiser4_block_nr * pblk,
 				 const reiser4_block_nr * nblk)
@@ -1072,24 +1097,23 @@ reverse_relocate_if_close_enough(const r
 	/* Distance is the absolute value. */
 	dist = (*pblk > *nblk) ? (*pblk - *nblk) : (*nblk - *pblk);
 
-	/* If the block is less than FLUSH_RELOCATE_DISTANCE blocks away from its preceder
-	   block, do not relocate. */
-	if (dist <= get_current_super_private()->flush.relocate_distance) {
+	/* If the block is less than FLUSH_RELOCATE_DISTANCE blocks away from
+	   its preceder block, do not relocate. */
+	if (dist <= get_current_super_private()->flush.relocate_distance)
 		return 0;
-	}
 
 	return 1;
 }
 
-/* This function is a predicate that tests for relocation.  Always called in the
-   reverse-parent-first context, when we are asking whether the current node should be
-   relocated in order to expand the flush by dirtying the parent level (and thus
-   proceeding to flush that level).  When traversing in the forward parent-first direction
-   (not here), relocation decisions are handled in two places: allocate_znode() and
-   extent_needs_allocation(). */
+/* This function is a predicate that tests for relocation. Always called in the
+   reverse-parent-first context, when we are asking whether the current node
+   should be relocated in order to expand the flush by dirtying the parent level
+   (and thus proceeding to flush that level). When traversing in the forward
+   parent-first direction (not here), relocation decisions are handled in two
+   places: allocate_znode() and extent_needs_allocation(). */
 static int
-reverse_relocate_test(jnode * node, const coord_t * parent_coord,
-		      flush_pos_t * pos)
+reverse_relocate_test(jnode * node, const coord_t *parent_coord,
+		      flush_pos_t *pos)
 {
 	reiser4_block_nr pblk = 0;
 	reiser4_block_nr nblk = 0;
@@ -1105,15 +1129,15 @@ reverse_relocate_test(jnode * node, cons
 	 */
 
 	/* New nodes are treated as if they are being relocated. */
-	if (JF_ISSET (node, JNODE_CREATED) ||
-	    (pos->leaf_relocate && jnode_get_level(node) == LEAF_LEVEL)) {
+	if (JF_ISSET(node, JNODE_CREATED) ||
+	    (pos->leaf_relocate && jnode_get_level(node) == LEAF_LEVEL))
 		return 1;
-	}
 
-	/* Find the preceder.  FIXME(B): When the child is an unformatted, previously
-	   existing node, the coord may be leftmost even though the child is not the
-	   parent-first preceder of the parent.  If the first dirty node appears somewhere
-	   in the middle of the first extent unit, this preceder calculation is wrong.
+	/* Find the preceder. FIXME(B): When the child is an unformatted,
+	   previously existing node, the coord may be leftmost even though the
+	   child is not the parent-first preceder of the parent. If the first
+	   dirty node appears somewhere in the middle of the first extent unit,
+	   this preceder calculation is wrong.
 	   Needs more logic in here. */
 	if (coord_is_leftmost_unit(parent_coord)) {
 		pblk = *znode_get_block(parent_coord->node);
@@ -1122,10 +1146,10 @@ reverse_relocate_test(jnode * node, cons
 	}
 	check_preceder(pblk);
 
-	/* If (pblk == 0) then the preceder isn't allocated or isn't known: relocate. */
-	if (pblk == 0) {
+	/* If (pblk == 0) then the preceder isn't allocated or isn't known:
+	   relocate. */
+	if (pblk == 0)
 		return 1;
-	}
 
 	nblk = *jnode_get_block(node);
 
@@ -1139,20 +1163,20 @@ reverse_relocate_test(jnode * node, cons
 /* This function calls reverse_relocate_test to make a reverse-parent-first
    relocation decision and then, if yes, it marks the parent dirty. */
 static int
-reverse_relocate_check_dirty_parent(jnode * node, const coord_t * parent_coord,
-				    flush_pos_t * pos)
+reverse_relocate_check_dirty_parent(jnode * node, const coord_t *parent_coord,
+				    flush_pos_t *pos)
 {
 	int ret;
 
 	if (!JF_ISSET(ZJNODE(parent_coord->node), JNODE_DIRTY)) {
 
 		ret = reverse_relocate_test(node, parent_coord, pos);
-		if (ret < 0) {
+		if (ret < 0)
 			return ret;
-		}
 
 		/* FIXME-ZAM
-		   if parent is already relocated - we do not want to grab space, right? */
+		  if parent is already relocated - we do not want to grab space,
+		  right? */
 		if (ret == 1) {
 			int grabbed;
 
@@ -1172,11 +1196,11 @@ reverse_relocate_check_dirty_parent(jnod
 	return 0;
 }
 
-/* INITIAL ALLOCATE ANCESTORS STEP (REVERSE PARENT-FIRST ALLOCATION BEFORE FORWARD
-   PARENT-FIRST LOOP BEGINS) */
+/* INITIAL ALLOCATE ANCESTORS STEP (REVERSE PARENT-FIRST ALLOCATION BEFORE
+   FORWARD PARENT-FIRST LOOP BEGINS) */
 
 /* Get the leftmost child for given coord. */
-static int get_leftmost_child_of_unit(const coord_t * coord, jnode ** child)
+static int get_leftmost_child_of_unit(const coord_t *coord, jnode ** child)
 {
 	int ret;
 
@@ -1191,16 +1215,17 @@ static int get_leftmost_child_of_unit(co
 	return 0;
 }
 
-/* This step occurs after the left- and right-scans are completed, before starting the
-   forward parent-first traversal.  Here we attempt to allocate ancestors of the starting
-   flush point, which means continuing in the reverse parent-first direction to the
-   parent, grandparent, and so on (as long as the child is a leftmost child).  This
-   routine calls a recursive process, alloc_one_ancestor, which does the real work,
-   except there is special-case handling here for the first ancestor, which may be a twig.
-   At each level (here and alloc_one_ancestor), we check for relocation and then, if
-   the child is a leftmost child, repeat at the next level.  On the way back down (the
+/* This step occurs after the left- and right-scans are completed, before
+   starting the forward parent-first traversal. Here we attempt to allocate
+   ancestors of the starting flush point, which means continuing in the reverse
+   parent-first direction to the parent, grandparent, and so on (as long as the
+   child is a leftmost child). This routine calls a recursive process,
+   alloc_one_ancestor, which does the real work, except there is special-case
+   handling here for the first ancestor, which may be a twig. At each level
+   (here and alloc_one_ancestor), we check for relocation and then, if the child
+   is a leftmost child, repeat at the next level. On the way back down (the
    recursion), we allocate the ancestors in parent-first order. */
-static int alloc_pos_and_ancestors(flush_pos_t * pos)
+static int alloc_pos_and_ancestors(flush_pos_t *pos)
 {
 	int ret = 0;
 	lock_handle plock;
@@ -1268,35 +1293,36 @@ static int alloc_pos_and_ancestors(flush
 
 		ret = allocate_znode(pos->lock.node, &pcoord, pos);
 	}
-      exit:
+exit:
 	done_load_count(&pload);
 	done_lh(&plock);
 	return ret;
 }
 
-/* This is the recursive step described in alloc_pos_and_ancestors, above.  Ignoring the
-   call to set_preceder, which is the next function described, this checks if the
-   child is a leftmost child and returns if it is not.  If the child is a leftmost child
-   it checks for relocation, possibly dirtying the parent.  Then it performs the recursive
-   step. */
-static int alloc_one_ancestor(const coord_t * coord, flush_pos_t * pos)
+/* This is the recursive step described in alloc_pos_and_ancestors, above.
+   Ignoring the call to set_preceder, which is the next function described, this
+   checks if the child is a leftmost child and returns if it is not. If the
+   child is a leftmost child it checks for relocation, possibly dirtying the
+   parent. Then it performs the recursive step. */
+static int alloc_one_ancestor(const coord_t *coord, flush_pos_t *pos)
 {
 	int ret = 0;
 	lock_handle alock;
 	load_count aload;
 	coord_t acoord;
 
-	/* As we ascend at the left-edge of the region to flush, take this opportunity at
-	   the twig level to find our parent-first preceder unless we have already set
-	   it. */
+	/* As we ascend at the left-edge of the region to flush, take this
+	   opportunity at the twig level to find our parent-first preceder
+	   unless we have already set it. */
 	if (pos->preceder.blk == 0) {
 		ret = set_preceder(coord, pos);
 		if (ret != 0)
 			return ret;
 	}
 
-	/* If the ancestor is clean or already allocated, or if the child is not a
-	   leftmost child, stop going up, even leaving coord->node not flushprepped. */
+	/* If the ancestor is clean or already allocated, or if the child is not
+	   a leftmost child, stop going up, even leaving coord->node not
+	   flushprepped. */
 	if (znode_check_flushprepped(coord->node)
 	    || !coord_is_leftmost_unit(coord))
 		return 0;
@@ -1305,8 +1331,8 @@ static int alloc_one_ancestor(const coor
 	init_load_count(&aload);
 	coord_init_invalid(&acoord, NULL);
 
-	/* Only ascend to the next level if it is a leftmost child, but write-lock the
-	   parent in case we will relocate the child. */
+	/* Only ascend to the next level if it is a leftmost child, but
+	   write-lock the parent in case we will relocate the child. */
 	if (!znode_is_root(coord->node)) {
 
 		ret =
@@ -1321,9 +1347,8 @@ static int alloc_one_ancestor(const coor
 		ret =
 		    reverse_relocate_check_dirty_parent(ZJNODE(coord->node),
 							&acoord, pos);
-		if (ret != 0) {
+		if (ret != 0)
 			goto exit;
-		}
 
 		/* Recursive call. */
 		if (!znode_check_flushprepped(acoord.node)) {
@@ -1333,32 +1358,34 @@ static int alloc_one_ancestor(const coor
 		}
 	}
 
-	/* Note: we call allocate with the parent write-locked (except at the root) in
-	   case we relocate the child, in which case it will modify the parent during this
-	   call. */
+	/* Note: we call allocate with the parent write-locked (except at the
+	   root) in case we relocate the child, in which case it will modify the
+	   parent during this call. */
 	ret = allocate_znode(coord->node, &acoord, pos);
 
-      exit:
+exit:
 	done_load_count(&aload);
 	done_lh(&alock);
 	return ret;
 }
 
-/* During the reverse parent-first alloc_pos_and_ancestors process described above there is
-   a call to this function at the twig level.  During alloc_pos_and_ancestors we may ask:
-   should this node be relocated (in reverse parent-first context)?  We repeat this
-   process as long as the child is the leftmost child, eventually reaching an ancestor of
-   the flush point that is not a leftmost child.  The preceder of that ancestors, which is
-   not a leftmost child, is actually on the leaf level.  The preceder of that block is the
-   left-neighbor of the flush point.  The preceder of that block is the rightmost child of
-   the twig on the left.  So, when alloc_pos_and_ancestors passes upward through the twig
-   level, it stops momentarily to remember the block of the rightmost child of the twig on
-   the left and sets it to the flush_position's preceder_hint.
+/* During the reverse parent-first alloc_pos_and_ancestors process described
+   above there is a call to this function at the twig level. During
+   alloc_pos_and_ancestors we may ask: should this node be relocated (in reverse
+   parent-first context)?  We repeat this process as long as the child is the
+   leftmost child, eventually reaching an ancestor of the flush point that is
+   not a leftmost child. The preceder of that ancestors, which is not a leftmost
+   child, is actually on the leaf level. The preceder of that block is the
+   left-neighbor of the flush point. The preceder of that block is the rightmost
+   child of the twig on the left. So, when alloc_pos_and_ancestors passes upward
+   through the twig level, it stops momentarily to remember the block of the
+   rightmost child of the twig on the left and sets it to the flush_position's
+   preceder_hint.
 
-   There is one other place where we may set the flush_position's preceder hint, which is
-   during scan-left.
+   There is one other place where we may set the flush_position's preceder hint,
+   which is during scan-left.
 */
-static int set_preceder(const coord_t * coord_in, flush_pos_t * pos)
+static int set_preceder(const coord_t *coord_in, flush_pos_t *pos)
 {
 	int ret;
 	coord_t coord;
@@ -1370,9 +1397,9 @@ static int set_preceder(const coord_t * 
 	init_lh(&left_lock);
 	init_load_count(&left_load);
 
-	/* FIXME(B): Same FIXME as in "Find the preceder" in reverse_relocate_test.
-	   coord_is_leftmost_unit is not the right test if the unformatted child is in the
-	   middle of the first extent unit. */
+	/* FIXME(B): Same FIXME as in "Find the preceder" in
+	   reverse_relocate_test. coord_is_leftmost_unit is not the right test
+	   if the unformatted child is in the middle of the first extent unit.*/
 	if (!coord_is_leftmost_unit(&coord)) {
 		coord_prev_unit(&coord);
 	} else {
@@ -1380,14 +1407,13 @@ static int set_preceder(const coord_t * 
 		    reiser4_get_left_neighbor(&left_lock, coord.node,
 					      ZNODE_READ_LOCK, GN_SAME_ATOM);
 		if (ret) {
-			/* If we fail for any reason it doesn't matter because the
-			   preceder is only a hint.  We are low-priority at this point, so
-			   this must be the case. */
+			/* If we fail for any reason it doesn't matter because
+			   the preceder is only a hint. We are low-priority at
+			   this point, so this must be the case. */
 			if (ret == -E_REPEAT || ret == -E_NO_NEIGHBOR ||
 			    ret == -ENOENT || ret == -EINVAL
-			    || ret == -E_DEADLOCK) {
+			    || ret == -E_DEADLOCK)
 				ret = 0;
-			}
 			goto exit;
 		}
 
@@ -1401,7 +1427,7 @@ static int set_preceder(const coord_t * 
 	ret =
 	    item_utmost_child_real_block(&coord, RIGHT_SIDE,
 					 &pos->preceder.blk);
-      exit:
+exit:
 	check_preceder(pos->preceder.blk);
 	done_load_count(&left_load);
 	done_lh(&left_lock);
@@ -1410,8 +1436,9 @@ static int set_preceder(const coord_t * 
 
 /* MAIN SQUEEZE AND ALLOCATE LOOP (THREE BIG FUNCTIONS) */
 
-/* This procedure implements the outer loop of the flush algorithm.  To put this in
-   context, here is the general list of steps taken by the flush routine as a whole:
+/* This procedure implements the outer loop of the flush algorithm. To put this
+   in context, here is the general list of steps taken by the flush routine as a
+   whole:
 
    1. Scan-left
    2. Scan-right (maybe)
@@ -1423,28 +1450,29 @@ static int set_preceder(const coord_t * 
 
    This procedure implements the loop in steps 4 through 6 in the above listing.
 
-   Step 4: if the current flush position is an extent item (position on the twig level),
-   it allocates the extent (allocate_extent_item_in_place) then shifts to the next
-   coordinate.  If the next coordinate's leftmost child needs flushprep, we will continue.
-   If the next coordinate is an internal item, we descend back to the leaf level,
-   otherwise we repeat a step #4 (labeled ALLOC_EXTENTS below).  If the "next coordinate"
-   brings us past the end of the twig level, then we call
-   reverse_relocate_end_of_twig to possibly dirty the next (right) twig, prior to
-   step #5 which moves to the right.
-
-   Step 5: calls squalloc_changed_ancestors, which initiates a recursive call up the
-   tree to allocate any ancestors of the next-right flush position that are not also
-   ancestors of the current position.  Those ancestors (in top-down order) are the next in
-   parent-first order.  We squeeze adjacent nodes on the way up until the right node and
-   current node share the same parent, then allocate on the way back down.  Finally, this
-   step sets the flush position to the next-right node.  Then repeat steps 4 and 5.
+   Step 4: if the current flush position is an extent item (position on the twig
+   level), it allocates the extent (allocate_extent_item_in_place) then shifts
+   to the next coordinate. If the next coordinate's leftmost child needs
+   flushprep, we will continue. If the next coordinate is an internal item, we
+   descend back to the leaf level, otherwise we repeat a step #4 (labeled
+   ALLOC_EXTENTS below). If the "next coordinate" brings us past the end of the
+   twig level, then we call reverse_relocate_end_of_twig to possibly dirty the
+   next (right) twig, prior to step #5 which moves to the right.
+
+   Step 5: calls squalloc_changed_ancestors, which initiates a recursive call up
+   the tree to allocate any ancestors of the next-right flush position that are
+   not also ancestors of the current position. Those ancestors (in top-down
+   order) are the next in parent-first order. We squeeze adjacent nodes on the
+   way up until the right node and current node share the same parent, then
+   allocate on the way back down. Finally, this step sets the flush position to
+   the next-right node.  Then repeat steps 4 and 5.
 */
 
 /* SQUEEZE CODE */
 
 /* squalloc_right_twig helper function, cut a range of extent items from
    cut node to->node from the beginning up to coord @to. */
-static int squalloc_right_twig_cut(coord_t * to, reiser4_key * to_key,
+static int squalloc_right_twig_cut(coord_t *to, reiser4_key * to_key,
 				   znode * left)
 {
 	coord_t from;
@@ -1461,7 +1489,7 @@ static int squalloc_right_twig_cut(coord
    SQUEEZE_SOURCE_EMPTY when no more can be shifted.  If the next item is an
    internal item it calls shift_one_internal_unit and may then return
    SUBTREE_MOVED. */
-static int squeeze_right_twig(znode * left, znode * right, flush_pos_t * pos)
+static int squeeze_right_twig(znode * left, znode * right, flush_pos_t *pos)
 {
 	int ret = SUBTREE_MOVED;
 	coord_t coord;		/* used to iterate over items */
@@ -1497,9 +1525,8 @@ static int squeeze_right_twig(znode * le
 	if (node_is_empty(coord.node))
 		ret = SQUEEZE_SOURCE_EMPTY;
 
-	if (ret == SQUEEZE_TARGET_FULL) {
+	if (ret == SQUEEZE_TARGET_FULL)
 		goto out;
-	}
 
 	if (node_is_empty(right)) {
 		/* The whole right node was copied into @left. */
@@ -1510,18 +1537,18 @@ static int squeeze_right_twig(znode * le
 	coord_init_first_unit(&coord, right);
 
 	if (!item_is_internal(&coord)) {
-		/* we do not want to squeeze anything else to left neighbor because "slum"
-		   is over */
+		/* we do not want to squeeze anything else to left neighbor
+		   because "slum" is over */
 		ret = SQUEEZE_TARGET_FULL;
 		goto out;
 	}
 	assert("jmacd-433", item_is_internal(&coord));
 
-	/* Shift an internal unit.  The child must be allocated before shifting any more
-	   extents, so we stop here. */
+	/* Shift an internal unit.  The child must be allocated before shifting
+	   any more extents, so we stop here. */
 	ret = shift_one_internal_unit(left, right);
 
-      out:
+out:
 	assert("jmacd-8612", ret < 0 || ret == SQUEEZE_TARGET_FULL
 	       || ret == SUBTREE_MOVED || ret == SQUEEZE_SOURCE_EMPTY);
 
@@ -1540,7 +1567,7 @@ static int squeeze_right_twig(znode * le
 }
 
 #if REISER4_DEBUG
-static void item_convert_invariant(flush_pos_t * pos)
+static void item_convert_invariant(flush_pos_t *pos)
 {
 	assert("edward-1225", coord_is_existing_item(&pos->coord));
 	if (chaining_data_present(pos)) {
@@ -1562,7 +1589,7 @@ static void item_convert_invariant(flush
    item its flush ->convert() method (if any). This method may
    resize/kill the item so the tree will be changed.
 */
-static int convert_node(flush_pos_t * pos, znode * node)
+static int convert_node(flush_pos_t *pos, znode * node)
 {
 	int ret = 0;
 	item_plugin *iplug;
@@ -1602,11 +1629,11 @@ static int convert_node(flush_pos_t * po
 				break;
 			if (should_chain_next_node(pos)) {
 				/* go to next node */
-				move_chaining_data(pos, 0 /* to next node */ );
+				move_chaining_data(pos, 0/* to next node */);
 				break;
 			}
 			/* repeat this node */
-			move_chaining_data(pos, 1 /* this node */ );
+			move_chaining_data(pos, 1/* this node */);
 			continue;
 		}
 		/* Node is not over.
@@ -1622,12 +1649,12 @@ static int convert_node(flush_pos_t * po
 			ret = coord_prev_item(&pos->coord);
 			assert("edward-1003", !ret);
 
-			move_chaining_data(pos, 1 /* this node */ );
+			move_chaining_data(pos, 1/* this node */);
 		}
 	}
 	JF_CLR(ZJNODE(node), JNODE_CONVERTIBLE);
 	znode_make_dirty(node);
-      exit:
+exit:
 	assert("edward-1004", !ret);
 	return ret;
 }
@@ -1652,7 +1679,7 @@ static int convert_node(flush_pos_t * po
    is returned.
 */
 
-static int squeeze_right_neighbor(flush_pos_t * pos, znode * left,
+static int squeeze_right_neighbor(flush_pos_t *pos, znode * left,
 				  znode * right)
 {
 	int ret;
@@ -1672,8 +1699,8 @@ static int squeeze_right_neighbor(flush_
 		break;
 
 	default:
-		/* All other levels can use shift_everything until we implement per-item
-		   flush plugins. */
+		/* All other levels can use shift_everything until we implement
+		   per-item flush plugins. */
 		ret = squeeze_right_non_twig(left, right);
 		break;
 	}
@@ -1685,7 +1712,7 @@ static int squeeze_right_neighbor(flush_
 	return ret;
 }
 
-static int squeeze_right_twig_and_advance_coord(flush_pos_t * pos,
+static int squeeze_right_twig_and_advance_coord(flush_pos_t *pos,
 						znode * right)
 {
 	int ret;
@@ -1707,7 +1734,7 @@ static int squalloc_upper_levels(flush_p
 
 /* do a fast check for "same parents" condition before calling
  * squalloc_upper_levels() */
-static inline int check_parents_and_squalloc_upper_levels(flush_pos_t * pos,
+static inline int check_parents_and_squalloc_upper_levels(flush_pos_t *pos,
 							  znode * left,
 							  znode * right)
 {
@@ -1722,7 +1749,7 @@ static inline int check_parents_and_squa
    share at least the parent of the @right is after the @left but before the
    @right in parent-first order, we have to (re)allocate it before the @right
    gets (re)allocated. */
-static int squalloc_upper_levels(flush_pos_t * pos, znode * left, znode * right)
+static int squalloc_upper_levels(flush_pos_t *pos, znode * left, znode * right)
 {
 	int ret;
 
@@ -1751,17 +1778,18 @@ static int squalloc_upper_levels(flush_p
 		goto out;
 
 	if (znode_check_flushprepped(right_parent_lock.node)) {
-		/* Keep parent-first order.  In the order, the right parent node stands
-		   before the @right node.  If it is already allocated, we set the
-		   preceder (next block search start point) to its block number, @right
-		   node should be allocated after it.
-
-		   However, preceder is set only if the right parent is on twig level.
-		   The explanation is the following: new branch nodes are allocated over
-		   already allocated children while the tree grows, it is difficult to
-		   keep tree ordered, we assume that only leaves and twings are correctly
-		   allocated.  So, only twigs are used as a preceder for allocating of the
-		   rest of the slum. */
+		/* Keep parent-first order.  In the order, the right parent node
+		   stands before the @right node.  If it is already allocated,
+		   we set the preceder (next block search start point) to its
+		   block number, @right node should be allocated after it.
+
+		   However, preceder is set only if the right parent is on twig
+		   level. The explanation is the following: new branch nodes are
+		   allocated over already allocated children while the tree
+		   grows, it is difficult to keep tree ordered, we assume that
+		   only leaves and twings are correctly allocated. So, only
+		   twigs are used as a preceder for allocating of the rest of
+		   the slum. */
 		if (znode_get_level(right_parent_lock.node) == TWIG_LEVEL) {
 			pos->preceder.blk =
 			    *znode_get_block(right_parent_lock.node);
@@ -1800,7 +1828,7 @@ static int squalloc_upper_levels(flush_p
 	/* allocate znode when going down */
 	ret = lock_parent_and_allocate_znode(right_parent_lock.node, pos);
 
-      out:
+out:
 	done_load_count(&left_parent_load);
 	done_load_count(&right_parent_load);
 
@@ -1812,7 +1840,7 @@ static int squalloc_upper_levels(flush_p
 
 /* Check the leftmost child "flushprepped" status, also returns true if child
  * node was not found in cache.  */
-static int leftmost_child_of_unit_check_flushprepped(const coord_t * coord)
+static int leftmost_child_of_unit_check_flushprepped(const coord_t *coord)
 {
 	int ret;
 	int prepped;
@@ -1838,7 +1866,7 @@ static int leftmost_child_of_unit_check_
 }
 
 /* (re)allocate znode with automated getting parent node */
-static int lock_parent_and_allocate_znode(znode * node, flush_pos_t * pos)
+static int lock_parent_and_allocate_znode(znode * node, flush_pos_t *pos)
 {
 	int ret;
 	lock_handle parent_lock;
@@ -1864,7 +1892,7 @@ static int lock_parent_and_allocate_znod
 
 	ret = allocate_znode(node, &pcoord, pos);
 
-      out:
+out:
 	done_load_count(&parent_load);
 	done_lh(&parent_lock);
 	return ret;
@@ -1872,7 +1900,7 @@ static int lock_parent_and_allocate_znod
 
 /* Process nodes on leaf level until unformatted node or rightmost node in the
  * slum reached.  */
-static int handle_pos_on_formatted(flush_pos_t * pos)
+static int handle_pos_on_formatted(flush_pos_t *pos)
 {
 	int ret;
 	lock_handle right_lock;
@@ -1900,10 +1928,10 @@ static int handle_pos_on_formatted(flush
 			break;
 		}
 
-		/* we don't prep(allocate) nodes for flushing twice.  This can be suboptimal, or it
-		 * can be optimal.  For now we choose to live with the risk that it will
-		 * be suboptimal because it would be quite complex to code it to be
-		 * smarter. */
+		/* we don't prep(allocate) nodes for flushing twice. This can be
+		 * suboptimal, or it can be optimal. For now we choose to live
+		 * with the risk that it will be suboptimal because it would be
+		 * quite complex to code it to be smarter. */
 		if (znode_check_flushprepped(right_lock.node)
 		    && !znode_convertible(right_lock.node)) {
 			assert("edward-1005", !should_convert_next_node(pos));
@@ -1936,7 +1964,7 @@ static int handle_pos_on_formatted(flush
 		if (znode_check_flushprepped(right_lock.node)) {
 			if (should_convert_next_node(pos)) {
 				/* in spite of flushprepped status of the node,
-				   its right slum neighbor should be converted */
+				   its right slum neighbor should be converted*/
 				assert("edward-953", convert_data(pos));
 				assert("edward-954", item_convert_data(pos));
 
@@ -1986,15 +2014,15 @@ static int handle_pos_on_formatted(flush
 	done_load_count(&right_load);
 	done_lh(&right_lock);
 
-	/* This function indicates via pos whether to stop or go to twig or continue on current
-	 * level. */
+	/* This function indicates via pos whether to stop or go to twig or
+	 * continue on current level. */
 	return ret;
 
 }
 
 /* Process nodes on leaf level until unformatted node or rightmost node in the
  * slum reached.  */
-static int handle_pos_on_leaf(flush_pos_t * pos)
+static int handle_pos_on_leaf(flush_pos_t *pos)
 {
 	int ret;
 
@@ -2012,14 +2040,14 @@ static int handle_pos_on_leaf(flush_pos_
 }
 
 /* Process slum on level > 1 */
-static int handle_pos_on_internal(flush_pos_t * pos)
+static int handle_pos_on_internal(flush_pos_t *pos)
 {
 	assert("zam-850", pos->state == POS_ON_INTERNAL);
 	return handle_pos_on_formatted(pos);
 }
 
 /* check whether squalloc should stop before processing given extent */
-static int squalloc_extent_should_stop(flush_pos_t * pos)
+static int squalloc_extent_should_stop(flush_pos_t *pos)
 {
 	assert("zam-869", item_is_extent(&pos->coord));
 
@@ -2056,7 +2084,7 @@ static int squalloc_extent_should_stop(f
  * unformatted nodes.  By having a lock on twig level and use extent code
  * routines to process unformatted nodes we swim around an irregular part of
  * reiser4 tree. */
-static int handle_pos_on_twig(flush_pos_t * pos)
+static int handle_pos_on_twig(flush_pos_t *pos)
 {
 	int ret;
 
@@ -2079,9 +2107,8 @@ static int handle_pos_on_twig(flush_pos_
 	while (pos_valid(pos) && coord_is_existing_unit(&pos->coord)
 	       && item_is_extent(&pos->coord)) {
 		ret = reiser4_alloc_extent(pos);
-		if (ret) {
+		if (ret)
 			break;
-		}
 		coord_next_unit(&pos->coord);
 	}
 
@@ -2104,7 +2131,7 @@ static int handle_pos_on_twig(flush_pos_
 /* When we about to return flush position from twig to leaf level we can process
  * the right twig node or move position to the leaf.  This processes right twig
  * if it is possible and jump to leaf level if not. */
-static int handle_pos_end_of_twig(flush_pos_t * pos)
+static int handle_pos_end_of_twig(flush_pos_t *pos)
 {
 	int ret;
 	lock_handle right_lock;
@@ -2135,12 +2162,13 @@ static int handle_pos_end_of_twig(flush_
 	if (JF_ISSET(ZJNODE(right_lock.node), JNODE_DIRTY)) {
 		/* If right twig node is dirty we always attempt to squeeze it
 		 * content to the left... */
-	      became_dirty:
+became_dirty:
 		ret =
 		    squeeze_right_twig_and_advance_coord(pos, right_lock.node);
 		if (ret <= 0) {
 			/* pos->coord is on internal item, go to leaf level, or
-			 * we have an error which will be caught in squalloc() */
+			 * we have an error which will be caught in squalloc()
+			 */
 			pos->state = POS_TO_LEAF;
 			goto out;
 		}
@@ -2206,7 +2234,7 @@ static int handle_pos_end_of_twig(flush_
 	pos->state = item_is_extent(&at_right) ? POS_ON_EPOINT : POS_TO_LEAF;
 	move_flush_pos(pos, &right_lock, &right_load, &at_right);
 
-      out:
+out:
 	done_load_count(&right_load);
 	done_lh(&right_lock);
 
@@ -2218,7 +2246,7 @@ static int handle_pos_end_of_twig(flush_
 
 /* Move the pos->lock to leaf node pointed by pos->coord, check should we
  * continue there. */
-static int handle_pos_to_leaf(flush_pos_t * pos)
+static int handle_pos_to_leaf(flush_pos_t *pos)
 {
 	int ret;
 	lock_handle child_lock;
@@ -2266,7 +2294,7 @@ static int handle_pos_to_leaf(flush_pos_
 		ret = delete_empty_node(JZNODE(child));
 		pos->state = POS_INVALID;
 	}
-      out:
+out:
 	done_load_count(&child_load);
 	done_lh(&child_lock);
 	jput(child);
@@ -2276,7 +2304,7 @@ static int handle_pos_to_leaf(flush_pos_
 
 /* move pos from leaf to twig, and move lock from leaf to twig. */
 /* Move pos->lock to upper (twig) level */
-static int handle_pos_to_twig(flush_pos_t * pos)
+static int handle_pos_to_twig(flush_pos_t *pos)
 {
 	int ret;
 
@@ -2319,7 +2347,7 @@ static int handle_pos_to_twig(flush_pos_
 
 	move_flush_pos(pos, &parent_lock, &parent_load, &pcoord);
 
-      out:
+out:
 	done_load_count(&parent_load);
 	done_lh(&parent_lock);
 
@@ -2330,29 +2358,31 @@ typedef int (*pos_state_handle_t) (flush
 static pos_state_handle_t flush_pos_handlers[] = {
 	/* process formatted nodes on leaf level, keep lock on a leaf node */
 	[POS_ON_LEAF] = handle_pos_on_leaf,
-	/* process unformatted nodes, keep lock on twig node, pos->coord points to extent currently
-	 * being processed */
+	/* process unformatted nodes, keep lock on twig node, pos->coord points
+	 * to extent currently being processed */
 	[POS_ON_EPOINT] = handle_pos_on_twig,
-	/* move a lock from leaf node to its parent for further processing of unformatted nodes */
+	/* move a lock from leaf node to its parent for further processing of
+	   unformatted nodes */
 	[POS_TO_TWIG] = handle_pos_to_twig,
-	/* move a lock from twig to leaf level when a processing of unformatted nodes finishes,
-	 * pos->coord points to the leaf node we jump to */
+	/* move a lock from twig to leaf level when a processing of unformatted
+	 * nodes finishes, pos->coord points to the leaf node we jump to */
 	[POS_TO_LEAF] = handle_pos_to_leaf,
-	/* after processing last extent in the twig node, attempting to shift items from the twigs
-	 * right neighbor and process them while shifting */
+	/* after processing last extent in the twig node, attempting to shift
+	 * items from the twigs right neighbor and process them while shifting*/
 	[POS_END_OF_TWIG] = handle_pos_end_of_twig,
-	/* process formatted nodes on internal level, keep lock on an internal node */
+	/* process formatted nodes on internal level, keep lock on an internal
+	   node */
 	[POS_ON_INTERNAL] = handle_pos_on_internal
 };
 
-/* Advance flush position horizontally, prepare for flushing ((re)allocate, squeeze,
- * encrypt) nodes and their ancestors in "parent-first" order */
-static int squalloc(flush_pos_t * pos)
+/* Advance flush position horizontally, prepare for flushing ((re)allocate,
+ * squeeze, encrypt) nodes and their ancestors in "parent-first" order */
+static int squalloc(flush_pos_t *pos)
 {
 	int ret = 0;
 
-	/* maybe needs to be made a case statement with handle_pos_on_leaf as first case, for
-	 * greater CPU efficiency? Measure and see.... -Hans */
+	/* maybe needs to be made a case statement with handle_pos_on_leaf as
+	 * first case, for greater CPU efficiency? Measure and see.... -Hans */
 	while (pos_valid(pos)) {
 		ret = flush_pos_handlers[pos->state] (pos);
 		if (ret < 0)
@@ -2363,8 +2393,9 @@ static int squalloc(flush_pos_t * pos)
 			break;
 	}
 
-	/* any positive value or -E_NO_NEIGHBOR are legal return codes for handle_pos*
-	   routines, -E_NO_NEIGHBOR means that slum edge was reached */
+	/* any positive value or -E_NO_NEIGHBOR are legal return codes for
+	   handle_pos* routines, -E_NO_NEIGHBOR means that slum edge was
+	   reached */
 	if (ret > 0 || ret == -E_NO_NEIGHBOR)
 		ret = 0;
 
@@ -2382,16 +2413,18 @@ static void update_ldkey(znode * node)
 	znode_set_ld_key(node, leftmost_key_in_node(node, &ldkey));
 }
 
-/* this is to be called after calling of shift node's method to shift data from @right to
-   @left. It sets left delimiting keys of @left and @right to keys of first items of @left
-   and @right correspondingly and sets right delimiting key of @left to first key of @right */
+/* this is to be called after calling of shift node's method to shift data from
+   @right to @left. It sets left delimiting keys of @left and @right to keys of
+   first items of @left and @right correspondingly and sets right delimiting key
+   of @left to first key of @right */
 static void update_znode_dkeys(znode * left, znode * right)
 {
 	assert_rw_write_locked(&(znode_get_tree(right)->dk_lock));
 	assert("vs-1629", (znode_is_write_locked(left) &&
 			   znode_is_write_locked(right)));
 
-	/* we need to update left delimiting of left if it was empty before shift */
+	/* we need to update left delimiting of left if it was empty before
+	   shift */
 	update_ldkey(left);
 	update_ldkey(right);
 	if (node_is_empty(right))
@@ -2417,7 +2450,8 @@ shift_everything_left(znode * right, zno
 	return nplug->shift(&from, left, SHIFT_LEFT,
 			    1 /* delete @right if it becomes empty */ ,
 			    1
-			    /* move coord @from to node @left if everything will be shifted */
+			    /* move coord @from to node @left if everything will
+			       be shifted */
 			    ,
 			    &info);
 }
@@ -2461,12 +2495,13 @@ static int squeeze_right_non_twig(znode 
 		update_znode_dkeys(left, right);
 		write_unlock_dk(tree);
 
-		/* Carry is called to update delimiting key and, maybe, to remove empty
-		   node. */
+		/* Carry is called to update delimiting key and, maybe, to
+		   remove empty node. */
 		grabbed = get_current_context()->grabbed_blocks;
 		ret = reiser4_grab_space_force(tree->height, BA_RESERVED);
-		assert("nikita-3003", ret == 0);	/* reserved space is exhausted. Ask Hans. */
-		ret = reiser4_carry(todo, NULL /* previous level */ );
+		assert("nikita-3003", ret == 0);	/* reserved space is
+							exhausted. Ask Hans. */
+		ret = reiser4_carry(todo, NULL/* previous level */);
 		grabbed2free_mark(grabbed);
 	} else {
 		/* Shifting impossible, we return appropriate result code */
@@ -2549,10 +2584,12 @@ static int shift_one_internal_unit(znode
 
 	ret = node_plugin_by_node(left)->shift(coord, left, SHIFT_LEFT,
 					       1
-					       /* delete @right if it becomes empty */
+					       /* delete @right if it becomes
+						  empty */
 					       ,
 					       0
-					       /* do not move coord @coord to node @left */
+					       /* do not move coord @coord to
+						  node @left */
 					       ,
 					       info);
 
@@ -2575,9 +2612,10 @@ static int shift_one_internal_unit(znode
 		/* reserve space for delimiting keys after shifting */
 		grabbed = get_current_context()->grabbed_blocks;
 		ret = reiser4_grab_space_force(tree->height, BA_RESERVED);
-		assert("nikita-3003", ret == 0);	/* reserved space is exhausted. Ask Hans. */
+		assert("nikita-3003", ret == 0);	/* reserved space is
+							exhausted. Ask Hans. */
 
-		ret = reiser4_carry(todo, NULL /* previous level */ );
+		ret = reiser4_carry(todo, NULL/* previous level */);
 		grabbed2free_mark(grabbed);
 	}
 
@@ -2592,17 +2630,18 @@ static int shift_one_internal_unit(znode
 	return moved ? SUBTREE_MOVED : SQUEEZE_TARGET_FULL;
 }
 
-/* Make the final relocate/wander decision during forward parent-first squalloc for a
-   znode.  For unformatted nodes this is done in plugin/item/extent.c:extent_needs_allocation(). */
+/* Make the final relocate/wander decision during forward parent-first squalloc
+   for a znode. For unformatted nodes this is done in
+   plugin/item/extent.c:extent_needs_allocation(). */
 static int
 allocate_znode_loaded(znode * node,
-		      const coord_t * parent_coord, flush_pos_t * pos)
+		      const coord_t *parent_coord, flush_pos_t *pos)
 {
 	int ret;
 	reiser4_super_info_data *sbinfo = get_current_super_private();
 	/* FIXME(D): We have the node write-locked and should have checked for !
-	   allocated() somewhere before reaching this point, but there can be a race, so
-	   this assertion is bogus. */
+	   allocated() somewhere before reaching this point, but there can be a
+	   race, so this assertion is bogus. */
 	assert("jmacd-7987", !jnode_check_flushprepped(ZJNODE(node)));
 	assert("jmacd-7988", znode_is_write_locked(node));
 	assert("jmacd-7989", coord_is_invalid(parent_coord)
@@ -2612,12 +2651,12 @@ allocate_znode_loaded(znode * node,
 	    znode_is_root(node) ||
 	    /* We have enough nodes to relocate no matter what. */
 	    (pos->leaf_relocate != 0 && znode_get_level(node) == LEAF_LEVEL)) {
-		/* No need to decide with new nodes, they are treated the same as
-		   relocate. If the root node is dirty, relocate. */
+		/* No need to decide with new nodes, they are treated the same
+		   as relocate. If the root node is dirty, relocate. */
 		if (pos->preceder.blk == 0) {
-			/* preceder is unknown and we have decided to relocate node --
-			   using of default value for search start is better than search
-			   from block #0. */
+			/* preceder is unknown and we have decided to relocate
+			   node -- using of default value for search start is
+			   better than search from block #0. */
 			get_blocknr_hint_default(&pos->preceder.blk);
 			check_preceder(pos->preceder.blk);
 		}
@@ -2647,7 +2686,8 @@ allocate_znode_loaded(znode * node,
 						   nblk) : (nblk -
 							    pos->preceder.blk);
 
-			/* See if we can find a closer block (forward direction only). */
+			/* See if we can find a closer block
+			   (forward direction only). */
 			pos->preceder.max_dist =
 			    min((reiser4_block_nr) sbinfo->flush.
 				relocate_distance, dist);
@@ -2667,15 +2707,17 @@ allocate_znode_loaded(znode * node,
 				/* The present allocation is good enough. */
 				jnode_make_wander(ZJNODE(node));
 			} else {
-				/* Otherwise, try to relocate to the best position. */
-			      best_reloc:
+				/* Otherwise, try to relocate to the best
+				   position. */
+best_reloc:
 				ret =
 				    allocate_znode_update(node, parent_coord,
 							  pos);
 				if (ret != 0)
 					return ret;
 
-				/* set JNODE_RELOC bit _after_ node gets allocated */
+				/* set JNODE_RELOC bit _after_ node gets
+				   allocated */
 				znode_make_reloc(node, pos->fq);
 			}
 		}
@@ -2692,7 +2734,7 @@ allocate_znode_loaded(znode * node,
 }
 
 static int
-allocate_znode(znode * node, const coord_t * parent_coord, flush_pos_t * pos)
+allocate_znode(znode * node, const coord_t *parent_coord, flush_pos_t *pos)
 {
 	/*
 	 * perform znode allocation with znode pinned in memory to avoid races
@@ -2702,13 +2744,13 @@ allocate_znode(znode * node, const coord
 	return WITH_DATA(node, allocate_znode_loaded(node, parent_coord, pos));
 }
 
-/* A subroutine of allocate_znode, this is called first to see if there is a close
-   position to relocate to.  It may return ENOSPC if there is no close position.  If there
-   is no close position it may not relocate.  This takes care of updating the parent node
-   with the relocated block address. */
+/* A subroutine of allocate_znode, this is called first to see if there is a
+   close position to relocate to. It may return ENOSPC if there is no close
+   position. If there is no close position it may not relocate. This takes care
+   of updating the parent node with the relocated block address. */
 static int
-allocate_znode_update(znode * node, const coord_t * parent_coord,
-		      flush_pos_t * pos)
+allocate_znode_update(znode * node, const coord_t *parent_coord,
+		      flush_pos_t *pos)
 {
 	int ret;
 	reiser4_block_nr blk;
@@ -2736,9 +2778,10 @@ allocate_znode_update(znode * node, cons
 	} else {
 		pos->preceder.block_stage = BLOCK_GRABBED;
 
-		/* The disk space for relocating the @node is already reserved in "flush reserved"
-		 * counter if @node is leaf, otherwise we grab space using BA_RESERVED (means grab
-		 * space from whole disk not from only 95%). */
+		/* The disk space for relocating the @node is already reserved
+		 * in "flush reserved" counter if @node is leaf, otherwise we
+		 * grab space using BA_RESERVED (means grab space from whole
+		 * disk not from only 95%). */
 		if (znode_get_level(node) == LEAF_LEVEL) {
 			/*
 			 * earlier (during do_jnode_make_dirty()) we decided
@@ -2764,7 +2807,8 @@ allocate_znode_update(znode * node, cons
 		}
 	}
 
-	/* We may do not use 5% of reserved disk space here and flush will not pack tightly. */
+	/* We may do not use 5% of reserved disk space here and flush will not
+	   pack tightly. */
 	ret = reiser4_alloc_block(&pos->preceder, &blk,
 				  BA_FORMATTED | BA_PERMANENT);
 	if (ret)
@@ -2811,7 +2855,7 @@ allocate_znode_update(znode * node, cons
 	}
 
 	ret = znode_rehash(node, &blk);
-      exit:
+exit:
 	if (ret) {
 		/* Get flush reserved block back if something fails, because
 		 * callers assume that on error block wasn't relocated and its
@@ -2838,11 +2882,11 @@ allocate_znode_update(znode * node, cons
    znode is returned but the coord is not set.  This function may cause atom
    fusion, but it is only used for read locks (at this point) and therefore
    fusion only occurs when the parent is already dirty. */
-/* Hans adds this note: remember to ask how expensive this operation is vs. storing parent
-   pointer in jnodes. */
+/* Hans adds this note: remember to ask how expensive this operation is vs.
+   storing parent pointer in jnodes. */
 static int
 jnode_lock_parent_coord(jnode * node,
-			coord_t * coord,
+			coord_t *coord,
 			lock_handle * parent_lh,
 			load_count * parent_zh,
 			znode_lock_mode parent_mode, int try)
@@ -2892,7 +2936,7 @@ jnode_lock_parent_coord(jnode * node,
 
 		ret = coord_by_key(jnode_get_tree(node), &key, coord, parent_lh,
 				   parent_mode, bias, stop_level, stop_level,
-				   CBK_UNIQUE, NULL /*ra_info */ );
+				   CBK_UNIQUE, NULL/*ra_info */);
 		switch (ret) {
 		case CBK_COORD_NOTFOUND:
 			assert("edward-1038",
@@ -2967,15 +3011,18 @@ jnode_lock_parent_coord(jnode * node,
 	return 0;
 }
 
-/* Get the (locked) next neighbor of a znode which is dirty and a member of the same atom.
-   If there is no next neighbor or the neighbor is not in memory or if there is a
-   neighbor but it is not dirty or not in the same atom, -E_NO_NEIGHBOR is returned.
-   In some cases the slum may include nodes which are not dirty, if so @check_dirty should be 0 */
+/* Get the (locked) next neighbor of a znode which is dirty and a member of the
+   same atom. If there is no next neighbor or the neighbor is not in memory or
+   if there is a neighbor but it is not dirty or not in the same atom,
+   -E_NO_NEIGHBOR is returned. In some cases the slum may include nodes which
+   are not dirty, if so @check_dirty should be 0 */
 static int neighbor_in_slum(znode * node,	/* starting point */
 			    lock_handle * lock,	/* lock on starting point */
-			    sideof side,	/* left or right direction we seek the next node in */
-			    znode_lock_mode mode,	/* kind of lock we want */
-			    int check_dirty, /* true if the neighbor should be dirty */
+			    sideof side,	/* left or right direction we
+						   seek the next node in */
+			    znode_lock_mode mode, /* kind of lock we want */
+			    int check_dirty, 	/* true if the neighbor should
+						   be dirty */
 			    int use_upper_levels /* get neighbor by going though
 						    upper levels */)
 {
@@ -2992,9 +3039,8 @@ static int neighbor_in_slum(znode * node
 	if (ret) {
 		/* May return -ENOENT or -E_NO_NEIGHBOR. */
 		/* FIXME(C): check EINVAL, E_DEADLOCK */
-		if (ret == -ENOENT) {
+		if (ret == -ENOENT)
 			ret = RETERR(-E_NO_NEIGHBOR);
-		}
 		return ret;
 	}
 	if (!check_dirty)
@@ -3007,8 +3053,8 @@ static int neighbor_in_slum(znode * node
 	return RETERR(-E_NO_NEIGHBOR);
 }
 
-/* Return true if two znodes have the same parent.  This is called with both nodes
-   write-locked (for squeezing) so no tree lock is needed. */
+/* Return true if two znodes have the same parent.  This is called with both
+   nodes write-locked (for squeezing) so no tree lock is needed. */
 static int znode_same_parents(znode * a, znode * b)
 {
 	int result;
@@ -3016,8 +3062,8 @@ static int znode_same_parents(znode * a,
 	assert("jmacd-7011", znode_is_write_locked(a));
 	assert("jmacd-7012", znode_is_write_locked(b));
 
-	/* We lock the whole tree for this check.... I really don't like whole tree
-	 * locks... -Hans */
+	/* We lock the whole tree for this check.... I really don't like whole
+	 * tree locks... -Hans */
 	read_lock_tree(znode_get_tree(a));
 	result = (znode_parent(a) == znode_parent(b));
 	read_unlock_tree(znode_get_tree(a));
@@ -3037,7 +3083,8 @@ static void scan_init(flush_scan * scan)
 	coord_init_invalid(&scan->parent_coord, NULL);
 }
 
-/* Release any resources held by the flush scan, e.g., release locks, free memory, etc. */
+/* Release any resources held by the flush scan, e.g. release locks,
+   free memory, etc. */
 static void scan_done(flush_scan * scan)
 {
 	done_load_count(&scan->node_load);
@@ -3057,8 +3104,9 @@ int reiser4_scan_finished(flush_scan * s
 			      scan->count >= scan->max_count);
 }
 
-/* Return true if the scan should continue to the @tonode.  True if the node meets the
-   same_slum_check condition.  If not, deref the "left" node and stop the scan. */
+/* Return true if the scan should continue to the @tonode. True if the node
+   meets the same_slum_check condition. If not, deref the "left" node and stop
+   the scan. */
 int reiser4_scan_goto(flush_scan * scan, jnode * tonode)
 {
 	int go = same_slum_check(scan->node, tonode, 1, 0);
@@ -3071,32 +3119,30 @@ int reiser4_scan_goto(flush_scan * scan,
 	return go;
 }
 
-/* Set the current scan->node, refcount it, increment count by the @add_count (number to
-   count, e.g., skipped unallocated nodes), deref previous current, and copy the current
-   parent coordinate. */
+/* Set the current scan->node, refcount it, increment count by the @add_count
+   (number to count, e.g., skipped unallocated nodes), deref previous current,
+   and copy the current parent coordinate. */
 int
 scan_set_current(flush_scan * scan, jnode * node, unsigned add_count,
-		 const coord_t * parent)
+		 const coord_t *parent)
 {
 	/* Release the old references, take the new reference. */
 	done_load_count(&scan->node_load);
 
-	if (scan->node != NULL) {
+	if (scan->node != NULL)
 		jput(scan->node);
-	}
 	scan->node = node;
 	scan->count += add_count;
 
-	/* This next stmt is somewhat inefficient.  The reiser4_scan_extent() code could
-	   delay this update step until it finishes and update the parent_coord only once.
-	   It did that before, but there was a bug and this was the easiest way to make it
-	   correct. */
-	if (parent != NULL) {
+	/* This next stmt is somewhat inefficient.  The reiser4_scan_extent()
+	   code could delay this update step until it finishes and update the
+	   parent_coord only once. It did that before, but there was a bug and
+	   this was the easiest way to make it correct. */
+	if (parent != NULL)
 		coord_dup(&scan->parent_coord, parent);
-	}
 
-	/* Failure may happen at the incr_load_count call, but the caller can assume the reference
-	   is safely taken. */
+	/* Failure may happen at the incr_load_count call, but the caller can
+	   assume the reference is safely taken. */
 	return incr_load_count_jnode(&scan->node_load, node);
 }
 
@@ -3106,37 +3152,41 @@ int reiser4_scanning_left(flush_scan * s
 	return scan->direction == LEFT_SIDE;
 }
 
-/* Performs leftward scanning starting from either kind of node.  Counts the starting
-   node.  The right-scan object is passed in for the left-scan in order to copy the parent
-   of an unformatted starting position.  This way we avoid searching for the unformatted
-   node's parent when scanning in each direction.  If we search for the parent once it is
-   set in both scan objects.  The limit parameter tells flush-scan when to stop.
-
-   Rapid scanning is used only during scan_left, where we are interested in finding the
-   'leftpoint' where we begin flushing.  We are interested in stopping at the left child
-   of a twig that does not have a dirty left neighbor.  THIS IS A SPECIAL CASE.  The
-   problem is finding a way to flush only those nodes without unallocated children, and it
-   is difficult to solve in the bottom-up flushing algorithm we are currently using.  The
-   problem can be solved by scanning left at every level as we go upward, but this would
-   basically bring us back to using a top-down allocation strategy, which we already tried
-   (see BK history from May 2002), and has a different set of problems.  The top-down
-   strategy makes avoiding unallocated children easier, but makes it difficult to
-   propertly flush dirty children with clean parents that would otherwise stop the
-   top-down flush, only later to dirty the parent once the children are flushed.  So we
-   solve the problem in the bottom-up algorithm with a special case for twigs and leaves
-   only.
-
-   The first step in solving the problem is this rapid leftward scan.  After we determine
-   that there are at least enough nodes counted to qualify for FLUSH_RELOCATE_THRESHOLD we
-   are no longer interested in the exact count, we are only interested in finding a the
-   best place to start the flush.  We could choose one of two possibilities:
-
-   1. Stop at the leftmost child (of a twig) that does not have a dirty left neighbor.
-   This requires checking one leaf per rapid-scan twig
-
-   2. Stop at the leftmost child (of a twig) where there are no dirty children of the twig
-   to the left.  This requires checking possibly all of the in-memory children of each
-   twig during the rapid scan.
+/* Performs leftward scanning starting from either kind of node. Counts the
+   starting node. The right-scan object is passed in for the left-scan in order
+   to copy the parent of an unformatted starting position. This way we avoid
+   searching for the unformatted node's parent when scanning in each direction.
+   If we search for the parent once it is set in both scan objects. The limit
+   parameter tells flush-scan when to stop.
+
+   Rapid scanning is used only during scan_left, where we are interested in
+   finding the 'leftpoint' where we begin flushing. We are interested in
+   stopping at the left child of a twig that does not have a dirty left
+   neighbour. THIS IS A SPECIAL CASE. The problem is finding a way to flush only
+   those nodes without unallocated children, and it is difficult to solve in the
+   bottom-up flushing algorithm we are currently using. The problem can be
+   solved by scanning left at every level as we go upward, but this would
+   basically bring us back to using a top-down allocation strategy, which we
+   already tried (see BK history from May 2002), and has a different set of
+   problems. The top-down strategy makes avoiding unallocated children easier,
+   but makes it difficult to propertly flush dirty children with clean parents
+   that would otherwise stop the top-down flush, only later to dirty the parent
+   once the children are flushed. So we solve the problem in the bottom-up
+   algorithm with a special case for twigs and leaves only.
+
+   The first step in solving the problem is this rapid leftward scan.  After we
+   determine that there are at least enough nodes counted to qualify for
+   FLUSH_RELOCATE_THRESHOLD we are no longer interested in the exact count, we
+   are only interested in finding the best place to start the flush.
+
+   We could choose one of two possibilities:
+
+   1. Stop at the leftmost child (of a twig) that does not have a dirty left
+   neighbor. This requires checking one leaf per rapid-scan twig
+
+   2. Stop at the leftmost child (of a twig) where there are no dirty children
+   of the twig to the left. This requires checking possibly all of the in-memory
+   children of each twig during the rapid scan.
 
    For now we implement the first policy.
 */
@@ -3149,35 +3199,35 @@ scan_left(flush_scan * scan, flush_scan 
 	scan->direction = LEFT_SIDE;
 
 	ret = scan_set_current(scan, jref(node), 1, NULL);
-	if (ret != 0) {
+	if (ret != 0)
 		return ret;
-	}
 
 	ret = scan_common(scan, right);
-	if (ret != 0) {
+	if (ret != 0)
 		return ret;
-	}
 
-	/* Before rapid scanning, we need a lock on scan->node so that we can get its
-	   parent, only if formatted. */
+	/* Before rapid scanning, we need a lock on scan->node so that we can
+	   get its parent, only if formatted. */
 	if (jnode_is_znode(scan->node)) {
 		ret = longterm_lock_znode(&scan->node_lock, JZNODE(scan->node),
 					  ZNODE_WRITE_LOCK, ZNODE_LOCK_LOPRI);
 	}
 
-	/* Rapid_scan would go here (with limit set to FLUSH_RELOCATE_THRESHOLD). */
+	/* Rapid_scan would go here (with limit set to FLUSH_RELOCATE_THRESHOLD)
+	*/
 	return ret;
 }
 
-/* Performs rightward scanning... Does not count the starting node.  The limit parameter
-   is described in scan_left.  If the starting node is unformatted then the
-   parent_coord was already set during scan_left.  The rapid_after parameter is not used
-   during right-scanning.
+/* Performs rightward scanning... Does not count the starting node. The limit
+   parameter is described in scan_left. If the starting node is unformatted then
+   the parent_coord was already set during scan_left. The rapid_after parameter
+   is not used during right-scanning.
 
    scan_right is only called if the scan_left operation does not count at least
-   FLUSH_RELOCATE_THRESHOLD nodes for flushing.  Otherwise, the limit parameter is set to
-   the difference between scan-left's count and FLUSH_RELOCATE_THRESHOLD, meaning
-   scan-right counts as high as FLUSH_RELOCATE_THRESHOLD and then stops. */
+   FLUSH_RELOCATE_THRESHOLD nodes for flushing.  Otherwise, the limit parameter
+   is set to the difference between scan-left's count and
+   FLUSH_RELOCATE_THRESHOLD, meaning scan-right counts as high as
+   FLUSH_RELOCATE_THRESHOLD and then stops. */
 static int scan_right(flush_scan * scan, jnode * node, unsigned limit)
 {
 	int ret;
@@ -3186,9 +3236,8 @@ static int scan_right(flush_scan * scan,
 	scan->direction = RIGHT_SIDE;
 
 	ret = scan_set_current(scan, jref(node), 0, NULL);
-	if (ret != 0) {
+	if (ret != 0)
 		return ret;
-	}
 
 	return scan_common(scan, NULL);
 }
@@ -3202,24 +3251,24 @@ static int scan_common(flush_scan * scan
 	assert("edward-54", jnode_is_unformatted(scan->node)
 	       || jnode_is_znode(scan->node));
 
-	/* Special case for starting at an unformatted node.  Optimization: we only want
-	   to search for the parent (which requires a tree traversal) once.  Obviously, we
-	   shouldn't have to call it once for the left scan and once for the right scan.
-	   For this reason, if we search for the parent during scan-left we then duplicate
-	   the coord/lock/load into the scan-right object. */
+	/* Special case for starting at an unformatted node. Optimization: we
+	   only want to search for the parent (which requires a tree traversal)
+	   once. Obviously, we shouldn't have to call it once for the left scan
+	   and once for the right scan. For this reason, if we search for the
+	   parent during scan-left we then duplicate the coord/lock/load into
+	   the scan-right object. */
 	if (jnode_is_unformatted(scan->node)) {
 		ret = scan_unformatted(scan, other);
 		if (ret != 0)
 			return ret;
 	}
-	/* This loop expects to start at a formatted position and performs chaining of
-	   formatted regions */
+	/* This loop expects to start at a formatted position and performs
+	   chaining of formatted regions */
 	while (!reiser4_scan_finished(scan)) {
 
 		ret = scan_formatted(scan);
-		if (ret != 0) {
+		if (ret != 0)
 			return ret;
-		}
 	}
 
 	return 0;
@@ -3263,8 +3312,9 @@ static int scan_unformatted(flush_scan *
 					ZNODE_LOCK_LOPRI :
 					ZNODE_LOCK_HIPRI);
 		if (ret != 0)
-			/* EINVAL or E_DEADLOCK here mean... try again!  At this point we've
-			   scanned too far and can't back out, just start over. */
+			/* EINVAL or E_DEADLOCK here mean... try again!  At this
+			   point we've scanned too far and can't back out, just
+			   start over. */
 			return ret;
 
 		ret = jnode_lock_parent_coord(scan->node,
@@ -3305,12 +3355,12 @@ static int scan_unformatted(flush_scan *
 		copy_lh(&other->parent_lock, &scan->parent_lock);
 		copy_load_count(&other->parent_load, &scan->parent_load);
 	}
-      scan:
+scan:
 	return scan_by_coord(scan);
 }
 
-/* Performs left- or rightward scanning starting from a formatted node. Follow left
-   pointers under tree lock as long as:
+/* Performs left- or rightward scanning starting from a formatted node. Follow
+   left pointers under tree lock as long as:
 
    - node->left/right is non-NULL
    - node->left/right is connected, dirty
@@ -3336,41 +3386,38 @@ static int scan_formatted(flush_scan * s
 		/* Lock the tree, check-for and reference the next sibling. */
 		read_lock_tree(znode_get_tree(node));
 
-		/* It may be that a node is inserted or removed between a node and its
-		   left sibling while the tree lock is released, but the flush-scan count
-		   does not need to be precise.  Thus, we release the tree lock as soon as
-		   we get the neighboring node. */
+		/* It may be that a node is inserted or removed between a node
+		   and its left sibling while the tree lock is released, but the
+		   flush-scan count does not need to be precise. Thus, we
+		   release the tree lock as soon as we get the neighboring node.
+		*/
 		neighbor =
 			reiser4_scanning_left(scan) ? node->left : node->right;
-		if (neighbor != NULL) {
+		if (neighbor != NULL)
 			zref(neighbor);
-		}
 
 		read_unlock_tree(znode_get_tree(node));
 
-		/* If neighbor is NULL at the leaf level, need to check for an unformatted
-		   sibling using the parent--break in any case. */
-		if (neighbor == NULL) {
+		/* If neighbor is NULL at the leaf level, need to check for an
+		   unformatted sibling using the parent--break in any case. */
+		if (neighbor == NULL)
 			break;
-		}
 
-		/* Check the condition for going left, break if it is not met.  This also
-		   releases (jputs) the neighbor if false. */
-		if (!reiser4_scan_goto(scan, ZJNODE(neighbor))) {
+		/* Check the condition for going left, break if it is not met.
+		   This also releases (jputs) the neighbor if false. */
+		if (!reiser4_scan_goto(scan, ZJNODE(neighbor)))
 			break;
-		}
 
 		/* Advance the flush_scan state to the left, repeat. */
 		ret = scan_set_current(scan, ZJNODE(neighbor), 1, NULL);
-		if (ret != 0) {
+		if (ret != 0)
 			return ret;
-		}
 
 	} while (!reiser4_scan_finished(scan));
 
-	/* If neighbor is NULL then we reached the end of a formatted region, or else the
-	   sibling is out of memory, now check for an extent to the left (as long as
-	   LEAF_LEVEL). */
+	/* If neighbor is NULL then we reached the end of a formatted region, or
+	   else the sibling is out of memory, now check for an extent to the
+	   left (as long as LEAF_LEVEL). */
 	if (neighbor != NULL || jnode_get_level(scan->node) != LEAF_LEVEL
 	    || reiser4_scan_finished(scan)) {
 		scan->stop = 1;
@@ -3384,12 +3431,13 @@ static int scan_formatted(flush_scan * s
 }
 
 /* NOTE-EDWARD:
-   This scans adjacent items of the same type and calls scan flush plugin for each one.
-   Performs left(right)ward scanning starting from a (possibly) unformatted node.  If we start
-   from unformatted node, then we continue only if the next neighbor is also unformatted.
-   When called from scan_formatted, we skip first iteration (to make sure that
-   right(left)most item of the left(right) neighbor on the parent level is of the same
-   type and set appropriate coord). */
+   This scans adjacent items of the same type and calls scan flush plugin for
+   each one. Performs left(right)ward scanning starting from a (possibly)
+   unformatted node. If we start from unformatted node, then we continue only if
+   the next neighbor is also unformatted. When called from scan_formatted, we
+   skip first iteration (to make sure that right(left)most item of the
+   left(right) neighbor on the parent level is of the same type and set
+   appropriate coord). */
 static int scan_by_coord(flush_scan * scan)
 {
 	int ret = 0;
@@ -3409,8 +3457,8 @@ static int scan_by_coord(flush_scan * sc
 
 	for (; !reiser4_scan_finished(scan); scan_this_coord = 1) {
 		if (scan_this_coord) {
-			/* Here we expect that unit is scannable. it would not be so due
-			 * to race with extent->tail conversion.  */
+			/* Here we expect that unit is scannable. it would not
+			 * be so due to race with extent->tail conversion.  */
 			if (iplug->f.scan == NULL) {
 				scan->stop = 1;
 				ret = -E_REPEAT;
@@ -3430,8 +3478,8 @@ static int scan_by_coord(flush_scan * sc
 			/* the same race against truncate as above is possible
 			 * here, it seems */
 
-			/* NOTE-JMACD: In this case, apply the same end-of-node logic but don't scan
-			   the first coordinate. */
+			/* NOTE-JMACD: In this case, apply the same end-of-node
+			   logic but don't scan the first coordinate. */
 			assert("jmacd-1231",
 			       item_is_internal(&scan->parent_coord));
 		}
@@ -3441,7 +3489,8 @@ static int scan_by_coord(flush_scan * sc
 			/* stop this coord and continue on parrent level */
 			ret =
 			    scan_set_current(scan,
-					     ZJNODE(zref
+					     ZJNODE(zrefI3412
+
 						    (scan->parent_coord.node)),
 					     1, NULL);
 			if (ret != 0)
@@ -3449,15 +3498,15 @@ static int scan_by_coord(flush_scan * sc
 			break;
 		}
 
-		/* Either way, the invariant is that scan->parent_coord is set to the
-		   parent of scan->node. Now get the next unit. */
+		/* Either way, the invariant is that scan->parent_coord is set
+		   to the parent of scan->node. Now get the next unit. */
 		coord_dup(&next_coord, &scan->parent_coord);
 		coord_sideof_unit(&next_coord, scan->direction);
 
 		/* If off-the-end of the twig, try the next twig. */
 		if (coord_is_after_sideof_unit(&next_coord, scan->direction)) {
-			/* We take the write lock because we may start flushing from this
-			 * coordinate. */
+			/* We take the write lock because we may start flushing
+			 * from this coordinate. */
 			ret = neighbor_in_slum(next_coord.node,
 					       &next_lock,
 					       scan->direction,
@@ -3471,14 +3520,12 @@ static int scan_by_coord(flush_scan * sc
 				break;
 			}
 
-			if (ret != 0) {
+			if (ret != 0)
 				goto exit;
-			}
 
 			ret = incr_load_count_znode(&next_load, next_lock.node);
-			if (ret != 0) {
+			if (ret != 0)
 				goto exit;
-			}
 
 			coord_init_sideof_unit(&next_coord, next_lock.node,
 					       sideof_reverse(scan->direction));
@@ -3516,8 +3563,8 @@ static int scan_by_coord(flush_scan * sc
 		if (ret != 0)
 			goto exit;
 
-		/* Now continue.  If formatted we release the parent lock and return, then
-		   proceed. */
+		/* Now continue.  If formatted we release the parent lock and
+		   return, then proceed. */
 		if (jnode_is_znode(child))
 			break;
 
@@ -3531,9 +3578,9 @@ static int scan_by_coord(flush_scan * sc
 
 	assert("jmacd-6233",
 	       reiser4_scan_finished(scan) || jnode_is_znode(scan->node));
-      exit:
+exit:
 	checkchild(scan);
-      race:			/* skip the above check  */
+race:			/* skip the above check  */
 	if (jnode_is_znode(scan->node)) {
 		done_lh(&scan->parent_lock);
 		done_load_count(&scan->parent_load);
@@ -3547,7 +3594,7 @@ static int scan_by_coord(flush_scan * sc
 /* FLUSH POS HELPERS */
 
 /* Initialize the fields of a flush_position. */
-static void pos_init(flush_pos_t * pos)
+static void pos_init(flush_pos_t *pos)
 {
 	memset(pos, 0, sizeof *pos);
 
@@ -3559,25 +3606,26 @@ static void pos_init(flush_pos_t * pos)
 	reiser4_blocknr_hint_init(&pos->preceder);
 }
 
-/* The flush loop inside squalloc periodically checks pos_valid to
-   determine when "enough flushing" has been performed.  This will return true until one
+/* The flush loop inside squalloc periodically checks pos_valid to determine
+   when "enough flushing" has been performed. This will return true until one
    of the following conditions is met:
 
-   1. the number of flush-queued nodes has reached the kernel-supplied "int *nr_to_flush"
-   parameter, meaning we have flushed as many blocks as the kernel requested.  When
-   flushing to commit, this parameter is NULL.
+   1. the number of flush-queued nodes has reached the kernel-supplied
+   "int *nr_to_flush" parameter, meaning we have flushed as many blocks as the
+   kernel requested. When flushing to commit, this parameter is NULL.
 
-   2. pos_stop() is called because squalloc discovers that the "next" node in the
-   flush order is either non-existant, not dirty, or not in the same atom.
+   2. pos_stop() is called because squalloc discovers that the "next" node in
+   the flush order is either non-existant, not dirty, or not in the same atom.
 */
 
-static int pos_valid(flush_pos_t * pos)
+static int pos_valid(flush_pos_t *pos)
 {
 	return pos->state != POS_INVALID;
 }
 
-/* Release any resources of a flush_position.  Called when jnode_flush finishes. */
-static void pos_done(flush_pos_t * pos)
+/* Release any resources of a flush_position. Called when jnode_flush
+   finishes. */
+static void pos_done(flush_pos_t *pos)
 {
 	pos_stop(pos);
 	reiser4_blocknr_hint_done(&pos->preceder);
@@ -3587,7 +3635,7 @@ static void pos_done(flush_pos_t * pos)
 
 /* Reset the point and parent.  Called during flush subroutines to terminate the
    squalloc loop. */
-static int pos_stop(flush_pos_t * pos)
+static int pos_stop(flush_pos_t *pos)
 {
 	pos->state = POS_INVALID;
 	done_lh(&pos->lock);
@@ -3603,12 +3651,12 @@ static int pos_stop(flush_pos_t * pos)
 }
 
 /* Return the flush_position's block allocator hint. */
-reiser4_blocknr_hint *reiser4_pos_hint(flush_pos_t * pos)
+reiser4_blocknr_hint *reiser4_pos_hint(flush_pos_t *pos)
 {
 	return &pos->preceder;
 }
 
-flush_queue_t * reiser4_pos_fq(flush_pos_t * pos)
+flush_queue_t *reiser4_pos_fq(flush_pos_t *pos)
 {
 	return pos->fq;
 }

--=-2t7guL+HG1LPlY3yTVig--

