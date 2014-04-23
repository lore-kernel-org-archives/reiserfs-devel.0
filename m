From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 27/29] reiserfs: balance_leaf refactor, format balance_leaf_new_nodes_paste
Date: Wed, 23 Apr 2014 10:01:00 -0400
Message-ID: <20140423151151.108620496@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-balance_leaf-refactor-format-balance_leaf_new_nodes_paste
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

Break up balance_leaf_paste_new_nodes into:
balance_leaf_paste_new_nodes_shift
balance_leaf_paste_new_nodes_shift_dirent
balance_leaf_paste_new_nodes_whole

and keep balance_leaf_paste_new_nodes as a handler to select which
is appropriate.

Also reformat to adhere to CodingStyle.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/do_balan.c |  498 +++++++++++++++++++++++++++----------------------
 1 file changed, 282 insertions(+), 216 deletions(-)

--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -714,7 +714,7 @@ static void balance_leaf_paste_right_shi
 	struct buffer_info bi;
 	int entry_count;
 
-	RFALSE(zeroes_num,
+	RFALSE(tb->zeroes_num,
 	       "PAP-12145: invalid parameter in case of a directory");
 	entry_count = ih_entry_count(item_head(tbS0, tb->item_pos));
 
@@ -782,10 +782,10 @@ static void balance_leaf_paste_right_shi
 	if (n_shift < 0)
 		n_shift = 0;
 
-	RFALSE(pos_in_item != ih_item_len(item_head(tbS0, item_pos)),
+	RFALSE(tb->pos_in_item != ih_item_len(item_head(tbS0, tb->item_pos)),
 	       "PAP-12155: invalid position to paste. ih_item_len=%d, "
-	       "pos_in_item=%d", pos_in_item,
-	       ih_item_len(item_head(tbS0, item_pos)));
+	       "pos_in_item=%d", tb->pos_in_item,
+	       ih_item_len(item_head(tbS0, tb->item_pos)));
 
 	leaf_shift_right(tb, tb->rnum[0], n_shift);
 
@@ -924,68 +924,144 @@ static void balance_leaf_new_nodes_inser
 	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
 	int n = B_NR_ITEMS(tbS0);
 	struct buffer_info bi;
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
+	int shift;
+
+	/* new item or it part don't falls into S_new[i] */
+	if (n - tb->snum[i] >= tb->item_pos) {
+		leaf_move_items(LEAF_FROM_S_TO_SNEW, tb,
+				tb->snum[i], tb->sbytes[i], tb->S_new[i]);
+		return;
+	}
+
+	/* new item or it's part falls to first new node S_new[i] */
+
+	/* part of new item falls into S_new[i] */
+	if (tb->item_pos == n - tb->snum[i] + 1 && tb->sbytes[i] != -1) {
+		int old_key_comp, old_len, r_zeroes_number;
+		const char *r_body;
+		int version;
+
+		/* Move snum[i]-1 items from S[0] to S_new[i] */
+		leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i] - 1, -1,
+				tb->S_new[i]);
+
+		/* Remember key component and item length */
+		version = ih_version(ih);
+		old_key_comp = le_ih_k_offset(ih);
+		old_len = ih_item_len(ih);
+
+		/*
+		 * Calculate key component and item length to insert
+		 * into S_new[i]
+		 */
+		shift = 0;
+		if (is_indirect_le_ih(ih))
+			shift = tb->tb_sb->s_blocksize_bits - UNFM_P_SHIFT;
+		set_le_ih_k_offset(ih,
+				   le_ih_k_offset(ih) +
+				   ((old_len - tb->sbytes[i]) << shift));
+
+		put_ih_item_len(ih, tb->sbytes[i]);
+
+		/* Insert part of the item into S_new[i] before 0-th item */
+		buffer_info_init_bh(tb, &bi, tb->S_new[i]);
+
+		if ((old_len - tb->sbytes[i]) > tb->zeroes_num) {
+			r_zeroes_number = 0;
+			r_body = body + (old_len - tb->sbytes[i]) -
+					 tb->zeroes_num;
+		} else {
+			r_body = body;
+			r_zeroes_number = tb->zeroes_num - (old_len -
+					  tb->sbytes[i]);
+			tb->zeroes_num -= r_zeroes_number;
+		}
+
+		leaf_insert_into_buf(&bi, 0, ih, r_body, r_zeroes_number);
+
+		/*
+		 * Calculate key component and item length to
+		 * insert into S[i]
+		 */
+		set_le_ih_k_offset(ih, old_key_comp);
+		put_ih_item_len(ih, old_len - tb->sbytes[i]);
+		tb->insert_size[0] -= tb->sbytes[i];
+	} else {
+		/* whole new item falls into S_new[i] */
+
+		/*
+		 * Shift snum[0] - 1 items to S_new[i]
+		 * (sbytes[i] of split item)
+		 */
+		leaf_move_items(LEAF_FROM_S_TO_SNEW, tb,
+				tb->snum[i] - 1, tb->sbytes[i], tb->S_new[i]);
+
+		/* Insert new item into S_new[i] */
+		buffer_info_init_bh(tb, &bi, tb->S_new[i]);
+		leaf_insert_into_buf(&bi, tb->item_pos - n + tb->snum[i] - 1,
+				     ih, body, tb->zeroes_num);
+
+		tb->zeroes_num = tb->insert_size[0] = 0;
+	}
 }
 
-static void balance_leaf_new_nodes_paste(struct tree_balance *tb,
+/* we append to directory item */
+static void balance_leaf_new_nodes_paste_dirent(struct tree_balance *tb,
+					 struct item_head *ih,
+					 const char *body,
+					 struct item_head *insert_key,
+					 struct buffer_head **insert_ptr,
+					 int i)
+{
+	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
+	struct item_head *aux_ih = item_head(tbS0, tb->item_pos);
+	int entry_count = ih_entry_count(aux_ih);
+	struct buffer_info bi;
+
+	if (entry_count - tb->sbytes[i] < tb->pos_in_item &&
+	    tb->pos_in_item <= entry_count) {
+		/* new directory entry falls into S_new[i] */
+
+		RFALSE(!tb->insert_size[0],
+		       "PAP-12215: insert_size is already 0");
+		RFALSE(tb->sbytes[i] - 1 >= entry_count,
+		       "PAP-12220: there are no so much entries (%d), only %d",
+		       tb->sbytes[i] - 1, entry_count);
+
+		/*
+		 * Shift snum[i]-1 items in whole.
+		 * Shift sbytes[i] directory entries
+		 * from directory item number snum[i]
+		 */
+		leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i],
+				tb->sbytes[i] - 1, tb->S_new[i]);
+
+		/*
+		 * Paste given directory entry to
+		 * directory item
+		 */
+		buffer_info_init_bh(tb, &bi, tb->S_new[i]);
+		leaf_paste_in_buffer(&bi, 0, tb->pos_in_item - entry_count +
+				     tb->sbytes[i] - 1, tb->insert_size[0],
+				     body, tb->zeroes_num);
+
+		/* paste new directory entry */
+		leaf_paste_entries(&bi, 0, tb->pos_in_item - entry_count +
+				   tb->sbytes[i] - 1, 1,
+				   (struct reiserfs_de_head *) body,
+				   body + DEH_SIZE, tb->insert_size[0]);
+
+		tb->insert_size[0] = 0;
+		tb->pos_in_item++;
+	} else {
+		/* new directory entry doesn't fall into S_new[i] */
+		leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i],
+				tb->sbytes[i], tb->S_new[i]);
+	}
+
+}
+
+static void balance_leaf_new_nodes_paste_shift(struct tree_balance *tb,
 					 struct item_head *ih,
 					 const char *body,
 					 struct item_head *insert_key,
@@ -993,154 +1069,152 @@ static void balance_leaf_new_nodes_paste
 					 int i)
 {
 	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
+	struct item_head *aux_ih = item_head(tbS0, tb->item_pos);
+	int n_shift, n_rem, r_zeroes_number, shift;
+	const char *r_body;
+	struct item_head *tmp;
+	struct buffer_info bi;
+
+	RFALSE(ih, "PAP-12210: ih must be 0");
+
+	if (is_direntry_le_ih(aux_ih)) {
+		balance_leaf_new_nodes_paste_dirent(tb, ih, body, insert_key,
+						    insert_ptr, i);
+		return;
+	}
+
+	/* regular object */
+
+
+	RFALSE(tb->pos_in_item != ih_item_len(item_head(tbS0, tb->item_pos)) ||
+	       tb->insert_size[0] <= 0,
+	       "PAP-12225: item too short or insert_size <= 0");
+
+	/*
+	 * Calculate number of bytes which must be shifted from appended item
+	 */
+	n_shift = tb->sbytes[i] - tb->insert_size[0];
+	if (n_shift < 0)
+		n_shift = 0;
+	leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i], n_shift,
+			tb->S_new[i]);
+
+	/*
+	 * Calculate number of bytes which must remain in body after
+	 * append to S_new[i]
+	 */
+	n_rem = tb->insert_size[0] - tb->sbytes[i];
+	if (n_rem < 0)
+		n_rem = 0;
+
+	/* Append part of body into S_new[0] */
+	buffer_info_init_bh(tb, &bi, tb->S_new[i]);
+	if (n_rem > tb->zeroes_num) {
+		r_zeroes_number = 0;
+		r_body = body + n_rem - tb->zeroes_num;
+	} else {
+		r_body = body;
+		r_zeroes_number = tb->zeroes_num - n_rem;
+		tb->zeroes_num -= r_zeroes_number;
+	}
+
+	leaf_paste_in_buffer(&bi, 0, n_shift, tb->insert_size[0] - n_rem,
+			     r_body, r_zeroes_number);
+
+	tmp = item_head(tb->S_new[i], 0);
+	shift = 0;
+	if (is_indirect_le_ih(tmp)) {
+		set_ih_free_space(tmp, 0);
+		shift = tb->tb_sb->s_blocksize_bits - UNFM_P_SHIFT;
+	}
+	add_le_ih_k_offset(tmp, n_rem << shift);
+
+	tb->insert_size[0] = n_rem;
+	if (!n_rem)
+		tb->pos_in_item++;
+}
+
+static void balance_leaf_new_nodes_paste_whole(struct tree_balance *tb,
+					       struct item_head *ih,
+					       const char *body,
+					       struct item_head *insert_key,
+					       struct buffer_head **insert_ptr,
+					       int i)
+
+{
+	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
 	int n = B_NR_ITEMS(tbS0);
+	int leaf_mi;
+	struct item_head *pasted;
 	struct buffer_info bi;
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
 
 #ifdef CONFIG_REISERFS_CHECK
-					struct item_head *ih_check = item_head(tbS0, tb->item_pos);
+	struct item_head *ih_check = item_head(tbS0, tb->item_pos);
 
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
-								   tb->insert_size[0]);
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
+	if (!is_direntry_le_ih(ih_check) &&
+	    (tb->pos_in_item != ih_item_len(ih_check) ||
+	    tb->insert_size[0] <= 0))
+		reiserfs_panic(tb->tb_sb,
+			     "PAP-12235",
+			     "pos_in_item must be equal to ih_item_len");
+#endif
+
+	leaf_mi = leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i],
+				  tb->sbytes[i], tb->S_new[i]);
+
+	RFALSE(leaf_mi,
+	       "PAP-12240: unexpected value returned by leaf_move_items (%d)",
+	       leaf_mi);
+
+	/* paste into item */
+	buffer_info_init_bh(tb, &bi, tb->S_new[i]);
+	leaf_paste_in_buffer(&bi, tb->item_pos - n + tb->snum[i],
+			     tb->pos_in_item, tb->insert_size[0],
+			     body, tb->zeroes_num);
+
+	pasted = item_head(tb->S_new[i], tb->item_pos - n +
+			   tb->snum[i]);
+	if (is_direntry_le_ih(pasted))
+		leaf_paste_entries(&bi, tb->item_pos - n + tb->snum[i],
+				   tb->pos_in_item, 1,
+				   (struct reiserfs_de_head *)body,
+				   body + DEH_SIZE, tb->insert_size[0]);
+
+	/* if we paste to indirect item update ih_free_space */
+	if (is_indirect_le_ih(pasted))
+		set_ih_free_space(pasted, 0);
+
+	tb->zeroes_num = tb->insert_size[0] = 0;
 
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
+
+	/* pasted item doesn't fall into S_new[i] */
+	if (n - tb->snum[i] > tb->item_pos) {
+		leaf_move_items(LEAF_FROM_S_TO_SNEW, tb,
+				tb->snum[i], tb->sbytes[i], tb->S_new[i]);
+		return;
+	}
+
+	/* pasted item or part if it falls to S_new[i] */
+
+	if (tb->item_pos == n - tb->snum[i] && tb->sbytes[i] != -1)
+		/* we must shift part of the appended item */
+		balance_leaf_new_nodes_paste_shift(tb, ih, body, insert_key,
+						   insert_ptr, i);
+	else
+		/* item falls wholly into S_new[i] */
+		balance_leaf_new_nodes_paste_whole(tb, ih, body, insert_key,
+						   insert_ptr, i);
+}
 
 /* Fill new nodes that appear in place of S[0] */
 static void balance_leaf_new_nodes(struct tree_balance *tb,
@@ -1152,6 +1226,7 @@ static void balance_leaf_new_nodes(struc
 {
 	int i;
 	for (i = tb->blknum[0] - 2; i >= 0; i--) {
+		BUG_ON(flag != M_INSERT && flag != M_PASTE);
 
 		RFALSE(!tb->snum[i],
 		       "PAP-12200: snum[%d] == %d. Must be > 0", i,
@@ -1164,21 +1239,12 @@ static void balance_leaf_new_nodes(struc
 		/* initialized block type and tree level */
 		set_blkh_level(B_BLK_HEAD(tb->S_new[i]), DISK_LEAF_NODE_LEVEL);
 
-		switch (flag) {
-		case M_INSERT:	/* insert item */
+		if (flag == M_INSERT)
 			balance_leaf_new_nodes_insert(tb, ih, body, insert_key,
 						      insert_ptr, i);
-			break;
-
-		case M_PASTE:	/* append item */
+		else /* M_PASTE */
 			balance_leaf_new_nodes_paste(tb, ih, body, insert_key,
 						     insert_ptr, i);
-			break;
-		default:	/* cases d and t */
-			reiserfs_panic(tb->tb_sb, "PAP-12245",
-				       "blknum > 2: unexpected mode: %s(%d)",
-				       (flag == M_DELETE) ? "DELETE" : ((flag == M_CUT) ? "CUT" : "UNKNOWN"), flag);
-		}
 
 		memcpy(insert_key + i, leaf_key(tb->S_new[i], 0), KEY_SIZE);
 		insert_ptr[i] = tb->S_new[i];


