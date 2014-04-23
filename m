From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 22/29] reiserfs: balance_leaf refactor, pull out balance_leaf{left, right,
 new_nodes, finish_node}
Date: Wed, 23 Apr 2014 10:00:55 -0400
Message-ID: <20140423151144.448716989@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs-balance_leaf-refactor-pull-out-balance_leaf-left-right-new_nodes-finish_node
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

Break out the code that splits paste/insert for each phase.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/do_balan.c |  207 +++++++++++++++++++++++++------------------------
 1 file changed, 108 insertions(+), 99 deletions(-)

--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -508,6 +508,27 @@ static void balance_leaf_paste_left(stru
 
 }
 
+/* Shift lnum[0] items from S[0] to the left neighbor L[0] */
+static void balance_leaf_left(struct tree_balance *tb, struct item_head *ih,
+			      const char *body, int flag)
+{
+	if (tb->lnum[0] <= 0)
+		return;
+
+	/* new item or it part falls to L[0], shift it too */
+	if (tb->item_pos < tb->lnum[0]) {
+		BUG_ON(flag != M_INSERT && flag != M_PASTE);
+
+		if (flag == M_INSERT)
+			balance_leaf_insert_left(tb, ih, body);
+		else /* M_PASTE */
+			balance_leaf_paste_left(tb, ih, body);
+	} else
+		/* new item doesn't fall into L[0] */
+		leaf_shift_left(tb, tb->lnum[0], tb->lbytes);
+}
+
+
 static void balance_leaf_insert_right(struct tree_balance *tb,
 				      struct item_head *ih, const char *body)
 {
@@ -733,6 +754,22 @@ static void balance_leaf_paste_right(str
 
 }
 
+/* shift rnum[0] items from S[0] to the right neighbor R[0] */
+static void balance_leaf_right(struct tree_balance *tb, struct item_head *ih,
+			       const char *body, int flag)
+{
+	if (tb->rnum[0] <= 0)
+		return;
+
+	BUG_ON(flag != M_INSERT && flag != M_PASTE);
+
+	if (flag == M_INSERT)
+		balance_leaf_insert_right(tb, ih, body);
+	else /* M_PASTE */
+		balance_leaf_paste_right(tb, ih, body);
+
+}
+
 static void balance_leaf_new_nodes_insert(struct tree_balance *tb,
 					  struct item_head *ih,
 					  const char *body,
@@ -962,6 +999,55 @@ static void balance_leaf_new_nodes_paste
 
 }
 
+/* Fill new nodes that appear in place of S[0] */
+static void balance_leaf_new_nodes(struct tree_balance *tb,
+				   struct item_head *ih,
+				   const char *body,
+				   struct item_head *insert_key,
+				   struct buffer_head **insert_ptr,
+				   int flag)
+{
+	int i;
+	for (i = tb->blknum[0] - 2; i >= 0; i--) {
+
+		RFALSE(!tb->snum[i],
+		       "PAP-12200: snum[%d] == %d. Must be > 0", i,
+		       tb->snum[i]);
+
+		/* here we shift from S to S_new nodes */
+
+		tb->S_new[i] = get_FEB(tb);
+
+		/* initialized block type and tree level */
+		set_blkh_level(B_BLK_HEAD(tb->S_new[i]), DISK_LEAF_NODE_LEVEL);
+
+		switch (flag) {
+		case M_INSERT:	/* insert item */
+			balance_leaf_new_nodes_insert(tb, ih, body, insert_key,
+						      insert_ptr, i);
+			break;
+
+		case M_PASTE:	/* append item */
+			balance_leaf_new_nodes_paste(tb, ih, body, insert_key,
+						     insert_ptr, i);
+			break;
+		default:	/* cases d and t */
+			reiserfs_panic(tb->tb_sb, "PAP-12245",
+				       "blknum > 2: unexpected mode: %s(%d)",
+				       (flag == M_DELETE) ? "DELETE" : ((flag == M_CUT) ? "CUT" : "UNKNOWN"), flag);
+		}
+
+		memcpy(insert_key + i, leaf_key(tb->S_new[i], 0), KEY_SIZE);
+		insert_ptr[i] = tb->S_new[i];
+
+		RFALSE(!buffer_journaled(tb->S_new[i])
+		       || buffer_journal_dirty(tb->S_new[i])
+		       || buffer_dirty(tb->S_new[i]),
+		       "PAP-12247: S_new[%d] : (%b)",
+		       i, format_bh(tb->S_new[i]));
+	}
+}
+
 static void balance_leaf_finish_node_insert(struct tree_balance *tb,
 					    struct item_head *ih,
 					    const char *body)
@@ -1058,6 +1144,24 @@ static void balance_leaf_finish_node_pas
 				}
 }
 
+/*
+ * if the affected item was not wholly shifted then we
+ * perform all necessary operations on that part or whole
+ * of the affected item which remains in S
+ */
+static void balance_leaf_finish_node(struct tree_balance *tb,
+				      struct item_head *ih,
+				      const char *body, int flag)
+{
+	/* if we must insert or append into buffer S[0] */
+	if (0 <= tb->item_pos && tb->item_pos < tb->s0num) {
+		if (flag == M_INSERT)
+			balance_leaf_finish_node_insert(tb, ih, body);
+		else /* M_PASTE */
+			balance_leaf_finish_node_paste(tb, ih, body);
+	}
+}
+
 /**
  * balance_leaf - reiserfs tree balancing algorithm
  * @tb: tree balance state
@@ -1078,7 +1182,6 @@ static int balance_leaf(struct tree_bala
 			struct buffer_head **insert_ptr)
 {
 	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
-	int n, i;
 
 	PROC_INFO_INC(tb->tb_sb, balance_at[0]);
 
@@ -1100,55 +1203,13 @@ static int balance_leaf(struct tree_bala
 	    && is_indirect_le_ih(item_head(tbS0, tb->item_pos)))
 		tb->pos_in_item *= UNFM_P_SIZE;
 
-	if (tb->lnum[0] > 0) {
-		/* Shift lnum[0] items from S[0] to the left neighbor L[0] */
-		if (tb->item_pos < tb->lnum[0]) {
-			/* new item or it part falls to L[0], shift it too */
-			n = B_NR_ITEMS(tb->L[0]);
-
-			switch (flag) {
-			case M_INSERT:	/* insert item into L[0] */
-				balance_leaf_insert_left(tb, ih, body);
-				break;
-
-			case M_PASTE:	/* append item in L[0] */
-				balance_leaf_paste_left(tb, ih, body);
-				break;
-			default:	/* cases d and t */
-				reiserfs_panic(tb->tb_sb, "PAP-12130",
-					       "lnum > 0: unexpected mode: "
-					       " %s(%d)",
-					       (flag == M_DELETE) ? "DELETE" : ((flag == M_CUT) ? "CUT" : "UNKNOWN"), flag);
-			}
-		} else {
-			/* new item doesn't fall into L[0] */
-			leaf_shift_left(tb, tb->lnum[0], tb->lbytes);
-		}
-	}
+	balance_leaf_left(tb, ih, body, flag);
 
 	/* tb->lnum[0] > 0 */
 	/* Calculate new item position */
 	tb->item_pos -= (tb->lnum[0] - ((tb->lbytes != -1) ? 1 : 0));
 
-	if (tb->rnum[0] > 0) {
-		/* shift rnum[0] items from S[0] to the right neighbor R[0] */
-		n = B_NR_ITEMS(tbS0);
-		switch (flag) {
-
-		case M_INSERT:	/* insert item */
-			balance_leaf_insert_right(tb, ih, body);
-			break;
-
-		case M_PASTE:	/* append item */
-			balance_leaf_paste_right(tb, ih, body);
-			break;
-		default:	/* cases d and t */
-			reiserfs_panic(tb->tb_sb, "PAP-12175",
-				       "rnum > 0: unexpected mode: %s(%d)",
-				       (flag == M_DELETE) ? "DELETE" : ((flag == M_CUT) ? "CUT" : "UNKNOWN"), flag);
-		}
-
-	}
+	balance_leaf_right(tb, ih, body, flag);
 
 	/* tb->rnum[0] > 0 */
 	RFALSE(tb->blknum[0] > 3,
@@ -1183,62 +1244,10 @@ static int balance_leaf(struct tree_bala
 		return 0;
 	}
 
-	/* Fill new nodes that appear in place of S[0] */
-	for (i = tb->blknum[0] - 2; i >= 0; i--) {
-
-		RFALSE(!tb->snum[i],
-		       "PAP-12200: snum[%d] == %d. Must be > 0", i,
-		       tb->snum[i]);
-
-		/* here we shift from S to S_new nodes */
+	balance_leaf_new_nodes(tb, ih, body, insert_key, insert_ptr, flag);
 
-		tb->S_new[i] = get_FEB(tb);
+	balance_leaf_finish_node(tb, ih, body, flag);
 
-		/* initialized block type and tree level */
-		set_blkh_level(B_BLK_HEAD(tb->S_new[i]), DISK_LEAF_NODE_LEVEL);
-
-		n = B_NR_ITEMS(tbS0);
-
-		switch (flag) {
-		case M_INSERT:	/* insert item */
-			balance_leaf_new_nodes_insert(tb, ih, body, insert_key,
-						      insert_ptr, i);
-			break;
-
-		case M_PASTE:	/* append item */
-			balance_leaf_new_nodes_paste(tb, ih, body, insert_key,
-						     insert_ptr, i);
-			break;
-		default:	/* cases d and t */
-			reiserfs_panic(tb->tb_sb, "PAP-12245",
-				       "blknum > 2: unexpected mode: %s(%d)",
-				       (flag == M_DELETE) ? "DELETE" : ((flag == M_CUT) ? "CUT" : "UNKNOWN"), flag);
-		}
-
-		memcpy(insert_key + i, leaf_key(tb->S_new[i], 0), KEY_SIZE);
-		insert_ptr[i] = tb->S_new[i];
-
-		RFALSE(!buffer_journaled(tb->S_new[i])
-		       || buffer_journal_dirty(tb->S_new[i])
-		       || buffer_dirty(tb->S_new[i]),
-		       "PAP-12247: S_new[%d] : (%b)",
-		       i, tb->S_new[i]);
-	}
-
-	/* if the affected item was not wholly shifted then we perform all necessary operations on that part or whole of the
-	   affected item which remains in S */
-	if (0 <= tb->item_pos && tb->item_pos < tb->s0num) {	/* if we must insert or append into buffer S[0] */
-
-		switch (flag) {
-		case M_INSERT:	/* insert item into S[0] */
-			balance_leaf_finish_node_insert(tb, ih, body);
-			break;
-
-		case M_PASTE:	/* append item in S[0] */
-			balance_leaf_finish_node_paste(tb, ih, body);
-			break;
-		}
-	}
 #ifdef CONFIG_REISERFS_CHECK
 	if (flag == M_PASTE && tb->insert_size[0]) {
 		print_cur_tb("12290");


