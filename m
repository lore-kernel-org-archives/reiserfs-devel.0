From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 20/29] reiserfs: balance_leaf refactor pull out balance_leaf_finish_node_insert
Date: Wed, 23 Apr 2014 10:00:53 -0400
Message-ID: <20140423151143.905174888@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-balance_leaf-refactor-pull-out-balance_leaf_finish_node_insert
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

This patch factors out a new balance_leaf_finish_node_insert from the code
in balance_leaf responsible for inserting new items into S[0]

It has not been reformatted yet.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/do_balan.c |   30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -962,6 +962,26 @@ static void balance_leaf_new_nodes_paste
 
 }
 
+static void balance_leaf_finish_node_insert(struct tree_balance *tb,
+					    struct item_head *ih,
+					    const char *body)
+{
+	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
+	struct buffer_info bi;
+			buffer_info_init_tbS0(tb, &bi);
+			leaf_insert_into_buf(&bi, tb->item_pos, ih,
+					     body, tb->zeroes_num);
+
+			/*
+			 * If we insert the first key
+			 * change the delimiting key
+			 */
+			if (tb->item_pos == 0) {
+				if (tb->CFL[0])	/* can be 0 in reiserfsck */
+					replace_key(tb, tb->CFL[0], tb->lkey[0], tbS0, 0);
+			}
+}
+
 /**
  * balance_leaf - reiserfs tree balancing algorithm
  * @tb: tree balance state
@@ -1136,15 +1156,7 @@ static int balance_leaf(struct tree_bala
 
 		switch (flag) {
 		case M_INSERT:	/* insert item into S[0] */
-			buffer_info_init_tbS0(tb, &bi);
-			leaf_insert_into_buf(&bi, tb->item_pos, ih,
-					     body, tb->zeroes_num);
-
-			/* If we insert the first key change the delimiting key */
-			if (tb->item_pos == 0) {
-				if (tb->CFL[0])	/* can be 0 in reiserfsck */
-					replace_key(tb, tb->CFL[0], tb->lkey[0], tbS0, 0);
-			}
+			balance_leaf_finish_node_insert(tb, ih, body);
 			break;
 
 		case M_PASTE:{	/* append item in S[0] */


