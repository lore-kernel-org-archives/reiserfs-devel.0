From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH 2/2] reiser4: Improve truncate (->setattr)
Date: Sun, 19 Jul 2015 23:30:07 +0800
Message-ID: <55ABC27F.5050705@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030601000303080609010602"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=J5lMZgj7XdEA7LAp+nldvLzCS6v5Dpl5i9NluMnff4Y=;
        b=rHcGWIRaLTMQR1OkXTgtgny4W/4My6x6idvwJ++uC6BV4YkLY5HkiUW3+JwTa/FxQ9
         l3hVXFREwnonpVnRN/RGmgFKmUe62f79hUPEBc9uwFdan2A4cgqb7RTUYJvx5hpi9oRV
         e6LUEV476xIpIrfYIbCulDhhOh4o1F6ZI+8/1Wr9gQBNXTD/aQvoI2fNGTkM8oQVVoSB
         99KPzsTqEY48ONpBP04kHZ4ynzAQVf3NxiYNVV3Tp6p1XaDN4NSNpH6/mfKp3V6kLtG7
         eFvQj8VhGrqYmrWff7AMFyaym1RI501L+qMi5jqAQYaBx0jFNEAg0d7kN9esqTIrn2/u
         2eJw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------030601000303080609010602
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

. Improve truncate (->setattr) of cryptcompress files;
. Handle races between hole puncher and modifying threads:
   maintain an "economic" counter of checked-in modifications;
. Comments, cleanups.

--------------030601000303080609010602
Content-Type: text/x-patch;
 name="reiser4-improve-truncate.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-improve-truncate.patch"

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

---
 fs/reiser4/flush.c                     |    2 
 fs/reiser4/jnode.h                     |   34 ++
 fs/reiser4/plugin/file/cryptcompress.c |  424 +++++++++++----------------------
 fs/reiser4/plugin/file/cryptcompress.h |    9 
 fs/reiser4/plugin/item/ctail.c         |    7 
 fs/reiser4/txnmgr.c                    |    1 
 6 files changed, 186 insertions(+), 291 deletions(-)

--- a/fs/reiser4/plugin/file/cryptcompress.c
+++ b/fs/reiser4/plugin/file/cryptcompress.c
@@ -932,12 +932,10 @@ static bool is_all_zero(char const* mem,
 static inline bool should_punch_hole(struct tfm_cluster *tc)
 {
 	if (!reiser4_is_set(reiser4_get_current_sb(), REISER4_DONT_PUNCH_HOLES)
+	    && !tc->race /* someone doesn't want this hole */
 	    && is_all_zero(tfm_stream_data(tc, INPUT_STREAM), tc->lsize)) {
-		/*
-		 * the logical cluster is filled with zeros,
-		 * so we'll punch a hole
-		 */
-		tc->all_zero = 1;
+
+		tc->hole = 1;
 		return true;
 	}
 	return false;
@@ -1321,8 +1319,9 @@ static int get_new_nrpages(struct cluste
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
@@ -1521,17 +1520,6 @@ static int jnode_truncate_ok(struct inod
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
@@ -1770,12 +1758,13 @@ static void checkin_file_size(struct clu
 
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
@@ -1866,7 +1855,9 @@ static int checkin_logical_cluster(struc
 
 	lock_cluster(node);
 	checkin_cluster_size(clust, inode);
-	/* this will unlock cluster */
+	/*
+	 * this will unlock the cluster
+	 */
 	result = checkin_page_cluster(clust, inode);
 	jput(node);
 	clust->node = NULL;
@@ -1996,6 +1987,11 @@ int checkout_logical_cluster(struct clus
  		return RETERR(-E_REPEAT);
  	}
 	cluster_reserved2grabbed(estimate_update_cluster(inode));
+	/*
+	 * retrieve notification about possible races
+	 * (for hole punching)
+	 */
+	clust->tc.race = jnode_get_ucnt(node);
 
 	/* this will unlock cluster */
 	checkout_page_cluster(clust, node, inode);
@@ -2069,8 +2065,9 @@ static int balance_dirty_page_cluster(st
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
@@ -2094,15 +2091,18 @@ static int write_hole(struct inode *inod
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
@@ -2125,7 +2125,7 @@ static int write_hole(struct inode *inod
 		cl_count -= to_pg;
 		pg_off = 0;
 	}
-	if (!win->delta) {
+	if (win->delta == 0) {
 		/* only zeroes in this window, try to capture
 		 */
 		result = checkin_logical_cluster(clust, inode);
@@ -2502,13 +2502,29 @@ static int cryptcompress_make_unprepped_
 int prepare_page_cluster(struct inode * inode, struct cluster_handle * clust,
 			 rw_op rw)
 {
+	int ret;
 	assert("edward-177", inode != NULL);
 	assert("edward-741", cryptcompress_inode_ok(inode));
 	assert("edward-740", clust->pages != NULL);
 
 	set_cluster_nrpages(clust, inode);
 	reset_cluster_pgset(clust, cluster_nrpages(inode));
-	return grab_page_cluster(inode, clust, rw);
+	ret = grab_page_cluster(inode, clust, rw);
+	if (ret)
+		return ret;
+	if (rw == WRITE_OP && clust->nr_pages != 0) {
+		assert("edward-1642", clust->node != NULL);
+		/*
+		 * Make sure that we'll find the parent
+		 * coord at flush time. We should update
+		 * this "counter" _before_ accessing the
+		 * parent coord at prepare_logical_cluster()
+		 */
+		spin_lock_jnode(clust->node);
+		jnode_inc_ucnt(clust->node);
+		spin_unlock_jnode(clust->node);
+	}
+	return 0;
 }
 
 /* Truncate complete page cluster of index @index.
@@ -2619,32 +2635,39 @@ static int prepare_logical_cluster(struc
 
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
 
@@ -3000,87 +3023,6 @@ ssize_t read_cryptcompress(struct file *
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
@@ -3215,13 +3157,8 @@ int cut_tree_worker_cryptcompress(tap_t
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
@@ -3247,16 +3184,22 @@ static int cryptcompress_append_hole(str
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
@@ -3264,20 +3207,17 @@ static int cryptcompress_append_hole(str
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
@@ -3286,29 +3226,28 @@ static int cryptcompress_append_hole(str
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
@@ -3332,84 +3271,76 @@ static int prune_cryptcompress(struct in
 	cluster_init_read(&clust, &win);
 	clust.hint = hint;
 
-	/* calculate index of the rightmost logical cluster
-	   that will be completely truncated */
-	ridx = size_in_lc(new_size, inode);
+	/*
+	 * index of the rightmost logical cluster
+	 * that will be completely truncated
+	 */
+	from_idx = size_in_lc(new_size, inode);
+	to_idx = size_in_lc(inode->i_size, inode);
+	/*
+	 * truncate all disk clusters starting from @from_idx
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
 	if (!off_to_cloff(new_size, inode)) {
-		/* no partial truncate is needed */
 		assert("edward-1145", inode->i_size == new_size);
-		goto truncate_fake;
+		goto truncate_hole;
 	}
 	assert("edward-1146", new_size < inode->i_size);
 
 	to_prune = inode->i_size - new_size;
-
-	/* check if the last logical cluster is fake */
-	result = lookup_disk_cluster(inode, &aidx, ridx);
+	/*
+	 * Partial truncate of the last logical cluster.
+	 * If the last one is not a hole, then it we'll be
+	 * captured and submitted
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
-
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
 
@@ -3419,79 +3350,6 @@ static int prune_cryptcompress(struct in
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
@@ -3577,7 +3435,7 @@ static int capture_anon_pages(struct add
 	hint_init_zero(hint);
 	lh = &hint->lh;
 
-	cluster_init_read(&clust, NULL);
+	cluster_init_read(&clust, NULL /* no sliding window */);
 	clust.hint = hint;
 
 	result = alloc_cluster_pgset(&clust, cluster_nrpages(inode));
@@ -3752,7 +3610,7 @@ int delete_object_cryptcompress(struct i
 	info = cryptcompress_inode_data(inode);
 
 	mutex_lock(&info->checkin_mutex);
-	result = cryptcompress_truncate(inode, 0, 0);
+	result = prune_cryptcompress(inode, 0, 0);
 	mutex_unlock(&info->checkin_mutex);
 
 	if (result) {
@@ -3798,9 +3656,13 @@ int setattr_cryptcompress(struct dentry
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
@@ -159,7 +160,9 @@ struct tfm_cluster {
 	int uptodate;
 	int lsize;        /* number of bytes in logical cluster */
 	int len;          /* length of the transform stream */
-	int all_zero;     /* logical cluster is filled with zeros */
+	unsigned int hole:1;  /* should punch hole */
+	unsigned int race:1;  /* true, if more than one user
+				 checked in modifications */
 };
 
 static inline coa_t get_coa(struct tfm_cluster * tc, reiser4_compression_id id,
--- a/fs/reiser4/jnode.h
+++ b/fs/reiser4/jnode.h
@@ -245,9 +245,6 @@ typedef enum {
 	/* write is in progress */
 	JNODE_WRITEBACK = 18,
 
-	/* FIXME: now it is used by crypto-compress plugin only */
-	JNODE_NEW = 19,
-
 	/* delimiting keys are already set for this znode. */
 	JNODE_DKSET = 20,
 
@@ -261,6 +258,13 @@ typedef enum {
 	/* node should be converted by flush in squalloc phase */
 	JNODE_CONVERTIBLE = 24,
 	/*
+	 * The following 2 flags implement an "economical counter" which is
+	 * used to indicate possible races when punching holes).
+	 * Just don't want to add an additional field to struct jnode.
+	 */
+	JNODE_USED_1 = 25, /* only one user checked in modifications */
+	JNODE_USED_2_AND_MORE = 26, /* two or more users checked in */
+	/*
 	 * When jnode is dirtied for the first time in given transaction,
 	 * do_jnode_make_dirty() checks whether this jnode can possible became
 	 * member of overwrite set. If so, this bit is set, and one block is
@@ -335,6 +339,30 @@ static inline int jnode_is_in_deleteset(
 	return JF_ISSET(node, JNODE_RELOC);
 }
 
+/*
+ * operations with "modulated" economical counter, which is represented
+ * by two jnode flags: JNODE_USED_1 and JNODE_USED_2_AND_MORE
+ */
+static inline void jnode_inc_ucnt(jnode *node)
+{
+	if (JF_TEST_AND_SET(node, JNODE_USED_1))
+		JF_SET(node, JNODE_USED_2_AND_MORE);
+}
+
+static inline void jnode_clr_ucnt(jnode *node)
+{
+	JF_CLR(node, JNODE_USED_2_AND_MORE);
+	JF_CLR(node, JNODE_USED_1);
+}
+
+static inline int jnode_get_ucnt(const jnode *node)
+{
+	assert("edward-1644",
+	       ergo(JF_ISSET(node, JNODE_USED_2_AND_MORE),
+		    JF_ISSET(node, JNODE_USED_1)));
+	return JF_ISSET(node, JNODE_USED_2_AND_MORE);
+}
+
 extern int init_jnodes(void);
 extern void done_jnodes(void);
 
--- a/fs/reiser4/plugin/item/ctail.c
+++ b/fs/reiser4/plugin/item/ctail.c
@@ -1209,7 +1209,8 @@ static struct convert_info *alloc_conver
 
 static void reset_convert_data(struct convert_info *info)
 {
-	info->clust.tc.all_zero = 0;
+	info->clust.tc.hole = 0;
+	info->clust.tc.race = 0;
 }
 
 void free_convert_data(flush_pos_t * pos)
@@ -1310,7 +1311,7 @@ static int attach_convert_idata(flush_po
 			     clust->tc.len,
 			     clust_to_off(clust->index, inode),
 			     WRITE_OP, &info->flow);
-	if (clust->tc.all_zero)
+	if (clust->tc.hole)
 		info->flow.length = 0;
 
 	jput(pos->child);
@@ -1592,7 +1593,7 @@ static int assign_conversion_mode(flush_
 			if (ret)
 				goto dont_convert;
 
-			if (pos->sq->clust.tc.all_zero) {
+			if (pos->sq->clust.tc.hole) {
 				assert("edward-1634",
 				      item_convert_data(pos)->flow.length == 0);
 				/*
--- a/fs/reiser4/txnmgr.c
+++ b/fs/reiser4/txnmgr.c
@@ -3008,6 +3008,7 @@ void reiser4_uncapture_block(jnode * nod
 	JF_CLR(node, JNODE_CREATED);
 	JF_CLR(node, JNODE_WRITEBACK);
 	JF_CLR(node, JNODE_REPACK);
+	jnode_clr_ucnt(node);
 
 	list_del_init(&node->capture_link);
 	if (JF_ISSET(node, JNODE_FLUSH_QUEUED)) {
--- a/fs/reiser4/flush.c
+++ b/fs/reiser4/flush.c
@@ -1985,7 +1985,7 @@ static int handle_pos_on_formatted(flush
 		if (ret)
 			break;
 		if (znode_convertible(right_lock.node)) {
-			assert("edward-xxxx",
+			assert("edward-1643",
 			       ergo(convert_data(pos),
 				    convert_data(pos)->right_locked == 0));
 

--------------030601000303080609010602--
