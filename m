From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 13/29] reiserfs: balance_leaf refactor, move state variables into tree_balance
Date: Wed, 23 Apr 2014 10:00:46 -0400
Message-ID: <20140423151140.814053822@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-balance_leaf-refactor-move-state-variables-into-tree_balance
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

This patch pushes the rest of the state variables in balance_leaf into
the tree_balance structure so we can use them when we split balance_leaf
into separate functions.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/do_balan.c |  391 +++++++++++++++++++++++--------------------------
 fs/reiserfs/fix_node.c |    9 -
 fs/reiserfs/prints.c   |    6 
 fs/reiserfs/reiserfs.h |   30 ++-
 4 files changed, 214 insertions(+), 222 deletions(-)

--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -310,27 +310,9 @@ static int balance_leaf(struct tree_bala
 			struct buffer_head **insert_ptr)
 {
 	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
-	/* index into the array of item headers in S[0] of the affected item */
-	int item_pos = PATH_LAST_POSITION(tb->tb_path);
 	struct buffer_info bi;
-	/* new nodes allocated to hold what could not fit into S */
-	struct buffer_head *S_new[2];
-	/*
-	 * number of items that will be placed into S_new
-	 * (includes partially shifted items)
-	 */
-	int snum[2];
-	/*
-	 * if an item is partially shifted into S_new then if it is a
-	 * directory item it is the number of entries from the item that
-	 * are shifted into S_new else it is the number of bytes from
-	 * the item that are shifted into S_new
-	 */
-	int sbytes[2];
 	int n, i;
 	int ret_val;
-	int pos_in_item;
-	int zeros_num;
 
 	PROC_INFO_INC(tb->tb_sb, balance_at[0]);
 
@@ -338,29 +320,30 @@ static int balance_leaf(struct tree_bala
 	if (tb->insert_size[0] < 0)
 		return balance_leaf_when_delete(tb, flag);
 
-	zeros_num = 0;
+	tb->item_pos = PATH_LAST_POSITION(tb->tb_path),
+	tb->pos_in_item = tb->tb_path->pos_in_item,
+	tb->zeroes_num = 0;
 	if (flag == M_INSERT && !body)
-		zeros_num = ih_item_len(ih);
+		tb->zeroes_num = ih_item_len(ih);
 
-	pos_in_item = tb->tb_path->pos_in_item;
 	/*
 	 * for indirect item pos_in_item is measured in unformatted node
 	 * pointers. Recalculate to bytes
 	 */
 	if (flag != M_INSERT
-	    && is_indirect_le_ih(item_head(tbS0, item_pos)))
-		pos_in_item *= UNFM_P_SIZE;
+	    && is_indirect_le_ih(item_head(tbS0, tb->item_pos)))
+		tb->pos_in_item *= UNFM_P_SIZE;
 
 	if (tb->lnum[0] > 0) {
 		/* Shift lnum[0] items from S[0] to the left neighbor L[0] */
-		if (item_pos < tb->lnum[0]) {
+		if (tb->item_pos < tb->lnum[0]) {
 			/* new item or it part falls to L[0], shift it too */
 			n = B_NR_ITEMS(tb->L[0]);
 
 			switch (flag) {
 			case M_INSERT:	/* insert item into L[0] */
 
-				if (item_pos == tb->lnum[0] - 1 && tb->lbytes != -1) {
+				if (tb->item_pos == tb->lnum[0] - 1 && tb->lbytes != -1) {
 					/* part of new item falls into L[0] */
 					int new_item_len;
 					int version;
@@ -379,8 +362,8 @@ static int balance_leaf(struct tree_bala
 					/* Insert new item into L[0] */
 					buffer_info_init_left(tb, &bi);
 					leaf_insert_into_buf(&bi,
-							n + item_pos - ret_val, ih, body,
-							zeros_num > ih_item_len(ih) ? ih_item_len(ih) : zeros_num);
+							n + tb->item_pos - ret_val, ih, body,
+							tb->zeroes_num > ih_item_len(ih) ? ih_item_len(ih) : tb->zeroes_num);
 
 					version = ih_version(ih);
 
@@ -389,11 +372,11 @@ static int balance_leaf(struct tree_bala
 							(tb-> lbytes << (is_indirect_le_ih(ih) ? tb->tb_sb-> s_blocksize_bits - UNFM_P_SHIFT : 0)));
 
 					put_ih_item_len(ih, new_item_len);
-					if (tb->lbytes > zeros_num) {
-						body += (tb->lbytes - zeros_num);
-						zeros_num = 0;
+					if (tb->lbytes > tb->zeroes_num) {
+						body += (tb->lbytes - tb->zeroes_num);
+						tb->zeroes_num = 0;
 					} else
-						zeros_num -= tb->lbytes;
+						tb->zeroes_num -= tb->lbytes;
 
 					RFALSE(ih_item_len(ih) <= 0,
 					       "PAP-12085: there is nothing to insert into S[0]: ih_item_len=%d",
@@ -404,43 +387,43 @@ static int balance_leaf(struct tree_bala
 					ret_val = leaf_shift_left(tb, tb->lnum[0] - 1, tb->lbytes);
 					/* Insert new item into L[0] */
 					buffer_info_init_left(tb, &bi);
-					leaf_insert_into_buf(&bi, n + item_pos - ret_val, ih, body, zeros_num);
+					leaf_insert_into_buf(&bi, n + tb->item_pos - ret_val, ih, body, tb->zeroes_num);
 					tb->insert_size[0] = 0;
-					zeros_num = 0;
+					tb->zeroes_num = 0;
 				}
 				break;
 
 			case M_PASTE:	/* append item in L[0] */
 
-				if (item_pos == tb->lnum[0] - 1 && tb->lbytes != -1) {
+				if (tb->item_pos == tb->lnum[0] - 1 && tb->lbytes != -1) {
 					/* we must shift the part of the appended item */
-					if (is_direntry_le_ih(item_head(tbS0, item_pos))) {
+					if (is_direntry_le_ih(item_head(tbS0, tb->item_pos))) {
 
-						RFALSE(zeros_num,
+						RFALSE(tb->zeroes_num,
 						       "PAP-12090: invalid parameter in case of a directory");
 						/* directory item */
-						if (tb->lbytes > pos_in_item) {
+						if (tb->lbytes > tb->pos_in_item) {
 							/* new directory entry falls into L[0] */
 							struct item_head *pasted;
-							int l_pos_in_item = pos_in_item;
+							int l_pos_in_item = tb->pos_in_item;
 
 							/* Shift lnum[0] - 1 items in whole. Shift lbytes - 1 entries from given directory item */
 							ret_val = leaf_shift_left(tb, tb->lnum[0], tb->lbytes-1);
-							if (ret_val && !item_pos) {
+							if (ret_val && !tb->item_pos) {
 								pasted = item_head(tb->L[0], B_NR_ITEMS(tb->L[0]) - 1);
 								l_pos_in_item += ih_entry_count(pasted) - (tb->lbytes -1);
 							}
 
 							/* Append given directory entry to directory item */
 							buffer_info_init_left(tb, &bi);
-							leaf_paste_in_buffer(&bi, n + item_pos - ret_val, l_pos_in_item, tb->insert_size[0], body, zeros_num);
+							leaf_paste_in_buffer(&bi, n + tb->item_pos - ret_val, l_pos_in_item, tb->insert_size[0], body, tb->zeroes_num);
 
 							/* previous string prepared space for pasting new entry, following string pastes this entry */
 
 							/* when we have merge directory item, pos_in_item has been changed too */
 
 							/* paste new directory entry. 1 is entry number */
-							leaf_paste_entries(&bi, n + item_pos - ret_val, l_pos_in_item,
+							leaf_paste_entries(&bi, n + tb->item_pos - ret_val, l_pos_in_item,
 									   1, (struct reiserfs_de_head *) body,
 									   body + DEH_SIZE, tb->insert_size[0]);
 							tb->insert_size[0] = 0;
@@ -450,20 +433,20 @@ static int balance_leaf(struct tree_bala
 							leaf_shift_left(tb, tb->lnum[0], tb->lbytes);
 						}
 						/* Calculate new position to append in item body */
-						pos_in_item -= tb->lbytes;
+						tb->pos_in_item -= tb->lbytes;
 					} else {
 						/* regular object */
 						RFALSE(tb->lbytes <= 0, "PAP-12095: there is nothing to shift to L[0]. lbytes=%d", tb->lbytes);
-						RFALSE(pos_in_item != ih_item_len(item_head(tbS0, item_pos)),
+						RFALSE(tb->pos_in_item != ih_item_len(item_head(tbS0, tb->item_pos)),
 						       "PAP-12100: incorrect position to paste: item_len=%d, pos_in_item=%d",
-						       ih_item_len(item_head(tbS0, item_pos)),pos_in_item);
+						       ih_item_len(item_head(tbS0, tb->item_pos)), tb->pos_in_item);
 
-						if (tb->lbytes >= pos_in_item) {
+						if (tb->lbytes >= tb->pos_in_item) {
 							/* appended item will be in L[0] in whole */
 							int l_n;
 
 							/* this bytes number must be appended to the last item of L[h] */
-							l_n = tb->lbytes - pos_in_item;
+							l_n = tb->lbytes - tb->pos_in_item;
 
 							/* Calculate new insert_size[0] */
 							tb->insert_size[0] -= l_n;
@@ -472,14 +455,14 @@ static int balance_leaf(struct tree_bala
 							       "PAP-12105: there is nothing to paste into L[0]. insert_size=%d",
 							       tb->insert_size[0]);
 							ret_val = leaf_shift_left(tb, tb->lnum[0], ih_item_len
-									    (item_head(tbS0, item_pos)));
+									    (item_head(tbS0, tb->item_pos)));
 							/* Append to body of item in L[0] */
 							buffer_info_init_left(tb, &bi);
 							leaf_paste_in_buffer
-							    (&bi, n + item_pos - ret_val, ih_item_len
-							     (item_head(tb->L[0], n + item_pos - ret_val)),
+							    (&bi, n + tb->item_pos - ret_val, ih_item_len
+							     (item_head(tb->L[0], n + tb->item_pos - ret_val)),
 							     l_n, body,
-							     zeros_num > l_n ? l_n : zeros_num);
+							     tb->zeroes_num > l_n ? l_n : tb->zeroes_num);
 							/* 0-th item in S0 can be only of DIRECT type when l_n != 0 */
 							{
 								int version;
@@ -488,9 +471,9 @@ static int balance_leaf(struct tree_bala
 								RFALSE(ih_item_len(item_head(tbS0, 0)),
 								     "PAP-12106: item length must be 0");
 								RFALSE(comp_short_le_keys(leaf_key(tbS0, 0), leaf_key
-								      (tb->L[0], n + item_pos - ret_val)),
+								      (tb->L[0], n + tb->item_pos - ret_val)),
 								     "PAP-12107: items must be of the same file");
-								if (is_indirect_le_ih(item_head(tb->L[0], n + item_pos - ret_val))) {
+								if (is_indirect_le_ih(item_head(tb->L[0], n + tb->item_pos - ret_val))) {
 									temp_l = l_n << (tb->tb_sb-> s_blocksize_bits - UNFM_P_SHIFT);
 								}
 								/* update key of first item in S0 */
@@ -503,12 +486,12 @@ static int balance_leaf(struct tree_bala
 							}
 
 							/* Calculate new body, position in item and insert_size[0] */
-							if (l_n > zeros_num) {
-								body += (l_n - zeros_num);
-								zeros_num = 0;
+							if (l_n > tb->zeroes_num) {
+								body += (l_n - tb->zeroes_num);
+								tb->zeroes_num = 0;
 							} else
-								zeros_num -= l_n;
-							pos_in_item = 0;
+								tb->zeroes_num -= l_n;
+							tb->pos_in_item = 0;
 
 							RFALSE(comp_short_le_keys(leaf_key(tbS0, 0), leaf_key(tb->L[0], B_NR_ITEMS(tb->L[0]) - 1))
 							     || !op_is_left_mergeable(leaf_key(tbS0, 0), tbS0->b_size)
@@ -517,9 +500,9 @@ static int balance_leaf(struct tree_bala
 						} else {	/* only part of the appended item will be in L[0] */
 
 							/* Calculate position in item for append in S[0] */
-							pos_in_item -= tb->lbytes;
+							tb->pos_in_item -= tb->lbytes;
 
-							RFALSE(pos_in_item <= 0, "PAP-12125: no place for paste. pos_in_item=%d", pos_in_item);
+							RFALSE(tb->pos_in_item <= 0, "PAP-12125: no place for paste. pos_in_item=%d", tb->pos_in_item);
 
 							/* Shift lnum[0] - 1 items in whole. Shift lbytes - 1 byte from item number lnum[0] */
 							leaf_shift_left(tb, tb->lnum[0], tb->lbytes);
@@ -529,29 +512,29 @@ static int balance_leaf(struct tree_bala
 
 					struct item_head *pasted;
 
-					if (!item_pos && op_is_left_mergeable(leaf_key(tbS0, 0), tbS0->b_size)) {	/* if we paste into first item of S[0] and it is left mergable */
+					if (!tb->item_pos && op_is_left_mergeable(leaf_key(tbS0, 0), tbS0->b_size)) {	/* if we paste into first item of S[0] and it is left mergable */
 						/* then increment pos_in_item by the size of the last item in L[0] */
 						pasted = item_head(tb->L[0], n - 1);
 						if (is_direntry_le_ih(pasted))
-							pos_in_item += ih_entry_count(pasted);
+							tb->pos_in_item += ih_entry_count(pasted);
 						else
-							pos_in_item += ih_item_len(pasted);
+							tb->pos_in_item += ih_item_len(pasted);
 					}
 
 					/* Shift lnum[0] - 1 items in whole. Shift lbytes - 1 byte from item number lnum[0] */
 					ret_val = leaf_shift_left(tb, tb->lnum[0], tb->lbytes);
 					/* Append to body of item in L[0] */
 					buffer_info_init_left(tb, &bi);
-					leaf_paste_in_buffer(&bi, n + item_pos - ret_val,
-							     pos_in_item,
+					leaf_paste_in_buffer(&bi, n + tb->item_pos - ret_val,
+							     tb->pos_in_item,
 							     tb->insert_size[0],
-							     body, zeros_num);
+							     body, tb->zeroes_num);
 
 					/* if appended item is directory, paste entry */
-					pasted = item_head(tb->L[0], n + item_pos - ret_val);
+					pasted = item_head(tb->L[0], n + tb->item_pos - ret_val);
 					if (is_direntry_le_ih(pasted))
-						leaf_paste_entries(&bi, n + item_pos - ret_val,
-								   pos_in_item, 1,
+						leaf_paste_entries(&bi, n + tb->item_pos - ret_val,
+								   tb->pos_in_item, 1,
 								   (struct reiserfs_de_head *) body,
 								   body + DEH_SIZE,
 								   tb->insert_size[0]);
@@ -559,7 +542,7 @@ static int balance_leaf(struct tree_bala
 					if (is_indirect_le_ih(pasted))
 						set_ih_free_space(pasted, 0);
 					tb->insert_size[0] = 0;
-					zeros_num = 0;
+					tb->zeroes_num = 0;
 				}
 				break;
 			default:	/* cases d and t */
@@ -576,7 +559,7 @@ static int balance_leaf(struct tree_bala
 
 	/* tb->lnum[0] > 0 */
 	/* Calculate new item position */
-	item_pos -= (tb->lnum[0] - ((tb->lbytes != -1) ? 1 : 0));
+	tb->item_pos -= (tb->lnum[0] - ((tb->lbytes != -1) ? 1 : 0));
 
 	if (tb->rnum[0] > 0) {
 		/* shift rnum[0] items from S[0] to the right neighbor R[0] */
@@ -584,9 +567,9 @@ static int balance_leaf(struct tree_bala
 		switch (flag) {
 
 		case M_INSERT:	/* insert item */
-			if (n - tb->rnum[0] < item_pos) {	/* new item or its part falls to R[0] */
-				if (item_pos == n - tb->rnum[0] + 1 && tb->rbytes != -1) {	/* part of new item falls into R[0] */
-					loff_t old_key_comp, old_len, r_zeros_number;
+			if (n - tb->rnum[0] < tb->item_pos) {	/* new item or its part falls to R[0] */
+				if (tb->item_pos == n - tb->rnum[0] + 1 && tb->rbytes != -1) {	/* part of new item falls into R[0] */
+					loff_t old_key_comp, old_len, r_zeroes_number;
 					const char *r_body;
 					int version;
 					loff_t offset;
@@ -604,17 +587,17 @@ static int balance_leaf(struct tree_bala
 					put_ih_item_len(ih, tb->rbytes);
 					/* Insert part of the item into R[0] */
 					buffer_info_init_right(tb, &bi);
-					if ((old_len - tb->rbytes) > zeros_num) {
-						r_zeros_number = 0;
-						r_body = body + (old_len - tb->rbytes) - zeros_num;
+					if ((old_len - tb->rbytes) > tb->zeroes_num) {
+						r_zeroes_number = 0;
+						r_body = body + (old_len - tb->rbytes) - tb->zeroes_num;
 					} else {
 						r_body = body;
-						r_zeros_number = zeros_num - (old_len - tb->rbytes);
-						zeros_num -= r_zeros_number;
+						r_zeroes_number = tb->zeroes_num - (old_len - tb->rbytes);
+						tb->zeroes_num -= r_zeroes_number;
 					}
 
 					leaf_insert_into_buf(&bi, 0, ih, r_body,
-							     r_zeros_number);
+							     r_zeroes_number);
 
 					/* Replace right delimiting key by first key in R[0] */
 					replace_key(tb, tb->CFR[0], tb->rkey[0],
@@ -632,16 +615,16 @@ static int balance_leaf(struct tree_bala
 					ret_val = leaf_shift_right(tb, tb->rnum[0] - 1, tb->rbytes);
 					/* Insert new item into R[0] */
 					buffer_info_init_right(tb, &bi);
-					leaf_insert_into_buf(&bi, item_pos - n + tb->rnum[0] - 1,
-							     ih, body, zeros_num);
+					leaf_insert_into_buf(&bi, tb->item_pos - n + tb->rnum[0] - 1,
+							     ih, body, tb->zeroes_num);
 
-					if (item_pos - n + tb->rnum[0] - 1 == 0) {
+					if (tb->item_pos - n + tb->rnum[0] - 1 == 0) {
 						replace_key(tb, tb->CFR[0],
 							    tb->rkey[0],
 							    tb->R[0], 0);
 
 					}
-					zeros_num = tb->insert_size[0] = 0;
+					tb->zeroes_num = tb->insert_size[0] = 0;
 				}
 			} else {	/* new item or part of it doesn't fall into R[0] */
 
@@ -651,17 +634,17 @@ static int balance_leaf(struct tree_bala
 
 		case M_PASTE:	/* append item */
 
-			if (n - tb->rnum[0] <= item_pos) {	/* pasted item or part of it falls to R[0] */
-				if (item_pos == n - tb->rnum[0] && tb->rbytes != -1) {	/* we must shift the part of the appended item */
-					if (is_direntry_le_ih(item_head(tbS0, item_pos))) {	/* we append to directory item */
+			if (n - tb->rnum[0] <= tb->item_pos) {	/* pasted item or part of it falls to R[0] */
+				if (tb->item_pos == n - tb->rnum[0] && tb->rbytes != -1) {	/* we must shift the part of the appended item */
+					if (is_direntry_le_ih(item_head(tbS0, tb->item_pos))) {	/* we append to directory item */
 						int entry_count;
 
-						RFALSE(zeros_num,
+						RFALSE(tb->zeroes_num,
 						       "PAP-12145: invalid parameter in case of a directory");
 						entry_count = ih_entry_count(item_head
-								  (tbS0, item_pos));
+								  (tbS0, tb->item_pos));
 						if (entry_count - tb->rbytes <
-						    pos_in_item)
+						    tb->pos_in_item)
 							/* new directory entry falls into R[0] */
 						{
 							int paste_entry_position;
@@ -672,9 +655,9 @@ static int balance_leaf(struct tree_bala
 							/* Shift rnum[0]-1 items in whole. Shift rbytes-1 directory entries from directory item number rnum[0] */
 							leaf_shift_right(tb, tb->rnum[0], tb->rbytes - 1);
 							/* Paste given directory entry to directory item */
-							paste_entry_position = pos_in_item - entry_count + tb->rbytes - 1;
+							paste_entry_position = tb->pos_in_item - entry_count + tb->rbytes - 1;
 							buffer_info_init_right(tb, &bi);
-							leaf_paste_in_buffer(&bi, 0, paste_entry_position, tb->insert_size[0], body, zeros_num);
+							leaf_paste_in_buffer(&bi, 0, paste_entry_position, tb->insert_size[0], body, tb->zeroes_num);
 							/* paste entry */
 							leaf_paste_entries(&bi, 0, paste_entry_position, 1,
 									   (struct reiserfs_de_head *) body,
@@ -686,25 +669,25 @@ static int balance_leaf(struct tree_bala
 							}
 
 							tb->insert_size[0] = 0;
-							pos_in_item++;
+							tb->pos_in_item++;
 						} else {	/* new directory entry doesn't fall into R[0] */
 
 							leaf_shift_right(tb, tb->rnum[0], tb->rbytes);
 						}
 					} else {	/* regular object */
 
-						int n_shift, n_rem, r_zeros_number;
+						int n_shift, n_rem, r_zeroes_number;
 						const char *r_body;
 
 						/* Calculate number of bytes which must be shifted from appended item */
 						if ((n_shift = tb->rbytes - tb->insert_size[0]) < 0)
 							n_shift = 0;
 
-						RFALSE(pos_in_item != ih_item_len
-						       (item_head(tbS0, item_pos)),
+						RFALSE(tb->pos_in_item != ih_item_len
+						       (item_head(tbS0, tb->item_pos)),
 						       "PAP-12155: invalid position to paste. ih_item_len=%d, pos_in_item=%d",
-						       pos_in_item, ih_item_len
-						       (item_head(tbS0, item_pos)));
+						       tb->pos_in_item, ih_item_len
+						       (item_head(tbS0, tb->item_pos)));
 
 						leaf_shift_right(tb, tb->rnum[0], n_shift);
 						/* Calculate number of bytes which must remain in body after appending to R[0] */
@@ -730,18 +713,18 @@ static int balance_leaf(struct tree_bala
 
 						/* Append part of body into R[0] */
 						buffer_info_init_right(tb, &bi);
-						if (n_rem > zeros_num) {
-							r_zeros_number = 0;
-							r_body = body + n_rem - zeros_num;
+						if (n_rem > tb->zeroes_num) {
+							r_zeroes_number = 0;
+							r_body = body + n_rem - tb->zeroes_num;
 						} else {
 							r_body = body;
-							r_zeros_number = zeros_num - n_rem;
-							zeros_num -= r_zeros_number;
+							r_zeroes_number = tb->zeroes_num - n_rem;
+							tb->zeroes_num -= r_zeroes_number;
 						}
 
 						leaf_paste_in_buffer(&bi, 0, n_shift,
 								     tb->insert_size[0] - n_rem,
-								     r_body, r_zeros_number);
+								     r_body, r_zeroes_number);
 
 						if (is_indirect_le_ih(item_head(tb->R[0], 0))) {
 #if 0
@@ -752,7 +735,7 @@ static int balance_leaf(struct tree_bala
 						}
 						tb->insert_size[0] = n_rem;
 						if (!n_rem)
-							pos_in_item++;
+							tb->pos_in_item++;
 					}
 				} else {	/* pasted item in whole falls into R[0] */
 
@@ -760,22 +743,22 @@ static int balance_leaf(struct tree_bala
 
 					ret_val = leaf_shift_right(tb, tb->rnum[0], tb->rbytes);
 					/* append item in R[0] */
-					if (pos_in_item >= 0) {
+					if (tb->pos_in_item >= 0) {
 						buffer_info_init_right(tb, &bi);
-						leaf_paste_in_buffer(&bi, item_pos - n + tb->rnum[0], pos_in_item,
-								     tb->insert_size[0], body, zeros_num);
+						leaf_paste_in_buffer(&bi, tb->item_pos - n + tb->rnum[0], tb->pos_in_item,
+								     tb->insert_size[0], body, tb->zeroes_num);
 					}
 
 					/* paste new entry, if item is directory item */
-					pasted = item_head(tb->R[0], item_pos - n + tb->rnum[0]);
-					if (is_direntry_le_ih(pasted) && pos_in_item >= 0) {
-						leaf_paste_entries(&bi, item_pos - n + tb->rnum[0],
-								   pos_in_item, 1,
+					pasted = item_head(tb->R[0], tb->item_pos - n + tb->rnum[0]);
+					if (is_direntry_le_ih(pasted) && tb->pos_in_item >= 0) {
+						leaf_paste_entries(&bi, tb->item_pos - n + tb->rnum[0],
+								   tb->pos_in_item, 1,
 								   (struct reiserfs_de_head *) body,
 								   body + DEH_SIZE, tb->insert_size[0]);
-						if (!pos_in_item) {
+						if (!tb->pos_in_item) {
 
-							RFALSE(item_pos - n + tb->rnum[0],
+							RFALSE(tb->item_pos - n + tb->rnum[0],
 							       "PAP-12165: directory item must be first item of node when pasting is in 0th position");
 
 							/* update delimiting keys */
@@ -785,7 +768,7 @@ static int balance_leaf(struct tree_bala
 
 					if (is_indirect_le_ih(pasted))
 						set_ih_free_space(pasted, 0);
-					zeros_num = tb->insert_size[0] = 0;
+					tb->zeroes_num = tb->insert_size[0] = 0;
 				}
 			} else {	/* new item doesn't fall into R[0] */
 
@@ -834,39 +817,34 @@ static int balance_leaf(struct tree_bala
 	}
 
 	/* Fill new nodes that appear in place of S[0] */
-
-	/* I am told that this copying is because we need an array to enable
-	   the looping code. -Hans */
-	snum[0] = tb->s1num, snum[1] = tb->s2num;
-	sbytes[0] = tb->s1bytes;
-	sbytes[1] = tb->s2bytes;
 	for (i = tb->blknum[0] - 2; i >= 0; i--) {
 
-		RFALSE(!snum[i], "PAP-12200: snum[%d] == %d. Must be > 0", i,
-		       snum[i]);
+		RFALSE(!tb->snum[i],
+		       "PAP-12200: snum[%d] == %d. Must be > 0", i,
+		       tb->snum[i]);
 
 		/* here we shift from S to S_new nodes */
 
-		S_new[i] = get_FEB(tb);
+		tb->S_new[i] = get_FEB(tb);
 
 		/* initialized block type and tree level */
-		set_blkh_level(B_BLK_HEAD(S_new[i]), DISK_LEAF_NODE_LEVEL);
+		set_blkh_level(B_BLK_HEAD(tb->S_new[i]), DISK_LEAF_NODE_LEVEL);
 
 		n = B_NR_ITEMS(tbS0);
 
 		switch (flag) {
 		case M_INSERT:	/* insert item */
 
-			if (n - snum[i] < item_pos) {	/* new item or it's part falls to first new node S_new[i] */
-				if (item_pos == n - snum[i] + 1 && sbytes[i] != -1) {	/* part of new item falls into S_new[i] */
-					int old_key_comp, old_len, r_zeros_number;
+			if (n - tb->snum[i] < tb->item_pos) {	/* new item or it's part falls to first new node S_new[i] */
+				if (tb->item_pos == n - tb->snum[i] + 1 && tb->sbytes[i] != -1) {	/* part of new item falls into S_new[i] */
+					int old_key_comp, old_len, r_zeroes_number;
 					const char *r_body;
 					int version;
 
 					/* Move snum[i]-1 items from S[0] to S_new[i] */
 					leaf_move_items(LEAF_FROM_S_TO_SNEW, tb,
-							snum[i] - 1, -1,
-							S_new[i]);
+							tb->snum[i] - 1, -1,
+							tb->S_new[i]);
 					/* Remember key component and item length */
 					version = ih_version(ih);
 					old_key_comp = le_ih_k_offset(ih);
@@ -874,59 +852,59 @@ static int balance_leaf(struct tree_bala
 
 					/* Calculate key component and item length to insert into S_new[i] */
 					set_le_ih_k_offset(ih, le_ih_k_offset(ih) +
-							   ((old_len - sbytes[i]) << (is_indirect_le_ih(ih) ? tb->tb_sb-> s_blocksize_bits - UNFM_P_SHIFT : 0)));
+							   ((old_len - tb->sbytes[i]) << (is_indirect_le_ih(ih) ? tb->tb_sb->s_blocksize_bits - UNFM_P_SHIFT : 0)));
 
-					put_ih_item_len(ih, sbytes[i]);
+					put_ih_item_len(ih, tb->sbytes[i]);
 
 					/* Insert part of the item into S_new[i] before 0-th item */
-					buffer_info_init_bh(tb, &bi, S_new[i]);
+					buffer_info_init_bh(tb, &bi, tb->S_new[i]);
 
-					if ((old_len - sbytes[i]) > zeros_num) {
-						r_zeros_number = 0;
-						r_body = body + (old_len - sbytes[i]) - zeros_num;
+					if ((old_len - tb->sbytes[i]) > tb->zeroes_num) {
+						r_zeroes_number = 0;
+						r_body = body + (old_len - tb->sbytes[i]) - tb->zeroes_num;
 					} else {
 						r_body = body;
-						r_zeros_number = zeros_num - (old_len - sbytes[i]);
-						zeros_num -= r_zeros_number;
+						r_zeroes_number = tb->zeroes_num - (old_len - tb->sbytes[i]);
+						tb->zeroes_num -= r_zeroes_number;
 					}
 
-					leaf_insert_into_buf(&bi, 0, ih, r_body, r_zeros_number);
+					leaf_insert_into_buf(&bi, 0, ih, r_body, r_zeroes_number);
 
 					/* Calculate key component and item length to insert into S[i] */
 					set_le_ih_k_offset(ih, old_key_comp);
-					put_ih_item_len(ih, old_len - sbytes[i]);
-					tb->insert_size[0] -= sbytes[i];
+					put_ih_item_len(ih, old_len - tb->sbytes[i]);
+					tb->insert_size[0] -= tb->sbytes[i];
 				} else {	/* whole new item falls into S_new[i] */
 
 					/* Shift snum[0] - 1 items to S_new[i] (sbytes[i] of split item) */
 					leaf_move_items(LEAF_FROM_S_TO_SNEW, tb,
-							snum[i] - 1, sbytes[i], S_new[i]);
+							tb->snum[i] - 1, tb->sbytes[i], tb->S_new[i]);
 
 					/* Insert new item into S_new[i] */
-					buffer_info_init_bh(tb, &bi, S_new[i]);
-					leaf_insert_into_buf(&bi, item_pos - n + snum[i] - 1,
-							     ih, body, zeros_num);
+					buffer_info_init_bh(tb, &bi, tb->S_new[i]);
+					leaf_insert_into_buf(&bi, tb->item_pos - n + tb->snum[i] - 1,
+							     ih, body, tb->zeroes_num);
 
-					zeros_num = tb->insert_size[0] = 0;
+					tb->zeroes_num = tb->insert_size[0] = 0;
 				}
 			}
 
 			else {	/* new item or it part don't falls into S_new[i] */
 
 				leaf_move_items(LEAF_FROM_S_TO_SNEW, tb,
-						snum[i], sbytes[i], S_new[i]);
+						tb->snum[i], tb->sbytes[i], tb->S_new[i]);
 			}
 			break;
 
 		case M_PASTE:	/* append item */
 
-			if (n - snum[i] <= item_pos) {	/* pasted item or part if it falls to S_new[i] */
-				if (item_pos == n - snum[i] && sbytes[i] != -1) {	/* we must shift part of the appended item */
+			if (n - tb->snum[i] <= tb->item_pos) {	/* pasted item or part if it falls to S_new[i] */
+				if (tb->item_pos == n - tb->snum[i] && tb->sbytes[i] != -1) {	/* we must shift part of the appended item */
 					struct item_head *aux_ih;
 
 					RFALSE(ih, "PAP-12210: ih must be 0");
 
-					aux_ih = item_head(tbS0, item_pos);
+					aux_ih = item_head(tbS0, tb->item_pos);
 					if (is_direntry_le_ih(aux_ih)) {
 						/* we append to directory item */
 
@@ -934,65 +912,65 @@ static int balance_leaf(struct tree_bala
 
 						entry_count = ih_entry_count(aux_ih);
 
-						if (entry_count - sbytes[i] < pos_in_item && pos_in_item <= entry_count) {
+						if (entry_count - tb->sbytes[i] < tb->pos_in_item && tb->pos_in_item <= entry_count) {
 							/* new directory entry falls into S_new[i] */
 
 							RFALSE(!tb->insert_size[0], "PAP-12215: insert_size is already 0");
-							RFALSE(sbytes[i] - 1 >= entry_count,
+							RFALSE(tb->sbytes[i] - 1 >= entry_count,
 							       "PAP-12220: there are no so much entries (%d), only %d",
-							       sbytes[i] - 1, entry_count);
+							       tb->sbytes[i] - 1, entry_count);
 
 							/* Shift snum[i]-1 items in whole. Shift sbytes[i] directory entries from directory item number snum[i] */
-							leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, snum[i], sbytes[i] - 1, S_new[i]);
+							leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i], tb->sbytes[i] - 1, tb->S_new[i]);
 							/* Paste given directory entry to directory item */
-							buffer_info_init_bh(tb, &bi, S_new[i]);
-							leaf_paste_in_buffer(&bi, 0, pos_in_item - entry_count + sbytes[i] - 1,
-							     tb->insert_size[0], body, zeros_num);
+							buffer_info_init_bh(tb, &bi, tb->S_new[i]);
+							leaf_paste_in_buffer(&bi, 0, tb->pos_in_item - entry_count + tb->sbytes[i] - 1,
+							     tb->insert_size[0], body, tb->zeroes_num);
 							/* paste new directory entry */
-							leaf_paste_entries(&bi, 0, pos_in_item - entry_count + sbytes[i] - 1, 1,
+							leaf_paste_entries(&bi, 0, tb->pos_in_item - entry_count + tb->sbytes[i] - 1, 1,
 									   (struct reiserfs_de_head *) body,
 									   body + DEH_SIZE, tb->insert_size[0]);
 							tb->insert_size[0] = 0;
-							pos_in_item++;
+							tb->pos_in_item++;
 						} else {	/* new directory entry doesn't fall into S_new[i] */
-							leaf_move_items(LEAF_FROM_S_TO_SNEW,tb, snum[i], sbytes[i], S_new[i]);
+							leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i], tb->sbytes[i], tb->S_new[i]);
 						}
 					} else {	/* regular object */
 
-						int n_shift, n_rem, r_zeros_number;
+						int n_shift, n_rem, r_zeroes_number;
 						const char *r_body;
 
-						RFALSE(pos_in_item != ih_item_len(item_head(tbS0, item_pos)) || tb->insert_size[0] <= 0,
+						RFALSE(tb->pos_in_item != ih_item_len(item_head(tbS0, tb->item_pos)) || tb->insert_size[0] <= 0,
 						       "PAP-12225: item too short or insert_size <= 0");
 
 						/* Calculate number of bytes which must be shifted from appended item */
-						n_shift = sbytes[i] - tb->insert_size[0];
+						n_shift = tb->sbytes[i] - tb->insert_size[0];
 						if (n_shift < 0)
 							n_shift = 0;
-						leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, snum[i], n_shift, S_new[i]);
+						leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i], n_shift, tb->S_new[i]);
 
 						/* Calculate number of bytes which must remain in body after append to S_new[i] */
-						n_rem = tb->insert_size[0] - sbytes[i];
+						n_rem = tb->insert_size[0] - tb->sbytes[i];
 						if (n_rem < 0)
 							n_rem = 0;
 						/* Append part of body into S_new[0] */
-						buffer_info_init_bh(tb, &bi, S_new[i]);
-						if (n_rem > zeros_num) {
-							r_zeros_number = 0;
-							r_body = body + n_rem - zeros_num;
+						buffer_info_init_bh(tb, &bi, tb->S_new[i]);
+						if (n_rem > tb->zeroes_num) {
+							r_zeroes_number = 0;
+							r_body = body + n_rem - tb->zeroes_num;
 						} else {
 							r_body = body;
-							r_zeros_number = zeros_num - n_rem;
-							zeros_num -= r_zeros_number;
+							r_zeroes_number = tb->zeroes_num - n_rem;
+							tb->zeroes_num -= r_zeroes_number;
 						}
 
 						leaf_paste_in_buffer(&bi, 0, n_shift,
 								     tb->insert_size[0] - n_rem,
-								     r_body, r_zeros_number);
+								     r_body, r_zeroes_number);
 						{
 							struct item_head *tmp;
 
-							tmp = item_head(S_new[i], 0);
+							tmp = item_head(tb->S_new[i], 0);
 							if (is_indirect_le_ih
 							    (tmp)) {
 								set_ih_free_space(tmp, 0);
@@ -1004,7 +982,7 @@ static int balance_leaf(struct tree_bala
 
 						tb->insert_size[0] = n_rem;
 						if (!n_rem)
-							pos_in_item++;
+							tb->pos_in_item++;
 					}
 				} else
 					/* item falls wholly into S_new[i] */
@@ -1013,10 +991,10 @@ static int balance_leaf(struct tree_bala
 					struct item_head *pasted;
 
 #ifdef CONFIG_REISERFS_CHECK
-					struct item_head *ih_check = item_head(tbS0, item_pos);
+					struct item_head *ih_check = item_head(tbS0, tb->item_pos);
 
 					if (!is_direntry_le_ih(ih_check)
-					    && (pos_in_item != ih_item_len(ih_check)
+					    && (tb->pos_in_item != ih_item_len(ih_check)
 						|| tb->insert_size[0] <= 0))
 						reiserfs_panic(tb->tb_sb,
 							     "PAP-12235",
@@ -1026,27 +1004,27 @@ static int balance_leaf(struct tree_bala
 #endif				/* CONFIG_REISERFS_CHECK */
 
 					leaf_mi = leaf_move_items(LEAF_FROM_S_TO_SNEW,
-							    tb, snum[i],
-							    sbytes[i],
-							    S_new[i]);
+							    tb, tb->snum[i],
+							    tb->sbytes[i],
+							    tb->S_new[i]);
 
 					RFALSE(leaf_mi,
 					       "PAP-12240: unexpected value returned by leaf_move_items (%d)",
 					       leaf_mi);
 
 					/* paste into item */
-					buffer_info_init_bh(tb, &bi, S_new[i]);
+					buffer_info_init_bh(tb, &bi, tb->S_new[i]);
 					leaf_paste_in_buffer(&bi,
-							     item_pos - n + snum[i],
-							     pos_in_item,
+							     tb->item_pos - n + tb->snum[i],
+							     tb->pos_in_item,
 							     tb->insert_size[0],
-							     body, zeros_num);
+							     body, tb->zeroes_num);
 
-					pasted = item_head(S_new[i], item_pos - n + snum[i]);
+					pasted = item_head(tb->S_new[i], tb->item_pos - n + tb->snum[i]);
 					if (is_direntry_le_ih(pasted)) {
 						leaf_paste_entries(&bi,
-								   item_pos - n + snum[i],
-								   pos_in_item, 1,
+								   tb->item_pos - n + tb->snum[i],
+								   tb->pos_in_item, 1,
 								   (struct reiserfs_de_head *)body,
 								   body + DEH_SIZE,
 								   tb->insert_size[0]
@@ -1056,14 +1034,14 @@ static int balance_leaf(struct tree_bala
 					/* if we paste to indirect item update ih_free_space */
 					if (is_indirect_le_ih(pasted))
 						set_ih_free_space(pasted, 0);
-					zeros_num = tb->insert_size[0] = 0;
+					tb->zeroes_num = tb->insert_size[0] = 0;
 				}
 			}
 
 			else {	/* pasted item doesn't fall into S_new[i] */
 
 				leaf_move_items(LEAF_FROM_S_TO_SNEW, tb,
-						snum[i], sbytes[i], S_new[i]);
+						tb->snum[i], tb->sbytes[i], tb->S_new[i]);
 			}
 			break;
 		default:	/* cases d and t */
@@ -1072,27 +1050,28 @@ static int balance_leaf(struct tree_bala
 				       (flag == M_DELETE) ? "DELETE" : ((flag == M_CUT) ? "CUT" : "UNKNOWN"), flag);
 		}
 
-		memcpy(insert_key + i, leaf_key(S_new[i], 0), KEY_SIZE);
-		insert_ptr[i] = S_new[i];
+		memcpy(insert_key + i, leaf_key(tb->S_new[i], 0), KEY_SIZE);
+		insert_ptr[i] = tb->S_new[i];
 
-		RFALSE(!buffer_journaled(S_new[i])
-		       || buffer_journal_dirty(S_new[i])
-		       || buffer_dirty(S_new[i]), "PAP-12247: S_new[%d] : (%b)",
-		       i, S_new[i]);
+		RFALSE(!buffer_journaled(tb->S_new[i])
+		       || buffer_journal_dirty(tb->S_new[i])
+		       || buffer_dirty(tb->S_new[i]),
+		       "PAP-12247: S_new[%d] : (%b)",
+		       i, tb->S_new[i]);
 	}
 
 	/* if the affected item was not wholly shifted then we perform all necessary operations on that part or whole of the
 	   affected item which remains in S */
-	if (0 <= item_pos && item_pos < tb->s0num) {	/* if we must insert or append into buffer S[0] */
+	if (0 <= tb->item_pos && tb->item_pos < tb->s0num) {	/* if we must insert or append into buffer S[0] */
 
 		switch (flag) {
 		case M_INSERT:	/* insert item into S[0] */
 			buffer_info_init_tbS0(tb, &bi);
-			leaf_insert_into_buf(&bi, item_pos, ih, body,
-					     zeros_num);
+			leaf_insert_into_buf(&bi, tb->item_pos, ih,
+					     body, tb->zeroes_num);
 
 			/* If we insert the first key change the delimiting key */
-			if (item_pos == 0) {
+			if (tb->item_pos == 0) {
 				if (tb->CFL[0])	/* can be 0 in reiserfsck */
 					replace_key(tb, tb->CFL[0], tb->lkey[0], tbS0, 0);
 			}
@@ -1101,26 +1080,26 @@ static int balance_leaf(struct tree_bala
 		case M_PASTE:{	/* append item in S[0] */
 				struct item_head *pasted;
 
-				pasted = item_head(tbS0, item_pos);
+				pasted = item_head(tbS0, tb->item_pos);
 				/* when directory, may be new entry already pasted */
 				if (is_direntry_le_ih(pasted)) {
-					if (pos_in_item >= 0 && pos_in_item <= ih_entry_count(pasted)) {
+					if (tb->pos_in_item >= 0 && tb->pos_in_item <= ih_entry_count(pasted)) {
 
 						RFALSE(!tb->insert_size[0],
 						       "PAP-12260: insert_size is 0 already");
 
 						/* prepare space */
 						buffer_info_init_tbS0(tb, &bi);
-						leaf_paste_in_buffer(&bi, item_pos, pos_in_item,
+						leaf_paste_in_buffer(&bi, tb->item_pos, tb->pos_in_item,
 								     tb->insert_size[0], body,
-								     zeros_num);
+								     tb->zeroes_num);
 
 						/* paste entry */
-						leaf_paste_entries(&bi, item_pos, pos_in_item, 1,
+						leaf_paste_entries(&bi, tb->item_pos, tb->pos_in_item, 1,
 								   (struct reiserfs_de_head *)body,
 								   body + DEH_SIZE,
 								   tb->insert_size[0]);
-						if (!item_pos && !pos_in_item) {
+						if (!tb->item_pos && !tb->pos_in_item) {
 							RFALSE(!tb->CFL[0] || !tb->L[0],
 							       "PAP-12270: CFL[0]/L[0] must be specified");
 							if (tb->CFL[0])
@@ -1129,14 +1108,14 @@ static int balance_leaf(struct tree_bala
 						tb->insert_size[0] = 0;
 					}
 				} else {	/* regular object */
-					if (pos_in_item == ih_item_len(pasted)) {
+					if (tb->pos_in_item == ih_item_len(pasted)) {
 
 						RFALSE(tb->insert_size[0] <= 0,
 						       "PAP-12275: insert size must not be %d",
 						       tb->insert_size[0]);
 						buffer_info_init_tbS0(tb, &bi);
-						leaf_paste_in_buffer(&bi, item_pos, pos_in_item,
-								     tb->insert_size[0], body, zeros_num);
+						leaf_paste_in_buffer(&bi, tb->item_pos, tb->pos_in_item,
+								     tb->insert_size[0], body, tb->zeroes_num);
 
 						if (is_indirect_le_ih(pasted)) {
 #if 0
--- a/fs/reiserfs/fix_node.c
+++ b/fs/reiserfs/fix_node.c
@@ -631,10 +631,11 @@ static void set_parameters(struct tree_b
 	/* only for leaf level */
 	if (h == 0) {
 		if (s012 != NULL) {
-			tb->s0num = *s012++,
-			    tb->s1num = *s012++, tb->s2num = *s012++;
-			tb->s1bytes = *s012++;
-			tb->s2bytes = *s012;
+			tb->s0num = *s012++;
+			tb->snum[0] = *s012++;
+			tb->snum[1] = *s012++;
+			tb->sbytes[0] = *s012++;
+			tb->sbytes[1] = *s012;
 		}
 		tb->lbytes = lb;
 		tb->rbytes = rb;
--- a/fs/reiserfs/prints.c
+++ b/fs/reiserfs/prints.c
@@ -673,9 +673,9 @@ void store_print_tb(struct tree_balance
 		"* h * size * ln * lb * rn * rb * blkn * s0 * s1 * s1b * s2 * s2b * curb * lk * rk *\n"
 		"* 0 * %4d * %2d * %2d * %2d * %2d * %4d * %2d * %2d * %3d * %2d * %3d * %4d * %2d * %2d *\n",
 		tb->insert_size[0], tb->lnum[0], tb->lbytes, tb->rnum[0],
-		tb->rbytes, tb->blknum[0], tb->s0num, tb->s1num, tb->s1bytes,
-		tb->s2num, tb->s2bytes, tb->cur_blknum, tb->lkey[0],
-		tb->rkey[0]);
+		tb->rbytes, tb->blknum[0], tb->s0num, tb->snum[0],
+		tb->sbytes[0], tb->snum[1], tb->sbytes[1],
+		tb->cur_blknum, tb->lkey[0], tb->rkey[0]);
 
 	/* this prints balance parameters for non-leaf levels */
 	h = 0;
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -2471,12 +2471,6 @@ struct tree_balance {
 	/* number of items that fall into left most node when S[0] splits */
 	int s0num;
 
-	/* number of items that fall into first new node when S[0] splits */
-	int s1num;
-
-	/* number of items that fall into second new node when S[0] splits */
-	int s2num;
-
 	/*
 	 * number of bytes which can flow to the left neighbor from the left
 	 * most liquid item that cannot be shifted from S[0] entirely
@@ -2491,12 +2485,30 @@ struct tree_balance {
 	 */
 	int rbytes;
 
+
 	/*
-	 * number of bytes which flow to the first new node when S[0] splits
+	 * index into the array of item headers in
+	 * S[0] of the affected item
+	 */
+	int item_pos;
+
+	/* new nodes allocated to hold what could not fit into S */
+	struct buffer_head *S_new[2];
+
+	/*
+	 * number of items that will be placed into nodes in S_new
+	 * when S[0] splits
+	 */
+	int snum[2];
+
+	/*
+	 * number of bytes which flow to nodes in S_new when S[0] splits
 	 * note: if S[0] splits into 3 nodes, then items do not need to be cut
 	 */
-	int s1bytes;
-	int s2bytes;
+	int sbytes[2];
+
+	int pos_in_item;
+	int zeroes_num;
 
 	/*
 	 * buffers which are to be freed after do_balance finishes


