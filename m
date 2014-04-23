From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 14/29] reiserfs: balance_leaf refactor, pull out balance_leaf_insert_left
Date: Wed, 23 Apr 2014 10:00:47 -0400
Message-ID: <20140423151140.966665300@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-balance_leaf-refactor-pull-out-balance_leaf_insert_left
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

This patch factors out a new balance_leaf_insert_left from the code in
balance_leaf responsible for inserting new items into the node to
the left of S[0] in the tree.

It is not yet formatted correctly.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/do_balan.c |  108 ++++++++++++++++++++++++++-----------------------
 1 file changed, 59 insertions(+), 49 deletions(-)

--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -290,6 +290,64 @@ static int balance_leaf_when_delete(stru
 	return 0;
 }
 
+static void balance_leaf_insert_left(struct tree_balance *tb,
+				     struct item_head *ih, const char *body)
+{
+	int ret_val;
+	struct buffer_info bi;
+	int n = B_NR_ITEMS(tb->L[0]);
+
+				if (tb->item_pos == tb->lnum[0] - 1 && tb->lbytes != -1) {
+					/* part of new item falls into L[0] */
+					int new_item_len;
+					int version;
+
+					ret_val = leaf_shift_left(tb, tb->lnum[0] - 1, -1);
+
+					/* Calculate item length to insert to S[0] */
+					new_item_len = ih_item_len(ih) - tb->lbytes;
+					/* Calculate and check item length to insert to L[0] */
+					put_ih_item_len(ih, ih_item_len(ih) - new_item_len);
+
+					RFALSE(ih_item_len(ih) <= 0,
+					       "PAP-12080: there is nothing to insert into L[0]: ih_item_len=%d",
+					       ih_item_len(ih));
+
+					/* Insert new item into L[0] */
+					buffer_info_init_left(tb, &bi);
+					leaf_insert_into_buf(&bi,
+							n + tb->item_pos - ret_val, ih, body,
+							tb->zeroes_num > ih_item_len(ih) ? ih_item_len(ih) : tb->zeroes_num);
+
+					version = ih_version(ih);
+
+					/* Calculate key component, item length and body to insert into S[0] */
+					set_le_ih_k_offset(ih, le_ih_k_offset(ih) +
+							(tb->lbytes << (is_indirect_le_ih(ih) ? tb->tb_sb->s_blocksize_bits - UNFM_P_SHIFT : 0)));
+
+					put_ih_item_len(ih, new_item_len);
+					if (tb->lbytes > tb->zeroes_num) {
+						body += (tb->lbytes - tb->zeroes_num);
+						tb->zeroes_num = 0;
+					} else
+						tb->zeroes_num -= tb->lbytes;
+
+					RFALSE(ih_item_len(ih) <= 0,
+					       "PAP-12085: there is nothing to insert into S[0]: ih_item_len=%d",
+					       ih_item_len(ih));
+				} else {
+					/* new item in whole falls into L[0] */
+					/* Shift lnum[0]-1 items to L[0] */
+					ret_val = leaf_shift_left(tb, tb->lnum[0] - 1, tb->lbytes);
+					/* Insert new item into L[0] */
+					buffer_info_init_left(tb, &bi);
+					leaf_insert_into_buf(&bi, n + tb->item_pos - ret_val, ih, body, tb->zeroes_num);
+					tb->insert_size[0] = 0;
+					tb->zeroes_num = 0;
+				}
+
+}
+
 /**
  * balance_leaf - reiserfs tree balancing algorithm
  * @tb: tree balance state
@@ -342,55 +400,7 @@ static int balance_leaf(struct tree_bala
 
 			switch (flag) {
 			case M_INSERT:	/* insert item into L[0] */
-
-				if (tb->item_pos == tb->lnum[0] - 1 && tb->lbytes != -1) {
-					/* part of new item falls into L[0] */
-					int new_item_len;
-					int version;
-
-					ret_val = leaf_shift_left(tb, tb->lnum[0] - 1, -1);
-
-					/* Calculate item length to insert to S[0] */
-					new_item_len = ih_item_len(ih) - tb->lbytes;
-					/* Calculate and check item length to insert to L[0] */
-					put_ih_item_len(ih, ih_item_len(ih) - new_item_len);
-
-					RFALSE(ih_item_len(ih) <= 0,
-					       "PAP-12080: there is nothing to insert into L[0]: ih_item_len=%d",
-					       ih_item_len(ih));
-
-					/* Insert new item into L[0] */
-					buffer_info_init_left(tb, &bi);
-					leaf_insert_into_buf(&bi,
-							n + tb->item_pos - ret_val, ih, body,
-							tb->zeroes_num > ih_item_len(ih) ? ih_item_len(ih) : tb->zeroes_num);
-
-					version = ih_version(ih);
-
-					/* Calculate key component, item length and body to insert into S[0] */
-					set_le_ih_k_offset(ih, le_ih_k_offset(ih) +
-							(tb-> lbytes << (is_indirect_le_ih(ih) ? tb->tb_sb-> s_blocksize_bits - UNFM_P_SHIFT : 0)));
-
-					put_ih_item_len(ih, new_item_len);
-					if (tb->lbytes > tb->zeroes_num) {
-						body += (tb->lbytes - tb->zeroes_num);
-						tb->zeroes_num = 0;
-					} else
-						tb->zeroes_num -= tb->lbytes;
-
-					RFALSE(ih_item_len(ih) <= 0,
-					       "PAP-12085: there is nothing to insert into S[0]: ih_item_len=%d",
-					       ih_item_len(ih));
-				} else {
-					/* new item in whole falls into L[0] */
-					/* Shift lnum[0]-1 items to L[0] */
-					ret_val = leaf_shift_left(tb, tb->lnum[0] - 1, tb->lbytes);
-					/* Insert new item into L[0] */
-					buffer_info_init_left(tb, &bi);
-					leaf_insert_into_buf(&bi, n + tb->item_pos - ret_val, ih, body, tb->zeroes_num);
-					tb->insert_size[0] = 0;
-					tb->zeroes_num = 0;
-				}
+				balance_leaf_insert_left(tb, ih, body);
 				break;
 
 			case M_PASTE:	/* append item in L[0] */


