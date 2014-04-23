From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 26/29] reiserfs: balance_leaf refactor, format balance_leaf_paste_right
Date: Wed, 23 Apr 2014 10:00:59 -0400
Message-ID: <20140423151150.962658899@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-balance_leaf-refactor-format-balance_leaf_paste_right
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

Break up balance_leaf_paste_right into:
balance_leaf_paste_right_shift
balance_leaf_paste_right_shift_dirent
balance_leaf_paste_right_whole

and keep balance_leaf_paste_right as a handler to select which is appropriate.

Also reformat to adhere to CodingStyle.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/do_balan.c |  300 +++++++++++++++++++++++++++----------------------
 1 file changed, 170 insertions(+), 130 deletions(-)

--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -706,155 +706,197 @@ static void balance_leaf_insert_right(st
 	}
 }
 
-static void balance_leaf_paste_right(struct tree_balance *tb,
+
+static void balance_leaf_paste_right_shift_dirent(struct tree_balance *tb,
 				     struct item_head *ih, const char *body)
 {
 	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
-	int n = B_NR_ITEMS(tbS0);
 	struct buffer_info bi;
-	int ret_val;
-
-			if (n - tb->rnum[0] <= tb->item_pos) {	/* pasted item or part of it falls to R[0] */
-				if (tb->item_pos == n - tb->rnum[0] && tb->rbytes != -1) {	/* we must shift the part of the appended item */
-					if (is_direntry_le_ih(item_head(tbS0, tb->item_pos))) {	/* we append to directory item */
-						int entry_count;
-
-						RFALSE(tb->zeroes_num,
-						       "PAP-12145: invalid parameter in case of a directory");
-						entry_count = ih_entry_count(item_head
-								  (tbS0, tb->item_pos));
-						if (entry_count - tb->rbytes <
-						    tb->pos_in_item)
-							/* new directory entry falls into R[0] */
-						{
-							int paste_entry_position;
-
-							RFALSE(tb->rbytes - 1 >= entry_count || !tb-> insert_size[0],
-							       "PAP-12150: no enough of entries to shift to R[0]: rbytes=%d, entry_count=%d",
-							       tb->rbytes, entry_count);
-							/* Shift rnum[0]-1 items in whole. Shift rbytes-1 directory entries from directory item number rnum[0] */
-							leaf_shift_right(tb, tb->rnum[0], tb->rbytes - 1);
-							/* Paste given directory entry to directory item */
-							paste_entry_position = tb->pos_in_item - entry_count + tb->rbytes - 1;
-							buffer_info_init_right(tb, &bi);
-							leaf_paste_in_buffer(&bi, 0, paste_entry_position, tb->insert_size[0], body, tb->zeroes_num);
-							/* paste entry */
-							leaf_paste_entries(&bi, 0, paste_entry_position, 1,
-									   (struct reiserfs_de_head *) body,
-									   body + DEH_SIZE, tb->insert_size[0]);
+	int entry_count;
 
-							if (paste_entry_position == 0) {
-								/* change delimiting keys */
-								replace_key(tb, tb->CFR[0], tb->rkey[0], tb->R[0],0);
-							}
-
-							tb->insert_size[0] = 0;
-							tb->pos_in_item++;
-						} else {	/* new directory entry doesn't fall into R[0] */
+	RFALSE(zeroes_num,
+	       "PAP-12145: invalid parameter in case of a directory");
+	entry_count = ih_entry_count(item_head(tbS0, tb->item_pos));
+
+	/* new directory entry falls into R[0] */
+	if (entry_count - tb->rbytes < tb->pos_in_item) {
+		int paste_entry_position;
+
+		RFALSE(tb->rbytes - 1 >= entry_count || !tb->insert_size[0],
+		       "PAP-12150: no enough of entries to shift to R[0]: "
+		       "rbytes=%d, entry_count=%d", tb->rbytes, entry_count);
+
+		/*
+		 * Shift rnum[0]-1 items in whole.
+		 * Shift rbytes-1 directory entries from directory
+		 * item number rnum[0]
+		 */
+		leaf_shift_right(tb, tb->rnum[0], tb->rbytes - 1);
+
+		/* Paste given directory entry to directory item */
+		paste_entry_position = tb->pos_in_item - entry_count +
+				       tb->rbytes - 1;
+		buffer_info_init_right(tb, &bi);
+		leaf_paste_in_buffer(&bi, 0, paste_entry_position,
+				     tb->insert_size[0], body, tb->zeroes_num);
+
+		/* paste entry */
+		leaf_paste_entries(&bi, 0, paste_entry_position, 1,
+				   (struct reiserfs_de_head *) body,
+				   body + DEH_SIZE, tb->insert_size[0]);
+
+		/* change delimiting keys */
+		if (paste_entry_position == 0)
+			replace_key(tb, tb->CFR[0], tb->rkey[0], tb->R[0], 0);
+
+		tb->insert_size[0] = 0;
+		tb->pos_in_item++;
+	} else {
+		/* new directory entry doesn't fall into R[0] */
+		leaf_shift_right(tb, tb->rnum[0], tb->rbytes);
+	}
+}
 
-							leaf_shift_right(tb, tb->rnum[0], tb->rbytes);
-						}
-					} else {	/* regular object */
+static void balance_leaf_paste_right_shift(struct tree_balance *tb,
+				     struct item_head *ih, const char *body)
+{
+	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
+	int n_shift, n_rem, r_zeroes_number, version;
+	unsigned long temp_rem;
+	const char *r_body;
+	struct buffer_info bi;
 
-						int n_shift, n_rem, r_zeroes_number;
-						const char *r_body;
+	/* we append to directory item */
+	if (is_direntry_le_ih(item_head(tbS0, tb->item_pos))) {
+		balance_leaf_paste_right_shift_dirent(tb, ih, body);
+		return;
+	}
 
-						/* Calculate number of bytes which must be shifted from appended item */
-						if ((n_shift = tb->rbytes - tb->insert_size[0]) < 0)
-							n_shift = 0;
+	/* regular object */
 
-						RFALSE(tb->pos_in_item != ih_item_len
-						       (item_head(tbS0, tb->item_pos)),
-						       "PAP-12155: invalid position to paste. ih_item_len=%d, pos_in_item=%d",
-						       tb->pos_in_item, ih_item_len
-						       (item_head(tbS0, tb->item_pos)));
-
-						leaf_shift_right(tb, tb->rnum[0], n_shift);
-						/* Calculate number of bytes which must remain in body after appending to R[0] */
-						if ((n_rem = tb->insert_size[0] - tb->rbytes) < 0)
-							n_rem = 0;
+	/*
+	 * Calculate number of bytes which must be shifted
+	 * from appended item
+	 */
+	n_shift = tb->rbytes - tb->insert_size[0];
+	if (n_shift < 0)
+		n_shift = 0;
+
+	RFALSE(pos_in_item != ih_item_len(item_head(tbS0, item_pos)),
+	       "PAP-12155: invalid position to paste. ih_item_len=%d, "
+	       "pos_in_item=%d", pos_in_item,
+	       ih_item_len(item_head(tbS0, item_pos)));
+
+	leaf_shift_right(tb, tb->rnum[0], n_shift);
+
+	/*
+	 * Calculate number of bytes which must remain in body
+	 * after appending to R[0]
+	 */
+	n_rem = tb->insert_size[0] - tb->rbytes;
+	if (n_rem < 0)
+		n_rem = 0;
+
+	temp_rem = n_rem;
+
+	version = ih_version(item_head(tb->R[0], 0));
+
+	if (is_indirect_le_key(version, leaf_key(tb->R[0], 0))) {
+		int shift = tb->tb_sb->s_blocksize_bits - UNFM_P_SHIFT;
+		temp_rem = n_rem << shift;
+	}
 
-						{
-							int version;
-							unsigned long temp_rem = n_rem;
+	add_le_key_k_offset(version, leaf_key(tb->R[0], 0), temp_rem);
+	add_le_key_k_offset(version, internal_key(tb->CFR[0], tb->rkey[0]),
+			    temp_rem);
+
+	do_balance_mark_internal_dirty(tb, tb->CFR[0], 0);
+
+	/* Append part of body into R[0] */
+	buffer_info_init_right(tb, &bi);
+	if (n_rem > tb->zeroes_num) {
+		r_zeroes_number = 0;
+		r_body = body + n_rem - tb->zeroes_num;
+	} else {
+		r_body = body;
+		r_zeroes_number = tb->zeroes_num - n_rem;
+		tb->zeroes_num -= r_zeroes_number;
+	}
 
-							version = ih_version(item_head(tb->R[0], 0));
-							if (is_indirect_le_key(version, leaf_key(tb->R[0], 0))) {
-								temp_rem = n_rem << (tb->tb_sb->s_blocksize_bits - UNFM_P_SHIFT);
-							}
-							set_le_key_k_offset(version, leaf_key(tb->R[0], 0),
-							     le_key_k_offset(version, leaf_key(tb->R[0], 0)) + temp_rem);
-							set_le_key_k_offset(version, internal_key(tb->CFR[0], tb->rkey[0]),
-							     le_key_k_offset(version, internal_key(tb->CFR[0], tb->rkey[0])) + temp_rem);
-						}
-/*		  k_offset (leaf_key(tb->R[0],0)) += n_rem;
-		  k_offset (internal_key(tb->CFR[0],tb->rkey[0])) += n_rem;*/
-						do_balance_mark_internal_dirty(tb, tb->CFR[0], 0);
+	leaf_paste_in_buffer(&bi, 0, n_shift, tb->insert_size[0] - n_rem,
+			     r_body, r_zeroes_number);
 
-						/* Append part of body into R[0] */
-						buffer_info_init_right(tb, &bi);
-						if (n_rem > tb->zeroes_num) {
-							r_zeroes_number = 0;
-							r_body = body + n_rem - tb->zeroes_num;
-						} else {
-							r_body = body;
-							r_zeroes_number = tb->zeroes_num - n_rem;
-							tb->zeroes_num -= r_zeroes_number;
-						}
+	if (is_indirect_le_ih(item_head(tb->R[0], 0)))
+		set_ih_free_space(item_head(tb->R[0], 0), 0);
 
-						leaf_paste_in_buffer(&bi, 0, n_shift,
-								     tb->insert_size[0] - n_rem,
-								     r_body, r_zeroes_number);
+	tb->insert_size[0] = n_rem;
+	if (!n_rem)
+		tb->pos_in_item++;
+}
 
-						if (is_indirect_le_ih(item_head(tb->R[0], 0))) {
-#if 0
-							RFALSE(n_rem,
-							       "PAP-12160: paste more than one unformatted node pointer");
-#endif
-							set_ih_free_space(item_head(tb->R[0], 0), 0);
-						}
-						tb->insert_size[0] = n_rem;
-						if (!n_rem)
-							tb->pos_in_item++;
-					}
-				} else {	/* pasted item in whole falls into R[0] */
+static void balance_leaf_paste_right_whole(struct tree_balance *tb,
+				     struct item_head *ih, const char *body)
+{
+	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
+	int n = B_NR_ITEMS(tbS0);
+	struct item_head *pasted;
+	struct buffer_info bi;
 
-					struct item_head *pasted;
+							buffer_info_init_right(tb, &bi);
+	leaf_shift_right(tb, tb->rnum[0], tb->rbytes);
 
-					ret_val = leaf_shift_right(tb, tb->rnum[0], tb->rbytes);
-					/* append item in R[0] */
-					if (tb->pos_in_item >= 0) {
-						buffer_info_init_right(tb, &bi);
-						leaf_paste_in_buffer(&bi, tb->item_pos - n + tb->rnum[0], tb->pos_in_item,
-								     tb->insert_size[0], body, tb->zeroes_num);
-					}
+	/* append item in R[0] */
+	if (tb->pos_in_item >= 0) {
+		buffer_info_init_right(tb, &bi);
+		leaf_paste_in_buffer(&bi, tb->item_pos - n + tb->rnum[0],
+				     tb->pos_in_item, tb->insert_size[0], body,
+				     tb->zeroes_num);
+	}
 
-					/* paste new entry, if item is directory item */
-					pasted = item_head(tb->R[0], tb->item_pos - n + tb->rnum[0]);
-					if (is_direntry_le_ih(pasted) && tb->pos_in_item >= 0) {
-						leaf_paste_entries(&bi, tb->item_pos - n + tb->rnum[0],
-								   tb->pos_in_item, 1,
-								   (struct reiserfs_de_head *) body,
-								   body + DEH_SIZE, tb->insert_size[0]);
-						if (!tb->pos_in_item) {
+	/* paste new entry, if item is directory item */
+	pasted = item_head(tb->R[0], tb->item_pos - n + tb->rnum[0]);
+	if (is_direntry_le_ih(pasted) && tb->pos_in_item >= 0) {
+		leaf_paste_entries(&bi, tb->item_pos - n + tb->rnum[0],
+				   tb->pos_in_item, 1,
+				   (struct reiserfs_de_head *)body,
+				   body + DEH_SIZE, tb->insert_size[0]);
+
+		if (!tb->pos_in_item) {
+
+			RFALSE(tb->item_pos - n + tb->rnum[0],
+			       "PAP-12165: directory item must be first "
+			       "item of node when pasting is in 0th position");
+
+			/* update delimiting keys */
+			replace_key(tb, tb->CFR[0], tb->rkey[0], tb->R[0], 0);
+		}
+	}
 
-							RFALSE(tb->item_pos - n + tb->rnum[0],
-							       "PAP-12165: directory item must be first item of node when pasting is in 0th position");
+	if (is_indirect_le_ih(pasted))
+		set_ih_free_space(pasted, 0);
+	tb->zeroes_num = tb->insert_size[0] = 0;
+}
 
-							/* update delimiting keys */
-							replace_key(tb, tb->CFR[0], tb->rkey[0], tb->R[0], 0);
-						}
-					}
+static void balance_leaf_paste_right(struct tree_balance *tb,
+				     struct item_head *ih, const char *body)
+{
+	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
+	int n = B_NR_ITEMS(tbS0);
 
-					if (is_indirect_le_ih(pasted))
-						set_ih_free_space(pasted, 0);
-					tb->zeroes_num = tb->insert_size[0] = 0;
-				}
-			} else {	/* new item doesn't fall into R[0] */
+	/* new item doesn't fall into R[0] */
+	if (n - tb->rnum[0] > tb->item_pos) {
+		leaf_shift_right(tb, tb->rnum[0], tb->rbytes);
+		return;
+	}
 
-				leaf_shift_right(tb, tb->rnum[0], tb->rbytes);
-			}
+	/* pasted item or part of it falls to R[0] */
 
+	if (tb->item_pos == n - tb->rnum[0] && tb->rbytes != -1)
+		/* we must shift the part of the appended item */
+		balance_leaf_paste_right_shift(tb, ih, body);
+	else
+		/* pasted item in whole falls into R[0] */
+		balance_leaf_paste_right_whole(tb, ih, body);
 }
 
 /* shift rnum[0] items from S[0] to the right neighbor R[0] */
@@ -870,7 +912,6 @@ static void balance_leaf_right(struct tr
 		balance_leaf_insert_right(tb, ih, body);
 	else /* M_PASTE */
 		balance_leaf_paste_right(tb, ih, body);
-
 }
 
 static void balance_leaf_new_nodes_insert(struct tree_balance *tb,
@@ -1083,8 +1124,7 @@ static void balance_leaf_new_nodes_paste
 								   tb->pos_in_item, 1,
 								   (struct reiserfs_de_head *)body,
 								   body + DEH_SIZE,
-								   tb->insert_size[0]
-						    );
+								   tb->insert_size[0]);
 					}
 
 					/* if we paste to indirect item update ih_free_space */


