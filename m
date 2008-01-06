From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 4/4] reiser4: use balance_dirty_pages_ratelimited_nr
Date: Mon, 07 Jan 2008 00:13:25 +0300
Message-ID: <47814475.8080209@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040906030203070103060803"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------040906030203070103060803
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



--------------040906030203070103060803
Content-Type: text/x-patch;
 name="reiser4-use-balance_dirty_pages_nr.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-use-balance_dirty_pages_nr.patch"

Use balance_dirty_pages_ratelimited_nr() instead of
balance_dirty_pages_ratelimited() for all reiser4
page cluster operations.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 linux-2.6.24-rc6-mm1/fs/reiser4/plugin/cluster.h            |   12 +++++++++
 linux-2.6.24-rc6-mm1/fs/reiser4/plugin/file/cryptcompress.c |   16 ++++++++----
 2 files changed, 23 insertions(+), 5 deletions(-)

--- linux-2.6.24-rc6-mm1/fs/reiser4/plugin/cluster.h.orig
+++ linux-2.6.24-rc6-mm1/fs/reiser4/plugin/cluster.h
@@ -188,6 +188,18 @@
 	return __mbp(i_size_read(inode), index);
 }
 
+/**
+ * number of pages occuped by @win->count bytes starting from
+ * @win->off at logical cluster defined by @win. This is exactly
+ * a number of pages to be modified and dirtied in any cluster operation.
+ */
+static inline pgoff_t win_count_to_nrpages(struct reiser4_slide * win)
+{
+	return ((win->off + win->count +
+		 (1UL << PAGE_CACHE_SHIFT) - 1) >> PAGE_CACHE_SHIFT) -
+		off_to_pg(win->off);
+}
+
 /* return true, if logical cluster is not occupied by the file */
 static inline int new_logical_cluster(struct cluster_handle * clust,
 				      struct inode *inode)
--- linux-2.6.24-rc6-mm1/fs/reiser4/plugin/file/cryptcompress.c.orig
+++ linux-2.6.24-rc6-mm1/fs/reiser4/plugin/file/cryptcompress.c
@@ -1952,13 +1952,16 @@
 
 static int balance_dirty_page_cluster(struct cluster_handle * clust,
 				      struct inode *inode, loff_t off,
-				      loff_t to_file)
+				      loff_t to_file,
+				      int nr_dirtied)
 {
 	int result;
 	struct cryptcompress_info * info;
 
 	assert("edward-724", inode != NULL);
 	assert("edward-725", cryptcompress_inode_ok(inode));
+	assert("edward-1547",
+	       nr_dirtied != 0 && nr_dirtied <= cluster_nrpages(inode));
 
 	/* set next window params */
 	move_update_window(inode, clust, off, to_file);
@@ -1970,7 +1973,8 @@
 	info = cryptcompress_inode_data(inode);
 
 	mutex_unlock(&info->checkin_mutex);
-	reiser4_throttle_write(inode);
+	reiser4_txn_restart_current();
+	balance_dirty_pages_ratelimited_nr(inode->i_mapping, nr_dirtied);
 	mutex_lock(&info->checkin_mutex);
 	return 0;
 }
@@ -2038,8 +2042,9 @@
 		if (result)
 			return result;
 		put_hint_cluster(clust, inode, ZNODE_WRITE_LOCK);
-		result =
-		    balance_dirty_page_cluster(clust, inode, file_off, to_file);
+		result = balance_dirty_page_cluster(clust,
+						    inode, file_off, to_file,
+						    win_count_to_nrpages(win));
 	} else
 		move_update_window(inode, clust, file_off, to_file);
 	return result;
@@ -2756,7 +2761,8 @@
 		buf   += win.count;
 		count -= win.count;
 
-		result = balance_dirty_page_cluster(&clust, inode, 0, count);
+		result = balance_dirty_page_cluster(&clust, inode, 0, count,
+						    win_count_to_nrpages(&win));
 		if (result)
 			goto err1;
 		assert("edward-755", hint->lh.owner == NULL);

--------------040906030203070103060803--
