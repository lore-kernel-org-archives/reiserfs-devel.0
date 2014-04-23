From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 02/29] reiserfs: cleanup, rename key and item accessors to more friendly names
Date: Wed, 23 Apr 2014 10:00:35 -0400
Message-ID: <20140423151139.179552645@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-rename-key-and-item_head-accessors-to-more-friendly-names
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

This patch does a quick search and replace:
B_N_PITEM_HEAD() -> item_head()
B_N_PDELIM_KEY() -> internal_key()
B_N_PKEY() -> leaf_key()
B_N_PITEM() -> item_body()

And the item_head version:
B_I_PITEM() -> ih_item_body()
I_ENTRY_COUNT() -> ih_entry_count()

And the treepath variants:
get_ih() -> tp_item_head()
PATH_PITEM_HEAD() -> tp_item_head()
get_item() -> tp_item_body()

... which makes the code much easier on the eyes.

I've also removed a few unused macros.

Checkpatch will complain about the 80 character limit for do_balan.c.
I've addressed that in a later patchset to split up balance_leaf().

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/bitmap.c          |    4 
 fs/reiserfs/dir.c             |    8 -
 fs/reiserfs/do_balan.c        |   98 +++++++++++------------
 fs/reiserfs/fix_node.c        |   20 ++--
 fs/reiserfs/ibalance.c        |   20 ++--
 fs/reiserfs/inode.c           |   36 ++++----
 fs/reiserfs/item_ops.c        |    4 
 fs/reiserfs/lbalance.c        |   76 +++++++++---------
 fs/reiserfs/namei.c           |   14 +--
 fs/reiserfs/prints.c          |   10 +-
 fs/reiserfs/reiserfs.h        |  175 ++++++++++++++++++++++++++----------------
 fs/reiserfs/stree.c           |   44 +++++-----
 fs/reiserfs/super.c           |    4 
 fs/reiserfs/tail_conversion.c |   10 +-
 14 files changed, 284 insertions(+), 239 deletions(-)

--- a/fs/reiserfs/bitmap.c
+++ b/fs/reiserfs/bitmap.c
@@ -819,9 +819,9 @@ static int get_left_neighbor(reiserfs_bl
 	path = hint->path;
 	bh = get_last_bh(path);
 	RFALSE(!bh, "green-4002: Illegal path specified to get_left_neighbor");
-	ih = get_ih(path);
+	ih = tp_item_head(path);
 	pos_in_item = path->pos_in_item;
-	item = get_item(path);
+	item = tp_item_body(path);
 
 	hint->search_start = bh->b_blocknr;
 
--- a/fs/reiserfs/dir.c
+++ b/fs/reiserfs/dir.c
@@ -110,17 +110,17 @@ int reiserfs_readdir_inode(struct inode
 		       item_num, B_NR_ITEMS(bh));
 
 		/* and entry must be not more than number of entries in the item */
-		RFALSE(I_ENTRY_COUNT(ih) < entry_num,
+		RFALSE(ih_entry_count(ih) < entry_num,
 		       "vs-9010: entry number is too big %d (%d)",
-		       entry_num, I_ENTRY_COUNT(ih));
+		       entry_num, ih_entry_count(ih));
 
 		if (search_res == POSITION_FOUND
-		    || entry_num < I_ENTRY_COUNT(ih)) {
+		    || entry_num < ih_entry_count(ih)) {
 			/* go through all entries in the directory item beginning from the entry, that has been found */
 			struct reiserfs_de_head *deh =
 			    B_I_DEH(bh, ih) + entry_num;
 
-			for (; entry_num < I_ENTRY_COUNT(ih);
+			for (; entry_num < ih_entry_count(ih);
 			     entry_num++, deh++) {
 				int d_reclen;
 				char *d_name;
--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -114,7 +114,7 @@ static int balance_leaf_when_delete(stru
 	RFALSE(!tb->blknum[0] && !PATH_H_PPARENT(tb->tb_path, 0),
 	       "PAP-12010: tree can not be empty");
 
-	ih = B_N_PITEM_HEAD(tbS0, item_pos);
+	ih = item_head(tbS0, item_pos);
 	buffer_info_init_tbS0(tb, &bi);
 
 	/* Delete or truncate the item */
@@ -312,7 +312,7 @@ static int balance_leaf(struct tree_bala
 	/* for indirect item pos_in_item is measured in unformatted node
 	   pointers. Recalculate to bytes */
 	if (flag != M_INSERT
-	    && is_indirect_le_ih(B_N_PITEM_HEAD(tbS0, item_pos)))
+	    && is_indirect_le_ih(item_head(tbS0, item_pos)))
 		pos_in_item *= UNFM_P_SIZE;
 
 	if (tb->lnum[0] > 0) {
@@ -378,7 +378,7 @@ static int balance_leaf(struct tree_bala
 
 				if (item_pos == tb->lnum[0] - 1 && tb->lbytes != -1) {
 					/* we must shift the part of the appended item */
-					if (is_direntry_le_ih(B_N_PITEM_HEAD(tbS0, item_pos))) {
+					if (is_direntry_le_ih(item_head(tbS0, item_pos))) {
 
 						RFALSE(zeros_num,
 						       "PAP-12090: invalid parameter in case of a directory");
@@ -391,8 +391,8 @@ static int balance_leaf(struct tree_bala
 							/* Shift lnum[0] - 1 items in whole. Shift lbytes - 1 entries from given directory item */
 							ret_val = leaf_shift_left(tb, tb->lnum[0], tb->lbytes-1);
 							if (ret_val && !item_pos) {
-								pasted = B_N_PITEM_HEAD(tb->L[0], B_NR_ITEMS(tb->L[0]) - 1);
-								l_pos_in_item += I_ENTRY_COUNT(pasted) - (tb->lbytes -1);
+								pasted = item_head(tb->L[0], B_NR_ITEMS(tb->L[0]) - 1);
+								l_pos_in_item += ih_entry_count(pasted) - (tb->lbytes -1);
 							}
 
 							/* Append given directory entry to directory item */
@@ -418,9 +418,9 @@ static int balance_leaf(struct tree_bala
 					} else {
 						/* regular object */
 						RFALSE(tb->lbytes <= 0, "PAP-12095: there is nothing to shift to L[0]. lbytes=%d", tb->lbytes);
-						RFALSE(pos_in_item != ih_item_len(B_N_PITEM_HEAD(tbS0, item_pos)),
+						RFALSE(pos_in_item != ih_item_len(item_head(tbS0, item_pos)),
 						       "PAP-12100: incorrect position to paste: item_len=%d, pos_in_item=%d",
-						       ih_item_len(B_N_PITEM_HEAD(tbS0, item_pos)),pos_in_item);
+						       ih_item_len(item_head(tbS0, item_pos)),pos_in_item);
 
 						if (tb->lbytes >= pos_in_item) {
 							/* appended item will be in L[0] in whole */
@@ -436,12 +436,12 @@ static int balance_leaf(struct tree_bala
 							       "PAP-12105: there is nothing to paste into L[0]. insert_size=%d",
 							       tb->insert_size[0]);
 							ret_val = leaf_shift_left(tb, tb->lnum[0], ih_item_len
-									    (B_N_PITEM_HEAD(tbS0, item_pos)));
+									    (item_head(tbS0, item_pos)));
 							/* Append to body of item in L[0] */
 							buffer_info_init_left(tb, &bi);
 							leaf_paste_in_buffer
 							    (&bi, n + item_pos - ret_val, ih_item_len
-							     (B_N_PITEM_HEAD(tb->L[0], n + item_pos - ret_val)),
+							     (item_head(tb->L[0], n + item_pos - ret_val)),
 							     l_n, body,
 							     zeros_num > l_n ? l_n : zeros_num);
 							/* 0-th item in S0 can be only of DIRECT type when l_n != 0 */
@@ -449,21 +449,21 @@ static int balance_leaf(struct tree_bala
 								int version;
 								int temp_l = l_n;
 
-								RFALSE(ih_item_len(B_N_PITEM_HEAD(tbS0, 0)),
+								RFALSE(ih_item_len(item_head(tbS0, 0)),
 								     "PAP-12106: item length must be 0");
-								RFALSE(comp_short_le_keys(B_N_PKEY(tbS0, 0), B_N_PKEY
+								RFALSE(comp_short_le_keys(leaf_key(tbS0, 0), leaf_key
 								      (tb->L[0], n + item_pos - ret_val)),
 								     "PAP-12107: items must be of the same file");
-								if (is_indirect_le_ih(B_N_PITEM_HEAD(tb->L[0], n + item_pos - ret_val))) {
+								if (is_indirect_le_ih(item_head(tb->L[0], n + item_pos - ret_val))) {
 									temp_l = l_n << (tb->tb_sb-> s_blocksize_bits - UNFM_P_SHIFT);
 								}
 								/* update key of first item in S0 */
-								version = ih_version(B_N_PITEM_HEAD(tbS0, 0));
-								set_le_key_k_offset(version, B_N_PKEY(tbS0, 0),
-								     le_key_k_offset(version,B_N_PKEY(tbS0, 0)) + temp_l);
+								version = ih_version(item_head(tbS0, 0));
+								set_le_key_k_offset(version, leaf_key(tbS0, 0),
+								     le_key_k_offset(version,leaf_key(tbS0, 0)) + temp_l);
 								/* update left delimiting key */
-								set_le_key_k_offset(version, B_N_PDELIM_KEY(tb->CFL[0], tb->lkey[0]),
-								     le_key_k_offset(version, B_N_PDELIM_KEY(tb->CFL[0], tb->lkey[0])) + temp_l);
+								set_le_key_k_offset(version, internal_key(tb->CFL[0], tb->lkey[0]),
+								     le_key_k_offset(version, internal_key(tb->CFL[0], tb->lkey[0])) + temp_l);
 							}
 
 							/* Calculate new body, position in item and insert_size[0] */
@@ -474,9 +474,9 @@ static int balance_leaf(struct tree_bala
 								zeros_num -= l_n;
 							pos_in_item = 0;
 
-							RFALSE(comp_short_le_keys(B_N_PKEY(tbS0, 0), B_N_PKEY(tb->L[0], B_NR_ITEMS(tb->L[0]) - 1))
-							     || !op_is_left_mergeable(B_N_PKEY(tbS0, 0), tbS0->b_size)
-							     || !op_is_left_mergeable(B_N_PDELIM_KEY(tb->CFL[0], tb->lkey[0]), tbS0->b_size),
+							RFALSE(comp_short_le_keys(leaf_key(tbS0, 0), leaf_key(tb->L[0], B_NR_ITEMS(tb->L[0]) - 1))
+							     || !op_is_left_mergeable(leaf_key(tbS0, 0), tbS0->b_size)
+							     || !op_is_left_mergeable(internal_key(tb->CFL[0], tb->lkey[0]), tbS0->b_size),
 							     "PAP-12120: item must be merge-able with left neighboring item");
 						} else {	/* only part of the appended item will be in L[0] */
 
@@ -493,9 +493,9 @@ static int balance_leaf(struct tree_bala
 
 					struct item_head *pasted;
 
-					if (!item_pos && op_is_left_mergeable(B_N_PKEY(tbS0, 0), tbS0->b_size)) {	/* if we paste into first item of S[0] and it is left mergable */
+					if (!item_pos && op_is_left_mergeable(leaf_key(tbS0, 0), tbS0->b_size)) {	/* if we paste into first item of S[0] and it is left mergable */
 						/* then increment pos_in_item by the size of the last item in L[0] */
-						pasted = B_N_PITEM_HEAD(tb->L[0], n - 1);
+						pasted = item_head(tb->L[0], n - 1);
 						if (is_direntry_le_ih(pasted))
 							pos_in_item += ih_entry_count(pasted);
 						else
@@ -512,7 +512,7 @@ static int balance_leaf(struct tree_bala
 							     body, zeros_num);
 
 					/* if appended item is directory, paste entry */
-					pasted = B_N_PITEM_HEAD(tb->L[0], n + item_pos - ret_val);
+					pasted = item_head(tb->L[0], n + item_pos - ret_val);
 					if (is_direntry_le_ih(pasted))
 						leaf_paste_entries(&bi, n + item_pos - ret_val,
 								   pos_in_item, 1,
@@ -617,12 +617,12 @@ static int balance_leaf(struct tree_bala
 
 			if (n - tb->rnum[0] <= item_pos) {	/* pasted item or part of it falls to R[0] */
 				if (item_pos == n - tb->rnum[0] && tb->rbytes != -1) {	/* we must shift the part of the appended item */
-					if (is_direntry_le_ih(B_N_PITEM_HEAD(tbS0, item_pos))) {	/* we append to directory item */
+					if (is_direntry_le_ih(item_head(tbS0, item_pos))) {	/* we append to directory item */
 						int entry_count;
 
 						RFALSE(zeros_num,
 						       "PAP-12145: invalid parameter in case of a directory");
-						entry_count = I_ENTRY_COUNT(B_N_PITEM_HEAD
+						entry_count = ih_entry_count(item_head
 								  (tbS0, item_pos));
 						if (entry_count - tb->rbytes <
 						    pos_in_item)
@@ -665,10 +665,10 @@ static int balance_leaf(struct tree_bala
 							n_shift = 0;
 
 						RFALSE(pos_in_item != ih_item_len
-						       (B_N_PITEM_HEAD(tbS0, item_pos)),
+						       (item_head(tbS0, item_pos)),
 						       "PAP-12155: invalid position to paste. ih_item_len=%d, pos_in_item=%d",
 						       pos_in_item, ih_item_len
-						       (B_N_PITEM_HEAD(tbS0, item_pos)));
+						       (item_head(tbS0, item_pos)));
 
 						leaf_shift_right(tb, tb->rnum[0], n_shift);
 						/* Calculate number of bytes which must remain in body after appending to R[0] */
@@ -679,17 +679,17 @@ static int balance_leaf(struct tree_bala
 							int version;
 							unsigned long temp_rem = n_rem;
 
-							version = ih_version(B_N_PITEM_HEAD(tb->R[0], 0));
-							if (is_indirect_le_key(version, B_N_PKEY(tb->R[0], 0))) {
+							version = ih_version(item_head(tb->R[0], 0));
+							if (is_indirect_le_key(version, leaf_key(tb->R[0], 0))) {
 								temp_rem = n_rem << (tb->tb_sb->s_blocksize_bits - UNFM_P_SHIFT);
 							}
-							set_le_key_k_offset(version, B_N_PKEY(tb->R[0], 0),
-							     le_key_k_offset(version, B_N_PKEY(tb->R[0], 0)) + temp_rem);
-							set_le_key_k_offset(version, B_N_PDELIM_KEY(tb->CFR[0], tb->rkey[0]),
-							     le_key_k_offset(version, B_N_PDELIM_KEY(tb->CFR[0], tb->rkey[0])) + temp_rem);
+							set_le_key_k_offset(version, leaf_key(tb->R[0], 0),
+							     le_key_k_offset(version, leaf_key(tb->R[0], 0)) + temp_rem);
+							set_le_key_k_offset(version, internal_key(tb->CFR[0], tb->rkey[0]),
+							     le_key_k_offset(version, internal_key(tb->CFR[0], tb->rkey[0])) + temp_rem);
 						}
-/*		  k_offset (B_N_PKEY(tb->R[0],0)) += n_rem;
-		  k_offset (B_N_PDELIM_KEY(tb->CFR[0],tb->rkey[0])) += n_rem;*/
+/*		  k_offset (leaf_key(tb->R[0],0)) += n_rem;
+		  k_offset (internal_key(tb->CFR[0],tb->rkey[0])) += n_rem;*/
 						do_balance_mark_internal_dirty(tb, tb->CFR[0], 0);
 
 						/* Append part of body into R[0] */
@@ -707,12 +707,12 @@ static int balance_leaf(struct tree_bala
 								     tb->insert_size[0] - n_rem,
 								     r_body, r_zeros_number);
 
-						if (is_indirect_le_ih(B_N_PITEM_HEAD(tb->R[0], 0))) {
+						if (is_indirect_le_ih(item_head(tb->R[0], 0))) {
 #if 0
 							RFALSE(n_rem,
 							       "PAP-12160: paste more than one unformatted node pointer");
 #endif
-							set_ih_free_space(B_N_PITEM_HEAD(tb->R[0], 0), 0);
+							set_ih_free_space(item_head(tb->R[0], 0), 0);
 						}
 						tb->insert_size[0] = n_rem;
 						if (!n_rem)
@@ -731,7 +731,7 @@ static int balance_leaf(struct tree_bala
 					}
 
 					/* paste new entry, if item is directory item */
-					pasted = B_N_PITEM_HEAD(tb->R[0], item_pos - n + tb->rnum[0]);
+					pasted = item_head(tb->R[0], item_pos - n + tb->rnum[0]);
 					if (is_direntry_le_ih(pasted) && pos_in_item >= 0) {
 						leaf_paste_entries(&bi, item_pos - n + tb->rnum[0],
 								   pos_in_item, 1,
@@ -784,8 +784,8 @@ static int balance_leaf(struct tree_bala
 			if (!tb->CFR[0])
 				reiserfs_panic(tb->tb_sb, "vs-12195",
 					       "CFR not initialized");
-			copy_key(B_N_PDELIM_KEY(tb->CFL[0], tb->lkey[0]),
-				 B_N_PDELIM_KEY(tb->CFR[0], tb->rkey[0]));
+			copy_key(internal_key(tb->CFL[0], tb->lkey[0]),
+				 internal_key(tb->CFR[0], tb->rkey[0]));
 			do_balance_mark_internal_dirty(tb, tb->CFL[0], 0);
 		}
 
@@ -886,7 +886,7 @@ static int balance_leaf(struct tree_bala
 
 					RFALSE(ih, "PAP-12210: ih must be 0");
 
-					aux_ih = B_N_PITEM_HEAD(tbS0, item_pos);
+					aux_ih = item_head(tbS0, item_pos);
 					if (is_direntry_le_ih(aux_ih)) {
 						/* we append to directory item */
 
@@ -922,7 +922,7 @@ static int balance_leaf(struct tree_bala
 						int n_shift, n_rem, r_zeros_number;
 						const char *r_body;
 
-						RFALSE(pos_in_item != ih_item_len(B_N_PITEM_HEAD(tbS0, item_pos)) || tb->insert_size[0] <= 0,
+						RFALSE(pos_in_item != ih_item_len(item_head(tbS0, item_pos)) || tb->insert_size[0] <= 0,
 						       "PAP-12225: item too short or insert_size <= 0");
 
 						/* Calculate number of bytes which must be shifted from appended item */
@@ -952,7 +952,7 @@ static int balance_leaf(struct tree_bala
 						{
 							struct item_head *tmp;
 
-							tmp = B_N_PITEM_HEAD(S_new[i], 0);
+							tmp = item_head(S_new[i], 0);
 							if (is_indirect_le_ih
 							    (tmp)) {
 								set_ih_free_space(tmp, 0);
@@ -973,7 +973,7 @@ static int balance_leaf(struct tree_bala
 					struct item_head *pasted;
 
 #ifdef CONFIG_REISERFS_CHECK
-					struct item_head *ih_check = B_N_PITEM_HEAD(tbS0, item_pos);
+					struct item_head *ih_check = item_head(tbS0, item_pos);
 
 					if (!is_direntry_le_ih(ih_check)
 					    && (pos_in_item != ih_item_len(ih_check)
@@ -1002,7 +1002,7 @@ static int balance_leaf(struct tree_bala
 							     tb->insert_size[0],
 							     body, zeros_num);
 
-					pasted = B_N_PITEM_HEAD(S_new[i], item_pos - n + snum[i]);
+					pasted = item_head(S_new[i], item_pos - n + snum[i]);
 					if (is_direntry_le_ih(pasted)) {
 						leaf_paste_entries(&bi,
 								   item_pos - n + snum[i],
@@ -1032,7 +1032,7 @@ static int balance_leaf(struct tree_bala
 				       (flag == M_DELETE) ? "DELETE" : ((flag == M_CUT) ? "CUT" : "UNKNOWN"), flag);
 		}
 
-		memcpy(insert_key + i, B_N_PKEY(S_new[i], 0), KEY_SIZE);
+		memcpy(insert_key + i, leaf_key(S_new[i], 0), KEY_SIZE);
 		insert_ptr[i] = S_new[i];
 
 		RFALSE(!buffer_journaled(S_new[i])
@@ -1061,7 +1061,7 @@ static int balance_leaf(struct tree_bala
 		case M_PASTE:{	/* append item in S[0] */
 				struct item_head *pasted;
 
-				pasted = B_N_PITEM_HEAD(tbS0, item_pos);
+				pasted = item_head(tbS0, item_pos);
 				/* when directory, may be new entry already pasted */
 				if (is_direntry_le_ih(pasted)) {
 					if (pos_in_item >= 0 && pos_in_item <= ih_entry_count(pasted)) {
@@ -1246,10 +1246,10 @@ void replace_key(struct tree_balance *tb
 
 	if (B_IS_ITEMS_LEVEL(src))
 		/* source buffer contains leaf node */
-		memcpy(B_N_PDELIM_KEY(dest, n_dest), B_N_PITEM_HEAD(src, n_src),
+		memcpy(internal_key(dest, n_dest), item_head(src, n_src),
 		       KEY_SIZE);
 	else
-		memcpy(B_N_PDELIM_KEY(dest, n_dest), B_N_PDELIM_KEY(src, n_src),
+		memcpy(internal_key(dest, n_dest), internal_key(src, n_src),
 		       KEY_SIZE);
 
 	do_balance_mark_internal_dirty(tb, dest, 0);
--- a/fs/reiserfs/fix_node.c
+++ b/fs/reiserfs/fix_node.c
@@ -105,7 +105,7 @@ static void create_virtual_node(struct t
 	vn->vn_free_ptr += vn->vn_nr_item * sizeof(struct virtual_item);
 
 	/* first item in the node */
-	ih = B_N_PITEM_HEAD(Sh, 0);
+	ih = item_head(Sh, 0);
 
 	/* define the mergeability for 0-th item (if it is not being deleted) */
 	if (op_is_left_mergeable(&(ih->ih_key), Sh->b_size)
@@ -128,7 +128,7 @@ static void create_virtual_node(struct t
 
 		vi->vi_item_len += ih_item_len(ih + j) + IH_SIZE;
 		vi->vi_ih = ih + j;
-		vi->vi_item = B_I_PITEM(Sh, ih + j);
+		vi->vi_item = ih_item_body(Sh, ih + j);
 		vi->vi_uarea = vn->vn_free_ptr;
 
 		// FIXME: there is no check, that item operation did not
@@ -168,7 +168,7 @@ static void create_virtual_node(struct t
 	if (tb->CFR[0]) {
 		struct reiserfs_key *key;
 
-		key = B_N_PDELIM_KEY(tb->CFR[0], tb->rkey[0]);
+		key = internal_key(tb->CFR[0], tb->rkey[0]);
 		if (op_is_left_mergeable(key, Sh->b_size)
 		    && (vn->vn_mode != M_DELETE
 			|| vn->vn_affected_item_num != B_NR_ITEMS(Sh) - 1))
@@ -182,8 +182,8 @@ static void create_virtual_node(struct t
 			/* we delete last item and it could be merged with right neighbor's first item */
 			if (!
 			    (B_NR_ITEMS(Sh) == 1
-			     && is_direntry_le_ih(B_N_PITEM_HEAD(Sh, 0))
-			     && I_ENTRY_COUNT(B_N_PITEM_HEAD(Sh, 0)) == 1)) {
+			     && is_direntry_le_ih(item_head(Sh, 0))
+			     && ih_entry_count(item_head(Sh, 0)) == 1)) {
 				/* node contains more than 1 item, or item is not directory item, or this item contains more than 1 entry */
 				print_block(Sh, 0, -1, -1);
 				reiserfs_panic(tb->tb_sb, "vs-8045",
@@ -675,10 +675,10 @@ static int are_leaves_removable(struct t
 		       "vs-8125: item number must be 1: it is %d",
 		       B_NR_ITEMS(S0));
 
-		ih = B_N_PITEM_HEAD(S0, 0);
+		ih = item_head(S0, 0);
 		if (tb->CFR[0]
 		    && !comp_short_le_keys(&(ih->ih_key),
-					   B_N_PDELIM_KEY(tb->CFR[0],
+					   internal_key(tb->CFR[0],
 							  tb->rkey[0])))
 			if (is_direntry_le_ih(ih)) {
 				/* Directory must be in correct state here: that is
@@ -1036,7 +1036,7 @@ static int get_far_parent(struct tree_ba
 
 	/* Form key to get parent of the left/right neighbor. */
 	le_key2cpu_key(&s_lr_father_key,
-		       B_N_PDELIM_KEY(*pcom_father,
+		       internal_key(*pcom_father,
 				      (c_lr_par ==
 				       LEFT_PARENTS) ? (tb->lkey[h - 1] =
 							position -
@@ -1175,9 +1175,9 @@ static inline int can_node_be_removed(in
 	struct item_head *ih;
 	struct reiserfs_key *r_key = NULL;
 
-	ih = B_N_PITEM_HEAD(Sh, 0);
+	ih = item_head(Sh, 0);
 	if (tb->CFR[h])
-		r_key = B_N_PDELIM_KEY(tb->CFR[h], tb->rkey[h]);
+		r_key = internal_key(tb->CFR[h], tb->rkey[h]);
 
 	if (lfree + rfree + sfree < MAX_CHILD_SIZE(Sh) + levbytes
 	    /* shifting may merge items which might save space */
--- a/fs/reiserfs/ibalance.c
+++ b/fs/reiserfs/ibalance.c
@@ -153,7 +153,7 @@ static void internal_insert_childs(struc
 	memcpy(dc, new_dc, DC_SIZE * count);
 
 	/* prepare space for count items  */
-	ih = B_N_PDELIM_KEY(cur, ((to == -1) ? 0 : to));
+	ih = internal_key(cur, ((to == -1) ? 0 : to));
 
 	memmove(ih + count, ih,
 		(nr - to) * KEY_SIZE + (nr + 1 + count) * DC_SIZE);
@@ -233,7 +233,7 @@ static void internal_delete_pointers_ite
 	dc = B_N_CHILD(cur, first_p);
 
 	memmove(dc, dc + del_num, (nr + 1 - first_p - del_num) * DC_SIZE);
-	key = B_N_PDELIM_KEY(cur, first_i);
+	key = internal_key(cur, first_i);
 	memmove(key, key + del_num,
 		(nr - first_i - del_num) * KEY_SIZE + (nr + 1 -
 						       del_num) * DC_SIZE);
@@ -330,13 +330,13 @@ static void internal_copy_pointers_items
 	memcpy(dc, B_N_CHILD(src, src_order), DC_SIZE * cpy_num);
 
 	/* prepare space for cpy_num - 1 item headers */
-	key = B_N_PDELIM_KEY(dest, dest_order);
+	key = internal_key(dest, dest_order);
 	memmove(key + cpy_num - 1, key,
 		KEY_SIZE * (nr_dest - dest_order) + DC_SIZE * (nr_dest +
 							       cpy_num));
 
 	/* insert headers */
-	memcpy(key, B_N_PDELIM_KEY(src, src_order), KEY_SIZE * (cpy_num - 1));
+	memcpy(key, internal_key(src, src_order), KEY_SIZE * (cpy_num - 1));
 
 	/* sizes, item number */
 	set_blkh_nr_item(blkh, blkh_nr_item(blkh) + (cpy_num - 1));
@@ -429,12 +429,12 @@ static void internal_insert_key(struct b
 	nr = blkh_nr_item(blkh);
 
 	/* prepare space for inserting key */
-	key = B_N_PDELIM_KEY(dest, dest_position_before);
+	key = internal_key(dest, dest_position_before);
 	memmove(key + 1, key,
 		(nr - dest_position_before) * KEY_SIZE + (nr + 1) * DC_SIZE);
 
 	/* insert key */
-	memcpy(key, B_N_PDELIM_KEY(src, src_position), KEY_SIZE);
+	memcpy(key, internal_key(src, src_position), KEY_SIZE);
 
 	/* Change dirt, free space, item number fields. */
 
@@ -717,7 +717,7 @@ static void replace_lkey(struct tree_bal
 	if (B_NR_ITEMS(PATH_H_PBUFFER(tb->tb_path, h)) == 0)
 		return;
 
-	memcpy(B_N_PDELIM_KEY(tb->CFL[h], tb->lkey[h]), key, KEY_SIZE);
+	memcpy(internal_key(tb->CFL[h], tb->lkey[h]), key, KEY_SIZE);
 
 	do_balance_mark_internal_dirty(tb, tb->CFL[h], 0);
 }
@@ -732,7 +732,7 @@ static void replace_rkey(struct tree_bal
 	       "R[h] can not be empty if it exists (item number=%d)",
 	       B_NR_ITEMS(tb->R[h]));
 
-	memcpy(B_N_PDELIM_KEY(tb->CFR[h], tb->rkey[h]), key, KEY_SIZE);
+	memcpy(internal_key(tb->CFR[h], tb->rkey[h]), key, KEY_SIZE);
 
 	do_balance_mark_internal_dirty(tb, tb->CFR[h], 0);
 }
@@ -997,7 +997,7 @@ int balance_internal(struct tree_balance
 			/* new items don't fall into S_new */
 			/*  store the delimiting key for the next level */
 			/* new_insert_key = (n - snum)'th key in S[h] */
-			memcpy(&new_insert_key, B_N_PDELIM_KEY(tbSh, n - snum),
+			memcpy(&new_insert_key, internal_key(tbSh, n - snum),
 			       KEY_SIZE);
 			/* last parameter is del_par */
 			internal_move_pointers_items(&dest_bi, &src_bi,
@@ -1008,7 +1008,7 @@ int balance_internal(struct tree_balance
 			/*  store the delimiting key for the next level */
 			/* new_insert_key = (n + insert_item - snum)'th key in S[h] */
 			memcpy(&new_insert_key,
-			       B_N_PDELIM_KEY(tbSh, n + insert_num - snum),
+			       internal_key(tbSh, n + insert_num - snum),
 			       KEY_SIZE);
 			/* last parameter is del_par */
 			internal_move_pointers_items(&dest_bi, &src_bi,
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -295,9 +295,9 @@ static int _get_block_create_0(struct in
 	}
 	//
 	bh = get_last_bh(&path);
-	ih = get_ih(&path);
+	ih = tp_item_head(&path);
 	if (is_indirect_le_ih(ih)) {
-		__le32 *ind_item = (__le32 *) B_I_PITEM(bh, ih);
+		__le32 *ind_item = (__le32 *) ih_item_body(bh, ih);
 
 		/* FIXME: here we could cache indirect item or part of it in
 		   the inode to avoid search_by_key in case of subsequent
@@ -383,7 +383,7 @@ static int _get_block_create_0(struct in
 		} else {
 			chars = ih_item_len(ih) - path.pos_in_item;
 		}
-		memcpy(p, B_I_PITEM(bh, ih) + path.pos_in_item, chars);
+		memcpy(p, ih_item_body(bh, ih) + path.pos_in_item, chars);
 
 		if (done)
 			break;
@@ -404,7 +404,7 @@ static int _get_block_create_0(struct in
 			// i/o error most likely
 			break;
 		bh = get_last_bh(&path);
-		ih = get_ih(&path);
+		ih = tp_item_head(&path);
 	} while (1);
 
 	flush_dcache_page(bh_result->b_page);
@@ -684,8 +684,8 @@ int reiserfs_get_block(struct inode *ino
 	}
 
 	bh = get_last_bh(&path);
-	ih = get_ih(&path);
-	item = get_item(&path);
+	ih = tp_item_head(&path);
+	item = tp_item_body(&path);
 	pos_in_item = path.pos_in_item;
 
 	fs_gen = get_generation(inode->i_sb);
@@ -1031,8 +1031,8 @@ int reiserfs_get_block(struct inode *ino
 			goto failure;
 		}
 		bh = get_last_bh(&path);
-		ih = get_ih(&path);
-		item = get_item(&path);
+		ih = tp_item_head(&path);
+		item = tp_item_body(&path);
 		pos_in_item = path.pos_in_item;
 	} while (1);
 
@@ -1133,7 +1133,7 @@ static void init_inode(struct inode *ino
 	//int version = ITEM_VERSION_1;
 
 	bh = PATH_PLAST_BUFFER(path);
-	ih = PATH_PITEM_HEAD(path);
+	ih = tp_item_head(path);
 
 	copy_key(INODE_PKEY(inode), &(ih->ih_key));
 
@@ -1147,7 +1147,7 @@ static void init_inode(struct inode *ino
 
 	if (stat_data_v1(ih)) {
 		struct stat_data_v1 *sd =
-		    (struct stat_data_v1 *)B_I_PITEM(bh, ih);
+		    (struct stat_data_v1 *)ih_item_body(bh, ih);
 		unsigned long blocks;
 
 		set_inode_item_key_version(inode, KEY_FORMAT_3_5);
@@ -1195,7 +1195,7 @@ static void init_inode(struct inode *ino
 	} else {
 		// new stat data found, but object may have old items
 		// (directories and symlinks)
-		struct stat_data *sd = (struct stat_data *)B_I_PITEM(bh, ih);
+		struct stat_data *sd = (struct stat_data *)ih_item_body(bh, ih);
 
 		inode->i_mode = sd_v2_mode(sd);
 		set_nlink(inode, sd_v2_nlink(sd));
@@ -1307,7 +1307,7 @@ static void update_stat_data(struct tree
 	struct item_head *ih;
 
 	bh = PATH_PLAST_BUFFER(path);
-	ih = PATH_PITEM_HEAD(path);
+	ih = tp_item_head(path);
 
 	if (!is_statdata_le_ih(ih))
 		reiserfs_panic(inode->i_sb, "vs-13065", "key %k, found item %h",
@@ -1315,9 +1315,9 @@ static void update_stat_data(struct tree
 
 	if (stat_data_v1(ih)) {
 		// path points to old stat data
-		inode2sd_v1(B_I_PITEM(bh, ih), inode, size);
+		inode2sd_v1(ih_item_body(bh, ih), inode, size);
 	} else {
-		inode2sd(B_I_PITEM(bh, ih), inode, size);
+		inode2sd(ih_item_body(bh, ih), inode, size);
 	}
 
 	return;
@@ -1368,7 +1368,7 @@ void reiserfs_update_sd_size(struct reis
 		 ** search if the stat data item has moved
 		 */
 		bh = get_last_bh(&path);
-		ih = get_ih(&path);
+		ih = tp_item_head(&path);
 		copy_item_head(&tmp_ih, ih);
 		fs_gen = get_generation(inode->i_sb);
 		reiserfs_prepare_for_journal(inode->i_sb, bh, 1);
@@ -2232,8 +2232,8 @@ static int map_block_for_writepage(struc
 	}
 
 	bh = get_last_bh(&path);
-	ih = get_ih(&path);
-	item = get_item(&path);
+	ih = tp_item_head(&path);
+	item = tp_item_body(&path);
 	pos_in_item = path.pos_in_item;
 
 	/* we've found an unformatted node */
@@ -2281,7 +2281,7 @@ static int map_block_for_writepage(struc
 			goto research;
 		}
 
-		memcpy(B_I_PITEM(bh, ih) + pos_in_item, p + bytes_copied,
+		memcpy(ih_item_body(bh, ih) + pos_in_item, p + bytes_copied,
 		       copy_size);
 
 		journal_mark_dirty(&th, inode->i_sb, bh);
--- a/fs/reiserfs/item_ops.c
+++ b/fs/reiserfs/item_ops.c
@@ -396,7 +396,7 @@ static void direntry_print_item(struct i
 
 	deh = (struct reiserfs_de_head *)item;
 
-	for (i = 0; i < I_ENTRY_COUNT(ih); i++, deh++) {
+	for (i = 0; i < ih_entry_count(ih); i++, deh++) {
 		namelen =
 		    (i ? (deh_location(deh - 1)) : ih_item_len(ih)) -
 		    deh_location(deh);
@@ -430,7 +430,7 @@ static void direntry_check_item(struct i
 
 	// FIXME: type something here!
 	deh = (struct reiserfs_de_head *)item;
-	for (i = 0; i < I_ENTRY_COUNT(ih); i++, deh++) {
+	for (i = 0; i < ih_entry_count(ih); i++, deh++) {
 		;
 	}
 }
--- a/fs/reiserfs/lbalance.c
+++ b/fs/reiserfs/lbalance.c
@@ -35,7 +35,7 @@ static void leaf_copy_dir_entries(struct
 	int copy_records_len;	/* length of all records in item to be copied */
 	char *records;
 
-	ih = B_N_PITEM_HEAD(source, item_num);
+	ih = item_head(source, item_num);
 
 	RFALSE(!is_direntry_le_ih(ih), "vs-10000: item must be directory item");
 
@@ -64,7 +64,7 @@ static void leaf_copy_dir_entries(struct
 	    (last_first == FIRST_TO_LAST && le_ih_k_offset(ih) == DOT_OFFSET) ||
 	    (last_first == LAST_TO_FIRST
 	     && comp_short_le_keys /*COMP_SHORT_KEYS */ (&ih->ih_key,
-							 B_N_PKEY(dest,
+							 leaf_key(dest,
 								  item_num_in_dest))))
 	{
 		/* create new item in dest */
@@ -80,7 +80,7 @@ static void leaf_copy_dir_entries(struct
 
 		if (last_first == LAST_TO_FIRST) {
 			/* form key by the following way */
-			if (from < I_ENTRY_COUNT(ih)) {
+			if (from < ih_entry_count(ih)) {
 				set_le_ih_k_offset(&new_ih,
 						   deh_offset(&(deh[from])));
 				/*memcpy (&new_ih.ih_key.k_offset, &deh[from].deh_offset, SHORT_KEY_SIZE); */
@@ -113,7 +113,7 @@ static void leaf_copy_dir_entries(struct
 
 	leaf_paste_entries(dest_bi, item_num_in_dest,
 			   (last_first ==
-			    FIRST_TO_LAST) ? I_ENTRY_COUNT(B_N_PITEM_HEAD(dest,
+			    FIRST_TO_LAST) ? ih_entry_count(item_head(dest,
 									  item_num_in_dest))
 			   : 0, copy_count, deh + from, records,
 			   DEH_SIZE * copy_count + copy_records_len);
@@ -138,8 +138,8 @@ static int leaf_copy_boundary_item(struc
 		/* if ( DEST is empty or first item of SOURCE and last item of DEST are the items of different objects
 		   or of different types ) then there is no need to treat this item differently from the other items
 		   that we copy, so we return */
-		ih = B_N_PITEM_HEAD(src, 0);
-		dih = B_N_PITEM_HEAD(dest, dest_nr_item - 1);
+		ih = item_head(src, 0);
+		dih = item_head(dest, dest_nr_item - 1);
 		if (!dest_nr_item
 		    || (!op_is_left_mergeable(&(ih->ih_key), src->b_size)))
 			/* there is nothing to merge */
@@ -180,7 +180,7 @@ static int leaf_copy_boundary_item(struc
 		   item of dest buffer. Both are of the same file */
 		leaf_paste_in_buffer(dest_bi,
 				     dest_nr_item - 1, ih_item_len(dih),
-				     bytes_or_entries, B_I_PITEM(src, ih), 0);
+				     bytes_or_entries, ih_item_body(src, ih), 0);
 
 		if (is_indirect_le_ih(dih)) {
 			RFALSE(get_ih_free_space(dih),
@@ -199,8 +199,8 @@ static int leaf_copy_boundary_item(struc
 	   are the items of different object or of different types )
 	 */
 	src_nr_item = B_NR_ITEMS(src);
-	ih = B_N_PITEM_HEAD(src, src_nr_item - 1);
-	dih = B_N_PITEM_HEAD(dest, 0);
+	ih = item_head(src, src_nr_item - 1);
+	dih = item_head(dest, 0);
 
 	if (!dest_nr_item || !op_is_left_mergeable(&(dih->ih_key), src->b_size))
 		return 0;
@@ -270,7 +270,7 @@ static int leaf_copy_boundary_item(struc
 	}
 
 	leaf_paste_in_buffer(dest_bi, 0, 0, bytes_or_entries,
-			     B_I_PITEM(src,
+			     ih_item_body(src,
 				       ih) + ih_item_len(ih) - bytes_or_entries,
 			     0);
 	return 1;
@@ -315,7 +315,7 @@ static void leaf_copy_items_entirely(str
 	dest_before = (last_first == LAST_TO_FIRST) ? 0 : nr;
 
 	/* location of head of first new item */
-	ih = B_N_PITEM_HEAD(dest, dest_before);
+	ih = item_head(dest, dest_before);
 
 	RFALSE(blkh_free_space(blkh) < cpy_num * IH_SIZE,
 	       "vs-10140: not enough free space for headers %d (needed %d)",
@@ -325,7 +325,7 @@ static void leaf_copy_items_entirely(str
 	memmove(ih + cpy_num, ih, (nr - dest_before) * IH_SIZE);
 
 	/* copy item headers */
-	memcpy(ih, B_N_PITEM_HEAD(src, first), cpy_num * IH_SIZE);
+	memcpy(ih, item_head(src, first), cpy_num * IH_SIZE);
 
 	free_space -= (IH_SIZE * cpy_num);
 	set_blkh_free_space(blkh, free_space);
@@ -352,7 +352,8 @@ static void leaf_copy_items_entirely(str
 
 	/* copy items */
 	memcpy(dest->b_data + last_inserted_loc,
-	       B_N_PITEM(src, (first + cpy_num - 1)), j - last_inserted_loc);
+	       item_body(src, (first + cpy_num - 1)),
+	       j - last_inserted_loc);
 
 	/* sizes, item number */
 	set_blkh_nr_item(blkh, nr + cpy_num);
@@ -390,7 +391,7 @@ static void leaf_item_bottle(struct buff
 
 	if (last_first == FIRST_TO_LAST) {
 		/* if ( if item in position item_num in buffer SOURCE is directory item ) */
-		ih = B_N_PITEM_HEAD(src, item_num);
+		ih = item_head(src, item_num);
 		if (is_direntry_le_ih(ih))
 			leaf_copy_dir_entries(dest_bi, src, FIRST_TO_LAST,
 					      item_num, 0, cpy_bytes);
@@ -415,15 +416,15 @@ static void leaf_item_bottle(struct buff
 			       "vs-10190: bad mergeability of item %h", ih);
 			n_ih.ih_version = ih->ih_version;	/* JDM Endian safe, both le */
 			leaf_insert_into_buf(dest_bi, B_NR_ITEMS(dest), &n_ih,
-					     B_N_PITEM(src, item_num), 0);
+					     item_body(src, item_num), 0);
 		}
 	} else {
 		/*  if ( if item in position item_num in buffer SOURCE is directory item ) */
-		ih = B_N_PITEM_HEAD(src, item_num);
+		ih = item_head(src, item_num);
 		if (is_direntry_le_ih(ih))
 			leaf_copy_dir_entries(dest_bi, src, LAST_TO_FIRST,
 					      item_num,
-					      I_ENTRY_COUNT(ih) - cpy_bytes,
+					      ih_entry_count(ih) - cpy_bytes,
 					      cpy_bytes);
 		else {
 			struct item_head n_ih;
@@ -461,9 +462,8 @@ static void leaf_item_bottle(struct buff
 			n_ih.ih_version = ih->ih_version;	/* JDM Endian safe, both le */
 
 			leaf_insert_into_buf(dest_bi, 0, &n_ih,
-					     B_N_PITEM(src,
-						       item_num) +
-					     ih_item_len(ih) - cpy_bytes, 0);
+					     item_body(src, item_num) +
+						ih_item_len(ih) - cpy_bytes, 0);
 		}
 	}
 }
@@ -691,10 +691,10 @@ int leaf_shift_left(struct tree_balance
 			replace_key(tb, tb->CFL[0], tb->lkey[0], S0, 0);
 
 			RFALSE((shift_bytes != -1 &&
-				!(is_direntry_le_ih(B_N_PITEM_HEAD(S0, 0))
-				  && !I_ENTRY_COUNT(B_N_PITEM_HEAD(S0, 0)))) &&
+				!(is_direntry_le_ih(item_head(S0, 0))
+				  && !ih_entry_count(item_head(S0, 0)))) &&
 			       (!op_is_left_mergeable
-				(B_N_PKEY(S0, 0), S0->b_size)),
+				(leaf_key(S0, 0), S0->b_size)),
 			       "vs-10280: item must be mergeable");
 		}
 	}
@@ -776,7 +776,7 @@ void leaf_delete_items(struct buffer_inf
 			leaf_delete_items_entirely(cur_bi, first + 1,
 						   del_num - 1);
 
-			ih = B_N_PITEM_HEAD(bh, B_NR_ITEMS(bh) - 1);
+			ih = item_head(bh, B_NR_ITEMS(bh) - 1);
 			if (is_direntry_le_ih(ih))
 				/* the last item is directory  */
 				/* len = numbers of directory entries in this item */
@@ -820,7 +820,7 @@ void leaf_insert_into_buf(struct buffer_
 	       zeros_number, ih_item_len(inserted_item_ih));
 
 	/* get item new item must be inserted before */
-	ih = B_N_PITEM_HEAD(bh, before);
+	ih = item_head(bh, before);
 
 	/* prepare space for the body of new item */
 	last_loc = nr ? ih_location(&(ih[nr - before - 1])) : bh->b_size;
@@ -902,7 +902,7 @@ void leaf_paste_in_buffer(struct buffer_
 #endif				/* CONFIG_REISERFS_CHECK */
 
 	/* item to be appended */
-	ih = B_N_PITEM_HEAD(bh, affected_item_num);
+	ih = item_head(bh, affected_item_num);
 
 	last_loc = ih_location(&(ih[nr - affected_item_num - 1]));
 	unmoved_loc = affected_item_num ? ih_location(ih - 1) : bh->b_size;
@@ -974,9 +974,9 @@ static int leaf_cut_entries(struct buffe
 	/* make sure, that item is directory and there are enough entries to
 	   remove */
 	RFALSE(!is_direntry_le_ih(ih), "10180: item is not directory item");
-	RFALSE(I_ENTRY_COUNT(ih) < from + del_count,
+	RFALSE(ih_entry_count(ih) < from + del_count,
 	       "10185: item contains not enough entries: entry_count = %d, from = %d, to delete = %d",
-	       I_ENTRY_COUNT(ih), from, del_count);
+	       ih_entry_count(ih), from, del_count);
 
 	if (del_count == 0)
 		return 0;
@@ -996,7 +996,7 @@ static int leaf_cut_entries(struct buffe
 	prev_record = item + prev_record_offset;
 
 	/* adjust locations of remaining entries */
-	for (i = I_ENTRY_COUNT(ih) - 1; i > from + del_count - 1; i--)
+	for (i = ih_entry_count(ih) - 1; i > from + del_count - 1; i--)
 		put_deh_location(&(deh[i]),
 				 deh_location(&deh[i]) -
 				 (DEH_SIZE * del_count));
@@ -1043,7 +1043,7 @@ void leaf_cut_from_buffer(struct buffer_
 	nr = blkh_nr_item(blkh);
 
 	/* item head of truncated item */
-	ih = B_N_PITEM_HEAD(bh, cut_item_num);
+	ih = item_head(bh, cut_item_num);
 
 	if (is_direntry_le_ih(ih)) {
 		/* first cut entry () */
@@ -1156,7 +1156,7 @@ static void leaf_delete_items_entirely(s
 		return;
 	}
 
-	ih = B_N_PITEM_HEAD(bh, first);
+	ih = item_head(bh, first);
 
 	/* location of unmovable item */
 	j = (first == 0) ? bh->b_size : ih_location(ih - 1);
@@ -1213,13 +1213,13 @@ void leaf_paste_entries(struct buffer_in
 	if (new_entry_count == 0)
 		return;
 
-	ih = B_N_PITEM_HEAD(bh, item_num);
+	ih = item_head(bh, item_num);
 
 	/* make sure, that item is directory, and there are enough records in it */
 	RFALSE(!is_direntry_le_ih(ih), "10225: item is not directory item");
-	RFALSE(I_ENTRY_COUNT(ih) < before,
+	RFALSE(ih_entry_count(ih) < before,
 	       "10230: there are no entry we paste entries before. entry_count = %d, before = %d",
-	       I_ENTRY_COUNT(ih), before);
+	       ih_entry_count(ih), before);
 
 	/* first byte of dest item */
 	item = bh->b_data + ih_location(ih);
@@ -1234,7 +1234,7 @@ void leaf_paste_entries(struct buffer_in
 	     : (ih_item_len(ih) - paste_size));
 
 	/* adjust locations of records that will be AFTER new records */
-	for (i = I_ENTRY_COUNT(ih) - 1; i >= before; i--)
+	for (i = ih_entry_count(ih) - 1; i >= before; i--)
 		put_deh_location(&(deh[i]),
 				 deh_location(&(deh[i])) +
 				 (DEH_SIZE * new_entry_count));
@@ -1244,7 +1244,7 @@ void leaf_paste_entries(struct buffer_in
 		put_deh_location(&(deh[i]),
 				 deh_location(&(deh[i])) + paste_size);
 
-	old_entry_num = I_ENTRY_COUNT(ih);
+	old_entry_num = ih_entry_count(ih);
 	put_ih_entry_count(ih, ih_entry_count(ih) + new_entry_count);
 
 	/* prepare space for pasted records */
@@ -1285,10 +1285,10 @@ void leaf_paste_entries(struct buffer_in
 		int prev, next;
 		/* check record locations */
 		deh = B_I_DEH(bh, ih);
-		for (i = 0; i < I_ENTRY_COUNT(ih); i++) {
+		for (i = 0; i < ih_entry_count(ih); i++) {
 			next =
 			    (i <
-			     I_ENTRY_COUNT(ih) -
+			     ih_entry_count(ih) -
 			     1) ? deh_location(&(deh[i + 1])) : 0;
 			prev = (i != 0) ? deh_location(&(deh[i - 1])) : 0;
 
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -31,7 +31,7 @@ static int bin_search_in_dir_item(struct
 	int rbound, lbound, j;
 
 	lbound = 0;
-	rbound = I_ENTRY_COUNT(ih) - 1;
+	rbound = ih_entry_count(ih) - 1;
 
 	for (j = (rbound + lbound) / 2; lbound <= rbound;
 	     j = (rbound + lbound) / 2) {
@@ -57,7 +57,7 @@ static inline void set_de_item_location(
 					struct treepath *path)
 {
 	de->de_bh = get_last_bh(path);
-	de->de_ih = get_ih(path);
+	de->de_ih = tp_item_head(path);
 	de->de_deh = B_I_DEH(de->de_bh, de->de_ih);
 	de->de_item_num = PATH_LAST_POSITION(path);
 }
@@ -71,7 +71,7 @@ inline void set_de_name_and_namelen(stru
 
 	de->de_entrylen = entry_length(de->de_bh, de->de_ih, de->de_entry_num);
 	de->de_namelen = de->de_entrylen - (de_with_sd(deh) ? SD_SIZE : 0);
-	de->de_name = B_I_PITEM(de->de_bh, de->de_ih) + deh_location(deh);
+	de->de_name = ih_item_body(de->de_bh, de->de_ih) + deh_location(deh);
 	if (de->de_name[de->de_namelen - 1] == 0)
 		de->de_namelen = strlen(de->de_name);
 }
@@ -220,7 +220,7 @@ static int linear_search_in_dir_item(str
 
 	i = de->de_entry_num;
 
-	if (i == I_ENTRY_COUNT(de->de_ih) ||
+	if (i == ih_entry_count(de->de_ih) ||
 	    GET_HASH_VALUE(deh_offset(deh + i)) !=
 	    GET_HASH_VALUE(cpu_key_k_offset(key))) {
 		i--;
@@ -1331,7 +1331,7 @@ static int reiserfs_rename(struct inode
 			return -EIO;
 		}
 
-		copy_item_head(&old_entry_ih, get_ih(&old_entry_path));
+		copy_item_head(&old_entry_ih, tp_item_head(&old_entry_path));
 
 		reiserfs_prepare_for_journal(old_inode->i_sb, old_de.de_bh, 1);
 
@@ -1351,7 +1351,7 @@ static int reiserfs_rename(struct inode
 			return -EIO;
 		}
 
-		copy_item_head(&new_entry_ih, get_ih(&new_entry_path));
+		copy_item_head(&new_entry_ih, tp_item_head(&new_entry_path));
 
 		reiserfs_prepare_for_journal(old_inode->i_sb, new_de.de_bh, 1);
 
@@ -1369,7 +1369,7 @@ static int reiserfs_rename(struct inode
 				return -EIO;
 			}
 			copy_item_head(&dot_dot_ih,
-				       get_ih(&dot_dot_entry_path));
+				       tp_item_head(&dot_dot_entry_path));
 			// node containing ".." gets into transaction
 			reiserfs_prepare_for_journal(old_inode->i_sb,
 						     dot_dot_de.de_bh, 1);
--- a/fs/reiserfs/prints.c
+++ b/fs/reiserfs/prints.c
@@ -439,7 +439,7 @@ static int print_internal(struct buffer_
 	dc = B_N_CHILD(bh, from);
 	reiserfs_printk("PTR %d: %y ", from, dc);
 
-	for (i = from, key = B_N_PDELIM_KEY(bh, from), dc++; i < to;
+	for (i = from, key = internal_key(bh, from), dc++; i < to;
 	     i++, key++, dc++) {
 		reiserfs_printk("KEY %d: %k PTR %d: %y ", i, key, i + 1, dc);
 		if (i && i % 4 == 0)
@@ -463,7 +463,7 @@ static int print_leaf(struct buffer_head
 	check_leaf(bh);
 
 	blkh = B_BLK_HEAD(bh);
-	ih = B_N_PITEM_HEAD(bh, 0);
+	ih = item_head(bh, 0);
 	nr = blkh_nr_item(blkh);
 
 	printk
@@ -496,7 +496,7 @@ static int print_leaf(struct buffer_head
 		    ("-------------------------------------------------------------------------------\n");
 		reiserfs_printk("|%2d| %h |\n", i, ih);
 		if (print_mode & PRINT_LEAF_ITEMS)
-			op_print_item(ih, B_I_PITEM(bh, ih));
+			op_print_item(ih, ih_item_body(bh, ih));
 	}
 
 	printk
@@ -744,8 +744,8 @@ void check_leaf(struct buffer_head *bh)
 	if (!bh)
 		return;
 	check_leaf_block_head(bh);
-	for (i = 0, ih = B_N_PITEM_HEAD(bh, 0); i < B_NR_ITEMS(bh); i++, ih++)
-		op_check_item(ih, B_I_PITEM(bh, ih));
+	for (i = 0, ih = item_head(bh, 0); i < B_NR_ITEMS(bh); i++, ih++)
+		op_check_item(ih, ih_item_body(bh, ih));
 }
 
 void check_internal(struct buffer_head *bh)
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -1275,9 +1275,11 @@ static inline loff_t le_ih_k_offset(cons
 
 static inline loff_t le_key_k_type(int version, const struct reiserfs_key *key)
 {
-	return (version == KEY_FORMAT_3_5) ?
-	    uniqueness2type(le32_to_cpu(key->u.k_offset_v1.k_uniqueness)) :
-	    offset_v2_k_type(&(key->u.k_offset_v2));
+	if (version == KEY_FORMAT_3_5) {
+		loff_t val = le32_to_cpu(key->u.k_offset_v1.k_uniqueness);
+		return uniqueness2type(val);
+	} else
+		return offset_v2_k_type(&(key->u.k_offset_v2));
 }
 
 static inline loff_t le_ih_k_type(const struct item_head *ih)
@@ -1288,8 +1290,22 @@ static inline loff_t le_ih_k_type(const
 static inline void set_le_key_k_offset(int version, struct reiserfs_key *key,
 				       loff_t offset)
 {
-	(version == KEY_FORMAT_3_5) ? (void)(key->u.k_offset_v1.k_offset = cpu_to_le32(offset)) :	/* jdm check */
-	    (void)(set_offset_v2_k_offset(&(key->u.k_offset_v2), offset));
+	if (version == KEY_FORMAT_3_5)
+		key->u.k_offset_v1.k_offset = cpu_to_le32(offset);
+	else
+		set_offset_v2_k_offset(&key->u.k_offset_v2, offset);
+}
+
+static inline void add_le_key_k_offset(int version, struct reiserfs_key *key,
+				       loff_t offset)
+{
+	set_le_key_k_offset(version, key,
+			    le_key_k_offset(version, key) + offset);
+}
+
+static inline void add_le_ih_k_offset(struct item_head *ih, loff_t offset)
+{
+	add_le_key_k_offset(ih_version(ih), &(ih->ih_key), offset);
 }
 
 static inline void set_le_ih_k_offset(struct item_head *ih, loff_t offset)
@@ -1300,10 +1316,11 @@ static inline void set_le_ih_k_offset(st
 static inline void set_le_key_k_type(int version, struct reiserfs_key *key,
 				     int type)
 {
-	(version == KEY_FORMAT_3_5) ?
-	    (void)(key->u.k_offset_v1.k_uniqueness =
-		   cpu_to_le32(type2uniqueness(type)))
-	    : (void)(set_offset_v2_k_type(&(key->u.k_offset_v2), type));
+	if (version == KEY_FORMAT_3_5) {
+		type = type2uniqueness(type);
+		key->u.k_offset_v1.k_uniqueness = cpu_to_le32(type);
+	} else
+	       set_offset_v2_k_type(&key->u.k_offset_v2, type);
 }
 
 static inline void set_le_ih_k_type(struct item_head *ih, int type)
@@ -1721,39 +1738,6 @@ extern void make_empty_dir_item_v1(char
 extern void make_empty_dir_item(char *body, __le32 dirid, __le32 objid,
 				__le32 par_dirid, __le32 par_objid);
 
-/* array of the entry headers */
- /* get item body */
-#define B_I_PITEM(bh,ih) ( (bh)->b_data + ih_location(ih) )
-#define B_I_DEH(bh,ih) ((struct reiserfs_de_head *)(B_I_PITEM(bh,ih)))
-
-/* length of the directory entry in directory item. This define
-   calculates length of i-th directory entry using directory entry
-   locations from dir entry head. When it calculates length of 0-th
-   directory entry, it uses length of whole item in place of entry
-   location of the non-existent following entry in the calculation.
-   See picture above.*/
-/*
-#define I_DEH_N_ENTRY_LENGTH(ih,deh,i) \
-((i) ? (deh_location((deh)-1) - deh_location((deh))) : (ih_item_len((ih)) - deh_location((deh))))
-*/
-static inline int entry_length(const struct buffer_head *bh,
-			       const struct item_head *ih, int pos_in_item)
-{
-	struct reiserfs_de_head *deh;
-
-	deh = B_I_DEH(bh, ih) + pos_in_item;
-	if (pos_in_item)
-		return deh_location(deh - 1) - deh_location(deh);
-
-	return ih_item_len(ih) - deh_location(deh);
-}
-
-/* number of entries in the directory item, depends on ENTRY_COUNT being at the start of directory dynamic data. */
-#define I_ENTRY_COUNT(ih) (ih_entry_count((ih)))
-
-/* name by bh, ih and entry_num */
-#define B_I_E_NAME(bh,ih,entry_num) ((char *)(bh->b_data + ih_location(ih) + deh_location(B_I_DEH(bh,ih)+(entry_num))))
-
 // two entries per block (at least)
 #define REISERFS_MAX_NAME(block_size) 255
 
@@ -1781,7 +1765,8 @@ struct reiserfs_dir_entry {
 /* these defines are useful when a particular member of a reiserfs_dir_entry is needed */
 
 /* pointer to file name, stored in entry */
-#define B_I_DEH_ENTRY_FILE_NAME(bh,ih,deh) (B_I_PITEM (bh, ih) + deh_location(deh))
+#define B_I_DEH_ENTRY_FILE_NAME(bh, ih, deh) \
+				(ih_item_body(bh, ih) + deh_location(deh))
 
 /* length of name */
 #define I_DEH_N_ENTRY_FILE_NAME_LENGTH(ih,deh,entry_num) \
@@ -1916,8 +1901,6 @@ struct treepath var = {.path_length = IL
 				   dumping paths... -Hans */
 #define PATH_LAST_POSITION(path) (PATH_OFFSET_POSITION((path), (path)->path_length))
 
-#define PATH_PITEM_HEAD(path)    B_N_PITEM_HEAD(PATH_PLAST_BUFFER(path), PATH_LAST_POSITION(path))
-
 /* in do_balance leaf has h == 0 in contrast with path structure,
    where root has level == 0. That is why we need these defines */
 #define PATH_H_PBUFFER(path, h) PATH_OFFSET_PBUFFER (path, path->path_length - (h))	/* tb->S[h] */
@@ -1927,13 +1910,89 @@ struct treepath var = {.path_length = IL
 
 #define PATH_H_PATH_OFFSET(path, n_h) ((path)->path_length - (n_h))
 
+static inline void *reiserfs_node_data(const struct buffer_head *bh)
+{
+	return bh->b_data + sizeof(struct block_head);
+}
+
+/* get key from internal node */
+static inline struct reiserfs_key *internal_key(struct buffer_head *bh,
+						int item_num)
+{
+	struct reiserfs_key *key = reiserfs_node_data(bh);
+
+	return &key[item_num];
+}
+
+/* get the item header from leaf node */
+static inline struct item_head *item_head(const struct buffer_head *bh,
+					  int item_num)
+{
+	struct item_head *ih = reiserfs_node_data(bh);
+
+	return &ih[item_num];
+}
+
+/* get the key from leaf node */
+static inline struct reiserfs_key *leaf_key(const struct buffer_head *bh,
+					    int item_num)
+{
+	return &item_head(bh, item_num)->ih_key;
+}
+
+static inline void *ih_item_body(const struct buffer_head *bh,
+				 const struct item_head *ih)
+{
+	return bh->b_data + ih_location(ih);
+}
+
+/* get item body from leaf node */
+static inline void *item_body(const struct buffer_head *bh, int item_num)
+{
+	return ih_item_body(bh, item_head(bh, item_num));
+}
+
+static inline struct item_head *tp_item_head(const struct treepath *path)
+{
+	return item_head(PATH_PLAST_BUFFER(path), PATH_LAST_POSITION(path));
+}
+
+static inline void *tp_item_body(const struct treepath *path)
+{
+	return item_body(PATH_PLAST_BUFFER(path), PATH_LAST_POSITION(path));
+}
+
 #define get_last_bh(path) PATH_PLAST_BUFFER(path)
-#define get_ih(path) PATH_PITEM_HEAD(path)
 #define get_item_pos(path) PATH_LAST_POSITION(path)
-#define get_item(path) ((void *)B_N_PITEM(PATH_PLAST_BUFFER(path), PATH_LAST_POSITION (path)))
 #define item_moved(ih,path) comp_items(ih, path)
 #define path_changed(ih,path) comp_items (ih, path)
 
+/* array of the entry headers */
+ /* get item body */
+#define B_I_DEH(bh, ih) ((struct reiserfs_de_head *)(ih_item_body(bh, ih)))
+
+/* length of the directory entry in directory item. This define
+   calculates length of i-th directory entry using directory entry
+   locations from dir entry head. When it calculates length of 0-th
+   directory entry, it uses length of whole item in place of entry
+   location of the non-existent following entry in the calculation.
+   See picture above.*/
+/*
+#define I_DEH_N_ENTRY_LENGTH(ih,deh,i) \
+((i) ? (deh_location((deh)-1) - deh_location((deh))) : (ih_item_len((ih)) - deh_location((deh))))
+*/
+static inline int entry_length(const struct buffer_head *bh,
+			       const struct item_head *ih, int pos_in_item)
+{
+	struct reiserfs_de_head *deh;
+
+	deh = B_I_DEH(bh, ih) + pos_in_item;
+	if (pos_in_item)
+		return deh_location(deh - 1) - deh_location(deh);
+
+	return ih_item_len(ih) - deh_location(deh);
+}
+
 /***************************************************************************/
 /*                       MISC                                              */
 /***************************************************************************/
@@ -2224,22 +2283,6 @@ extern struct item_operations *item_ops[
 
 /* number of bytes contained by the direct item or the unformatted nodes the indirect item points to */
 
-/* get the item header */
-#define B_N_PITEM_HEAD(bh,item_num) ( (struct item_head * )((bh)->b_data + BLKH_SIZE) + (item_num) )
-
-/* get key */
-#define B_N_PDELIM_KEY(bh,item_num) ( (struct reiserfs_key * )((bh)->b_data + BLKH_SIZE) + (item_num) )
-
-/* get the key */
-#define B_N_PKEY(bh,item_num) ( &(B_N_PITEM_HEAD(bh,item_num)->ih_key) )
-
-/* get item body */
-#define B_N_PITEM(bh,item_num) ( (bh)->b_data + ih_location(B_N_PITEM_HEAD((bh),(item_num))))
-
-/* get the stat data by the buffer header and the item order */
-#define B_N_STAT_DATA(bh,nr) \
-( (struct stat_data *)((bh)->b_data + ih_location(B_N_PITEM_HEAD((bh),(nr))) ) )
-
     /* following defines use reiserfs buffer header and item header */
 
 /* get stat-data */
@@ -2251,8 +2294,10 @@ extern struct item_operations *item_ops[
 /* indirect items consist of entries which contain blocknrs, pos
    indicates which entry, and B_I_POS_UNFM_POINTER resolves to the
    blocknr contained by the entry pos points to */
-#define B_I_POS_UNFM_POINTER(bh,ih,pos) le32_to_cpu(*(((unp_t *)B_I_PITEM(bh,ih)) + (pos)))
-#define PUT_B_I_POS_UNFM_POINTER(bh,ih,pos, val) do {*(((unp_t *)B_I_PITEM(bh,ih)) + (pos)) = cpu_to_le32(val); } while (0)
+#define B_I_POS_UNFM_POINTER(bh, ih, pos)				\
+	le32_to_cpu(*(((unp_t *)ih_item_body(bh, ih)) + (pos)))
+#define PUT_B_I_POS_UNFM_POINTER(bh, ih, pos, val)			\
+	(*(((unp_t *)ih_item_body(bh, ih)) + (pos)) = cpu_to_le32(val))
 
 struct reiserfs_iget_args {
 	__u32 objectid;
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -272,7 +272,7 @@ static inline const struct reiserfs_key
 			return &MAX_KEY;
 		/* Return delimiting key if position in the parent is not equal to zero. */
 		if (position)
-			return B_N_PDELIM_KEY(parent, position - 1);
+			return internal_key(parent, position - 1);
 	}
 	/* Return MIN_KEY if we are in the root of the buffer tree. */
 	if (PATH_OFFSET_PBUFFER(chk_path, FIRST_PATH_ELEMENT_OFFSET)->
@@ -315,7 +315,7 @@ inline const struct reiserfs_key *get_rk
 			return &MIN_KEY;
 		/* Return delimiting key if position in the parent is not the last one. */
 		if (position != B_NR_ITEMS(parent))
-			return B_N_PDELIM_KEY(parent, position);
+			return internal_key(parent, position);
 	}
 	/* Return MAX_KEY if we are in the root of the buffer tree. */
 	if (PATH_OFFSET_PBUFFER(chk_path, FIRST_PATH_ELEMENT_OFFSET)->
@@ -732,7 +732,7 @@ int search_by_key(struct super_block *sb
 		       "vs-5152: tree level (%d) is less than stop level (%d)",
 		       node_level, stop_level);
 
-		retval = bin_search(key, B_N_PITEM_HEAD(bh, 0),
+		retval = bin_search(key, item_head(bh, 0),
 				      B_NR_ITEMS(bh),
 				      (node_level ==
 				       DISK_LEAF_NODE_LEVEL) ? IH_SIZE :
@@ -779,7 +779,7 @@ int search_by_key(struct super_block *sb
 				/*
 				 * check to make sure we're in the same object
 				 */
-				le_key = B_N_PDELIM_KEY(bh, pos);
+				le_key = internal_key(bh, pos);
 				if (le32_to_cpu(le_key->k_objectid) !=
 				    key->on_disk_key.k_objectid) {
 					break;
@@ -830,7 +830,7 @@ int search_for_position_by_key(struct su
 	if (retval == ITEM_FOUND) {
 
 		RFALSE(!ih_item_len
-		       (B_N_PITEM_HEAD
+		       (item_head
 			(PATH_PLAST_BUFFER(search_path),
 			 PATH_LAST_POSITION(search_path))),
 		       "PAP-5165: item length equals zero");
@@ -844,7 +844,7 @@ int search_for_position_by_key(struct su
 
 	/* Item is not found. Set path to the previous item. */
 	p_le_ih =
-	    B_N_PITEM_HEAD(PATH_PLAST_BUFFER(search_path),
+	    item_head(PATH_PLAST_BUFFER(search_path),
 			   --PATH_LAST_POSITION(search_path));
 	blk_size = sb->s_blocksize;
 
@@ -892,7 +892,7 @@ int comp_items(const struct item_head *s
 		return 1;
 
 	/* we need only to know, whether it is the same item */
-	ih = get_ih(path);
+	ih = tp_item_head(path);
 	return memcmp(stored_ih, ih, IH_SIZE);
 }
 
@@ -987,7 +987,7 @@ static char prepare_for_delete_or_cut(st
     )
 {
 	struct super_block *sb = inode->i_sb;
-	struct item_head *p_le_ih = PATH_PITEM_HEAD(path);
+	struct item_head *p_le_ih = tp_item_head(path);
 	struct buffer_head *bh = PATH_PLAST_BUFFER(path);
 
 	BUG_ON(!th->t_trans_id);
@@ -1033,7 +1033,7 @@ static char prepare_for_delete_or_cut(st
 		need_re_search = 0;
 		*cut_size = 0;
 		bh = PATH_PLAST_BUFFER(path);
-		copy_item_head(&s_ih, PATH_PITEM_HEAD(path));
+		copy_item_head(&s_ih, tp_item_head(path));
 		pos = I_UNFM_NUM(&s_ih);
 
 		while (le_ih_k_offset (&s_ih) + (pos - 1) * blk_size > new_file_length) {
@@ -1047,7 +1047,7 @@ static char prepare_for_delete_or_cut(st
 			reiserfs_transaction_free_space(th) < JOURNAL_FOR_FREE_BLOCK_AND_UPDATE_SD)
 			break;
 
-		    unfm = (__le32 *)B_I_PITEM(bh, &s_ih) + pos - 1;
+		    unfm = (__le32 *)ih_item_body(bh, &s_ih) + pos - 1;
 		    block = get_block_num(unfm, 0);
 
 		    if (block != 0) {
@@ -1095,7 +1095,7 @@ static char prepare_for_delete_or_cut(st
 static int calc_deleted_bytes_number(struct tree_balance *tb, char mode)
 {
 	int del_size;
-	struct item_head *p_le_ih = PATH_PITEM_HEAD(tb->tb_path);
+	struct item_head *p_le_ih = tp_item_head(tb->tb_path);
 
 	if (is_statdata_le_ih(p_le_ih))
 		return 0;
@@ -1212,7 +1212,7 @@ int reiserfs_delete_item(struct reiserfs
 
 		RFALSE(mode != M_DELETE, "PAP-5320: mode must be M_DELETE");
 
-		copy_item_head(&s_ih, PATH_PITEM_HEAD(path));
+		copy_item_head(&s_ih, tp_item_head(path));
 		s_del_balance.insert_size[0] = del_size;
 
 		ret_value = fix_nodes(M_DELETE, &s_del_balance, NULL, NULL);
@@ -1240,7 +1240,7 @@ int reiserfs_delete_item(struct reiserfs
 	}
 	// reiserfs_delete_item returns item length when success
 	ret_value = calc_deleted_bytes_number(&s_del_balance, M_DELETE);
-	q_ih = get_ih(path);
+	q_ih = tp_item_head(path);
 	quota_cut_bytes = ih_item_len(q_ih);
 
 	/* hack so the quota code doesn't have to guess if the file
@@ -1284,7 +1284,7 @@ int reiserfs_delete_item(struct reiserfs
 		data = kmap_atomic(un_bh->b_page);
 		off = ((le_ih_k_offset(&s_ih) - 1) & (PAGE_CACHE_SIZE - 1));
 		memcpy(data + off,
-		       B_I_PITEM(PATH_PLAST_BUFFER(path), &s_ih),
+		       ih_item_body(PATH_PLAST_BUFFER(path), &s_ih),
 		       ret_value);
 		kunmap_atomic(data);
 	}
@@ -1362,11 +1362,11 @@ void reiserfs_delete_solid_item(struct r
 		}
 		if (!tb_init) {
 			tb_init = 1;
-			item_len = ih_item_len(PATH_PITEM_HEAD(&path));
+			item_len = ih_item_len(tp_item_head(&path));
 			init_tb_struct(th, &tb, th->t_super, &path,
 				       -(IH_SIZE + item_len));
 		}
-		quota_cut_bytes = ih_item_len(PATH_PITEM_HEAD(&path));
+		quota_cut_bytes = ih_item_len(tp_item_head(&path));
 
 		retval = fix_nodes(M_DELETE, &tb, NULL, NULL);
 		if (retval == REPEAT_SEARCH) {
@@ -1521,7 +1521,7 @@ static void indirect_to_direct_roll_back
 			reiserfs_panic(inode->i_sb, "vs-5615",
 				       "found invalid item");
 		RFALSE(path->pos_in_item !=
-		       ih_item_len(PATH_PITEM_HEAD(path)) - 1,
+		       ih_item_len(tp_item_head(path)) - 1,
 		       "vs-5616: appended bytes found");
 		PATH_LAST_POSITION(path)--;
 
@@ -1671,7 +1671,7 @@ int reiserfs_cut_from_item(struct reiser
 	/* Calculate number of bytes that need to be cut from the item. */
 	quota_cut_bytes =
 	    (mode ==
-	     M_DELETE) ? ih_item_len(get_ih(path)) : -s_cut_balance.
+	     M_DELETE) ? ih_item_len(tp_item_head(path)) : -s_cut_balance.
 	    insert_size[0];
 	if (retval2 == -1)
 		ret_value = calc_deleted_bytes_number(&s_cut_balance, mode);
@@ -1681,7 +1681,7 @@ int reiserfs_cut_from_item(struct reiser
 	/* For direct items, we only change the quota when deleting the last
 	 ** item.
 	 */
-	p_le_ih = PATH_PITEM_HEAD(s_cut_balance.tb_path);
+	p_le_ih = tp_item_head(s_cut_balance.tb_path);
 	if (!S_ISLNK(inode->i_mode) && is_direct_le_ih(p_le_ih)) {
 		if (mode == M_DELETE &&
 		    (le_ih_k_offset(p_le_ih) & (sb->s_blocksize - 1)) ==
@@ -1696,7 +1696,7 @@ int reiserfs_cut_from_item(struct reiser
 #ifdef CONFIG_REISERFS_CHECK
 	if (is_inode_locked) {
 		struct item_head *le_ih =
-		    PATH_PITEM_HEAD(s_cut_balance.tb_path);
+		    tp_item_head(s_cut_balance.tb_path);
 		/* we are going to complete indirect2direct conversion. Make
 		   sure, that we exactly remove last unformatted node pointer
 		   of the item */
@@ -1819,7 +1819,7 @@ int reiserfs_do_truncate(struct reiserfs
 	s_search_path.pos_in_item--;
 
 	/* Get real file size (total length of all file items) */
-	p_le_ih = PATH_PITEM_HEAD(&s_search_path);
+	p_le_ih = tp_item_head(&s_search_path);
 	if (is_statdata_le_ih(p_le_ih))
 		file_size = 0;
 	else {
@@ -1922,7 +1922,7 @@ int reiserfs_do_truncate(struct reiserfs
 static void check_research_for_paste(struct treepath *path,
 				     const struct cpu_key *key)
 {
-	struct item_head *found_ih = get_ih(path);
+	struct item_head *found_ih = tp_item_head(path);
 
 	if (is_direct_le_ih(found_ih)) {
 		if (le_ih_k_offset(found_ih) +
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -259,7 +259,7 @@ static int finish_unfinished(struct supe
 			break;
 		}
 		item_pos--;
-		ih = B_N_PITEM_HEAD(bh, item_pos);
+		ih = item_head(bh, item_pos);
 
 		if (le32_to_cpu(ih->ih_key.k_dir_id) != MAX_KEY_OBJECTID)
 			/* there are no "save" links anymore */
@@ -272,7 +272,7 @@ static int finish_unfinished(struct supe
 			truncate = 0;
 
 		/* reiserfs_iget needs k_dirid and k_objectid only */
-		item = B_I_PITEM(bh, ih);
+		item = ih_item_body(bh, ih);
 		obj_key.on_disk_key.k_dir_id = le32_to_cpu(*(__le32 *) item);
 		obj_key.on_disk_key.k_objectid =
 		    le32_to_cpu(ih->ih_key.k_objectid);
--- a/fs/reiserfs/tail_conversion.c
+++ b/fs/reiserfs/tail_conversion.c
@@ -20,7 +20,7 @@ int direct2indirect(struct reiserfs_tran
 {
 	struct super_block *sb = inode->i_sb;
 	struct buffer_head *up_to_date_bh;
-	struct item_head *p_le_ih = PATH_PITEM_HEAD(path);
+	struct item_head *p_le_ih = tp_item_head(path);
 	unsigned long total_tail = 0;
 	struct cpu_key end_key;	/* Key to search for the last byte of the
 				   converted item. */
@@ -55,7 +55,7 @@ int direct2indirect(struct reiserfs_tran
 		return -EIO;
 	}
 
-	p_le_ih = PATH_PITEM_HEAD(path);
+	p_le_ih = tp_item_head(path);
 
 	unfm_ptr = cpu_to_le32(unbh->b_blocknr);
 
@@ -94,7 +94,7 @@ int direct2indirect(struct reiserfs_tran
 		    POSITION_FOUND)
 			reiserfs_panic(sb, "PAP-14050",
 				       "direct item (%K) not found", &end_key);
-		p_le_ih = PATH_PITEM_HEAD(path);
+		p_le_ih = tp_item_head(path);
 		RFALSE(!is_direct_le_ih(p_le_ih),
 		       "vs-14055: direct item expected(%K), found %h",
 		       &end_key, p_le_ih);
@@ -194,7 +194,7 @@ int indirect2direct(struct reiserfs_tran
 	*mode = M_SKIP_BALANCING;
 
 	/* store item head path points to. */
-	copy_item_head(&s_ih, PATH_PITEM_HEAD(path));
+	copy_item_head(&s_ih, tp_item_head(path));
 
 	tail_len = (n_new_file_size & (block_size - 1));
 	if (get_inode_sd_version(inode) == STAT_DATA_V2)
@@ -220,7 +220,7 @@ int indirect2direct(struct reiserfs_tran
 			reiserfs_panic(sb, "PAP-5520",
 				       "item to be converted %K does not exist",
 				       item_key);
-		copy_item_head(&s_ih, PATH_PITEM_HEAD(path));
+		copy_item_head(&s_ih, tp_item_head(path));
 #ifdef CONFIG_REISERFS_CHECK
 		pos = le_ih_k_offset(&s_ih) - 1 +
 		    (ih_item_len(&s_ih) / UNFM_P_SIZE -


