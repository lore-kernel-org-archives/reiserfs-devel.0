From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 59/8] plugin/cluster.h cleanup
Date: Thu, 25 Oct 2007 21:00:25 +0200
Message-ID: <1193338825.15901.104.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-VzKmvDKmqslAbhh1GKnK"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-VzKmvDKmqslAbhh1GKnK
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 49 errors, 3 warnings, 399 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.


--=-VzKmvDKmqslAbhh1GKnK
Content-Disposition: attachment; filename=cluster.h.patch
Content-Type: text/x-patch; name=cluster.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- cluster.h.orig	2007-10-25 20:52:10.000000000 +0200
+++ cluster.h	2007-10-25 20:58:46.000000000 +0200
@@ -3,7 +3,7 @@
 /* This file contains size/offset translators, modulators
    and other helper functions. */
 
-#if !defined( __FS_REISER4_CLUSTER_H__ )
+#if !defined(__FS_REISER4_CLUSTER_H__)
 #define __FS_REISER4_CLUSTER_H__
 
 #include "../inode.h"
@@ -89,7 +89,7 @@ static inline unsigned off_to_cloff(loff
 	return off & ((loff_t) (inode_cluster_size(inode)) - 1);
 }
 
-static inline  pgoff_t offset_in_clust(struct page * page)
+static inline  pgoff_t offset_in_clust(struct page *page)
 {
 	assert("edward-1488", page != NULL);
 	assert("edward-1489", page->mapping != NULL);
@@ -97,12 +97,12 @@ static inline  pgoff_t offset_in_clust(s
 	return page_index(page) & ((cluster_nrpages(page->mapping->host)) - 1);
 }
 
-static inline int first_page_in_cluster(struct page * page)
+static inline int first_page_in_cluster(struct page *page)
 {
 	return offset_in_clust(page) == 0;
 }
 
-static inline int last_page_in_cluster(struct page * page)
+static inline int last_page_in_cluster(struct page *page)
 {
 	return offset_in_clust(page) ==
 		cluster_nrpages(page->mapping->host) - 1;
@@ -177,26 +177,26 @@ static inline unsigned __mbp(loff_t size
 }
 
 /* number of file's bytes in the nominated logical cluster */
-static inline unsigned lbytes(cloff_t index, struct inode * inode)
+static inline unsigned lbytes(cloff_t index, struct inode *inode)
 {
 	return __mbb(i_size_read(inode), index, inode_cluster_shift(inode));
 }
 
 /* number of file's bytes in the nominated page */
-static inline unsigned pbytes(pgoff_t index, struct inode * inode)
+static inline unsigned pbytes(pgoff_t index, struct inode *inode)
 {
 	return __mbp(i_size_read(inode), index);
 }
 
 /* return true, if logical cluster is not occupied by the file */
-static inline int new_logical_cluster(struct cluster_handle * clust,
+static inline int new_logical_cluster(struct cluster_handle *clust,
 				      struct inode *inode)
 {
 	return clust_to_off(clust->index, inode) >= i_size_read(inode);
 }
 
 /* return true, if pages @p1 and @p2 are of the same page cluster */
-static inline int same_page_cluster(struct page * p1, struct page * p2)
+static inline int same_page_cluster(struct page *p1, struct page *p2)
 {
 	assert("edward-1490", p1 != NULL);
 	assert("edward-1491", p2 != NULL);
@@ -207,35 +207,35 @@ static inline int same_page_cluster(stru
 		pg_to_clust(page_index(p2), p2->mapping->host));
 }
 
-static inline int cluster_is_complete(struct cluster_handle * clust,
-				      struct inode * inode)
+static inline int cluster_is_complete(struct cluster_handle *clust,
+				      struct inode *inode)
 {
 	return clust->tc.lsize == inode_cluster_size(inode);
 }
 
-static inline void reiser4_slide_init(struct reiser4_slide * win)
+static inline void reiser4_slide_init(struct reiser4_slide *win)
 {
 	assert("edward-1084", win != NULL);
 	memset(win, 0, sizeof *win);
 }
 
 static inline tfm_action
-cluster_get_tfm_act(struct tfm_cluster * tc)
+cluster_get_tfm_act(struct tfm_cluster *tc)
 {
 	assert("edward-1356", tc != NULL);
 	return tc->act;
 }
 
 static inline void
-cluster_set_tfm_act(struct tfm_cluster * tc, tfm_action act)
+cluster_set_tfm_act(struct tfm_cluster *tc, tfm_action act)
 {
 	assert("edward-1356", tc != NULL);
 	tc->act = act;
 }
 
-static inline void cluster_init_act(struct cluster_handle * clust,
+static inline void cluster_init_act(struct cluster_handle *clust,
 				    tfm_action act,
-				    struct reiser4_slide * window)
+				    struct reiser4_slide *window)
 {
 	assert("edward-84", clust != NULL);
 	memset(clust, 0, sizeof *clust);
@@ -244,20 +244,20 @@ static inline void cluster_init_act(stru
 	clust->win = window;
 }
 
-static inline void cluster_init_read(struct cluster_handle * clust,
-				     struct reiser4_slide * window)
+static inline void cluster_init_read(struct cluster_handle *clust,
+				     struct reiser4_slide *window)
 {
-	cluster_init_act (clust, TFMA_READ, window);
+	cluster_init_act(clust, TFMA_READ, window);
 }
 
-static inline void cluster_init_write(struct cluster_handle * clust,
-				      struct reiser4_slide * window)
+static inline void cluster_init_write(struct cluster_handle *clust,
+				      struct reiser4_slide *window)
 {
-	cluster_init_act (clust, TFMA_WRITE, window);
+	cluster_init_act(clust, TFMA_WRITE, window);
 }
 
 /* true if @p1 and @p2 are items of the same disk cluster */
-static inline int same_disk_cluster(const coord_t * p1, const coord_t * p2)
+static inline int same_disk_cluster(const coord_t *p1, const coord_t *p2)
 {
 	/* drop this if you have other items to aggregate */
 	assert("edward-1494", item_id_by_coord(p1) == CTAIL_ID);
@@ -265,44 +265,44 @@ static inline int same_disk_cluster(cons
 	return item_plugin_by_coord(p1)->b.mergeable(p1, p2);
 }
 
-static inline int dclust_get_extension_dsize(hint_t * hint)
+static inline int dclust_get_extension_dsize(hint_t *hint)
 {
 	return hint->ext_coord.extension.ctail.dsize;
 }
 
-static inline void dclust_set_extension_dsize(hint_t * hint, int dsize)
+static inline void dclust_set_extension_dsize(hint_t *hint, int dsize)
 {
 	hint->ext_coord.extension.ctail.dsize = dsize;
 }
 
-static inline int dclust_get_extension_shift(hint_t * hint)
+static inline int dclust_get_extension_shift(hint_t *hint)
 {
 	return hint->ext_coord.extension.ctail.shift;
 }
 
-static inline int dclust_get_extension_ncount(hint_t * hint)
+static inline int dclust_get_extension_ncount(hint_t *hint)
 {
 	return hint->ext_coord.extension.ctail.ncount;
 }
 
-static inline void dclust_inc_extension_ncount(hint_t * hint)
+static inline void dclust_inc_extension_ncount(hint_t *hint)
 {
-	hint->ext_coord.extension.ctail.ncount ++;
+	hint->ext_coord.extension.ctail.ncount++;
 }
 
-static inline void dclust_init_extension(hint_t * hint)
+static inline void dclust_init_extension(hint_t *hint)
 {
 	memset(&hint->ext_coord.extension.ctail, 0,
 	       sizeof(hint->ext_coord.extension.ctail));
 }
 
-static inline int hint_is_unprepped_dclust(hint_t * hint)
+static inline int hint_is_unprepped_dclust(hint_t *hint)
 {
 	assert("edward-1451", hint_is_valid(hint));
 	return dclust_get_extension_shift(hint) == (int)UCTAIL_SHIFT;
 }
 
-static inline void coord_set_between_clusters(coord_t * coord)
+static inline void coord_set_between_clusters(coord_t *coord)
 {
 #if REISER4_DEBUG
 	int result;
@@ -321,33 +321,34 @@ static inline void coord_set_between_clu
 int reiser4_inflate_cluster(struct cluster_handle *, struct inode *);
 int find_disk_cluster(struct cluster_handle *, struct inode *, int read,
 		      znode_lock_mode mode);
-int checkout_logical_cluster(struct cluster_handle *, jnode *, struct inode *);
+int checkout_logical_cluster(struct cluster_handle *, jnode * , struct inode *);
 int reiser4_deflate_cluster(struct cluster_handle *, struct inode *);
 void truncate_complete_page_cluster(struct inode *inode, cloff_t start,
 					 int even_cows);
-void invalidate_hint_cluster(struct cluster_handle * clust);
-void put_hint_cluster(struct cluster_handle * clust, struct inode *inode,
+void invalidate_hint_cluster(struct cluster_handle *clust);
+void put_hint_cluster(struct cluster_handle *clust, struct inode *inode,
 		      znode_lock_mode mode);
-int get_disk_cluster_locked(struct cluster_handle * clust, struct inode * inode,
+int get_disk_cluster_locked(struct cluster_handle *clust, struct inode *inode,
 			    znode_lock_mode lock_mode);
-void reset_cluster_params(struct cluster_handle * clust);
-int set_cluster_by_page(struct cluster_handle * clust, struct page * page,
+void reset_cluster_params(struct cluster_handle *clust);
+int set_cluster_by_page(struct cluster_handle *clust, struct page *page,
 			int count);
-int prepare_page_cluster(struct inode *inode, struct cluster_handle * clust,
+int prepare_page_cluster(struct inode *inode, struct cluster_handle *clust,
 			 rw_op rw);
-void __put_page_cluster(int from, int to, struct page ** pages,
-			struct inode * inode);
-void put_page_cluster(struct cluster_handle * clust,
-		      struct inode  * inode, rw_op rw);
-void put_cluster_handle(struct cluster_handle * clust);
-int grab_tfm_stream(struct inode *inode, struct tfm_cluster * tc, tfm_stream_id id);
-int tfm_cluster_is_uptodate(struct tfm_cluster * tc);
-void tfm_cluster_set_uptodate(struct tfm_cluster * tc);
-void tfm_cluster_clr_uptodate(struct tfm_cluster * tc);
+void __put_page_cluster(int from, int to, struct page **pages,
+			struct inode *inode);
+void put_page_cluster(struct cluster_handle *clust,
+		      struct inode  *inode, rw_op rw);
+void put_cluster_handle(struct cluster_handle *clust);
+int grab_tfm_stream(struct inode *inode, struct tfm_cluster *tc,
+		    tfm_stream_id id);
+int tfm_cluster_is_uptodate(struct tfm_cluster *tc);
+void tfm_cluster_set_uptodate(struct tfm_cluster *tc);
+void tfm_cluster_clr_uptodate(struct tfm_cluster *tc);
 
 /* move cluster handle to the target position
    specified by the page of index @pgidx */
-static inline void move_cluster_forward(struct cluster_handle * clust,
+static inline void move_cluster_forward(struct cluster_handle *clust,
 					struct inode *inode,
 					pgoff_t pgidx)
 {
@@ -367,7 +368,7 @@ static inline void move_cluster_forward(
 	clust->index_valid = 1;
 }
 
-static inline int alloc_clust_pages(struct cluster_handle * clust,
+static inline int alloc_clust_pages(struct cluster_handle *clust,
 				    struct inode *inode)
 {
 	assert("edward-791", clust != NULL);
@@ -380,7 +381,7 @@ static inline int alloc_clust_pages(stru
 	return 0;
 }
 
-static inline void free_clust_pages(struct cluster_handle * clust)
+static inline void free_clust_pages(struct cluster_handle *clust)
 {
 	kfree(clust->pages);
 }

--=-VzKmvDKmqslAbhh1GKnK--

