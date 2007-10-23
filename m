From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 7/8] carry_ops.c cleanup
Date: Tue, 23 Oct 2007 14:15:19 +0200
Message-ID: <1193141719.6236.46.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-YHsByuJzuNFcngbdPMcQ"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-YHsByuJzuNFcngbdPMcQ
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- carry_ops.c.orig	2007-10-23 12:58:59.000000000 +0200
+++ carry_ops.c	2007-10-23 13:16:24.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 /* implementation of carry operations */
 
@@ -23,7 +24,7 @@
 #include <linux/types.h>
 #include <linux/err.h>
 
-static int carry_shift_data(sideof side, coord_t * insert_coord, znode
* node,
+static int carry_shift_data(sideof side, coord_t *insert_coord, znode *
node,
 			    carry_level * doing, carry_level * todo,
 			    unsigned int including_insert_coord_p);
 
@@ -38,7 +39,7 @@ extern int lock_carry_node_tail(carry_no
 */
 static carry_node *find_left_neighbor(carry_op * op	/* node to find
left
 							 * neighbor of */ ,
-				      carry_level * doing /* level to scan */ )
+				      carry_level * doing/* level to scan */)
 {
 	int result;
 	carry_node *node;
@@ -120,7 +121,7 @@ static carry_node *find_left_neighbor(ca
 */
 static carry_node *find_right_neighbor(carry_op * op	/* node to find
right
 							 * neighbor of */ ,
-				       carry_level * doing /* level to scan */ )
+				       carry_level * doing/* level to scan */)
 {
 	int result;
 	carry_node *node;
@@ -259,12 +260,12 @@ static unsigned int space_needed_for_op(
    @coord. */
 unsigned int space_needed(const znode * node	/* node data are inserted
or
 						 * pasted in */ ,
-			  const coord_t * coord	/* coord where data are
+			  const coord_t *coord	/* coord where data are
 						 * inserted or pasted
 						 * at */ ,
-			  const reiser4_item_data * data	/* data to insert or
-								 * paste */ ,
-			  int insertion /* non-0 is inserting, 0---paste */ )
+			  const reiser4_item_data * data /* data to insert or
+							  * paste */ ,
+			  int insertion/* non-0 is inserting, 0---paste */)
 {
 	int result;
 	item_plugin *iplug;
@@ -288,9 +289,8 @@ unsigned int space_needed(const znode * 
 
 		nplug = node->nplug;
 		/* and add node overhead */
-		if (nplug->item_overhead != NULL) {
+		if (nplug->item_overhead != NULL)
 			result += nplug->item_overhead(node, NULL);
-		}
 	}
 	return result;
 }
@@ -322,7 +322,7 @@ static int find_new_child_coord(carry_op
 
 /* additional amount of free space in @node required to complete @op */
 static int free_space_shortage(znode * node /* node to check */ ,
-			       carry_op * op /* operation being performed */ )
+			       carry_op * op/* operation being performed */)
 {
 	assert("nikita-1061", node != NULL);
 	assert("nikita-1062", op != NULL);
@@ -406,7 +406,7 @@ make_space_tail(carry_op * op, carry_lev
 */
 static int make_space(carry_op * op /* carry operation, insert or paste
*/ ,
 		      carry_level * doing /* current carry queue */ ,
-		      carry_level * todo /* carry queue on the parent level */ )
+		      carry_level * todo/* carry queue on the parent level */)
 {
 	znode *node;
 	int result;
@@ -530,8 +530,8 @@ static int make_space(carry_op * op /* c
 		carry_node *fresh;	/* new node we are allocating */
 		coord_t coord_shadow;	/* remembered insertion point before
 					 * shifting data into new node */
-		carry_node *node_shadow;	/* remembered insertion node before
-						 * shifting */
+		carry_node *node_shadow;	/* remembered insertion node
+						 * before shifting */
 		unsigned int gointo;	/* whether insertion point should move
 					 * into newly allocated node */
 
@@ -682,7 +682,7 @@ static int insert_paste_common(carry_op 
 			       carry_level * todo /* next carry level */ ,
 			       carry_insert_data * cdata	/* pointer to
 								 * cdata */ ,
-			       coord_t * coord /* insertion/paste coord */ ,
+			       coord_t *coord /* insertion/paste coord */ ,
 			       reiser4_item_data * data	/* data to be
 							 * inserted/pasted */ )
 {
@@ -880,9 +880,9 @@ static int carry_insert(carry_op * op /*
  * by slicing into multiple items.
  */
 
-#define flow_insert_point(op) ( ( op ) -> u.insert_flow.insert_point )
-#define flow_insert_flow(op) ( ( op ) -> u.insert_flow.flow )
-#define flow_insert_data(op) ( ( op ) -> u.insert_flow.data )
+#define flow_insert_point(op) ((op)->u.insert_flow.insert_point)
+#define flow_insert_flow(op) ((op)->u.insert_flow.flow)
+#define flow_insert_data(op) ((op)->u.insert_flow.data)
 
 static size_t item_data_overhead(carry_op * op)
 {
@@ -925,7 +925,8 @@ static int what_can_fit_into_node(carry_
 	if (free <= overhead)
 		return 0;
 	free -= overhead;
-	/* FIXME: flow->length is loff_t only to not get overflowed in case of
expandign truncate */
+	/* FIXME: flow->length is loff_t only to not get overflowed in case of
+	   expandign truncate */
 	if (free < op->u.insert_flow.flow->length)
 		return free;
 	return (int)op->u.insert_flow.flow->length;
@@ -973,7 +974,7 @@ make_space_by_shift_left(carry_op * op, 
 	   including insertion point into the left neighbor */
 	carry_shift_data(LEFT_SIDE, flow_insert_point(op),
 			 reiser4_carry_real(left), doing, todo,
-			 1 /* including insert point */);
+			 1/* including insert point */);
 	if (reiser4_carry_real(left) != flow_insert_point(op)->node) {
 		/* insertion point did not move */
 		return 1;
@@ -1015,7 +1016,7 @@ make_space_by_shift_right(carry_op * op,
 		   insertion coord into the right neighbor */
 		carry_shift_data(RIGHT_SIDE, flow_insert_point(op),
 				 reiser4_carry_real(right), doing, todo,
-				 0 /* not including insert point */);
+				 0/* not including insert point */);
 	} else {
 		/* right neighbor either does not exist or is unformatted
 		   node */
@@ -1048,38 +1049,33 @@ make_space_by_new_nodes(carry_op * op, c
 		return RETERR(-E_NODE_FULL);
 	/* add new node after insert point node */
 	new = add_new_znode(node, op->node, doing, todo);
-	if (unlikely(IS_ERR(new))) {
+	if (unlikely(IS_ERR(new)))
 		return PTR_ERR(new);
-	}
 	result = lock_carry_node(doing, new);
 	zput(reiser4_carry_real(new));
-	if (unlikely(result)) {
+	if (unlikely(result))
 		return result;
-	}
 	op->u.insert_flow.new_nodes++;
 	if (!coord_is_after_rightmost(flow_insert_point(op))) {
 		carry_shift_data(RIGHT_SIDE, flow_insert_point(op),
 				 reiser4_carry_real(new), doing, todo,
-				 0 /* not including insert point */);
+				 0/* not including insert point */);
 		assert("vs-901",
 		       coord_is_after_rightmost(flow_insert_point(op)));
 
-		if (enough_space_for_min_flow_fraction(op)) {
+		if (enough_space_for_min_flow_fraction(op))
 			return 0;
-		}
 		if (op->u.insert_flow.new_nodes == CARRY_FLOW_NEW_NODES_LIMIT)
 			return RETERR(-E_NODE_FULL);
 
 		/* add one more new node */
 		new = add_new_znode(node, op->node, doing, todo);
-		if (unlikely(IS_ERR(new))) {
+		if (unlikely(IS_ERR(new)))
 			return PTR_ERR(new);
-		}
 		result = lock_carry_node(doing, new);
 		zput(reiser4_carry_real(new));
-		if (unlikely(result)) {
+		if (unlikely(result))
 			return result;
-		}
 		op->u.insert_flow.new_nodes++;
 	}
 
@@ -1164,7 +1160,8 @@ carry_insert_flow(carry_op * op, carry_l
 		flow_insert_data(op)->length = what_can_fit_into_node(op);
 
 		if (can_paste(insert_point, &f->key, flow_insert_data(op))) {
-			/* insert point is set to item of file we are writing to and we have
to append to it */
+			/* insert point is set to item of file we are writing to
+			   and we have to append to it */
 			assert("vs-903", insert_point->between == AFTER_UNIT);
 			nplug->change_item_size(insert_point,
 						flow_insert_data(op)->length);
@@ -1231,7 +1228,7 @@ carry_insert_flow(carry_op * op, carry_l
 static int carry_delete(carry_op * op /* operation to be performed */ ,
 			carry_level * doing UNUSED_ARG	/* current carry
 							 * level */ ,
-			carry_level * todo /* next carry level */ )
+			carry_level * todo/* next carry level */)
 {
 	int result;
 	coord_t coord;
@@ -1335,9 +1332,8 @@ static int carry_delete(carry_op * op /*
 	if (znode_is_root(parent) &&
 	    /* don't kill roots at and lower than twig level */
 	    znode_get_level(parent) > REISER4_MIN_TREE_HEIGHT &&
-	    node_num_items(parent) == 1) {
+	    node_num_items(parent) == 1)
 		result = reiser4_kill_tree_root(coord.node);
-	}
 
 	return result < 0 ? : 0;
 }
@@ -1349,7 +1345,7 @@ static int carry_delete(carry_op * op /*
 */
 static int carry_cut(carry_op * op /* operation to be performed */ ,
 		     carry_level * doing /* current carry level */ ,
-		     carry_level * todo /* next carry level */ )
+		     carry_level * todo/* next carry level */)
 {
 	int result;
 	carry_plugin_info info;
@@ -1375,7 +1371,7 @@ static int carry_cut(carry_op * op /* op
 /* helper function for carry_paste(): returns true if @op can be
continued as
    paste  */
 static int
-can_paste(coord_t * icoord, const reiser4_key * key,
+can_paste(coord_t *icoord, const reiser4_key * key,
 	  const reiser4_item_data * data)
 {
 	coord_t circa;
@@ -1400,9 +1396,9 @@ can_paste(coord_t * icoord, const reiser
 
 	/* check whether we can paste to the item @icoord is "at" when we
 	   ignore ->between field */
-	if (old_iplug == new_iplug && item_can_contain_key(&circa, key, data))
{
+	if (old_iplug == new_iplug && item_can_contain_key(&circa, key, data))
 		result = 1;
-	} else if (icoord->between == BEFORE_UNIT
+	else if (icoord->between == BEFORE_UNIT
 		   || icoord->between == BEFORE_ITEM) {
 		/* otherwise, try to glue to the item at the left, if any */
 		coord_dup(&circa, icoord);
@@ -1470,7 +1466,7 @@ can_paste(coord_t * icoord, const reiser
 static int carry_paste(carry_op * op /* operation to be performed */ ,
 		       carry_level * doing UNUSED_ARG	/* current carry
 							 * level */ ,
-		       carry_level * todo /* next carry level */ )
+		       carry_level * todo/* next carry level */)
 {
 	znode *node;
 	carry_insert_data cdata;
@@ -1756,7 +1752,7 @@ static int update_delimiting_key(znode *
 */
 static int carry_update(carry_op * op /* operation to be performed */ ,
 			carry_level * doing /* current carry level */ ,
-			carry_level * todo /* next carry level */ )
+			carry_level * todo/* next carry level */)
 {
 	int result;
 	carry_node *missing UNUSED_ARG;
@@ -1818,16 +1814,15 @@ static int carry_update(carry_op * op /*
 
 /* move items from @node during carry */
 static int carry_shift_data(sideof side /* in what direction to move
data */ ,
-			    coord_t * insert_coord	/* coord where new item
-							 * is to be inserted */ ,
+			    coord_t *insert_coord	/* coord where new item
+							 * is to be inserted */,
 			    znode * node /* node which data are moved from */ ,
 			    carry_level * doing /* active carry queue */ ,
 			    carry_level * todo	/* carry queue where new
 						 * operations are to be put
 						 * in */ ,
-			    unsigned int including_insert_coord_p	/* true if
-									 * @insertion_coord
-									 * can be moved */ )
+			    unsigned int including_insert_coord_p
+				/* true if @insertion_coord can be moved */ )
 {
 	int result;
 	znode *source;
@@ -1877,7 +1872,7 @@ static carry_node *pool_level_list_prev(
 */
 carry_node *find_left_carry(carry_node * node	/* node to find left
neighbor
 						 * of */ ,
-			    carry_level * level /* level to scan */ )
+			    carry_level * level/* level to scan */)
 {
 	return find_dir_carry(node, level,
 			      (carry_iterator) pool_level_list_prev);
@@ -1897,7 +1892,7 @@ static carry_node *pool_level_list_next(
 */
 carry_node *find_right_carry(carry_node * node	/* node to find right
neighbor
 						 * of */ ,
-			     carry_level * level /* level to scan */ )
+			     carry_level * level/* level to scan */)
 {
 	return find_dir_carry(node, level,
 			      (carry_iterator) pool_level_list_next);
@@ -1908,12 +1903,12 @@ carry_node *find_right_carry(carry_node 
 
    Helper function used by find_{left|right}_carry().
 */
-static carry_node *find_dir_carry(carry_node * node	/* node to start
scanning
-							 * from */ ,
+static carry_node *find_dir_carry(carry_node * node	/* node to start
+							 * scanning from */ ,
 				  carry_level * level /* level to scan */ ,
 				  carry_iterator iterator	/* operation to
-								 * move to the next
-								 * node */ )
+								 * move to the
+								 * next node */)
 {
 	carry_node *neighbor;
 
@@ -2019,9 +2014,11 @@ static int carry_estimate_bitmaps(void)
 	if (reiser4_is_set(reiser4_get_current_sb(),
REISER4_DONT_LOAD_BITMAP)) {
 		int bytes;
 
-		bytes = capped_height() * (0 +	/* bnode should be added, but its is
private to
-						 * bitmap.c, skip for now. */
-					   2 * sizeof(jnode));	/* working and commit jnodes */
+		bytes = capped_height() * (0 +	/* bnode should be added, but
+						 * its is private to bitmap.c,
+						 * skip for now. */
+					   2 * sizeof(jnode));
+						/* working and commit jnodes */
 		return bytes_to_pages(bytes) + 2;	/* and their contents */
 	} else
 		/* bitmaps were pre-loaded during mount */
@@ -2031,32 +2028,36 @@ static int carry_estimate_bitmaps(void)
 /* worst case item insertion memory requirements */
 static int carry_estimate_insert(carry_op * op, carry_level * level)
 {
-	return carry_estimate_bitmaps() + carry_estimate_znodes() + 1 +	/* new
atom */
+	return carry_estimate_bitmaps() + carry_estimate_znodes() + 1 +
+								/* new atom */
 	    capped_height() +	/* new block on each level */
-	    1 +			/* and possibly extra new block at the leaf level */
+	    1 +		/* and possibly extra new block at the leaf level */
 	    3;			/* loading of leaves into memory */
 }
 
 /* worst case item deletion memory requirements */
 static int carry_estimate_delete(carry_op * op, carry_level * level)
 {
-	return carry_estimate_bitmaps() + carry_estimate_znodes() + 1 +	/* new
atom */
+	return carry_estimate_bitmaps() + carry_estimate_znodes() + 1 +
+								/* new atom */
 	    3;			/* loading of leaves into memory */
 }
 
 /* worst case tree cut memory requirements */
 static int carry_estimate_cut(carry_op * op, carry_level * level)
 {
-	return carry_estimate_bitmaps() + carry_estimate_znodes() + 1 +	/* new
atom */
+	return carry_estimate_bitmaps() + carry_estimate_znodes() + 1 +
+								/* new atom */
 	    3;			/* loading of leaves into memory */
 }
 
 /* worst case memory requirements of pasting into item */
 static int carry_estimate_paste(carry_op * op, carry_level * level)
 {
-	return carry_estimate_bitmaps() + carry_estimate_znodes() + 1 +	/* new
atom */
+	return carry_estimate_bitmaps() + carry_estimate_znodes() + 1 +
+								/* new atom */
 	    capped_height() +	/* new block on each level */
-	    1 +			/* and possibly extra new block at the leaf level */
+	    1 +		/* and possibly extra new block at the leaf level */
 	    3;			/* loading of leaves into memory */
 }
 

--=-YHsByuJzuNFcngbdPMcQ
Content-Disposition: attachment; filename=carry_ops.c.patch
Content-Type: text/x-patch; name=carry_ops.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- carry_ops.c.orig	2007-10-23 12:58:59.000000000 +0200
+++ carry_ops.c	2007-10-23 13:16:24.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 /* implementation of carry operations */
 
@@ -23,7 +24,7 @@
 #include <linux/types.h>
 #include <linux/err.h>
 
-static int carry_shift_data(sideof side, coord_t * insert_coord, znode * node,
+static int carry_shift_data(sideof side, coord_t *insert_coord, znode * node,
 			    carry_level * doing, carry_level * todo,
 			    unsigned int including_insert_coord_p);
 
@@ -38,7 +39,7 @@ extern int lock_carry_node_tail(carry_no
 */
 static carry_node *find_left_neighbor(carry_op * op	/* node to find left
 							 * neighbor of */ ,
-				      carry_level * doing /* level to scan */ )
+				      carry_level * doing/* level to scan */)
 {
 	int result;
 	carry_node *node;
@@ -120,7 +121,7 @@ static carry_node *find_left_neighbor(ca
 */
 static carry_node *find_right_neighbor(carry_op * op	/* node to find right
 							 * neighbor of */ ,
-				       carry_level * doing /* level to scan */ )
+				       carry_level * doing/* level to scan */)
 {
 	int result;
 	carry_node *node;
@@ -259,12 +260,12 @@ static unsigned int space_needed_for_op(
    @coord. */
 unsigned int space_needed(const znode * node	/* node data are inserted or
 						 * pasted in */ ,
-			  const coord_t * coord	/* coord where data are
+			  const coord_t *coord	/* coord where data are
 						 * inserted or pasted
 						 * at */ ,
-			  const reiser4_item_data * data	/* data to insert or
-								 * paste */ ,
-			  int insertion /* non-0 is inserting, 0---paste */ )
+			  const reiser4_item_data * data /* data to insert or
+							  * paste */ ,
+			  int insertion/* non-0 is inserting, 0---paste */)
 {
 	int result;
 	item_plugin *iplug;
@@ -288,9 +289,8 @@ unsigned int space_needed(const znode * 
 
 		nplug = node->nplug;
 		/* and add node overhead */
-		if (nplug->item_overhead != NULL) {
+		if (nplug->item_overhead != NULL)
 			result += nplug->item_overhead(node, NULL);
-		}
 	}
 	return result;
 }
@@ -322,7 +322,7 @@ static int find_new_child_coord(carry_op
 
 /* additional amount of free space in @node required to complete @op */
 static int free_space_shortage(znode * node /* node to check */ ,
-			       carry_op * op /* operation being performed */ )
+			       carry_op * op/* operation being performed */)
 {
 	assert("nikita-1061", node != NULL);
 	assert("nikita-1062", op != NULL);
@@ -406,7 +406,7 @@ make_space_tail(carry_op * op, carry_lev
 */
 static int make_space(carry_op * op /* carry operation, insert or paste */ ,
 		      carry_level * doing /* current carry queue */ ,
-		      carry_level * todo /* carry queue on the parent level */ )
+		      carry_level * todo/* carry queue on the parent level */)
 {
 	znode *node;
 	int result;
@@ -530,8 +530,8 @@ static int make_space(carry_op * op /* c
 		carry_node *fresh;	/* new node we are allocating */
 		coord_t coord_shadow;	/* remembered insertion point before
 					 * shifting data into new node */
-		carry_node *node_shadow;	/* remembered insertion node before
-						 * shifting */
+		carry_node *node_shadow;	/* remembered insertion node
+						 * before shifting */
 		unsigned int gointo;	/* whether insertion point should move
 					 * into newly allocated node */
 
@@ -682,7 +682,7 @@ static int insert_paste_common(carry_op 
 			       carry_level * todo /* next carry level */ ,
 			       carry_insert_data * cdata	/* pointer to
 								 * cdata */ ,
-			       coord_t * coord /* insertion/paste coord */ ,
+			       coord_t *coord /* insertion/paste coord */ ,
 			       reiser4_item_data * data	/* data to be
 							 * inserted/pasted */ )
 {
@@ -880,9 +880,9 @@ static int carry_insert(carry_op * op /*
  * by slicing into multiple items.
  */
 
-#define flow_insert_point(op) ( ( op ) -> u.insert_flow.insert_point )
-#define flow_insert_flow(op) ( ( op ) -> u.insert_flow.flow )
-#define flow_insert_data(op) ( ( op ) -> u.insert_flow.data )
+#define flow_insert_point(op) ((op)->u.insert_flow.insert_point)
+#define flow_insert_flow(op) ((op)->u.insert_flow.flow)
+#define flow_insert_data(op) ((op)->u.insert_flow.data)
 
 static size_t item_data_overhead(carry_op * op)
 {
@@ -925,7 +925,8 @@ static int what_can_fit_into_node(carry_
 	if (free <= overhead)
 		return 0;
 	free -= overhead;
-	/* FIXME: flow->length is loff_t only to not get overflowed in case of expandign truncate */
+	/* FIXME: flow->length is loff_t only to not get overflowed in case of
+	   expandign truncate */
 	if (free < op->u.insert_flow.flow->length)
 		return free;
 	return (int)op->u.insert_flow.flow->length;
@@ -973,7 +974,7 @@ make_space_by_shift_left(carry_op * op, 
 	   including insertion point into the left neighbor */
 	carry_shift_data(LEFT_SIDE, flow_insert_point(op),
 			 reiser4_carry_real(left), doing, todo,
-			 1 /* including insert point */);
+			 1/* including insert point */);
 	if (reiser4_carry_real(left) != flow_insert_point(op)->node) {
 		/* insertion point did not move */
 		return 1;
@@ -1015,7 +1016,7 @@ make_space_by_shift_right(carry_op * op,
 		   insertion coord into the right neighbor */
 		carry_shift_data(RIGHT_SIDE, flow_insert_point(op),
 				 reiser4_carry_real(right), doing, todo,
-				 0 /* not including insert point */);
+				 0/* not including insert point */);
 	} else {
 		/* right neighbor either does not exist or is unformatted
 		   node */
@@ -1048,38 +1049,33 @@ make_space_by_new_nodes(carry_op * op, c
 		return RETERR(-E_NODE_FULL);
 	/* add new node after insert point node */
 	new = add_new_znode(node, op->node, doing, todo);
-	if (unlikely(IS_ERR(new))) {
+	if (unlikely(IS_ERR(new)))
 		return PTR_ERR(new);
-	}
 	result = lock_carry_node(doing, new);
 	zput(reiser4_carry_real(new));
-	if (unlikely(result)) {
+	if (unlikely(result))
 		return result;
-	}
 	op->u.insert_flow.new_nodes++;
 	if (!coord_is_after_rightmost(flow_insert_point(op))) {
 		carry_shift_data(RIGHT_SIDE, flow_insert_point(op),
 				 reiser4_carry_real(new), doing, todo,
-				 0 /* not including insert point */);
+				 0/* not including insert point */);
 		assert("vs-901",
 		       coord_is_after_rightmost(flow_insert_point(op)));
 
-		if (enough_space_for_min_flow_fraction(op)) {
+		if (enough_space_for_min_flow_fraction(op))
 			return 0;
-		}
 		if (op->u.insert_flow.new_nodes == CARRY_FLOW_NEW_NODES_LIMIT)
 			return RETERR(-E_NODE_FULL);
 
 		/* add one more new node */
 		new = add_new_znode(node, op->node, doing, todo);
-		if (unlikely(IS_ERR(new))) {
+		if (unlikely(IS_ERR(new)))
 			return PTR_ERR(new);
-		}
 		result = lock_carry_node(doing, new);
 		zput(reiser4_carry_real(new));
-		if (unlikely(result)) {
+		if (unlikely(result))
 			return result;
-		}
 		op->u.insert_flow.new_nodes++;
 	}
 
@@ -1164,7 +1160,8 @@ carry_insert_flow(carry_op * op, carry_l
 		flow_insert_data(op)->length = what_can_fit_into_node(op);
 
 		if (can_paste(insert_point, &f->key, flow_insert_data(op))) {
-			/* insert point is set to item of file we are writing to and we have to append to it */
+			/* insert point is set to item of file we are writing to
+			   and we have to append to it */
 			assert("vs-903", insert_point->between == AFTER_UNIT);
 			nplug->change_item_size(insert_point,
 						flow_insert_data(op)->length);
@@ -1231,7 +1228,7 @@ carry_insert_flow(carry_op * op, carry_l
 static int carry_delete(carry_op * op /* operation to be performed */ ,
 			carry_level * doing UNUSED_ARG	/* current carry
 							 * level */ ,
-			carry_level * todo /* next carry level */ )
+			carry_level * todo/* next carry level */)
 {
 	int result;
 	coord_t coord;
@@ -1335,9 +1332,8 @@ static int carry_delete(carry_op * op /*
 	if (znode_is_root(parent) &&
 	    /* don't kill roots at and lower than twig level */
 	    znode_get_level(parent) > REISER4_MIN_TREE_HEIGHT &&
-	    node_num_items(parent) == 1) {
+	    node_num_items(parent) == 1)
 		result = reiser4_kill_tree_root(coord.node);
-	}
 
 	return result < 0 ? : 0;
 }
@@ -1349,7 +1345,7 @@ static int carry_delete(carry_op * op /*
 */
 static int carry_cut(carry_op * op /* operation to be performed */ ,
 		     carry_level * doing /* current carry level */ ,
-		     carry_level * todo /* next carry level */ )
+		     carry_level * todo/* next carry level */)
 {
 	int result;
 	carry_plugin_info info;
@@ -1375,7 +1371,7 @@ static int carry_cut(carry_op * op /* op
 /* helper function for carry_paste(): returns true if @op can be continued as
    paste  */
 static int
-can_paste(coord_t * icoord, const reiser4_key * key,
+can_paste(coord_t *icoord, const reiser4_key * key,
 	  const reiser4_item_data * data)
 {
 	coord_t circa;
@@ -1400,9 +1396,9 @@ can_paste(coord_t * icoord, const reiser
 
 	/* check whether we can paste to the item @icoord is "at" when we
 	   ignore ->between field */
-	if (old_iplug == new_iplug && item_can_contain_key(&circa, key, data)) {
+	if (old_iplug == new_iplug && item_can_contain_key(&circa, key, data))
 		result = 1;
-	} else if (icoord->between == BEFORE_UNIT
+	else if (icoord->between == BEFORE_UNIT
 		   || icoord->between == BEFORE_ITEM) {
 		/* otherwise, try to glue to the item at the left, if any */
 		coord_dup(&circa, icoord);
@@ -1470,7 +1466,7 @@ can_paste(coord_t * icoord, const reiser
 static int carry_paste(carry_op * op /* operation to be performed */ ,
 		       carry_level * doing UNUSED_ARG	/* current carry
 							 * level */ ,
-		       carry_level * todo /* next carry level */ )
+		       carry_level * todo/* next carry level */)
 {
 	znode *node;
 	carry_insert_data cdata;
@@ -1756,7 +1752,7 @@ static int update_delimiting_key(znode *
 */
 static int carry_update(carry_op * op /* operation to be performed */ ,
 			carry_level * doing /* current carry level */ ,
-			carry_level * todo /* next carry level */ )
+			carry_level * todo/* next carry level */)
 {
 	int result;
 	carry_node *missing UNUSED_ARG;
@@ -1818,16 +1814,15 @@ static int carry_update(carry_op * op /*
 
 /* move items from @node during carry */
 static int carry_shift_data(sideof side /* in what direction to move data */ ,
-			    coord_t * insert_coord	/* coord where new item
-							 * is to be inserted */ ,
+			    coord_t *insert_coord	/* coord where new item
+							 * is to be inserted */,
 			    znode * node /* node which data are moved from */ ,
 			    carry_level * doing /* active carry queue */ ,
 			    carry_level * todo	/* carry queue where new
 						 * operations are to be put
 						 * in */ ,
-			    unsigned int including_insert_coord_p	/* true if
-									 * @insertion_coord
-									 * can be moved */ )
+			    unsigned int including_insert_coord_p
+				/* true if @insertion_coord can be moved */ )
 {
 	int result;
 	znode *source;
@@ -1877,7 +1872,7 @@ static carry_node *pool_level_list_prev(
 */
 carry_node *find_left_carry(carry_node * node	/* node to find left neighbor
 						 * of */ ,
-			    carry_level * level /* level to scan */ )
+			    carry_level * level/* level to scan */)
 {
 	return find_dir_carry(node, level,
 			      (carry_iterator) pool_level_list_prev);
@@ -1897,7 +1892,7 @@ static carry_node *pool_level_list_next(
 */
 carry_node *find_right_carry(carry_node * node	/* node to find right neighbor
 						 * of */ ,
-			     carry_level * level /* level to scan */ )
+			     carry_level * level/* level to scan */)
 {
 	return find_dir_carry(node, level,
 			      (carry_iterator) pool_level_list_next);
@@ -1908,12 +1903,12 @@ carry_node *find_right_carry(carry_node 
 
    Helper function used by find_{left|right}_carry().
 */
-static carry_node *find_dir_carry(carry_node * node	/* node to start scanning
-							 * from */ ,
+static carry_node *find_dir_carry(carry_node * node	/* node to start
+							 * scanning from */ ,
 				  carry_level * level /* level to scan */ ,
 				  carry_iterator iterator	/* operation to
-								 * move to the next
-								 * node */ )
+								 * move to the
+								 * next node */)
 {
 	carry_node *neighbor;
 
@@ -2019,9 +2014,11 @@ static int carry_estimate_bitmaps(void)
 	if (reiser4_is_set(reiser4_get_current_sb(), REISER4_DONT_LOAD_BITMAP)) {
 		int bytes;
 
-		bytes = capped_height() * (0 +	/* bnode should be added, but its is private to
-						 * bitmap.c, skip for now. */
-					   2 * sizeof(jnode));	/* working and commit jnodes */
+		bytes = capped_height() * (0 +	/* bnode should be added, but
+						 * its is private to bitmap.c,
+						 * skip for now. */
+					   2 * sizeof(jnode));
+						/* working and commit jnodes */
 		return bytes_to_pages(bytes) + 2;	/* and their contents */
 	} else
 		/* bitmaps were pre-loaded during mount */
@@ -2031,32 +2028,36 @@ static int carry_estimate_bitmaps(void)
 /* worst case item insertion memory requirements */
 static int carry_estimate_insert(carry_op * op, carry_level * level)
 {
-	return carry_estimate_bitmaps() + carry_estimate_znodes() + 1 +	/* new atom */
+	return carry_estimate_bitmaps() + carry_estimate_znodes() + 1 +
+								/* new atom */
 	    capped_height() +	/* new block on each level */
-	    1 +			/* and possibly extra new block at the leaf level */
+	    1 +		/* and possibly extra new block at the leaf level */
 	    3;			/* loading of leaves into memory */
 }
 
 /* worst case item deletion memory requirements */
 static int carry_estimate_delete(carry_op * op, carry_level * level)
 {
-	return carry_estimate_bitmaps() + carry_estimate_znodes() + 1 +	/* new atom */
+	return carry_estimate_bitmaps() + carry_estimate_znodes() + 1 +
+								/* new atom */
 	    3;			/* loading of leaves into memory */
 }
 
 /* worst case tree cut memory requirements */
 static int carry_estimate_cut(carry_op * op, carry_level * level)
 {
-	return carry_estimate_bitmaps() + carry_estimate_znodes() + 1 +	/* new atom */
+	return carry_estimate_bitmaps() + carry_estimate_znodes() + 1 +
+								/* new atom */
 	    3;			/* loading of leaves into memory */
 }
 
 /* worst case memory requirements of pasting into item */
 static int carry_estimate_paste(carry_op * op, carry_level * level)
 {
-	return carry_estimate_bitmaps() + carry_estimate_znodes() + 1 +	/* new atom */
+	return carry_estimate_bitmaps() + carry_estimate_znodes() + 1 +
+								/* new atom */
 	    capped_height() +	/* new block on each level */
-	    1 +			/* and possibly extra new block at the leaf level */
+	    1 +		/* and possibly extra new block at the leaf level */
 	    3;			/* loading of leaves into memory */
 }
 

--=-YHsByuJzuNFcngbdPMcQ--

