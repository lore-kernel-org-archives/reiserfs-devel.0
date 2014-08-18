From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 1/2] reiser4: sanitize deallocations throughout the code.
Date: Mon, 18 Aug 2014 15:31:10 +0400
Message-ID: <1408361471-1488-2-git-send-email-intelfx100@gmail.com>
References: <1408361471-1488-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dHd8qXT8txE4iE35y3OIrYg21zyO7mVWNLD6PCdeJJg=;
        b=LEedlRKzsYlhWENH9R5rHiaN5g6DtrfLp54N9xFEoDblEPj/yisohObIkpJYDom462
         oElYvx3MtV0ZDaymq1i382M9XiwS54wfpzQJg0FG1r5YXuaJxGwRuq2vgpnTGxr+pJGa
         u5HyKoD5GYOLfzSmW5Q6+XHFLOKZfruTBs8mrjOI9XmpoT3AfNHUe5kpaGgwYiW9TuRX
         z1/L5lxhTeBakSdiCOEI4aV7Oax9rS6EHN78nrSSe+GeW4r96dvsjuiPhrzJ5qNJNw/E
         GvawChJZu6HVWy+PY5wc7K3JY4Sa0nuFPX/FgiBM0JXjftxsEvE4+awML+Mf0rXngxpS
         8XFQ==
In-Reply-To: <1408361471-1488-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

- Deferred (BA_DEFER) deallocations do not make use of target stage and
  other flags, so remove them to avoid confusion.
- mark final deallocations in wandering log code as deferred.

With the last point, there is a clear semantic distinction between
deferred and immediate deallocations.
Deferred mode is used to deallocate blocks that were previously written,
immediate mode is used to deallocate "just allocated" blocks in error
paths or if some previously allocated blocks turn out to be unneeded.

This way, we may get rid of discard-related hack in the deallocation routine,
i. e. treating immediate deallocations as deferred (which messes up
block accounting). This is done in the next commit.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/plugin/txmod.c | 18 ++++++------------
 fs/reiser4/tree.c         |  3 +--
 fs/reiser4/wander.c       |  5 ++---
 3 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/fs/reiser4/plugin/txmod.c b/fs/reiser4/plugin/txmod.c
index 63d461f..d8a99b7 100644
--- a/fs/reiser4/plugin/txmod.c
+++ b/fs/reiser4/plugin/txmod.c
@@ -287,8 +287,7 @@ static int forward_relocate_unformatted(flush_pos_t *flush_pos,
 		 * on relocating - free nodes which are going to be
 		 * relocated
 		 */
-		reiser4_dealloc_blocks(&start, &allocated,
-				       BLOCK_ALLOCATED, BA_DEFER);
+		reiser4_dealloc_blocks(&start, &allocated, 0, BA_DEFER);
 
 	/* assign new block numbers to protected nodes */
 	assign_real_blocknrs(flush_pos, oid, index, allocated, first_allocated);
@@ -386,16 +385,13 @@ static squeeze_result squeeze_relocate_unformatted(znode *left,
 	result = put_unit_to_end(left, key, &copy_extent);
 
 	if (result == -E_NODE_FULL) {
-		int target_block_stage;
 		/*
 		 * free blocks which were just allocated
 		 */
-		target_block_stage =
-			(state ==
-			 ALLOCATED_EXTENT) ? BLOCK_FLUSH_RESERVED :
-			BLOCK_UNALLOCATED;
 		reiser4_dealloc_blocks(&first_allocated, &allocated,
-				       target_block_stage,
+				       (state == ALLOCATED_EXTENT)
+				       ? BLOCK_FLUSH_RESERVED
+				       : BLOCK_UNALLOCATED,
 				       BA_PERMANENT);
 		/*
 		 * rewind the preceder
@@ -408,8 +404,7 @@ static squeeze_result squeeze_relocate_unformatted(znode *left,
 		/*
 		 * free nodes which were relocated
 		 */
-		reiser4_dealloc_blocks(&start, &allocated,
-				       BLOCK_ALLOCATED, BA_DEFER);
+		reiser4_dealloc_blocks(&start, &allocated, 0, BA_DEFER);
 	}
 	/*
 	 * assign new block numbers to protected nodes
@@ -689,8 +684,7 @@ static int forward_try_defragment_locality(znode * node,
 		goto exit;
 
 	if (!ZF_ISSET(node, JNODE_CREATED) &&
-	    (ret = reiser4_dealloc_block(znode_get_block(node), 0,
-					 BA_DEFER | BA_FORMATTED)))
+	    (ret = reiser4_dealloc_block(znode_get_block(node), 0, BA_DEFER)))
 		goto exit;
 
 	if (likely(!znode_is_root(node))) {
diff --git a/fs/reiser4/tree.c b/fs/reiser4/tree.c
index 27d8dc3..46072d9 100644
--- a/fs/reiser4/tree.c
+++ b/fs/reiser4/tree.c
@@ -679,8 +679,7 @@ static void uncapture_znode(znode * node)
 
 		/* An already allocated block goes right to the atom's delete set. */
 		ret =
-		    reiser4_dealloc_block(znode_get_block(node), 0,
-					  BA_DEFER | BA_FORMATTED);
+		    reiser4_dealloc_block(znode_get_block(node), 0, BA_DEFER);
 		if (ret)
 			warning("zam-942",
 				"can\'t add a block (%llu) number to atom's delete set\n",
diff --git a/fs/reiser4/wander.c b/fs/reiser4/wander.c
index 04ddec6..fc35a7c 100644
--- a/fs/reiser4/wander.c
+++ b/fs/reiser4/wander.c
@@ -482,8 +482,7 @@ static void dealloc_tx_list(struct commit_handle *ch)
 		jnode *cur = list_entry(ch->tx_list.next, jnode, capture_link);
 		list_del(&cur->capture_link);
 		ON_DEBUG(INIT_LIST_HEAD(&cur->capture_link));
-		reiser4_dealloc_block(jnode_get_block(cur), BLOCK_NOT_COUNTED,
-				      BA_FORMATTED);
+		reiser4_dealloc_block(jnode_get_block(cur), 0, BA_DEFER);
 
 		unpin_jnode_data(cur);
 		reiser4_drop_io_head(cur);
@@ -502,7 +501,7 @@ dealloc_wmap_actor(txn_atom * atom UNUSED_ARG,
 	assert("zam-500", *b != 0);
 	assert("zam-501", !reiser4_blocknr_is_fake(b));
 
-	reiser4_dealloc_block(b, BLOCK_NOT_COUNTED, BA_FORMATTED);
+	reiser4_dealloc_block(b, 0, BA_DEFER);
 	return 0;
 }
 
-- 
2.0.4

