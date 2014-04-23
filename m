From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 15/29] reiserfs: balance_leaf refactor, pull out balance_leaf_paste_left
Date: Wed, 23 Apr 2014 10:00:48 -0400
Message-ID: <20140423151141.105657378@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-balance_leaf-refactor-pull-out-balance_leaf_paste_left
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

This patch factors out a new balance_leaf_paste_left from the code in
balance_leaf responsible for pasting new content into an existing item
located in the node to the left of S[0] in the tree.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/do_balan.c |  117 ++++++++++++++++++++++++++-----------------------
 1 file changed, 64 insertions(+), 53 deletions(-)

--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -348,62 +348,13 @@ static void balance_leaf_insert_left(str
 
 }
 
-/**
- * balance_leaf - reiserfs tree balancing algorithm
- * @tb: tree balance state
- * @ih: item header of inserted item (little endian)
- * @body: body of inserted item or bytes to paste
- * @flag: i - insert, d - delete, c - cut, p - paste (see do_balance)
- * passed back:
- * @insert_key: key to insert new nodes
- * @insert_ptr: array of nodes to insert at the next level
- *
- * In our processing of one level we sometimes determine what must be
- * inserted into the next higher level.  This insertion consists of a
- * key or two keys and their corresponding pointers.
- */
-static int balance_leaf(struct tree_balance *tb, struct item_head *ih,
-			const char *body, int flag,
-			struct item_head *insert_key,
-			struct buffer_head **insert_ptr)
+static void balance_leaf_paste_left(struct tree_balance *tb,
+				    struct item_head *ih, const char *body)
 {
 	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
-	struct buffer_info bi;
-	int n, i;
 	int ret_val;
-
-	PROC_INFO_INC(tb->tb_sb, balance_at[0]);
-
-	/* Make balance in case insert_size[0] < 0 */
-	if (tb->insert_size[0] < 0)
-		return balance_leaf_when_delete(tb, flag);
-
-	tb->item_pos = PATH_LAST_POSITION(tb->tb_path),
-	tb->pos_in_item = tb->tb_path->pos_in_item,
-	tb->zeroes_num = 0;
-	if (flag == M_INSERT && !body)
-		tb->zeroes_num = ih_item_len(ih);
-
-	/*
-	 * for indirect item pos_in_item is measured in unformatted node
-	 * pointers. Recalculate to bytes
-	 */
-	if (flag != M_INSERT
-	    && is_indirect_le_ih(item_head(tbS0, tb->item_pos)))
-		tb->pos_in_item *= UNFM_P_SIZE;
-
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
+	struct buffer_info bi;
+	int n = B_NR_ITEMS(tb->L[0]);
 
 				if (tb->item_pos == tb->lnum[0] - 1 && tb->lbytes != -1) {
 					/* we must shift the part of the appended item */
@@ -554,6 +505,66 @@ static int balance_leaf(struct tree_bala
 					tb->insert_size[0] = 0;
 					tb->zeroes_num = 0;
 				}
+
+}
+
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
+{
+	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
+	struct buffer_info bi;
+	int n, i;
+	int ret_val;
+
+	PROC_INFO_INC(tb->tb_sb, balance_at[0]);
+
+	/* Make balance in case insert_size[0] < 0 */
+	if (tb->insert_size[0] < 0)
+		return balance_leaf_when_delete(tb, flag);
+
+	tb->item_pos = PATH_LAST_POSITION(tb->tb_path),
+	tb->pos_in_item = tb->tb_path->pos_in_item,
+	tb->zeroes_num = 0;
+	if (flag == M_INSERT && !body)
+		tb->zeroes_num = ih_item_len(ih);
+
+	/*
+	 * for indirect item pos_in_item is measured in unformatted node
+	 * pointers. Recalculate to bytes
+	 */
+	if (flag != M_INSERT
+	    && is_indirect_le_ih(item_head(tbS0, tb->item_pos)))
+		tb->pos_in_item *= UNFM_P_SIZE;
+
+	if (tb->lnum[0] > 0) {
+		/* Shift lnum[0] items from S[0] to the left neighbor L[0] */
+		if (tb->item_pos < tb->lnum[0]) {
+			/* new item or it part falls to L[0], shift it too */
+			n = B_NR_ITEMS(tb->L[0]);
+
+			switch (flag) {
+			case M_INSERT:	/* insert item into L[0] */
+				balance_leaf_insert_left(tb, ih, body);
+				break;
+
+			case M_PASTE:	/* append item in L[0] */
+				balance_leaf_paste_left(tb, ih, body);
 				break;
 			default:	/* cases d and t */
 				reiserfs_panic(tb->tb_sb, "PAP-12130",


