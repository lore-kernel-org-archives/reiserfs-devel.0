From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH 1/2] reiser4: Auto-punching holes: basic stuff
Date: Sun, 19 Jul 2015 23:29:57 +0800
Message-ID: <55ABC275.6040103@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000102030608060008080603"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=xO3nhksSI5MeGIEuY/eCSpbVChpZHJtVR9MVRn9M5MA=;
        b=0IlCqBJkSuFcD3SaPnBlFiJGQx9T8AZpRenZOtYSa/5wZNg81wNMUbDhEmHZjzTUrU
         wdUmdMqiaa3psKTj+J+sPvlLuusx+ob1rH1XG9GtDLYEczmW4BAFN2tjZ+xKW9nLJFma
         yaGFPIcEOovTpnbl6WRAENVOm6uJDTLQK42PDdGPabq98LA4ZApVqgBsZWVOL6GqiZS+
         eaZwbIfJQRkj6QzaUS28p1Xc+IDsg0PzkP0vRXo8ome7jRN8MH5deaTf7YfR/j/AMQt4
         yaeGCHJ4kRnf7KW0/5KRKbuuJvsAHt70JI5233u7w/dKjrzQ7Lb4pFLwNT8DLVloPjEn
         EmLQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------000102030608060008080603
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

. Auto-punching holes: basic stuff;
. Handle empty nodes appeared after node conversions at flush time,
   Cache a locked right neighbor in the struct flush_pos (to access
   it when current node becomes empty, and hence is removed from the
   tree).

--------------000102030608060008080603
Content-Type: text/x-patch;
 name="reiser4-punch-holes.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-punch-holes.patch"

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

---
 fs/reiser4/flush.c                     |  107 ++++++++++++++++++++++++---------
 fs/reiser4/flush.h                     |    4 -
 fs/reiser4/init_super.c                |    2 
 fs/reiser4/plugin/file/cryptcompress.c |   32 +++++++++
 fs/reiser4/plugin/file/cryptcompress.h |    1 
 fs/reiser4/plugin/item/ctail.c         |   75 +++++++++++++++++------
 fs/reiser4/super.h                     |    4 -
 7 files changed, 175 insertions(+), 50 deletions(-)

--- a/fs/reiser4/plugin/file/cryptcompress.c
+++ b/fs/reiser4/plugin/file/cryptcompress.c
@@ -921,12 +921,34 @@ static unsigned deflate_overrun(struct i
 	return coa_overrun(inode_compression_plugin(inode), ilen);
 }
 
+static bool is_all_zero(char const* mem, size_t size)
+{
+	while (size-- > 0)
+		if (*mem++)
+			return false;
+	return true;
+}
+
+static inline bool should_punch_hole(struct tfm_cluster *tc)
+{
+	if (!reiser4_is_set(reiser4_get_current_sb(), REISER4_DONT_PUNCH_HOLES)
+	    && is_all_zero(tfm_stream_data(tc, INPUT_STREAM), tc->lsize)) {
+		/*
+		 * the logical cluster is filled with zeros,
+		 * so we'll punch a hole
+		 */
+		tc->all_zero = 1;
+		return true;
+	}
+	return false;
+}
+
 /* Estimating compressibility of a logical cluster by various
    policies represented by compression mode plugin.
    If this returns false, then compressor won't be called for
    the cluster of index @index.
 */
-static int should_compress(struct tfm_cluster * tc, cloff_t index,
+static int should_compress(struct tfm_cluster *tc, cloff_t index,
 			   struct inode *inode)
 {
 	compression_plugin *cplug = inode_compression_plugin(inode);
@@ -936,6 +958,12 @@ static int should_compress(struct tfm_cl
 	assert("edward-1322", cplug != NULL);
 	assert("edward-1323", mplug != NULL);
 
+	if (should_punch_hole(tc))
+		/*
+		 * we are about to punch a hole,
+		 * so don't compress data
+		 */
+		return 0;
 	return /* estimate by size */
 		(cplug->min_size_deflate ?
 		 tc->len >= cplug->min_size_deflate() :
@@ -3368,7 +3396,7 @@ static int prune_cryptcompress(struct in
 	       clust.dstat == UNPR_DISK_CLUSTER);
 
 	assert("edward-1191", inode->i_size == new_size);
-	assert("edward-1206", body_truncate_ok(inode, ridx));
+
  truncate_fake:
 	/* drop all the pages that don't have jnodes (i.e. pages
 	   which can not be truncated by cut_file_items() because
--- a/fs/reiser4/plugin/file/cryptcompress.h
+++ b/fs/reiser4/plugin/file/cryptcompress.h
@@ -159,6 +159,7 @@ struct tfm_cluster {
 	int uptodate;
 	int lsize;        /* number of bytes in logical cluster */
 	int len;          /* length of the transform stream */
+	int all_zero;     /* logical cluster is filled with zeros */
 };
 
 static inline coa_t get_coa(struct tfm_cluster * tc, reiser4_compression_id id,
--- a/fs/reiser4/plugin/item/ctail.c
+++ b/fs/reiser4/plugin/item/ctail.c
@@ -1177,6 +1177,8 @@ static int alloc_item_convert_data(struc
 	sq->itm = kmalloc(sizeof(*sq->itm), reiser4_ctx_gfp_mask_get());
 	if (sq->itm == NULL)
 		return RETERR(-ENOMEM);
+	init_lh(&sq->right_lock);
+	sq->right_locked = 0;
 	return 0;
 }
 
@@ -1186,22 +1188,28 @@ static void free_item_convert_data(struc
 	assert("edward-819", sq->itm != NULL);
 	assert("edward-820", sq->iplug != NULL);
 
+	done_lh(&sq->right_lock);
+	sq->right_locked = 0;
 	kfree(sq->itm);
 	sq->itm = NULL;
 	return;
 }
 
-static int alloc_convert_data(flush_pos_t * pos)
+static struct convert_info *alloc_convert_data(void)
 {
-	assert("edward-821", pos != NULL);
-	assert("edward-822", pos->sq == NULL);
+	struct convert_info *info;
 
-	pos->sq = kmalloc(sizeof(*pos->sq), reiser4_ctx_gfp_mask_get());
-	if (!pos->sq)
-		return RETERR(-ENOMEM);
-	memset(pos->sq, 0, sizeof(*pos->sq));
-	cluster_init_write(&pos->sq->clust, NULL);
-	return 0;
+	info = kmalloc(sizeof(*info), reiser4_ctx_gfp_mask_get());
+	if (info != NULL) {
+		memset(info, 0, sizeof(*info));
+		cluster_init_write(&info->clust, NULL);
+	}
+	return info;
+}
+
+static void reset_convert_data(struct convert_info *info)
+{
+	info->clust.tc.all_zero = 0;
 }
 
 void free_convert_data(flush_pos_t * pos)
@@ -1230,7 +1238,6 @@ static int init_item_convert_data(flush_
 	assert("edward-828", inode != NULL);
 
 	sq = pos->sq;
-
 	memset(sq->itm, 0, sizeof(*sq->itm));
 
 	/* iplug->init_convert_data() */
@@ -1258,10 +1265,13 @@ static int attach_convert_idata(flush_po
 	       item_plugin_by_id(CTAIL_ID));
 
 	if (!pos->sq) {
-		ret = alloc_convert_data(pos);
-		if (ret)
-			return ret;
+		pos->sq = alloc_convert_data();
+		if (!pos->sq)
+			return RETERR(-ENOMEM);
 	}
+	else
+		reset_convert_data(pos->sq);
+
 	clust = &pos->sq->clust;
 	ret = grab_coa(&clust->tc, cplug);
 	if (ret)
@@ -1300,6 +1310,9 @@ static int attach_convert_idata(flush_po
 			     clust->tc.len,
 			     clust_to_off(clust->index, inode),
 			     WRITE_OP, &info->flow);
+	if (clust->tc.all_zero)
+		info->flow.length = 0;
+
 	jput(pos->child);
 	return 0;
       err:
@@ -1420,6 +1433,7 @@ static int pre_convert_ctail(flush_pos_t
 		coord_init_before_first_item(&coord, slider);
 
 		if (node_is_empty(slider)) {
+			warning("edward-1641", "Found empty right neighbor");
 			znode_make_dirty(slider);
 			znode_set_convertible(slider);
 			/*
@@ -1450,14 +1464,25 @@ static int pre_convert_ctail(flush_pos_t
 				znode_set_convertible(slider);
 			}
 			stop = 1;
+			convert_data(pos)->right_locked = 1;
 		} else {
 			item_convert_data(pos)->d_next = DC_AFTER_CLUSTER;
 			stop = 1;
+			convert_data(pos)->right_locked = 1;
 		}
 		zrelse(slider);
 		done_lh(&slider_lh);
 		move_lh(&slider_lh, &right_lh);
 	}
+	if (convert_data(pos)->right_locked)
+		/*
+		 * Store locked right neighbor in
+		 * the conversion info. Otherwise,
+		 * we won't be able to access it,
+		 * if the current node gets deleted
+		 * during conversion
+		 */
+		move_lh(&convert_data(pos)->right_lock, &slider_lh);
 	done_lh(&slider_lh);
 	done_lh(&right_lh);
 
@@ -1566,11 +1591,25 @@ static int assign_conversion_mode(flush_
 			}
 			if (ret)
 				goto dont_convert;
-			/*
-			 * this is the first ctail in the cluster,
-			 * so it should be overwritten
-			 */
-			*mode = CTAIL_OVERWRITE_ITEM;
+
+			if (pos->sq->clust.tc.all_zero) {
+				assert("edward-1634",
+				      item_convert_data(pos)->flow.length == 0);
+				/*
+				 * new content is filled with zeros -
+				 * we punch a hole using cut (not kill)
+				 * primitive, so attached pages won't
+				 * be truncated
+				 */
+				*mode = CTAIL_CUT_ITEM;
+			}
+			else
+				/*
+				 * this is the first ctail in the cluster,
+				 * so it (may be only its head) should be
+				 * overwritten
+				 */
+				*mode = CTAIL_OVERWRITE_ITEM;
 		} else
 			/*
 			 * non-convertible item
--- a/fs/reiser4/flush.h
+++ b/fs/reiser4/flush.h
@@ -74,6 +74,8 @@ struct convert_info {
 	item_plugin *iplug;	/* current item plugin */
 	struct convert_item_info *itm;	/* current item info */
 	struct cluster_handle clust;	/* transform cluster */
+	lock_handle right_lock; /* lock handle of the right neighbor */
+	int right_locked;
 };
 
 typedef enum flush_position_state {
@@ -231,7 +233,7 @@ static inline int should_terminate_squal
 	    item_convert_count(pos) >= SQUALLOC_THRESHOLD;
 }
 
-#if 1
+#if REISER4_DEBUG
 #define check_convert_info(pos)						\
 do {							        	\
 	if (unlikely(should_convert_right_neighbor(pos))) {		\
--- a/fs/reiser4/flush.c
+++ b/fs/reiser4/flush.c
@@ -1915,8 +1915,12 @@ out:
 }
 
 /*
- * Process nodes on leaf level until unformatted node or
- * rightmost node in the slum reached
+ * Process nodes on the leaf level until unformatted node or
+ * rightmost node in the slum reached.
+ *
+ * This function is a complicated beast, because it calls a
+ * static machine ->convert_node() for every node, which, in
+ * turn, scans node's items and does something for each of them.
  */
 static int handle_pos_on_formatted(flush_pos_t *pos)
 {
@@ -1933,19 +1937,39 @@ static int handle_pos_on_formatted(flush
 			return ret;
 	}
 	while (1) {
-		int expected;
-		expected = should_convert_right_neighbor(pos);
-		ret = neighbor_in_slum(pos->lock.node, &right_lock, RIGHT_SIDE,
-				       ZNODE_WRITE_LOCK, !expected, expected);
-		if (ret) {
-			if (expected)
-				warning("edward-1495",
-		        "Right neighbor is expected but not found (%d). Fsck?",
-					ret);
-			break;
+		assert("edward-1635",
+		       ergo(node_is_empty(pos->lock.node),
+			    ZF_ISSET(pos->lock.node, JNODE_HEARD_BANSHEE)));
+		/*
+		 * First of all, grab a right neighbor
+		 */
+		if (convert_data(pos) && convert_data(pos)->right_locked) {
+			/*
+			 * the right neighbor was locked by convert_node()
+			 * transfer the lock from the "cache".
+ 			 */
+			move_lh(&right_lock, &convert_data(pos)->right_lock);
+			done_lh(&convert_data(pos)->right_lock);
+			convert_data(pos)->right_locked = 0;
+		}
+		else {
+			ret = neighbor_in_slum(pos->lock.node, &right_lock,
+					       RIGHT_SIDE, ZNODE_WRITE_LOCK,
+					       1, 0);
+			if (ret) {
+				/*
+				 * There is no right neighbor for some reasons,
+				 * so finish with this level.
+				 */
+				assert("edward-1636",
+				       !should_convert_right_neighbor(pos));
+				break;
+			}
 		}
 		/*
-		 * we don't prep(allocate) nodes for flushing twice. This can be
+		 * Check "flushprepped" status of the right neighbor.
+		 *
+		 * We don't prep(allocate) nodes for flushing twice. This can be
 		 * suboptimal, or it can be optimal. For now we choose to live
 		 * with the risk that it will be suboptimal because it would be
 		 * quite complex to code it to be smarter.
@@ -1957,38 +1981,65 @@ static int handle_pos_on_formatted(flush
 			pos_stop(pos);
 			break;
 		}
-
 		ret = incr_load_count_znode(&right_load, right_lock.node);
 		if (ret)
 			break;
 		if (znode_convertible(right_lock.node)) {
+			assert("edward-xxxx",
+			       ergo(convert_data(pos),
+				    convert_data(pos)->right_locked == 0));
+
 			ret = convert_node(pos, right_lock.node);
 			if (ret)
 				break;
-			if (unlikely(node_is_empty(right_lock.node))) {
-				/*
-				 * node became empty after convertion,
-				 * skip this
-				 */
-				done_load_count(&right_load);
-				done_lh(&right_lock);
-				continue;
-			}
+		}
+		else
+			assert("edward-1637",
+			       !should_convert_right_neighbor(pos));
+
+		if (node_is_empty(pos->lock.node)) {
+			/*
+			 * Current node became empty after conversion
+			 * and, hence, was removed from the tree;
+			 * Advance the current position to the right neighbor.
+			 */
+			assert("edward-1638",
+			       ZF_ISSET(pos->lock.node, JNODE_HEARD_BANSHEE));
+			move_flush_pos(pos, &right_lock, &right_load, NULL);
+			continue;
+		}
+		if (node_is_empty(right_lock.node)) {
+			assert("edward-1639",
+			       ZF_ISSET(right_lock.node, JNODE_HEARD_BANSHEE));
+			/*
+			 * The right neighbor became empty after
+			 * convertion, and hence it was deleted
+			 * from the tree - skip this.
+			 * Since current node is not empty,
+			 * we'll obtain a correct pointer to
+			 * the next right neighbor
+			 */
+			done_load_count(&right_load);
+			done_lh(&right_lock);
+			continue;
 		}
 		/*
-		 * Current node and its right neighbor are converted.
+		 * At this point both, current node and its right
+		 * neigbor are converted and not empty.
 		 * Squeeze them _before_ going upward.
 		 */
 		ret = squeeze_right_neighbor(pos, pos->lock.node,
 					     right_lock.node);
 		if (ret < 0)
 			break;
-
 		if (node_is_empty(right_lock.node)) {
+			assert("edward-1640",
+			       ZF_ISSET(right_lock.node, JNODE_HEARD_BANSHEE));
 			/*
-                         * right node was squeezed completely,
-                         * skip this
-                         */
+                         * right neighbor was squeezed completely,
+                         * and hence has been deleted from the tree.
+			 * Skip this.
+			 */
                         done_load_count(&right_load);
                         done_lh(&right_lock);
                         continue;
--- a/fs/reiser4/init_super.c
+++ b/fs/reiser4/init_super.c
@@ -496,6 +496,8 @@ int reiser4_init_super_data(struct super
 	PUSH_BIT_OPT("no_write_barrier", REISER4_NO_WRITE_BARRIER);
 	/* enable issuing of discard requests */
 	PUSH_BIT_OPT("discard", REISER4_DISCARD);
+	/* disable hole punching at flush time */
+	PUSH_BIT_OPT("dont_punch_holes", REISER4_DONT_PUNCH_HOLES);
 
 	PUSH_OPT(p, opts,
 	{
--- a/fs/reiser4/super.h
+++ b/fs/reiser4/super.h
@@ -53,7 +53,9 @@ typedef enum {
 	/* don't use write barriers in the log writer code. */
 	REISER4_NO_WRITE_BARRIER = 7,
 	/* enable issuing of discard requests */
-	REISER4_DISCARD = 8
+	REISER4_DISCARD = 8,
+	/* disable hole punching at flush time */
+	REISER4_DONT_PUNCH_HOLES = 9
 } reiser4_fs_flag;
 
 /*

--------------000102030608060008080603--
