From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 18/29] reiserfs: balance_leaf refactor, pull out balance_leaf_new_nodes_insert
Date: Wed, 23 Apr 2014 10:00:51 -0400
Message-ID: <20140423151141.537467139@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-balance_leaf-refactor-pull-out-balance_leaf_new_nodes_insert
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

This patch factors out a new balance_leaf_new_nodes_insert from the code
in balance_leaf responsible for inserting new items into new nodes in
the tree.

It has not been reformatted yet.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/do_balan.c |  133 ++++++++++++++++++++++++++-----------------------
 1 file changed, 73 insertions(+), 60 deletions(-)

--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -733,6 +733,77 @@ static void balance_leaf_paste_right(str
 
 }
 
+static void balance_leaf_new_nodes_insert(struct tree_balance *tb,
+					  struct item_head *ih,
+					  const char *body,
+					  struct item_head *insert_key,
+					  struct buffer_head **insert_ptr,
+					  int i)
+{
+	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
+	int n = B_NR_ITEMS(tbS0);
+	struct buffer_info bi;
+			if (n - tb->snum[i] < tb->item_pos) {	/* new item or it's part falls to first new node S_new[i] */
+				if (tb->item_pos == n - tb->snum[i] + 1 && tb->sbytes[i] != -1) {	/* part of new item falls into S_new[i] */
+					int old_key_comp, old_len, r_zeroes_number;
+					const char *r_body;
+					int version;
+
+					/* Move snum[i]-1 items from S[0] to S_new[i] */
+					leaf_move_items(LEAF_FROM_S_TO_SNEW, tb,
+							tb->snum[i] - 1, -1,
+							tb->S_new[i]);
+					/* Remember key component and item length */
+					version = ih_version(ih);
+					old_key_comp = le_ih_k_offset(ih);
+					old_len = ih_item_len(ih);
+
+					/* Calculate key component and item length to insert into S_new[i] */
+					set_le_ih_k_offset(ih, le_ih_k_offset(ih) +
+							   ((old_len - tb->sbytes[i]) << (is_indirect_le_ih(ih) ? tb->tb_sb->s_blocksize_bits - UNFM_P_SHIFT : 0)));
+
+					put_ih_item_len(ih, tb->sbytes[i]);
+
+					/* Insert part of the item into S_new[i] before 0-th item */
+					buffer_info_init_bh(tb, &bi, tb->S_new[i]);
+
+					if ((old_len - tb->sbytes[i]) > tb->zeroes_num) {
+						r_zeroes_number = 0;
+						r_body = body + (old_len - tb->sbytes[i]) - tb->zeroes_num;
+					} else {
+						r_body = body;
+						r_zeroes_number = tb->zeroes_num - (old_len - tb->sbytes[i]);
+						tb->zeroes_num -= r_zeroes_number;
+					}
+
+					leaf_insert_into_buf(&bi, 0, ih, r_body, r_zeroes_number);
+
+					/* Calculate key component and item length to insert into S[i] */
+					set_le_ih_k_offset(ih, old_key_comp);
+					put_ih_item_len(ih, old_len - tb->sbytes[i]);
+					tb->insert_size[0] -= tb->sbytes[i];
+				} else {	/* whole new item falls into S_new[i] */
+
+					/* Shift snum[0] - 1 items to S_new[i] (sbytes[i] of split item) */
+					leaf_move_items(LEAF_FROM_S_TO_SNEW, tb,
+							tb->snum[i] - 1, tb->sbytes[i], tb->S_new[i]);
+
+					/* Insert new item into S_new[i] */
+					buffer_info_init_bh(tb, &bi, tb->S_new[i]);
+					leaf_insert_into_buf(&bi, tb->item_pos - n + tb->snum[i] - 1,
+							     ih, body, tb->zeroes_num);
+
+					tb->zeroes_num = tb->insert_size[0] = 0;
+				}
+			}
+
+			else {	/* new item or it part don't falls into S_new[i] */
+
+				leaf_move_items(LEAF_FROM_S_TO_SNEW, tb,
+						tb->snum[i], tb->sbytes[i], tb->S_new[i]);
+			}
+}
+
 /**
  * balance_leaf - reiserfs tree balancing algorithm
  * @tb: tree balance state
@@ -877,66 +948,8 @@ static int balance_leaf(struct tree_bala
 
 		switch (flag) {
 		case M_INSERT:	/* insert item */
-
-			if (n - tb->snum[i] < tb->item_pos) {	/* new item or it's part falls to first new node S_new[i] */
-				if (tb->item_pos == n - tb->snum[i] + 1 && tb->sbytes[i] != -1) {	/* part of new item falls into S_new[i] */
-					int old_key_comp, old_len, r_zeroes_number;
-					const char *r_body;
-					int version;
-
-					/* Move snum[i]-1 items from S[0] to S_new[i] */
-					leaf_move_items(LEAF_FROM_S_TO_SNEW, tb,
-							tb->snum[i] - 1, -1,
-							tb->S_new[i]);
-					/* Remember key component and item length */
-					version = ih_version(ih);
-					old_key_comp = le_ih_k_offset(ih);
-					old_len = ih_item_len(ih);
-
-					/* Calculate key component and item length to insert into S_new[i] */
-					set_le_ih_k_offset(ih, le_ih_k_offset(ih) +
-							   ((old_len - tb->sbytes[i]) << (is_indirect_le_ih(ih) ? tb->tb_sb->s_blocksize_bits - UNFM_P_SHIFT : 0)));
-
-					put_ih_item_len(ih, tb->sbytes[i]);
-
-					/* Insert part of the item into S_new[i] before 0-th item */
-					buffer_info_init_bh(tb, &bi, tb->S_new[i]);
-
-					if ((old_len - tb->sbytes[i]) > tb->zeroes_num) {
-						r_zeroes_number = 0;
-						r_body = body + (old_len - tb->sbytes[i]) - tb->zeroes_num;
-					} else {
-						r_body = body;
-						r_zeroes_number = tb->zeroes_num - (old_len - tb->sbytes[i]);
-						tb->zeroes_num -= r_zeroes_number;
-					}
-
-					leaf_insert_into_buf(&bi, 0, ih, r_body, r_zeroes_number);
-
-					/* Calculate key component and item length to insert into S[i] */
-					set_le_ih_k_offset(ih, old_key_comp);
-					put_ih_item_len(ih, old_len - tb->sbytes[i]);
-					tb->insert_size[0] -= tb->sbytes[i];
-				} else {	/* whole new item falls into S_new[i] */
-
-					/* Shift snum[0] - 1 items to S_new[i] (sbytes[i] of split item) */
-					leaf_move_items(LEAF_FROM_S_TO_SNEW, tb,
-							tb->snum[i] - 1, tb->sbytes[i], tb->S_new[i]);
-
-					/* Insert new item into S_new[i] */
-					buffer_info_init_bh(tb, &bi, tb->S_new[i]);
-					leaf_insert_into_buf(&bi, tb->item_pos - n + tb->snum[i] - 1,
-							     ih, body, tb->zeroes_num);
-
-					tb->zeroes_num = tb->insert_size[0] = 0;
-				}
-			}
-
-			else {	/* new item or it part don't falls into S_new[i] */
-
-				leaf_move_items(LEAF_FROM_S_TO_SNEW, tb,
-						tb->snum[i], tb->sbytes[i], tb->S_new[i]);
-			}
+			balance_leaf_new_nodes_insert(tb, ih, body, insert_key,
+						      insert_ptr, i);
 			break;
 
 		case M_PASTE:	/* append item */


