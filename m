From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 21/29] reiserfs: balance_leaf refactor, pull out balance_leaf_finish_node_paste
Date: Wed, 23 Apr 2014 10:00:54 -0400
Message-ID: <20140423151144.052718741@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-balance_leaf-refactor-pull-out-balance_leaf_finish_node_paste
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

This patch factors out a new balance_leaf_finish_node_paste from the code
in balance_leaf responsible for pasting new content into existing items
held in S[0].

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/do_balan.c |  150 +++++++++++++++++++++++++------------------------
 1 file changed, 79 insertions(+), 71 deletions(-)

--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -982,6 +982,82 @@ static void balance_leaf_finish_node_ins
 			}
 }
 
+static void balance_leaf_finish_node_paste(struct tree_balance *tb,
+					   struct item_head *ih,
+					   const char *body)
+{
+	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
+	struct buffer_info bi;
+				struct item_head *pasted;
+
+				pasted = item_head(tbS0, tb->item_pos);
+				/* when directory, may be new entry already pasted */
+				if (is_direntry_le_ih(pasted)) {
+					if (tb->pos_in_item >= 0 && tb->pos_in_item <= ih_entry_count(pasted)) {
+
+						RFALSE(!tb->insert_size[0],
+						       "PAP-12260: insert_size is 0 already");
+
+						/* prepare space */
+						buffer_info_init_tbS0(tb, &bi);
+						leaf_paste_in_buffer(&bi, tb->item_pos, tb->pos_in_item,
+								     tb->insert_size[0], body,
+								     tb->zeroes_num);
+
+						/* paste entry */
+						leaf_paste_entries(&bi, tb->item_pos, tb->pos_in_item, 1,
+								   (struct reiserfs_de_head *)body,
+								   body + DEH_SIZE,
+								   tb->insert_size[0]);
+						if (!tb->item_pos && !tb->pos_in_item) {
+							RFALSE(!tb->CFL[0] || !tb->L[0],
+							       "PAP-12270: CFL[0]/L[0] must be specified");
+							if (tb->CFL[0])
+								replace_key(tb, tb->CFL[0], tb->lkey[0], tbS0, 0);
+						}
+						tb->insert_size[0] = 0;
+					}
+				} else {	/* regular object */
+					if (tb->pos_in_item == ih_item_len(pasted)) {
+
+						RFALSE(tb->insert_size[0] <= 0,
+						       "PAP-12275: insert size must not be %d",
+						       tb->insert_size[0]);
+						buffer_info_init_tbS0(tb, &bi);
+						leaf_paste_in_buffer(&bi, tb->item_pos, tb->pos_in_item,
+								     tb->insert_size[0], body, tb->zeroes_num);
+
+						if (is_indirect_le_ih(pasted)) {
+#if 0
+							RFALSE(tb->
+							       insert_size[0] !=
+							       UNFM_P_SIZE,
+							       "PAP-12280: insert_size for indirect item must be %d, not %d",
+							       UNFM_P_SIZE,
+							       tb->
+							       insert_size[0]);
+#endif
+							set_ih_free_space(pasted, 0);
+						}
+						tb->insert_size[0] = 0;
+					}
+#ifdef CONFIG_REISERFS_CHECK
+					else {
+						if (tb->insert_size[0]) {
+							print_cur_tb("12285");
+							reiserfs_panic(tb->tb_sb,
+							    "PAP-12285",
+							    "insert_size "
+							    "must be 0 "
+							    "(%d)",
+							    tb->insert_size[0]);
+						}
+					}
+#endif				/* CONFIG_REISERFS_CHECK */
+
+				}
+}
+
 /**
  * balance_leaf - reiserfs tree balancing algorithm
  * @tb: tree balance state
@@ -1002,7 +1078,6 @@ static int balance_leaf(struct tree_bala
 			struct buffer_head **insert_ptr)
 {
 	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
-	struct buffer_info bi;
 	int n, i;
 
 	PROC_INFO_INC(tb->tb_sb, balance_at[0]);
@@ -1159,76 +1234,9 @@ static int balance_leaf(struct tree_bala
 			balance_leaf_finish_node_insert(tb, ih, body);
 			break;
 
-		case M_PASTE:{	/* append item in S[0] */
-				struct item_head *pasted;
-
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
-
-				}
-			}	/* case M_PASTE: */
+		case M_PASTE:	/* append item in S[0] */
+			balance_leaf_finish_node_paste(tb, ih, body);
+			break;
 		}
 	}
 #ifdef CONFIG_REISERFS_CHECK


