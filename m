From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4: roll back space grabbing fixes
Date: Sun, 14 Dec 2014 01:17:56 +0100
Message-ID: <548CD734.1080607@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030907030000080903060105"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :content-type;
        bh=CsaWEt+rzZBEfON/t64mk1Ms2T657CpBQkc+vuSm2ro=;
        b=eqqGLngOaUaE2BGygc0B4AvVoC9zwPd2WwaqMkO0iVfb6+ii07bi+V9yw5NjqmmjFb
         IVu22deNLm0R2ViEctHQw6ZrRoAwwVxMq5cnzrGzJ1Pb4lozmiI2SrianFVRLxxMy0eL
         i80q6kNukH1ZTEjg0IogEKUoI4YWntyuX9fPlXz3nhEKSjPLnRNu8HAA1XKWAvsEQpYb
         OjkjtUsjfJymVetRvT0JKAk9HOgdm8XhNoknj4wvdBxuZ2V16iz/6FeSzy980PFldQMS
         LMM4mbAAujX9mMybF/4zuFIrvdp0dJcL1XHmAaHCf+Jc9bh9EvEgfP1dDXkkhNQvBJQD
         yzaA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>
Cc: Ivan Shapovalov <intelfx100@gmail.com>

This is a multi-part message in MIME format.
--------------030907030000080903060105
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Self-NACK-ed by Ivan Shapovalov

--------------030907030000080903060105
Content-Type: text/x-patch;
 name="reiser4-rollback-space-grabbing-fixes.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-rollback-space-grabbing-fixes.patch"

---
 fs/reiser4/block_alloc.c                 |   64 ++++++++++++++-----------------
 fs/reiser4/plugin/file/file.c            |   12 +++--
 fs/reiser4/plugin/file/file_conversion.c |    3 -
 fs/reiser4/plugin/file/tail_conversion.c |   11 ++---
 fs/reiser4/plugin/item/extent_file_ops.c |    3 -
 fs/reiser4/plugin/item/tail.c            |    3 -
 fs/reiser4/safe_link.c                   |    4 +
 7 files changed, 52 insertions(+), 48 deletions(-)

--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -270,6 +270,12 @@ reiser4_grab(reiser4_context * ctx, __u6
 
 	assert("vs-1276", ctx == get_current_context());
 
+	/* Do not grab anything on ro-mounted fs. */
+	if (rofs_super(ctx->super)) {
+		ctx->grab_enabled = 0;
+		return 0;
+	}
+
 	sbinfo = get_super_private(ctx->super);
 
 	spin_lock_reiser4_super(sbinfo);
@@ -294,6 +300,9 @@ reiser4_grab(reiser4_context * ctx, __u6
 
 	assert("nikita-2986", reiser4_check_block_counters(ctx->super));
 
+	/* disable grab space in current context */
+	ctx->grab_enabled = 0;
+
 unlock_and_ret:
 	spin_unlock_reiser4_super(sbinfo);
 
@@ -312,12 +321,6 @@ int reiser4_grab_space(__u64 count, reis
 	if (!(flags & BA_FORCE) && !is_grab_enabled(ctx))
 		return 0;
 
-	/* Do not grab anything on ro-mounted fs. */
-	if (rofs_super(ctx->super)) {
-		ctx->grab_enabled = 0;
-		return 0;
-	}
-
 	ret = reiser4_grab(ctx, count, flags);
 	if (ret == -ENOSPC) {
 
@@ -325,15 +328,10 @@ int reiser4_grab_space(__u64 count, reis
 		   present */
 		if (flags & BA_CAN_COMMIT) {
 			txnmgr_force_commit_all(ctx->super, 0);
+			ctx->grab_enabled = 1;
 			ret = reiser4_grab(ctx, count, flags);
 		}
 	}
-
-	if (ret == 0) {
-		/* disable grab space in current context */
-		ctx->grab_enabled = 0;
-	}
-
 	/*
 	 * allocation from reserved pool cannot fail. This is severe error.
 	 */
@@ -362,41 +360,37 @@ int reiser4_grab_reserved(struct super_b
 			  __u64 count, reiser4_ba_flags_t flags)
 {
 	reiser4_super_info_data *sbinfo = get_super_private(super);
-	int ret;
 
 	assert("nikita-3175", flags & BA_CAN_COMMIT);
 
 	/* Check the delete mutex already taken by us, we assume that
 	 * reading of machine word is atomic. */
 	if (sbinfo->delete_mutex_owner == current) {
-		ret = reiser4_grab_space(count,
-					(flags | BA_RESERVED) & ~BA_CAN_COMMIT);
-
-		if (ret != 0) {
+		if (reiser4_grab_space
+		    (count, (flags | BA_RESERVED) & ~BA_CAN_COMMIT)) {
 			warning("zam-1003",
-			      "nested call of grab_reserved fails count=(%llu)",
-			      (unsigned long long)count);
+				"nested call of grab_reserved fails count=(%llu)",
+				(unsigned long long)count);
 			reiser4_release_reserved(super);
+			return RETERR(-ENOSPC);
 		}
-	} else {
-		ret = reiser4_grab_space(count, flags);
+		return 0;
+	}
 
-		if (ret != 0) {
-			mutex_lock(&sbinfo->delete_mutex);
-			assert("nikita-2929",
-			       sbinfo->delete_mutex_owner == NULL);
-			sbinfo->delete_mutex_owner = current;
-			ret = reiser4_grab_space(count, flags | BA_RESERVED);
-
-			if (ret != 0) {
-				warning("zam-833",
-					"reserved space is not enough (%llu)",
-					(unsigned long long)count);
-				reiser4_release_reserved(super);
-			}
+	if (reiser4_grab_space(count, flags)) {
+		mutex_lock(&sbinfo->delete_mutex);
+		assert("nikita-2929", sbinfo->delete_mutex_owner == NULL);
+		sbinfo->delete_mutex_owner = current;
+
+		if (reiser4_grab_space(count, flags | BA_RESERVED)) {
+			warning("zam-833",
+				"reserved space is not enough (%llu)",
+				(unsigned long long)count);
+			reiser4_release_reserved(super);
+			return RETERR(-ENOSPC);
 		}
 	}
-	return ret;
+	return 0;
 }
 
 void reiser4_release_reserved(struct super_block *super)
--- a/fs/reiser4/plugin/file/file.c
+++ b/fs/reiser4/plugin/file/file.c
@@ -335,10 +335,11 @@ static int find_file_state(struct inode
  */
 static int reserve_partial_page(reiser4_tree * tree)
 {
+	grab_space_enable();
 	return reiser4_grab_reserved(reiser4_get_current_sb(),
 				     1 +
 				     2 * estimate_one_insert_into_item(tree),
-				     BA_CAN_COMMIT | BA_FORCE);
+				     BA_CAN_COMMIT);
 }
 
 /* estimate and reserve space needed to cut one item and update one stat data */
@@ -349,10 +350,11 @@ static int reserve_cut_iteration(reiser4
 
 	assert("nikita-3172", lock_stack_isclean(get_current_lock_stack()));
 
+	grab_space_enable();
 	/* We need to double our estimate now that we can delete more than one
 	   node. */
 	return reiser4_grab_reserved(reiser4_get_current_sb(), estimate * 2,
-				     BA_CAN_COMMIT | BA_FORCE);
+				     BA_CAN_COMMIT);
 }
 
 int reiser4_update_file_size(struct inode *inode, loff_t new_size,
@@ -873,9 +875,10 @@ static int capture_page_and_create_exten
 	/* page capture may require extent creation (if it does not exist yet)
 	   and stat data's update (number of blocks changes on extent
 	   creation) */
+	grab_space_enable();
 	result = reiser4_grab_space(2 * estimate_one_insert_into_item
 				    (reiser4_tree_by_inode(inode)),
-				    BA_CAN_COMMIT | BA_FORCE);
+				    BA_CAN_COMMIT);
 	if (likely(!result))
 		result = find_or_create_extent(page);
 
@@ -2419,8 +2422,9 @@ static int unpack(struct file *filp, str
 
 		set_file_notail(inode);
 
+		grab_space_enable();
 		tograb = inode_file_plugin(inode)->estimate.update(inode);
-		result = reiser4_grab_space(tograb, BA_CAN_COMMIT | BA_FORCE);
+		result = reiser4_grab_space(tograb, BA_CAN_COMMIT);
 		result = reiser4_update_sd(inode);
 	}
 
--- a/fs/reiser4/plugin/file/file_conversion.c
+++ b/fs/reiser4/plugin/file/file_conversion.c
@@ -388,13 +388,14 @@ static int reserve_cryptcompress2unixfil
 	 *     5. possible update of stat-data
 	 *
 	 */
+	grab_space_enable();
 	return reiser4_grab_space
 		(2 * tree->height +
 		 unformatted_nodes  +
 		 unformatted_nodes * estimate_one_insert_into_item(tree) +
 		 1 + estimate_one_insert_item(tree) +
 		 inode_file_plugin(inode)->estimate.update(inode),
-		 BA_CAN_COMMIT | BA_FORCE);
+		 BA_CAN_COMMIT);
 }
 
 /**
--- a/fs/reiser4/plugin/file/tail_conversion.c
+++ b/fs/reiser4/plugin/file/tail_conversion.c
@@ -221,13 +221,13 @@ static int reserve_tail2extent_iteration
 	 *     5. possible update of stat-data
 	 *
 	 */
+	grab_space_enable();
 	return reiser4_grab_space
 	    (2 * tree->height +
 	     TAIL2EXTENT_PAGE_NUM +
 	     TAIL2EXTENT_PAGE_NUM * estimate_one_insert_into_item(tree) +
 	     1 + estimate_one_insert_item(tree) +
-	     inode_file_plugin(inode)->estimate.update(inode),
-	     BA_CAN_COMMIT | BA_FORCE);
+	     inode_file_plugin(inode)->estimate.update(inode), BA_CAN_COMMIT);
 }
 
 /* clear stat data's flag indicating that conversion is being converted */
@@ -235,9 +235,10 @@ static int complete_conversion(struct in
 {
 	int result;
 
+	grab_space_enable();
 	result =
 	    reiser4_grab_space(inode_file_plugin(inode)->estimate.update(inode),
-			       BA_CAN_COMMIT | BA_FORCE);
+			       BA_CAN_COMMIT);
 	if (result == 0) {
 		reiser4_inode_clr_flag(inode, REISER4_PART_MIXED);
 		result = reiser4_update_sd(inode);
@@ -551,12 +552,12 @@ static int reserve_extent2tail_iteration
 	 *
 	 *     4. possible update of stat-data
 	 */
+	grab_space_enable();
 	return reiser4_grab_space
 	    (estimate_one_item_removal(tree) +
 	     estimate_insert_flow(tree->height) +
 	     1 + estimate_one_insert_item(tree) +
-	     inode_file_plugin(inode)->estimate.update(inode),
-	     BA_CAN_COMMIT | BA_FORCE);
+	     inode_file_plugin(inode)->estimate.update(inode), BA_CAN_COMMIT);
 }
 
 /* for every page of file: read page, cut part of extent pointing to this page,
--- a/fs/reiser4/plugin/item/extent_file_ops.c
+++ b/fs/reiser4/plugin/item/extent_file_ops.c
@@ -933,7 +933,8 @@ static int write_extent_reserve_space(st
 	count = estimate_one_insert_item(tree) +
 		WRITE_GRANULARITY * (1 + estimate_one_insert_into_item(tree)) +
 		estimate_one_insert_item(tree);
-	return reiser4_grab_space(count, BA_FORCE);
+	grab_space_enable();
+	return reiser4_grab_space(count, 0 /* flags */);
 }
 
 /*
--- a/fs/reiser4/plugin/item/tail.c
+++ b/fs/reiser4/plugin/item/tail.c
@@ -603,7 +603,8 @@ static int write_extent_reserve_space(st
 	count = estimate_one_insert_item(tree) +
 		estimate_insert_flow(tree->height) +
 		estimate_one_insert_item(tree);
-	return reiser4_grab_space(count, BA_FORCE);
+	grab_space_enable();
+	return reiser4_grab_space(count, 0 /* flags */);
 }
 
 #define PAGE_PER_FLOW 4
--- a/fs/reiser4/safe_link.c
+++ b/fs/reiser4/safe_link.c
@@ -130,11 +130,13 @@ int safe_link_grab(reiser4_tree * tree,
 {
 	int result;
 
+	grab_space_enable();
 	/* The sbinfo->delete_mutex can be taken here.
 	 * safe_link_release() should be called before leaving reiser4
 	 * context. */
 	result =
-	    reiser4_grab_reserved(tree->super, safe_link_tograb(tree), flags | BA_FORCE);
+	    reiser4_grab_reserved(tree->super, safe_link_tograb(tree), flags);
+	grab_space_enable();
 	return result;
 }
 

--------------030907030000080903060105--
