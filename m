From: Dushan Tcholich <dusanc@absolutok.net>
Subject: Resend of failed patches
Date: Tue, 23 Oct 2007 16:48:02 +0200
Message-ID: <1193150882.6236.90.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-Lk2Q8A7SHghud+tzS9z9"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-Lk2Q8A7SHghud+tzS9z9
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



--=-Lk2Q8A7SHghud+tzS9z9
Content-Disposition: attachment; filename=carry_ops.h.patch
Content-Type: text/x-patch; name=carry_ops.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- carry_ops.h.orig	2007-10-23 14:56:05.000000000 +0200
+++ carry_ops.h	2007-10-23 14:57:35.000000000 +0200
@@ -1,8 +1,9 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 /* implementation of carry operations. See carry_ops.c for details. */
 
-#if !defined( __CARRY_OPS_H__ )
+#if !defined(__CARRY_OPS_H__)
 #define __CARRY_OPS_H__
 
 #include "forward.h"
@@ -22,7 +23,7 @@ typedef struct carry_op_handler {
    thing. */
 extern carry_op_handler op_dispatch_table[COP_LAST_OP];
 
-unsigned int space_needed(const znode * node, const coord_t * coord,
+unsigned int space_needed(const znode * node, const coord_t *coord,
 			  const reiser4_item_data * data, int inserting);
 extern carry_node *find_left_carry(carry_node * node, carry_level * level);
 extern carry_node *find_right_carry(carry_node * node, carry_level * level);

--=-Lk2Q8A7SHghud+tzS9z9
Content-Disposition: attachment; filename=context.c.patch
Content-Type: text/x-patch; name=context.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- context.c.orig	2007-10-23 15:01:52.000000000 +0200
+++ context.c	2007-10-23 15:03:59.000000000 +0200
@@ -70,7 +70,7 @@ static void _reiser4_init_context(reiser
    This function should be called at the beginning of reiser4 part of
    syscall.
 */
-reiser4_context * reiser4_init_context(struct super_block * super)
+reiser4_context * reiser4_init_context(struct super_block *super)
 {
 	reiser4_context *context;
 
@@ -165,7 +165,8 @@ static void balance_dirty_pages_at(reise
    thread released all locks and closed transcrash etc.
 
 */
-static void reiser4_done_context(reiser4_context * context /* context being released */ )
+static void reiser4_done_context(reiser4_context * context)
+				/* context being released */
 {
 	assert("nikita-860", context != NULL);
 	assert("nikita-859", context->magic == context_magic);
@@ -266,7 +267,7 @@ void reiser4_ctx_gfp_mask_set(void)
 		ctx->gfp_mask = GFP_NOFS;
 }
 
-void reiser4_ctx_gfp_mask_force (gfp_t mask)
+void reiser4_ctx_gfp_mask_force(gfp_t mask)
 {
 	reiser4_context *ctx;
 	ctx = get_current_context();

--=-Lk2Q8A7SHghud+tzS9z9
Content-Disposition: attachment; filename=coord.h.patch
Content-Type: text/x-patch; name=coord.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- coord.h.orig	2007-10-23 15:32:16.000000000 +0200
+++ coord.h	2007-10-23 15:45:37.000000000 +0200
@@ -1,8 +1,9 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
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
-	BEFORE_UNIT,		/* Note: we/init_coord depends on this value being zero. */
+	BEFORE_UNIT, /* Note: we/init_coord depends on this value being zero. */
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
 
-static inline void coord_set_item_pos(coord_t * coord, pos_in_node_t pos)
+static inline void coord_set_item_pos(coord_t *coord, pos_in_node_t pos)
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
 
-extern void coord_init_first_unit_nocheck(coord_t * coord, const znode * node);
+extern void coord_init_first_unit_nocheck(coord_t *coord, const znode * node);
 
-/* Initialize a coordinate to point at the first unit of the first item.  If the node is
-   empty, it is positioned at the EMPTY_NODE. */
-extern void coord_init_first_unit(coord_t * coord, const znode * node);
+/* Initialize a coordinate to point at the first unit of the first item. If the
+   node is empty, it is positioned at the EMPTY_NODE. */
+extern void coord_init_first_unit(coord_t *coord, const znode * node);
 
-/* Initialize a coordinate to point at the last unit of the last item.  If the node is
-   empty, it is positioned at the EMPTY_NODE. */
-extern void coord_init_last_unit(coord_t * coord, const znode * node);
+/* Initialize a coordinate to point at the last unit of the last item. If the
+   node is empty, it is positioned at the EMPTY_NODE. */
+extern void coord_init_last_unit(coord_t *coord, const znode * node);
 
-/* Initialize a coordinate to before the first item.  If the node is empty, it is
+/* Initialize a coordinate to before the first item. If the node is empty, it is
    positioned at the EMPTY_NODE. */
-extern void coord_init_before_first_item(coord_t * coord, const znode * node);
+extern void coord_init_before_first_item(coord_t *coord, const znode * node);
 
-/* Initialize a coordinate to after the last item.  If the node is empty, it is positioned
-   at the EMPTY_NODE. */
-extern void coord_init_after_last_item(coord_t * coord, const znode * node);
+/* Initialize a coordinate to after the last item. If the node is empty, it is
+   positioned at the EMPTY_NODE. */
+extern void coord_init_after_last_item(coord_t *coord, const znode * node);
 
 /* Initialize a coordinate to after last unit in the item. Coord must be set
    already to existing item */
-void coord_init_after_item_end(coord_t * coord);
+void coord_init_after_item_end(coord_t *coord);
 
-/* Initialize a coordinate to before the item. Coord must be set already to existing item */
+/* Initialize a coordinate to before the item. Coord must be set already to
+   existing item */
 void coord_init_before_item(coord_t *);
-/* Initialize a coordinate to after the item. Coord must be set already to existing item */
+/* Initialize a coordinate to after the item. Coord must be set already to
+   existing item */
 void coord_init_after_item(coord_t *);
 
-/* Calls either coord_init_first_unit or coord_init_last_unit depending on sideof argument. */
-extern void coord_init_sideof_unit(coord_t * coord, const znode * node,
+/* Calls either coord_init_first_unit or coord_init_last_unit depending on
+   sideof argument. */
+extern void coord_init_sideof_unit(coord_t *coord, const znode * node,
 				   sideof dir);
 
 /* Initialize a coordinate by 0s. Used in places where init_coord was used and
    it was not clear how actually
    FIXME-VS: added by vs (2002, june, 8) */
-extern void coord_init_zero(coord_t * coord);
+extern void coord_init_zero(coord_t *coord);
 
 /* COORD METHODS */
 
 /* after shifting of node content, coord previously set properly may become
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
-extern void print_coord(const char *mes, const coord_t * coord, int print_node);
+extern int coords_equal(const coord_t *c1, const coord_t *c2);
 
-/* If coord_is_after_rightmost return NCOORD_ON_THE_RIGHT, if coord_is_after_leftmost
-   return NCOORD_ON_THE_LEFT, otherwise return NCOORD_INSIDE. */
-extern coord_wrt_node coord_wrt(const coord_t * coord);
+extern void print_coord(const char *mes, const coord_t *coord, int print_node);
 
-/* Returns true if the coordinates are positioned at adjacent units, regardless of
-   before-after or item boundaries. */
-extern int coord_are_neighbors(coord_t * c1, coord_t * c2);
-
-/* Assuming two coordinates are positioned in the same node, return NCOORD_CMP_ON_RIGHT,
-   NCOORD_CMP_ON_LEFT, or NCOORD_CMP_SAME depending on c1's position relative to c2.  */
-extern coord_cmp coord_compare(coord_t * c1, coord_t * c2);
+/* If coord_is_after_rightmost return NCOORD_ON_THE_RIGHT, if
+   coord_is_after_leftmost return NCOORD_ON_THE_LEFT, otherwise return
+   NCOORD_INSIDE. */
+extern coord_wrt_node coord_wrt(const coord_t *coord);
+
+/* Returns true if the coordinates are positioned at adjacent units, regardless
+   of before-after or item boundaries. */
+extern int coord_are_neighbors(coord_t *c1, coord_t *c2);
+
+/* Assuming two coordinates are positioned in the same node, return
+   NCOORD_CMP_ON_RIGHT, NCOORD_CMP_ON_LEFT, or NCOORD_CMP_SAME depending on c1's
+   position relative to c2.  */
+extern coord_cmp coord_compare(coord_t *c1, coord_t *c2);
 
 /* COORD PREDICATES */
 
 /* Returns true if the coord was initializewd by coord_init_invalid (). */
-extern int coord_is_invalid(const coord_t * coord);
+extern int coord_is_invalid(const coord_t *coord);
 
-/* Returns true if the coordinate is positioned at an existing item, not before or after
-   an item.  It may be placed at, before, or after any unit within the item, whether
-   existing or not.  If this is true you can call methods of the item plugin.  */
-extern int coord_is_existing_item(const coord_t * coord);
-
-/* Returns true if the coordinate is positioned after a item, before a item, after the
-   last unit of an item, before the first unit of an item, or at an empty node. */
-extern int coord_is_between_items(const coord_t * coord);
-
-/* Returns true if the coordinate is positioned at an existing unit, not before or after a
-   unit. */
-extern int coord_is_existing_unit(const coord_t * coord);
+/* Returns true if the coordinate is positioned at an existing item, not before
+   or after an item. It may be placed at, before, or after any unit within the
+   item, whether existing or not. If this is true you can call methods of the
+   item plugin.  */
+extern int coord_is_existing_item(const coord_t *coord);
+
+/* Returns true if the coordinate is positioned after a item, before a item,
+   after the last unit of an item, before the first unit of an item, or at an
+   empty node. */
+extern int coord_is_between_items(const coord_t *coord);
+
+/* Returns true if the coordinate is positioned at an existing unit, not before
+   or after a unit. */
+extern int coord_is_existing_unit(const coord_t *coord);
 
 /* Returns true if the coordinate is positioned at an empty node. */
-extern int coord_is_empty(const coord_t * coord);
-
-/* Returns true if the coordinate is positioned at the first unit of the first item.  Not
-   true for empty nodes nor coordinates positioned before the first item. */
-extern int coord_is_leftmost_unit(const coord_t * coord);
+extern int coord_is_empty(const coord_t *coord);
 
-/* Returns true if the coordinate is positioned after the last item or after the last unit
-   of the last item or it is an empty node. */
-extern int coord_is_after_rightmost(const coord_t * coord);
-
-/* Returns true if the coordinate is positioned before the first item or it is an empty
-   node. */
-extern int coord_is_before_leftmost(const coord_t * coord);
-
-/* Calls either coord_is_before_leftmost or coord_is_after_rightmost depending on sideof
-   argument. */
-extern int coord_is_after_sideof_unit(coord_t * coord, sideof dir);
+/* Returns true if the coordinate is positioned at the first unit of the first
+   item. Not true for empty nodes nor coordinates positioned before the first
+   item. */
+extern int coord_is_leftmost_unit(const coord_t *coord);
+
+/* Returns true if the coordinate is positioned after the last item or after the
+   last unit of the last item or it is an empty node. */
+extern int coord_is_after_rightmost(const coord_t *coord);
+
+/* Returns true if the coordinate is positioned before the first item or it is
+    an empty node. */
+extern int coord_is_before_leftmost(const coord_t *coord);
+
+/* Calls either coord_is_before_leftmost or coord_is_after_rightmost depending
+   on sideof argument. */
+extern int coord_is_after_sideof_unit(coord_t *coord, sideof dir);
 
 /* COORD MODIFIERS */
 
 /* Advances the coordinate by one unit to the right.  If empty, no change.  If
-   coord_is_rightmost_unit, advances to AFTER THE LAST ITEM.  Returns 0 if new position is
-   an existing unit. */
-extern int coord_next_unit(coord_t * coord);
+   coord_is_rightmost_unit, advances to AFTER THE LAST ITEM.  Returns 0 if new
+   position is an existing unit. */
+extern int coord_next_unit(coord_t *coord);
 
 /* Advances the coordinate by one item to the right.  If empty, no change.  If
-   coord_is_rightmost_unit, advances to AFTER THE LAST ITEM.  Returns 0 if new position is
-   an existing item. */
-extern int coord_next_item(coord_t * coord);
+   coord_is_rightmost_unit, advances to AFTER THE LAST ITEM.  Returns 0 if new
+   position is an existing item. */
+extern int coord_next_item(coord_t *coord);
 
 /* Advances the coordinate by one unit to the left.  If empty, no change.  If
-   coord_is_leftmost_unit, advances to BEFORE THE FIRST ITEM.  Returns 0 if new position
-   is an existing unit. */
-extern int coord_prev_unit(coord_t * coord);
-
-/* Advances the coordinate by one item to the left.  If empty, no change.  If
-   coord_is_leftmost_unit, advances to BEFORE THE FIRST ITEM.  Returns 0 if new position
-   is an existing item. */
-extern int coord_prev_item(coord_t * coord);
-
-/* If the coordinate is between items, shifts it to the right.  Returns 0 on success and
-   non-zero if there is no position to the right. */
-extern int coord_set_to_right(coord_t * coord);
-
-/* If the coordinate is between items, shifts it to the left.  Returns 0 on success and
-   non-zero if there is no position to the left. */
-extern int coord_set_to_left(coord_t * coord);
-
-/* If the coordinate is at an existing unit, set to after that unit.  Returns 0 on success
-   and non-zero if the unit did not exist. */
-extern int coord_set_after_unit(coord_t * coord);
+   coord_is_leftmost_unit, advances to BEFORE THE FIRST ITEM.  Returns 0 if new
+   position is an existing unit. */
+extern int coord_prev_unit(coord_t *coord);
+
+/* Advances the coordinate by one item to the left.  If empty, no change. If
+   coord_is_leftmost_unit, advances to BEFORE THE FIRST ITEM. Returns 0 if new
+   position is an existing item. */
+extern int coord_prev_item(coord_t *coord);
+
+/* If the coordinate is between items, shifts it to the right.  Returns 0 on
+   success and non-zero if there is no position to the right. */
+extern int coord_set_to_right(coord_t *coord);
+
+/* If the coordinate is between items, shifts it to the left.  Returns 0 on
+   success and non-zero if there is no position to the left. */
+extern int coord_set_to_left(coord_t *coord);
+
+/* If the coordinate is at an existing unit, set to after that unit.  Returns 0
+   on success and non-zero if the unit did not exist. */
+extern int coord_set_after_unit(coord_t *coord);
 
-/* Calls either coord_next_unit or coord_prev_unit depending on sideof argument. */
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
 
-extern int item_utmost_child_real_block(const coord_t * coord, sideof side,
+extern int item_utmost_child_real_block(const coord_t *coord, sideof side,
 					reiser4_block_nr * blk);
-extern int item_utmost_child(const coord_t * coord, sideof side,
+extern int item_utmost_child(const coord_t *coord, sideof side,
 			     jnode ** child);
 
 /* a flow is a sequence of bytes being written to or read from the tree.  The
@@ -324,7 +334,7 @@ struct flow {
 	rw_op op;		/* NIKITA-FIXME-HANS: comment is where?  */
 };
 
-void move_flow_forward(flow_t * f, unsigned count);
+void move_flow_forward(flow_t *f, unsigned count);
 
 /* &reiser4_item_data - description of data to be inserted or pasted
 

--=-Lk2Q8A7SHghud+tzS9z9
Content-Disposition: attachment; filename=debug.c.patch
Content-Type: text/x-patch; name=debug.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- debug.c.orig	2007-10-23 15:48:32.000000000 +0200
+++ debug.c	2007-10-23 15:49:55.000000000 +0200
@@ -60,7 +60,7 @@ static DEFINE_SPINLOCK(panic_guard);
 
 /* Your best friend. Call it on each occasion.  This is called by
     fs/reiser4/debug.h:reiser4_panic(). */
-void reiser4_do_panic(const char *format /* format string */ , ... /* rest */ )
+void reiser4_do_panic(const char *format/* format string */ , ... /* rest */)
 {
 	static int in_panic = 0;
 	va_list args;

--=-Lk2Q8A7SHghud+tzS9z9
Content-Disposition: attachment; filename=debug.h.patch
Content-Type: text/x-patch; name=debug.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- debug.h.orig	2007-10-23 15:52:33.000000000 +0200
+++ debug.h	2007-10-23 16:01:40.000000000 +0200
@@ -1,8 +1,9 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 /* Declarations of debug macros. */
 
-#if !defined( __FS_REISER4_DEBUG_H__ )
+#if !defined(__FS_REISER4_DEBUG_H__)
 #define __FS_REISER4_DEBUG_H__
 
 #include "forward.h"
@@ -37,9 +38,9 @@
     in 3.x journal.c. If cassertion fails you get compiler error,
     so no "maintainer-id".
 */
-#define cassert(cond) ({ switch(-1) { case (cond): case 0: break; } })
+#define cassert(cond) ({ switch (-1) { case (cond): case 0: break; } })
 
-#define noop   do {;} while(0)
+#define noop   do {; } while (0)
 
 #if REISER4_DEBUG
 /* version of info that only actually prints anything when _d_ebugging
@@ -48,38 +49,38 @@
 /* macro to catch logical errors. Put it into `default' clause of
     switch() statement. */
 #define impossible(label, format, ...) 			\
-         reiser4_panic(label, "impossible: " format , ## __VA_ARGS__)
+	reiser4_panic(label, "impossible: " format , ## __VA_ARGS__)
 /* assert assures that @cond is true. If it is not, reiser4_panic() is
    called. Use this for checking logical consistency and _never_ call
    this to check correctness of external data: disk blocks and user-input . */
-#define assert(label, cond)							\
-({										\
-	/* call_on_each_assert(); */						\
-	if (cond) {								\
-		/* put negated check to avoid using !(cond) that would lose	\
-		 * warnings for things like assert(a = b); */			\
-		;								\
-	} else {								\
-		DEBUGON(1);							\
-		reiser4_panic(label, "assertion failed: %s", #cond);		\
-	}									\
+#define assert(label, cond)						\
+({									\
+	/* call_on_each_assert(); */					\
+	if (cond) {							\
+		/* put negated check to avoid using !(cond) that would lose \
+		 * warnings for things like assert(a = b); */		\
+		;							\
+	} else {							\
+		DEBUGON(1);						\
+		reiser4_panic(label, "assertion failed: %s", #cond);	\
+	}								\
 })
 
 /* like assertion, but @expr is evaluated even if REISER4_DEBUG is off. */
-#define check_me( label, expr )	assert( label, ( expr ) )
+#define check_me(label, expr)	assert(label, (expr))
 
-#define ON_DEBUG( exp ) exp
+#define ON_DEBUG(exp) exp
 
 extern int reiser4_schedulable(void);
 extern void call_on_each_assert(void);
 
 #else
 
-#define dinfo( format, args... ) noop
-#define impossible( label, format, args... ) noop
-#define assert( label, cond ) noop
-#define check_me( label, expr )	( ( void ) ( expr ) )
-#define ON_DEBUG( exp )
+#define dinfo(format, args...) noop
+#define impossible(label, format, args...) noop
+#define assert(label, cond) noop
+#define check_me(label, expr)	((void) (expr))
+#define ON_DEBUG(exp)
 #define reiser4_schedulable() might_sleep()
 
 /* REISER4_DEBUG */
@@ -157,7 +158,7 @@ typedef struct reiser4_lock_cnt_info {
 #define LOCK_CNT_DEC(counter) noop
 #define LOCK_CNT_NIL(counter) (1)
 #define LOCK_CNT_GTZ(counter) (1)
-#define LOCK_CNT_LT(counter,n) (1)
+#define LOCK_CNT_LT(counter, n) (1)
 
 #endif				/* REISER4_DEBUG */
 
@@ -190,35 +191,35 @@ extern int is_in_reiser4_context(void);
  * evaluate expression @e only if with reiser4 context
  */
 #define ON_CONTEXT(e)	do {			\
-	if(is_in_reiser4_context()) {		\
+	if (is_in_reiser4_context()) {		\
 		e;				\
-	} } while(0)
+	} } while (0)
 
 /*
  * evaluate expression @e only when within reiser4_context and debugging is
  * on.
  */
-#define ON_DEBUG_CONTEXT( e ) ON_DEBUG( ON_CONTEXT( e ) )
+#define ON_DEBUG_CONTEXT(e) ON_DEBUG(ON_CONTEXT(e))
 
 /*
  * complain about unexpected function result and crash. Used in "default"
  * branches of switch statements and alike to assert that invalid results are
  * not silently ignored.
  */
-#define wrong_return_value( label, function )				\
-	impossible( label, "wrong return value from " function )
+#define wrong_return_value(label, function)				\
+	impossible(label, "wrong return value from " function)
 
 /* Issue different types of reiser4 messages to the console */
-#define warning( label, format, ... )					\
-	DCALL( KERN_WARNING, 						\
-	       printk, 1, label, "WARNING: " format , ## __VA_ARGS__ )
-#define notice( label, format, ... )					\
-	DCALL( KERN_NOTICE, 						\
-	       printk, 1, label, "NOTICE: " format , ## __VA_ARGS__ )
+#define warning(label, format, ...)					\
+	DCALL(KERN_WARNING, 						\
+	       printk, 1, label, "WARNING: " format , ## __VA_ARGS__)
+#define notice(label, format, ...)					\
+	DCALL(KERN_NOTICE, 						\
+	       printk, 1, label, "NOTICE: " format , ## __VA_ARGS__)
 
 /* mark not yet implemented functionality */
-#define not_yet( label, format, ... )				\
-	reiser4_panic( label, "NOT YET IMPLEMENTED: " format , ## __VA_ARGS__ )
+#define not_yet(label, format, ...)				\
+	reiser4_panic(label, "NOT YET IMPLEMENTED: " format , ## __VA_ARGS__)
 
 extern void reiser4_do_panic(const char *format, ...)
     __attribute__ ((noreturn, format(printf, 1, 2)));

--=-Lk2Q8A7SHghud+tzS9z9
Content-Disposition: attachment; filename=dformat.h.patch
Content-Type: text/x-patch; name=dformat.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- dformat.h.orig	2007-10-23 16:04:37.000000000 +0200
+++ dformat.h	2007-10-23 16:05:28.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 /* Formats of on-disk data and conversion functions. */
 
@@ -10,7 +11,7 @@
    To declare fields of on-disk structures, use d8, d16, d32 and d64.
    d??tocpu() and cputod??() to convert. */
 
-#if !defined( __FS_REISER4_DFORMAT_H__ )
+#if !defined(__FS_REISER4_DFORMAT_H__)
 #define __FS_REISER4_DFORMAT_H__
 
 #include <asm/byteorder.h>
@@ -37,7 +38,7 @@ typedef __le64 reiser4_dblock_nr;
  *
  * Returns true if if disk addresses are the same
  */
-static inline int disk_addr_eq(const reiser4_block_nr *b1,
+static inline int disk_addr_eq(const reiser4_block_nr * b1,
 			       const reiser4_block_nr * b2)
 {
 	assert("nikita-1033", b1 != NULL);

--=-Lk2Q8A7SHghud+tzS9z9--

