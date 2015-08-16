From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH 2/3] reiser4progs: make gcc happy
Date: Sun, 16 Aug 2015 15:23:45 +0200
Message-ID: <55D08EE1.4080209@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080204060206010003060701"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=Fy9KLz3oFI8XPXqTW5HBk09L+EBn2tcPOr3A/ePTwG0=;
        b=FOFHgUkFP7RXXowrS7eUBbmPBdxNdSaTWeuMu3tbgYpXLryXV/niIZ2i6uf6mPimmT
         T/HC8VzYoEO1cES8+IMlA5kfEPpaffrzACi7RgQibM5fy4QV4K+Fn82PSw4jNs4vfDll
         /kPY9kCalRh84QcG3fqOvIfnOkUjYEwjskZM0GX+VcPQDLEj+s7SHF3fbtA2XnPLEG2o
         5k2umPoailMsmLt4fADZOhiTSXrhH65Iqhn+Eu4Uu0aGK4aBB8GQCHjnMhSG1XQpXfAX
         LO2z45Qz5S/ZAkTcgaY9Oea39bBFOvkl+Yn06Vs6PLggdgM0lywwRLyHcFRpkyI4lHOm
         /A3Q==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080204060206010003060701
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------080204060206010003060701
Content-Type: text/x-patch;
 name="reiser4progs-make-gcc-happy.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4progs-make-gcc-happy.patch"

---
 demos/trunc.c                            |    2 +-
 include/reiser4/plugin.h                 |    2 +-
 libreiser4/pset.c                        |    7 ++++---
 libreiser4/tree.c                        |    8 ++++----
 librepair/master.c                       |   11 +++++++----
 librepair/pset.c                         |    4 ++--
 librepair/repair.c                       |    7 ++-----
 librepair/tree.c                         |    3 ---
 plugin/item/bbox40/bbox40.c              |    8 +++-----
 plugin/item/cde40/cde40.c                |    4 ----
 plugin/item/extent40/extent40.c          |   10 +++-------
 plugin/node/node40/node40_repair.c       |    4 +---
 plugin/object/ccreg40/ccreg40_repair.c   |   10 ++++++----
 plugin/object/obj40/obj40_repair.c       |    3 ---
 plugin/object/reg40/reg40_repair.c       |    4 ----
 plugin/sdext/sdext_crypto/sdext_crypto.c |    1 -
 plugin/sdext/sdext_crypto/sdext_crypto.h |    2 +-
 plugin/sdext/sdext_plug/sdext_plug.c     |    4 ++--
 18 files changed, 37 insertions(+), 57 deletions(-)

--- a/include/reiser4/plugin.h
+++ b/include/reiser4/plugin.h
@@ -372,7 +372,7 @@ enum reiser4_pset_id {
 	((reiser4_item_plug_t *)(obj)->info.pset.plug[PSET_DIRITEM])
 
 #define reiser4_pscrypto(obj) \
-	((rid_t)(obj)->info.pset.plug[PSET_CRYPTO])
+	((unsigned long)(obj)->info.pset.plug[PSET_CRYPTO])
 
 #define reiser4_pscompress(obj) \
 	((reiser4_plug_t *)(obj)->info.pset.plug[PSET_COMPRESS])
--- a/libreiser4/pset.c
+++ b/libreiser4/pset.c
@@ -149,8 +149,8 @@ void reiser4_pset_root(object_info_t *in
 		} else if (defprof.pid[pset_prof[i]].id.type == 
 			   PARAM_PLUG_TYPE) 
 		{
-			info->pset.plug[i] = 
-				(void *)defprof.pid[pset_prof[i]].id.id;
+			info->pset.plug[i] = (void *)
+			  (unsigned long)defprof.pid[pset_prof[i]].id.id;
 			
 		} else {
 			info->pset.plug[i] = 
@@ -340,7 +340,8 @@ errno_t reiser4_pset_backup(reiser4_tree
 	
 	for (i = 0; i < PSET_STORE_LAST; i++) {
 		if (tree->ent.param_mask & (1 << i))
-			aal_set_le32(pset, id[i], (rid_t)tree->ent.pset[i]);
+			aal_set_le32(pset, id[i],
+				     (unsigned long)tree->ent.pset[i]);
 		else
 			aal_set_le32(pset, id[i], tree->ent.pset[i]->id.id);
 	}
--- a/libreiser4/tree.c
+++ b/libreiser4/tree.c
@@ -1136,6 +1136,7 @@ void reiser4_tree_close(reiser4_tree_t *
 	aal_free(tree);
 }
 #ifndef ENABLE_MINIMAL
+#if 0
 static errno_t cb_flags_dup(reiser4_place_t *place, void *data) {
 	reiser4_item_dup_flags(place, *(uint16_t *)data);
 	return 0;
@@ -1272,6 +1273,7 @@ static errno_t reiser4_tree_alloc_extent
 
 	return 0;
 }
+#endif /* 0 */
 
 static errno_t cb_node_adjust(reiser4_tree_t *tree, reiser4_node_t *node) {
 	errno_t res;
@@ -1303,6 +1305,7 @@ static errno_t cb_node_adjust(reiser4_tr
 	return 0;
 }
 
+#if 0
 /* Runs through the node in @place and calls tree_adjust_node() for all
    children. */
 static errno_t cb_nodeptr_adjust(reiser4_tree_t *tree, reiser4_place_t *place) {
@@ -1316,6 +1319,7 @@ static errno_t cb_nodeptr_adjust(reiser4
 	/* Allocating unallocated extent item at @place. */
 	return reiser4_tree_alloc_extent(tree, place);
 }
+#endif /* 0 */
 #endif
 
 static errno_t cb_node_unload(reiser4_tree_t *tree, reiser4_node_t *node) {
@@ -2876,7 +2880,6 @@ int64_t reiser4_tree_modify(reiser4_tree
 			    estimate_func_t estimate_func,
 			    modify_func_t modify_func)
 {
-	bool_t mode;
 	errno_t res;
 	int32_t space;
 	int32_t write;
@@ -2899,9 +2902,6 @@ int64_t reiser4_tree_modify(reiser4_tree
 	if ((res = estimate_func(place, hint)))
 		return res;
 	
-	/* Needed space to be prepared in tree. */
-	mode = (place->pos.unit == MAX_UINT32);
-		
 	/* Preparing space in tree. */
 	space = reiser4_tree_expand(tree, place, &parent, hint->len, 
 				    hint->overhead, hint->shift_flags);
--- a/plugin/item/bbox40/bbox40.c
+++ b/plugin/item/bbox40/bbox40.c
@@ -62,12 +62,10 @@ static errno_t bbox40_insert_units(reise
 static errno_t bbox40_remove_units(reiser4_place_t *place,
 				   trans_hint_t *hint)
 {
-	slink_hint_t *link;
-	
+#if ENABLE_DEBUG
+	slink_hint_t *link = (slink_hint_t *)hint->specific;
+#endif
 	aal_assert("vpf-1574", hint != NULL);
-
-	link = (slink_hint_t *)hint->specific;
-	
 	aal_assert("vpf-1575", link->key.plug != NULL);
 	
 	hint->overhead = 0;
--- a/plugin/item/cde40/cde40.c
+++ b/plugin/item/cde40/cde40.c
@@ -798,12 +798,8 @@ static int64_t cde40_insert_units(reiser
 errno_t cde40_delete(reiser4_place_t *place, uint32_t pos,
 		     trans_hint_t *hint)
 {
-	uint32_t pol;
-
 	aal_assert("umka-3024", pos < cde40_units(place));
 
-	pol = cde40_key_pol(place);
-	
 	/* Shrinking cde item */
 	hint->bytes = hint->len = cde40_shrink(place, pos, hint->count);
 	
--- a/plugin/item/extent40/extent40.c
+++ b/plugin/item/extent40/extent40.c
@@ -104,14 +104,14 @@ uint32_t extent40_unit(reiser4_place_t *
 static errno_t extent40_remove_units(reiser4_place_t *place, trans_hint_t *hint) {
 	uint32_t len;
 	uint32_t pos;
-	uint32_t units;
 	void *src, *dst;
-
+#ifdef ENABLE_DEBUG
+	uint32_t units = extent40_units(place);
+#endif
 	aal_assert("vpf-941", place != NULL);
 	aal_assert("umka-2402", hint != NULL);
 
 	pos = place->pos.unit;
-	units = extent40_units(place);
 	
 	/* Check for unit pos. */
 	if (pos == MAX_UINT32)
@@ -923,14 +923,12 @@ static errno_t extent40_prep_write(reise
 		objcall(&hint->maxkey, set_offset, max_off);
 
 		if (place->pos.unit != MAX_UINT32) {
-			uint64_t width;
 
 			/* If new data could be attached to the end of existent,
 			   no new unit is needed. It is possible if we write data 
 			   over not allocated unit or hole over the hole. */
 			extent = extent40_body(place) + units - 1;
 			start = et40_get_start(extent);
-			width = et40_get_width(extent);
 			
 			if ((start == EXTENT_UNALLOC_UNIT && hint->specific) ||
 			    (start == EXTENT_HOLE_UNIT && !hint->specific))
@@ -1015,7 +1013,6 @@ static errno_t extent40_prep_write(reise
 
 /* Writes data to extent. */
 static int64_t extent40_write_units(reiser4_place_t *place, trans_hint_t *hint) {
-	aal_device_t *device;
 	aal_block_t *block;
 	extent40_t *extent;
 	reiser4_key_t key;
@@ -1053,7 +1050,6 @@ static int64_t extent40_write_units(reis
 	buff = hint->specific;
 	unit_pos = place->pos.unit;
 	units = extent40_units(place);
-	device = extent40_device(place);
 	blksize = place_blksize(place);
 
 	/* Get the offset range being handled: ins_off, max_off. */
--- a/plugin/node/node40/node40_repair.c
+++ b/plugin/node/node40/node40_repair.c
@@ -80,9 +80,7 @@ uint32_t node40_estimate_count_common(re
 				      uint32_t node_header_size)
 {
 	uint32_t offset, left, right;
-	uint32_t count, last, i;
-
-	count = nh_get_num_items(node);
+	uint32_t last, i;
 
 	left = node_header_size;
 	right = node->block->size - ih_size(node->keypol) - MIN_ITEM_LEN;
--- a/plugin/object/ccreg40/ccreg40_repair.c
+++ b/plugin/object/ccreg40/ccreg40_repair.c
@@ -122,16 +122,18 @@ static int64_t ccreg40_read_item(reiser4
 }
 
 static errno_t ccreg40_check_crc(ccreg40_hint_t *hint) {
-	uint32_t adler, disk, offset;
+	uint32_t calc, found, offset;
+	uint32_t *disk;
 
 	aal_assert("edward-2", hint->bytes > sizeof(uint32_t));
 
 	offset = hint->bytes - sizeof(uint32_t);
 
-	adler = aux_adler32(0, (char *)hint->data, offset);
-	disk = LE32_TO_CPU(*(uint32_t *)(hint->data + offset));
+	calc = aux_adler32(0, (char *)hint->data, offset);
+	disk = (uint32_t *)(hint->data + offset);
+	found = LE32_TO_CPU(*disk);
 
-	return adler == disk ? 0 : RE_FATAL;
+	return calc == found ? 0 : RE_FATAL;
 }
 
 /*
--- a/plugin/object/obj40/obj40_repair.c
+++ b/plugin/object/obj40/obj40_repair.c
@@ -617,12 +617,9 @@ lookup_t obj40_check_item(reiser4_object
 			  obj_func_t update_func,
 			  void *data)
 {
-	object_info_t *info;
 	trans_hint_t trans;
 	errno_t res;
 		
-	info = &obj->info;
-	
 	while (1) {
 		res = obj40_update_body(obj, update_func);
 
--- a/plugin/object/reg40/reg40_repair.c
+++ b/plugin/object/reg40/reg40_repair.c
@@ -55,8 +55,6 @@ static int reg40_conv_prepare(reiser4_ob
 			      uint64_t maxreal, 
 			      uint8_t mode)
 {
-	object_info_t *info;
-	
 	aal_assert("vpf-1348", reg != NULL);
 	aal_assert("vpf-1349", hint != NULL);
 	aal_assert("vpf-1353", reg->body.plug != NULL);
@@ -64,8 +62,6 @@ static int reg40_conv_prepare(reiser4_ob
 	if (plug_equal(reg->body.plug, reg->body_plug))
 		return 0;
 
-	info = &reg->info;
-
 	if (plug_equal(reg->body.plug, reiser4_psextent(reg))) {
 		/* Extent found, all previous items were tails, convert all 
 		   previous ones to extents. */
--- a/plugin/sdext/sdext_crypto/sdext_crypto.c
+++ b/plugin/sdext/sdext_crypto/sdext_crypto.c
@@ -90,7 +90,6 @@ reiser4_sdext_plug_t sdext_crypto_plug =
 	.info		= NULL,
 	.print     	= sdext_crypto_print,
 	.check_struct	= NULL,
-	.open	   	= NULL,
 	.length	   	= sdext_crypto_length
 
 };
--- a/plugin/sdext/sdext_crypto/sdext_crypto.h
+++ b/plugin/sdext/sdext_crypto/sdext_crypto.h
@@ -9,7 +9,7 @@
 #include <aal/libaal.h>
 #include <reiser4/plugin.h>
 
-#define reiser4_keysign_size(digestid) (4 << ((uint32_t)digestid))
+#define reiser4_keysign_size(digestid) (4 << ((unsigned long)digestid))
 
 typedef struct sdext_crypto {
 	/* secret key size. */ 
--- a/plugin/sdext/sdext_plug/sdext_plug.c
+++ b/plugin/sdext/sdext_plug/sdext_plug.c
@@ -113,7 +113,7 @@ static errno_t sdext_plug_open(stat_enti
 		/* For those where no plugin is found but the id is correct, 
 		   keep the id in plug set, remember it is a parameter. */
 		if (plugh->plug[mem] == NULL)
-			plugh->plug[mem] = (void *)id;
+		  plugh->plug[mem] = (void *)((unsigned long)id);
 		
 		plugh->plug_mask |= (1 << mem);
 	}
@@ -145,7 +145,7 @@ static errno_t sdext_plug_init(stat_enti
 		sdext_plug_set_member(ext, count, mem);
 
 		id = (tree->param_mask & (1 << mem)) ? 
-			((uint32_t)plugh->plug[mem]) : 
+			((unsigned long)plugh->plug[mem]) :
 			plugh->plug[mem]->id.id;
 		
 		sdext_plug_set_pid(ext, count, id);
--- a/demos/trunc.c
+++ b/demos/trunc.c
@@ -37,7 +37,7 @@ errno_t trunc_cmd(busy_ctx_t *ctx) {
 	/* Truncate the object. */
 	if (reiser4_object_truncate(object, ctx->count)) {
 		aal_error("Can't truncate object %s to %lld bytes.", 
-			  ctx->in.path, ctx->count);
+			  ctx->in.path, (long long)ctx->count);
 		goto error_close_object;
 	}
 	
--- a/librepair/master.c
+++ b/librepair/master.c
@@ -142,12 +142,15 @@ errno_t repair_master_check_struct(reise
 		
 		s = reiser4_master_get_uuid(fs->master);
 		if (aal_strncmp(s, ms->ms_uuid, sizeof(ms->ms_uuid))) {
+			uint64_t *x = (uint64_t *)s;
+			uint64_t *y = (uint64_t *)ms->ms_uuid;
 			fsck_mess("UUID (0x%llx%llx) found in the master super "
 				  "block does not match the one found in the "
-				  "backup (0x%llx%llx).%s", ((uint64_t *)s)[0],
-				  ((uint64_t *)s)[1], 
-				  ((uint64_t *)ms->ms_uuid)[0],
-				  ((uint64_t *)ms->ms_uuid)[1],
+				  "backup (0x%llx%llx).%s",
+				  x[0],
+				  x[1],
+				  y[0],
+				  y[1],
 				  mode != RM_CHECK ? " Fixed." : "");
 
 			if (mode == RM_CHECK)
--- a/librepair/pset.c
+++ b/librepair/pset.c
@@ -65,7 +65,7 @@ errno_t repair_pset_root_check(reiser4_f
 		id = aal_get_le32(pset, id[i]);
 		
 		root_id = fs->tree->ent.param_mask & (1 << i) ? 
-			(rid_t)root->info.pset.plug[i] : 
+			(unsigned long )root->info.pset.plug[i] :
 			root->info.pset.plug[i]->id.id;
 		
 		if (root_id == id)
@@ -79,7 +79,7 @@ errno_t repair_pset_root_check(reiser4_f
 			return RE_FATAL;
 		
 		if (fs->tree->ent.param_mask & (1 << i)) {
-			root->info.pset.plug[i] = (void *)id;
+			root->info.pset.plug[i] = (void *)(unsigned long)id;
 		} else {
 			root->info.pset.plug[i] = reiser4_factory_ifind(
 				defprof.pid[pset_prof[i]].id.type, id);
--- a/librepair/repair.c
+++ b/librepair/repair.c
@@ -532,9 +532,8 @@ static errno_t repair_sem_prepare(repair
 }
 
 static errno_t repair_sem_fini(repair_control_t *control, 
-			       repair_semantic_t *sem) {
-	uint64_t fs_len;
-
+			       repair_semantic_t *sem)
+{
 	control->oid = sem->stat.oid + 1;
 	control->files = sem->stat.reached_files;
 	
@@ -542,8 +541,6 @@ static errno_t repair_sem_fini(repair_co
 	if (control->repair->mode == RM_BUILD)
 		return 0;
 	
-	fs_len = reiser4_format_get_len(control->repair->fs->format);
-	
 	if (repair_bitmap_compare(control->bm_alloc, control->bm_used, 0)) {
 		fsck_mess("On-disk used block bitmap and really used block "
 			  "bitmap differ.%s", control->repair->mode == RM_BUILD 
--- a/librepair/tree.c
+++ b/librepair/tree.c
@@ -66,15 +66,12 @@ static errno_t repair_tree_maxreal_key(r
 	
 	if (reiser4_item_branch(place.plug)) {
 		blk_t blk;
-		uint32_t blksize;
 		
 		place.pos.unit = reiser4_item_units(&place) - 1;
 
 		if ((blk = reiser4_item_down_link(&place)) == INVAL_BLK)
 			return -EINVAL;
 			
-		blksize = reiser4_master_get_blksize(tree->fs->master);
-		
 		if (!(child = reiser4_node_open(tree, blk)))
 			return -EINVAL;
 		

--------------080204060206010003060701--
