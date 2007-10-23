From: Dushan Tcholich <dusanc@absolutok.net>
Subject: Re: [PATCH 11/8] coord.c cleanup
Date: Tue, 23 Oct 2007 16:17:05 +0200
Message-ID: <1193149025.6236.79.camel@krshina3.gekom>
References: <1193146289.6236.63.camel@krshina3.gekom>
	 <471DFFBB.2050500@namesys.com>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-oW4K9VB5tlq0b9jcU+xb"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <471DFFBB.2050500@namesys.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-oW4K9VB5tlq0b9jcU+xb
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Resend because of wordwrapping.

--=-oW4K9VB5tlq0b9jcU+xb
Content-Disposition: attachment; filename=coord.c.patch
Content-Type: text/x-patch; name=coord.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- coord.c.orig	2007-10-23 15:07:41.000000000 +0200
+++ coord.c	2007-10-23 15:29:26.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 #include "forward.h"
 #include "debug.h"
@@ -10,7 +11,7 @@
 
 /* Internal constructor. */
 static inline void
-coord_init_values(coord_t * coord, const znode * node, pos_in_node_t item_pos,
+coord_init_values(coord_t *coord, const znode * node, pos_in_node_t item_pos,
 		  pos_in_node_t unit_pos, between_enum between)
 {
 	coord->node = (znode *) node;
@@ -20,12 +21,13 @@ coord_init_values(coord_t * coord, const
 	ON_DEBUG(coord->plug_v = 0);
 	ON_DEBUG(coord->body_v = 0);
 
-	/*ON_TRACE (TRACE_COORDS, "init coord %p node %p: %u %u %s\n", coord, node, item_pos, unit_pos, coord_tween_tostring (between)); */
+	/*ON_TRACE (TRACE_COORDS, "init coord %p node %p: %u %u %s\n", coord,
+ node, item_pos, unit_pos, coord_tween_tostring (between)); */
 }
 
 /* after shifting of node content, coord previously set properly may become
    invalid, try to "normalize" it. */
-void coord_normalize(coord_t * coord)
+void coord_normalize(coord_t *coord)
 {
 	znode *node;
 
@@ -34,12 +36,12 @@ void coord_normalize(coord_t * coord)
 
 	coord_clear_iplug(coord);
 
-	if (node_is_empty(node)) {
+	if (node_is_empty(node))
 		coord_init_first_unit(coord, node);
-	} else if ((coord->between == AFTER_ITEM)
-		   || (coord->between == AFTER_UNIT)) {
+	 else if ((coord->between == AFTER_ITEM)
+		   || (coord->between == AFTER_UNIT))
 		return;
-	} else if (coord->item_pos == coord_num_items(coord)
+	 else if (coord->item_pos == coord_num_items(coord)
 		   && coord->between == BEFORE_ITEM) {
 		coord_dec_item_pos(coord);
 		coord->between = AFTER_ITEM;
@@ -56,7 +58,7 @@ void coord_normalize(coord_t * coord)
 }
 
 /* Copy a coordinate. */
-void coord_dup(coord_t * coord, const coord_t * old_coord)
+void coord_dup(coord_t *coord, const coord_t *old_coord)
 {
 	assert("jmacd-9800", coord_check(old_coord));
 	coord_dup_nocheck(coord, old_coord);
@@ -64,7 +66,7 @@ void coord_dup(coord_t * coord, const co
 
 /* Copy a coordinate without check. Useful when old_coord->node is not
    loaded. As in cbk_tree_lookup -> connect_znode -> connect_one_side */
-void coord_dup_nocheck(coord_t * coord, const coord_t * old_coord)
+void coord_dup_nocheck(coord_t *coord, const coord_t *old_coord)
 {
 	coord->node = old_coord->node;
 	coord_set_item_pos(coord, old_coord->item_pos);
@@ -76,19 +78,19 @@ void coord_dup_nocheck(coord_t * coord, 
 }
 
 /* Initialize an invalid coordinate. */
-void coord_init_invalid(coord_t * coord, const znode * node)
+void coord_init_invalid(coord_t *coord, const znode * node)
 {
 	coord_init_values(coord, node, 0, 0, INVALID_COORD);
 }
 
-void coord_init_first_unit_nocheck(coord_t * coord, const znode * node)
+void coord_init_first_unit_nocheck(coord_t *coord, const znode * node)
 {
 	coord_init_values(coord, node, 0, 0, AT_UNIT);
 }
 
-/* Initialize a coordinate to point at the first unit of the first item.  If the node is
-   empty, it is positioned at the EMPTY_NODE. */
-void coord_init_first_unit(coord_t * coord, const znode * node)
+/* Initialize a coordinate to point at the first unit of the first item. If the
+   node is empty, it is positioned at the EMPTY_NODE. */
+void coord_init_first_unit(coord_t *coord, const znode * node)
 {
 	int is_empty = node_is_empty(node);
 
@@ -97,9 +99,9 @@ void coord_init_first_unit(coord_t * coo
 	assert("jmacd-9801", coord_check(coord));
 }
 
-/* Initialize a coordinate to point at the last unit of the last item.  If the node is
-   empty, it is positioned at the EMPTY_NODE. */
-void coord_init_last_unit(coord_t * coord, const znode * node)
+/* Initialize a coordinate to point at the last unit of the last item.  If the
+   node is empty, it is positioned at the EMPTY_NODE. */
+void coord_init_last_unit(coord_t *coord, const znode * node)
 {
 	int is_empty = node_is_empty(node);
 
@@ -111,9 +113,9 @@ void coord_init_last_unit(coord_t * coor
 	assert("jmacd-9802", coord_check(coord));
 }
 
-/* Initialize a coordinate to before the first item.  If the node is empty, it is
+/* Initialize a coordinate to before the first item. If the node is empty, it is
    positioned at the EMPTY_NODE. */
-void coord_init_before_first_item(coord_t * coord, const znode * node)
+void coord_init_before_first_item(coord_t *coord, const znode * node)
 {
 	int is_empty = node_is_empty(node);
 
@@ -123,9 +125,9 @@ void coord_init_before_first_item(coord_
 	assert("jmacd-9803", coord_check(coord));
 }
 
-/* Initialize a coordinate to after the last item.  If the node is empty, it is positioned
-   at the EMPTY_NODE. */
-void coord_init_after_last_item(coord_t * coord, const znode * node)
+/* Initialize a coordinate to after the last item. If the node is empty, it is
+   positioned at the EMPTY_NODE. */
+void coord_init_after_last_item(coord_t *coord, const znode * node)
 {
 	int is_empty = node_is_empty(node);
 
@@ -138,21 +140,23 @@ void coord_init_after_last_item(coord_t 
 
 /* Initialize a coordinate to after last unit in the item. Coord must be set
    already to existing item */
-void coord_init_after_item_end(coord_t * coord)
+void coord_init_after_item_end(coord_t *coord)
 {
 	coord->between = AFTER_UNIT;
 	coord->unit_pos = coord_last_unit_pos(coord);
 }
 
-/* Initialize a coordinate to before the item. Coord must be set already to existing item */
-void coord_init_before_item(coord_t * coord)
+/* Initialize a coordinate to before the item. Coord must be set already to
+   existing item */
+void coord_init_before_item(coord_t *coord)
 {
 	coord->unit_pos = 0;
 	coord->between = BEFORE_ITEM;
 }
 
-/* Initialize a coordinate to after the item. Coord must be set already to existing item */
-void coord_init_after_item(coord_t * coord)
+/* Initialize a coordinate to after the item. Coord must be set already to
+   existing item */
+void coord_init_after_item(coord_t *coord)
 {
 	coord->unit_pos = 0;
 	coord->between = AFTER_ITEM;
@@ -160,13 +164,14 @@ void coord_init_after_item(coord_t * coo
 
 /* Initialize a coordinate by 0s. Used in places where init_coord was used and
    it was not clear how actually */
-void coord_init_zero(coord_t * coord)
+void coord_init_zero(coord_t *coord)
 {
 	memset(coord, 0, sizeof(*coord));
 }
 
-/* Return the number of units at the present item.  Asserts coord_is_existing_item(). */
-unsigned coord_num_units(const coord_t * coord)
+/* Return the number of units at the present item.
+   Asserts coord_is_existing_item(). */
+unsigned coord_num_units(const coord_t *coord)
 {
 	assert("jmacd-9806", coord_is_existing_item(coord));
 
@@ -175,15 +180,15 @@ unsigned coord_num_units(const coord_t *
 
 /* Returns true if the coord was initializewd by coord_init_invalid (). */
 /* Audited by: green(2002.06.15) */
-int coord_is_invalid(const coord_t * coord)
+int coord_is_invalid(const coord_t *coord)
 {
 	return coord->between == INVALID_COORD;
 }
 
-/* Returns true if the coordinate is positioned at an existing item, not before or after
-   an item.  It may be placed at, before, or after any unit within the item, whether
-   existing or not. */
-int coord_is_existing_item(const coord_t * coord)
+/* Returns true if the coordinate is positioned at an existing item, not before
+   or after an item.  It may be placed at, before, or after any unit within the
+   item, whether existing or not. */
+int coord_is_existing_item(const coord_t *coord)
 {
 	switch (coord->between) {
 	case EMPTY_NODE:
@@ -202,10 +207,10 @@ int coord_is_existing_item(const coord_t
 	return 0;
 }
 
-/* Returns true if the coordinate is positioned at an existing unit, not before or after a
-   unit. */
+/* Returns true if the coordinate is positioned at an existing unit, not before
+   or after a unit. */
 /* Audited by: green(2002.06.15) */
-int coord_is_existing_unit(const coord_t * coord)
+int coord_is_existing_unit(const coord_t *coord)
 {
 	switch (coord->between) {
 	case EMPTY_NODE:
@@ -225,10 +230,11 @@ int coord_is_existing_unit(const coord_t
 	return 0;
 }
 
-/* Returns true if the coordinate is positioned at the first unit of the first item.  Not
-   true for empty nodes nor coordinates positioned before the first item. */
+/* Returns true if the coordinate is positioned at the first unit of the first
+   item. Not true for empty nodes nor coordinates positioned before the first
+   item. */
 /* Audited by: green(2002.06.15) */
-int coord_is_leftmost_unit(const coord_t * coord)
+int coord_is_leftmost_unit(const coord_t *coord)
 {
 	return (coord->between == AT_UNIT && coord->item_pos == 0
 		&& coord->unit_pos == 0);
@@ -236,11 +242,10 @@ int coord_is_leftmost_unit(const coord_t
 
 #if REISER4_DEBUG
 /* For assertions only, checks for a valid coordinate. */
-int coord_check(const coord_t * coord)
+int coord_check(const coord_t *coord)
 {
-	if (coord->node == NULL) {
+	if (coord->node == NULL)
 		return 0;
-	}
 	if (znode_above_root(coord->node))
 		return 1;
 
@@ -249,9 +254,8 @@ int coord_check(const coord_t * coord)
 	case INVALID_COORD:
 		return 0;
 	case EMPTY_NODE:
-		if (!node_is_empty(coord->node)) {
+		if (!node_is_empty(coord->node))
 			return 0;
-		}
 		return coord->item_pos == 0 && coord->unit_pos == 0;
 
 	case BEFORE_UNIT:
@@ -264,15 +268,13 @@ int coord_check(const coord_t * coord)
 	case AFTER_ITEM:
 	case BEFORE_ITEM:
 		/* before/after item should not set unit_pos. */
-		if (coord->unit_pos != 0) {
+		if (coord->unit_pos != 0)
 			return 0;
-		}
 		break;
 	}
 
-	if (coord->item_pos >= node_num_items(coord->node)) {
+	if (coord->item_pos >= node_num_items(coord->node))
 		return 0;
-	}
 
 	/* FIXME-VS: we are going to check unit_pos. This makes no sense when
 	   between is set either AFTER_ITEM or BEFORE_ITEM */
@@ -281,21 +283,19 @@ int coord_check(const coord_t * coord)
 
 	if (coord_is_iplug_set(coord) &&
 	    coord->unit_pos >
-	    item_plugin_by_coord(coord)->b.nr_units(coord) - 1) {
+	    item_plugin_by_coord(coord)->b.nr_units(coord) - 1)
 		return 0;
-	}
 	return 1;
 }
 #endif
 
-/* Adjust coordinate boundaries based on the number of items prior to coord_next/prev.
-   Returns 1 if the new position is does not exist. */
-static int coord_adjust_items(coord_t * coord, unsigned items, int is_next)
+/* Adjust coordinate boundaries based on the number of items prior to
+   coord_next/prev. Returns 1 if the new position is does not exist. */
+static int coord_adjust_items(coord_t *coord, unsigned items, int is_next)
 {
 	/* If the node is invalid, leave it. */
-	if (coord->between == INVALID_COORD) {
+	if (coord->between == INVALID_COORD)
 		return 1;
-	}
 
 	/* If the node is empty, set it appropriately. */
 	if (items == 0) {
@@ -326,15 +326,14 @@ static int coord_adjust_items(coord_t * 
 }
 
 /* Advances the coordinate by one unit to the right.  If empty, no change.  If
-   coord_is_rightmost_unit, advances to AFTER THE LAST ITEM.  Returns 0 if new position is an
-   existing unit. */
-int coord_next_unit(coord_t * coord)
+   coord_is_rightmost_unit, advances to AFTER THE LAST ITEM.  Returns 0 if new
+   position is an existing unit. */
+int coord_next_unit(coord_t *coord)
 {
 	unsigned items = coord_num_items(coord);
 
-	if (coord_adjust_items(coord, items, 1) == 1) {
+	if (coord_adjust_items(coord, items, 1) == 1)
 		return 1;
-	}
 
 	switch (coord->between) {
 	case BEFORE_UNIT:
@@ -344,25 +343,24 @@ int coord_next_unit(coord_t * coord)
 
 	case AFTER_UNIT:
 	case AT_UNIT:
-		/* If it was at or after a unit and there are more units in this item,
-		   advance to the next one. */
+		/* If it was at or after a unit and there are more units in this
+		   item, advance to the next one. */
 		if (coord->unit_pos < coord_last_unit_pos(coord)) {
 			coord->unit_pos += 1;
 			coord->between = AT_UNIT;
 			return 0;
 		}
 
-		/* Otherwise, it is crossing an item boundary and treated as if it was
-		   after the current item. */
+		/* Otherwise, it is crossing an item boundary and treated as if
+		   it was after the current item. */
 		coord->between = AFTER_ITEM;
 		coord->unit_pos = 0;
 		/* FALLTHROUGH */
 
 	case AFTER_ITEM:
 		/* Check for end-of-node. */
-		if (coord->item_pos == items - 1) {
+		if (coord->item_pos == items - 1)
 			return 1;
-		}
 
 		coord_inc_item_pos(coord);
 		coord->unit_pos = 0;
@@ -386,15 +384,14 @@ int coord_next_unit(coord_t * coord)
 }
 
 /* Advances the coordinate by one item to the right.  If empty, no change.  If
-   coord_is_rightmost_unit, advances to AFTER THE LAST ITEM.  Returns 0 if new position is
-   an existing item. */
-int coord_next_item(coord_t * coord)
+   coord_is_rightmost_unit, advances to AFTER THE LAST ITEM.  Returns 0 if new
+   position is an existing item. */
+int coord_next_item(coord_t *coord)
 {
 	unsigned items = coord_num_items(coord);
 
-	if (coord_adjust_items(coord, items, 1) == 1) {
+	if (coord_adjust_items(coord, items, 1) == 1)
 		return 1;
-	}
 
 	switch (coord->between) {
 	case AFTER_UNIT:
@@ -431,15 +428,14 @@ int coord_next_item(coord_t * coord)
 }
 
 /* Advances the coordinate by one unit to the left.  If empty, no change.  If
-   coord_is_leftmost_unit, advances to BEFORE THE FIRST ITEM.  Returns 0 if new position
-   is an existing unit. */
-int coord_prev_unit(coord_t * coord)
+   coord_is_leftmost_unit, advances to BEFORE THE FIRST ITEM.  Returns 0 if new
+   position is an existing unit. */
+int coord_prev_unit(coord_t *coord)
 {
 	unsigned items = coord_num_items(coord);
 
-	if (coord_adjust_items(coord, items, 0) == 1) {
+	if (coord_adjust_items(coord, items, 0) == 1)
 		return 1;
-	}
 
 	switch (coord->between) {
 	case AT_UNIT:
@@ -468,9 +464,8 @@ int coord_prev_unit(coord_t * coord)
 		return 0;
 
 	case BEFORE_ITEM:
-		if (coord->item_pos == 0) {
+		if (coord->item_pos == 0)
 			return 1;
-		}
 
 		coord_dec_item_pos(coord);
 		/* FALLTHROUGH */
@@ -490,15 +485,14 @@ int coord_prev_unit(coord_t * coord)
 }
 
 /* Advances the coordinate by one item to the left.  If empty, no change.  If
-   coord_is_leftmost_unit, advances to BEFORE THE FIRST ITEM.  Returns 0 if new position
-   is an existing item. */
-int coord_prev_item(coord_t * coord)
+   coord_is_leftmost_unit, advances to BEFORE THE FIRST ITEM.  Returns 0 if new
+   position is an existing item. */
+int coord_prev_item(coord_t *coord)
 {
 	unsigned items = coord_num_items(coord);
 
-	if (coord_adjust_items(coord, items, 0) == 1) {
+	if (coord_adjust_items(coord, items, 0) == 1)
 		return 1;
-	}
 
 	switch (coord->between) {
 	case AT_UNIT:
@@ -531,8 +525,9 @@ int coord_prev_item(coord_t * coord)
 	return 0;
 }
 
-/* Calls either coord_init_first_unit or coord_init_last_unit depending on sideof argument. */
-void coord_init_sideof_unit(coord_t * coord, const znode * node, sideof dir)
+/* Calls either coord_init_first_unit or coord_init_last_unit depending on
+   sideof argument. */
+void coord_init_sideof_unit(coord_t *coord, const znode * node, sideof dir)
 {
 	assert("jmacd-9821", dir == LEFT_SIDE || dir == RIGHT_SIDE);
 	if (dir == LEFT_SIDE) {
@@ -542,10 +537,10 @@ void coord_init_sideof_unit(coord_t * co
 	}
 }
 
-/* Calls either coord_is_before_leftmost or coord_is_after_rightmost depending on sideof
-   argument. */
+/* Calls either coord_is_before_leftmost or coord_is_after_rightmost depending
+   on sideof argument. */
 /* Audited by: green(2002.06.15) */
-int coord_is_after_sideof_unit(coord_t * coord, sideof dir)
+int coord_is_after_sideof_unit(coord_t *coord, sideof dir)
 {
 	assert("jmacd-9822", dir == LEFT_SIDE || dir == RIGHT_SIDE);
 	if (dir == LEFT_SIDE) {
@@ -555,9 +550,10 @@ int coord_is_after_sideof_unit(coord_t *
 	}
 }
 
-/* Calls either coord_next_unit or coord_prev_unit depending on sideof argument. */
+/* Calls either coord_next_unit or coord_prev_unit depending on sideof argument.
+ */
 /* Audited by: green(2002.06.15) */
-int coord_sideof_unit(coord_t * coord, sideof dir)
+int coord_sideof_unit(coord_t *coord, sideof dir)
 {
 	assert("jmacd-9823", dir == LEFT_SIDE || dir == RIGHT_SIDE);
 	if (dir == LEFT_SIDE) {
@@ -568,7 +564,7 @@ int coord_sideof_unit(coord_t * coord, s
 }
 
 #if REISER4_DEBUG
-int coords_equal(const coord_t * c1, const coord_t * c2)
+int coords_equal(const coord_t *c1, const coord_t *c2)
 {
 	assert("nikita-2840", c1 != NULL);
 	assert("nikita-2841", c2 != NULL);
@@ -580,26 +576,25 @@ int coords_equal(const coord_t * c1, con
 }
 #endif  /*  REISER4_DEBUG  */
 
-/* If coord_is_after_rightmost return NCOORD_ON_THE_RIGHT, if coord_is_after_leftmost
-   return NCOORD_ON_THE_LEFT, otherwise return NCOORD_INSIDE. */
+/* If coord_is_after_rightmost return NCOORD_ON_THE_RIGHT, if
+   coord_is_after_leftmost return NCOORD_ON_THE_LEFT, otherwise return
+   NCOORD_INSIDE. */
 /* Audited by: green(2002.06.15) */
-coord_wrt_node coord_wrt(const coord_t * coord)
+coord_wrt_node coord_wrt(const coord_t *coord)
 {
-	if (coord_is_before_leftmost(coord)) {
+	if (coord_is_before_leftmost(coord))
 		return COORD_ON_THE_LEFT;
-	}
 
-	if (coord_is_after_rightmost(coord)) {
+	if (coord_is_after_rightmost(coord))
 		return COORD_ON_THE_RIGHT;
-	}
 
 	return COORD_INSIDE;
 }
 
-/* Returns true if the coordinate is positioned after the last item or after the last unit
-   of the last item or it is an empty node. */
+/* Returns true if the coordinate is positioned after the last item or after the
+   last unit of the last item or it is an empty node. */
 /* Audited by: green(2002.06.15) */
-int coord_is_after_rightmost(const coord_t * coord)
+int coord_is_after_rightmost(const coord_t *coord)
 {
 	assert("jmacd-7313", coord_check(coord));
 
@@ -625,9 +620,9 @@ int coord_is_after_rightmost(const coord
 	return 0;
 }
 
-/* Returns true if the coordinate is positioned before the first item or it is an empty
-   node. */
-int coord_is_before_leftmost(const coord_t * coord)
+/* Returns true if the coordinate is positioned before the first item or it is
+   an empty node. */
+int coord_is_before_leftmost(const coord_t *coord)
 {
 	/* FIXME-VS: coord_check requires node to be loaded whereas it is not
 	   necessary to check if coord is set before leftmost
@@ -651,10 +646,11 @@ int coord_is_before_leftmost(const coord
 	return 0;
 }
 
-/* Returns true if the coordinate is positioned after a item, before a item, after the
-   last unit of an item, before the first unit of an item, or at an empty node. */
+/* Returns true if the coordinate is positioned after a item, before a item,
+   after the last unit of an item, before the first unit of an item, or at an
+   empty node. */
 /* Audited by: green(2002.06.15) */
-int coord_is_between_items(const coord_t * coord)
+int coord_is_between_items(const coord_t *coord)
 {
 	assert("jmacd-7313", coord_check(coord));
 
@@ -680,9 +676,9 @@ int coord_is_between_items(const coord_t
 }
 
 #if REISER4_DEBUG
-/* Returns true if the coordinates are positioned at adjacent units, regardless of
-   before-after or item boundaries. */
-int coord_are_neighbors(coord_t * c1, coord_t * c2)
+/* Returns true if the coordinates are positioned at adjacent units, regardless
+   of before-after or item boundaries. */
+int coord_are_neighbors(coord_t *c1, coord_t *c2)
 {
 	coord_t *left;
 	coord_t *right;
@@ -720,10 +716,11 @@ int coord_are_neighbors(coord_t * c1, co
 }
 #endif  /*  REISER4_DEBUG  */
 
-/* Assuming two coordinates are positioned in the same node, return COORD_CMP_ON_RIGHT,
-   COORD_CMP_ON_LEFT, or COORD_CMP_SAME depending on c1's position relative to c2.  */
+/* Assuming two coordinates are positioned in the same node, return
+   COORD_CMP_ON_RIGHT, COORD_CMP_ON_LEFT, or COORD_CMP_SAME depending on c1's
+   position relative to c2.  */
 /* Audited by: green(2002.06.15) */
-coord_cmp coord_compare(coord_t * c1, coord_t * c2)
+coord_cmp coord_compare(coord_t *c1, coord_t *c2)
 {
 	assert("vs-209", c1->node == c2->node);
 	assert("vs-194", coord_is_existing_unit(c1)
@@ -740,15 +737,14 @@ coord_cmp coord_compare(coord_t * c1, co
 	return COORD_CMP_SAME;
 }
 
-/* If the coordinate is between items, shifts it to the right.  Returns 0 on success and
-   non-zero if there is no position to the right. */
-int coord_set_to_right(coord_t * coord)
+/* If the coordinate is between items, shifts it to the right.  Returns 0 on
+   success and non-zero if there is no position to the right. */
+int coord_set_to_right(coord_t *coord)
 {
 	unsigned items = coord_num_items(coord);
 
-	if (coord_adjust_items(coord, items, 1) == 1) {
+	if (coord_adjust_items(coord, items, 1) == 1)
 		return 1;
-	}
 
 	switch (coord->between) {
 	case AT_UNIT:
@@ -779,9 +775,8 @@ int coord_set_to_right(coord_t * coord)
 		}
 
 	case AFTER_ITEM:
-		if (coord->item_pos == items - 1) {
+		if (coord->item_pos == items - 1)
 			return 1;
-		}
 
 		coord_inc_item_pos(coord);
 		coord->unit_pos = 0;
@@ -799,15 +794,14 @@ int coord_set_to_right(coord_t * coord)
 	return 0;
 }
 
-/* If the coordinate is between items, shifts it to the left.  Returns 0 on success and
-   non-zero if there is no position to the left. */
-int coord_set_to_left(coord_t * coord)
+/* If the coordinate is between items, shifts it to the left.  Returns 0 on
+   success and non-zero if there is no position to the left. */
+int coord_set_to_left(coord_t *coord)
 {
 	unsigned items = coord_num_items(coord);
 
-	if (coord_adjust_items(coord, items, 0) == 1) {
+	if (coord_adjust_items(coord, items, 0) == 1)
 		return 1;
-	}
 
 	switch (coord->between) {
 	case AT_UNIT:
@@ -841,9 +835,8 @@ int coord_set_to_left(coord_t * coord)
 		}
 
 	case BEFORE_ITEM:
-		if (coord->item_pos == 0) {
+		if (coord->item_pos == 0)
 			return 1;
-		}
 
 		coord_dec_item_pos(coord);
 		coord->unit_pos = coord_last_unit_pos(coord);
@@ -888,7 +881,7 @@ static const char *coord_tween_tostring(
 	}
 }
 
-void print_coord(const char *mes, const coord_t * coord, int node)
+void print_coord(const char *mes, const coord_t *coord, int node)
 {
 	if (coord == NULL) {
 		printk("%s: null\n", mes);
@@ -900,7 +893,7 @@ void print_coord(const char *mes, const 
 }
 
 int
-item_utmost_child_real_block(const coord_t * coord, sideof side,
+item_utmost_child_real_block(const coord_t *coord, sideof side,
 			     reiser4_block_nr * blk)
 {
 	return item_plugin_by_coord(coord)->f.utmost_child_real_block(coord,
@@ -908,14 +901,14 @@ item_utmost_child_real_block(const coord
 								      blk);
 }
 
-int item_utmost_child(const coord_t * coord, sideof side, jnode ** child)
+int item_utmost_child(const coord_t *coord, sideof side, jnode ** child)
 {
 	return item_plugin_by_coord(coord)->f.utmost_child(coord, side, child);
 }
 
 /* @count bytes of flow @f got written, update correspondingly f->length,
    f->data and f->key */
-void move_flow_forward(flow_t * f, unsigned count)
+void move_flow_forward(flow_t *f, unsigned count)
 {
 	if (f->data)
 		f->data += count;

--=-oW4K9VB5tlq0b9jcU+xb--

