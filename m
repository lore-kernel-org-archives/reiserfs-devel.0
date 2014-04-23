From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 19/29] reiserfs: balance_leaf refactor, pull out balance_leaf_new_nodes_paste
Date: Wed, 23 Apr 2014 10:00:52 -0400
Message-ID: <20140423151141.682849784@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-balance_leaf-refactor-pull-out-balance_leaf_new_nodes_paste
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

This patch factors out a new balance_leaf_new_nodes_insert from the code
in balance_leaf responsible for pasting new content into existing items
that may have been shifted into new nodes in the tree.

It has not been reformatted yet.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/do_balan.c |  306 +++++++++++++++++++++++++------------------------
 1 file changed, 160 insertions(+), 146 deletions(-)

--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -804,6 +804,164 @@ static void balance_leaf_new_nodes_inser
 			}
 }
 
+static void balance_leaf_new_nodes_paste(struct tree_balance *tb,
+					 struct item_head *ih,
+					 const char *body,
+					 struct item_head *insert_key,
+					 struct buffer_head **insert_ptr,
+					 int i)
+{
+	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
+	int n = B_NR_ITEMS(tbS0);
+	struct buffer_info bi;
+			if (n - tb->snum[i] <= tb->item_pos) {	/* pasted item or part if it falls to S_new[i] */
+				if (tb->item_pos == n - tb->snum[i] && tb->sbytes[i] != -1) {	/* we must shift part of the appended item */
+					struct item_head *aux_ih;
+
+					RFALSE(ih, "PAP-12210: ih must be 0");
+
+					aux_ih = item_head(tbS0, tb->item_pos);
+					if (is_direntry_le_ih(aux_ih)) {
+						/* we append to directory item */
+
+						int entry_count;
+
+						entry_count = ih_entry_count(aux_ih);
+
+						if (entry_count - tb->sbytes[i] < tb->pos_in_item && tb->pos_in_item <= entry_count) {
+							/* new directory entry falls into S_new[i] */
+
+							RFALSE(!tb->insert_size[0], "PAP-12215: insert_size is already 0");
+							RFALSE(tb->sbytes[i] - 1 >= entry_count,
+							       "PAP-12220: there are no so much entries (%d), only %d",
+							       tb->sbytes[i] - 1, entry_count);
+
+							/* Shift snum[i]-1 items in whole. Shift sbytes[i] directory entries from directory item number snum[i] */
+							leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i], tb->sbytes[i] - 1, tb->S_new[i]);
+							/* Paste given directory entry to directory item */
+							buffer_info_init_bh(tb, &bi, tb->S_new[i]);
+							leaf_paste_in_buffer(&bi, 0, tb->pos_in_item - entry_count + tb->sbytes[i] - 1,
+							     tb->insert_size[0], body, tb->zeroes_num);
+							/* paste new directory entry */
+							leaf_paste_entries(&bi, 0, tb->pos_in_item - entry_count + tb->sbytes[i] - 1, 1,
+									   (struct reiserfs_de_head *) body,
+									   body + DEH_SIZE, tb->insert_size[0]);
+							tb->insert_size[0] = 0;
+							tb->pos_in_item++;
+						} else {	/* new directory entry doesn't fall into S_new[i] */
+							leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i], tb->sbytes[i], tb->S_new[i]);
+						}
+					} else {	/* regular object */
+
+						int n_shift, n_rem, r_zeroes_number;
+						const char *r_body;
+
+						RFALSE(tb->pos_in_item != ih_item_len(item_head(tbS0, tb->item_pos)) || tb->insert_size[0] <= 0,
+						       "PAP-12225: item too short or insert_size <= 0");
+
+						/* Calculate number of bytes which must be shifted from appended item */
+						n_shift = tb->sbytes[i] - tb->insert_size[0];
+						if (n_shift < 0)
+							n_shift = 0;
+						leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i], n_shift, tb->S_new[i]);
+
+						/* Calculate number of bytes which must remain in body after append to S_new[i] */
+						n_rem = tb->insert_size[0] - tb->sbytes[i];
+						if (n_rem < 0)
+							n_rem = 0;
+						/* Append part of body into S_new[0] */
+						buffer_info_init_bh(tb, &bi, tb->S_new[i]);
+						if (n_rem > tb->zeroes_num) {
+							r_zeroes_number = 0;
+							r_body = body + n_rem - tb->zeroes_num;
+						} else {
+							r_body = body;
+							r_zeroes_number = tb->zeroes_num - n_rem;
+							tb->zeroes_num -= r_zeroes_number;
+						}
+
+						leaf_paste_in_buffer(&bi, 0, n_shift,
+								     tb->insert_size[0] - n_rem,
+								     r_body, r_zeroes_number);
+						{
+							struct item_head *tmp;
+
+							tmp = item_head(tb->S_new[i], 0);
+							if (is_indirect_le_ih
+							    (tmp)) {
+								set_ih_free_space(tmp, 0);
+								set_le_ih_k_offset(tmp, le_ih_k_offset(tmp) + (n_rem << (tb->tb_sb->s_blocksize_bits - UNFM_P_SHIFT)));
+							} else {
+								set_le_ih_k_offset(tmp, le_ih_k_offset(tmp) + n_rem);
+							}
+						}
+
+						tb->insert_size[0] = n_rem;
+						if (!n_rem)
+							tb->pos_in_item++;
+					}
+				} else
+					/* item falls wholly into S_new[i] */
+				{
+					int leaf_mi;
+					struct item_head *pasted;
+
+#ifdef CONFIG_REISERFS_CHECK
+					struct item_head *ih_check = item_head(tbS0, tb->item_pos);
+
+					if (!is_direntry_le_ih(ih_check)
+					    && (tb->pos_in_item != ih_item_len(ih_check)
+						|| tb->insert_size[0] <= 0))
+						reiserfs_panic(tb->tb_sb,
+							     "PAP-12235",
+							     "pos_in_item "
+							     "must be equal "
+							     "to ih_item_len");
+#endif				/* CONFIG_REISERFS_CHECK */
+
+					leaf_mi = leaf_move_items(LEAF_FROM_S_TO_SNEW,
+							    tb, tb->snum[i],
+							    tb->sbytes[i],
+							    tb->S_new[i]);
+
+					RFALSE(leaf_mi,
+					       "PAP-12240: unexpected value returned by leaf_move_items (%d)",
+					       leaf_mi);
+
+					/* paste into item */
+					buffer_info_init_bh(tb, &bi, tb->S_new[i]);
+					leaf_paste_in_buffer(&bi,
+							     tb->item_pos - n + tb->snum[i],
+							     tb->pos_in_item,
+							     tb->insert_size[0],
+							     body, tb->zeroes_num);
+
+					pasted = item_head(tb->S_new[i], tb->item_pos - n + tb->snum[i]);
+					if (is_direntry_le_ih(pasted)) {
+						leaf_paste_entries(&bi,
+								   tb->item_pos - n + tb->snum[i],
+								   tb->pos_in_item, 1,
+								   (struct reiserfs_de_head *)body,
+								   body + DEH_SIZE,
+								   tb->insert_size[0]
+						    );
+					}
+
+					/* if we paste to indirect item update ih_free_space */
+					if (is_indirect_le_ih(pasted))
+						set_ih_free_space(pasted, 0);
+					tb->zeroes_num = tb->insert_size[0] = 0;
+				}
+			}
+
+			else {	/* pasted item doesn't fall into S_new[i] */
+
+				leaf_move_items(LEAF_FROM_S_TO_SNEW, tb,
+						tb->snum[i], tb->sbytes[i], tb->S_new[i]);
+			}
+
+}
+
 /**
  * balance_leaf - reiserfs tree balancing algorithm
  * @tb: tree balance state
@@ -953,152 +1111,8 @@ static int balance_leaf(struct tree_bala
 			break;
 
 		case M_PASTE:	/* append item */
-
-			if (n - tb->snum[i] <= tb->item_pos) {	/* pasted item or part if it falls to S_new[i] */
-				if (tb->item_pos == n - tb->snum[i] && tb->sbytes[i] != -1) {	/* we must shift part of the appended item */
-					struct item_head *aux_ih;
-
-					RFALSE(ih, "PAP-12210: ih must be 0");
-
-					aux_ih = item_head(tbS0, tb->item_pos);
-					if (is_direntry_le_ih(aux_ih)) {
-						/* we append to directory item */
-
-						int entry_count;
-
-						entry_count = ih_entry_count(aux_ih);
-
-						if (entry_count - tb->sbytes[i] < tb->pos_in_item && tb->pos_in_item <= entry_count) {
-							/* new directory entry falls into S_new[i] */
-
-							RFALSE(!tb->insert_size[0], "PAP-12215: insert_size is already 0");
-							RFALSE(tb->sbytes[i] - 1 >= entry_count,
-							       "PAP-12220: there are no so much entries (%d), only %d",
-							       tb->sbytes[i] - 1, entry_count);
-
-							/* Shift snum[i]-1 items in whole. Shift sbytes[i] directory entries from directory item number snum[i] */
-							leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i], tb->sbytes[i] - 1, tb->S_new[i]);
-							/* Paste given directory entry to directory item */
-							buffer_info_init_bh(tb, &bi, tb->S_new[i]);
-							leaf_paste_in_buffer(&bi, 0, tb->pos_in_item - entry_count + tb->sbytes[i] - 1,
-							     tb->insert_size[0], body, tb->zeroes_num);
-							/* paste new directory entry */
-							leaf_paste_entries(&bi, 0, tb->pos_in_item - entry_count + tb->sbytes[i] - 1, 1,
-									   (struct reiserfs_de_head *) body,
-									   body + DEH_SIZE, tb->insert_size[0]);
-							tb->insert_size[0] = 0;
-							tb->pos_in_item++;
-						} else {	/* new directory entry doesn't fall into S_new[i] */
-							leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i], tb->sbytes[i], tb->S_new[i]);
-						}
-					} else {	/* regular object */
-
-						int n_shift, n_rem, r_zeroes_number;
-						const char *r_body;
-
-						RFALSE(tb->pos_in_item != ih_item_len(item_head(tbS0, tb->item_pos)) || tb->insert_size[0] <= 0,
-						       "PAP-12225: item too short or insert_size <= 0");
-
-						/* Calculate number of bytes which must be shifted from appended item */
-						n_shift = tb->sbytes[i] - tb->insert_size[0];
-						if (n_shift < 0)
-							n_shift = 0;
-						leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i], n_shift, tb->S_new[i]);
-
-						/* Calculate number of bytes which must remain in body after append to S_new[i] */
-						n_rem = tb->insert_size[0] - tb->sbytes[i];
-						if (n_rem < 0)
-							n_rem = 0;
-						/* Append part of body into S_new[0] */
-						buffer_info_init_bh(tb, &bi, tb->S_new[i]);
-						if (n_rem > tb->zeroes_num) {
-							r_zeroes_number = 0;
-							r_body = body + n_rem - tb->zeroes_num;
-						} else {
-							r_body = body;
-							r_zeroes_number = tb->zeroes_num - n_rem;
-							tb->zeroes_num -= r_zeroes_number;
-						}
-
-						leaf_paste_in_buffer(&bi, 0, n_shift,
-								     tb->insert_size[0] - n_rem,
-								     r_body, r_zeroes_number);
-						{
-							struct item_head *tmp;
-
-							tmp = item_head(tb->S_new[i], 0);
-							if (is_indirect_le_ih
-							    (tmp)) {
-								set_ih_free_space(tmp, 0);
-								set_le_ih_k_offset(tmp, le_ih_k_offset(tmp) + (n_rem << (tb->tb_sb->s_blocksize_bits - UNFM_P_SHIFT)));
-							} else {
-								set_le_ih_k_offset(tmp, le_ih_k_offset(tmp) + n_rem);
-							}
-						}
-
-						tb->insert_size[0] = n_rem;
-						if (!n_rem)
-							tb->pos_in_item++;
-					}
-				} else
-					/* item falls wholly into S_new[i] */
-				{
-					int leaf_mi;
-					struct item_head *pasted;
-
-#ifdef CONFIG_REISERFS_CHECK
-					struct item_head *ih_check = item_head(tbS0, tb->item_pos);
-
-					if (!is_direntry_le_ih(ih_check)
-					    && (tb->pos_in_item != ih_item_len(ih_check)
-						|| tb->insert_size[0] <= 0))
-						reiserfs_panic(tb->tb_sb,
-							     "PAP-12235",
-							     "pos_in_item "
-							     "must be equal "
-							     "to ih_item_len");
-#endif				/* CONFIG_REISERFS_CHECK */
-
-					leaf_mi = leaf_move_items(LEAF_FROM_S_TO_SNEW,
-							    tb, tb->snum[i],
-							    tb->sbytes[i],
-							    tb->S_new[i]);
-
-					RFALSE(leaf_mi,
-					       "PAP-12240: unexpected value returned by leaf_move_items (%d)",
-					       leaf_mi);
-
-					/* paste into item */
-					buffer_info_init_bh(tb, &bi, tb->S_new[i]);
-					leaf_paste_in_buffer(&bi,
-							     tb->item_pos - n + tb->snum[i],
-							     tb->pos_in_item,
-							     tb->insert_size[0],
-							     body, tb->zeroes_num);
-
-					pasted = item_head(tb->S_new[i], tb->item_pos - n + tb->snum[i]);
-					if (is_direntry_le_ih(pasted)) {
-						leaf_paste_entries(&bi,
-								   tb->item_pos - n + tb->snum[i],
-								   tb->pos_in_item, 1,
-								   (struct reiserfs_de_head *)body,
-								   body + DEH_SIZE,
-								   tb->insert_size[0]
-						    );
-					}
-
-					/* if we paste to indirect item update ih_free_space */
-					if (is_indirect_le_ih(pasted))
-						set_ih_free_space(pasted, 0);
-					tb->zeroes_num = tb->insert_size[0] = 0;
-				}
-			}
-
-			else {	/* pasted item doesn't fall into S_new[i] */
-
-				leaf_move_items(LEAF_FROM_S_TO_SNEW, tb,
-						tb->snum[i], tb->sbytes[i], tb->S_new[i]);
-			}
+			balance_leaf_new_nodes_paste(tb, ih, body, insert_key,
+						     insert_ptr, i);
 			break;
 		default:	/* cases d and t */
 			reiserfs_panic(tb->tb_sb, "PAP-12245",


