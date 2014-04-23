From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 29/29] reiserfs: balance_leaf refactor, split up balance_leaf_when_delete
Date: Wed, 23 Apr 2014 10:01:02 -0400
Message-ID: <20140423151151.390283854@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-balance_leaf-refactor-split-up-balance_leaf_when_delete
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

Splut up balance_leaf_when_delete into:
balance_leaf_when_delete_del
balance_leaf_when_cut
balance_leaf_when_delete_left

Also reformat to adhere to CodingStyle.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/do_balan.c |  318 +++++++++++++++++++++++++------------------------
 1 file changed, 163 insertions(+), 155 deletions(-)

--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -74,6 +74,159 @@ inline void do_balance_mark_leaf_dirty(s
  * Note that all *num* count new items being created.
  */
 
+static void balance_leaf_when_delete_del(struct tree_balance *tb)
+{
+	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
+	int item_pos = PATH_LAST_POSITION(tb->tb_path);
+	struct buffer_info bi;
+#ifdef CONFIG_REISERFS_CHECK
+	struct item_head *ih = item_head(tbS0, item_pos);
+#endif
+
+	RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
+	       "vs-12013: mode Delete, insert size %d, ih to be deleted %h",
+	       -tb->insert_size[0], ih);
+
+	buffer_info_init_tbS0(tb, &bi);
+	leaf_delete_items(&bi, 0, item_pos, 1, -1);
+
+	if (!item_pos && tb->CFL[0]) {
+		if (B_NR_ITEMS(tbS0)) {
+			replace_key(tb, tb->CFL[0], tb->lkey[0], tbS0, 0);
+		} else {
+			if (!PATH_H_POSITION(tb->tb_path, 1))
+				replace_key(tb, tb->CFL[0], tb->lkey[0],
+					    PATH_H_PPARENT(tb->tb_path, 0), 0);
+		}
+	}
+
+	RFALSE(!item_pos && !tb->CFL[0],
+	       "PAP-12020: tb->CFL[0]==%p, tb->L[0]==%p", tb->CFL[0],
+	       tb->L[0]);
+}
+
+/* cut item in S[0] */
+static void balance_leaf_when_delete_cut(struct tree_balance *tb)
+{
+	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
+	int item_pos = PATH_LAST_POSITION(tb->tb_path);
+	struct item_head *ih = item_head(tbS0, item_pos);
+	int pos_in_item = tb->tb_path->pos_in_item;
+	struct buffer_info bi;
+	buffer_info_init_tbS0(tb, &bi);
+
+	if (is_direntry_le_ih(ih)) {
+		/*
+		 * UFS unlink semantics are such that you can only
+		 * delete one directory entry at a time.
+		 *
+		 * when we cut a directory tb->insert_size[0] means
+		 * number of entries to be cut (always 1)
+		 */
+		tb->insert_size[0] = -1;
+		leaf_cut_from_buffer(&bi, item_pos, pos_in_item,
+				     -tb->insert_size[0]);
+
+		RFALSE(!item_pos && !pos_in_item && !tb->CFL[0],
+		       "PAP-12030: can not change delimiting key. CFL[0]=%p",
+		       tb->CFL[0]);
+
+		if (!item_pos && !pos_in_item && tb->CFL[0])
+			replace_key(tb, tb->CFL[0], tb->lkey[0], tbS0, 0);
+	} else {
+		leaf_cut_from_buffer(&bi, item_pos, pos_in_item,
+				     -tb->insert_size[0]);
+
+		RFALSE(!ih_item_len(ih),
+		       "PAP-12035: cut must leave non-zero dynamic "
+		       "length of item");
+	}
+}
+
+static int balance_leaf_when_delete_left(struct tree_balance *tb)
+{
+	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
+	int n = B_NR_ITEMS(tbS0);
+
+	/* L[0] must be joined with S[0] */
+	if (tb->lnum[0] == -1) {
+		/* R[0] must be also joined with S[0] */
+		if (tb->rnum[0] == -1) {
+			if (tb->FR[0] == PATH_H_PPARENT(tb->tb_path, 0)) {
+				/*
+				 * all contents of all the
+				 * 3 buffers will be in L[0]
+				 */
+				if (PATH_H_POSITION(tb->tb_path, 1) == 0 &&
+				    1 < B_NR_ITEMS(tb->FR[0]))
+					replace_key(tb, tb->CFL[0],
+						    tb->lkey[0], tb->FR[0], 1);
+
+				leaf_move_items(LEAF_FROM_S_TO_L, tb, n, -1,
+						NULL);
+				leaf_move_items(LEAF_FROM_R_TO_L, tb,
+						B_NR_ITEMS(tb->R[0]), -1,
+						NULL);
+
+				reiserfs_invalidate_buffer(tb, tbS0);
+				reiserfs_invalidate_buffer(tb, tb->R[0]);
+
+				return 0;
+			}
+
+			/* all contents of all the 3 buffers will be in R[0] */
+			leaf_move_items(LEAF_FROM_S_TO_R, tb, n, -1, NULL);
+			leaf_move_items(LEAF_FROM_L_TO_R, tb,
+					B_NR_ITEMS(tb->L[0]), -1, NULL);
+
+			/* right_delimiting_key is correct in R[0] */
+			replace_key(tb, tb->CFR[0], tb->rkey[0], tb->R[0], 0);
+
+			reiserfs_invalidate_buffer(tb, tbS0);
+			reiserfs_invalidate_buffer(tb, tb->L[0]);
+
+			return -1;
+		}
+
+		RFALSE(tb->rnum[0] != 0,
+		       "PAP-12045: rnum must be 0 (%d)", tb->rnum[0]);
+		/* all contents of L[0] and S[0] will be in L[0] */
+		leaf_shift_left(tb, n, -1);
+
+		reiserfs_invalidate_buffer(tb, tbS0);
+
+		return 0;
+	}
+
+	/*
+	 * a part of contents of S[0] will be in L[0] and
+	 * the rest part of S[0] will be in R[0]
+	 */
+
+	RFALSE((tb->lnum[0] + tb->rnum[0] < n) ||
+	       (tb->lnum[0] + tb->rnum[0] > n + 1),
+	       "PAP-12050: rnum(%d) and lnum(%d) and item "
+	       "number(%d) in S[0] are not consistent",
+	       tb->rnum[0], tb->lnum[0], n);
+	RFALSE((tb->lnum[0] + tb->rnum[0] == n) &&
+	       (tb->lbytes != -1 || tb->rbytes != -1),
+	       "PAP-12055: bad rbytes (%d)/lbytes (%d) "
+	       "parameters when items are not split",
+	       tb->rbytes, tb->lbytes);
+	RFALSE((tb->lnum[0] + tb->rnum[0] == n + 1) &&
+	       (tb->lbytes < 1 || tb->rbytes != -1),
+	       "PAP-12060: bad rbytes (%d)/lbytes (%d) "
+	       "parameters when items are split",
+	       tb->rbytes, tb->lbytes);
+
+	leaf_shift_left(tb, tb->lnum[0], tb->lbytes);
+	leaf_shift_right(tb, tb->rnum[0], tb->rbytes);
+
+	reiserfs_invalidate_buffer(tb, tbS0);
+
+	return 0;
+}
+
 /*
  * Balance leaf node in case of delete or cut: insert_size[0] < 0
  *
@@ -87,7 +240,6 @@ static int balance_leaf_when_delete(stru
 {
 	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
 	int item_pos = PATH_LAST_POSITION(tb->tb_path);
-	int pos_in_item = tb->tb_path->pos_in_item;
 	struct buffer_info bi;
 	int n;
 	struct item_head *ih;
@@ -104,166 +256,23 @@ static int balance_leaf_when_delete(stru
 
 	/* Delete or truncate the item */
 
-	switch (flag) {
-	case M_DELETE:		/* delete item in S[0] */
-
-		RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
-		       "vs-12013: mode Delete, insert size %d, ih to be deleted %h",
-		       -tb->insert_size[0], ih);
-
-		leaf_delete_items(&bi, 0, item_pos, 1, -1);
-
-		if (!item_pos && tb->CFL[0]) {
-			if (B_NR_ITEMS(tbS0)) {
-				replace_key(tb, tb->CFL[0], tb->lkey[0], tbS0,
-					    0);
-			} else {
-				if (!PATH_H_POSITION(tb->tb_path, 1))
-					replace_key(tb, tb->CFL[0], tb->lkey[0],
-						    PATH_H_PPARENT(tb->tb_path,
-								   0), 0);
-			}
-		}
-
-		RFALSE(!item_pos && !tb->CFL[0],
-		       "PAP-12020: tb->CFL[0]==%p, tb->L[0]==%p", tb->CFL[0],
-		       tb->L[0]);
-
-		break;
-
-	case M_CUT:{		/* cut item in S[0] */
-			if (is_direntry_le_ih(ih)) {
-
-				/*
-				 * UFS unlink semantics are such that you
-				 * can only delete one directory entry at
-				 * a time.
-				 */
-
-				/*
-				 * when we cut a directory tb->insert_size[0]
-				 * means number of entries to be cut (always 1)
-				 */
-				tb->insert_size[0] = -1;
-				leaf_cut_from_buffer(&bi, item_pos, pos_in_item,
-						     -tb->insert_size[0]);
-
-				RFALSE(!item_pos && !pos_in_item && !tb->CFL[0],
-				       "PAP-12030: can not change delimiting key. CFL[0]=%p",
-				       tb->CFL[0]);
-
-				if (!item_pos && !pos_in_item && tb->CFL[0]) {
-					replace_key(tb, tb->CFL[0], tb->lkey[0],
-						    tbS0, 0);
-				}
-			} else {
-				leaf_cut_from_buffer(&bi, item_pos, pos_in_item,
-						     -tb->insert_size[0]);
-
-				RFALSE(!ih_item_len(ih),
-				       "PAP-12035: cut must leave non-zero dynamic length of item");
-			}
-			break;
-		}
+	BUG_ON(flag != M_DELETE && flag != M_CUT);
+	if (flag == M_DELETE)
+		balance_leaf_when_delete_del(tb);
+	else /* M_CUT */
+		balance_leaf_when_delete_cut(tb);
 
-	default:
-		print_cur_tb("12040");
-		reiserfs_panic(tb->tb_sb, "PAP-12040",
-			       "unexpected mode: %s(%d)",
-			       (flag ==
-				M_PASTE) ? "PASTE" : ((flag ==
-						       M_INSERT) ? "INSERT" :
-						      "UNKNOWN"), flag);
-	}
 
 	/*
 	 * the rule is that no shifting occurs unless by shifting
 	 * a node can be freed
 	 */
 	n = B_NR_ITEMS(tbS0);
-	/* L[0] takes part in balancing */
-	if (tb->lnum[0]) {
-		/* L[0] must be joined with S[0] */
-		if (tb->lnum[0] == -1) {
-			/* R[0] must be also joined with S[0] */
-			if (tb->rnum[0] == -1) {
-				if (tb->FR[0] == PATH_H_PPARENT(tb->tb_path, 0)) {
-					/*
-					 * all contents of all the 3 buffers
-					 * will be in L[0]
-					 */
-					if (PATH_H_POSITION(tb->tb_path, 1) == 0
-					    && 1 < B_NR_ITEMS(tb->FR[0]))
-						replace_key(tb, tb->CFL[0],
-							    tb->lkey[0],
-							    tb->FR[0], 1);
-
-					leaf_move_items(LEAF_FROM_S_TO_L, tb, n,
-							-1, NULL);
-					leaf_move_items(LEAF_FROM_R_TO_L, tb,
-							B_NR_ITEMS(tb->R[0]),
-							-1, NULL);
-
-					reiserfs_invalidate_buffer(tb, tbS0);
-					reiserfs_invalidate_buffer(tb,
-								   tb->R[0]);
-
-					return 0;
-				}
-				/*
-				 * all contents of all the 3 buffers will
-				 * be in R[0]
-				 */
-				leaf_move_items(LEAF_FROM_S_TO_R, tb, n, -1,
-						NULL);
-				leaf_move_items(LEAF_FROM_L_TO_R, tb,
-						B_NR_ITEMS(tb->L[0]), -1, NULL);
 
-				/* right_delimiting_key is correct in R[0] */
-				replace_key(tb, tb->CFR[0], tb->rkey[0],
-					    tb->R[0], 0);
 
-				reiserfs_invalidate_buffer(tb, tbS0);
-				reiserfs_invalidate_buffer(tb, tb->L[0]);
-
-				return -1;
-			}
-
-			RFALSE(tb->rnum[0] != 0,
-			       "PAP-12045: rnum must be 0 (%d)", tb->rnum[0]);
-			/* all contents of L[0] and S[0] will be in L[0] */
-			leaf_shift_left(tb, n, -1);
-
-			reiserfs_invalidate_buffer(tb, tbS0);
-
-			return 0;
-		}
-
-		/*
-		 * a part of contents of S[0] will be in L[0] and the
-		 * rest part of S[0] will be in R[0]
-		 */
-
-		RFALSE((tb->lnum[0] + tb->rnum[0] < n) ||
-		       (tb->lnum[0] + tb->rnum[0] > n + 1),
-		       "PAP-12050: rnum(%d) and lnum(%d) and item number(%d) in S[0] are not consistent",
-		       tb->rnum[0], tb->lnum[0], n);
-		RFALSE((tb->lnum[0] + tb->rnum[0] == n) &&
-		       (tb->lbytes != -1 || tb->rbytes != -1),
-		       "PAP-12055: bad rbytes (%d)/lbytes (%d) parameters when items are not split",
-		       tb->rbytes, tb->lbytes);
-		RFALSE((tb->lnum[0] + tb->rnum[0] == n + 1) &&
-		       (tb->lbytes < 1 || tb->rbytes != -1),
-		       "PAP-12060: bad rbytes (%d)/lbytes (%d) parameters when items are split",
-		       tb->rbytes, tb->lbytes);
-
-		leaf_shift_left(tb, tb->lnum[0], tb->lbytes);
-		leaf_shift_right(tb, tb->rnum[0], tb->rbytes);
-
-		reiserfs_invalidate_buffer(tb, tbS0);
-
-		return 0;
-	}
+	/* L[0] takes part in balancing */
+	if (tb->lnum[0])
+		return balance_leaf_when_delete_left(tb);
 
 	if (tb->rnum[0] == -1) {
 		/* all contents of R[0] and S[0] will be in R[0] */
@@ -1880,9 +1889,8 @@ void do_balance(struct tree_balance *tb,
 
 	/* Balance internal level of the tree. */
 	for (h = 1; h < MAX_HEIGHT && tb->insert_size[h]; h++)
-		child_pos =
-		    balance_internal(tb, h, child_pos, insert_key, insert_ptr);
+		child_pos = balance_internal(tb, h, child_pos, insert_key,
+					     insert_ptr);
 
 	do_balance_completed(tb);
-
 }


