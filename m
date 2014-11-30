From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 1/3] reiser4: rewrite handling compressed files at flush time
Date: Sun, 30 Nov 2014 22:42:18 +0100
Message-ID: <547B8F3A.8070001@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010905000105040701010102"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=AMiTruibyDNqZumIbC0GKcaUzqutRbAf57vBVcHo2XA=;
        b=Qt2DG3VpEhAVTKBg29eCcaO3YYAJawcoDTqI1MxH0Zfax2auN4X+jtStdFECx2ISwq
         HqW7/bfm+kc6SZdPXS6LcrIRrxVmMytMjwsGfw4vaQr1QOMi9w1cThUP7s0S3bJSCtb7
         jk1dEG58OB9AzBu4bx4f/HaCLrUaSH3NTmY3ibyuK/dYMXXzhO+ZXCiMM5UX0hyAy/KP
         24Sl/BQsncdRJTAoeq/Ionk09xVHc+NbRe1om5frK68ivtK9GHWICa8UR1eR1+gAO1am
         kM45DmbHXy1iLclOj/MnarxnZtwSFWLmosxn8PsxVD643YXeRAblwIgnkf6JhQVs+/DO
         wySA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------010905000105040701010102
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

This is mostly equivalent transform.
The result looks better, there are more chances to understand what is 
going on.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

--------------010905000105040701010102
Content-Type: text/x-patch;
 name="reiser4-crc-fixup-11.11.14.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-crc-fixup-11.11.14.patch"

---

---
 fs/reiser4/flush.c                     |  222 ++++++++-----
 fs/reiser4/flush.h                     |   80 +---
 fs/reiser4/plugin/file/cryptcompress.h |    9 
 fs/reiser4/plugin/item/ctail.c         |  563 +++++++++++++++++++--------------
 4 files changed, 518 insertions(+), 356 deletions(-)

--- a/fs/reiser4/flush.c
+++ b/fs/reiser4/flush.c
@@ -1535,7 +1535,7 @@ out:
 static void item_convert_invariant(flush_pos_t *pos)
 {
 	assert("edward-1225", coord_is_existing_item(&pos->coord));
-	if (chaining_data_present(pos)) {
+	if (convert_data_attached(pos)) {
 		item_plugin *iplug = item_convert_plug(pos);
 
 		assert("edward-1000",
@@ -1550,15 +1550,32 @@ static void item_convert_invariant(flush
 
 #endif
 
-/* Scan node items starting from the first one and apply for each
-   item its flush ->convert() method (if any). This method may
-   resize/kill the item so the tree will be changed.
-*/
+/*
+ * Scan all node's items and apply for each one
+ * its ->convert() method. This method may:
+ * . resize the item;
+ * . kill the item;
+ * . insert a group of items/nodes on the right,
+ *   which possess the following properties:
+ *   . all new nodes are dirty and not convertible;
+ *   . for all new items ->convert() method is a noop.
+ *
+ * NOTE: this function makes the tree unbalanced!
+ * This intended to be used by flush squalloc() in a
+ * combination with squeeze procedure.
+ *
+ * GLOSSARY
+ *
+ * Chained nodes and items.
+ *   Two neighboring nodes @left and @right are chained,
+ *   iff the last item of @left and the first item of @right
+ *   belong to the same item cluster. In this case those
+ *   items are called chained.
+ */
 static int convert_node(flush_pos_t *pos, znode * node)
 {
 	int ret = 0;
 	item_plugin *iplug;
-
 	assert("edward-304", pos != NULL);
 	assert("edward-305", pos->child == NULL);
 	assert("edward-475", znode_convertible(node));
@@ -1587,34 +1604,68 @@ static int convert_node(flush_pos_t *pos
 		assert("edward-307", pos->child == NULL);
 
 		if (coord_next_item(&pos->coord)) {
-			/* node is over */
-
-			if (!chaining_data_present(pos))
-				/* finished this node */
-				break;
-			if (should_chain_next_node(pos)) {
-				/* go to next node */
-				move_chaining_data(pos, 0/* to next node */);
+			/*
+			 * node is over
+			 */
+			if (convert_data_attached(pos))
+				/*
+				 * the last item was convertible and
+				 * there still is an unprocesssed flow
+				 */
+				if (next_node_is_chained(pos)) {
+					/*
+					 * next node contains items of
+					 * the same disk cluster,
+					 * so finish with this node
+					 */
+					update_chaining_state(pos, 0/* move
+								       to next
+								       node */);
+					break;
+				}
+				else {
+					/*
+					 * perform one more iteration
+					 * for the same item and the
+					 * rest of flow
+					 */
+					update_chaining_state(pos, 1/* this
+								       node */);
+				}
+			else
+				/*
+				 * the last item wasn't convertible, or
+				 * convert date was detached in the last
+				 * iteration,
+				 * go to next node
+				 */
 				break;
-			}
-			/* repeat this node */
-			move_chaining_data(pos, 1/* this node */);
-			continue;
-		}
-		/* Node is not over.
-		   Check if there is attached convert data.
-		   If so roll one item position back and repeat
-		   on this node
-		 */
-		if (chaining_data_present(pos)) {
+		} else {
+			/*
+			 * Node is not over, item position got decremented.
+			 */
+			if (convert_data_attached(pos)) {
+				/*
+				 * disk cluster should be increased, so roll
+				 * one item position back and perform the
+				 * iteration with the previous item and the
+				 * rest of attached data
+				 */
+				if (iplug != item_plugin_by_coord(&pos->coord))
+					set_item_convert_count(pos, 0);
 
-			if (iplug != item_plugin_by_coord(&pos->coord))
-				set_item_convert_count(pos, 0);
+				ret = coord_prev_item(&pos->coord);
+				assert("edward-1003", !ret);
 
-			ret = coord_prev_item(&pos->coord);
-			assert("edward-1003", !ret);
-
-			move_chaining_data(pos, 1/* this node */);
+				update_chaining_state(pos, 1/* this node */);
+			}
+			else
+				/*
+				 * previous item was't convertible, or
+				 * convert date was detached in the last
+				 * iteration, go to next item
+				 */
+				;
 		}
 	}
 	JF_CLR(ZJNODE(node), JNODE_CONVERTIBLE);
@@ -1863,8 +1914,10 @@ out:
 	return ret;
 }
 
-/* Process nodes on leaf level until unformatted node or rightmost node in the
- * slum reached.  */
+/*
+ * Process nodes on leaf level until unformatted node or
+ * rightmost node in the slum reached
+ */
 static int handle_pos_on_formatted(flush_pos_t *pos)
 {
 	int ret;
@@ -1874,32 +1927,33 @@ static int handle_pos_on_formatted(flush
 	init_lh(&right_lock);
 	init_load_count(&right_load);
 
-	if (should_convert_node(pos, pos->lock.node)) {
+	if (znode_convertible(pos->lock.node)) {
 		ret = convert_node(pos, pos->lock.node);
 		if (ret)
 			return ret;
 	}
-
 	while (1) {
 		int expected;
-		expected = should_convert_next_node(pos);
+		expected = should_convert_right_neighbor(pos);
 		ret = neighbor_in_slum(pos->lock.node, &right_lock, RIGHT_SIDE,
 				       ZNODE_WRITE_LOCK, !expected, expected);
 		if (ret) {
 			if (expected)
 				warning("edward-1495",
-				"Expected neighbor not found (ret = %d). Fsck?",
+		        "Right neighbor is expected but not found (%d). Fsck?",
 					ret);
 			break;
 		}
-
-		/* we don't prep(allocate) nodes for flushing twice. This can be
+		/*
+		 * we don't prep(allocate) nodes for flushing twice. This can be
 		 * suboptimal, or it can be optimal. For now we choose to live
 		 * with the risk that it will be suboptimal because it would be
-		 * quite complex to code it to be smarter. */
+		 * quite complex to code it to be smarter.
+		 */
 		if (znode_check_flushprepped(right_lock.node)
 		    && !znode_convertible(right_lock.node)) {
-			assert("edward-1005", !should_convert_next_node(pos));
+			assert("edward-1005",
+			       !should_convert_right_neighbor(pos));
 			pos_stop(pos);
 			break;
 		}
@@ -1907,59 +1961,67 @@ static int handle_pos_on_formatted(flush
 		ret = incr_load_count_znode(&right_load, right_lock.node);
 		if (ret)
 			break;
-		if (should_convert_node(pos, right_lock.node)) {
+		if (znode_convertible(right_lock.node)) {
 			ret = convert_node(pos, right_lock.node);
 			if (ret)
 				break;
-			if (node_is_empty(right_lock.node)) {
-				/* node became empty after converting, repeat */
+			if (unlikely(node_is_empty(right_lock.node))) {
+				/*
+				 * node became empty after convertion,
+				 * skip this
+				 */
 				done_load_count(&right_load);
 				done_lh(&right_lock);
 				continue;
 			}
 		}
-
-		/* squeeze _before_ going upward. */
-		ret =
-		    squeeze_right_neighbor(pos, pos->lock.node,
-					   right_lock.node);
+		/*
+		 * Current node and its right neighbor are converted.
+		 * Squeeze them _before_ going upward.
+		 */
+		ret = squeeze_right_neighbor(pos, pos->lock.node,
+					     right_lock.node);
 		if (ret < 0)
 			break;
 
+		if (node_is_empty(right_lock.node)) {
+			/*
+                         * right node was squeezed completely,
+                         * skip this
+                         */
+                        done_load_count(&right_load);
+                        done_lh(&right_lock);
+                        continue;
+                }
 		if (znode_check_flushprepped(right_lock.node)) {
-			if (should_convert_next_node(pos)) {
-				/* in spite of flushprepped status of the node,
-				   its right slum neighbor should be converted*/
+			if (should_convert_right_neighbor(pos)) {
+				/*
+				 * in spite of flushprepped status of the node,
+				 * its right slum neighbor should be converted
+				 */
 				assert("edward-953", convert_data(pos));
 				assert("edward-954", item_convert_data(pos));
 
-				if (node_is_empty(right_lock.node)) {
-					done_load_count(&right_load);
-					done_lh(&right_lock);
-				} else
-					move_flush_pos(pos, &right_lock,
-						       &right_load, NULL);
+				move_flush_pos(pos, &right_lock, &right_load, NULL);
 				continue;
+			} else {
+				pos_stop(pos);
+				break;
 			}
-			pos_stop(pos);
-			break;
-		}
-
-		if (node_is_empty(right_lock.node)) {
-			/* repeat if right node was squeezed completely */
-			done_load_count(&right_load);
-			done_lh(&right_lock);
-			continue;
 		}
-
-		/* parent(right_lock.node) has to be processed before
-		 * (right_lock.node) due to "parent-first" allocation order. */
-		ret =
-		    check_parents_and_squalloc_upper_levels(pos, pos->lock.node,
-							    right_lock.node);
+		/*
+		 * parent(right_lock.node) has to be processed before
+		 * (right_lock.node) due to "parent-first" allocation
+		 * order
+		 */
+		ret = check_parents_and_squalloc_upper_levels(pos,
+							      pos->lock.node,
+							      right_lock.node);
 		if (ret)
 			break;
-		/* (re)allocate _after_ going upward */
+		/*
+		 * (re)allocate _after_ going upward
+		 */
 		ret = lock_parent_and_allocate_znode(right_lock.node, pos);
 		if (ret)
 			break;
@@ -1967,8 +2029,9 @@ static int handle_pos_on_formatted(flush
 			set_item_convert_count(pos, 0);
 			break;
 		}
-
-		/* advance the flush position to the right neighbor */
+		/*
+		 * advance the flush position to the right neighbor
+		 */
 		move_flush_pos(pos, &right_lock, &right_load, NULL);
 
 		ret = rapid_flush(pos);
@@ -1978,9 +2041,10 @@ static int handle_pos_on_formatted(flush
 	check_convert_info(pos);
 	done_load_count(&right_load);
 	done_lh(&right_lock);
-
-	/* This function indicates via pos whether to stop or go to twig or
-	 * continue on current level. */
+	/*
+	 * This function indicates via pos whether to stop or go to twig or
+	 * continue on current level
+	 */
 	return ret;
 
 }
--- a/fs/reiser4/flush.h
+++ b/fs/reiser4/flush.h
@@ -62,8 +62,9 @@ struct flush_scan {
 };
 
 struct convert_item_info {
-	dc_item_stat d_cur;	/* disk cluster state of the current item */
-	dc_item_stat d_next;	/* disk cluster state of the next slum item */
+	dc_item_stat d_cur;	/* per-cluster status of the current item */
+	dc_item_stat d_next;    /* per-cluster status of the first item on
+				                         the right neighbor */
 	int cluster_shift;      /* disk cluster shift */
 	flow_t flow;            /* disk cluster data */
 };
@@ -166,51 +167,36 @@ static inline struct tfm_stream *tfm_str
 	return get_tfm_stream(tfm_cluster_sq(pos), id);
 }
 
-static inline int chaining_data_present(flush_pos_t *pos)
+static inline int convert_data_attached(flush_pos_t *pos)
 {
-	return convert_data(pos) && item_convert_data(pos);
+	return convert_data(pos) != NULL && item_convert_data(pos) != NULL;
 }
 
+#define should_convert_right_neighbor(pos) convert_data_attached(pos)
+
 /* Returns true if next node contains next item of the disk cluster
    so item convert data should be moved to the right slum neighbor.
 */
-static inline int should_chain_next_node(flush_pos_t *pos)
+static inline int next_node_is_chained(flush_pos_t *pos)
 {
-	int result = 0;
-
-	assert("edward-1007", chaining_data_present(pos));
-
-	switch (item_convert_data(pos)->d_next) {
-	case DC_CHAINED_ITEM:
-		result = 1;
-		break;
-	case DC_AFTER_CLUSTER:
-		break;
-	default:
-		impossible("edward-1009", "bad state of next slum item");
-	}
-	return result;
+	return convert_data_attached(pos) &&
+		item_convert_data(pos)->d_next == DC_CHAINED_ITEM;
 }
 
-/* update item state in a disk cluster to assign conversion mode */
-static inline void
-move_chaining_data(flush_pos_t *pos, int this_node/* where is next item */)
+/*
+ * Update "twin state" (d_cur, d_next) to assign a proper
+ * conversion mode in the next iteration of convert_node()
+ */
+static inline void update_chaining_state(flush_pos_t *pos,
+					 int this_node /* where to proceed */)
 {
 
-	assert("edward-1010", chaining_data_present(pos));
+	assert("edward-1010", convert_data_attached(pos));
 
-	if (this_node == 0) {
-		/* next item is on the right neighbor */
-		assert("edward-1011",
-		       item_convert_data(pos)->d_cur == DC_FIRST_ITEM ||
-		       item_convert_data(pos)->d_cur == DC_CHAINED_ITEM);
-		assert("edward-1012",
-		       item_convert_data(pos)->d_next == DC_CHAINED_ITEM);
-
-		item_convert_data(pos)->d_cur = DC_CHAINED_ITEM;
-		item_convert_data(pos)->d_next = DC_INVALID_STATE;
-	} else {
-		/* next item is on the same node */
+	if (this_node) {
+		/*
+		 * we want to perform one more iteration with the same item
+		 */
 		assert("edward-1013",
 		       item_convert_data(pos)->d_cur == DC_FIRST_ITEM ||
 		       item_convert_data(pos)->d_cur == DC_CHAINED_ITEM);
@@ -221,17 +207,19 @@ move_chaining_data(flush_pos_t *pos, int
 		item_convert_data(pos)->d_cur = DC_AFTER_CLUSTER;
 		item_convert_data(pos)->d_next = DC_INVALID_STATE;
 	}
-}
-
-static inline int should_convert_node(flush_pos_t *pos, znode * node)
-{
-	return znode_convertible(node);
-}
+	else {
+		/*
+		 * we want to proceed on right neighbor, which is chained
+		 */
+		assert("edward-1011",
+		       item_convert_data(pos)->d_cur == DC_FIRST_ITEM ||
+		       item_convert_data(pos)->d_cur == DC_CHAINED_ITEM);
+		assert("edward-1012",
+		       item_convert_data(pos)->d_next == DC_CHAINED_ITEM);
 
-/* true if there is attached convert item info */
-static inline int should_convert_next_node(flush_pos_t *pos)
-{
-	return convert_data(pos) && item_convert_data(pos);
+		item_convert_data(pos)->d_cur = DC_CHAINED_ITEM;
+		item_convert_data(pos)->d_next = DC_INVALID_STATE;
+	}
 }
 
 #define SQUALLOC_THRESHOLD 256
@@ -246,7 +234,7 @@ static inline int should_terminate_squal
 #if 1
 #define check_convert_info(pos)						\
 do {							        	\
-	if (unlikely(should_convert_next_node(pos))) {			\
+	if (unlikely(should_convert_right_neighbor(pos))) {		\
 		warning("edward-1006", "unprocessed chained data");	\
 		printk("d_cur = %d, d_next = %d, flow.len = %llu\n",	\
 		       item_convert_data(pos)->d_cur,			\
--- a/fs/reiser4/plugin/file/cryptcompress.h
+++ b/fs/reiser4/plugin/file/cryptcompress.h
@@ -136,10 +136,11 @@ static inline void free_ts_data(struct t
 
 /* Write modes for item conversion in flush convert phase */
 typedef enum {
-	CRC_APPEND_ITEM = 1,
-	CRC_OVERWRITE_ITEM = 2,
-	CRC_CUT_ITEM = 3
-} cryptcompress_write_mode_t;
+	CTAIL_INVAL_CONVERT_MODE = 0,
+	CTAIL_APPEND_ITEM = 1,
+	CTAIL_OVERWRITE_ITEM = 2,
+	CTAIL_CUT_ITEM = 3
+} ctail_convert_mode_t;
 
 typedef enum {
 	LC_INVAL  = 0,   /* invalid value */
--- a/fs/reiser4/plugin/item/ctail.c
+++ b/fs/reiser4/plugin/item/ctail.c
@@ -122,9 +122,8 @@ static char *first_unit(coord_t * coord)
    tail_max_key_inside */
 
 /* plugin->u.item.b.can_contain_key */
-int
-can_contain_key_ctail(const coord_t * coord, const reiser4_key * key,
-		      const reiser4_item_data * data)
+int can_contain_key_ctail(const coord_t * coord, const reiser4_key * key,
+			  const reiser4_item_data * data)
 {
 	reiser4_key item_key;
 
@@ -139,6 +138,10 @@ can_contain_key_ctail(const coord_t * co
 	    get_key_offset(key))
 		return 0;
 	if (is_disk_cluster_key(key, coord))
+		/*
+		 * can not merge at the beginning
+		 * of a logical cluster in a file
+		 */
 		return 0;
 	return 1;
 }
@@ -156,7 +159,6 @@ int mergeable_ctail(const coord_t * p1,
 		/* second item is of another type */
 		return 0;
 	}
-
 	item_key_by_coord(p1, &key1);
 	item_key_by_coord(p2, &key2);
 	if (get_key_locality(&key1) != get_key_locality(&key2) ||
@@ -169,6 +171,10 @@ int mergeable_ctail(const coord_t * p1,
 		/*  not adjacent items */
 		return 0;
 	if (is_disk_cluster_key(&key2, p2))
+		/*
+		 * can not merge at the beginning
+		 * of a logical cluster in a file
+		 */
 		return 0;
 	return 1;
 }
@@ -279,13 +285,15 @@ paste_ctail(coord_t * coord, reiser4_ite
 
 /* plugin->u.item.b.fast_paste */
 
-/* plugin->u.item.b.can_shift
-   number of units is returned via return value, number of bytes via @size. For
-   ctail items they coincide */
-int
-can_shift_ctail(unsigned free_space, coord_t * source,
-		znode * target, shift_direction direction UNUSED_ARG,
-		unsigned *size /* number of bytes */ , unsigned want)
+/*
+ * plugin->u.item.b.can_shift
+ *
+ * Return number of units that can be shifted;
+ * Store space (in bytes) occupied by those units in @size.
+ */
+int can_shift_ctail(unsigned free_space, coord_t *source,
+		    znode * target, shift_direction direction UNUSED_ARG,
+		    unsigned *size, unsigned want)
 {
 	/* make sure that that we do not want to shift more than we have */
 	assert("edward-68", want > 0 && want <= nr_units_ctail(source));
@@ -293,23 +301,33 @@ can_shift_ctail(unsigned free_space, coo
 	*size = min(want, free_space);
 
 	if (!target) {
-		/* new item will be created */
+		/*
+		 * new item will be created
+		 */
 		if (*size <= sizeof(ctail_item_format)) {
+			/*
+			 * can not shift only ctail header
+			 */
 			*size = 0;
 			return 0;
 		}
 		return *size - sizeof(ctail_item_format);
 	}
-	return *size;
+	else
+		/*
+		 * shifting to the mergeable item
+		 */
+		return *size;
 }
 
-/* plugin->u.item.b.copy_units
-   cooperates with ->can_shift() */
-void
-copy_units_ctail(coord_t * target, coord_t * source,
-		 unsigned from, unsigned count /* units */ ,
-		 shift_direction where_is_free_space,
-		 unsigned free_space /* bytes */ )
+/*
+ * plugin->u.item.b.copy_units
+ * cooperates with ->can_shift()
+ */
+void copy_units_ctail(coord_t * target, coord_t * source,
+		      unsigned from, unsigned count /* units */ ,
+		      shift_direction where_is_free_space,
+		      unsigned free_space /* bytes */ )
 {
 	/* make sure that item @target is expanded already */
 	assert("edward-69", (unsigned)item_length_by_coord(target) >= count);
@@ -318,15 +336,19 @@ copy_units_ctail(coord_t * target, coord
 	assert("edward-858", ctail_ok(source));
 
 	if (where_is_free_space == SHIFT_LEFT) {
-		/* append item @target with @count first bytes of @source:
-		   this restriction came from ordinary tails */
+		/*
+		 * append item @target with @count first bytes
+		 * of @source: this restriction came from ordinary tails
+		 */
 		assert("edward-71", from == 0);
 		assert("edward-860", ctail_ok(target));
 
 		memcpy(first_unit(target) + nr_units_ctail(target) - count,
 		       first_unit(source), count);
 	} else {
-		/* target item is moved to right already */
+		/*
+		 * target item is moved to right already
+		 */
 		reiser4_key key;
 
 		assert("edward-72", nr_units_ctail(source) == from + count);
@@ -334,20 +356,25 @@ copy_units_ctail(coord_t * target, coord
 		if (free_space == count) {
 			init_ctail(target, source, NULL);
 		} else {
-			/* new item has been created */
+			/*
+			 * shifting to a mergeable item
+			 */
 			assert("edward-862", ctail_ok(target));
 		}
 		memcpy(first_unit(target), first_unit(source) + from, count);
 
 		assert("edward-863", ctail_ok(target));
-
-		/* new units are inserted before first unit in an item,
-		   therefore, we have to update item key */
+		/*
+		 * new units are inserted before first unit
+		 * in an item, therefore, we have to update
+		 * item key
+		 */
 		item_key_by_coord(source, &key);
 		set_key_offset(&key, get_key_offset(&key) + from);
 
-		node_plugin_by_node(target->node)->update_item_key(target, &key,
-								   NULL /*info */);
+		node_plugin_by_node(target->node)->update_item_key(target,
+								&key,
+								NULL /*info */);
 	}
 }
 
@@ -1056,45 +1083,6 @@ int ctail_insert_unprepped_cluster(struc
 	return result;
 }
 
-static int do_convert_ctail(flush_pos_t * pos, cryptcompress_write_mode_t mode)
-{
-	int result = 0;
-	struct convert_item_info * info;
-
-	assert("edward-468", pos != NULL);
-	assert("edward-469", pos->sq != NULL);
-	assert("edward-845", item_convert_data(pos) != NULL);
-
-	info = item_convert_data(pos);
-	assert("edward-679", info->flow.data != NULL);
-
-	switch (mode) {
-	case CRC_APPEND_ITEM:
-		assert("edward-1229", info->flow.length != 0);
-		assert("edward-1256",
-		       cluster_shift_ok(cluster_shift_by_coord(&pos->coord)));
-		result =
-		    insert_cryptcompress_flow_in_place(&pos->coord,
-						       &pos->lock,
-						       &info->flow,
-						       info->cluster_shift);
-		break;
-	case CRC_OVERWRITE_ITEM:
-		assert("edward-1230", info->flow.length != 0);
-		overwrite_ctail(&pos->coord, &info->flow);
-		if (info->flow.length != 0)
-			break;
-	case CRC_CUT_ITEM:
-		assert("edward-1231", info->flow.length == 0);
-		result = cut_ctail(&pos->coord);
-		break;
-	default:
-		result = RETERR(-EIO);
-		impossible("edward-244", "bad convert mode");
-	}
-	return result;
-}
-
 /* plugin->u.item.f.scan */
 int scan_ctail(flush_scan * scan)
 {
@@ -1298,7 +1286,8 @@ static int attach_convert_idata(flush_po
 
 	/* prepare flow for insertion */
 	fplug->flow_by_inode(inode,
-			     (const char __user *)tfm_stream_data(&clust->tc, OUTPUT_STREAM),
+			     (const char __user *)tfm_stream_data(&clust->tc,
+								 OUTPUT_STREAM),
 			     0 /* kernel space */ ,
 			     clust->tc.len,
 			     clust_to_off(clust->index, inode),
@@ -1354,162 +1343,194 @@ int utmost_child_ctail(const coord_t * c
 	return 0;
 }
 
-/* Returns true if @p2 is the next item to @p1
-   in the _same_ disk cluster.
-   Disk cluster is a set of items. If ->clustered() != NULL,
-   with each item the whole disk cluster should be read/modified
-*/
-
-/* Go rightward and check for next disk cluster item, set
- * d_next to DC_CHAINED_ITEM, if the last one exists.
- * If the current position is last item, go to right neighbor.
- * Skip empty nodes. Note, that right neighbors may be not in
- * the slum because of races. If so, make it dirty and
- * convertible.
+/*
+ * Set status (d_next) of the first item at the right neighbor
+ *
+ * If the current position is the last item in the node, then
+ * look at its first item at the right neighbor (skip empty nodes).
+ * Note, that right neighbors may be not dirty because of races.
+ * If so, make it dirty and set convertible flag.
  */
-static int next_item_dc_stat(flush_pos_t * pos)
+static int pre_convert_ctail(flush_pos_t * pos)
 {
 	int ret = 0;
 	int stop = 0;
-	znode *cur;
-	coord_t coord;
-	lock_handle lh;
-	lock_handle right_lock;
+	znode *slider;
+	lock_handle slider_lh;
+	lock_handle right_lh;
 
 	assert("edward-1232", !node_is_empty(pos->coord.node));
 	assert("edward-1014",
 	       pos->coord.item_pos < coord_num_items(&pos->coord));
-	assert("edward-1015", chaining_data_present(pos));
+	assert("edward-1015", convert_data_attached(pos));
+	assert("edward-1611",
+	       item_convert_data(pos)->d_cur != DC_INVALID_STATE);
 	assert("edward-1017",
 	       item_convert_data(pos)->d_next == DC_INVALID_STATE);
 
-	item_convert_data(pos)->d_next = DC_AFTER_CLUSTER;
-
-	if (item_convert_data(pos)->d_cur == DC_AFTER_CLUSTER)
-		return ret;
-	if (pos->coord.item_pos < coord_num_items(&pos->coord) - 1)
-		return ret;
-
-	/* Check next slum item.
-	 * Note, that it can not be killed by concurrent truncate,
-	 * as the last one will want the lock held by us.
+	/*
+	 * In the following two cases we don't need
+	 * to look at right neighbor
 	 */
-	init_lh(&right_lock);
-	cur = pos->coord.node;
+	if (item_convert_data(pos)->d_cur == DC_AFTER_CLUSTER) {
+		/*
+		 * cluster is over, so the first item of the right
+		 * neighbor doesn't belong to this cluster
+		 */
+		return 0;
+	}
+	if (pos->coord.item_pos < coord_num_items(&pos->coord) - 1) {
+		/*
+		 * current position is not the last item in the node,
+		 * so the first item of the right neighbor doesn't
+		 * belong to this cluster
+		 */
+		return 0;
+	}
+	/*
+	 * Look at right neighbor.
+	 * Note that concurrent truncate is not a problem
+	 * since we have locked the beginning of the cluster.
+	 */
+	slider = pos->coord.node;
+	init_lh(&slider_lh);
+	init_lh(&right_lh);
 
 	while (!stop) {
-		init_lh(&lh);
-		ret = reiser4_get_right_neighbor(&lh,
-						 cur,
+		coord_t coord;
+
+		ret = reiser4_get_right_neighbor(&right_lh,
+						 slider,
 						 ZNODE_WRITE_LOCK,
 						 GN_CAN_USE_UPPER_LEVELS);
 		if (ret)
 			break;
-		ret = zload(lh.node);
-		if (ret) {
-			done_lh(&lh);
+		slider = right_lh.node;
+		ret = zload(slider);
+		if (ret)
 			break;
-		}
-		coord_init_before_first_item(&coord, lh.node);
+		coord_init_before_first_item(&coord, slider);
 
-		if (node_is_empty(lh.node)) {
-			znode_make_dirty(lh.node);
-			znode_set_convertible(lh.node);
+		if (node_is_empty(slider)) {
+			znode_make_dirty(slider);
+			znode_set_convertible(slider);
+			/*
+			 * skip this node,
+			 * go rightward
+			 */
 			stop = 0;
 		} else if (same_disk_cluster(&pos->coord, &coord)) {
 
 			item_convert_data(pos)->d_next = DC_CHAINED_ITEM;
 
-			if (!ZF_ISSET(lh.node, JNODE_DIRTY)) {
+			if (!ZF_ISSET(slider, JNODE_DIRTY)) {
 				/*
 				   warning("edward-1024",
 				   "next slum item mergeable, "
 				   "but znode %p isn't dirty\n",
 				   lh.node);
 				 */
-				znode_make_dirty(lh.node);
+				znode_make_dirty(slider);
 			}
-			if (!znode_convertible(lh.node)) {
+			if (!znode_convertible(slider)) {
 				/*
 				   warning("edward-1272",
 				   "next slum item mergeable, "
 				   "but znode %p isn't convertible\n",
 				   lh.node);
 				 */
-				znode_set_convertible(lh.node);
+				znode_set_convertible(slider);
 			}
 			stop = 1;
-		} else
+		} else {
+			item_convert_data(pos)->d_next = DC_AFTER_CLUSTER;
 			stop = 1;
-		zrelse(lh.node);
-		done_lh(&right_lock);
-		copy_lh(&right_lock, &lh);
-		done_lh(&lh);
-		cur = right_lock.node;
+		}
+		zrelse(slider);
+		done_lh(&slider_lh);
+		move_lh(&slider_lh, &right_lh);
 	}
-	done_lh(&right_lock);
+	done_lh(&slider_lh);
+	done_lh(&right_lh);
 
-	if (ret == -E_NO_NEIGHBOR)
+	if (ret == -E_NO_NEIGHBOR) {
+		item_convert_data(pos)->d_next = DC_AFTER_CLUSTER;
 		ret = 0;
+	}
+	assert("edward-1610",
+	       ergo(ret != 0,
+		    item_convert_data(pos)->d_next == DC_INVALID_STATE));
 	return ret;
 }
 
-static int
-assign_convert_mode(struct convert_item_info * idata,
-		    cryptcompress_write_mode_t * mode)
+/*
+ * do some post-conversion actions;
+ * detach conversion data if there is nothing to convert anymore
+ */
+static void post_convert_ctail(flush_pos_t * pos,
+			       ctail_convert_mode_t mode, int old_nr_items)
 {
-	int result = 0;
-
-	assert("edward-1025", idata != NULL);
+	switch (mode) {
+	case CTAIL_CUT_ITEM:
+		assert("edward-1214", item_convert_data(pos)->flow.length == 0);
+		assert("edward-1215",
+		       coord_num_items(&pos->coord) == old_nr_items ||
+		       coord_num_items(&pos->coord) == old_nr_items - 1);
 
-	if (idata->flow.length) {
-		/* append or overwrite */
-		switch (idata->d_cur) {
-		case DC_FIRST_ITEM:
-		case DC_CHAINED_ITEM:
-			*mode = CRC_OVERWRITE_ITEM;
+		if (item_convert_data(pos)->d_next == DC_CHAINED_ITEM)
+			/*
+			 * the next item belongs to this cluster,
+			 * and should be also killed
+			 */
 			break;
-		case DC_AFTER_CLUSTER:
-			*mode = CRC_APPEND_ITEM;
+		if (coord_num_items(&pos->coord) != old_nr_items) {
+			/*
+			 * the latest item in the
+			 * cluster has been killed,
+			 */
+			detach_convert_idata(pos->sq);
+			if (!node_is_empty(pos->coord.node))
+				/*
+				 * make sure the next item will be scanned
+				 */
+				coord_init_before_item(&pos->coord);
 			break;
-		default:
-			impossible("edward-1018", "wrong current item state");
 		}
-	} else {
-		/* cut or invalidate */
-		switch (idata->d_cur) {
-		case DC_FIRST_ITEM:
-		case DC_CHAINED_ITEM:
-			*mode = CRC_CUT_ITEM;
-			break;
-		case DC_AFTER_CLUSTER:
-			result = 1;
-			break;
-		default:
-			impossible("edward-1019", "wrong current item state");
+	case CTAIL_APPEND_ITEM:
+		/*
+		 * in the append mode the whole flow has been inserted
+		 * (see COP_INSERT_FLOW primitive)
+		 */
+		assert("edward-434", item_convert_data(pos)->flow.length == 0);
+		detach_convert_idata(pos->sq);
+		break;
+	case CTAIL_OVERWRITE_ITEM:
+		if (coord_is_unprepped_ctail(&pos->coord)) {
+			/*
+			 * the first (unprepped) ctail has been overwritten;
+			 * convert it to the prepped one
+			 */
+			assert("edward-1259",
+			       cluster_shift_ok(item_convert_data(pos)->
+						cluster_shift));
+			put_unaligned((d8)item_convert_data(pos)->cluster_shift,
+				      &ctail_formatted_at(&pos->coord)->
+				      cluster_shift);
 		}
+		break;
+	default:
+		impossible("edward-1609", "Bad ctail conversion mode");
 	}
-	return result;
 }
 
-/* plugin->u.item.f.convert */
-/* write ctail in guessed mode */
-int convert_ctail(flush_pos_t * pos)
+static int assign_conversion_mode(flush_pos_t * pos, ctail_convert_mode_t *mode)
 {
-	int result;
-	int nr_items;
-	cryptcompress_write_mode_t mode = CRC_OVERWRITE_ITEM;
+	int ret = 0;
 
-	assert("edward-1020", pos != NULL);
-	assert("edward-1213", coord_num_items(&pos->coord) != 0);
-	assert("edward-1257", item_id_by_coord(&pos->coord) == CTAIL_ID);
-	assert("edward-1258", ctail_ok(&pos->coord));
-	assert("edward-261", pos->coord.node != NULL);
+	*mode = CTAIL_INVAL_CONVERT_MODE;
 
-	nr_items = coord_num_items(&pos->coord);
-	if (!chaining_data_present(pos)) {
+	if (!convert_data_attached(pos)) {
 		if (should_attach_convert_idata(pos)) {
-			/* attach convert item info */
 			struct inode *inode;
 
 			assert("edward-264", pos->child != NULL);
@@ -1520,89 +1541,177 @@ int convert_ctail(flush_pos_t * pos)
 			inode = jnode_page(pos->child)->mapping->host;
 
 			assert("edward-267", inode != NULL);
-
-			/* attach item convert info by child and put the last one */
-			result = attach_convert_idata(pos, inode);
+			/*
+			 * attach new convert item info
+			 */
+			ret = attach_convert_idata(pos, inode);
 			pos->child = NULL;
-			if (result == -E_REPEAT) {
-				/* jnode became clean, or there is no dirty
-				   pages (nothing to update in disk cluster) */
+			if (ret == -E_REPEAT) {
+				/*
+				 * jnode became clean, or there is no dirty
+				 * pages (nothing to update in disk cluster)
+				 */
 				warning("edward-1021",
 					"convert_ctail: nothing to attach");
-				return 0;
+				ret = 0;
+				goto dont_convert;
 			}
-			if (result != 0)
-				return result;
+			if (ret)
+				goto dont_convert;
+			/*
+			 * this is the first ctail in the cluster,
+			 * so it should be overwritten
+			 */
+			*mode = CTAIL_OVERWRITE_ITEM;
 		} else
-			/* unconvertible */
-			return 0;
+			/*
+			 * non-convertible item
+			 */
+			goto dont_convert;
 	} else {
-		/* use old convert info */
-
+		/*
+		 * use old convert info
+		 */
 		struct convert_item_info *idata;
-
 		idata = item_convert_data(pos);
 
-		result = assign_convert_mode(idata, &mode);
-		if (result) {
-			/* disk cluster is over,
-			   nothing to update anymore */
-			detach_convert_idata(pos->sq);
-			return 0;
+		switch (idata->d_cur) {
+		case DC_FIRST_ITEM:
+		case DC_CHAINED_ITEM:
+			if (idata->flow.length)
+				*mode = CTAIL_OVERWRITE_ITEM;
+			else
+				*mode = CTAIL_CUT_ITEM;
+			break;
+		case DC_AFTER_CLUSTER:
+			if (idata->flow.length)
+				*mode = CTAIL_APPEND_ITEM;
+			else {
+				/*
+				 * nothing to update anymore
+				 */
+				detach_convert_idata(pos->sq);
+				goto dont_convert;
+			}
+			break;
+		default:
+			impossible("edward-1018",
+				   "wrong current item state");
+			ret = RETERR(-EIO);
+			goto dont_convert;
 		}
 	}
-
-	assert("edward-433", chaining_data_present(pos));
+	/*
+	 * ok, ctail will be converted
+	 */
+	assert("edward-433", convert_data_attached(pos));
 	assert("edward-1022",
 	       pos->coord.item_pos < coord_num_items(&pos->coord));
+	return 0;
+ dont_convert:
+	return ret;
+}
+
+/*
+ * perform an operation on the ctail item in
+ * accordance with assigned conversion @mode
+ */
+static int do_convert_ctail(flush_pos_t * pos, ctail_convert_mode_t mode)
+{
+	int result = 0;
+	struct convert_item_info * info;
+
+	assert("edward-468", pos != NULL);
+	assert("edward-469", pos->sq != NULL);
+	assert("edward-845", item_convert_data(pos) != NULL);
+
+	info = item_convert_data(pos);
+	assert("edward-679", info->flow.data != NULL);
 
-	/* check if next item is of current disk cluster */
-	result = next_item_dc_stat(pos);
-	if (result) {
-		detach_convert_idata(pos->sq);
-		return result;
-	}
-	result = do_convert_ctail(pos, mode);
-	if (result) {
-		detach_convert_idata(pos->sq);
-		return result;
-	}
 	switch (mode) {
-	case CRC_CUT_ITEM:
-		assert("edward-1214", item_convert_data(pos)->flow.length == 0);
-		assert("edward-1215",
-		       coord_num_items(&pos->coord) == nr_items ||
-		       coord_num_items(&pos->coord) == nr_items - 1);
-		if (item_convert_data(pos)->d_next == DC_CHAINED_ITEM)
-			break;
-		if (coord_num_items(&pos->coord) != nr_items) {
-			/* the item was killed, no more chained items */
-			detach_convert_idata(pos->sq);
-			if (!node_is_empty(pos->coord.node))
-				/* make sure the next item will be scanned */
-				coord_init_before_item(&pos->coord);
-			break;
-		}
-	case CRC_APPEND_ITEM:
-		assert("edward-434", item_convert_data(pos)->flow.length == 0);
-		detach_convert_idata(pos->sq);
+	case CTAIL_APPEND_ITEM:
+		assert("edward-1229", info->flow.length != 0);
+		assert("edward-1256",
+		       cluster_shift_ok(cluster_shift_by_coord(&pos->coord)));
+		/*
+		 * insert flow without balancing
+		 * (see comments to convert_node())
+		 */
+		result = insert_cryptcompress_flow_in_place(&pos->coord,
+							   &pos->lock,
+							   &info->flow,
+							   info->cluster_shift);
 		break;
-	case CRC_OVERWRITE_ITEM:
-		if (coord_is_unprepped_ctail(&pos->coord)) {
-			/* convert unpprepped ctail to prepped one */
-			assert("edward-1259",
-			       cluster_shift_ok(item_convert_data(pos)->
-						cluster_shift));
-			put_unaligned((d8)item_convert_data(pos)->cluster_shift,
-				      &ctail_formatted_at(&pos->coord)->
-				      cluster_shift);
-		}
+	case CTAIL_OVERWRITE_ITEM:
+		assert("edward-1230", info->flow.length != 0);
+		overwrite_ctail(&pos->coord, &info->flow);
+		if (info->flow.length != 0)
+			break;
+		else
+			/*
+			 * fall through:
+			 * cut the rest of item (if any)
+			 */
+			;
+	case CTAIL_CUT_ITEM:
+		assert("edward-1231", info->flow.length == 0);
+		result = cut_ctail(&pos->coord);
 		break;
+	default:
+		result = RETERR(-EIO);
+		impossible("edward-244", "bad ctail conversion mode");
 	}
 	return result;
 }
 
-/* Make Linus happy.
+/*
+ * plugin->u.item.f.convert
+ *
+ * Convert ctail items at flush time
+ */
+int convert_ctail(flush_pos_t * pos)
+{
+	int ret;
+	int old_nr_items;
+	ctail_convert_mode_t mode;
+
+	assert("edward-1020", pos != NULL);
+	assert("edward-1213", coord_num_items(&pos->coord) != 0);
+	assert("edward-1257", item_id_by_coord(&pos->coord) == CTAIL_ID);
+	assert("edward-1258", ctail_ok(&pos->coord));
+	assert("edward-261", pos->coord.node != NULL);
+
+	old_nr_items = coord_num_items(&pos->coord);
+	/*
+	 * detach old conversion data and
+	 * attach a new one, if needed
+	 */
+	ret = assign_conversion_mode(pos, &mode);
+	if (ret || mode == CTAIL_INVAL_CONVERT_MODE) {
+		assert("edward-1633", !convert_data_attached(pos));
+		return ret;
+	}
+	/*
+	 * find out the status of the right neighbor
+	 */
+	ret = pre_convert_ctail(pos);
+	if (ret) {
+		detach_convert_idata(pos->sq);
+		return ret;
+	}
+	ret = do_convert_ctail(pos, mode);
+	if (ret) {
+		detach_convert_idata(pos->sq);
+		return ret;
+	}
+	/*
+	 * detach old conversion data if needed
+	 */
+	post_convert_ctail(pos, mode, old_nr_items);
+	return 0;
+}
+
+/*
    Local variables:
    c-indentation-style: "K&R"
    mode-name: "LC"

--------------010905000105040701010102--
