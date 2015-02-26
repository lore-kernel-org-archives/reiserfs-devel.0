From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv2 3/3] Adjust reiser4 for 3.19: rip out all quota-related code.
Date: Fri, 27 Feb 2015 02:16:50 +0300
Message-ID: <1424992610-28927-3-git-send-email-intelfx100@gmail.com>
References: <1424992610-28927-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FE8duOCz7/91owpsR2hxdna6Mimk8M+cZRslSaIbBo4=;
        b=Gu0sSfCpQm/OWsl6DSg2U4+LIOO5dKtbKax/N66i1ZRYWCkT2IAsYbhlUlJwV3WOEH
         Ll4tViIX8Mfp1aheg/WfImSsJpoGLaszKjTfFmKwdLp3KDnY/Ni7zsxy+piWCmvZpt/S
         zSUtQzS1Vr885Whn0S/6e+KUNFGin4w5Wz1U/fDE7sv/Bhcj+wFqyFevRWLD7/v2Td4X
         JWrvw1KfgXSHQTM/DGijVZzzCuBPmOTLdNdlUP9O3P4AoCl7Nk1ILjbOHPlPoxbQ1OKG
         11TrIryPEVVi4/uSc83qMEmV7qjzk6Dk9Tiw72XTuQc0fuD53zesX+ySSE2FoKMIcMHs
         Aq0A==
In-Reply-To: <1424992610-28927-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Upstream commit 75cbe701a4251fcd8b846d52ae42f88c9a8e5e93
"vfs: Remove i_dquot field from inode".

While we do not actually support quotas, we take the opportunity to
(revertibly) remove all rudimentary quota-related code, as this allows to
save us some (tiny) amount of space per each inode.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---

The two commits which re-add/forward port the removed code can be pulled from:

    git://github.com/intelfx/linux reiser4-3.19-quotas-rudimentary

Viewable at:

    https://github.com/intelfx/linux/tree/reiser4-3.19-quotas-rudimentary

 fs/reiser4/as_ops.c                      |  1 -
 fs/reiser4/inode.h                       | 11 +++++++++++
 fs/reiser4/plugin/file_plugin_common.c   |  5 -----
 fs/reiser4/plugin/inode_ops.c            | 30 ------------------------------
 fs/reiser4/plugin/item/cde.c             |  8 ++------
 fs/reiser4/plugin/item/extent_file_ops.c | 13 +++----------
 fs/reiser4/plugin/item/extent_item_ops.c |  4 +---
 fs/reiser4/plugin/item/sde.c             |  8 ++------
 fs/reiser4/plugin/item/tail.c            | 29 ++++++++++-------------------
 fs/reiser4/vfs_ops.c                     |  1 -
 10 files changed, 29 insertions(+), 81 deletions(-)

diff --git a/fs/reiser4/as_ops.c b/fs/reiser4/as_ops.c
index 7345774..a4cd5020 100644
--- a/fs/reiser4/as_ops.c
+++ b/fs/reiser4/as_ops.c
@@ -41,7 +41,6 @@
 #include <linux/module.h>
 #include <linux/writeback.h>
 #include <linux/backing-dev.h>
-#include <linux/quotaops.h>
 #include <linux/security.h>
 #include <linux/migrate.h>
 
diff --git a/fs/reiser4/inode.h b/fs/reiser4/inode.h
index 95e1d9e..c6a6273 100644
--- a/fs/reiser4/inode.h
+++ b/fs/reiser4/inode.h
@@ -455,6 +455,17 @@ extern void inode_check_scale_nolock(struct inode *inode, __u64 old, __u64 new);
 })
 
 
+static inline void inode_add_blocks(struct inode *inode, __u64 blocks)
+{
+	inode_add_bytes(inode, blocks << inode->i_blkbits);
+}
+
+static inline void inode_sub_blocks(struct inode *inode, __u64 blocks)
+{
+	inode_sub_bytes(inode, blocks << inode->i_blkbits);
+}
+
+
 /* See comment before reiser4_readdir_common() for description. */
 static inline struct list_head *get_readdir_list(const struct inode *inode)
 {
diff --git a/fs/reiser4/plugin/file_plugin_common.c b/fs/reiser4/plugin/file_plugin_common.c
index f2eaf64..7030df4 100644
--- a/fs/reiser4/plugin/file_plugin_common.c
+++ b/fs/reiser4/plugin/file_plugin_common.c
@@ -9,8 +9,6 @@
 #include "object.h"
 #include "../safe_link.h"
 
-#include <linux/quotaops.h>
-
 static int insert_new_sd(struct inode *inode);
 static int update_sd(struct inode *inode);
 
@@ -945,9 +943,6 @@ common_object_delete_no_reserve(struct inode *inode/* object to remove */)
 	if (!reiser4_inode_get_flag(inode, REISER4_NO_SD)) {
 		reiser4_key sd_key;
 
-		dquot_free_inode(inode);
-		dquot_drop(inode);
-
 		build_sd_key(inode, &sd_key);
 		result =
 		    reiser4_cut_tree(reiser4_tree_by_inode(inode),
diff --git a/fs/reiser4/plugin/inode_ops.c b/fs/reiser4/plugin/inode_ops.c
index 9e9497b..e465c5e 100644
--- a/fs/reiser4/plugin/inode_ops.c
+++ b/fs/reiser4/plugin/inode_ops.c
@@ -10,7 +10,6 @@
 #include "../inode.h"
 #include "../safe_link.h"
 
-#include <linux/quotaops.h>
 #include <linux/namei.h>
 
 static int create_vfs_object(struct inode *parent, struct dentry *dentry,
@@ -462,15 +461,6 @@ int reiser4_setattr_common(struct dentry *dentry, struct iattr *attr)
 	 */
 	result = setattr_reserve(reiser4_tree_by_inode(inode));
 	if (!result) {
-		if (((attr->ia_valid & ATTR_UID) && !uid_eq(attr->ia_uid, inode->i_uid))
-		    || ((attr->ia_valid & ATTR_GID) && !gid_eq(attr->ia_gid, inode->i_gid))) {
-			result = dquot_transfer(inode, attr) ? -EDQUOT : 0;
-			if (result) {
-				context_set_commit_async(ctx);
-				reiser4_exit_context(ctx);
-				return result;
-			}
-		}
 		setattr_copy(inode, attr);
 		mark_inode_dirty(inode);
 		result = reiser4_update_sd(inode);
@@ -601,12 +591,6 @@ static int do_create_vfs_child(reiser4_object_create_data * data,/* parameters
 	/* So that on error iput will be called. */
 	*retobj = object;
 
-	if (dquot_alloc_inode(object)) {
-		dquot_drop(object);
-		object->i_flags |= S_NOQUOTA;
-		return RETERR(-EDQUOT);
-	}
-
 	memset(&entry, 0, sizeof entry);
 	entry.obj = object;
 
@@ -616,8 +600,6 @@ static int do_create_vfs_child(reiser4_object_create_data * data,/* parameters
 	if (result) {
 		warning("nikita-431", "Cannot install plugin %i on %llx",
 			data->id, (unsigned long long)get_inode_oid(object));
-		dquot_free_inode(object);
-		object->i_flags |= S_NOQUOTA;
 		return result;
 	}
 
@@ -625,8 +607,6 @@ static int do_create_vfs_child(reiser4_object_create_data * data,/* parameters
 	obj_plug = inode_file_plugin(object);
 
 	if (obj_plug->create_object == NULL) {
-		dquot_free_inode(object);
-		object->i_flags |= S_NOQUOTA;
 		return RETERR(-EPERM);
 	}
 
@@ -644,8 +624,6 @@ static int do_create_vfs_child(reiser4_object_create_data * data,/* parameters
 		warning("nikita-432", "Cannot inherit from %llx to %llx",
 			(unsigned long long)get_inode_oid(parent),
 			(unsigned long long)get_inode_oid(object));
-		dquot_free_inode(object);
-		object->i_flags |= S_NOQUOTA;
 		return result;
 	}
 
@@ -660,8 +638,6 @@ static int do_create_vfs_child(reiser4_object_create_data * data,/* parameters
 	/* obtain directory plugin (if any) for new object. */
 	obj_dir = inode_dir_plugin(object);
 	if (obj_dir != NULL && obj_dir->init == NULL) {
-		dquot_free_inode(object);
-		object->i_flags |= S_NOQUOTA;
 		return RETERR(-EPERM);
 	}
 
@@ -669,8 +645,6 @@ static int do_create_vfs_child(reiser4_object_create_data * data,/* parameters
 
 	reserve = estimate_create_vfs_object(parent, object);
 	if (reiser4_grab_space(reserve, BA_CAN_COMMIT)) {
-		dquot_free_inode(object);
-		object->i_flags |= S_NOQUOTA;
 		return RETERR(-ENOSPC);
 	}
 
@@ -700,8 +674,6 @@ static int do_create_vfs_child(reiser4_object_create_data * data,/* parameters
 			warning("nikita-2219",
 				"Failed to create sd for %llu",
 				(unsigned long long)get_inode_oid(object));
-		dquot_free_inode(object);
-		object->i_flags |= S_NOQUOTA;
 		return result;
 	}
 
@@ -737,8 +709,6 @@ static int do_create_vfs_child(reiser4_object_create_data * data,/* parameters
 	 */
 	reiser4_update_sd(object);
 	if (result != 0) {
-		dquot_free_inode(object);
-		object->i_flags |= S_NOQUOTA;
 		/* if everything was ok (result == 0), parent stat-data is
 		 * already updated above (update_parent_dir()) */
 		reiser4_update_sd(parent);
diff --git a/fs/reiser4/plugin/item/cde.c b/fs/reiser4/plugin/item/cde.c
index 6e9ca28..e9afd14 100644
--- a/fs/reiser4/plugin/item/cde.c
+++ b/fs/reiser4/plugin/item/cde.c
@@ -70,7 +70,6 @@
 
 #include <linux/fs.h>		/* for struct inode */
 #include <linux/dcache.h>	/* for struct dentry */
-#include <linux/quotaops.h>
 
 #if 0
 #define CHECKME(coord)						\
@@ -931,9 +930,7 @@ int add_entry_cde(struct inode *dir /* directory object */ ,
 	result = is_dot_key(&dir_entry->key);
 	data.length = estimate_cde(result ? coord : NULL, &data);
 
-	/* NOTE-NIKITA quota plugin? */
-	if (dquot_alloc_space_nodirty(dir, cde_bytes(result, &data)))
-		return RETERR(-EDQUOT);
+	inode_add_bytes(dir, cde_bytes(result, &data));
 
 	if (result)
 		result = insert_by_coord(coord, &data, &dir_entry->key, lh, 0);
@@ -982,8 +979,7 @@ int rem_entry_cde(struct inode *dir /* directory of item */ ,
 	result =
 	    kill_node_content(coord, &shadow, NULL, NULL, NULL, NULL, NULL, 0);
 	if (result == 0) {
-		/* NOTE-NIKITA quota plugin? */
-		dquot_free_space_nodirty(dir, length);
+		inode_sub_bytes(dir, length);
 	}
 	return result;
 }
diff --git a/fs/reiser4/plugin/item/extent_file_ops.c b/fs/reiser4/plugin/item/extent_file_ops.c
index 89828d5..7330ae1 100644
--- a/fs/reiser4/plugin/item/extent_file_ops.c
+++ b/fs/reiser4/plugin/item/extent_file_ops.c
@@ -5,7 +5,6 @@
 #include "../../page_cache.h"
 #include "../object.h"
 
-#include <linux/quotaops.h>
 #include <linux/swap.h>
 
 static inline reiser4_extent *ext_by_offset(const znode *node, int offset)
@@ -260,9 +259,7 @@ static int append_last_extent(uf_coord_t *uf_coord, const reiser4_key *key,
 
 	assert("", get_key_offset(key) == (loff_t)index_jnode(jnodes[0]) * PAGE_CACHE_SIZE);
 
-	result = dquot_alloc_block_nodirty(mapping_jnode(jnodes[0])->host,
-					   count);
-	BUG_ON(result != 0);
+	inode_add_blocks(mapping_jnode(jnodes[0])->host, count);
 
 	switch (state_of_extent(ext)) {
 	case UNALLOCATED_EXTENT:
@@ -408,9 +405,7 @@ static int insert_first_extent(uf_coord_t *uf_coord, const reiser4_key *key,
 	if (count == 0)
 		return 0;
 
-	result = dquot_alloc_block_nodirty(mapping_jnode(jnodes[0])->host,
-					   count);
-	BUG_ON(result != 0);
+	inode_add_blocks(mapping_jnode(jnodes[0])->host, count);
 
 	/*
 	 * prepare for tree modification: compose body of item and item data
@@ -623,9 +618,7 @@ static int overwrite_one_block(uf_coord_t *uf_coord, const reiser4_key *key,
 		break;
 
 	case HOLE_EXTENT:
-		result = dquot_alloc_block_nodirty(mapping_jnode(node)->host,
-						   1);
-		BUG_ON(result != 0);
+		inode_add_blocks(mapping_jnode(node)->host, 1);
 		result = plug_hole(uf_coord, key, &how);
 		if (result)
 			return result;
diff --git a/fs/reiser4/plugin/item/extent_item_ops.c b/fs/reiser4/plugin/item/extent_item_ops.c
index b7e1ec7..3047b12 100644
--- a/fs/reiser4/plugin/item/extent_item_ops.c
+++ b/fs/reiser4/plugin/item/extent_item_ops.c
@@ -6,8 +6,6 @@
 #include "../../page_cache.h"
 #include "../../carry.h"
 
-#include <linux/quotaops.h>
-
 /* item_plugin->b.max_key_inside */
 reiser4_key *max_key_inside_extent(const coord_t * coord, reiser4_key * key)
 {
@@ -468,7 +466,7 @@ kill_hook_extent(const coord_t * coord, pos_in_node_t from, pos_in_node_t count,
 			length = to_off - offset;
 		}
 
-		dquot_free_block_nodirty(inode, length);
+		inode_sub_blocks(inode, length);
 
 		if (state_of_extent(ext) == UNALLOCATED_EXTENT) {
 			/* some jnodes corresponding to this unallocated extent */
diff --git a/fs/reiser4/plugin/item/sde.c b/fs/reiser4/plugin/item/sde.c
index 5870f18..c15abe3 100644
--- a/fs/reiser4/plugin/item/sde.c
+++ b/fs/reiser4/plugin/item/sde.c
@@ -16,7 +16,6 @@
 
 #include <linux/fs.h>		/* for struct inode */
 #include <linux/dcache.h>	/* for struct dentry */
-#include <linux/quotaops.h>
 
 /* ->extract_key() method of simple directory item plugin. */
 int extract_key_de(const coord_t * coord /* coord of item */ ,
@@ -119,9 +118,7 @@ int add_entry_de(struct inode *dir /* directory of item */ ,
 	data.user = 0;
 	data.iplug = item_plugin_by_id(SIMPLE_DIR_ENTRY_ID);
 
-	/* NOTE-NIKITA quota plugin */
-	if (dquot_alloc_space_nodirty(dir, data.length))
-		return -EDQUOT;
+	inode_add_bytes(dir, data.length);
 
 	result = insert_by_coord(coord, &data, &entry->key, lh, 0 /*flags */ );
 	if (result != 0)
@@ -167,8 +164,7 @@ int rem_entry_de(struct inode *dir /* directory of item */ ,
 	result =
 	    kill_node_content(coord, &shadow, NULL, NULL, NULL, NULL, NULL, 0);
 	if (result == 0) {
-		/* NOTE-NIKITA quota plugin */
-		dquot_free_space_nodirty(dir, length);
+		inode_sub_bytes(dir, length);
 	}
 	return result;
 }
diff --git a/fs/reiser4/plugin/item/tail.c b/fs/reiser4/plugin/item/tail.c
index 7f4a101..4e33f46 100644
--- a/fs/reiser4/plugin/item/tail.c
+++ b/fs/reiser4/plugin/item/tail.c
@@ -6,7 +6,6 @@
 #include "../../carry.h"
 #include "../../vfs_ops.h"
 
-#include <linux/quotaops.h>
 #include <asm/uaccess.h>
 #include <linux/swap.h>
 #include <linux/writeback.h>
@@ -494,14 +493,12 @@ static ssize_t insert_first_tail(struct inode *inode, flow_t *flow,
 		set_key_offset(&flow->key, 0);
 		/*
 		 * holes in files built of tails are stored just like if there
-		 * were real data which are all zeros. Therefore we have to
-		 * allocate quota here as well
+		 * were real data which are all zeros.
 		 */
-		if (dquot_alloc_space_nodirty(inode, flow->length))
-			return RETERR(-EDQUOT);
+		inode_add_bytes(inode, flow->length);
 		result = reiser4_insert_flow(coord, lh, flow);
 		if (flow->length)
-			dquot_free_space_nodirty(inode, flow->length);
+			inode_sub_bytes(inode, flow->length);
 
 		uf_info = unix_file_inode_data(inode);
 
@@ -520,14 +517,12 @@ static ssize_t insert_first_tail(struct inode *inode, flow_t *flow,
 		return result;
 	}
 
-	/* check quota before appending data */
-	if (dquot_alloc_space_nodirty(inode, flow->length))
-		return RETERR(-EDQUOT);
+	inode_add_bytes(inode, flow->length);
 
 	to_write = flow->length;
 	result = reiser4_insert_flow(coord, lh, flow);
 	if (flow->length)
-		dquot_free_space_nodirty(inode, flow->length);
+		inode_sub_bytes(inode, flow->length);
 	return (to_write - flow->length) ? (to_write - flow->length) : result;
 }
 
@@ -553,25 +548,21 @@ static ssize_t append_tail(struct inode *inode,
 		set_key_offset(&flow->key, get_key_offset(&append_key));
 		/*
 		 * holes in files built of tails are stored just like if there
-		 * were real data which are all zeros. Therefore we have to
-		 * allocate quota here as well
+		 * were real data which are all zeros.
 		 */
-		if (dquot_alloc_space_nodirty(inode, flow->length))
-			return RETERR(-EDQUOT);
+		inode_add_bytes(inode, flow->length);
 		result = reiser4_insert_flow(coord, lh, flow);
 		if (flow->length)
-			dquot_free_space_nodirty(inode, flow->length);
+			inode_sub_bytes(inode, flow->length);
 		return result;
 	}
 
-	/* check quota before appending data */
-	if (dquot_alloc_space_nodirty(inode, flow->length))
-		return RETERR(-EDQUOT);
+	inode_add_bytes(inode, flow->length);
 
 	to_write = flow->length;
 	result = reiser4_insert_flow(coord, lh, flow);
 	if (flow->length)
-		dquot_free_space_nodirty(inode, flow->length);
+		inode_sub_bytes(inode, flow->length);
 	return (to_write - flow->length) ? (to_write - flow->length) : result;
 }
 
diff --git a/fs/reiser4/vfs_ops.c b/fs/reiser4/vfs_ops.c
index fee4def..65eb45e 100644
--- a/fs/reiser4/vfs_ops.c
+++ b/fs/reiser4/vfs_ops.c
@@ -46,7 +46,6 @@
 #include <linux/module.h>
 #include <linux/writeback.h>
 #include <linux/blkdev.h>
-#include <linux/quotaops.h>
 #include <linux/security.h>
 #include <linux/reboot.h>
 #include <linux/rcupdate.h>
-- 
2.3.1

