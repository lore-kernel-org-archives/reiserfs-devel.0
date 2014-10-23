From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv2 3/3] reiser4: do not mess with grab_enabled; instead, use BA_FORCE.
Date: Thu, 23 Oct 2014 11:18:05 +0400
Message-ID: <1414048685-4224-4-git-send-email-intelfx100@gmail.com>
References: <1414048685-4224-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9v7AB9OZ08Wsk6SBExeFZHMysGWG/7vNSS99LgsnW8Y=;
        b=WLoo+MUdJg5syFbvvSJxzMbQ0AyZkPW7CY93L6DJGa46miG/cL3e/QLXbpBXx6yP/y
         Qu1VXKdwqUh+L8mTrLiUDt8Q6zV6SgWKeUWsV9cGViMtWteY6wGghB5VKkdzY07Ns++7
         EKEvdxAt3nCSFqsisLnZOYXf1qzRlc0jHbRHlshST8wCGKwXXBs460/ThicbP/EzsNgF
         F0GigKAzAjx1D2MadQdp/uasgrHj9buEtIIEAqPB3J3XEOYYtxsHiqdPKoLLcRfLpV5L
         yE66j+m49MlVxg58RYPg+ajAJ/aAod+g68toB9CIoW6LwXg3Za1zK7Fn0+VIB1bu8vL0
         INRg==
In-Reply-To: <1414048685-4224-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/plugin/file/file.c            | 12 ++++--------
 fs/reiser4/plugin/file/file_conversion.c |  3 +--
 fs/reiser4/plugin/file/tail_conversion.c | 11 +++++------
 fs/reiser4/plugin/item/extent_file_ops.c |  3 +--
 fs/reiser4/plugin/item/tail.c            |  3 +--
 fs/reiser4/safe_link.c                   |  4 +---
 6 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/fs/reiser4/plugin/file/file.c b/fs/reiser4/plugin/file/file.c
index 94029cd..b0bfa86 100644
--- a/fs/reiser4/plugin/file/file.c
+++ b/fs/reiser4/plugin/file/file.c
@@ -335,11 +335,10 @@ static int find_file_state(struct inode *inode, struct unix_file_info *uf_info)
  */
 static int reserve_partial_page(reiser4_tree * tree)
 {
-	grab_space_enable();
 	return reiser4_grab_reserved(reiser4_get_current_sb(),
 				     1 +
 				     2 * estimate_one_insert_into_item(tree),
-				     BA_CAN_COMMIT);
+				     BA_CAN_COMMIT | BA_FORCE);
 }
 
 /* estimate and reserve space needed to cut one item and update one stat data */
@@ -350,11 +349,10 @@ static int reserve_cut_iteration(reiser4_tree * tree)
 
 	assert("nikita-3172", lock_stack_isclean(get_current_lock_stack()));
 
-	grab_space_enable();
 	/* We need to double our estimate now that we can delete more than one
 	   node. */
 	return reiser4_grab_reserved(reiser4_get_current_sb(), estimate * 2,
-				     BA_CAN_COMMIT);
+				     BA_CAN_COMMIT | BA_FORCE);
 }
 
 int reiser4_update_file_size(struct inode *inode, loff_t new_size,
@@ -875,10 +873,9 @@ static int capture_page_and_create_extent(struct page *page)
 	/* page capture may require extent creation (if it does not exist yet)
 	   and stat data's update (number of blocks changes on extent
 	   creation) */
-	grab_space_enable();
 	result = reiser4_grab_space(2 * estimate_one_insert_into_item
 				    (reiser4_tree_by_inode(inode)),
-				    BA_CAN_COMMIT);
+				    BA_CAN_COMMIT | BA_FORCE);
 	if (likely(!result))
 		result = find_or_create_extent(page);
 
@@ -2421,9 +2418,8 @@ static int unpack(struct file *filp, struct inode *inode, int forever)
 
 		set_file_notail(inode);
 
-		grab_space_enable();
 		tograb = inode_file_plugin(inode)->estimate.update(inode);
-		result = reiser4_grab_space(tograb, BA_CAN_COMMIT);
+		result = reiser4_grab_space(tograb, BA_CAN_COMMIT | BA_FORCE);
 		result = reiser4_update_sd(inode);
 	}
 
diff --git a/fs/reiser4/plugin/file/file_conversion.c b/fs/reiser4/plugin/file/file_conversion.c
index 3ce4898..e01720f 100644
--- a/fs/reiser4/plugin/file/file_conversion.c
+++ b/fs/reiser4/plugin/file/file_conversion.c
@@ -388,14 +388,13 @@ static int reserve_cryptcompress2unixfile(struct inode *inode)
 	 *     5. possible update of stat-data
 	 *
 	 */
-	grab_space_enable();
 	return reiser4_grab_space
 		(2 * tree->height +
 		 unformatted_nodes  +
 		 unformatted_nodes * estimate_one_insert_into_item(tree) +
 		 1 + estimate_one_insert_item(tree) +
 		 inode_file_plugin(inode)->estimate.update(inode),
-		 BA_CAN_COMMIT);
+		 BA_CAN_COMMIT | BA_FORCE);
 }
 
 /**
diff --git a/fs/reiser4/plugin/file/tail_conversion.c b/fs/reiser4/plugin/file/tail_conversion.c
index 1763cb1..22f30fd 100644
--- a/fs/reiser4/plugin/file/tail_conversion.c
+++ b/fs/reiser4/plugin/file/tail_conversion.c
@@ -221,13 +221,13 @@ static int reserve_tail2extent_iteration(struct inode *inode)
 	 *     5. possible update of stat-data
 	 *
 	 */
-	grab_space_enable();
 	return reiser4_grab_space
 	    (2 * tree->height +
 	     TAIL2EXTENT_PAGE_NUM +
 	     TAIL2EXTENT_PAGE_NUM * estimate_one_insert_into_item(tree) +
 	     1 + estimate_one_insert_item(tree) +
-	     inode_file_plugin(inode)->estimate.update(inode), BA_CAN_COMMIT);
+	     inode_file_plugin(inode)->estimate.update(inode),
+	     BA_CAN_COMMIT | BA_FORCE);
 }
 
 /* clear stat data's flag indicating that conversion is being converted */
@@ -235,10 +235,9 @@ static int complete_conversion(struct inode *inode)
 {
 	int result;
 
-	grab_space_enable();
 	result =
 	    reiser4_grab_space(inode_file_plugin(inode)->estimate.update(inode),
-			       BA_CAN_COMMIT);
+			       BA_CAN_COMMIT | BA_FORCE);
 	if (result == 0) {
 		reiser4_inode_clr_flag(inode, REISER4_PART_MIXED);
 		result = reiser4_update_sd(inode);
@@ -552,12 +551,12 @@ static int reserve_extent2tail_iteration(struct inode *inode)
 	 *
 	 *     4. possible update of stat-data
 	 */
-	grab_space_enable();
 	return reiser4_grab_space
 	    (estimate_one_item_removal(tree) +
 	     estimate_insert_flow(tree->height) +
 	     1 + estimate_one_insert_item(tree) +
-	     inode_file_plugin(inode)->estimate.update(inode), BA_CAN_COMMIT);
+	     inode_file_plugin(inode)->estimate.update(inode),
+	     BA_CAN_COMMIT | BA_FORCE);
 }
 
 /* for every page of file: read page, cut part of extent pointing to this page,
diff --git a/fs/reiser4/plugin/item/extent_file_ops.c b/fs/reiser4/plugin/item/extent_file_ops.c
index cb57379..8086b5f 100644
--- a/fs/reiser4/plugin/item/extent_file_ops.c
+++ b/fs/reiser4/plugin/item/extent_file_ops.c
@@ -933,8 +933,7 @@ static int write_extent_reserve_space(struct inode *inode)
 	count = estimate_one_insert_item(tree) +
 		WRITE_GRANULARITY * (1 + estimate_one_insert_into_item(tree)) +
 		estimate_one_insert_item(tree);
-	grab_space_enable();
-	return reiser4_grab_space(count, 0 /* flags */);
+	return reiser4_grab_space(count, BA_FORCE);
 }
 
 /*
diff --git a/fs/reiser4/plugin/item/tail.c b/fs/reiser4/plugin/item/tail.c
index 7f4a101..67cb4ba 100644
--- a/fs/reiser4/plugin/item/tail.c
+++ b/fs/reiser4/plugin/item/tail.c
@@ -603,8 +603,7 @@ static int write_extent_reserve_space(struct inode *inode)
 	count = estimate_one_insert_item(tree) +
 		estimate_insert_flow(tree->height) +
 		estimate_one_insert_item(tree);
-	grab_space_enable();
-	return reiser4_grab_space(count, 0 /* flags */);
+	return reiser4_grab_space(count, BA_FORCE);
 }
 
 #define PAGE_PER_FLOW 4
diff --git a/fs/reiser4/safe_link.c b/fs/reiser4/safe_link.c
index d59f6f0..f4cff69 100644
--- a/fs/reiser4/safe_link.c
+++ b/fs/reiser4/safe_link.c
@@ -130,13 +130,11 @@ int safe_link_grab(reiser4_tree * tree, reiser4_ba_flags_t flags)
 {
 	int result;
 
-	grab_space_enable();
 	/* The sbinfo->delete_mutex can be taken here.
 	 * safe_link_release() should be called before leaving reiser4
 	 * context. */
 	result =
-	    reiser4_grab_reserved(tree->super, safe_link_tograb(tree), flags);
-	grab_space_enable();
+	    reiser4_grab_reserved(tree->super, safe_link_tograb(tree), flags | BA_FORCE);
 	return result;
 }
 
-- 
2.1.2

