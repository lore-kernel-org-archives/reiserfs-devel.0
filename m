From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for Linux-4.1
Date: Fri, 04 Sep 2015 09:18:14 +0200
Message-ID: <55E945B6.9050709@gmail.com>
References: <55C49E4A.5000803@gmail.com> <1441325851.12422.5.camel@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090407030800080305070008"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type;
        bh=2OaevHeAyQILrLpadWMNGc4qav9zZySAuF0dXTwBoKU=;
        b=FiugEX1YzRHVTA+yw2Nu7mC1VjpqqgPO/JofJqyGMgfWF+/cVL6fRNd+Weu54SpIKJ
         9akxQQdIcBtd32pmDHxPnxqCLQLiYNiJ8x4+R5Onz2H/rhJdv2ytYBPQtjYj/2t38Fa/
         QKxavFOLDCvAEHw3wPJzNQ8hJrKwpdz8/riu/vx1S18JYwwONsu2tXU/xM9n4A1YjlaC
         DY3ie9D14KKHLO9JxzuVarrCgTvq6wLnXx/9C1xxKkKVClspYNEoGcnTEwkDRBe4Gji8
         P8yg027rryHS0u2NJytU666I7S/b+wZWyxzcCT/d/5cCZeRgJmQtsgyxm0f4IE3K248T
         rlbw==
In-Reply-To: <1441325851.12422.5.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Ivan Shapovalov <intelfx100@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------090407030800080305070008
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/04/2015 02:17 AM, Ivan Shapovalov wrote:
> On 2015-08-07 at 14:02 +0200, Edward Shishkin wrote:
>> Changes since Reiser4 for Linux-4.0.4:
>>
>> Fixed a problem appearing when running under "no space left on
>> device". It also could be the reason of sporadic silent non
>> -reproducible
>> data corruptions, that were reported periodically.
>>
>> The fixup was backported to Linux-4.0 (see reiser4-for-4.0.9).
>> If you need a backport for older kernel, then let me know.
>>
>> Please, find at
>> http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-4.x/
> Hi Edward,
>
> could you please send the fixup in a separate patch/mail (git-format)?
>
> /* btw, I did not forget about finishing discard support etc. I've
> found myself to be slightly overwhelmed with various things since a
> month ago, so it's just no time currently. */
>
> Thanks,

Hello Ivan,

Attached.

--------------090407030800080305070008
Content-Type: text/plain; charset=UTF-8;
 name="series"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="series"

cmVpc2VyNC1maXh1cHMtZm9yLTQuMS5wYXRjaApyZWlzZXI0LWFkZC1ub2RlNDEtc3VwcG9y
dC5wYXRjaApyZWlzZXI0LW1ldGFkYXRhLWNoZWNrc3Vtcy5wYXRjaApyZWlzZXI0LWZpeHVw
LXN0YXR1c193cml0ZS5wYXRjaApyZWlzZXI0LXJlbGVhc2UtNC4wLjEucGF0Y2gKcmVpc2Vy
NC1jaGFuZ2UtZGVmYXVsdC1iZWhhdmlvci1vbi1lcnJvci5wYXRjaAo=
--------------090407030800080305070008
Content-Type: text/x-patch;
 name="reiser4-fixups-for-4.1.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-fixups-for-4.1.patch"

---
 fs/reiser4/flush.c                     |  107 ++++++--
 fs/reiser4/flush.h                     |    4 
 fs/reiser4/init_super.c                |    2 
 fs/reiser4/jnode.h                     |    2 
 fs/reiser4/plugin/file/cryptcompress.c |  426 +++++++++++----------------------
 fs/reiser4/plugin/file/cryptcompress.h |    6 
 fs/reiser4/plugin/item/ctail.c         |   75 ++++-
 fs/reiser4/super.h                     |    4 
 8 files changed, 296 insertions(+), 330 deletions(-)

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
+			assert("edward-1643",
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
--- a/fs/reiser4/jnode.h
+++ b/fs/reiser4/jnode.h
@@ -245,7 +245,7 @@ typedef enum {
 	/* write is in progress */
 	JNODE_WRITEBACK = 18,
 
-	/* FIXME: now it is used by crypto-compress plugin only */
+	/* unused flag */
 	JNODE_NEW = 19,
 
 	/* delimiting keys are already set for this znode. */
--- a/fs/reiser4/plugin/file/cryptcompress.c
+++ b/fs/reiser4/plugin/file/cryptcompress.c
@@ -921,12 +921,32 @@ static unsigned deflate_overrun(struct i
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
+	if (0 &&
+	    !reiser4_is_set(reiser4_get_current_sb(), REISER4_DONT_PUNCH_HOLES)
+	    && is_all_zero(tfm_stream_data(tc, INPUT_STREAM), tc->lsize)) {
+
+		tc->hole = 1;
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
@@ -936,6 +956,12 @@ static int should_compress(struct tfm_cl
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
@@ -1293,8 +1319,9 @@ static int get_new_nrpages(struct cluste
 {
 	switch (clust->op) {
 	case LC_APPOV:
+	case LC_EXPAND:
 		return clust->nr_pages;
-	case LC_TRUNC:
+	case LC_SHRINK:
 		assert("edward-1179", clust->win != NULL);
 		return size_in_pages(clust->win->off + clust->win->count);
 	default:
@@ -1493,17 +1520,6 @@ static int jnode_truncate_ok(struct inod
 	jput(node);
 	return 0;
 }
-
-static int find_fake_appended(struct inode *inode, cloff_t * index);
-
-static int body_truncate_ok(struct inode *inode, cloff_t aidx)
-{
-	int result;
-	cloff_t raidx;
-
-	result = find_fake_appended(inode, &raidx);
-	return !result && (aidx == raidx);
-}
 #endif
 
 /* guess next window stat */
@@ -1742,12 +1758,13 @@ static void checkin_file_size(struct clu
 
 	switch (clust->op) {
 	case LC_APPOV:
+	case LC_EXPAND:
 		if (new_size + win->count <= i_size_read(inode))
 			/* overwrite only */
 			return;
 		new_size += win->count;
 		break;
-	case LC_TRUNC:
+	case LC_SHRINK:
 		break;
 	default:
 		impossible("edward-1184", "bad page cluster option");
@@ -1838,7 +1855,9 @@ static int checkin_logical_cluster(struc
 
 	lock_cluster(node);
 	checkin_cluster_size(clust, inode);
-	/* this will unlock cluster */
+	/*
+	 * this will unlock the cluster
+	 */
 	result = checkin_page_cluster(clust, inode);
 	jput(node);
 	clust->node = NULL;
@@ -2041,8 +2060,9 @@ static int balance_dirty_page_cluster(st
 	return 0;
 }
 
-/* set zeroes to the page cluster, proceed it, and maybe, try to capture
-   its pages */
+/*
+ * Check in part of a hole within a logical cluster
+ */
 static int write_hole(struct inode *inode, struct cluster_handle * clust,
 		      loff_t file_off, loff_t to_file)
 {
@@ -2066,15 +2086,18 @@ static int write_hole(struct inode *inod
 	assert("edward-192", cluster_ok(clust, inode));
 
 	if (win->off == 0 && win->count == inode_cluster_size(inode)) {
-		/* This part of the hole will be represented by "fake"
-		 * logical cluster, i.e. which doesn't have appropriate
-		 * disk cluster until someone modify this logical cluster
-		 * and make it dirty.
-		 * So go forward here..
+		/*
+		 * This part of the hole occupies the whole logical
+		 * cluster, so it won't be represented by any items.
+		 * Nothing to submit.
 		 */
 		move_update_window(inode, clust, file_off, to_file);
 		return 0;
 	}
+	/*
+	 * This part of the hole starts not at logical cluster
+	 * boundary, so it has to be converted to zeros and written to disk
+	 */
 	cl_count = win->count;	/* number of zeroes to write */
 	cl_off = win->off;
 	pg_off = off_to_pgoff(win->off);
@@ -2097,7 +2120,7 @@ static int write_hole(struct inode *inod
 		cl_count -= to_pg;
 		pg_off = 0;
 	}
-	if (!win->delta) {
+	if (win->delta == 0) {
 		/* only zeroes in this window, try to capture
 		 */
 		result = checkin_logical_cluster(clust, inode);
@@ -2591,32 +2614,39 @@ static int prepare_logical_cluster(struc
 
 	result = reserve4cluster(inode, clust);
 	if (result)
-		goto err1;
+		goto out;
+
 	result = read_some_cluster_pages(inode, clust);
-	if (result) {
+
+	if (result ||
+	    /*
+	     * don't submit data modifications
+	     * when expanding or shrinking holes
+	     */
+	    (op == LC_SHRINK && clust->dstat == FAKE_DISK_CLUSTER) ||
+	    (op == LC_EXPAND && clust->dstat == FAKE_DISK_CLUSTER)){
 		free_reserved4cluster(inode,
 				      clust,
 				      estimate_update_cluster(inode) +
 				      estimate_insert_cluster(inode));
-		goto err1;
+		goto out;
 	}
 	assert("edward-1124", clust->dstat != INVAL_DISK_CLUSTER);
 
 	result = cryptcompress_make_unprepped_cluster(clust, inode);
 	if (result)
-		goto err2;
+		goto error;
 	if (win && win->stat == HOLE_WINDOW) {
 		result = write_hole(inode, clust, file_off, to_file);
 		if (result)
-			goto err2;
+			goto error;
 	}
 	return 0;
- err2:
+ error:
 	free_reserved4cluster(inode, clust,
 			      estimate_update_cluster(inode));
- err1:
+ out:
 	put_page_cluster(clust, inode, WRITE_OP);
-	assert("edward-1125", result == -ENOSPC);
 	return result;
 }
 
@@ -2972,87 +3002,6 @@ ssize_t read_cryptcompress(struct file *
 	return result;
 }
 
-/* Look for a disk cluster and keep lookup result in @found.
- * If @index > 0, then find disk cluster of the index (@index - 1);
- * If @index == 0, then find the rightmost disk cluster.
- * Keep incremented index of the found disk cluster in @found.
- * @found == 0 means that disk cluster was not found (in the last
- * case (@index == 0) it means that file doesn't have disk clusters).
- */
-static int lookup_disk_cluster(struct inode *inode, cloff_t * found,
-			       cloff_t index)
-{
-	int result;
-	reiser4_key key;
-	loff_t offset;
-	hint_t *hint;
-	lock_handle *lh;
-	lookup_bias bias;
-	coord_t *coord;
-	item_plugin *iplug;
-
-	assert("edward-1131", inode != NULL);
-	assert("edward-95", cryptcompress_inode_ok(inode));
-
-	hint = kmalloc(sizeof(*hint), reiser4_ctx_gfp_mask_get());
-	if (hint == NULL)
-		return RETERR(-ENOMEM);
-	hint_init_zero(hint);
-	lh = &hint->lh;
-
-	bias = (index ? FIND_EXACT : FIND_MAX_NOT_MORE_THAN);
-	offset =
-	    (index ? clust_to_off(index, inode) -
-	     1 : get_key_offset(reiser4_max_key()));
-
-	key_by_inode_cryptcompress(inode, offset, &key);
-
-	/* find the last item of this object */
-	result =
-	    find_cluster_item(hint, &key, ZNODE_READ_LOCK, NULL /* ra_info */,
-			      bias, 0);
-	if (cbk_errored(result)) {
-		done_lh(lh);
-		kfree(hint);
-		return result;
-	}
-	if (result == CBK_COORD_NOTFOUND) {
-		/* no real disk clusters */
-		done_lh(lh);
-		kfree(hint);
-		*found = 0;
-		return 0;
-	}
-	/* disk cluster is found */
-	coord = &hint->ext_coord.coord;
-	coord_clear_iplug(coord);
-	result = zload(coord->node);
-	if (unlikely(result)) {
-		done_lh(lh);
-		kfree(hint);
-		return result;
-	}
-	iplug = item_plugin_by_coord(coord);
-	assert("edward-277", iplug == item_plugin_by_id(CTAIL_ID));
-	assert("edward-1202", ctail_ok(coord));
-
-	item_key_by_coord(coord, &key);
-	*found = off_to_clust(get_key_offset(&key), inode) + 1;
-
-	assert("edward-1132", ergo(index, index == *found));
-
-	zrelse(coord->node);
-	done_lh(lh);
-	kfree(hint);
-	return 0;
-}
-
-static int find_fake_appended(struct inode *inode, cloff_t * index)
-{
-	return lookup_disk_cluster(inode, index,
-				   0 /* find last real one */ );
-}
-
 /* Set left coord when unit is not found after node_lookup()
    This takes into account that there can be holes in a sequence
    of disk clusters */
@@ -3187,13 +3136,8 @@ int cut_tree_worker_cryptcompress(tap_t
 	return result;
 }
 
-/* Append or expand hole in two steps:
- * 1) set zeroes to the rightmost page of the rightmost non-fake
- *    logical cluster;
- * 2) expand hole via fake logical clusters (just increase i_size)
- */
-static int cryptcompress_append_hole(struct inode *inode /* with old size */,
-				     loff_t new_size)
+static int expand_cryptcompress(struct inode *inode /* old size */,
+				loff_t new_size)
 {
 	int result = 0;
 	hint_t *hint;
@@ -3219,16 +3163,22 @@ static int cryptcompress_append_hole(str
 	cluster_init_read(&clust, &win);
 	clust.hint = hint;
 
+	if (off_to_cloff(inode->i_size, inode) == 0)
+		goto append_hole;
+	/*
+	 * It can happen that
+	 * a part of the hole will be converted
+	 * to zeros. If so, it should be submitted
+	 */
 	result = alloc_cluster_pgset(&clust, cluster_nrpages(inode));
 	if (result)
 		goto out;
-	if (off_to_cloff(inode->i_size, inode) == 0)
-		goto append_fake;
 	hole_size = new_size - inode->i_size;
-	nr_zeroes =
-		inode_cluster_size(inode) - off_to_cloff(inode->i_size, inode);
-	if (hole_size < nr_zeroes)
+	nr_zeroes = inode_cluster_size(inode) -
+		off_to_cloff(inode->i_size, inode);
+	if (nr_zeroes > hole_size)
 		nr_zeroes = hole_size;
+
 	set_window(&clust, &win, inode, inode->i_size,
 		   inode->i_size + nr_zeroes);
 	win.stat = HOLE_WINDOW;
@@ -3236,20 +3186,17 @@ static int cryptcompress_append_hole(str
 	assert("edward-1137",
 	       clust.index == off_to_clust(inode->i_size, inode));
 
-	result = prepare_logical_cluster(inode, 0, 0, &clust, LC_APPOV);
-
-	assert("edward-1271", !result || result == -ENOSPC);
+	result = prepare_logical_cluster(inode, 0, 0, &clust, LC_EXPAND);
 	if (result)
 		goto out;
 	assert("edward-1139",
 	       clust.dstat == PREP_DISK_CLUSTER ||
-	       clust.dstat == UNPR_DISK_CLUSTER);
+	       clust.dstat == UNPR_DISK_CLUSTER ||
+	       clust.dstat == FAKE_DISK_CLUSTER);
 
 	assert("edward-1431", hole_size >= nr_zeroes);
-	if (hole_size == nr_zeroes)
-	/* nothing to append anymore */
-		goto out;
- append_fake:
+
+ append_hole:
 	INODE_SET_SIZE(inode, new_size);
  out:
 	done_lh(lh);
@@ -3258,29 +3205,28 @@ static int cryptcompress_append_hole(str
 	return result;
 }
 
-static int update_cryptcompress_size(struct inode *inode, loff_t new_size,
-				     int update_sd)
+static int update_size_actor(struct inode *inode,
+			     loff_t new_size, int update_sd)
 {
-	return (new_size & ((loff_t) (inode_cluster_size(inode)) - 1)
-		? 0 : reiser4_update_file_size(inode, new_size, update_sd));
+	if (new_size & ((loff_t) (inode_cluster_size(inode)) - 1))
+		/*
+		 * cut not at logical cluster boundary,
+		 * size will be updated by write_hole()
+		 */
+		return 0;
+	else
+		return reiser4_update_file_size(inode, new_size, update_sd);
 }
 
-/* Prune cryptcompress file in two steps:
- * 1) cut all nominated logical clusters except the leftmost one which
- *    is to be partially truncated. Note, that there can be "holes"
- *    represented by fake logical clusters.
- * 2) set zeroes and capture leftmost partially truncated logical
- *    cluster, if it is not fake; otherwise prune fake logical cluster
- *    (just decrease i_size).
- */
-static int prune_cryptcompress(struct inode *inode, loff_t new_size,
-			       int update_sd, cloff_t aidx)
+static int prune_cryptcompress(struct inode *inode,
+			       loff_t new_size, int update_sd)
 {
 	int result = 0;
-	unsigned nr_zeroes;
+	unsigned nr_zeros;
 	loff_t to_prune;
 	loff_t old_size;
-	cloff_t ridx;
+	cloff_t from_idx;
+	cloff_t to_idx;
 
 	hint_t *hint;
 	lock_handle *lh;
@@ -3304,84 +3250,75 @@ static int prune_cryptcompress(struct in
 	cluster_init_read(&clust, &win);
 	clust.hint = hint;
 
-	/* calculate index of the rightmost logical cluster
-	   that will be completely truncated */
-	ridx = size_in_lc(new_size, inode);
+	/*
+	 * index of the leftmost logical cluster
+	 * that will be completely truncated
+	 */
+	from_idx = size_in_lc(new_size, inode);
+	to_idx = size_in_lc(inode->i_size, inode);
+	/*
+	 * truncate all complete disk clusters starting from @from_idx
+	 */
+	assert("edward-1174", from_idx <= to_idx);
 
-	/* truncate all disk clusters starting from @ridx */
-	assert("edward-1174", ridx <= aidx);
 	old_size = inode->i_size;
-	if (ridx != aidx) {
-		struct cryptcompress_info * info;
+	if (from_idx != to_idx) {
+		struct cryptcompress_info *info;
 		info = cryptcompress_inode_data(inode);
+
 		result = cut_file_items(inode,
-					clust_to_off(ridx, inode),
+					clust_to_off(from_idx, inode),
 					update_sd,
-					clust_to_off(aidx, inode),
-					update_cryptcompress_size);
+					clust_to_off(to_idx, inode),
+					update_size_actor);
 		info->trunc_index = ULONG_MAX;
-		if (result)
+		if (unlikely(result == CBK_COORD_NOTFOUND))
+			result = 0;
+		if (unlikely(result))
 			goto out;
 	}
-	/*
-	 * there can be pages of fake logical clusters, truncate them
-	 */
-	truncate_inode_pages(inode->i_mapping, clust_to_off(ridx, inode));
-	assert("edward-1524",
-	       pages_truncate_ok(inode, clust_to_pg(ridx, inode)));
-	/*
-	 * now perform partial truncate of last logical cluster
-	 */
-	if (!off_to_cloff(new_size, inode)) {
-		/* no partial truncate is needed */
-		assert("edward-1145", inode->i_size == new_size);
-		goto truncate_fake;
-	}
+	if (off_to_cloff(new_size, inode) == 0)
+		goto truncate_hole;
+
 	assert("edward-1146", new_size < inode->i_size);
 
 	to_prune = inode->i_size - new_size;
-
-	/* check if the last logical cluster is fake */
-	result = lookup_disk_cluster(inode, &aidx, ridx);
+	/*
+	 * Partial truncate of the last logical cluster.
+	 * Partial hole will be converted to zeros. The resulted
+	 * logical cluster will be captured and submitted to disk
+	 */
+	result = alloc_cluster_pgset(&clust, cluster_nrpages(inode));
 	if (result)
 		goto out;
-	if (!aidx)
-		/* yup, this is fake one */
-		goto truncate_fake;
 
-	assert("edward-1148", aidx == ridx);
+	nr_zeros = off_to_pgoff(new_size);
+	if (nr_zeros)
+		nr_zeros = PAGE_CACHE_SIZE - nr_zeros;
 
-	/* do partial truncate of the last page cluster,
-	   and try to capture this one */
-	result = alloc_cluster_pgset(&clust, cluster_nrpages(inode));
-	if (result)
-		goto out;
-	nr_zeroes = (off_to_pgoff(new_size) ?
-		     PAGE_CACHE_SIZE - off_to_pgoff(new_size) : 0);
-	set_window(&clust, &win, inode, new_size, new_size + nr_zeroes);
+	set_window(&clust, &win, inode, new_size, new_size + nr_zeros);
 	win.stat = HOLE_WINDOW;
 
-	assert("edward-1149", clust.index == ridx - 1);
+	assert("edward-1149", clust.index == from_idx - 1);
 
-	result = prepare_logical_cluster(inode, 0, 0, &clust, LC_TRUNC);
+	result = prepare_logical_cluster(inode, 0, 0, &clust, LC_SHRINK);
 	if (result)
 		goto out;
 	assert("edward-1151",
 	       clust.dstat == PREP_DISK_CLUSTER ||
-	       clust.dstat == UNPR_DISK_CLUSTER);
-
-	assert("edward-1191", inode->i_size == new_size);
-	assert("edward-1206", body_truncate_ok(inode, ridx));
- truncate_fake:
-	/* drop all the pages that don't have jnodes (i.e. pages
-	   which can not be truncated by cut_file_items() because
-	   of holes represented by fake disk clusters) including
-	   the pages of partially truncated cluster which was
-	   released by prepare_logical_cluster() */
+	       clust.dstat == UNPR_DISK_CLUSTER ||
+	       clust.dstat == FAKE_DISK_CLUSTER);
+ truncate_hole:
+	/*
+	 * drop all the pages that don't have jnodes (i.e. pages
+	 * which can not be truncated by cut_file_items() because
+	 * of holes represented by fake disk clusters) including
+	 * the pages of partially truncated cluster which was
+	 * released by prepare_logical_cluster()
+	 */
 	INODE_SET_SIZE(inode, new_size);
 	truncate_inode_pages(inode->i_mapping, new_size);
  out:
-	assert("edward-1334", !result || result == -ENOSPC);
 	assert("edward-1497",
 	       pages_truncate_ok(inode, size_in_pages(new_size)));
 
@@ -3391,79 +3328,6 @@ static int prune_cryptcompress(struct in
 	return result;
 }
 
-/* Prepare cryptcompress file for truncate:
- * prune or append rightmost fake logical clusters (if any)
- */
-static int start_truncate_fake(struct inode *inode, cloff_t aidx,
-			       loff_t new_size, int update_sd)
-{
-	int result = 0;
-	int bytes;
-
-	if (new_size > inode->i_size) {
-		/* append */
-		if (inode->i_size < clust_to_off(aidx, inode))
-			/* no fake bytes */
-			return 0;
-		bytes = new_size - inode->i_size;
-		INODE_SET_SIZE(inode, inode->i_size + bytes);
-	} else {
-		/* prune */
-		if (inode->i_size <= clust_to_off(aidx, inode))
-			/* no fake bytes */
-			return 0;
-		bytes = inode->i_size -
-			max(new_size, clust_to_off(aidx, inode));
-		if (!bytes)
-			return 0;
-		INODE_SET_SIZE(inode, inode->i_size - bytes);
-		/* In the case of fake prune we need to drop page cluster.
-		   There are only 2 cases for partially truncated page:
-		   1. If is is dirty, therefore it is anonymous
-		   (was dirtied via mmap), and will be captured
-		   later via ->capture().
-		   2. If is clean, therefore it is filled by zeroes.
-		   In both cases we don't need to make it dirty and
-		   capture here.
-		 */
-		truncate_inode_pages(inode->i_mapping, inode->i_size);
-	}
-	if (update_sd)
-		result = update_sd_cryptcompress(inode);
-	return result;
-}
-
-/**
- * This is called in setattr_cryptcompress when it is used to truncate,
- * and in delete_object_cryptcompress
- */
-static int cryptcompress_truncate(struct inode *inode,	/* old size */
-				  loff_t new_size,	/* new size */
-				  int update_sd)
-{
-	int result;
-	cloff_t aidx;
-
-	result = find_fake_appended(inode, &aidx);
-	if (result)
-		return result;
-	assert("edward-1208",
-	       ergo(aidx > 0, inode->i_size > clust_to_off(aidx - 1, inode)));
-
-	result = start_truncate_fake(inode, aidx, new_size, update_sd);
-	if (result)
-		return result;
-	if (inode->i_size == new_size)
-		/* nothing to truncate anymore */
-		return 0;
-	result = (inode->i_size < new_size ?
-		  cryptcompress_append_hole(inode, new_size) :
-		  prune_cryptcompress(inode, new_size, update_sd, aidx));
-	if (!result && update_sd)
-		result = update_sd_cryptcompress(inode);
-	return result;
-}
-
 /**
  * Capture a pager cluster.
  * @clust must be set up by a caller.
@@ -3549,7 +3413,7 @@ static int capture_anon_pages(struct add
 	hint_init_zero(hint);
 	lh = &hint->lh;
 
-	cluster_init_read(&clust, NULL);
+	cluster_init_read(&clust, NULL /* no sliding window */);
 	clust.hint = hint;
 
 	result = alloc_cluster_pgset(&clust, cluster_nrpages(inode));
@@ -3724,7 +3588,7 @@ int delete_object_cryptcompress(struct i
 	info = cryptcompress_inode_data(inode);
 
 	mutex_lock(&info->checkin_mutex);
-	result = cryptcompress_truncate(inode, 0, 0);
+	result = prune_cryptcompress(inode, 0, 0);
 	mutex_unlock(&info->checkin_mutex);
 
 	if (result) {
@@ -3770,9 +3634,13 @@ int setattr_cryptcompress(struct dentry
 			inode_check_scale(inode, old_size, attr->ia_size);
 
 			mutex_lock(&info->checkin_mutex);
-			result = cryptcompress_truncate(inode,
-							attr->ia_size,
-							1/* update sd */);
+			if (attr->ia_size > inode->i_size)
+				result = expand_cryptcompress(inode,
+							      attr->ia_size);
+			else
+				result = prune_cryptcompress(inode,
+							     attr->ia_size,
+							     1/* update sd */);
 			mutex_unlock(&info->checkin_mutex);
 			if (result) {
 			     warning("edward-1192",
--- a/fs/reiser4/plugin/file/cryptcompress.h
+++ b/fs/reiser4/plugin/file/cryptcompress.h
@@ -144,8 +144,9 @@ typedef enum {
 
 typedef enum {
 	LC_INVAL  = 0,   /* invalid value */
-	LC_APPOV = 1,    /* append and/or overwrite */
-	LC_TRUNC = 2	 /* truncate */
+	LC_APPOV  = 1,   /* append and/or overwrite */
+	LC_EXPAND = 2,	 /* expanding truncate */
+	LC_SHRINK = 3    /* shrinking truncate */
 } logical_cluster_op;
 
 /* Transform cluster.
@@ -159,6 +160,7 @@ struct tfm_cluster {
 	int uptodate;
 	int lsize;        /* number of bytes in logical cluster */
 	int len;          /* length of the transform stream */
+	unsigned int hole:1;  /* should punch hole */
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
+	info->clust.tc.hole = 0;
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
+	if (clust->tc.hole)
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
+			if (pos->sq->clust.tc.hole) {
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

--------------090407030800080305070008
Content-Type: text/x-patch;
 name="reiser4-add-node41-support.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-add-node41-support.patch"

Support of node41 layout (the same as node40, but
with 32-bit field for checksum).

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

---
 fs/reiser4/Makefile                           |    1 
 fs/reiser4/jnode.c                            |   11 --
 fs/reiser4/plugin/disk_format/disk_format40.c |    7 +
 fs/reiser4/plugin/disk_format/disk_format40.h |    4 
 fs/reiser4/plugin/node/Makefile               |    3 
 fs/reiser4/plugin/node/node.c                 |   38 ++++++
 fs/reiser4/plugin/node/node.h                 |    6 -
 fs/reiser4/plugin/node/node40.c               |  142 +++++++++++++++++---------
 fs/reiser4/plugin/node/node40.h               |   23 ++--
 fs/reiser4/plugin/node/node41.c               |  111 ++++++++++++++++++++
 fs/reiser4/plugin/node/node41.h               |   48 ++++++++
 fs/reiser4/plugin/plugin.h                    |    2 
 fs/reiser4/reiser4.h                          |    1 
 13 files changed, 329 insertions(+), 68 deletions(-)

--- a/fs/reiser4/Makefile
+++ b/fs/reiser4/Makefile
@@ -69,6 +69,7 @@ reiser4-y := \
 		   plugin/dir/hashed_dir.o \
 		   plugin/dir/seekable_dir.o \
 		   plugin/node/node40.o \
+		   plugin/node/node41.o \
            \
 		   plugin/crypto/cipher.o \
 		   plugin/crypto/digest.o \
--- a/fs/reiser4/plugin/node/Makefile
+++ b/fs/reiser4/plugin/node/Makefile
@@ -2,4 +2,5 @@ obj-$(CONFIG_REISER4_FS) += node_plugins
 
 node_plugins-objs :=	\
 	node.o		\
-	node40.o
+	node40.o	\
+	node41.o
--- a/fs/reiser4/plugin/node/node.c
+++ b/fs/reiser4/plugin/node/node.c
@@ -116,6 +116,44 @@ node_plugin node_plugins[LAST_NODE_ID] =
 		.max_item_size = max_item_size_node40,
 		.prepare_removal = prepare_removal_node40,
 		.set_item_plugin = set_item_plugin_node40
+	},
+	[NODE41_ID] = {
+		.h = {
+			.type_id = REISER4_NODE_PLUGIN_TYPE,
+			.id = NODE41_ID,
+			.pops = NULL,
+			.label = "node41",
+			.desc = "node41 layout",
+			.linkage = {NULL, NULL}
+		},
+		.item_overhead = item_overhead_node40,
+		.free_space = free_space_node40,
+		.lookup = lookup_node40,
+		.num_of_items = num_of_items_node40,
+		.item_by_coord = item_by_coord_node40,
+		.length_by_coord = length_by_coord_node40,
+		.plugin_by_coord = plugin_by_coord_node40,
+		.key_at = key_at_node40,
+		.estimate = estimate_node40,
+		.check = NULL,
+		.parse = parse_node41,
+		.init = init_node41,
+#ifdef GUESS_EXISTS
+		.guess = guess_node41,
+#endif
+		.change_item_size = change_item_size_node40,
+		.create_item = create_item_node40,
+		.update_item_key = update_item_key_node40,
+		.cut_and_kill = kill_node40,
+		.cut = cut_node40,
+		.shift = shift_node41,
+		.shrink_item = shrink_item_node40,
+		.fast_insert = fast_insert_node40,
+		.fast_paste = fast_paste_node40,
+		.fast_cut = fast_cut_node40,
+		.max_item_size = max_item_size_node41,
+		.prepare_removal = prepare_removal_node40,
+		.set_item_plugin = set_item_plugin_node40
 	}
 };
 
--- a/fs/reiser4/plugin/node/node.h
+++ b/fs/reiser4/plugin/node/node.h
@@ -236,9 +236,9 @@ typedef struct node_plugin {
 } node_plugin;
 
 typedef enum {
-	/* standard unified node layout used for both leaf and internal
-	   nodes */
-	NODE40_ID,
+	NODE40_ID, /* standard unified node layout used for both,
+		      leaf and internal nodes */
+	NODE41_ID, /* unified node layout with a reference counter */
 	LAST_NODE_ID
 } reiser4_node_id;
 
--- a/fs/reiser4/plugin/node/node40.c
+++ b/fs/reiser4/plugin/node/node40.c
@@ -34,7 +34,7 @@
 */
 /* NIKITA-FIXME-HANS: I told you guys not less than 10 times to not call it r4fs.  Change to "ReIs". */
 /* magic number that is stored in ->magic field of node header */
-static const __u32 REISER4_NODE_MAGIC = 0x52344653;	/* (*(__u32 *)"R4FS"); */
+static const __u32 REISER4_NODE40_MAGIC = 0x52344653;	/* (*(__u32 *)"R4FS"); */
 
 static int prepare_for_update(znode * left, znode * right,
 			      carry_plugin_info * info);
@@ -656,9 +656,7 @@ int check_node40(const znode * node /* n
 	return 0;
 }
 
-/* plugin->u.node.parse
-   look for description of this method in plugin/node/node.h */
-int parse_node40(znode * node /* node to parse */ )
+int parse_node40_common(znode *node, const __u32 magic)
 {
 	node40_header *header;
 	int result;
@@ -670,10 +668,10 @@ int parse_node40(znode * node /* node to
 	if (unlikely(((__u8) znode_get_level(node)) != level))
 		warning("nikita-494", "Wrong level found in node: %i != %i",
 			znode_get_level(node), level);
-	else if (unlikely(nh40_get_magic(header) != REISER4_NODE_MAGIC))
+	else if (unlikely(nh40_get_magic(header) != magic))
 		warning("nikita-495",
 			"Wrong magic in tree node: want %x, got %x",
-			REISER4_NODE_MAGIC, nh40_get_magic(header));
+			magic, nh40_get_magic(header));
 	else {
 		node->nr_items = node40_num_of_items_internal(node);
 		result = 0;
@@ -681,45 +679,74 @@ int parse_node40(znode * node /* node to
 	return RETERR(result);
 }
 
-/* plugin->u.node.init
-   look for description of this method in plugin/node/node.h */
-int init_node40(znode * node /* node to initialise */ )
+/*
+ * plugin->u.node.parse
+ * look for description of this method in plugin/node/node.h
+ */
+int parse_node40(znode *node /* node to parse */)
 {
-	node40_header *header;
+	return parse_node40_common(node, REISER4_NODE40_MAGIC);
+}
+
+/*
+ * common part of ->init_node() for all nodes,
+ * which contain node40_header at the beginning
+ */
+int init_node40_common(znode *node, node_plugin *nplug,
+		       size_t node_header_size, const __u32 magic)
+{
+	node40_header *header40;
 
 	assert("nikita-570", node != NULL);
 	assert("nikita-572", zdata(node) != NULL);
 
-	header = node40_node_header(node);
-	memset(header, 0, sizeof(node40_header));
-	nh40_set_free_space(header, znode_size(node) - sizeof(node40_header));
-	nh40_set_free_space_start(header, sizeof(node40_header));
-	/* sane hypothesis: 0 in CPU format is 0 in disk format */
-	/* items: 0 */
-	save_plugin_id(node_plugin_to_plugin(node->nplug),
-		       &header->common_header.plugin_id);
-	nh40_set_level(header, znode_get_level(node));
-	nh40_set_magic(header, REISER4_NODE_MAGIC);
-	node->nr_items = 0;
-	nh40_set_mkfs_id(header, reiser4_mkfs_id(reiser4_get_current_sb()));
+	header40 = node40_node_header(node);
+	memset(header40, 0, sizeof(node40_header));
 
-	/* flags: 0 */
+	nh40_set_free_space(header40, znode_size(node) - node_header_size);
+	nh40_set_free_space_start(header40, node_header_size);
+	/*
+	 * sane hypothesis: 0 in CPU format is 0 in disk format
+	 */
+	save_plugin_id(node_plugin_to_plugin(nplug),
+		       &header40->common_header.plugin_id);
+	nh40_set_level(header40, znode_get_level(node));
+	nh40_set_magic(header40, magic);
+	nh40_set_mkfs_id(header40, reiser4_mkfs_id(reiser4_get_current_sb()));
+	/*
+	 * nr_items: 0
+	 * flags: 0
+	 */
 	return 0;
 }
 
+/*
+ * plugin->u.node.init
+ * look for description of this method in plugin/node/node.h
+ */
+int init_node40(znode *node /* node to initialise */)
+{
+	return init_node40_common(node, node_plugin_by_id(NODE40_ID),
+				  sizeof(node40_header), REISER4_NODE40_MAGIC);
+}
+
 #ifdef GUESS_EXISTS
-int guess_node40(const znode * node /* node to guess plugin of */ )
+int guess_node40_common(const znode *node, reiser4_node_id id,
+			const __u32 magic)
 {
-	node40_header *nethack;
+	node40_header *header;
 
 	assert("nikita-1058", node != NULL);
-	nethack = node40_node_header(node);
-	return
-	    (nh40_get_magic(nethack) == REISER4_NODE_MAGIC) &&
-	    (plugin_by_disk_id(znode_get_tree(node),
-			       REISER4_NODE_PLUGIN_TYPE,
-			       &nethack->common_header.plugin_id)->h.id ==
-	     NODE40_ID);
+	header = node40_node_header(node);
+	return (nh40_get_magic(header) == magic) &&
+		(id == plugin_by_disk_id(znode_get_tree(node),
+				       REISER4_NODE_PLUGIN_TYPE,
+				       &header->common_header.plugin_id)->h.id);
+}
+
+int guess_node40(const znode *node /* node to guess plugin of */)
+{
+	return guess_node40_common(node, NODE40_ID, REISER4_NODE40_MAGIC);
 }
 #endif
 
@@ -1867,7 +1894,7 @@ copy_units(coord_t * target, coord_t * s
 /* copy part of @shift->real_stop.node starting either from its beginning or
    from its end and ending at @shift->real_stop to either the end or the
    beginning of @shift->target */
-static void copy(struct shift_params *shift)
+static void copy(struct shift_params *shift, size_t node_header_size)
 {
 	node40_header *nh;
 	coord_t from;
@@ -1994,10 +2021,10 @@ static void copy(struct shift_params *sh
 		coord_set_item_pos(&to, 0);
 
 		/* prepare space for new items */
-		memmove(zdata(to.node) + sizeof(node40_header) +
+		memmove(zdata(to.node) + node_header_size +
 			shift->shift_bytes,
-			zdata(to.node) + sizeof(node40_header),
-			free_space_start - sizeof(node40_header));
+			zdata(to.node) + node_header_size,
+			free_space_start - node_header_size);
 		/* update item headers of moved items */
 		to_ih = node40_ih_at(to.node, 0);
 		/* first item gets @merging_bytes longer. free space appears
@@ -2061,11 +2088,11 @@ static void copy(struct shift_params *sh
 				ih40_set_offset(to_ih,
 						ih40_get_offset(from_ih) -
 						old_offset +
-						sizeof(node40_header) +
+						node_header_size +
 						shift->part_bytes);
 			/* copy item bodies */
 			coord_add_item_pos(&from, -(int)(shift->entire - 1));
-			memcpy(zdata(to.node) + sizeof(node40_header) +
+			memcpy(zdata(to.node) + node_header_size +
 			       shift->part_bytes, item_by_coord_node40(&from),
 			       shift->entire_bytes);
 			coord_dec_item_pos(&from);
@@ -2080,7 +2107,7 @@ static void copy(struct shift_params *sh
 
 			/* copy item header of partially copied item */
 			memcpy(to_ih, from_ih, sizeof(item_header40));
-			ih40_set_offset(to_ih, sizeof(node40_header));
+			ih40_set_offset(to_ih, node_header_size);
 			if (item_plugin_by_coord(&to)->b.init)
 				item_plugin_by_coord(&to)->b.init(&to, &from,
 								  NULL);
@@ -2846,11 +2873,19 @@ void shift_check(void *vp, const znode *
 
 #endif
 
-/* plugin->u.node.shift
-   look for description of this method in plugin/node/node.h */
-int shift_node40(coord_t * from, znode * to, shift_direction pend, int delete_child,	/* if @from->node becomes empty - it will be
-											   deleted from the tree if this is set to 1 */
-		 int including_stop_coord, carry_plugin_info * info)
+/*
+ * common part of ->shift() for all nodes,
+ * which contain node40_header at the beginning and
+ * the table of item headers at the end
+ */
+int shift_node40_common(coord_t *from, znode *to,
+			shift_direction pend,
+			int delete_child, /* if @from->node becomes empty,
+					   * it will be deleted from the
+					   * tree if this is set to 1 */
+			int including_stop_coord,
+			carry_plugin_info *info,
+			size_t node_header_size)
 {
 	struct shift_params shift;
 	int result;
@@ -2919,7 +2954,7 @@ int shift_node40(coord_t * from, znode *
 		return 0;
 	}
 
-	copy(&shift);
+	copy(&shift, node_header_size);
 
 	/* result value of this is important. It is used by adjust_coord below */
 	result = delete_copied(&shift);
@@ -2967,6 +3002,23 @@ int shift_node40(coord_t * from, znode *
 	return result ? result : (int)shift.shift_bytes;
 }
 
+/*
+ * plugin->u.node.shift
+ * look for description of this method in plugin/node/node.h
+ */
+int shift_node40(coord_t *from, znode *to,
+		 shift_direction pend,
+		 int delete_child, /* if @from->node becomes empty,
+				    * it will be deleted from the
+				    * tree if this is set to 1 */
+		 int including_stop_coord,
+		 carry_plugin_info *info)
+{
+	return shift_node40_common(from, to, pend, delete_child,
+				   including_stop_coord, info,
+				   sizeof(node40_header));
+}
+
 /* plugin->u.node.fast_insert()
    look for description of this method in plugin/node/node.h */
 int fast_insert_node40(const coord_t * coord UNUSED_ARG /* node to query */ )
--- a/fs/reiser4/plugin/node/node40.h
+++ b/fs/reiser4/plugin/node/node40.h
@@ -78,11 +78,18 @@ item_plugin *plugin_by_coord_node40(cons
 reiser4_key *key_at_node40(const coord_t * coord, reiser4_key * key);
 size_t estimate_node40(znode * node);
 int check_node40(const znode * node, __u32 flags, const char **error);
+int parse_node40_common(znode *node, const __u32 magic);
 int parse_node40(znode * node);
-int init_node40(znode * node);
+int init_node40_common(znode *node, node_plugin *nplug,
+		       size_t node_header_size, const __u32 magic);
+int init_node40(znode *node);
+
 #ifdef GUESS_EXISTS
-int guess_node40(const znode * node);
+int guess_node40_common(const znode *node, reiser4_node_id id,
+			const __u32 magic);
+int guess_node40(const znode *node);
 #endif
+
 void change_item_size_node40(coord_t * coord, int by);
 int create_item_node40(coord_t * target, const reiser4_key * key,
 		       reiser4_item_data * data, carry_plugin_info * info);
@@ -90,14 +97,12 @@ void update_item_key_node40(coord_t * ta
 			    carry_plugin_info * info);
 int kill_node40(struct carry_kill_data *, carry_plugin_info *);
 int cut_node40(struct carry_cut_data *, carry_plugin_info *);
-int shift_node40(coord_t * from, znode * to, shift_direction pend,
-		 /* if @from->node becomes
-		    empty - it will be deleted from
-		    the tree if this is set to 1
-		  */
+int shift_node40_common(coord_t *from, znode *to, shift_direction pend,
+			int delete_child, int including_stop_coord,
+			carry_plugin_info *info, size_t nh_size);
+int shift_node40(coord_t *from, znode *to, shift_direction pend,
 		 int delete_child, int including_stop_coord,
-		 carry_plugin_info * info);
-
+		 carry_plugin_info *info);
 int fast_insert_node40(const coord_t * coord);
 int fast_paste_node40(const coord_t * coord);
 int fast_cut_node40(const coord_t * coord);
--- /dev/null
+++ b/fs/reiser4/plugin/node/node41.c
@@ -0,0 +1,111 @@
+/*
+ * Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README
+ */
+
+#include "../../debug.h"
+#include "../../key.h"
+#include "../../coord.h"
+#include "../plugin_header.h"
+#include "../item/item.h"
+#include "node.h"
+#include "node41.h"
+#include "../plugin.h"
+#include "../../jnode.h"
+#include "../../znode.h"
+#include "../../pool.h"
+#include "../../carry.h"
+#include "../../tap.h"
+#include "../../tree.h"
+#include "../../super.h"
+#include "../../reiser4.h"
+
+#include <asm/uaccess.h>
+#include <linux/types.h>
+#include <linux/prefetch.h>
+
+/*
+ * node41 layout it almost the same as node40:
+ * node41_header is at the beginning and a table of item headers
+ * is at the end. Ther difference is that node41_header contains
+ * a 32-bit reference counter (see node41.h)
+ */
+
+static const __u32 REISER4_NODE41_MAGIC = 0x19051966;
+
+static inline node41_header *node41_node_header(const znode *node)
+{
+	assert("edward-1634", node != NULL);
+	assert("edward-1635", znode_page(node) != NULL);
+	assert("edward-1636", zdata(node) != NULL);
+
+	return (node41_header *)zdata(node);
+}
+
+/*
+ * plugin->u.node.parse
+ * look for description of this method in plugin/node/node.h
+ */
+int parse_node41(znode *node /* node to parse */)
+{
+	return parse_node40_common(node, REISER4_NODE41_MAGIC);
+}
+
+/*
+ * plugin->u.node.init
+ * look for description of this method in plugin/node/node.h
+ */
+int init_node41(znode *node /* node to initialise */)
+{
+	node41_header *header41;
+
+	init_node40_common(node, node_plugin_by_id(NODE41_ID),
+			   sizeof(node41_header), REISER4_NODE41_MAGIC);
+
+	header41 = node41_node_header(node);
+	nh41_set_csum(header41, 0);
+	return 0;
+}
+
+/*
+ * plugin->u.node.shift
+ * look for description of this method in plugin/node/node.h
+ */
+int shift_node41(coord_t *from, znode *to,
+		 shift_direction pend,
+		 int delete_child, /* if @from->node becomes empty,
+				    * it will be deleted from the
+				    * tree if this is set to 1 */
+		 int including_stop_coord,
+		 carry_plugin_info *info)
+{
+	return shift_node40_common(from, to, pend, delete_child,
+				   including_stop_coord, info,
+				   sizeof(node41_header));
+}
+
+#ifdef GUESS_EXISTS
+int guess_node41(const znode *node /* node to guess plugin of */)
+{
+	return guess_node40_common(node, NODE41_ID, REISER4_NODE41_MAGIC);
+}
+#endif
+
+/*
+ * plugin->u.node.max_item_size
+ */
+int max_item_size_node41(void)
+{
+	return reiser4_get_current_sb()->s_blocksize - sizeof(node41_header) -
+		sizeof(item_header40);
+}
+
+/*
+   Local variables:
+   c-indentation-style: "K&R"
+   mode-name: "LC"
+   c-basic-offset: 8
+   tab-width: 8
+   fill-column: 80
+   scroll-step: 1
+   End:
+*/
--- /dev/null
+++ b/fs/reiser4/plugin/node/node41.h
@@ -0,0 +1,48 @@
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+
+#if !defined( __REISER4_NODE41_H__ )
+#define __REISER4_NODE41_H__
+
+#include "../../forward.h"
+#include "../../dformat.h"
+#include "node40.h"
+#include <linux/types.h>
+
+/*
+ * node41 layout: the same as node40, but with 32-bit checksum
+ */
+
+typedef struct node41_header {
+	node40_header head;
+	d32 csum;
+} PACKED node41_header;
+
+/*
+ * functions to get/set fields of node41_header
+ */
+#define nh41_get_csum(nh) le32_to_cpu(get_unaligned(&(nh)->csum))
+#define nh41_set_csum(nh, value) put_unaligned(cpu_to_le32(value), &(nh)->csum)
+
+int init_node41(znode * node);
+int parse_node41(znode *node);
+int max_item_size_node41(void);
+int shift_node41(coord_t *from, znode *to, shift_direction pend,
+		 int delete_child, int including_stop_coord,
+		 carry_plugin_info *info);
+
+#ifdef GUESS_EXISTS
+int guess_node41(const znode * node);
+#endif
+
+/* __REISER4_NODE41_H__ */
+#endif
+/*
+   Local variables:
+   c-indentation-style: "K&R"
+   mode-name: "LC"
+   c-basic-offset: 8
+   tab-width: 8
+   fill-column: 80
+   scroll-step: 1
+   End:
+*/
--- a/fs/reiser4/plugin/plugin.h
+++ b/fs/reiser4/plugin/plugin.h
@@ -20,7 +20,7 @@
 #include "item/cde.h"
 #include "item/item.h"
 #include "node/node.h"
-#include "node/node40.h"
+#include "node/node41.h"
 #include "security/perm.h"
 #include "fibration.h"
 
--- a/fs/reiser4/reiser4.h
+++ b/fs/reiser4/reiser4.h
@@ -1,6 +1,7 @@
 /* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
  * reiser4/README */
 
+
 /* definitions of common constants used by reiser4 */
 
 #if !defined( __REISER4_H__ )
--- a/fs/reiser4/plugin/disk_format/disk_format40.c
+++ b/fs/reiser4/plugin/disk_format/disk_format40.c
@@ -70,6 +70,11 @@ static __u32 get_format40_mkfs_id(const
 	return le32_to_cpu(get_unaligned(&sb->mkfs_id));
 }
 
+static __u32 get_format40_node_plugin_id(const format40_disk_super_block * sb)
+{
+	return le32_to_cpu(get_unaligned(&sb->node_pid));
+}
+
 static __u64 get_format40_flags(const format40_disk_super_block * sb)
 {
 	return le64_to_cpu(get_unaligned(&sb->flags));
@@ -342,7 +347,7 @@ static int try_init_format40(struct supe
 	/* get things necessary to init reiser4_tree */
 	root_block = get_format40_root_block(sb_copy);
 	height = get_format40_tree_height(sb_copy);
-	nplug = node_plugin_by_id(NODE40_ID);
+	nplug = node_plugin_by_id(get_format40_node_plugin_id(sb_copy));
 
 	/* initialize reiser4_super_info_data */
 	sbinfo = get_super_private(super);
--- a/fs/reiser4/jnode.c
+++ b/fs/reiser4/jnode.c
@@ -839,16 +839,12 @@ static int jnode_start_read(jnode * node
 static void check_jload(jnode * node, struct page *page)
 {
 	if (jnode_is_znode(node)) {
-		node40_header *nh;
-		znode *z;
+		znode *z = JZNODE(node);
 
-		z = JZNODE(node);
 		if (znode_is_any_locked(z)) {
-			nh = (node40_header *) kmap(page);
-			/* this only works for node40-only file systems. For
-			 * debugging. */
 			assert("nikita-3253",
-			       z->nr_items == le16_to_cpu(get_unaligned(&nh->nr_items)));
+			       z->nr_items ==
+			       node_plugin_by_node(z)->num_of_items(z));
 			kunmap(page);
 		}
 		assert("nikita-3565", znode_invariant(z));
@@ -1331,6 +1327,7 @@ static int init_znode(jnode * node)
 
 	z = JZNODE(node);
 	/* call node plugin to do actual initialization */
+	z->nr_items = 0;
 	return z->nplug->init(z);
 }
 
--- a/fs/reiser4/plugin/disk_format/disk_format40.h
+++ b/fs/reiser4/plugin/disk_format/disk_format40.h
@@ -57,7 +57,9 @@ typedef struct format40_disk_super_block
 	   version number supported by kernel.
 	   Is used by fsck to catch possible corruption and
 	   for various compatibility issues */
-	/*  84 */ char not_used[428];
+	/*  84 */ d32 node_pid;
+	/* node plugin id */
+	/*  88 */ char not_used[424];
 } format40_disk_super_block;
 
 /* format 40 specific part of reiser4_super_info_data */

--------------090407030800080305070008
Content-Type: text/x-patch;
 name="reiser4-metadata-checksums.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-metadata-checksums.patch"

---
 fs/reiser4/Makefile             |    1 
 fs/reiser4/checksum.c           |   29 ++++++++++++++++++++++++++
 fs/reiser4/checksum.h           |   39 +++++++++++++++++++++++++++++++++++
 fs/reiser4/plugin/node/node.c   |    3 +-
 fs/reiser4/plugin/node/node.h   |    3 ++
 fs/reiser4/plugin/node/node41.c |   44 +++++++++++++++++++++++++++++++---------
 fs/reiser4/plugin/node/node41.h |    2 +
 fs/reiser4/super.h              |    1 
 fs/reiser4/super_ops.c          |    7 ++++++
 fs/reiser4/wander.c             |   13 ++++++++++-
 fs/reiser4/znode.c              |    3 --
 fs/reiser4/znode.h              |    1 
 12 files changed, 133 insertions(+), 13 deletions(-)

--- a/fs/reiser4/plugin/node/node.h
+++ b/fs/reiser4/plugin/node/node.h
@@ -233,6 +233,9 @@ typedef struct node_plugin {
 	/* change plugin id of items which are in a node already. Currently it is Used in tail conversion for regular
 	 * files */
 	int (*set_item_plugin) (coord_t * coord, item_id);
+	/* calculate and check/update znode's checksum
+	   (if @check is true, then check, otherwise update) */
+	int (*csum)(znode *node, int check);
 } node_plugin;
 
 typedef enum {
--- a/fs/reiser4/Makefile
+++ b/fs/reiser4/Makefile
@@ -48,6 +48,7 @@ reiser4-y := \
 		   safe_link.o \
 		   blocknrlist.o \
 		   discard.o \
+		   checksum.o \
            \
 		   plugin/plugin.o \
 		   plugin/plugin_set.o \
--- /dev/null
+++ b/fs/reiser4/checksum.c
@@ -0,0 +1,29 @@
+#include <linux/err.h>
+#include "debug.h"
+#include "checksum.h"
+
+int reiser4_init_csum_tfm(struct crypto_shash **tfm)
+{
+	*tfm = crypto_alloc_shash("crc32c", 0, 0);
+	if (IS_ERR(*tfm)) {
+		*tfm = NULL;
+		return 1;
+	}
+	return 0;
+}
+
+void reiser4_done_csum_tfm(struct crypto_shash *tfm)
+{
+	crypto_free_shash(tfm);
+}
+
+/*
+   Local variables:
+   c-indentation-style: "K&R"
+   mode-name: "LC"
+   c-basic-offset: 8
+   tab-width: 8
+   fill-column: 120
+   scroll-step: 1
+   End:
+*/
--- /dev/null
+++ b/fs/reiser4/checksum.h
@@ -0,0 +1,39 @@
+#ifndef __CHECKSUM__
+#define __CHECKSUM__
+
+#include <crypto/hash.h>
+
+int reiser4_init_csum_tfm(struct crypto_shash **tfm);
+void reiser4_done_csum_tfm(struct crypto_shash *tfm);
+u32 static inline reiser4_crc32c(struct crypto_shash *tfm,
+				 u32 crc, const void *address,
+				 unsigned int length)
+{
+	struct {
+		struct shash_desc shash;
+		char ctx[4];
+	} desc;
+	int err;
+
+	desc.shash.tfm = tfm;
+	desc.shash.flags = 0;
+	*(u32 *)desc.ctx = crc;
+
+	err = crypto_shash_update(&desc.shash, address, length);
+	BUG_ON(err);
+	return *(u32 *)desc.ctx;
+}
+
+#endif /* __CHECKSUM__ */
+
+/*
+   Local variables:
+   c-indentation-style: "K&R"
+   mode-name: "LC"
+   c-basic-offset: 8
+   tab-width: 8
+   fill-column: 120
+   scroll-step: 1
+   End:
+*/
+
--- a/fs/reiser4/plugin/node/node.c
+++ b/fs/reiser4/plugin/node/node.c
@@ -153,7 +153,8 @@ node_plugin node_plugins[LAST_NODE_ID] =
 		.fast_cut = fast_cut_node40,
 		.max_item_size = max_item_size_node41,
 		.prepare_removal = prepare_removal_node40,
-		.set_item_plugin = set_item_plugin_node40
+		.set_item_plugin = set_item_plugin_node40,
+		.csum = csum_node41
 	}
 };
 
--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -6,6 +6,7 @@
 #include "ktxnmgrd.h"
 #include "flush.h"
 #include "safe_link.h"
+#include "checksum.h"
 
 #include <linux/vfs.h>
 #include <linux/writeback.h>
@@ -249,6 +250,7 @@ static void reiser4_put_super(struct sup
 		get_super_private(super)->df_plug->release(super);
 
 	reiser4_done_formatted_fake(super);
+	reiser4_done_csum_tfm(sbinfo->csum_tfm);
 
 	/* stop daemons: ktxnmgr and entd */
 	reiser4_done_entd(super);
@@ -514,6 +516,10 @@ static int fill_super(struct super_block
 		goto failed_init_sinfo;
 
 	sbinfo = get_super_private(super);
+
+	if ((result = reiser4_init_csum_tfm(&sbinfo->csum_tfm)) != 0)
+		goto failed_init_csum_tfm;
+
 	/* initialize various reiser4 parameters, parse mount options */
 	if ((result = reiser4_init_super_data(super, data)) != 0)
 		goto failed_init_super_data;
@@ -592,6 +598,7 @@ static int fill_super(struct super_block
  failed_init_super_data:
 	reiser4_done_fs_info(super);
  failed_init_sinfo:
+ failed_init_csum_tfm:
 	reiser4_exit_context(&ctx);
 	return result;
 }
--- a/fs/reiser4/plugin/node/node41.c
+++ b/fs/reiser4/plugin/node/node41.c
@@ -17,6 +17,7 @@
 #include "../../tap.h"
 #include "../../tree.h"
 #include "../../super.h"
+#include "../../checksum.h"
 #include "../../reiser4.h"
 
 #include <asm/uaccess.h>
@@ -27,7 +28,7 @@
  * node41 layout it almost the same as node40:
  * node41_header is at the beginning and a table of item headers
  * is at the end. Ther difference is that node41_header contains
- * a 32-bit reference counter (see node41.h)
+ * a 32-bit checksum (see node41.h)
  */
 
 static const __u32 REISER4_NODE41_MAGIC = 0x19051966;
@@ -41,12 +42,43 @@ static inline node41_header *node41_node
 	return (node41_header *)zdata(node);
 }
 
+int csum_node41(znode *node, int check)
+{
+	__u32 cpu_csum;
+
+	cpu_csum = reiser4_crc32c(get_current_super_private()->csum_tfm,
+				  ~0,
+				  zdata(node),
+				  sizeof(struct node40_header));
+	cpu_csum = reiser4_crc32c(get_current_super_private()->csum_tfm,
+				  cpu_csum,
+				  zdata(node) + sizeof(struct node41_header),
+				  reiser4_get_current_sb()->s_blocksize -
+				  sizeof(node41_header));
+	if (check)
+		return cpu_csum == nh41_get_csum(node41_node_header(node));
+	else {
+		nh41_set_csum(node41_node_header(node), cpu_csum);
+		return 1;
+	}
+}
+
 /*
  * plugin->u.node.parse
  * look for description of this method in plugin/node/node.h
  */
 int parse_node41(znode *node /* node to parse */)
 {
+	int ret;
+
+	ret = csum_node41(node, 1/* check */);
+	if (!ret) {
+		warning("edward-1645",
+			"block %llu: bad checksum. FSCK?",
+			*jnode_get_block(ZJNODE(node)));
+		reiser4_handle_error();
+		return RETERR(-EIO);
+	}
 	return parse_node40_common(node, REISER4_NODE41_MAGIC);
 }
 
@@ -56,14 +88,8 @@ int parse_node41(znode *node /* node to
  */
 int init_node41(znode *node /* node to initialise */)
 {
-	node41_header *header41;
-
-	init_node40_common(node, node_plugin_by_id(NODE41_ID),
-			   sizeof(node41_header), REISER4_NODE41_MAGIC);
-
-	header41 = node41_node_header(node);
-	nh41_set_csum(header41, 0);
-	return 0;
+	return init_node40_common(node, node_plugin_by_id(NODE41_ID),
+				  sizeof(node41_header), REISER4_NODE41_MAGIC);
 }
 
 /*
--- a/fs/reiser4/plugin/node/node41.h
+++ b/fs/reiser4/plugin/node/node41.h
@@ -29,10 +29,12 @@ int max_item_size_node41(void);
 int shift_node41(coord_t *from, znode *to, shift_direction pend,
 		 int delete_child, int including_stop_coord,
 		 carry_plugin_info *info);
+int csum_node41(znode *node, int check);
 
 #ifdef GUESS_EXISTS
 int guess_node41(const znode * node);
 #endif
+extern void reiser4_handle_error(void);
 
 /* __REISER4_NODE41_H__ */
 #endif
--- a/fs/reiser4/znode.c
+++ b/fs/reiser4/znode.c
@@ -635,7 +635,7 @@ int zload_ra(znode * node /* znode to lo
 }
 
 /* load content of node into memory */
-int zload(znode * node)
+int zload(znode *node)
 {
 	return zload_ra(node, NULL);
 }
@@ -651,7 +651,6 @@ int zinit_new(znode * node /* znode to i
 void zrelse(znode * node /* znode to release references to */ )
 {
 	assert("nikita-1381", znode_invariant(node));
-
 	jrelse(ZJNODE(node));
 }
 
--- a/fs/reiser4/super.h
+++ b/fs/reiser4/super.h
@@ -275,6 +275,7 @@ struct reiser4_super_info_data {
 	 * more details
 	 */
 	struct d_cursor_info d_info;
+	struct crypto_shash *csum_tfm;
 
 #ifdef CONFIG_REISER4_BADBLOCKS
 	/* Alternative master superblock offset (in bytes) */
--- a/fs/reiser4/wander.c
+++ b/fs/reiser4/wander.c
@@ -769,8 +769,19 @@ static int write_jnodes_to_disk_extent(
 			JF_SET(cur, JNODE_WRITEBACK);
 			JF_CLR(cur, JNODE_DIRTY);
 			ON_DEBUG(cur->written++);
-			spin_unlock_jnode(cur);
 
+			assert("edward-1647",
+			       ergo(jnode_is_znode(cur), JF_ISSET(cur, JNODE_PARSED)));
+			spin_unlock_jnode(cur);
+			/*
+			 * update checksum
+			 */
+			if (jnode_is_znode(cur)) {
+				zload(JZNODE(cur));
+				if (node_plugin_by_node(JZNODE(cur))->csum)
+					node_plugin_by_node(JZNODE(cur))->csum(JZNODE(cur), 0);
+				zrelse(JZNODE(cur));
+			}
 			ClearPageError(pg);
 			set_page_writeback(pg);
 
--- a/fs/reiser4/znode.h
+++ b/fs/reiser4/znode.h
@@ -172,6 +172,7 @@ extern int zload_ra(znode * node, ra_inf
 extern int zinit_new(znode * node, gfp_t gfp_flags);
 extern void zrelse(znode * node);
 extern void znode_change_parent(znode * new_parent, reiser4_block_nr * block);
+extern void znode_update_csum(znode *node);
 
 /* size of data in znode */
 static inline unsigned

--------------090407030800080305070008
Content-Type: text/x-patch;
 name="reiser4-fixup-status_write.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-fixup-status_write.patch"

Reset bio in reiser4_status_write() to prevent oops in error paths.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/status_flags.c |    1 +
 1 file changed, 1 insertion(+)

--- a/fs/reiser4/status_flags.c
+++ b/fs/reiser4/status_flags.c
@@ -145,6 +145,7 @@ int reiser4_status_write(__u64 status, _
 	strncpy(statuspage->texterror, message, REISER4_TEXTERROR_LEN);
 
 	kunmap_atomic((char *)statuspage);
+	bio_reset(bio);
 	bio->bi_bdev = sb->s_bdev;
 	bio->bi_io_vec[0].bv_page = get_super_private(sb)->status_page;
 	bio->bi_io_vec[0].bv_len = sb->s_blocksize;

--------------090407030800080305070008
Content-Type: text/x-patch;
 name="reiser4-release-4.0.1.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-release-4.0.1.patch"

. Remove unneeded macro FORMAT40_VERSION;
. Print a format release when initializing reiser4 kernel module;  
. Cleanups;
. Release version 4.0.1 of reiser4 kernel module (node41
  with checksum support);

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/plugin/disk_format/disk_format40.c |   25 +++++++++++--------------
 fs/reiser4/plugin/node/node.h                 |    2 +-
 fs/reiser4/plugin/plugin.h                    |   22 +++++++++++++++++-----
 fs/reiser4/super_ops.c                        |    6 ++++--
 4 files changed, 33 insertions(+), 22 deletions(-)

--- a/fs/reiser4/plugin/disk_format/disk_format40.c
+++ b/fs/reiser4/plugin/disk_format/disk_format40.c
@@ -27,9 +27,6 @@
    & tx record. */
 #define RELEASE_RESERVED 4
 
-/* The greatest supported format40 version number */
-#define FORMAT40_VERSION PLUGIN_LIBRARY_VERSION
-
 /* This flag indicates that backup should be updated
    (the update is performed by fsck) */
 #define FORMAT40_UPDATE_BACKUP (1 << 31)
@@ -92,14 +89,14 @@ static int update_backup_version(const f
 		FORMAT40_UPDATE_BACKUP);
 }
 
-static int update_disk_version(const format40_disk_super_block * sb)
+static int update_disk_version_minor(const format40_disk_super_block * sb)
 {
-	return (get_format40_version(sb) < FORMAT40_VERSION);
+	return (get_format40_version(sb) < PLUGIN_LIBRARY_VERSION);
 }
 
 static int incomplete_compatibility(const format40_disk_super_block * sb)
 {
-	return (get_format40_version(sb) > FORMAT40_VERSION);
+	return (get_format40_version(sb) > PLUGIN_LIBRARY_VERSION);
 }
 
 static format40_super_info *get_sb_info(struct super_block *super)
@@ -327,7 +324,7 @@ static int try_init_format40(struct supe
 		printk("reiser4: Warning: The last completely supported "
 		       "version of disk format40 is %u. Some objects of "
 		       "the semantic tree can be unaccessible.\n",
-		       FORMAT40_VERSION);
+		       PLUGIN_LIBRARY_VERSION);
 	/* make sure that key format of kernel and filesystem match */
 	result = check_key_format(sb_copy);
 	if (result) {
@@ -491,8 +488,8 @@ static void pack_format40_super(const st
 	put_unaligned(cpu_to_le16(sbinfo->tree.height),
 		      &super_data->tree_height);
 
-	if (update_disk_version(super_data)) {
-		__u32 version = FORMAT40_VERSION | FORMAT40_UPDATE_BACKUP;
+	if (update_disk_version_minor(super_data)) {
+		__u32 version = PLUGIN_LIBRARY_VERSION | FORMAT40_UPDATE_BACKUP;
 
 		put_unaligned(cpu_to_le32(version), &super_data->version);
 	}
@@ -606,9 +603,9 @@ int check_open_format40(const struct ino
 	return 0;
 }
 
-/* plugin->u.format.version_update.
-   Perform all version update operations from the on-disk
-   format40_disk_super_block.version on disk to FORMAT40_VERSION.
+/*
+ * plugin->u.format.version_update
+ * Upgrade minor disk format version number
  */
 int version_update_format40(struct super_block *super) {
 	txn_handle * trans;
@@ -620,12 +617,12 @@ int version_update_format40(struct super
 	if (super->s_flags & MS_RDONLY)
  		return 0;
 
-	if (get_super_private(super)->version >= FORMAT40_VERSION)
+	if (get_super_private(super)->version >= PLUGIN_LIBRARY_VERSION)
 		return 0;
 
 	printk("reiser4: Updating disk format to 4.0.%u. The reiser4 metadata "
 	       "backup is left unchanged. Please run 'fsck.reiser4 --fix' "
-	       "on %s to update it too.\n", FORMAT40_VERSION, super->s_id);
+	       "on %s to update it too.\n", PLUGIN_LIBRARY_VERSION, super->s_id);
 
 	/* Mark the uber znode dirty to call log_super on write_logs. */
 	init_lh(&lh);
--- a/fs/reiser4/plugin/node/node.h
+++ b/fs/reiser4/plugin/node/node.h
@@ -241,7 +241,7 @@ typedef struct node_plugin {
 typedef enum {
 	NODE40_ID, /* standard unified node layout used for both,
 		      leaf and internal nodes */
-	NODE41_ID, /* unified node layout with a reference counter */
+	NODE41_ID, /* node layout with a checksum */
 	LAST_NODE_ID
 } reiser4_node_id;
 
--- a/fs/reiser4/plugin/plugin.h
+++ b/fs/reiser4/plugin/plugin.h
@@ -151,11 +151,13 @@ typedef struct reiser4_object_on_wire re
  * them, and which are only invoked by other plugins.
  */
 
-/* This should be incremented with each new contributed
-   pair (plugin type, plugin id).
-   NOTE: Make sure there is a release of reiser4progs
-   with the corresponding version number */
-#define PLUGIN_LIBRARY_VERSION 0
+/*
+ * This should be incremented in every release which adds one
+ * or more new plugins.
+ * NOTE: Make sure that respective marco is also incremented in
+ * the new release of reiser4progs.
+ */
+#define PLUGIN_LIBRARY_VERSION 1
 
  /* enumeration of fields within plugin_set */
 typedef enum {
@@ -904,6 +906,16 @@ static inline reiser4_plugin_id TYPE ##
 }									\
 typedef struct { int foo; } TYPE ## _plugin_dummy
 
+static inline int get_release_number_major(void)
+{
+	return LAST_FORMAT_ID - 1;
+}
+
+static inline int get_release_number_minor(void)
+{
+	return PLUGIN_LIBRARY_VERSION;
+}
+
 PLUGIN_BY_ID(item_plugin, REISER4_ITEM_PLUGIN_TYPE, item);
 PLUGIN_BY_ID(file_plugin, REISER4_FILE_PLUGIN_TYPE, file);
 PLUGIN_BY_ID(dir_plugin, REISER4_DIR_PLUGIN_TYPE, dir);
--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -646,8 +646,10 @@ static int __init init_reiser4(void)
 	int result;
 
 	printk(KERN_INFO
-	       "Loading Reiser4. "
-	       "See www.namesys.com for a description of Reiser4.\n");
+	       "Loading Reiser4 (format release: 4.%d.%d) "
+	       "See www.namesys.com for a description of Reiser4.\n",
+	       get_release_number_major(),
+	       get_release_number_minor());
 
 	/* initialize slab cache of inodes */
 	if ((result = init_inodes()) != 0)

--------------090407030800080305070008--
