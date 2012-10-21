From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 1/4] reiser4: fixups in cryptcompress plugin
Date: Sun, 21 Oct 2012 19:58:56 +0200
Message-ID: <508437E0.3040704@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000205050307080801050708"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=qANvB13WPjsCCZr4mNRgzGyQy59ljF3DqfSw8IekMbQ=;
        b=ROBF8MHg2wLo+q7BqKRDuhEIsi/p9iJG9oT5fJopCd17G38igdOoQ1J9XAid38JYYm
         w8cqnG4ymlh9/PmsEJfRipSFzpngX3hkNNIVjW1j99AolCfKCStpFw7lIsRqvUOYYhNN
         a3h6v30l84jIhwvtt9p/Pi2KRyGWPPwTpN7xNoO9GmsJGQ3VNtUSGdBUjJ2wkV+xta2C
         DfoJO9YP1VULTzOlLReiAuF2KA7gPYeuk/2Uc8YSWw2zB63K1VcLveF1nwXHGrLfELX0
         HE5rcyelsQtZwDeRMMu0WZAiTMeuJAKny5nWXDrgINn9w9Edvu8wQ3dloJ4F1YeDgwlD
         fTYA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------000205050307080801050708
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------000205050307080801050708
Content-Type: text/x-patch;
 name="reiser4-cryptcompress-fixups.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-cryptcompress-fixups.patch"

Fix up the main search procedure of cryptcompress plugin:
. make full-fledged tree traversal in the case when we
  encountered empty right neighbor;
. unlock the left neighbor only in the case when we moved
  to right.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/carry_ops.c                 |    6 +
 fs/reiser4/forward.h                   |    4 -
 fs/reiser4/plugin/file/cryptcompress.c |  124 +++++++++++++++++++++++----------
 fs/reiser4/plugin/item/ctail.c         |    5 +
 4 files changed, 101 insertions(+), 38 deletions(-)

--- linux-3.5.3.orig/fs/reiser4/plugin/file/cryptcompress.c
+++ linux-3.5.3/fs/reiser4/plugin/file/cryptcompress.c
@@ -703,8 +703,11 @@ static void free_reserved4cluster(struct
 	ch->reserved = 0;
 }
 
-/* The core search procedure of the cryptcompress plugin.
-   If returned value is not cbk_errored, then current znode is locked */
+/*
+ * The core search procedure of the cryptcompress plugin.
+ * If returned value is not cbk_errored, then current position
+ * is locked.
+ */
 static int find_cluster_item(hint_t * hint,
 			     const reiser4_key * key, /* key of the item we are
 							 looking for */
@@ -713,7 +716,6 @@ static int find_cluster_item(hint_t * hi
 {
 	int result;
 	reiser4_key ikey;
-	int went_right = 0;
 	coord_t *coord = &hint->ext_coord.coord;
 	coord_t orig = *coord;
 
@@ -730,58 +732,110 @@ static int find_cluster_item(hint_t * hi
 		hint_set_valid(hint);
 	}
 	assert("edward-709", znode_is_any_locked(coord->node));
-
-	/* In-place lookup is going here, it means we just need to
-	   check if next item of the @coord match to the @keyhint) */
-
+	/*
+	 * Hint is valid, so we perform in-place lookup.
+	 * It means we just need to check if the next item in
+	 * the tree (relative to the current position @coord)
+	 * has key @key.
+	 *
+	 * Valid hint means in particular, that node is not
+	 * empty and at least one its item has been processed
+	 */
 	if (equal_to_rdk(coord->node, key)) {
-		result = goto_right_neighbor(coord, &hint->lh);
-		if (result == -E_NO_NEIGHBOR) {
-			assert("edward-1217", 0);
-			return RETERR(-EIO);
+		/*
+		 * Look for the item in the right neighbor
+		 */
+		lock_handle lh_right;
+
+		init_lh(&lh_right);
+		result = reiser4_get_right_neighbor(&lh_right, coord->node,
+				    znode_is_wlocked(coord->node) ?
+				    ZNODE_WRITE_LOCK : ZNODE_READ_LOCK,
+				    GN_CAN_USE_UPPER_LEVELS);
+		if (result) {
+			done_lh(&lh_right);
+			reiser4_unset_hint(hint);
+			if (result == -E_NO_NEIGHBOR)
+				return RETERR(-EIO);
+			return result;
 		}
-		if (result)
+		assert("edward-1218",
+		       equal_to_ldk(lh_right.node, key));
+		result = zload(lh_right.node);
+		if (result) {
+			done_lh(&lh_right);
+			reiser4_unset_hint(hint);
 			return result;
-		assert("edward-1218", equal_to_ldk(coord->node, key));
-		went_right = 1;
+		}
+		coord_init_first_unit_nocheck(coord, lh_right.node);
+
+		if (!coord_is_existing_item(coord)) {
+			zrelse(lh_right.node);
+			done_lh(&lh_right);
+			goto traverse_tree;
+		}
+		item_key_by_coord(coord, &ikey);
+		zrelse(coord->node);
+		if (unlikely(!keyeq(key, &ikey))) {
+			warning("edward-1608",
+				"Expected item not found. Fsck?");
+			done_lh(&lh_right);
+			goto not_found;
+		}
+		/*
+		 * item has been found in the right neighbor;
+		 * move lock to the right
+		 */
+		done_lh(&hint->lh);
+		move_lh(&hint->lh, &lh_right);
+
+		dclust_inc_extension_ncount(hint);
+
+		return CBK_COORD_FOUND;
 	} else {
+		/*
+		 *  Look for the item in the current node
+		 */
 		coord->item_pos++;
 		coord->unit_pos = 0;
 		coord->between = AT_UNIT;
-	}
-	result = zload(coord->node);
-	if (result)
-		return result;
-	assert("edward-1219", !node_is_empty(coord->node));
 
-	if (!coord_is_existing_item(coord)) {
+		result = zload(coord->node);
+		if (result) {
+			done_lh(&hint->lh);
+			return result;
+		}
+		if (!coord_is_existing_item(coord)) {
+			zrelse(coord->node);
+			goto not_found;
+		}
+		item_key_by_coord(coord, &ikey);
 		zrelse(coord->node);
-		goto not_found;
+		if (!keyeq(key, &ikey))
+			goto not_found;
+		/*
+		 * item has been found in the current node
+		 */
+		return CBK_COORD_FOUND;
 	}
-	item_key_by_coord(coord, &ikey);
-	zrelse(coord->node);
-	if (!keyeq(key, &ikey))
-		goto not_found;
-	/* Ok, item is found, update node counts */
-	if (went_right)
-		dclust_inc_extension_ncount(hint);
-	return CBK_COORD_FOUND;
-
  not_found:
-	assert("edward-1220", coord->item_pos > 0);
-	//coord->item_pos--;
-	/* roll back */
+	/*
+	 * The tree doesn't contain an item with @key;
+	 * roll back the coord
+	 */
 	*coord = orig;
 	ON_DEBUG(coord_update_v(coord));
 	return CBK_COORD_NOTFOUND;
 
  traverse_tree:
-	assert("edward-713", hint->lh.owner == NULL);
-	assert("edward-714", reiser4_schedulable());
 
 	reiser4_unset_hint(hint);
 	dclust_init_extension(hint);
 	coord_init_zero(coord);
+
+	assert("edward-713", hint->lh.owner == NULL);
+	assert("edward-714", reiser4_schedulable());
+
 	result = coord_by_key(current_tree, key, coord, &hint->lh,
 			      lock_mode, bias, LEAF_LEVEL, LEAF_LEVEL,
 			      CBK_UNIQUE | flags, ra_info);
--- linux-3.5.3.orig/fs/reiser4/carry_ops.c
+++ linux-3.5.3/fs/reiser4/carry_ops.c
@@ -943,7 +943,7 @@ static int enough_space_for_whole_flow(c
 #define MIN_FLOW_FRACTION 1
 static int enough_space_for_min_flow_fraction(carry_op * op)
 {
-	assert("vs-902", coord_is_after_rightmost(flow_insert_point(op)));
+	//assert("vs-902", coord_is_after_rightmost(flow_insert_point(op)));
 
 	return what_can_fit_into_node(op) >= MIN_FLOW_FRACTION;
 }
@@ -1096,6 +1096,10 @@ make_space_for_flow_insertion(carry_op *
 		/* whole flow fits into insert point node */
 		return 0;
 	}
+	if ((flags & COPI_SWEEP) &&
+	    enough_space_for_min_flow_fraction(op))
+		/* use the rest of space in the current node */
+		return 0;
 
 	if (!(flags & COPI_DONT_SHIFT_LEFT)
 	    && (make_space_by_shift_left(op, doing, todo) == 0)) {
--- linux-3.5.3.orig/fs/reiser4/forward.h
+++ linux-3.5.3/fs/reiser4/forward.h
@@ -224,7 +224,9 @@ typedef enum {
 	COPI_GO_RIGHT = (1 << 6),
 	/* try to step back into original node if insertion into new node
 	   fails after shifting data there. */
-	COPI_STEP_BACK = (1 << 7)
+	COPI_STEP_BACK = (1 << 7),
+	/* use all possible space in the node */
+	COPI_SWEEP = (1 << 8)
 } cop_insert_flag;
 
 typedef enum {
--- linux-3.5.3.orig/fs/reiser4/plugin/item/ctail.c
+++ linux-3.5.3/fs/reiser4/plugin/item/ctail.c
@@ -935,7 +935,10 @@ insert_cryptcompress_flow(coord_t * coor
 	data->length = 0;
 	data->data = NULL;
 
-	op->u.insert_flow.flags = COPI_DONT_SHIFT_LEFT | COPI_DONT_SHIFT_RIGHT;
+	op->u.insert_flow.flags =
+		COPI_SWEEP |
+		COPI_DONT_SHIFT_LEFT |
+		COPI_DONT_SHIFT_RIGHT;
 	op->u.insert_flow.insert_point = coord;
 	op->u.insert_flow.flow = f;
 	op->u.insert_flow.data = data;

--------------000205050307080801050708--
