From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 24/29] reiserfs: balance_leaf refactor, format balance_leaf_paste_left
Date: Wed, 23 Apr 2014 10:00:57 -0400
Message-ID: <20140423151148.625292033@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-balance_leaf-refactor-format-balance_leaf_paste_left
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

Break up balance_leaf_paste_left into:
balance_leaf_paste_left_shift
balance_leaf_paste_left_shift_dirent
balance_leaf_paste_left_whole

and keep balance_leaf_paste_left as a handler to select which is appropriate.

Also reformat to adhere to CodingStyle.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/do_balan.c |  387 +++++++++++++++++++++++++++++--------------------
 1 file changed, 235 insertions(+), 152 deletions(-)

--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -355,164 +355,247 @@ static void balance_leaf_insert_left(str
 	}
 }
 
-static void balance_leaf_paste_left(struct tree_balance *tb,
-				    struct item_head *ih, const char *body)
+static void balance_leaf_paste_left_shift_dirent(struct tree_balance *tb,
+						 struct item_head *ih,
+						 const char *body)
+{
+	int n = B_NR_ITEMS(tb->L[0]);
+	struct buffer_info bi;
+
+	RFALSE(tb->zeroes_num,
+	       "PAP-12090: invalid parameter in case of a directory");
+
+	/* directory item */
+	if (tb->lbytes > tb->pos_in_item) {
+		/* new directory entry falls into L[0] */
+		struct item_head *pasted;
+		int ret, l_pos_in_item = tb->pos_in_item;
+
+		/*
+		 * Shift lnum[0] - 1 items in whole.
+		 * Shift lbytes - 1 entries from given directory item
+		 */
+		ret = leaf_shift_left(tb, tb->lnum[0], tb->lbytes - 1);
+		if (ret && !tb->item_pos) {
+			pasted = item_head(tb->L[0], B_NR_ITEMS(tb->L[0]) - 1);
+			l_pos_in_item += ih_entry_count(pasted) -
+					 (tb->lbytes - 1);
+		}
+
+		/* Append given directory entry to directory item */
+		buffer_info_init_left(tb, &bi);
+		leaf_paste_in_buffer(&bi, n + tb->item_pos - ret,
+				     l_pos_in_item, tb->insert_size[0],
+				     body, tb->zeroes_num);
+
+		/*
+		 * previous string prepared space for pasting new entry,
+		 * following string pastes this entry
+		 */
+
+		/*
+		 * when we have merge directory item, pos_in_item
+		 * has been changed too
+		 */
+
+		/* paste new directory entry. 1 is entry number */
+		leaf_paste_entries(&bi, n + tb->item_pos - ret,
+				   l_pos_in_item, 1,
+				   (struct reiserfs_de_head *) body,
+				   body + DEH_SIZE, tb->insert_size[0]);
+		tb->insert_size[0] = 0;
+	} else {
+		/* new directory item doesn't fall into L[0] */
+		/*
+		 * Shift lnum[0]-1 items in whole. Shift lbytes
+		 * directory entries from directory item number lnum[0]
+		 */
+		leaf_shift_left(tb, tb->lnum[0], tb->lbytes);
+	}
+
+	/* Calculate new position to append in item body */
+	tb->pos_in_item -= tb->lbytes;
+}
+
+static void balance_leaf_paste_left_shift(struct tree_balance *tb,
+					  struct item_head *ih,
+					  const char *body)
 {
 	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
-	int ret_val;
+	int n = B_NR_ITEMS(tb->L[0]);
 	struct buffer_info bi;
+
+	if (is_direntry_le_ih(item_head(tbS0, tb->item_pos))) {
+		balance_leaf_paste_left_shift_dirent(tb, ih, body);
+		return;
+	}
+
+	RFALSE(tb->lbytes <= 0,
+	       "PAP-12095: there is nothing to shift to L[0]. "
+	       "lbytes=%d", tb->lbytes);
+	RFALSE(tb->pos_in_item != ih_item_len(item_head(tbS0, tb->item_pos)),
+	       "PAP-12100: incorrect position to paste: "
+	       "item_len=%d, pos_in_item=%d",
+	       ih_item_len(item_head(tbS0, tb->item_pos)), tb->pos_in_item);
+
+	/* appended item will be in L[0] in whole */
+	if (tb->lbytes >= tb->pos_in_item) {
+		struct item_head *tbS0_pos_ih, *tbL0_ih;
+		struct item_head *tbS0_0_ih;
+		struct reiserfs_key *left_delim_key;
+		int ret, l_n, version, temp_l;
+
+		tbS0_pos_ih = item_head(tbS0, tb->item_pos);
+		tbS0_0_ih = item_head(tbS0, 0);
+
+		/*
+		 * this bytes number must be appended
+		 * to the last item of L[h]
+		 */
+		l_n = tb->lbytes - tb->pos_in_item;
+
+		/* Calculate new insert_size[0] */
+		tb->insert_size[0] -= l_n;
+
+		RFALSE(tb->insert_size[0] <= 0,
+		       "PAP-12105: there is nothing to paste into "
+		       "L[0]. insert_size=%d", tb->insert_size[0]);
+
+		ret = leaf_shift_left(tb, tb->lnum[0],
+				      ih_item_len(tbS0_pos_ih));
+
+		tbL0_ih = item_head(tb->L[0], n + tb->item_pos - ret);
+
+		/* Append to body of item in L[0] */
+		buffer_info_init_left(tb, &bi);
+		leaf_paste_in_buffer(&bi, n + tb->item_pos - ret,
+				     ih_item_len(tbL0_ih), l_n, body,
+				     min_t(int, l_n, tb->zeroes_num));
+
+		/*
+		 * 0-th item in S0 can be only of DIRECT type
+		 * when l_n != 0
+		 */
+		temp_l = l_n;
+
+		RFALSE(ih_item_len(tbS0_0_ih),
+		       "PAP-12106: item length must be 0");
+		RFALSE(comp_short_le_keys(&tbS0_0_ih->ih_key,
+		       leaf_key(tb->L[0], n + tb->item_pos - ret)),
+		       "PAP-12107: items must be of the same file");
+
+		if (is_indirect_le_ih(tbL0_ih)) {
+			int shift = tb->tb_sb->s_blocksize_bits - UNFM_P_SHIFT;
+			temp_l = l_n << shift;
+		}
+		/* update key of first item in S0 */
+		version = ih_version(tbS0_0_ih);
+		add_le_key_k_offset(version, &tbS0_0_ih->ih_key, temp_l);
+
+		/* update left delimiting key */
+		left_delim_key = internal_key(tb->CFL[0], tb->lkey[0]);
+		add_le_key_k_offset(version, left_delim_key, temp_l);
+
+		/*
+		 * Calculate new body, position in item and
+		 * insert_size[0]
+		 */
+		if (l_n > tb->zeroes_num) {
+			body += (l_n - tb->zeroes_num);
+			tb->zeroes_num = 0;
+		} else
+			tb->zeroes_num -= l_n;
+		tb->pos_in_item = 0;
+
+		RFALSE(comp_short_le_keys(&tbS0_0_ih->ih_key,
+					  leaf_key(tb->L[0],
+						 B_NR_ITEMS(tb->L[0]) - 1)) ||
+		       !op_is_left_mergeable(leaf_key(tbS0, 0), tbS0->b_size) ||
+		       !op_is_left_mergeable(left_delim_key, tbS0->b_size),
+		       "PAP-12120: item must be merge-able with left "
+		       "neighboring item");
+	} else {
+		/* only part of the appended item will be in L[0] */
+
+		/* Calculate position in item for append in S[0] */
+		tb->pos_in_item -= tb->lbytes;
+
+		RFALSE(tb->pos_in_item <= 0,
+		       "PAP-12125: no place for paste. pos_in_item=%d",
+		       tb->pos_in_item);
+
+		/*
+		 * Shift lnum[0] - 1 items in whole.
+		 * Shift lbytes - 1 byte from item number lnum[0]
+		 */
+		leaf_shift_left(tb, tb->lnum[0], tb->lbytes);
+	}
+}
+
+
+/* appended item will be in L[0] in whole */
+static void balance_leaf_paste_left_whole(struct tree_balance *tb,
+					  struct item_head *ih,
+					  const char *body)
+{
+	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
 	int n = B_NR_ITEMS(tb->L[0]);
+	struct buffer_info bi;
+	struct item_head *pasted;
+	int ret;
 
-				if (tb->item_pos == tb->lnum[0] - 1 && tb->lbytes != -1) {
-					/* we must shift the part of the appended item */
-					if (is_direntry_le_ih(item_head(tbS0, tb->item_pos))) {
-
-						RFALSE(tb->zeroes_num,
-						       "PAP-12090: invalid parameter in case of a directory");
-						/* directory item */
-						if (tb->lbytes > tb->pos_in_item) {
-							/* new directory entry falls into L[0] */
-							struct item_head *pasted;
-							int l_pos_in_item = tb->pos_in_item;
-
-							/* Shift lnum[0] - 1 items in whole. Shift lbytes - 1 entries from given directory item */
-							ret_val = leaf_shift_left(tb, tb->lnum[0], tb->lbytes-1);
-							if (ret_val && !tb->item_pos) {
-								pasted = item_head(tb->L[0], B_NR_ITEMS(tb->L[0]) - 1);
-								l_pos_in_item += ih_entry_count(pasted) - (tb->lbytes -1);
-							}
-
-							/* Append given directory entry to directory item */
-							buffer_info_init_left(tb, &bi);
-							leaf_paste_in_buffer(&bi, n + tb->item_pos - ret_val, l_pos_in_item, tb->insert_size[0], body, tb->zeroes_num);
-
-							/* previous string prepared space for pasting new entry, following string pastes this entry */
-
-							/* when we have merge directory item, pos_in_item has been changed too */
-
-							/* paste new directory entry. 1 is entry number */
-							leaf_paste_entries(&bi, n + tb->item_pos - ret_val, l_pos_in_item,
-									   1, (struct reiserfs_de_head *) body,
-									   body + DEH_SIZE, tb->insert_size[0]);
-							tb->insert_size[0] = 0;
-						} else {
-							/* new directory item doesn't fall into L[0] */
-							/* Shift lnum[0]-1 items in whole. Shift lbytes directory entries from directory item number lnum[0] */
-							leaf_shift_left(tb, tb->lnum[0], tb->lbytes);
-						}
-						/* Calculate new position to append in item body */
-						tb->pos_in_item -= tb->lbytes;
-					} else {
-						/* regular object */
-						RFALSE(tb->lbytes <= 0, "PAP-12095: there is nothing to shift to L[0]. lbytes=%d", tb->lbytes);
-						RFALSE(tb->pos_in_item != ih_item_len(item_head(tbS0, tb->item_pos)),
-						       "PAP-12100: incorrect position to paste: item_len=%d, pos_in_item=%d",
-						       ih_item_len(item_head(tbS0, tb->item_pos)), tb->pos_in_item);
-
-						if (tb->lbytes >= tb->pos_in_item) {
-							/* appended item will be in L[0] in whole */
-							int l_n;
-
-							/* this bytes number must be appended to the last item of L[h] */
-							l_n = tb->lbytes - tb->pos_in_item;
-
-							/* Calculate new insert_size[0] */
-							tb->insert_size[0] -= l_n;
-
-							RFALSE(tb->insert_size[0] <= 0,
-							       "PAP-12105: there is nothing to paste into L[0]. insert_size=%d",
-							       tb->insert_size[0]);
-							ret_val = leaf_shift_left(tb, tb->lnum[0], ih_item_len
-									    (item_head(tbS0, tb->item_pos)));
-							/* Append to body of item in L[0] */
-							buffer_info_init_left(tb, &bi);
-							leaf_paste_in_buffer
-							    (&bi, n + tb->item_pos - ret_val, ih_item_len
-							     (item_head(tb->L[0], n + tb->item_pos - ret_val)),
-							     l_n, body,
-							     tb->zeroes_num > l_n ? l_n : tb->zeroes_num);
-							/* 0-th item in S0 can be only of DIRECT type when l_n != 0 */
-							{
-								int version;
-								int temp_l = l_n;
-
-								RFALSE(ih_item_len(item_head(tbS0, 0)),
-								     "PAP-12106: item length must be 0");
-								RFALSE(comp_short_le_keys(leaf_key(tbS0, 0), leaf_key
-								      (tb->L[0], n + tb->item_pos - ret_val)),
-								     "PAP-12107: items must be of the same file");
-								if (is_indirect_le_ih(item_head(tb->L[0], n + tb->item_pos - ret_val))) {
-									temp_l = l_n << (tb->tb_sb-> s_blocksize_bits - UNFM_P_SHIFT);
-								}
-								/* update key of first item in S0 */
-								version = ih_version(item_head(tbS0, 0));
-								set_le_key_k_offset(version, leaf_key(tbS0, 0),
-								     le_key_k_offset(version,leaf_key(tbS0, 0)) + temp_l);
-								/* update left delimiting key */
-								set_le_key_k_offset(version, internal_key(tb->CFL[0], tb->lkey[0]),
-								     le_key_k_offset(version, internal_key(tb->CFL[0], tb->lkey[0])) + temp_l);
-							}
-
-							/* Calculate new body, position in item and insert_size[0] */
-							if (l_n > tb->zeroes_num) {
-								body += (l_n - tb->zeroes_num);
-								tb->zeroes_num = 0;
-							} else
-								tb->zeroes_num -= l_n;
-							tb->pos_in_item = 0;
-
-							RFALSE(comp_short_le_keys(leaf_key(tbS0, 0), leaf_key(tb->L[0], B_NR_ITEMS(tb->L[0]) - 1))
-							     || !op_is_left_mergeable(leaf_key(tbS0, 0), tbS0->b_size)
-							     || !op_is_left_mergeable(internal_key(tb->CFL[0], tb->lkey[0]), tbS0->b_size),
-							     "PAP-12120: item must be merge-able with left neighboring item");
-						} else {	/* only part of the appended item will be in L[0] */
-
-							/* Calculate position in item for append in S[0] */
-							tb->pos_in_item -= tb->lbytes;
-
-							RFALSE(tb->pos_in_item <= 0, "PAP-12125: no place for paste. pos_in_item=%d", tb->pos_in_item);
-
-							/* Shift lnum[0] - 1 items in whole. Shift lbytes - 1 byte from item number lnum[0] */
-							leaf_shift_left(tb, tb->lnum[0], tb->lbytes);
-						}
-					}
-				} else {	/* appended item will be in L[0] in whole */
-
-					struct item_head *pasted;
-
-					if (!tb->item_pos && op_is_left_mergeable(leaf_key(tbS0, 0), tbS0->b_size)) {	/* if we paste into first item of S[0] and it is left mergable */
-						/* then increment pos_in_item by the size of the last item in L[0] */
-						pasted = item_head(tb->L[0], n - 1);
-						if (is_direntry_le_ih(pasted))
-							tb->pos_in_item += ih_entry_count(pasted);
-						else
-							tb->pos_in_item += ih_item_len(pasted);
-					}
-
-					/* Shift lnum[0] - 1 items in whole. Shift lbytes - 1 byte from item number lnum[0] */
-					ret_val = leaf_shift_left(tb, tb->lnum[0], tb->lbytes);
-					/* Append to body of item in L[0] */
-					buffer_info_init_left(tb, &bi);
-					leaf_paste_in_buffer(&bi, n + tb->item_pos - ret_val,
-							     tb->pos_in_item,
-							     tb->insert_size[0],
-							     body, tb->zeroes_num);
-
-					/* if appended item is directory, paste entry */
-					pasted = item_head(tb->L[0], n + tb->item_pos - ret_val);
-					if (is_direntry_le_ih(pasted))
-						leaf_paste_entries(&bi, n + tb->item_pos - ret_val,
-								   tb->pos_in_item, 1,
-								   (struct reiserfs_de_head *) body,
-								   body + DEH_SIZE,
-								   tb->insert_size[0]);
-					/* if appended item is indirect item, put unformatted node into un list */
-					if (is_indirect_le_ih(pasted))
-						set_ih_free_space(pasted, 0);
-					tb->insert_size[0] = 0;
-					tb->zeroes_num = 0;
-				}
+	/* if we paste into first item of S[0] and it is left mergable */
+	if (!tb->item_pos &&
+	    op_is_left_mergeable(leaf_key(tbS0, 0), tbS0->b_size)) {
+		/*
+		 * then increment pos_in_item by the size of the
+		 * last item in L[0]
+		 */
+		pasted = item_head(tb->L[0], n - 1);
+		if (is_direntry_le_ih(pasted))
+			tb->pos_in_item += ih_entry_count(pasted);
+		else
+			tb->pos_in_item += ih_item_len(pasted);
+	}
+
+	/*
+	 * Shift lnum[0] - 1 items in whole.
+	 * Shift lbytes - 1 byte from item number lnum[0]
+	 */
+	ret = leaf_shift_left(tb, tb->lnum[0], tb->lbytes);
+
+	/* Append to body of item in L[0] */
+	buffer_info_init_left(tb, &bi);
+	leaf_paste_in_buffer(&bi, n + tb->item_pos - ret, tb->pos_in_item,
+			     tb->insert_size[0], body, tb->zeroes_num);
+
+	/* if appended item is directory, paste entry */
+	pasted = item_head(tb->L[0], n + tb->item_pos - ret);
+	if (is_direntry_le_ih(pasted))
+		leaf_paste_entries(&bi, n + tb->item_pos - ret,
+				   tb->pos_in_item, 1,
+				   (struct reiserfs_de_head *)body,
+				   body + DEH_SIZE, tb->insert_size[0]);
+
+	/*
+	 * if appended item is indirect item, put unformatted node
+	 * into un list
+	 */
+	if (is_indirect_le_ih(pasted))
+		set_ih_free_space(pasted, 0);
+
+	tb->insert_size[0] = 0;
+	tb->zeroes_num = 0;
+}
 
+static void balance_leaf_paste_left(struct tree_balance *tb,
+				    struct item_head *ih, const char *body)
+{
+	/* we must shift the part of the appended item */
+	if (tb->item_pos == tb->lnum[0] - 1 && tb->lbytes != -1)
+		balance_leaf_paste_left_shift(tb, ih, body);
+	else
+		balance_leaf_paste_left_whole(tb, ih, body);
 }
 
 /* Shift lnum[0] items from S[0] to the left neighbor L[0] */


