From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 12/8] coord.h cleanup
Date: Tue, 23 Oct 2007 15:47:45 +0200
Message-ID: <1193147265.6236.65.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- coord.h.orig	2007-10-23 15:32:16.000000000 +0200
+++ coord.h	2007-10-23 15:45:37.000000000 +0200
@@ -1,8 +1,9 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 /* Coords */
 
-#if !defined( __REISER4_COORD_H__ )
+#if !defined(__REISER4_COORD_H__)
 #define __REISER4_COORD_H__
 
 #include "forward.h"
@@ -13,7 +14,7 @@
 /* insertions happen between coords in the tree, so we need some means
    of specifying the sense of betweenness. */
 typedef enum {
-	BEFORE_UNIT,		/* Note: we/init_coord depends on this value being zero.
*/
+	BEFORE_UNIT, /* Note: we/init_coord depends on this value being zero.
*/
 	AT_UNIT,
 	AFTER_UNIT,
 	BEFORE_ITEM,
@@ -67,48 +68,48 @@ struct coord {
 #define INVALID_PLUGID  ((char)((1 << 8) - 1))
 #define INVALID_OFFSET -1
 
-static inline void coord_clear_iplug(coord_t * coord)
+static inline void coord_clear_iplug(coord_t *coord)
 {
 	assert("nikita-2835", coord != NULL);
 	coord->iplugid = INVALID_PLUGID;
 	coord->offset = INVALID_OFFSET;
 }
 
-static inline int coord_is_iplug_set(const coord_t * coord)
+static inline int coord_is_iplug_set(const coord_t *coord)
 {
 	assert("nikita-2836", coord != NULL);
 	return coord->iplugid != INVALID_PLUGID;
 }
 
-static inline void coord_set_item_pos(coord_t * coord, pos_in_node_t
pos)
+static inline void coord_set_item_pos(coord_t *coord, pos_in_node_t
pos)
 {
 	assert("nikita-2478", coord != NULL);
 	coord->item_pos = pos;
 	coord_clear_iplug(coord);
 }
 
-static inline void coord_dec_item_pos(coord_t * coord)
+static inline void coord_dec_item_pos(coord_t *coord)
 {
 	assert("nikita-2480", coord != NULL);
 	--coord->item_pos;
 	coord_clear_iplug(coord);
 }
 
-static inline void coord_inc_item_pos(coord_t * coord)
+static inline void coord_inc_item_pos(coord_t *coord)
 {
 	assert("nikita-2481", coord != NULL);
 	++coord->item_pos;
 	coord_clear_iplug(coord);
 }
 
-static inline void coord_add_item_pos(coord_t * coord, int delta)
+static inline void coord_add_item_pos(coord_t *coord, int delta)
 {
 	assert("nikita-2482", coord != NULL);
 	coord->item_pos += delta;
 	coord_clear_iplug(coord);
 }
 
-static inline void coord_invalid_item_pos(coord_t * coord)
+static inline void coord_invalid_item_pos(coord_t *coord)
 {
 	assert("nikita-2832", coord != NULL);
 	coord->item_pos = (unsigned short)~0;
@@ -134,182 +135,191 @@ static inline sideof sideof_reverse(side
 /* COORD INITIALIZERS */
 
 /* Initialize an invalid coordinate. */
-extern void coord_init_invalid(coord_t * coord, const znode * node);
+extern void coord_init_invalid(coord_t *coord, const znode * node);
 
-extern void coord_init_first_unit_nocheck(coord_t * coord, const znode
* node);
+extern void coord_init_first_unit_nocheck(coord_t *coord, const znode *
node);
 
-/* Initialize a coordinate to point at the first unit of the first
item.  If the node is
-   empty, it is positioned at the EMPTY_NODE. */
-extern void coord_init_first_unit(coord_t * coord, const znode * node);
+/* Initialize a coordinate to point at the first unit of the first
item. If the
+   node is empty, it is positioned at the EMPTY_NODE. */
+extern void coord_init_first_unit(coord_t *coord, const znode * node);
 
-/* Initialize a coordinate to point at the last unit of the last item.
If the node is
-   empty, it is positioned at the EMPTY_NODE. */
-extern void coord_init_last_unit(coord_t * coord, const znode * node);
+/* Initialize a coordinate to point at the last unit of the last item.
If the
+   node is empty, it is positioned at the EMPTY_NODE. */
+extern void coord_init_last_unit(coord_t *coord, const znode * node);
 
-/* Initialize a coordinate to before the first item.  If the node is
empty, it is
+/* Initialize a coordinate to before the first item. If the node is
empty, it is
    positioned at the EMPTY_NODE. */
-extern void coord_init_before_first_item(coord_t * coord, const znode *
node);
+extern void coord_init_before_first_item(coord_t *coord, const znode *
node);
 
-/* Initialize a coordinate to after the last item.  If the node is
empty, it is positioned
-   at the EMPTY_NODE. */
-extern void coord_init_after_last_item(coord_t * coord, const znode *
node);
+/* Initialize a coordinate to after the last item. If the node is
empty, it is
+   positioned at the EMPTY_NODE. */
+extern void coord_init_after_last_item(coord_t *coord, const znode *
node);
 
 /* Initialize a coordinate to after last unit in the item. Coord must
be set
    already to existing item */
-void coord_init_after_item_end(coord_t * coord);
+void coord_init_after_item_end(coord_t *coord);
 
-/* Initialize a coordinate to before the item. Coord must be set
already to existing item */
+/* Initialize a coordinate to before the item. Coord must be set
already to
+   existing item */
 void coord_init_before_item(coord_t *);
-/* Initialize a coordinate to after the item. Coord must be set already
to existing item */
+/* Initialize a coordinate to after the item. Coord must be set already
to
+   existing item */
 void coord_init_after_item(coord_t *);
 
-/* Calls either coord_init_first_unit or coord_init_last_unit depending
on sideof argument. */
-extern void coord_init_sideof_unit(coord_t * coord, const znode * node,
+/* Calls either coord_init_first_unit or coord_init_last_unit depending
on
+   sideof argument. */
+extern void coord_init_sideof_unit(coord_t *coord, const znode * node,
 				   sideof dir);
 
 /* Initialize a coordinate by 0s. Used in places where init_coord was
used and
    it was not clear how actually
    FIXME-VS: added by vs (2002, june, 8) */
-extern void coord_init_zero(coord_t * coord);
+extern void coord_init_zero(coord_t *coord);
 
 /* COORD METHODS */
 
 /* after shifting of node content, coord previously set properly may
become
    invalid, try to "normalize" it. */
-void coord_normalize(coord_t * coord);
+void coord_normalize(coord_t *coord);
 
 /* Copy a coordinate. */
-extern void coord_dup(coord_t * coord, const coord_t * old_coord);
+extern void coord_dup(coord_t *coord, const coord_t *old_coord);
 
 /* Copy a coordinate without check. */
-void coord_dup_nocheck(coord_t * coord, const coord_t * old_coord);
+void coord_dup_nocheck(coord_t *coord, const coord_t *old_coord);
 
-unsigned coord_num_units(const coord_t * coord);
+unsigned coord_num_units(const coord_t *coord);
 
 /* Return the last valid unit number at the present item (i.e.,
    coord_num_units() - 1). */
-static inline unsigned coord_last_unit_pos(const coord_t * coord)
+static inline unsigned coord_last_unit_pos(const coord_t *coord)
 {
 	return coord_num_units(coord) - 1;
 }
 
 #if REISER4_DEBUG
 /* For assertions only, checks for a valid coordinate. */
-extern int coord_check(const coord_t * coord);
+extern int coord_check(const coord_t *coord);
 
 extern unsigned long znode_times_locked(const znode * z);
 
-static inline void coord_update_v(coord_t * coord)
+static inline void coord_update_v(coord_t *coord)
 {
 	coord->plug_v = coord->body_v = znode_times_locked(coord->node);
 }
 #endif
 
-extern int coords_equal(const coord_t * c1, const coord_t * c2);
-
-extern void print_coord(const char *mes, const coord_t * coord, int
print_node);
+extern int coords_equal(const coord_t *c1, const coord_t *c2);
 
-/* If coord_is_after_rightmost return NCOORD_ON_THE_RIGHT, if
coord_is_after_leftmost
-   return NCOORD_ON_THE_LEFT, otherwise return NCOORD_INSIDE. */
-extern coord_wrt_node coord_wrt(const coord_t * coord);
+extern void print_coord(const char *mes, const coord_t *coord, int
print_node);
 
-/* Returns true if the coordinates are positioned at adjacent units,
regardless of
-   before-after or item boundaries. */
-extern int coord_are_neighbors(coord_t * c1, coord_t * c2);
-
-/* Assuming two coordinates are positioned in the same node, return
NCOORD_CMP_ON_RIGHT,
-   NCOORD_CMP_ON_LEFT, or NCOORD_CMP_SAME depending on c1's position
relative to c2.  */
-extern coord_cmp coord_compare(coord_t * c1, coord_t * c2);
+/* If coord_is_after_rightmost return NCOORD_ON_THE_RIGHT, if
+   coord_is_after_leftmost return NCOORD_ON_THE_LEFT, otherwise return
+   NCOORD_INSIDE. */
+extern coord_wrt_node coord_wrt(const coord_t *coord);
+
+/* Returns true if the coordinates are positioned at adjacent units,
regardless
+   of before-after or item boundaries. */
+extern int coord_are_neighbors(coord_t *c1, coord_t *c2);
+
+/* Assuming two coordinates are positioned in the same node, return
+   NCOORD_CMP_ON_RIGHT, NCOORD_CMP_ON_LEFT, or NCOORD_CMP_SAME
depending on c1's
+   position relative to c2.  */
+extern coord_cmp coord_compare(coord_t *c1, coord_t *c2);
 
 /* COORD PREDICATES */
 
 /* Returns true if the coord was initializewd by coord_init_invalid ().
*/
-extern int coord_is_invalid(const coord_t * coord);
+extern int coord_is_invalid(const coord_t *coord);
 
-/* Returns true if the coordinate is positioned at an existing item,
not before or after
-   an item.  It may be placed at, before, or after any unit within the
item, whether
-   existing or not.  If this is true you can call methods of the item
plugin.  */
-extern int coord_is_existing_item(const coord_t * coord);
-
-/* Returns true if the coordinate is positioned after a item, before a
item, after the
-   last unit of an item, before the first unit of an item, or at an
empty node. */
-extern int coord_is_between_items(const coord_t * coord);
-
-/* Returns true if the coordinate is positioned at an existing unit,
not before or after a
-   unit. */
-extern int coord_is_existing_unit(const coord_t * coord);
+/* Returns true if the coordinate is positioned at an existing item,
not before
+   or after an item. It may be placed at, before, or after any unit
within the
+   item, whether existing or not. If this is true you can call methods
of the
+   item plugin.  */
+extern int coord_is_existing_item(const coord_t *coord);
+
+/* Returns true if the coordinate is positioned after a item, before a
item,
+   after the last unit of an item, before the first unit of an item, or
at an
+   empty node. */
+extern int coord_is_between_items(const coord_t *coord);
+
+/* Returns true if the coordinate is positioned at an existing unit,
not before
+   or after a unit. */
+extern int coord_is_existing_unit(const coord_t *coord);
 
 /* Returns true if the coordinate is positioned at an empty node. */
-extern int coord_is_empty(const coord_t * coord);
-
-/* Returns true if the coordinate is positioned at the first unit of
the first item.  Not
-   true for empty nodes nor coordinates positioned before the first
item. */
-extern int coord_is_leftmost_unit(const coord_t * coord);
+extern int coord_is_empty(const coord_t *coord);
 
-/* Returns true if the coordinate is positioned after the last item or
after the last unit
-   of the last item or it is an empty node. */
-extern int coord_is_after_rightmost(const coord_t * coord);
-
-/* Returns true if the coordinate is positioned before the first item
or it is an empty
-   node. */
-extern int coord_is_before_leftmost(const coord_t * coord);
-
-/* Calls either coord_is_before_leftmost or coord_is_after_rightmost
depending on sideof
-   argument. */
-extern int coord_is_after_sideof_unit(coord_t * coord, sideof dir);
+/* Returns true if the coordinate is positioned at the first unit of
the first
+   item. Not true for empty nodes nor coordinates positioned before the
first
+   item. */
+extern int coord_is_leftmost_unit(const coord_t *coord);
+
+/* Returns true if the coordinate is positioned after the last item or
after the
+   last unit of the last item or it is an empty node. */
+extern int coord_is_after_rightmost(const coord_t *coord);
+
+/* Returns true if the coordinate is positioned before the first item
or it is
+    an empty node. */
+extern int coord_is_before_leftmost(const coord_t *coord);
+
+/* Calls either coord_is_before_leftmost or coord_is_after_rightmost
depending
+   on sideof argument. */
+extern int coord_is_after_sideof_unit(coord_t *coord, sideof dir);
 
 /* COORD MODIFIERS */
 
 /* Advances the coordinate by one unit to the right.  If empty, no
change.  If
-   coord_is_rightmost_unit, advances to AFTER THE LAST ITEM.  Returns 0
if new position is
-   an existing unit. */
-extern int coord_next_unit(coord_t * coord);
+   coord_is_rightmost_unit, advances to AFTER THE LAST ITEM.  Returns 0
if new
+   position is an existing unit. */
+extern int coord_next_unit(coord_t *coord);
 
 /* Advances the coordinate by one item to the right.  If empty, no
change.  If
-   coord_is_rightmost_unit, advances to AFTER THE LAST ITEM.  Returns 0
if new position is
-   an existing item. */
-extern int coord_next_item(coord_t * coord);
+   coord_is_rightmost_unit, advances to AFTER THE LAST ITEM.  Returns 0
if new
+   position is an existing item. */
+extern int coord_next_item(coord_t *coord);
 
 /* Advances the coordinate by one unit to the left.  If empty, no
change.  If
-   coord_is_leftmost_unit, advances to BEFORE THE FIRST ITEM.  Returns
0 if new position
-   is an existing unit. */
-extern int coord_prev_unit(coord_t * coord);
-
-/* Advances the coordinate by one item to the left.  If empty, no
change.  If
-   coord_is_leftmost_unit, advances to BEFORE THE FIRST ITEM.  Returns
0 if new position
-   is an existing item. */
-extern int coord_prev_item(coord_t * coord);
-
-/* If the coordinate is between items, shifts it to the right.  Returns
0 on success and
-   non-zero if there is no position to the right. */
-extern int coord_set_to_right(coord_t * coord);
-
-/* If the coordinate is between items, shifts it to the left.  Returns
0 on success and
-   non-zero if there is no position to the left. */
-extern int coord_set_to_left(coord_t * coord);
-
-/* If the coordinate is at an existing unit, set to after that unit.
Returns 0 on success
-   and non-zero if the unit did not exist. */
-extern int coord_set_after_unit(coord_t * coord);
+   coord_is_leftmost_unit, advances to BEFORE THE FIRST ITEM.  Returns
0 if new
+   position is an existing unit. */
+extern int coord_prev_unit(coord_t *coord);
+
+/* Advances the coordinate by one item to the left.  If empty, no
change. If
+   coord_is_leftmost_unit, advances to BEFORE THE FIRST ITEM. Returns 0
if new
+   position is an existing item. */
+extern int coord_prev_item(coord_t *coord);
+
+/* If the coordinate is between items, shifts it to the right.  Returns
0 on
+   success and non-zero if there is no position to the right. */
+extern int coord_set_to_right(coord_t *coord);
+
+/* If the coordinate is between items, shifts it to the left.  Returns
0 on
+   success and non-zero if there is no position to the left. */
+extern int coord_set_to_left(coord_t *coord);
+
+/* If the coordinate is at an existing unit, set to after that unit.
Returns 0
+   on success and non-zero if the unit did not exist. */
+extern int coord_set_after_unit(coord_t *coord);
 
-/* Calls either coord_next_unit or coord_prev_unit depending on sideof
argument. */
-extern int coord_sideof_unit(coord_t * coord, sideof dir);
+/* Calls either coord_next_unit or coord_prev_unit depending on sideof
+   argument. */
+extern int coord_sideof_unit(coord_t *coord, sideof dir);
 
 /* iterate over all units in @node */
-#define for_all_units( coord, node )					\
-	for( coord_init_before_first_item( ( coord ), ( node ) ) ; 	\
-	     coord_next_unit( coord ) == 0 ; )
+#define for_all_units(coord, node)					\
+	for (coord_init_before_first_item((coord), (node)) ; 	\
+	     coord_next_unit(coord) == 0 ;)
 
 /* iterate over all items in @node */
-#define for_all_items( coord, node )					\
-	for( coord_init_before_first_item( ( coord ), ( node ) ) ; 	\
-	     coord_next_item( coord ) == 0 ; )
+#define for_all_items(coord, node)					\
+	for (coord_init_before_first_item((coord), (node)) ; 	\
+	     coord_next_item(coord) == 0 ;)
 
 /* COORD/ITEM METHODS */
 
-extern int item_utmost_child_real_block(const coord_t * coord, sideof
side,
+extern int item_utmost_child_real_block(const coord_t *coord, sideof
side,
 					reiser4_block_nr * blk);
-extern int item_utmost_child(const coord_t * coord, sideof side,
+extern int item_utmost_child(const coord_t *coord, sideof side,
 			     jnode ** child);
 
 /* a flow is a sequence of bytes being written to or read from the
tree.  The
@@ -324,7 +334,7 @@ struct flow {
 	rw_op op;		/* NIKITA-FIXME-HANS: comment is where?  */
 };
 
-void move_flow_forward(flow_t * f, unsigned count);
+void move_flow_forward(flow_t *f, unsigned count);
 
 /* &reiser4_item_data - description of data to be inserted or pasted
 

