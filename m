From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 12/29] reiserfs: balance_leaf refactor, reformat balance_leaf comments
Date: Wed, 23 Apr 2014 10:00:45 -0400
Message-ID: <20140423151140.665133094@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-balance_leaf-refactor-reformat-balance_leaf-comments
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

The comments in balance_leaf are as bad as the code. This patch shifts
them around to fit in 80 columns and be easier to read.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/do_balan.c |   84 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 52 insertions(+), 32 deletions(-)

--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -290,31 +290,43 @@ static int balance_leaf_when_delete(stru
 	return 0;
 }
 
-static int balance_leaf(struct tree_balance *tb, struct item_head *ih,	/* item header of inserted item (this is on little endian) */
-			const char *body,	/* body  of inserted item or bytes to paste */
-			int flag,	/* i - insert, d - delete, c - cut, p - paste
-					   (see comment to do_balance) */
-			struct item_head *insert_key,	/* in our processing of one level we sometimes determine what
-							   must be inserted into the next higher level.  This insertion
-							   consists of a key or two keys and their corresponding
-							   pointers */
-			struct buffer_head **insert_ptr	/* inserted node-ptrs for the next level */
-    )
+/**
+ * balance_leaf - reiserfs tree balancing algorithm
+ * @tb: tree balance state
+ * @ih: item header of inserted item (little endian)
+ * @body: body of inserted item or bytes to paste
+ * @flag: i - insert, d - delete, c - cut, p - paste (see do_balance)
+ * passed back:
+ * @insert_key: key to insert new nodes
+ * @insert_ptr: array of nodes to insert at the next level
+ *
+ * In our processing of one level we sometimes determine what must be
+ * inserted into the next higher level.  This insertion consists of a
+ * key or two keys and their corresponding pointers.
+ */
+static int balance_leaf(struct tree_balance *tb, struct item_head *ih,
+			const char *body, int flag,
+			struct item_head *insert_key,
+			struct buffer_head **insert_ptr)
 {
 	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
-	int item_pos = PATH_LAST_POSITION(tb->tb_path);	/*  index into the array of item headers in S[0]
-							   of the affected item */
+	/* index into the array of item headers in S[0] of the affected item */
+	int item_pos = PATH_LAST_POSITION(tb->tb_path);
 	struct buffer_info bi;
-	struct buffer_head *S_new[2];	/* new nodes allocated to hold what could not fit into S */
-	int snum[2];		/* number of items that will be placed
-				   into S_new (includes partially shifted
-				   items) */
-	int sbytes[2];		/* if an item is partially shifted into S_new then
-				   if it is a directory item
-				   it is the number of entries from the item that are shifted into S_new
-				   else
-				   it is the number of bytes from the item that are shifted into S_new
-				 */
+	/* new nodes allocated to hold what could not fit into S */
+	struct buffer_head *S_new[2];
+	/*
+	 * number of items that will be placed into S_new
+	 * (includes partially shifted items)
+	 */
+	int snum[2];
+	/*
+	 * if an item is partially shifted into S_new then if it is a
+	 * directory item it is the number of entries from the item that
+	 * are shifted into S_new else it is the number of bytes from
+	 * the item that are shifted into S_new
+	 */
+	int sbytes[2];
 	int n, i;
 	int ret_val;
 	int pos_in_item;
@@ -331,8 +343,10 @@ static int balance_leaf(struct tree_bala
 		zeros_num = ih_item_len(ih);
 
 	pos_in_item = tb->tb_path->pos_in_item;
-	/* for indirect item pos_in_item is measured in unformatted node
-	   pointers. Recalculate to bytes */
+	/*
+	 * for indirect item pos_in_item is measured in unformatted node
+	 * pointers. Recalculate to bytes
+	 */
 	if (flag != M_INSERT
 	    && is_indirect_le_ih(item_head(tbS0, item_pos)))
 		pos_in_item *= UNFM_P_SIZE;
@@ -792,16 +806,20 @@ static int balance_leaf(struct tree_bala
 	RFALSE(tb->blknum[0] < 0,
 	       "PAP-12185: blknum can not be %d. It must be >= 0", tb->blknum[0]);
 
-	/* if while adding to a node we discover that it is possible to split
-	   it in two, and merge the left part into the left neighbor and the
-	   right part into the right neighbor, eliminating the node */
+	/*
+	 * if while adding to a node we discover that it is possible to split
+	 * it in two, and merge the left part into the left neighbor and the
+	 * right part into the right neighbor, eliminating the node
+	 */
 	if (tb->blknum[0] == 0) {	/* node S[0] is empty now */
 
 		RFALSE(!tb->lnum[0] || !tb->rnum[0],
 		       "PAP-12190: lnum and rnum must not be zero");
-		/* if insertion was done before 0-th position in R[0], right
-		   delimiting key of the tb->L[0]'s and left delimiting key are
-		   not set correctly */
+		/*
+		 * if insertion was done before 0-th position in R[0], right
+		 * delimiting key of the tb->L[0]'s and left delimiting key are
+		 * not set correctly
+		 */
 		if (tb->CFL[0]) {
 			if (!tb->CFR[0])
 				reiserfs_panic(tb->tb_sb, "vs-12195",
@@ -1159,9 +1177,11 @@ static int balance_leaf(struct tree_bala
 			       "PAP-12290", "insert_size is still not 0 (%d)",
 			       tb->insert_size[0]);
 	}
-#endif				/* CONFIG_REISERFS_CHECK */
+#endif
+
+	/* Leaf level of the tree is balanced (end of balance_leaf) */
 	return 0;
-}				/* Leaf level of the tree is balanced (end of balance_leaf) */
+}
 
 /* Make empty node */
 void make_empty_node(struct buffer_info *bi)


