From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 3/4] reiser4: fix disk cluster synchronization
Date: Mon, 07 Jan 2008 00:13:13 +0300
Message-ID: <47814469.40807@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030004070400090705030405"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------030004070400090705030405
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



--------------030004070400090705030405
Content-Type: text/x-patch;
 name="reiser4-fix-disk-cluster-synchronization.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-fix-disk-cluster-synchronization.patch"

Problem:
(2.6.24-rc3-mm2) BUG: unable to handle kernel NULL
pointer dereference at virtual address 00000024
EIP is at convert_ctail+0x14e/0x166

Bug: When updating disk clusters convert_ctail()
looks at inode which is already evicted from memory
or reused for other needs.

Fixup: Keep all needed file-specific info in
convert_item_info before disk cluster update
(when inode is pinned), then forget about inode.

Cleanups in plugin/file/file_conversion.c

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 linux-2.6.24-rc6-mm1/fs/reiser4/flush.h                       |    9 --
 linux-2.6.24-rc6-mm1/fs/reiser4/plugin/file/file_conversion.c |   42 ++-------
 linux-2.6.24-rc6-mm1/fs/reiser4/plugin/item/ctail.c           |   44 ++++------
 3 files changed, 35 insertions(+), 60 deletions(-)

--- linux-2.6.24-rc6-mm1/fs/reiser4/flush.h.orig
+++ linux-2.6.24-rc6-mm1/fs/reiser4/flush.h
@@ -59,8 +59,8 @@
 struct convert_item_info {
 	dc_item_stat d_cur;	/* disk cluster state of the current item */
 	dc_item_stat d_next;	/* disk cluster state of the next slum item */
-	struct inode *inode;
-	flow_t flow;
+	int cluster_shift;      /* disk cluster shift */
+	flow_t flow;            /* disk cluster data */
 };
 
 struct convert_info {
@@ -242,11 +242,6 @@
 		       item_convert_data(pos)->d_cur,			\
 		       item_convert_data(pos)->d_next,			\
 		       item_convert_data(pos)->flow.length);		\
-		printk("inode %llu, size = %llu, cluster %lu\n",	\
-		       (unsigned long long)get_inode_oid		\
-		       (item_convert_data(pos)->inode),			\
-		       i_size_read(item_convert_data(pos)->inode),	\
-		       convert_data(pos)->clust.index);			\
 	}								\
 } while (0)
 #else
--- linux-2.6.24-rc6-mm1/fs/reiser4/plugin/file/file_conversion.c.orig
+++ linux-2.6.24-rc6-mm1/fs/reiser4/plugin/file/file_conversion.c
@@ -430,27 +430,6 @@
 		 BA_CAN_COMMIT);
 }
 
-/* clear flag that indicated conversion and update
-   stat-data with new (unix-file - specific) info */
-static int complete_file_conversion(struct inode *inode)
-{
-	int result;
-
-	grab_space_enable();
-	result =
-	    reiser4_grab_space(inode_file_plugin(inode)->estimate.update(inode),
-			       BA_CAN_COMMIT);
-	if (result == 0) {
-		reiser4_inode_clr_flag(inode, REISER4_FILE_CONV_IN_PROGRESS);
-		result = reiser4_update_sd(inode);
-	}
-	if (result)
-		warning("edward-1452",
-			"Converting %llu to unix-file: update sd failed (%i)",
-			(unsigned long long)get_inode_oid(inode), result);
-	return 0;
-}
-
 /**
  * Convert cryptcompress file plugin to unix_file plugin.
  */
@@ -468,6 +447,7 @@
 	result = reserve_cryptcompress2unixfile(inode);
 	if (result)
 		goto out;
+	/* tell kill_hook to not truncate pages */
 	reiser4_inode_set_flag(inode, REISER4_FILE_CONV_IN_PROGRESS);
 	result = cut_disk_cluster(inode, 0);
 	if (result)
@@ -494,18 +474,17 @@
 		if (result)
 			break;
 	}
-	if (!result) {
-		uf_info->container = UF_CONTAINER_EXTENTS;
-		complete_file_conversion(inode);
-	}
+	if (unlikely(result))
+		goto out;
+	uf_info->container = UF_CONTAINER_EXTENTS;
+	result = reiser4_update_sd(inode);
  out:
 	all_grabbed2free();
-	if (result)
-		warning("edward-1453", "Failed to convert file %llu: ret=%i",
-			(unsigned long long)get_inode_oid(inode), result);
 	return result;
 }
 
+#define convert_file_plugin cryptcompress2unixfile
+
 /**
  * This is called by ->write() method of a cryptcompress file plugin.
  * Make a decision about the most reasonable file plugin id to manage
@@ -611,10 +590,13 @@
 	 * Perform conversion to the new plugin.
 	 */
 	down_read(&reiser4_inode_data(inode)->conv_sem);
-	result = cryptcompress2unixfile(file, inode, &cont);
+	result = convert_file_plugin(file, inode, &cont);
 	up_read(&reiser4_inode_data(inode)->conv_sem);
 	if (result) {
-		warning("edward-1544", "file conversion failed: %d", result);
+		warning("edward-1544",
+			"Inode %llu: file plugin conversion failed (%d)",
+			(unsigned long long)get_inode_oid(inode),
+			result);
 		context_set_commit_async(ctx);
 		goto exit;
 	}
--- linux-2.6.24-rc6-mm1/fs/reiser4/plugin/item/ctail.c.orig
+++ linux-2.6.24-rc6-mm1/fs/reiser4/plugin/item/ctail.c
@@ -896,14 +896,13 @@
 
 static int
 insert_cryptcompress_flow(coord_t * coord, lock_handle * lh, flow_t * f,
-			  struct inode *inode)
+			  int cluster_shift)
 {
 	int result;
 	carry_pool *pool;
 	carry_level *lowest_level;
 	reiser4_item_data *data;
 	carry_op *op;
-	int cluster_shift = inode_cluster_shift(inode);
 
 	pool =
 	    init_carry_pool(sizeof(*pool) + 3 * sizeof(*lowest_level) +
@@ -954,15 +953,14 @@
 /* Implementation of CRC_APPEND_ITEM mode of ctail conversion */
 static int insert_cryptcompress_flow_in_place(coord_t * coord,
 					      lock_handle * lh, flow_t * f,
-					      struct inode *inode)
+					      int cluster_shift)
 {
 	int ret;
 	coord_t pos;
 	lock_handle lock;
 
-	assert("edward-674", f->length <= inode_scaled_cluster_size(inode));
-	assert("edward-484", coord->between == AT_UNIT
-	       || coord->between == AFTER_ITEM);
+	assert("edward-484",
+	       coord->between == AT_UNIT || coord->between == AFTER_ITEM);
 	assert("edward-485", item_id_by_coord(coord) == CTAIL_ID);
 
 	coord_dup(&pos, coord);
@@ -972,7 +970,7 @@
 	init_lh(&lock);
 	copy_lh(&lock, lh);
 
-	ret = insert_cryptcompress_flow(&pos, &lock, f, inode);
+	ret = insert_cryptcompress_flow(&pos, &lock, f, cluster_shift);
 	done_lh(&lock);
 	assert("edward-1347", znode_is_write_locked(lh->node));
 	assert("edward-1228", !ret);
@@ -1079,7 +1077,7 @@
 		    insert_cryptcompress_flow_in_place(&pos->coord,
 						       &pos->lock,
 						       &info->flow,
-						       info->inode);
+						       info->cluster_shift);
 		break;
 	case CRC_OVERWRITE_ITEM:
 		assert("edward-1230", info->flow.length != 0);
@@ -1157,14 +1155,18 @@
 	return result;
 }
 
-/* plugin->init_convert_data() */
-static int
-init_convert_data_ctail(struct convert_item_info * idata, struct inode *inode)
+/**
+ * Collect all needed information about the object here,
+ * as in-memory inode can be evicted from memory before
+ * disk update completion.
+ */
+static int init_convert_data_ctail(struct convert_item_info * idata,
+				   struct inode *inode)
 {
 	assert("edward-813", idata != NULL);
 	assert("edward-814", inode != NULL);
 
-	idata->inode = inode;
+	idata->cluster_shift = inode_cluster_shift(inode);
 	idata->d_cur = DC_FIRST_ITEM;
 	idata->d_next = DC_INVALID_STATE;
 
@@ -1295,15 +1297,13 @@
 	inc_item_convert_count(pos);
 
 	/* prepare flow for insertion */
-	fplug->flow_by_inode(info->inode,
+	fplug->flow_by_inode(inode,
 			     (const char __user *)tfm_stream_data(&clust->tc, OUTPUT_STREAM),
 			     0 /* kernel space */ ,
 			     clust->tc.len,
 			     clust_to_off(clust->index, inode),
 			     WRITE_OP, &info->flow);
 	jput(pos->child);
-
-	assert("edward-683", cryptcompress_inode_ok(inode));
 	return 0;
       err:
 	jput(pos->child);
@@ -1320,7 +1320,6 @@
 	assert("edward-840", sq->itm != NULL);
 
 	info = sq->itm;
-	assert("edward-255", info->inode != NULL);
 	assert("edward-1212", info->flow.length == 0);
 
 	free_item_convert_data(sq);
@@ -1591,13 +1590,12 @@
 	case CRC_OVERWRITE_ITEM:
 		if (coord_is_unprepped_ctail(&pos->coord)) {
 			/* convert unpprepped ctail to prepped one */
-			int shift;
-			shift =
-			    inode_cluster_shift(item_convert_data(pos)->inode);
-			assert("edward-1259", cluster_shift_ok(shift));
-			put_unaligned((d8)shift,
-				&ctail_formatted_at(&pos->coord)->
-				cluster_shift);
+			assert("edward-1259",
+			       cluster_shift_ok(item_convert_data(pos)->
+						cluster_shift));
+			put_unaligned((d8)item_convert_data(pos)->cluster_shift,
+				      &ctail_formatted_at(&pos->coord)->
+				      cluster_shift);
 		}
 		break;
 	}

--------------030004070400090705030405--
