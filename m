From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 3/6] reiser4: rename quota methods
Date: Wed, 07 Jul 2010 02:21:14 +0200
Message-ID: <4C33C87A.4070605@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060804010306040008020202"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------060804010306040008020202
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------060804010306040008020202
Content-Type: text/plain;
 name="reiser4-rename-quota.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-rename-quota.patch"

Rename quota methods.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/plugin/file_plugin_common.c   |    4 ++--
 fs/reiser4/plugin/inode_ops.c            |   20 ++++++++++----------
 fs/reiser4/plugin/item/cde.c             |    4 ++--
 fs/reiser4/plugin/item/extent_file_ops.c |   12 ++++++------
 fs/reiser4/plugin/item/extent_item_ops.c |    2 +-
 fs/reiser4/plugin/item/sde.c             |    4 ++--
 fs/reiser4/plugin/item/tail.c            |   16 ++++++++--------
 7 files changed, 31 insertions(+), 31 deletions(-)

--- mmotm.orig/fs/reiser4/plugin/file_plugin_common.c
+++ mmotm/fs/reiser4/plugin/file_plugin_common.c
@@ -944,8 +944,8 @@ common_object_delete_no_reserve(struct i
 	if (!reiser4_inode_get_flag(inode, REISER4_NO_SD)) {
 		reiser4_key sd_key;
 
-		vfs_dq_free_inode(inode);
-		vfs_dq_drop(inode);
+		dquot_free_inode(inode);
+		dquot_drop(inode);
 
 		build_sd_key(inode, &sd_key);
 		result =
--- mmotm.orig/fs/reiser4/plugin/inode_ops.c
+++ mmotm/fs/reiser4/plugin/inode_ops.c
@@ -453,7 +453,7 @@ int reiser4_setattr_common(struct dentry
 		if ((attr->ia_valid & ATTR_UID && attr->ia_uid != inode->i_uid)
 		    || (attr->ia_valid & ATTR_GID
 			&& attr->ia_gid != inode->i_gid)) {
-			result = vfs_dq_transfer(inode, attr) ? -EDQUOT : 0;
+			result = dquot_transfer(inode, attr) ? -EDQUOT : 0;
 			if (result) {
 				context_set_commit_async(ctx);
 				reiser4_exit_context(ctx);
@@ -593,8 +593,8 @@ static int do_create_vfs_child(reiser4_o
 	/* So that on error iput will be called. */
 	*retobj = object;
 
-	if (vfs_dq_alloc_inode(object)) {
-		vfs_dq_drop(object);
+	if (dquot_alloc_inode(object)) {
+		dquot_drop(object);
 		object->i_flags |= S_NOQUOTA;
 		return RETERR(-EDQUOT);
 	}
@@ -608,7 +608,7 @@ static int do_create_vfs_child(reiser4_o
 	if (result) {
 		warning("nikita-431", "Cannot install plugin %i on %llx",
 			data->id, (unsigned long long)get_inode_oid(object));
-		vfs_dq_free_inode(object);
+		dquot_free_inode(object);
 		object->i_flags |= S_NOQUOTA;
 		return result;
 	}
@@ -617,7 +617,7 @@ static int do_create_vfs_child(reiser4_o
 	obj_plug = inode_file_plugin(object);
 
 	if (obj_plug->create_object == NULL) {
-		vfs_dq_free_inode(object);
+		dquot_free_inode(object);
 		object->i_flags |= S_NOQUOTA;
 		return RETERR(-EPERM);
 	}
@@ -636,7 +636,7 @@ static int do_create_vfs_child(reiser4_o
 		warning("nikita-432", "Cannot inherit from %llx to %llx",
 			(unsigned long long)get_inode_oid(parent),
 			(unsigned long long)get_inode_oid(object));
-		vfs_dq_free_inode(object);
+		dquot_free_inode(object);
 		object->i_flags |= S_NOQUOTA;
 		return result;
 	}
@@ -652,7 +652,7 @@ static int do_create_vfs_child(reiser4_o
 	/* obtain directory plugin (if any) for new object. */
 	obj_dir = inode_dir_plugin(object);
 	if (obj_dir != NULL && obj_dir->init == NULL) {
-		vfs_dq_free_inode(object);
+		dquot_free_inode(object);
 		object->i_flags |= S_NOQUOTA;
 		return RETERR(-EPERM);
 	}
@@ -661,7 +661,7 @@ static int do_create_vfs_child(reiser4_o
 
 	reserve = estimate_create_vfs_object(parent, object);
 	if (reiser4_grab_space(reserve, BA_CAN_COMMIT)) {
-		vfs_dq_free_inode(object);
+		dquot_free_inode(object);
 		object->i_flags |= S_NOQUOTA;
 		return RETERR(-ENOSPC);
 	}
@@ -692,7 +692,7 @@ static int do_create_vfs_child(reiser4_o
 			warning("nikita-2219",
 				"Failed to create sd for %llu",
 				(unsigned long long)get_inode_oid(object));
-		vfs_dq_free_inode(object);
+		dquot_free_inode(object);
 		object->i_flags |= S_NOQUOTA;
 		return result;
 	}
@@ -735,7 +735,7 @@ static int do_create_vfs_child(reiser4_o
 	 */
 	reiser4_update_sd(object);
 	if (result != 0) {
-		vfs_dq_free_inode(object);
+		dquot_free_inode(object);
 		object->i_flags |= S_NOQUOTA;
 		/* if everything was ok (result == 0), parent stat-data is
 		 * already updated above (update_parent_dir()) */
--- mmotm.orig/fs/reiser4/plugin/item/cde.c
+++ mmotm/fs/reiser4/plugin/item/cde.c
@@ -932,7 +932,7 @@ int add_entry_cde(struct inode *dir /* d
 	data.length = estimate_cde(result ? coord : NULL, &data);
 
 	/* NOTE-NIKITA quota plugin? */
-	if (vfs_dq_alloc_space_nodirty(dir, cde_bytes(result, &data)))
+	if (dquot_alloc_space_nodirty(dir, cde_bytes(result, &data)))
 		return RETERR(-EDQUOT);
 
 	if (result)
@@ -983,7 +983,7 @@ int rem_entry_cde(struct inode *dir /* d
 	    kill_node_content(coord, &shadow, NULL, NULL, NULL, NULL, NULL, 0);
 	if (result == 0) {
 		/* NOTE-NIKITA quota plugin? */
-		vfs_dq_free_space_nodirty(dir, length);
+		dquot_free_space_nodirty(dir, length);
 	}
 	return result;
 }
--- mmotm.orig/fs/reiser4/plugin/item/extent_file_ops.c
+++ mmotm/fs/reiser4/plugin/item/extent_file_ops.c
@@ -260,8 +260,8 @@ static int append_last_extent(uf_coord_t
 
 	assert("", get_key_offset(key) == (loff_t)index_jnode(jnodes[0]) * PAGE_CACHE_SIZE);
 
-	result = vfs_dq_alloc_block_nodirty(mapping_jnode(jnodes[0])->host,
-					    count);
+	result = dquot_alloc_block_nodirty(mapping_jnode(jnodes[0])->host,
+					   count);
 	BUG_ON(result != 0);
 
 	switch (state_of_extent(ext)) {
@@ -408,8 +408,8 @@ static int insert_first_extent(uf_coord_
 	if (count == 0)
 		return 0;
 
-	result = vfs_dq_alloc_block_nodirty(mapping_jnode(jnodes[0])->host,
-					    count);
+	result = dquot_alloc_block_nodirty(mapping_jnode(jnodes[0])->host,
+					   count);
 	BUG_ON(result != 0);
 
 	/*
@@ -623,8 +623,8 @@ static int overwrite_one_block(uf_coord_
 		break;
 
 	case HOLE_EXTENT:
-		result = vfs_dq_alloc_block_nodirty(mapping_jnode(node)->host,
-						    1);
+		result = dquot_alloc_block_nodirty(mapping_jnode(node)->host,
+						   1);
 		BUG_ON(result != 0);
 		result = plug_hole(uf_coord, key, &how);
 		if (result)
--- mmotm.orig/fs/reiser4/plugin/item/extent_item_ops.c
+++ mmotm/fs/reiser4/plugin/item/extent_item_ops.c
@@ -468,7 +468,7 @@ kill_hook_extent(const coord_t * coord, 
 			length = to_off - offset;
 		}
 
-		vfs_dq_free_block_nodirty(inode, length);
+		dquot_free_block_nodirty(inode, length);
 
 		if (state_of_extent(ext) == UNALLOCATED_EXTENT) {
 			/* some jnodes corresponding to this unallocated extent */
--- mmotm.orig/fs/reiser4/plugin/item/sde.c
+++ mmotm/fs/reiser4/plugin/item/sde.c
@@ -120,7 +120,7 @@ int add_entry_de(struct inode *dir /* di
 	data.iplug = item_plugin_by_id(SIMPLE_DIR_ENTRY_ID);
 
 	/* NOTE-NIKITA quota plugin */
-	if (vfs_dq_alloc_space_nodirty(dir, data.length))
+	if (dquot_alloc_space_nodirty(dir, data.length))
 		return -EDQUOT;
 
 	result = insert_by_coord(coord, &data, &entry->key, lh, 0 /*flags */ );
@@ -168,7 +168,7 @@ int rem_entry_de(struct inode *dir /* di
 	    kill_node_content(coord, &shadow, NULL, NULL, NULL, NULL, NULL, 0);
 	if (result == 0) {
 		/* NOTE-NIKITA quota plugin */
-		vfs_dq_free_space_nodirty(dir, length);
+		dquot_free_space_nodirty(dir, length);
 	}
 	return result;
 }
--- mmotm.orig/fs/reiser4/plugin/item/tail.c
+++ mmotm/fs/reiser4/plugin/item/tail.c
@@ -494,11 +494,11 @@ static ssize_t insert_first_tail(struct 
 		 * were real data which are all zeros. Therefore we have to
 		 * allocate quota here as well
 		 */
-		if (vfs_dq_alloc_space_nodirty(inode, flow->length))
+		if (dquot_alloc_space_nodirty(inode, flow->length))
 			return RETERR(-EDQUOT);
 		result = reiser4_insert_flow(coord, lh, flow);
 		if (flow->length)
-			vfs_dq_free_space_nodirty(inode, flow->length);
+			dquot_free_space_nodirty(inode, flow->length);
 
 		uf_info = unix_file_inode_data(inode);
 
@@ -518,13 +518,13 @@ static ssize_t insert_first_tail(struct 
 	}
 
 	/* check quota before appending data */
-	if (vfs_dq_alloc_space_nodirty(inode, flow->length))
+	if (dquot_alloc_space_nodirty(inode, flow->length))
 		return RETERR(-EDQUOT);
 
 	to_write = flow->length;
 	result = reiser4_insert_flow(coord, lh, flow);
 	if (flow->length)
-		vfs_dq_free_space_nodirty(inode, flow->length);
+		dquot_free_space_nodirty(inode, flow->length);
 	return (to_write - flow->length) ? (to_write - flow->length) : result;
 }
 
@@ -553,22 +553,22 @@ static ssize_t append_tail(struct inode 
 		 * were real data which are all zeros. Therefore we have to
 		 * allocate quota here as well
 		 */
-		if (vfs_dq_alloc_space_nodirty(inode, flow->length))
+		if (dquot_alloc_space_nodirty(inode, flow->length))
 			return RETERR(-EDQUOT);
 		result = reiser4_insert_flow(coord, lh, flow);
 		if (flow->length)
-			vfs_dq_free_space_nodirty(inode, flow->length);
+			dquot_free_space_nodirty(inode, flow->length);
 		return result;
 	}
 
 	/* check quota before appending data */
-	if (vfs_dq_alloc_space_nodirty(inode, flow->length))
+	if (dquot_alloc_space_nodirty(inode, flow->length))
 		return RETERR(-EDQUOT);
 
 	to_write = flow->length;
 	result = reiser4_insert_flow(coord, lh, flow);
 	if (flow->length)
-		vfs_dq_free_space_nodirty(inode, flow->length);
+		dquot_free_space_nodirty(inode, flow->length);
 	return (to_write - flow->length) ? (to_write - flow->length) : result;
 }
 

--------------060804010306040008020202--
