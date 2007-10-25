From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 44/8] readahead.c cleanup
Date: Thu, 25 Oct 2007 16:09:43 +0200
Message-ID: <1193321383.15901.34.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-sW3vOWD+a0EuWmfTLQe6"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-sW3vOWD+a0EuWmfTLQe6
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 5 errors, 4 warnings, 138 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.


--=-sW3vOWD+a0EuWmfTLQe6
Content-Disposition: attachment; filename=readahead.c.patch
Content-Type: text/x-patch; name=readahead.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- readahead.c.orig	2007-10-25 16:04:37.000000000 +0200
+++ readahead.c	2007-10-25 16:08:13.000000000 +0200
@@ -11,20 +11,22 @@
 
 #include <linux/swap.h>		/* for totalram_pages */
 
-void reiser4_init_ra_info(ra_info_t * rai)
+void reiser4_init_ra_info(ra_info_t *rai)
 {
 	rai->key_to_stop = *reiser4_min_key();
 }
 
-/* global formatted node readahead parameter. It can be set by mount option -o readahead:NUM:1 */
+/* global formatted node readahead parameter. It can be set by mount option
+ * -o readahead:NUM:1 */
 static inline int ra_adjacent_only(int flags)
 {
 	return flags & RA_ADJACENT_ONLY;
 }
 
-/* this is used by formatted_readahead to decide whether read for right neighbor of node is to be issued. It returns 1
-   if right neighbor's first key is less or equal to readahead's stop key */
-static int should_readahead_neighbor(znode * node, ra_info_t * info)
+/* this is used by formatted_readahead to decide whether read for right neighbor
+ * of node is to be issued. It returns 1 if right neighbor's first key is less
+ * or equal to readahead's stop key */
+static int should_readahead_neighbor(znode * node, ra_info_t *info)
 {
 	int result;
 
@@ -45,7 +47,7 @@ static int low_on_memory(void)
 }
 
 /* start read for @node and for a few of its right neighbors */
-void formatted_readahead(znode * node, ra_info_t * info)
+void formatted_readahead(znode * node, ra_info_t *info)
 {
 	struct formatted_ra_params *ra_params;
 	znode *cur;
@@ -53,7 +55,8 @@ void formatted_readahead(znode * node, r
 	int grn_flags;
 	lock_handle next_lh;
 
-	/* do nothing if node block number has not been assigned to node (which means it is still in cache). */
+	/* do nothing if node block number has not been assigned to node (which
+	 * means it is still in cache). */
 	if (reiser4_blocknr_is_fake(znode_get_block(node)))
 		return;
 
@@ -78,7 +81,7 @@ void formatted_readahead(znode * node, r
 	cur = zref(node);
 	init_lh(&next_lh);
 	while (i < ra_params->max) {
-		const reiser4_block_nr *nextblk;
+		const reiser4_block_nr * nextblk;
 
 		if (!should_readahead_neighbor(cur, info))
 			break;
@@ -90,9 +93,8 @@ void formatted_readahead(znode * node, r
 		nextblk = znode_get_block(next_lh.node);
 		if (reiser4_blocknr_is_fake(nextblk) ||
 		    (ra_adjacent_only(ra_params->flags)
-		     && *nextblk != *znode_get_block(cur) + 1)) {
+		     && *nextblk != *znode_get_block(cur) + 1))
 			break;
-		}
 
 		zput(cur);
 		cur = zref(next_lh.node);
@@ -110,7 +112,7 @@ void formatted_readahead(znode * node, r
 	done_lh(&next_lh);
 }
 
-void reiser4_readdir_readahead_init(struct inode *dir, tap_t * tap)
+void reiser4_readdir_readahead_init(struct inode *dir, tap_t *tap)
 {
 	reiser4_key *stop_key;
 

--=-sW3vOWD+a0EuWmfTLQe6--

