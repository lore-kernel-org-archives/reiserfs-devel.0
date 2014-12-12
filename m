From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv4 03/10] reiser4: block_alloc: move block accounting by pre-commit hook into block_alloc.c and document BA_DEFER behavior.
Date: Sat, 13 Dec 2014 00:00:39 +0300
Message-ID: <1418418046-10933-4-git-send-email-intelfx100@gmail.com>
References: <1418418046-10933-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wovGUfwllq24pjaAWuwGmKAFlqZ69LugiMyEEG4te8o=;
        b=A7QYEJDE2Y7H7mXNzWpViHfSbaLNoWxx5Cx79XATKNUxVLdQfDqg86Eng27RbehdOG
         PA23Lepwsw848Tlv5ouaF0IVj+RSXlRKnaJRV5yFTWJ376sLjBxIeG5udQPWj3BJMshp
         52o0hbwdQBlfED296X4Arie3hgGSwageo+vrOBoUFvBZzGe06MTga0mTc8RopvM/sLvZ
         GH0vxlm7ZONIKn61Z/BGv2fPB+6PZ4OfI9cBZQcyiubq+nfk8uRcc2wSb9M5T5Y36o89
         VYd86EcYNDvOUx1wJd5HGzEdztSwr9KApHxu9yW2yieEcnIknvsqEIrMa51GVsgJjeZj
         JeDA==
In-Reply-To: <1418418046-10933-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

BA_DEFER deallocations ignore target_stage and other flags and use some implied
values for these parameters. Document these values and where they do matter.

Also move deallocated block accounting into block_alloc.c because
1) it is allocator-independent;
2) it allows discard code to rely on that accounting is done in pre-commit hook and
   not later, so that discard code should not use BA_PERMANENT in its allocations.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/block_alloc.c         | 44 +++++++++++++++++++++++++++++++++++++++-
 fs/reiser4/plugin/space/bitmap.c | 23 ++-------------------
 2 files changed, 45 insertions(+), 22 deletions(-)

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 56795ca..549cc0a 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -998,6 +998,19 @@ reiser4_check_blocks(const reiser4_block_nr * start,
 /* BA_FORMATTED bit is only used when BA_DEFER in not present: it is used to
    distinguish blocks allocated for unformatted and formatted nodes */
 
+/* if BA_DEFER is enabled, @target_stage and other @flags are ignored.
+ *
+ * @target_stage is implied to be BLOCK_NOT_COUNTED.
+ * (assumption is used in reiser4_post_write_back_hook() and apply_dset())
+ *
+ * @flags are implied to have BA_PERMANENT.
+ * (assumption is used in reiser4_pre_commit_hook() which counts deallocated
+ *  blocks)
+ * 
+ * That is, if a deferred deallocation is done after reiser4_pre_commit_hook(),
+ * then BA_PERMANENT is implied to be disabled.
+ */
+
 int
 reiser4_dealloc_blocks(const reiser4_block_nr * start,
 		       const reiser4_block_nr * len,
@@ -1089,10 +1102,39 @@ reiser4_dealloc_blocks(const reiser4_block_nr * start,
 	return 0;
 }
 
+/* an actor for counting blocks that are going to be deallocated */
+static int
+count_dset_blocks(txn_atom * atom, const reiser4_block_nr * start,
+                  const reiser4_block_nr * len, void *data)
+{
+	reiser4_block_nr *blocks_freed_p = data;
+
+	if (len != NULL) {
+		(*blocks_freed_p) += *len;
+	} else {
+		(*blocks_freed_p)++;
+	}
+	return 0;
+}
+
 /* wrappers for block allocator plugin methods */
 int reiser4_pre_commit_hook(void)
 {
-	assert("zam-502", get_current_super_private() != NULL);
+	reiser4_block_nr blocks_freed = 0;
+	reiser4_super_info_data *sbinfo = get_current_super_private();
+	txn_atom *atom = get_current_atom_locked();
+
+	assert("zam-502", sbinfo != NULL);
+
+	assert("zam-876", atom->stage == ASTAGE_PRE_COMMIT);
+	spin_unlock_atom(atom);
+
+	atom_dset_deferred_apply(atom, count_dset_blocks, &blocks_freed, 0);
+
+	spin_lock_reiser4_super(sbinfo);
+	sbinfo->blocks_free_committed += blocks_freed - atom->nr_blocks_allocated;
+	spin_unlock_reiser4_super(sbinfo);
+
 	sa_pre_commit_hook();
 	return 0;
 }
diff --git a/fs/reiser4/plugin/space/bitmap.c b/fs/reiser4/plugin/space/bitmap.c
index e56c336..0ce07da 100644
--- a/fs/reiser4/plugin/space/bitmap.c
+++ b/fs/reiser4/plugin/space/bitmap.c
@@ -1322,15 +1322,13 @@ static void cond_add_to_overwrite_set(txn_atom * atom, jnode * node)
    pages in a single-linked list */
 static int
 apply_dset_to_commit_bmap(txn_atom * atom, const reiser4_block_nr * start,
-			  const reiser4_block_nr * len, void *data)
+			  const reiser4_block_nr * len, void *data UNUSED_ARG)
 {
 
 	bmap_nr_t bmap;
 	bmap_off_t offset;
 	int ret;
 
-	long long *blocks_freed_p = data;
-
 	struct bitmap_node *bnode;
 
 	struct super_block *sb = reiser4_get_current_sb();
@@ -1366,11 +1364,8 @@ apply_dset_to_commit_bmap(txn_atom * atom, const reiser4_block_nr * start,
 		assert("zam-443",
 		       offset + *len <= bmap_bit_count(sb->s_blocksize));
 		reiser4_clear_bits(data, offset, (bmap_off_t) (offset + *len));
-
-		(*blocks_freed_p) += *len;
 	} else {
 		reiser4_clear_bit(offset, data);
-		(*blocks_freed_p)++;
 	}
 
 	bnode_set_commit_crc(bnode, bnode_calc_crc(bnode, sb->s_blocksize));
@@ -1393,8 +1388,6 @@ int reiser4_pre_commit_hook_bitmap(void)
 	struct super_block *super = reiser4_get_current_sb();
 	txn_atom *atom;
 
-	long long blocks_freed = 0;
-
 	atom = get_current_atom_locked();
 	assert("zam-876", atom->stage == ASTAGE_PRE_COMMIT);
 	spin_unlock_atom(atom);
@@ -1460,19 +1453,7 @@ int reiser4_pre_commit_hook_bitmap(void)
 		}
 	}
 
-	atom_dset_deferred_apply(atom, apply_dset_to_commit_bmap, &blocks_freed, 0);
-
-	blocks_freed -= atom->nr_blocks_allocated;
-
-	{
-		reiser4_super_info_data *sbinfo;
-
-		sbinfo = get_super_private(super);
-
-		spin_lock_reiser4_super(sbinfo);
-		sbinfo->blocks_free_committed += blocks_freed;
-		spin_unlock_reiser4_super(sbinfo);
-	}
+	atom_dset_deferred_apply(atom, apply_dset_to_commit_bmap, NULL, 0);
 
 	return 0;
 }
-- 
2.1.3

