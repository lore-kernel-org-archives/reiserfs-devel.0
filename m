From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 21/8] cleanup flush.c part 2
Date: Wed, 24 Oct 2007 11:56:11 +0200
Message-ID: <1193219771.24225.1.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-y9YdSq/5BWKS8vMhZBYH"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-y9YdSq/5BWKS8vMhZBYH
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

flush.c now on only total: 3 errors, 2 warnings, 3704 lines checked

--=-y9YdSq/5BWKS8vMhZBYH
Content-Disposition: attachment; filename=flush.c.patch2
Content-Type: text/plain; name=flush.c.patch2; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- flush.c.orig	2007-10-24 11:02:28.000000000 +0200
+++ flush.c	2007-10-24 11:53:21.000000000 +0200
@@ -138,242 +138,261 @@
 */
 
 /* FLUSH_PREP_ONCE_PER_TRANSACTION: Within a single transaction a node is never
-   flushprepped twice (unless an explicit call to flush_unprep is made as described in
-   detail below).  For example a node is dirtied, allocated, and then early-flushed to
-   disk and set clean.  Before the transaction commits, the page is dirtied again and, due
-   to memory pressure, the node is flushed again.  The flush algorithm will not relocate
-   the node to a new disk location, it will simply write it to the same, previously
-   relocated position again.
+   flushprepped twice (unless an explicit call to flush_unprep is made as
+   described in detail below). For example a node is dirtied, allocated, and
+   then early-flushed to disk and set clean. Before the transaction commits, the
+   page is dirtied again and, due to memory pressure, the node is flushed again.
+   The flush algorithm will not relocate the node to a new disk location, it
+   will simply write it to the same, previously relocated position again.
 */
 
-/* THE BOTTOM-UP VS. TOP-DOWN ISSUE: This code implements a bottom-up algorithm where we
-   start at a leaf node and allocate in parent-first order by iterating to the right.  At
-   each step of the iteration, we check for the right neighbor.  Before advancing to the
-   right neighbor, we check if the current position and the right neighbor share the same
-   parent.  If they do not share the same parent, the parent is allocated before the right
-   neighbor.
-
-   This process goes recursively up the tree and squeeze nodes level by level as long as
-   the right neighbor and the current position have different parents, then it allocates
-   the right-neighbors-with-different-parents on the way back down.  This process is
-   described in more detail in flush_squalloc_changed_ancestor and the recursive function
-   squalloc_one_changed_ancestor.  But the purpose here is not to discuss the
-   specifics of the bottom-up approach as it is to contrast the bottom-up and top-down
-   approaches.
-
-   The top-down algorithm was implemented earlier (April-May 2002).  In the top-down
-   approach, we find a starting point by scanning left along each level past dirty nodes,
-   then going up and repeating the process until the left node and the parent node are
-   clean.  We then perform a parent-first traversal from the starting point, which makes
-   allocating in parent-first order trivial.  After one subtree has been allocated in this
-   manner, we move to the right, try moving upward, then repeat the parent-first
-   traversal.
-
-   Both approaches have problems that need to be addressed.  Both are approximately the
-   same amount of code, but the bottom-up approach has advantages in the order it acquires
-   locks which, at the very least, make it the better approach.  At first glance each one
-   makes the other one look simpler, so it is important to remember a few of the problems
-   with each one.
-
-   Main problem with the top-down approach: When you encounter a clean child during the
-   parent-first traversal, what do you do?  You would like to avoid searching through a
-   large tree of nodes just to find a few dirty leaves at the bottom, and there is not an
-   obvious solution.  One of the advantages of the top-down approach is that during the
-   parent-first traversal you check every child of a parent to see if it is dirty.  In
-   this way, the top-down approach easily handles the main problem of the bottom-up
-   approach: unallocated children.
-
-   The unallocated children problem is that before writing a node to disk we must make
-   sure that all of its children are allocated.  Otherwise, the writing the node means
-   extra I/O because the node will have to be written again when the child is finally
-   allocated.
-
-   WE HAVE NOT YET ELIMINATED THE UNALLOCATED CHILDREN PROBLEM.  Except for bugs, this
-   should not cause any file system corruption, it only degrades I/O performance because a
-   node may be written when it is sure to be written at least one more time in the same
-   transaction when the remaining children are allocated.  What follows is a description
-   of how we will solve the problem.
+/* THE BOTTOM-UP VS. TOP-DOWN ISSUE: This code implements a bottom-up algorithm
+   where we start at a leaf node and allocate in parent-first order by iterating
+   to the right. At each step of the iteration, we check for the right neighbor.
+   Before advancing to the right neighbor, we check if the current position and
+   the right neighbor share the same parent. If they do not share the same
+   parent, the parent is allocated before the right neighbor.
+
+   This process goes recursively up the tree and squeeze nodes level by level as
+   long as the right neighbor and the current position have different parents,
+   then it allocates the right-neighbors-with-different-parents on the way back
+   down. This process is described in more detail in
+   flush_squalloc_changed_ancestor and the recursive function
+   squalloc_one_changed_ancestor. But the purpose here is not to discuss the
+   specifics of the bottom-up approach as it is to contrast the bottom-up and
+   top-down approaches.
+
+   The top-down algorithm was implemented earlier (April-May 2002). In the
+   top-down approach, we find a starting point by scanning left along each level
+   past dirty nodes, then going up and repeating the process until the left node
+   and the parent node are clean. We then perform a parent-first traversal from
+   the starting point, which makes allocating in parent-first order trivial.
+   After one subtree has been allocated in this manner, we move to the right,
+   try moving upward, then repeat the parent-first traversal.
+
+   Both approaches have problems that need to be addressed. Both are
+   approximately the same amount of code, but the bottom-up approach has
+   advantages in the order it acquires locks which, at the very least, make it
+   the better approach. At first glance each one makes the other one look
+   simpler, so it is important to remember a few of the problems with each one.
+
+   Main problem with the top-down approach: When you encounter a clean child
+   during the parent-first traversal, what do you do? You would like to avoid
+   searching through a large tree of nodes just to find a few dirty leaves at
+   the bottom, and there is not an obvious solution. One of the advantages of
+   the top-down approach is that during the parent-first traversal you check
+   every child of a parent to see if it is dirty. In this way, the top-down
+   approach easily handles the main problem of the bottom-up approach:
+   unallocated children.
+
+   The unallocated children problem is that before writing a node to disk we
+   must make sure that all of its children are allocated. Otherwise, the writing
+   the node means extra I/O because the node will have to be written again when
+   the child is finally allocated.
+
+   WE HAVE NOT YET ELIMINATED THE UNALLOCATED CHILDREN PROBLEM. Except for bugs,
+   this should not cause any file system corruption, it only degrades I/O
+   performance because a node may be written when it is sure to be written at
+   least one more time in the same transaction when the remaining children are
+   allocated. What follows is a description of how we will solve the problem.
 */
 
-/* HANDLING UNALLOCATED CHILDREN: During flush we may allocate a parent node then,
-   proceeding in parent first order, allocate some of its left-children, then encounter a
-   clean child in the middle of the parent.  We do not allocate the clean child, but there
-   may remain unallocated (dirty) children to the right of the clean child.  If we were to
-   stop flushing at this moment and write everything to disk, the parent might still
-   contain unallocated children.
-
-   We could try to allocate all the descendents of every node that we allocate, but this
-   is not necessary.  Doing so could result in allocating the entire tree: if the root
-   node is allocated then every unallocated node would have to be allocated before
-   flushing.  Actually, we do not have to write a node just because we allocate it.  It is
-   possible to allocate but not write a node during flush, when it still has unallocated
-   children.  However, this approach is probably not optimal for the following reason.
-
-   The flush algorithm is designed to allocate nodes in parent-first order in an attempt
-   to optimize reads that occur in the same order.  Thus we are read-optimizing for a
-   left-to-right scan through all the leaves in the system, and we are hoping to
-   write-optimize at the same time because those nodes will be written together in batch.
-   What happens, however, if we assign a block number to a node in its read-optimized
-   order but then avoid writing it because it has unallocated children?  In that
-   situation, we lose out on the write-optimization aspect because a node will have to be
-   written again to the its location on the device, later, which likely means seeking back
-   to that location.
+/* HANDLING UNALLOCATED CHILDREN: During flush we may allocate a parent node,
+   then proceeding in parent first order, allocate some of its left-children,
+   then encounter a clean child in the middle of the parent. We do not allocate
+   the clean child, but there may remain unallocated (dirty) children to the
+   right of the clean child. If we were to stop flushing at this moment and
+   write everything to disk, the parent might still contain unallocated
+   children.
+
+   We could try to allocate all the descendents of every node that we allocate,
+   but this is not necessary. Doing so could result in allocating the entire
+   tree: if the root node is allocated then every unallocated node would have to
+   be allocated before flushing. Actually, we do not have to write a node just
+   because we allocate it. It is possible to allocate but not write a node
+   during flush, when it still has unallocated children. However, this approach
+   is probably not optimal for the following reason.
+
+   The flush algorithm is designed to allocate nodes in parent-first order in an
+   attempt to optimize reads that occur in the same order. Thus we are
+   read-optimizing for a left-to-right scan through all the leaves in the
+   system, and we are hoping to write-optimize at the same time because those
+   nodes will be written together in batch. What happens, however, if we assign
+   a block number to a node in its read-optimized order but then avoid writing
+   it because it has unallocated children? In that situation, we lose out on the
+   write-optimization aspect because a node will have to be written again to the
+   its location on the device, later, which likely means seeking back to that
+   location.
 
    So there are tradeoffs. We can choose either:
 
    A. Allocate all unallocated children to preserve both write-optimization and
-   read-optimization, but this is not always desirable because it may mean having to
-   allocate and flush very many nodes at once.
+   read-optimization, but this is not always desirable because it may mean
+   having to allocate and flush very many nodes at once.
 
-   B. Defer writing nodes with unallocated children, keep their read-optimized locations,
-   but sacrifice write-optimization because those nodes will be written again.
-
-   C. Defer writing nodes with unallocated children, but do not keep their read-optimized
-   locations.  Instead, choose to write-optimize them later, when they are written.  To
-   facilitate this, we "undo" the read-optimized allocation that was given to the node so
-   that later it can be write-optimized, thus "unpreparing" the flush decision.  This is a
-   case where we disturb the FLUSH_PREP_ONCE_PER_TRANSACTION rule described above.  By a
-   call to flush_unprep() we will: if the node was wandered, unset the JNODE_OVRWR bit;
-   if the node was relocated, unset the JNODE_RELOC bit, non-deferred-deallocate its block
-   location, and set the JNODE_CREATED bit, effectively setting the node back to an
-   unallocated state.
-
-   We will take the following approach in v4.0: for twig nodes we will always finish
-   allocating unallocated children (A).  For nodes with (level > TWIG) we will defer
-   writing and choose write-optimization (C).
-
-   To summarize, there are several parts to a solution that avoids the problem with
-   unallocated children:
-
-   FIXME-ZAM: Still no one approach is implemented to eliminate the "UNALLOCATED CHILDREN"
-   problem because there was an experiment which was done showed that we have 1-2 nodes
-   with unallocated children for thousands of written nodes.  The experiment was simple
-   like coping / deletion of linux kernel sources.  However the problem can arise in more
-   complex tests.  I think we have jnode_io_hook to insert a check for unallocated
-   children and see what kind of problem we have.
-
-   1. When flush reaches a stopping point (e.g., a clean node), it should continue calling
-   squeeze-and-allocate on any remaining unallocated children.  FIXME: Difficulty to
-   implement: should be simple -- amounts to adding a while loop to jnode_flush, see
-   comments in that function.
-
-   2. When flush reaches flush_empty_queue(), some of the (level > TWIG) nodes may still
-   have unallocated children.  If the twig level has unallocated children it is an
-   assertion failure.  If a higher-level node has unallocated children, then it should be
-   explicitly de-allocated by a call to flush_unprep().  FIXME: Difficulty to implement:
-   should be simple.
-
-   3. (CPU-Optimization) Checking whether a node has unallocated children may consume more
-   CPU cycles than we would like, and it is possible (but medium complexity) to optimize
-   this somewhat in the case where large sub-trees are flushed.  The following observation
-   helps: if both the left- and right-neighbor of a node are processed by the flush
-   algorithm then the node itself is guaranteed to have all of its children allocated.
-   However, the cost of this check may not be so expensive after all: it is not needed for
-   leaves and flush can guarantee this property for twigs.  That leaves only (level >
-   TWIG) nodes that have to be checked, so this optimization only helps if at least three
-   (level > TWIG) nodes are flushed in one pass, and the savings will be very small unless
-   there are many more (level > TWIG) nodes.  But if there are many (level > TWIG) nodes
-   then the number of blocks being written will be very large, so the savings may be
-   insignificant.  That said, the idea is to maintain both the left and right edges of
-   nodes that are processed in flush.  When flush_empty_queue() is called, a relatively
-   simple test will tell whether the (level > TWIG) node is on the edge.  If it is on the
-   edge, the slow check is necessary, but if it is in the interior then it can be assumed
-   to have all of its children allocated.  FIXME: medium complexity to implement, but
-   simple to verify given that we must have a slow check anyway.
-
-   4. (Optional) This part is optional, not for v4.0--flush should work independently of
-   whether this option is used or not.  Called RAPID_SCAN, the idea is to amend the
-   left-scan operation to take unallocated children into account.  Normally, the left-scan
-   operation goes left as long as adjacent nodes are dirty up until some large maximum
-   value (FLUSH_SCAN_MAXNODES) at which point it stops and begins flushing.  But scan-left
-   may stop at a position where there are unallocated children to the left with the same
-   parent.  When RAPID_SCAN is enabled, the ordinary scan-left operation stops after
-   FLUSH_RELOCATE_THRESHOLD, which is much smaller than FLUSH_SCAN_MAXNODES, then procedes
-   with a rapid scan.  The rapid scan skips all the interior children of a node--if the
-   leftmost child of a twig is dirty, check its left neighbor (the rightmost child of the
-   twig to the left).  If the left neighbor of the leftmost child is also dirty, then
-   continue the scan at the left twig and repeat.  This option will cause flush to
-   allocate more twigs in a single pass, but it also has the potential to write many more
-   nodes than would otherwise be written without the RAPID_SCAN option.  RAPID_SCAN
-   was partially implemented, code removed August 12, 2002 by JMACD.
+   B. Defer writing nodes with unallocated children, keep their read-optimized
+   locations, but sacrifice write-optimization because those nodes will be
+   written again.
+
+   C. Defer writing nodes with unallocated children, but do not keep their
+   read-optimized locations. Instead, choose to write-optimize them later, when
+   they are written. To facilitate this, we "undo" the read-optimized allocation
+   that was given to the node so that later it can be write-optimized, thus
+   "unpreparing" the flush decision. This is a case where we disturb the
+   FLUSH_PREP_ONCE_PER_TRANSACTION rule described above. By a call to
+   flush_unprep() we will: if the node was wandered, unset the JNODE_OVRWR bit;
+   if the node was relocated, unset the JNODE_RELOC bit, non-deferred-deallocate
+   its block location, and set the JNODE_CREATED bit, effectively setting the
+   node back to an unallocated state.
+
+   We will take the following approach in v4.0: for twig nodes we will always
+   finish allocating unallocated children (A).  For nodes with (level > TWIG)
+   we will defer writing and choose write-optimization (C).
+
+   To summarize, there are several parts to a solution that avoids the problem
+   with unallocated children:
+
+   FIXME-ZAM: Still no one approach is implemented to eliminate the
+   "UNALLOCATED CHILDREN" problem because there was an experiment which was done
+   showed that we have 1-2 nodes with unallocated children for thousands of
+   written nodes. The experiment was simple like coping/deletion of linux kernel
+   sources. However the problem can arise in more complex tests. I think we have
+   jnode_io_hook to insert a check for unallocated children and see what kind of
+   problem we have.
+
+   1. When flush reaches a stopping point (e.g. a clean node) it should continue
+   calling squeeze-and-allocate on any remaining unallocated children.
+   FIXME: Difficulty to implement: should be simple -- amounts to adding a while
+   loop to jnode_flush, see comments in that function.
+
+   2. When flush reaches flush_empty_queue(), some of the (level > TWIG) nodes
+   may still have unallocated children. If the twig level has unallocated
+   children it is an assertion failure. If a higher-level node has unallocated
+   children, then it should be explicitly de-allocated by a call to
+   flush_unprep().
+   FIXME: Difficulty to implement: should be simple.
+
+   3. (CPU-Optimization) Checking whether a node has unallocated children may
+   consume more CPU cycles than we would like, and it is possible (but medium
+   complexity) to optimize this somewhat in the case where large sub-trees are
+   flushed. The following observation helps: if both the left- and
+   right-neighbor of a node are processed by the flush algorithm then the node
+   itself is guaranteed to have all of its children allocated. However, the cost
+   of this check may not be so expensive after all: it is not needed for leaves
+   and flush can guarantee this property for twigs. That leaves only (level >
+   TWIG) nodes that have to be checked, so this optimization only helps if at
+   least three (level > TWIG) nodes are flushed in one pass, and the savings
+   will be very small unless there are many more (level > TWIG) nodes. But if
+   there are many (level > TWIG) nodes then the number of blocks being written
+   will be very large, so the savings may be insignificant. That said, the idea
+   is to maintain both the left and right edges of nodes that are processed in
+   flush.  When flush_empty_queue() is called, a relatively simple test will
+   tell whether the (level > TWIG) node is on the edge. If it is on the edge,
+   the slow check is necessary, but if it is in the interior then it can be
+   assumed to have all of its children allocated. FIXME: medium complexity to
+   implement, but simple to verify given that we must have a slow check anyway.
+
+   4. (Optional) This part is optional, not for v4.0--flush should work
+   independently of whether this option is used or not. Called RAPID_SCAN, the
+   idea is to amend the left-scan operation to take unallocated children into
+   account. Normally, the left-scan operation goes left as long as adjacent
+   nodes are dirty up until some large maximum value (FLUSH_SCAN_MAXNODES) at
+   which point it stops and begins flushing. But scan-left may stop at a
+   position where there are unallocated children to the left with the same
+   parent. When RAPID_SCAN is enabled, the ordinary scan-left operation stops
+   after FLUSH_RELOCATE_THRESHOLD, which is much smaller than
+   FLUSH_SCAN_MAXNODES, then procedes with a rapid scan. The rapid scan skips
+   all the interior children of a node--if the leftmost child of a twig is
+   dirty, check its left neighbor (the rightmost child of the twig to the left).
+   If the left neighbor of the leftmost child is also dirty, then continue the
+   scan at the left twig and repeat.  This option will cause flush to allocate
+   more twigs in a single pass, but it also has the potential to write many more
+   nodes than would otherwise be written without the RAPID_SCAN option.
+   RAPID_SCAN was partially implemented, code removed August 12, 2002 by JMACD.
 */
 
-/* FLUSH CALLED ON NON-LEAF LEVEL.  Most of our design considerations assume that the
-   starting point for flush is a leaf node, but actually the flush code cares very little
-   about whether or not this is true.  It is possible that all the leaf nodes are flushed
-   and dirty parent nodes still remain, in which case jnode_flush() is called on a
-   non-leaf argument.  Flush doesn't care--it treats the argument node as if it were a
-   leaf, even when it is not.  This is a simple approach, and there may be a more optimal
-   policy but until a problem with this approach is discovered, simplest is probably best.
-
-   NOTE: In this case, the ordering produced by flush is parent-first only if you ignore
-   the leaves.  This is done as a matter of simplicity and there is only one (shaky)
-   justification.  When an atom commits, it flushes all leaf level nodes first, followed
-   by twigs, and so on.  With flushing done in this order, if flush is eventually called
-   on a non-leaf node it means that (somehow) we reached a point where all leaves are
-   clean and only internal nodes need to be flushed.  If that it the case, then it means
-   there were no leaves that were the parent-first preceder/follower of the parent.  This
-   is expected to be a rare case, which is why we do nothing special about it.  However,
-   memory pressure may pass an internal node to flush when there are still dirty leaf
-   nodes that need to be flushed, which could prove our original assumptions
-   "inoperative".  If this needs to be fixed, then scan_left/right should have
-   special checks for the non-leaf levels.  For example, instead of passing from a node to
-   the left neighbor, it should pass from the node to the left neighbor's rightmost
-   descendent (if dirty).
+/* FLUSH CALLED ON NON-LEAF LEVEL. Most of our design considerations assume that
+   the starting point for flush is a leaf node, but actually the flush code
+   cares very little about whether or not this is true.  It is possible that all
+   the leaf nodes are flushed and dirty parent nodes still remain, in which case
+   jnode_flush() is called on a non-leaf argument. Flush doesn't care--it treats
+   the argument node as if it were a leaf, even when it is not. This is a simple
+   approach, and there may be a more optimal policy but until a problem with
+   this approach is discovered, simplest is probably best.
+
+   NOTE: In this case, the ordering produced by flush is parent-first only if
+   you ignore the leaves. This is done as a matter of simplicity and there is
+   only one (shaky) justification. When an atom commits, it flushes all leaf
+   level nodes first, followed by twigs, and so on. With flushing done in this
+   order, if flush is eventually called on a non-leaf node it means that
+   (somehow) we reached a point where all leaves are clean and only internal
+   nodes need to be flushed. If that it the case, then it means there were no
+   leaves that were the parent-first preceder/follower of the parent. This is
+   expected to be a rare case, which is why we do nothing special about it.
+   However, memory pressure may pass an internal node to flush when there are
+   still dirty leaf nodes that need to be flushed, which could prove our
+   original assumptions "inoperative". If this needs to be fixed, then
+   scan_left/right should have special checks for the non-leaf levels. For
+   example, instead of passing from a node to the left neighbor, it should pass
+   from the node to the left neighbor's rightmost descendent (if dirty).
 
 */
 
-/* UNIMPLEMENTED AS YET: REPACKING AND RESIZING.  We walk the tree in 4MB-16MB chunks, dirtying everything and putting
-   it into a transaction.  We tell the allocator to allocate the blocks as far as possible towards one end of the
-   logical device--the left (starting) end of the device if we are walking from left to right, the right end of the
-   device if we are walking from right to left.  We then make passes in alternating directions, and as we do this the
-   device becomes sorted such that tree order and block number order fully correlate.
+/* UNIMPLEMENTED AS YET: REPACKING AND RESIZING. We walk the tree in 4MB-16MB
+   chunks, dirtying everything and putting it into a transaction. We tell the
+   allocator to allocate the blocks as far as possible towards one end of the
+   logical device--the left (starting) end of the device if we are walking from
+   left to right, the right end of the device if we are walking from right to
+   left.  We then make passes in alternating directions, and as we do this the
+   device becomes sorted such that tree order and block number order fully
+   correlate.
 
-   Resizing is done by shifting everything either all the way to the left or all the way
-   to the right, and then reporting the last block.
+   Resizing is done by shifting everything either all the way to the left or all
+   the way to the right, and then reporting the last block.
 */
 
-/* RELOCATE DECISIONS: The code makes a decision to relocate in several places.  This
-   descibes the policy from the highest level:
+/* RELOCATE DECISIONS: The code makes a decision to relocate in several places.
+   This descibes the policy from the highest level:
 
-   The FLUSH_RELOCATE_THRESHOLD parameter: If we count this many consecutive nodes on the
-   leaf level during flush-scan (right, left), then we unconditionally decide to relocate
-   leaf nodes.
+   The FLUSH_RELOCATE_THRESHOLD parameter: If we count this many consecutive
+   nodes on the leaf level during flush-scan (right, left), then we
+   unconditionally decide to relocate leaf nodes.
 
    Otherwise, there are two contexts in which we make a decision to relocate:
 
    1. The REVERSE PARENT-FIRST context: Implemented in reverse_relocate_test().
-   During the initial stages of flush, after scan-right completes, we want to ask the
-   question: should we relocate this leaf node and thus dirty the parent node.  Then if
-   the node is a leftmost child its parent is its own parent-first preceder, thus we repeat
-   the question at the next level up, and so on.  In these cases we are moving in the
-   reverse-parent first direction.
-
-   There is another case which is considered the reverse direction, which comes at the end
-   of a twig in reverse_relocate_end_of_twig().  As we finish processing a twig we may
-   reach a point where there is a clean twig to the right with a dirty leftmost child.  In
-   this case, we may wish to relocate the child by testing if it should be relocated
-   relative to its parent.
-
-   2. The FORWARD PARENT-FIRST context: Testing for forward relocation is done in
-   allocate_znode.  What distinguishes the forward parent-first case from the
-   reverse-parent first case is that the preceder has already been allocated in the
-   forward case, whereas in the reverse case we don't know what the preceder is until we
-   finish "going in reverse".  That simplifies the forward case considerably, and there we
-   actually use the block allocator to determine whether, e.g., a block closer to the
-   preceder is available.
+   During the initial stages of flush, after scan-right completes, we want to
+   ask the question: should we relocate this leaf node and thus dirty the parent
+   node. Then if the node is a leftmost child its parent is its own parent-first
+   preceder, thus we repeat the question at the next level up, and so on. In
+   these cases we are moving in the reverse-parent first direction.
+
+   There is another case which is considered the reverse direction, which comes
+   at the end of a twig in reverse_relocate_end_of_twig(). As we finish
+   processing a twig we may reach a point where there is a clean twig to the
+   right with a dirty leftmost child. In this case, we may wish to relocate the
+   child by testing if it should be relocated relative to its parent.
+
+   2. The FORWARD PARENT-FIRST context: Testing for forward relocation is done
+   in allocate_znode. What distinguishes the forward parent-first case from the
+   reverse-parent first case is that the preceder has already been allocated in
+   the forward case, whereas in the reverse case we don't know what the preceder
+   is until we finish "going in reverse". That simplifies the forward case
+   considerably, and there we actually use the block allocator to determine
+   whether, e.g., a block closer to the preceder is available.
 */
 
-/* SQUEEZE_LEFT_EDGE: Unimplemented idea for future consideration.  The idea is, once we
-   finish scan-left and find a starting point, if the parent's left neighbor is dirty then
-   squeeze the parent's left neighbor and the parent.  This may change the
-   flush-starting-node's parent.  Repeat until the child's parent is stable.  If the child
-   is a leftmost child, repeat this left-edge squeezing operation at the next level up.
-   Note that we cannot allocate extents during this or they will be out of parent-first
-   order.  There is also some difficult coordinate maintenence issues.  We can't do a tree
-   search to find coordinates again (because we hold locks), we have to determine them
-   from the two nodes being squeezed.  Looks difficult, but has potential to increase
-   space utilization. */
+/* SQUEEZE_LEFT_EDGE: Unimplemented idea for future consideration. The idea is,
+   once we finish scan-left and find a starting point, if the parent's left
+   neighbor is dirty then squeeze the parent's left neighbor and the parent.
+   This may change the flush-starting-node's parent. Repeat until the child's
+   parent is stable. If the child is a leftmost child, repeat this left-edge
+   squeezing operation at the next level up. Note that we cannot allocate
+   extents during this or they will be out of parent-first order. There is also
+   some difficult coordinate maintenence issues.  We can't do a tree search to
+   find coordinates again (because we hold locks), we have to determine them
+   from the two nodes being squeezed. Looks difficult, but has potential to
+   increase space utilization. */
 
 /* Flush-scan helper functions. */
 static void scan_init(flush_scan * scan);
@@ -393,7 +412,8 @@ static int alloc_pos_and_ancestors(flush
 static int alloc_one_ancestor(const coord_t *coord, flush_pos_t *pos);
 static int set_preceder(const coord_t *coord_in, flush_pos_t *pos);
 
-/* Main flush algorithm.  Note on abbreviation: "squeeze and allocate" == "squalloc". */
+/* Main flush algorithm. 
+   Note on abbreviation: "squeeze and allocate" == "squalloc". */
 static int squalloc(flush_pos_t *pos);
 
 /* Flush squeeze implementation. */
@@ -423,7 +443,7 @@ static int jnode_lock_parent_coord(jnode
 				   load_count * parent_zh,
 				   znode_lock_mode mode, int try);
 static int neighbor_in_slum(znode * node, lock_handle * right_lock, sideof side,
-			    znode_lock_mode mode, int check_dirty, int expected);
+			   znode_lock_mode mode, int check_dirty, int expected);
 static int znode_same_parents(znode * a, znode * b);
 
 static int znode_check_flushprepped(znode * node)
@@ -447,9 +467,9 @@ assert("nikita-3435",							\
 	    extent_is_unallocated(&scan->parent_coord),			\
 	    extent_unit_index(&scan->parent_coord) == index_jnode(scan->node)))
 
-/* This flush_cnt variable is used to track the number of concurrent flush operations,
-   useful for debugging.  It is initialized in txnmgr.c out of laziness (because flush has
-   no static initializer function...) */
+/* This flush_cnt variable is used to track the number of concurrent flush
+   operations, useful for debugging. It is initialized in txnmgr.c out of
+   laziness (because flush has no static initializer function...) */
 ON_DEBUG(atomic_t flush_cnt;
     )
 
@@ -550,8 +570,8 @@ static int prepare_flush_pos(flush_pos_t
 		if (ret)
 			goto done;
 		if (!item_is_extent(&parent_coord)) {
-			/* file was converted to tail, org became HB, we found internal
-			   item */
+			/* file was converted to tail, org became HB, we found
+			   internal item */
 			ret = -EAGAIN;
 			goto done;
 		}
@@ -561,96 +581,107 @@ static int prepare_flush_pos(flush_pos_t
 		pos->child = jref(org);
 		if (extent_is_unallocated(&parent_coord)
 		    && extent_unit_index(&parent_coord) != index_jnode(org)) {
-			/* @org is not first child of its parent unit. This may happen
-			   because longerm lock of its parent node was released between
-			   scan_left and scan_right. For now work around this having flush to repeat */
+			/* @org is not first child of its parent unit. This may
+			   happen because longerm lock of its parent node was
+			   released between scan_left and scan_right. For now
+			   work around this having flush to repeat */
 			ret = -EAGAIN;
 		}
 	}
 
-      done:
+done:
 	done_load_count(&load);
 	done_lh(&lock);
 	return ret;
 }
 
 /* TODO LIST (no particular order): */
-/* I have labelled most of the legitimate FIXME comments in this file with letters to
-   indicate which issue they relate to.  There are a few miscellaneous FIXMEs with
-   specific names mentioned instead that need to be inspected/resolved. */
+/* I have labelled most of the legitimate FIXME comments in this file with
+   letters to indicate which issue they relate to. There are a few miscellaneous
+   FIXMEs with specific names mentioned instead that need to be
+   inspected/resolved. */
 /* B. There is an issue described in reverse_relocate_test having to do with an
-   imprecise is_preceder? check having to do with partially-dirty extents.  The code that
-   sets preceder hints and computes the preceder is basically untested.  Careful testing
-   needs to be done that preceder calculations are done correctly, since if it doesn't
-   affect correctness we will not catch this stuff during regular testing. */
-/* C. EINVAL, E_DEADLOCK, E_NO_NEIGHBOR, ENOENT handling.  It is unclear which of these are
-   considered expected but unlikely conditions.  Flush currently returns 0 (i.e., success
-   but no progress, i.e., restart) whenever it receives any of these in jnode_flush().
-   Many of the calls that may produce one of these return values (i.e.,
-   longterm_lock_znode, reiser4_get_parent, reiser4_get_neighbor, ...) check some of these
-   values themselves and, for instance, stop flushing instead of resulting in a restart.
-   If any of these results are true error conditions then flush will go into a busy-loop,
-   as we noticed during testing when a corrupt tree caused find_child_ptr to return
-   ENOENT.  It needs careful thought and testing of corner conditions.
+   imprecise is_preceder? check having to do with partially-dirty extents. The
+   code that sets preceder hints and computes the preceder is basically
+   untested. Careful testing needs to be done that preceder calculations are
+   done correctly, since if it doesn't affect correctness we will not catch this
+   stuff during regular testing. */
+/* C. EINVAL, E_DEADLOCK, E_NO_NEIGHBOR, ENOENT handling. It is unclear which of
+   these are considered expected but unlikely conditions. Flush currently
+   returns 0 (i.e., success but no progress, i.e., restart) whenever it receives
+   any of these in jnode_flush(). Many of the calls that may produce one of
+   these return values (i.e., longterm_lock_znode, reiser4_get_parent,
+   reiser4_get_neighbor, ...) check some of these values themselves and, for
+   instance, stop flushing instead of resulting in a restart. If any of these
+   results are true error conditions then flush will go into a busy-loop, as we
+   noticed during testing when a corrupt tree caused find_child_ptr to return
+   ENOENT. It needs careful thought and testing of corner conditions.
 */
-/* D. Atomicity of flush_prep against deletion and flush concurrency.  Suppose a created
-   block is assigned a block number then early-flushed to disk.  It is dirtied again and
-   flush is called again.  Concurrently, that block is deleted, and the de-allocation of
-   its block number does not need to be deferred, since it is not part of the preserve set
-   (i.e., it didn't exist before the transaction).  I think there may be a race condition
-   where flush writes the dirty, created block after the non-deferred deallocated block
-   number is re-allocated, making it possible to write deleted data on top of non-deleted
-   data.  Its just a theory, but it needs to be thought out. */
+/* D. Atomicity of flush_prep against deletion and flush concurrency. Suppose a
+   created block is assigned a block number then early-flushed to disk. It is
+   dirtied again and flush is called again. Concurrently, that block is deleted,
+   and the de-allocation of its block number does not need to be deferred, since
+   it is not part of the preserve set (i.e., it didn't exist before the
+   transaction). I think there may be a race condition where flush writes the
+   dirty, created block after the non-deferred deallocated block number is
+   re-allocated, making it possible to write deleted data on top of non-deleted
+   data. Its just a theory, but it needs to be thought out. */
 /* F. bio_alloc() failure is not handled gracefully. */
 /* G. Unallocated children. */
-/* H. Add a WANDERED_LIST to the atom to clarify the placement of wandered blocks. */
+/* H. Add a WANDERED_LIST to the atom to clarify the placement of wandered
+   blocks. */
 /* I. Rename flush-scan to scan-point, (flush-pos to flush-point?) */
 
 /* JNODE_FLUSH: MAIN ENTRY POINT */
-/* This is the main entry point for flushing a jnode and its dirty neighborhood (dirty
-   neighborhood is named "slum").  Jnode_flush() is called if reiser4 has to write dirty
-   blocks to disk, it happens when Linux VM decides to reduce number of dirty pages or as
-   a part of transaction commit.
-
-   Our objective here is to prep and flush the slum the jnode belongs to. We want to
-   squish the slum together, and allocate the nodes in it as we squish because allocation
-   of children affects squishing of parents.
-
-   The "argument" @node tells flush where to start.  From there, flush finds the left edge
-   of the slum, and calls squalloc (in which nodes are squeezed and allocated).  To find a
-   "better place" to start squalloc first we perform a flush_scan.
-
-   Flush-scanning may be performed in both left and right directions, but for different
-   purposes.  When scanning to the left, we are searching for a node that precedes a
-   sequence of parent-first-ordered nodes which we will then flush in parent-first order.
-   During flush-scanning, we also take the opportunity to count the number of consecutive
-   leaf nodes.  If this number is past some threshold (FLUSH_RELOCATE_THRESHOLD), then we
-   make a decision to reallocate leaf nodes (thus favoring write-optimization).
-
-   Since the flush argument node can be anywhere in a sequence of dirty leaves, there may
-   also be dirty nodes to the right of the argument.  If the scan-left operation does not
-   count at least FLUSH_RELOCATE_THRESHOLD nodes then we follow it with a right-scan
-   operation to see whether there is, in fact, enough nodes to meet the relocate
-   threshold.  Each right- and left-scan operation uses a single flush_scan object.
-
-   After left-scan and possibly right-scan, we prepare a flush_position object with the
-   starting flush point or parent coordinate, which was determined using scan-left.
-
-   Next we call the main flush routine, squalloc, which iterates along the
-   leaf level, squeezing and allocating nodes (and placing them into the flush queue).
+/* This is the main entry point for flushing a jnode and its dirty neighborhood
+   (dirty neighborhood is named "slum"). Jnode_flush() is called if reiser4 has
+   to write dirty blocks to disk, it happens when Linux VM decides to reduce
+   number of dirty pages or as a part of transaction commit.
+
+   Our objective here is to prep and flush the slum the jnode belongs to. We
+   want to squish the slum together, and allocate the nodes in it as we squish
+   because allocation of children affects squishing of parents.
+
+   The "argument" @node tells flush where to start. From there, flush finds the
+   left edge of the slum, and calls squalloc (in which nodes are squeezed and
+   allocated). To find a "better place" to start squalloc first we perform a
+   flush_scan.
+
+   Flush-scanning may be performed in both left and right directions, but for
+   different purposes. When scanning to the left, we are searching for a node
+   that precedes a sequence of parent-first-ordered nodes which we will then
+   flush in parent-first order. During flush-scanning, we also take the
+   opportunity to count the number of consecutive leaf nodes. If this number is
+   past some threshold (FLUSH_RELOCATE_THRESHOLD), then we make a decision to
+   reallocate leaf nodes (thus favoring write-optimization).
+
+   Since the flush argument node can be anywhere in a sequence of dirty leaves,
+   there may also be dirty nodes to the right of the argument. If the scan-left
+   operation does not count at least FLUSH_RELOCATE_THRESHOLD nodes then we
+   follow it with a right-scan operation to see whether there is, in fact,
+   enough nodes to meet the relocate threshold. Each right- and left-scan
+   operation uses a single flush_scan object.
+
+   After left-scan and possibly right-scan, we prepare a flush_position object
+   with the starting flush point or parent coordinate, which was determined
+   using scan-left.
+
+   Next we call the main flush routine, squalloc, which iterates along the leaf
+   level, squeezing and allocating nodes (and placing them into the flush
+   queue).
 
    After squalloc returns we take extra steps to ensure that all the children
    of the final twig node are allocated--this involves repeating squalloc
    until we finish at a twig with no unallocated children.
 
-   Finally, we call flush_empty_queue to submit write-requests to disk.  If we encounter
-   any above-twig nodes during flush_empty_queue that still have unallocated children, we
-   flush_unprep them.
-
-   Flush treats several "failure" cases as non-failures, essentially causing them to start
-   over.  E_DEADLOCK is one example.  FIXME:(C) EINVAL, E_NO_NEIGHBOR, ENOENT: these should
-   probably be handled properly rather than restarting, but there are a bunch of cases to
-   audit.
+   Finally, we call flush_empty_queue to submit write-requests to disk. If we
+   encounter any above-twig nodes during flush_empty_queue that still have
+   unallocated children, we flush_unprep them.
+
+   Flush treats several "failure" cases as non-failures, essentially causing
+   them to start over. E_DEADLOCK is one example.
+   FIXME:(C) EINVAL, E_NO_NEIGHBOR, ENOENT: these should probably be handled
+   properly rather than restarting, but there are a bunch of cases to audit.
 */
 
 static int

--=-y9YdSq/5BWKS8vMhZBYH--

