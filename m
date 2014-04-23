From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 28/29] reiserfs: balance_leaf refactor, format balance_leaf_finish_node
Date: Wed, 23 Apr 2014 10:01:01 -0400
Message-ID: <20140423151151.248270740@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-balance_leaf-refactor-format-balance_leaf_finish_node
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

Split out balance_leaf_finish_node_dirent from balance_leaf_paste_finish_node.

Also reformat to adhere to CodingStyle.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/do_balan.c |  163 +++++++++++++++++++++----------------------------
 1 file changed, 72 insertions(+), 91 deletions(-)

--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -72,19 +72,6 @@ inline void do_balance_mark_leaf_dirty(s
  *    if snum1 is larger than 0 we put items into the new node s1
  *    if snum2 is larger than 0 we put items into the new node s2
  * Note that all *num* count new items being created.
- *
- * It would be easier to read balance_leaf() if each of these summary
- * lines was a separate procedure rather than being inlined.  I think
- * that there are many passages here and in balance_leaf_when_delete() in
- * which two calls to one procedure can replace two passages, and it
- * might save cache space and improve software maintenance costs to do so.
- *
- * Vladimir made the perceptive comment that we should offload most of
- * the decision making in this function into fix_nodes/check_balance, and
- * then create some sort of structure in tb that says what actions should
- * be performed by do_balance.
- *
- * -Hans
  */
 
 /*
@@ -1263,18 +1250,49 @@ static void balance_leaf_finish_node_ins
 {
 	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
 	struct buffer_info bi;
-			buffer_info_init_tbS0(tb, &bi);
-			leaf_insert_into_buf(&bi, tb->item_pos, ih,
-					     body, tb->zeroes_num);
-
-			/*
-			 * If we insert the first key
-			 * change the delimiting key
-			 */
-			if (tb->item_pos == 0) {
-				if (tb->CFL[0])	/* can be 0 in reiserfsck */
-					replace_key(tb, tb->CFL[0], tb->lkey[0], tbS0, 0);
-			}
+	buffer_info_init_tbS0(tb, &bi);
+	leaf_insert_into_buf(&bi, tb->item_pos, ih, body, tb->zeroes_num);
+
+	/* If we insert the first key change the delimiting key */
+	if (tb->item_pos == 0) {
+		if (tb->CFL[0])	/* can be 0 in reiserfsck */
+			replace_key(tb, tb->CFL[0], tb->lkey[0], tbS0, 0);
+
+	}
+}
+
+static void balance_leaf_finish_node_paste_dirent(struct tree_balance *tb,
+						  struct item_head *ih,
+						  const char *body)
+{
+	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
+	struct item_head *pasted = item_head(tbS0, tb->item_pos);
+	struct buffer_info bi;
+
+	if (tb->pos_in_item >= 0 && tb->pos_in_item <= ih_entry_count(pasted)) {
+		RFALSE(!tb->insert_size[0],
+		       "PAP-12260: insert_size is 0 already");
+
+		/* prepare space */
+		buffer_info_init_tbS0(tb, &bi);
+		leaf_paste_in_buffer(&bi, tb->item_pos, tb->pos_in_item,
+				     tb->insert_size[0], body, tb->zeroes_num);
+
+		/* paste entry */
+		leaf_paste_entries(&bi, tb->item_pos, tb->pos_in_item, 1,
+				   (struct reiserfs_de_head *)body,
+				   body + DEH_SIZE, tb->insert_size[0]);
+
+		if (!tb->item_pos && !tb->pos_in_item) {
+			RFALSE(!tb->CFL[0] || !tb->L[0],
+			       "PAP-12270: CFL[0]/L[0] must  be specified");
+			if (tb->CFL[0])
+				replace_key(tb, tb->CFL[0], tb->lkey[0],
+					    tbS0, 0);
+		}
+
+		tb->insert_size[0] = 0;
+	}
 }
 
 static void balance_leaf_finish_node_paste(struct tree_balance *tb,
@@ -1283,74 +1301,37 @@ static void balance_leaf_finish_node_pas
 {
 	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
 	struct buffer_info bi;
-				struct item_head *pasted;
+	struct item_head *pasted = item_head(tbS0, tb->item_pos);
 
-				pasted = item_head(tbS0, tb->item_pos);
-				/* when directory, may be new entry already pasted */
-				if (is_direntry_le_ih(pasted)) {
-					if (tb->pos_in_item >= 0 && tb->pos_in_item <= ih_entry_count(pasted)) {
-
-						RFALSE(!tb->insert_size[0],
-						       "PAP-12260: insert_size is 0 already");
-
-						/* prepare space */
-						buffer_info_init_tbS0(tb, &bi);
-						leaf_paste_in_buffer(&bi, tb->item_pos, tb->pos_in_item,
-								     tb->insert_size[0], body,
-								     tb->zeroes_num);
-
-						/* paste entry */
-						leaf_paste_entries(&bi, tb->item_pos, tb->pos_in_item, 1,
-								   (struct reiserfs_de_head *)body,
-								   body + DEH_SIZE,
-								   tb->insert_size[0]);
-						if (!tb->item_pos && !tb->pos_in_item) {
-							RFALSE(!tb->CFL[0] || !tb->L[0],
-							       "PAP-12270: CFL[0]/L[0] must be specified");
-							if (tb->CFL[0])
-								replace_key(tb, tb->CFL[0], tb->lkey[0], tbS0, 0);
-						}
-						tb->insert_size[0] = 0;
-					}
-				} else {	/* regular object */
-					if (tb->pos_in_item == ih_item_len(pasted)) {
-
-						RFALSE(tb->insert_size[0] <= 0,
-						       "PAP-12275: insert size must not be %d",
-						       tb->insert_size[0]);
-						buffer_info_init_tbS0(tb, &bi);
-						leaf_paste_in_buffer(&bi, tb->item_pos, tb->pos_in_item,
-								     tb->insert_size[0], body, tb->zeroes_num);
-
-						if (is_indirect_le_ih(pasted)) {
-#if 0
-							RFALSE(tb->
-							       insert_size[0] !=
-							       UNFM_P_SIZE,
-							       "PAP-12280: insert_size for indirect item must be %d, not %d",
-							       UNFM_P_SIZE,
-							       tb->
-							       insert_size[0]);
-#endif
-							set_ih_free_space(pasted, 0);
-						}
-						tb->insert_size[0] = 0;
-					}
-#ifdef CONFIG_REISERFS_CHECK
-					else {
-						if (tb->insert_size[0]) {
-							print_cur_tb("12285");
-							reiserfs_panic(tb->tb_sb,
-							    "PAP-12285",
-							    "insert_size "
-							    "must be 0 "
-							    "(%d)",
-							    tb->insert_size[0]);
-						}
-					}
-#endif				/* CONFIG_REISERFS_CHECK */
+	/* when directory, may be new entry already pasted */
+	if (is_direntry_le_ih(pasted)) {
+		balance_leaf_finish_node_paste_dirent(tb, ih, body);
+		return;
+	}
 
-				}
+	/* regular object */
+
+	if (tb->pos_in_item == ih_item_len(pasted)) {
+		RFALSE(tb->insert_size[0] <= 0,
+		       "PAP-12275: insert size must not be %d",
+		       tb->insert_size[0]);
+		buffer_info_init_tbS0(tb, &bi);
+		leaf_paste_in_buffer(&bi, tb->item_pos,
+				     tb->pos_in_item, tb->insert_size[0], body,
+				     tb->zeroes_num);
+
+		if (is_indirect_le_ih(pasted))
+			set_ih_free_space(pasted, 0);
+
+		tb->insert_size[0] = 0;
+	}
+#ifdef CONFIG_REISERFS_CHECK
+	else if (tb->insert_size[0]) {
+		print_cur_tb("12285");
+		reiserfs_panic(tb->tb_sb, "PAP-12285",
+		    "insert_size must be 0 (%d)", tb->insert_size[0]);
+	}
+#endif
 }
 
 /*


