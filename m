From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 20/8] estimate.c cleanup
Date: Tue, 23 Oct 2007 17:15:55 +0200
Message-ID: <1193152555.6236.97.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-7mmgysGWN56/RgASJkMa"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiser4 <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward@namesys.com>


--=-7mmgysGWN56/RgASJkMa
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



--=-7mmgysGWN56/RgASJkMa
Content-Disposition: attachment; filename=estimate.c.patch
Content-Type: text/x-patch; name=estimate.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- estimate.c.orig	2007-10-23 17:07:54.000000000 +0200
+++ estimate.c	2007-10-23 17:14:19.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 #include "debug.h"
 #include "dformat.h"
@@ -8,14 +9,18 @@
 #include "plugin/cluster.h"
 #include "plugin/item/ctail.h"
 
-/* this returns how many nodes might get dirty and added nodes if @children nodes are dirtied
+/* This returns how many nodes might get dirty and added nodes if @children
+   nodes are dirtied
 
-   Amount of internals which will get dirty or get allocated we estimate as 5% of the childs + 1 balancing. 1 balancing
-   is 2 neighbours, 2 new blocks and the current block on the leaf level, 2 neighbour nodes + the current (or 1
-   neighbour and 1 new and the current) on twig level, 2 neighbour nodes on upper levels and 1 for a new root. So 5 for
-   leaf level, 3 for twig level, 2 on upper + 1 for root.
+   Amount of internals which will get dirty or get allocated we estimate as 5%
+   of the childs + 1 balancing. 1 balancing is 2 neighbours, 2 new blocks and
+   the current block on the leaf level, 2 neighbour nodes + the current (or 1
+   neighbour and 1 new and the current) on twig level, 2 neighbour nodes on
+   upper levels and 1 for a new root. So 5 for leaf level, 3 for twig level,
+   2 on upper + 1 for root.
 
-   Do not calculate the current node of the lowest level here - this is overhead only.
+   Do not calculate the current node of the lowest level here - this is overhead
+   only.
 
    children is almost always 1 here. Exception is flow insertion
 */
@@ -26,13 +31,15 @@ max_balance_overhead(reiser4_block_nr ch
 
 	ten_percent = ((103 * childen) >> 10);
 
-	/* If we have too many balancings at the time, tree height can raise on more
-	   then 1. Assume that if tree_height is 5, it can raise on 1 only. */
+	/* If we have too many balancings at the time, tree height can raise on
+	   more then 1. Assume that if tree_height is 5, it can raise on 1 only.
+	*/
 	return ((tree_height < 5 ? 5 : tree_height) * 2 + (4 + ten_percent));
 }
 
-/* this returns maximal possible number of nodes which can be modified plus number of new nodes which can be required to
-   perform insertion of one item into the tree */
+/* this returns maximal possible number of nodes which can be modified plus
+   number of new nodes which can be required to perform insertion of one item
+   into the tree */
 /* it is only called when tree height changes, or gets initialized */
 reiser4_block_nr calc_estimate_one_insert(tree_level height)
 {
@@ -44,8 +51,9 @@ reiser4_block_nr estimate_one_insert_ite
 	return tree->estimate_one_insert;
 }
 
-/* this returns maximal possible number of nodes which can be modified plus number of new nodes which can be required to
-   perform insertion of one unit into an item in the tree */
+/* this returns maximal possible number of nodes which can be modified plus
+   number of new nodes which can be required to perform insertion of one unit
+   into an item in the tree */
 reiser4_block_nr estimate_one_insert_into_item(reiser4_tree * tree)
 {
 	/* estimate insert into item just like item insertion */
@@ -54,14 +62,15 @@ reiser4_block_nr estimate_one_insert_int
 
 reiser4_block_nr estimate_one_item_removal(reiser4_tree * tree)
 {
-	/* on item removal reiser4 does not try to pack nodes more complact, so, only one node may be dirtied on leaf
-	   level */
+	/* on item removal reiser4 does not try to pack nodes more complact, so,
+	   only one node may be dirtied on leaf level */
 	return tree->estimate_one_insert;
 }
 
-/* on leaf level insert_flow may add CARRY_FLOW_NEW_NODES_LIMIT new nodes and dirty 3 existing nodes (insert point and
-   both its neighbors). Max_balance_overhead should estimate number of blocks which may change/get added on internal
-   levels */
+/* on leaf level insert_flow may add CARRY_FLOW_NEW_NODES_LIMIT new nodes and
+   dirty 3 existing nodes (insert point and both its neighbors).
+   Max_balance_overhead should estimate number of blocks which may change/get
+   added on internal levels */
 reiser4_block_nr estimate_insert_flow(tree_level height)
 {
 	return 3 + CARRY_FLOW_NEW_NODES_LIMIT + max_balance_overhead(3 +
@@ -70,7 +79,7 @@ reiser4_block_nr estimate_insert_flow(tr
 }
 
 /* returnes max number of nodes can be occupied by disk cluster */
-static reiser4_block_nr estimate_cluster(struct inode * inode, int unprepped)
+static reiser4_block_nr estimate_cluster(struct inode *inode, int unprepped)
 {
 	int per_cluster;
 	per_cluster = (unprepped ? 1 : cluster_nrpages(inode));
@@ -81,14 +90,14 @@ static reiser4_block_nr estimate_cluster
 
 /* how many nodes might get dirty and added
    during insertion of a disk cluster */
-reiser4_block_nr estimate_insert_cluster(struct inode * inode)
+reiser4_block_nr estimate_insert_cluster(struct inode *inode)
 {
 	return estimate_cluster(inode, 1); /* 24 */
 }
 
 /* how many nodes might get dirty and added
    during update of a (prepped or unprepped) disk cluster */
-reiser4_block_nr estimate_update_cluster(struct inode * inode)
+reiser4_block_nr estimate_update_cluster(struct inode *inode)
 {
 	return estimate_cluster(inode, 0); /* 44, for 64K-cluster */
 }
@@ -98,12 +107,12 @@ reiser4_block_nr estimate_update_cluster
    can occupy more nodes).
    Q: Why we don't use precise estimation?
    A: 1.Because precise estimation is fairly bad: 65536 nodes
-        for 64K logical cluster, it means 256M of dead space on
+	for 64K logical cluster, it means 256M of dead space on
 	a partition
       2.It is a very rare case when disk cluster occupies more
-        nodes then this estimation returns.
+	nodes then this estimation returns.
 */
-reiser4_block_nr estimate_dirty_cluster(struct inode * inode)
+reiser4_block_nr estimate_dirty_cluster(struct inode *inode)
 {
 	return cluster_nrpages(inode) + 4;
 }

--=-7mmgysGWN56/RgASJkMa--

