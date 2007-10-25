From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 62/8] plugin/file_plugin_common.c cleanup
Date: Thu, 25 Oct 2007 22:02:33 +0200
Message-ID: <1193342553.15901.116.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-LQTL2OE5dkFKxwni9Bou"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-LQTL2OE5dkFKxwni9Bou
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 39 errors, 4 warnings, 1007 lines checked
patched:total: 0 errors, 2 warnings, 1009 lines checked
leftovers:

WARNING: line over 80 characters
#592: FILE: file_plugin_common.c:592:
+       if (data.length >
reiser4_tree_by_inode(inode)->nplug->max_item_size()) {

WARNING: line over 80 characters
#961: FILE: file_plugin_common.c:961:
+                               result =
safe_link_del(reiser4_tree_by_inode(inode),




--=-LQTL2OE5dkFKxwni9Bou
Content-Disposition: attachment; filename=file_plugin_common.c.patch
Content-Type: text/x-patch; name=file_plugin_common.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- file_plugin_common.c.orig	2007-10-25 21:51:26.000000000 +0200
+++ file_plugin_common.c	2007-10-25 21:59:35.000000000 +0200
@@ -17,7 +17,7 @@ static int update_sd(struct inode *inode
 /* this is common implementation of write_sd_by_inode method of file plugin
    either insert stat data or update it
  */
-int write_sd_by_inode_common(struct inode *inode /* object to save */ )
+int write_sd_by_inode_common(struct inode *inode/* object to save */)
 {
 	int result;
 
@@ -100,7 +100,7 @@ int set_plug_in_inode_common(struct inod
  */
 int adjust_to_parent_common(struct inode *object /* new object */ ,
 			    struct inode *parent /* parent directory */ ,
-			    struct inode *root /* root directory */ )
+			    struct inode *root/* root directory */)
 {
 	assert("nikita-2165", object != NULL);
 	if (parent == NULL)
@@ -123,7 +123,7 @@ int adjust_to_parent_common(struct inode
  */
 int adjust_to_parent_common_dir(struct inode *object /* new object */ ,
 				struct inode *parent /* parent directory */ ,
-				struct inode *root /* root directory */ )
+				struct inode *root/* root directory */)
 {
 	int result = 0;
 	pset_member memb;
@@ -146,21 +146,21 @@ int adjust_to_parent_common_dir(struct i
 
 int adjust_to_parent_cryptcompress(struct inode *object /* new object */ ,
 				   struct inode *parent /* parent directory */,
-				   struct inode *root /* root directory */)
+				   struct inode *root/* root directory */)
 {
- 	int result;
- 	result = adjust_to_parent_common(object, parent, root);
- 	if (result)
- 		return result;
- 	assert("edward-1416", parent != NULL);
-
- 	grab_plugin_pset(object, parent, PSET_CLUSTER);
- 	grab_plugin_pset(object, parent, PSET_CIPHER);
- 	grab_plugin_pset(object, parent, PSET_DIGEST);
- 	grab_plugin_pset(object, parent, PSET_COMPRESSION);
- 	grab_plugin_pset(object, parent, PSET_COMPRESSION_MODE);
+	int result;
+	result = adjust_to_parent_common(object, parent, root);
+	if (result)
+		return result;
+	assert("edward-1416", parent != NULL);
 
- 	return 0;
+	grab_plugin_pset(object, parent, PSET_CLUSTER);
+	grab_plugin_pset(object, parent, PSET_CIPHER);
+	grab_plugin_pset(object, parent, PSET_DIGEST);
+	grab_plugin_pset(object, parent, PSET_COMPRESSION);
+	grab_plugin_pset(object, parent, PSET_COMPRESSION_MODE);
+
+	return 0;
 }
 
 /* this is common implementation of create_object method of file plugin
@@ -301,7 +301,7 @@ int rem_link_common_dir(struct inode *ob
    compare objectids of keys in inode and coord */
 int owns_item_common(const struct inode *inode,	/* object to check
 						 * against */
-		     const coord_t * coord /* coord to check */ )
+		     const coord_t *coord/* coord to check */)
 {
 	reiser4_key item_key;
 	reiser4_key file_key;
@@ -317,8 +317,8 @@ int owns_item_common(const struct inode 
 /* this is common implementation of owns_item method of file plugin
    for typical directory
 */
-int owns_item_common_dir(const struct inode *inode,	/* object to check against */
-			 const coord_t * coord /* coord of item to check */ )
+int owns_item_common_dir(const struct inode *inode,/* object to check against */
+			 const coord_t *coord/* coord of item to check */)
 {
 	reiser4_key item_key;
 
@@ -335,7 +335,7 @@ int owns_item_common_dir(const struct in
 /* this is common implementation of can_add_link method of file plugin
    checks whether yet another hard links to this object can be added
 */
-int can_add_link_common(const struct inode *object /* object to check */ )
+int can_add_link_common(const struct inode *object/* object to check */)
 {
 	assert("nikita-732", object != NULL);
 
@@ -404,7 +404,7 @@ int safelink_common(struct inode *object
    can be used when object creation involves insertion of one item (usually stat
    data) into tree
 */
-reiser4_block_nr estimate_create_common(const struct inode * object)
+reiser4_block_nr estimate_create_common(const struct inode *object)
 {
 	return estimate_one_insert_item(reiser4_tree_by_inode(object));
 }
@@ -414,7 +414,7 @@ reiser4_block_nr estimate_create_common(
    can be used when directory creation involves insertion of two items (usually
    stat data and item containing "." and "..") into tree
 */
-reiser4_block_nr estimate_create_common_dir(const struct inode * object)
+reiser4_block_nr estimate_create_common_dir(const struct inode *object)
 {
 	return 2 * estimate_one_insert_item(reiser4_tree_by_inode(object));
 }
@@ -423,7 +423,7 @@ reiser4_block_nr estimate_create_common_
    can be used when stat data update does not do more than inserting a unit
    into a stat data item which is probably true for most cases
 */
-reiser4_block_nr estimate_update_common(const struct inode * inode)
+reiser4_block_nr estimate_update_common(const struct inode *inode)
 {
 	return estimate_one_insert_into_item(reiser4_tree_by_inode(inode));
 }
@@ -431,8 +431,8 @@ reiser4_block_nr estimate_update_common(
 /* this is common implementation of estimate.unlink method of file plugin
  */
 reiser4_block_nr
-estimate_unlink_common(const struct inode * object UNUSED_ARG,
-		       const struct inode * parent UNUSED_ARG)
+estimate_unlink_common(const struct inode *object UNUSED_ARG,
+		       const struct inode *parent UNUSED_ARG)
 {
 	return 0;
 }
@@ -441,8 +441,8 @@ estimate_unlink_common(const struct inod
    typical directory
 */
 reiser4_block_nr
-estimate_unlink_common_dir(const struct inode * object,
-			   const struct inode * parent)
+estimate_unlink_common_dir(const struct inode *object,
+			   const struct inode *parent)
 {
 	dir_plugin *dplug;
 
@@ -503,7 +503,7 @@ void wire_done_common(reiser4_object_on_
 /* helper function to print errors */
 static void key_warning(const reiser4_key * key /* key to print */ ,
 			const struct inode *inode,
-			int code /* error code to print */ )
+			int code/* error code to print */)
 {
 	assert("nikita-716", key != NULL);
 
@@ -518,7 +518,7 @@ static void key_warning(const reiser4_ke
 #if REISER4_DEBUG
 static void
 check_inode_seal(const struct inode *inode,
-		 const coord_t * coord, const reiser4_key * key)
+		 const coord_t *coord, const reiser4_key * key)
 {
 	reiser4_key unit_key;
 
@@ -528,7 +528,7 @@ check_inode_seal(const struct inode *ino
 	assert("nikita-2753", get_inode_oid(inode) == get_key_objectid(key));
 }
 
-static void check_sd_coord(coord_t * coord, const reiser4_key * key)
+static void check_sd_coord(coord_t *coord, const reiser4_key * key)
 {
 	reiser4_key ukey;
 
@@ -556,7 +556,7 @@ static void check_sd_coord(coord_t * coo
 
 /* insert new stat-data into tree. Called with inode state
     locked. Return inode state locked. */
-static int insert_new_sd(struct inode *inode /* inode to create sd for */ )
+static int insert_new_sd(struct inode *inode/* inode to create sd for */)
 {
 	int result;
 	reiser4_key key;
@@ -589,13 +589,14 @@ static int insert_new_sd(struct inode *i
 /* could be optimized for case where there is only one node format in
  * use in the filesystem, probably there are lots of such
  * places we could optimize for only one node layout.... -Hans */
-	if (data.length > reiser4_tree_by_inode(inode)->nplug->max_item_size()){
+	if (data.length > reiser4_tree_by_inode(inode)->nplug->max_item_size()) {
 		/* This is silly check, but we don't know actual node where
 		   insertion will go into. */
 		return RETERR(-ENAMETOOLONG);
 	}
 	oid = oid_allocate(inode->i_sb);
-/* NIKITA-FIXME-HANS: what is your opinion on whether this error check should be encapsulated into oid_allocate? */
+/* NIKITA-FIXME-HANS: what is your opinion on whether this error check should be
+ * encapsulated into oid_allocate? */
 	if (oid == ABSOLUTE_MAX_OID)
 		return RETERR(-EOVERFLOW);
 
@@ -642,7 +643,8 @@ static int insert_new_sd(struct inode *i
 			if (result == 0) {
 				/* object has stat-data now */
 				reiser4_inode_clr_flag(inode, REISER4_NO_SD);
-				reiser4_inode_set_flag(inode, REISER4_SDLEN_KNOWN);
+				reiser4_inode_set_flag(inode,
+						       REISER4_SDLEN_KNOWN);
 				/* initialise stat-data seal */
 				reiser4_seal_init(&ref->sd_seal, &coord, &key);
 				ref->sd_coord = coord;
@@ -670,7 +672,7 @@ static int insert_new_sd(struct inode *i
 /* find sd of inode in a tree, deal with errors */
 int lookup_sd(struct inode *inode /* inode to look sd for */ ,
 	      znode_lock_mode lock_mode /* lock mode */ ,
-	      coord_t * coord /* resulting coord */ ,
+	      coord_t *coord /* resulting coord */ ,
 	      lock_handle * lh /* resulting lock handle */ ,
 	      const reiser4_key * key /* resulting key */ ,
 	      int silent)
@@ -709,7 +711,7 @@ int lookup_sd(struct inode *inode /* ino
 
 static int
 locate_inode_sd(struct inode *inode,
-		reiser4_key * key, coord_t * coord, lock_handle * lh)
+		reiser4_key * key, coord_t *coord, lock_handle * lh)
 {
 	reiser4_inode *state;
 	seal_t seal;
@@ -757,8 +759,8 @@ static int all_but_offset_key_eq(const r
 #include "../tree_walk.h"
 
 /* make some checks before and after stat-data resize operation */
-static int check_sd_resize(struct inode * inode, coord_t * coord,
-			   int length, int progress /* 1 means after resize */)
+static int check_sd_resize(struct inode *inode, coord_t *coord,
+			   int length, int progress/* 1 means after resize */)
 {
 	int ret = 0;
 	lock_handle left_lock;
@@ -804,7 +806,7 @@ static int check_sd_resize(struct inode 
 
 /* update stat-data at @coord */
 static int
-update_sd_at(struct inode *inode, coord_t * coord, reiser4_key * key,
+update_sd_at(struct inode *inode, coord_t *coord, reiser4_key * key,
 	     lock_handle * lh)
 {
 	int result;
@@ -908,7 +910,7 @@ update_sd_at(struct inode *inode, coord_
 
 /* Update existing stat-data in a tree. Called with inode state locked. Return
    inode state locked. */
-static int update_sd(struct inode *inode /* inode to update sd for */ )
+static int update_sd(struct inode *inode/* inode to update sd for */)
 {
 	int result;
 	reiser4_key key;
@@ -934,7 +936,7 @@ static int update_sd(struct inode *inode
    Remove object stat data. Space for that must be reserved by caller before
 */
 static int
-common_object_delete_no_reserve(struct inode *inode /* object to remove */ )
+common_object_delete_no_reserve(struct inode *inode/* object to remove */)
 {
 	int result;
 

--=-LQTL2OE5dkFKxwni9Bou--

