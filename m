From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 16/29] reiserfs: balance_leaf refactor, pull out balance_leaf_insert_right
Date: Wed, 23 Apr 2014 10:00:49 -0400
Message-ID: <20140423151141.244508196@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-balance_leaf-refactor-pull-out-balance_leaf_insert_right
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

This patch factors out a new balance_leaf_insert_right from the code in
balance_leaf responsible for inserting new items into the node to
the right of S[0] in the tree.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/do_balan.c |  138 ++++++++++++++++++++++++++-----------------------
 1 file changed, 75 insertions(+), 63 deletions(-)

--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -508,6 +508,80 @@ static void balance_leaf_paste_left(stru
 
 }
 
+static void balance_leaf_insert_right(struct tree_balance *tb,
+				      struct item_head *ih, const char *body)
+{
+
+	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
+	int n = B_NR_ITEMS(tbS0);
+	struct buffer_info bi;
+	int ret_val;
+			if (n - tb->rnum[0] < tb->item_pos) {	/* new item or its part falls to R[0] */
+				if (tb->item_pos == n - tb->rnum[0] + 1 && tb->rbytes != -1) {	/* part of new item falls into R[0] */
+					loff_t old_key_comp, old_len, r_zeroes_number;
+					const char *r_body;
+					int version;
+					loff_t offset;
+
+					leaf_shift_right(tb, tb->rnum[0] - 1, -1);
+
+					version = ih_version(ih);
+					/* Remember key component and item length */
+					old_key_comp = le_ih_k_offset(ih);
+					old_len = ih_item_len(ih);
+
+					/* Calculate key component and item length to insert into R[0] */
+					offset = le_ih_k_offset(ih) + ((old_len - tb->rbytes) << (is_indirect_le_ih(ih) ? tb->tb_sb->s_blocksize_bits - UNFM_P_SHIFT : 0));
+					set_le_ih_k_offset(ih, offset);
+					put_ih_item_len(ih, tb->rbytes);
+					/* Insert part of the item into R[0] */
+					buffer_info_init_right(tb, &bi);
+					if ((old_len - tb->rbytes) > tb->zeroes_num) {
+						r_zeroes_number = 0;
+						r_body = body + (old_len - tb->rbytes) - tb->zeroes_num;
+					} else {
+						r_body = body;
+						r_zeroes_number = tb->zeroes_num - (old_len - tb->rbytes);
+						tb->zeroes_num -= r_zeroes_number;
+					}
+
+					leaf_insert_into_buf(&bi, 0, ih, r_body,
+							     r_zeroes_number);
+
+					/* Replace right delimiting key by first key in R[0] */
+					replace_key(tb, tb->CFR[0], tb->rkey[0],
+						    tb->R[0], 0);
+
+					/* Calculate key component and item length to insert into S[0] */
+					set_le_ih_k_offset(ih, old_key_comp);
+					put_ih_item_len(ih, old_len - tb->rbytes);
+
+					tb->insert_size[0] -= tb->rbytes;
+
+				} else {	/* whole new item falls into R[0] */
+
+					/* Shift rnum[0]-1 items to R[0] */
+					ret_val = leaf_shift_right(tb, tb->rnum[0] - 1, tb->rbytes);
+					/* Insert new item into R[0] */
+					buffer_info_init_right(tb, &bi);
+					leaf_insert_into_buf(&bi, tb->item_pos - n + tb->rnum[0] - 1,
+							     ih, body, tb->zeroes_num);
+
+					if (tb->item_pos - n + tb->rnum[0] - 1 == 0) {
+						replace_key(tb, tb->CFR[0],
+							    tb->rkey[0],
+							    tb->R[0], 0);
+
+					}
+					tb->zeroes_num = tb->insert_size[0] = 0;
+				}
+			} else {	/* new item or part of it doesn't fall into R[0] */
+
+				leaf_shift_right(tb, tb->rnum[0], tb->rbytes);
+			}
+
+}
+
 /**
  * balance_leaf - reiserfs tree balancing algorithm
  * @tb: tree balance state
@@ -588,69 +662,7 @@ static int balance_leaf(struct tree_bala
 		switch (flag) {
 
 		case M_INSERT:	/* insert item */
-			if (n - tb->rnum[0] < tb->item_pos) {	/* new item or its part falls to R[0] */
-				if (tb->item_pos == n - tb->rnum[0] + 1 && tb->rbytes != -1) {	/* part of new item falls into R[0] */
-					loff_t old_key_comp, old_len, r_zeroes_number;
-					const char *r_body;
-					int version;
-					loff_t offset;
-
-					leaf_shift_right(tb, tb->rnum[0] - 1, -1);
-
-					version = ih_version(ih);
-					/* Remember key component and item length */
-					old_key_comp = le_ih_k_offset(ih);
-					old_len = ih_item_len(ih);
-
-					/* Calculate key component and item length to insert into R[0] */
-					offset = le_ih_k_offset(ih) + ((old_len - tb->rbytes) << (is_indirect_le_ih(ih) ? tb->tb_sb->s_blocksize_bits - UNFM_P_SHIFT : 0));
-					set_le_ih_k_offset(ih, offset);
-					put_ih_item_len(ih, tb->rbytes);
-					/* Insert part of the item into R[0] */
-					buffer_info_init_right(tb, &bi);
-					if ((old_len - tb->rbytes) > tb->zeroes_num) {
-						r_zeroes_number = 0;
-						r_body = body + (old_len - tb->rbytes) - tb->zeroes_num;
-					} else {
-						r_body = body;
-						r_zeroes_number = tb->zeroes_num - (old_len - tb->rbytes);
-						tb->zeroes_num -= r_zeroes_number;
-					}
-
-					leaf_insert_into_buf(&bi, 0, ih, r_body,
-							     r_zeroes_number);
-
-					/* Replace right delimiting key by first key in R[0] */
-					replace_key(tb, tb->CFR[0], tb->rkey[0],
-						    tb->R[0], 0);
-
-					/* Calculate key component and item length to insert into S[0] */
-					set_le_ih_k_offset(ih, old_key_comp);
-					put_ih_item_len(ih, old_len - tb->rbytes);
-
-					tb->insert_size[0] -= tb->rbytes;
-
-				} else {	/* whole new item falls into R[0] */
-
-					/* Shift rnum[0]-1 items to R[0] */
-					ret_val = leaf_shift_right(tb, tb->rnum[0] - 1, tb->rbytes);
-					/* Insert new item into R[0] */
-					buffer_info_init_right(tb, &bi);
-					leaf_insert_into_buf(&bi, tb->item_pos - n + tb->rnum[0] - 1,
-							     ih, body, tb->zeroes_num);
-
-					if (tb->item_pos - n + tb->rnum[0] - 1 == 0) {
-						replace_key(tb, tb->CFR[0],
-							    tb->rkey[0],
-							    tb->R[0], 0);
-
-					}
-					tb->zeroes_num = tb->insert_size[0] = 0;
-				}
-			} else {	/* new item or part of it doesn't fall into R[0] */
-
-				leaf_shift_right(tb, tb->rnum[0], tb->rbytes);
-			}
+			balance_leaf_insert_right(tb, ih, body);
 			break;
 
 		case M_PASTE:	/* append item */


