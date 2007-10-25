From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 60/8] plugin/dir_plugin_common.c cleanup
Date: Thu, 25 Oct 2007 21:14:53 +0200
Message-ID: <1193339693.15901.108.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-Hs6KnuuYiKGkxjVbwKsF"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-Hs6KnuuYiKGkxjVbwKsF
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 20 errors, 5 warnings, 872 lines checked
patched:total: 3 errors, 0 warnings, 873 lines checked
leftover:

ERROR: need consistent spacing around '*' (ctx:WxB)
#11: FILE: dir_plugin_common.c:11:
+              lock_handle * , znode_lock_mode, reiser4_dir_entry_desc
*);
                                                                       ^

ERROR: need consistent spacing around '+' (ctx:WxV)
#167: FILE: dir_plugin_common.c:167:
+                                               fsdata->dec.pos + 1,
+1);
                                                                     ^

ERROR: Invalid UTF-8
#358: FILE: dir_plugin_common.c:358:
+                  "values of B will give rise to dom!\n"




--=-Hs6KnuuYiKGkxjVbwKsF
Content-Disposition: attachment; filename=dir_plugin_common.c.patch
Content-Type: text/x-patch; name=dir_plugin_common.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- dir_plugin_common.c.orig	2007-10-25 21:03:39.000000000 +0200
+++ dir_plugin_common.c	2007-10-25 21:11:10.000000000 +0200
@@ -8,8 +8,9 @@
 #include "../inode.h"
 
 int reiser4_find_entry(struct inode *dir, struct dentry *name,
-	       lock_handle *, znode_lock_mode, reiser4_dir_entry_desc *);
-int reiser4_lookup_name(struct inode *parent, struct dentry *dentry, reiser4_key * key);
+	       lock_handle * , znode_lock_mode, reiser4_dir_entry_desc *);
+int reiser4_lookup_name(struct inode *parent, struct dentry *dentry,
+			reiser4_key * key);
 void check_light_weight(struct inode *inode, struct inode *parent);
 
 /* this is common implementation of get_parent method of dir plugin
@@ -70,9 +71,9 @@ struct dentry *get_parent_common(struct 
 /* this is common implementation of is_name_acceptable method of dir
    plugin
  */
-int is_name_acceptable_common(const struct inode *inode,	/* directory to check */
-			      const char *name UNUSED_ARG,	/* name to check */
-			      int len /* @name's length */ )
+int is_name_acceptable_common(const struct inode *inode, /* directory to check*/
+			      const char *name UNUSED_ARG, /* name to check */
+			      int len/* @name's length */)
 {
 	assert("nikita-733", inode != NULL);
 	assert("nikita-734", name != NULL);
@@ -91,7 +92,7 @@ int is_name_acceptable_common(const stru
    see reiser4_readdir_common for more details
 */
 int build_readdir_key_common(struct file *dir /* directory being read */ ,
-			     reiser4_key * result /* where to store key */ )
+			     reiser4_key * result/* where to store key */)
 {
 	reiser4_file_fsdata *fdata;
 	struct inode *inode;
@@ -188,7 +189,7 @@ int reiser4_add_entry_common(struct inod
  */
 static int
 rem_entry(struct inode *dir, struct dentry *dentry,
-	  reiser4_dir_entry_desc * entry, coord_t * coord, lock_handle * lh)
+	  reiser4_dir_entry_desc * entry, coord_t *coord, lock_handle * lh)
 {
 	item_plugin *iplug;
 	struct inode *child;
@@ -226,7 +227,7 @@ rem_entry(struct inode *dir, struct dent
  */
 int reiser4_rem_entry_common(struct inode *dir,
 			     struct dentry *dentry,
-			     reiser4_dir_entry_desc *entry)
+			     reiser4_dir_entry_desc * entry)
 {
 	int result;
 	coord_t *coord;
@@ -323,7 +324,7 @@ int reiser4_dir_init_common(struct inode
 /* this is common implementation of done method of dir plugin
    remove "." entry
 */
-int reiser4_dir_done_common(struct inode *object /* object being deleted */ )
+int reiser4_dir_done_common(struct inode *object/* object being deleted */)
 {
 	int result;
 	reiser4_block_nr reserve;
@@ -339,8 +340,8 @@ int reiser4_dir_done_common(struct inode
 	   reiser4_cut_tree(). */
 	memset(&entry, 0, sizeof entry);
 
-	/* FIXME: this done method is called from reiser4_delete_dir_common which
-	 * reserved space already */
+	/* FIXME: this done method is called from reiser4_delete_dir_common
+	 * which reserved space already */
 	reserve = inode_dir_plugin(object)->estimate.rem_entry(object);
 	if (reiser4_grab_space(reserve, BA_CAN_COMMIT | BA_RESERVED))
 		return RETERR(-ENOSPC);
@@ -423,7 +424,7 @@ int reiser4_detach_common(struct inode *
    estimation of adding entry which supposes that entry is inserting a
    unit into item
 */
-reiser4_block_nr estimate_add_entry_common(const struct inode * inode)
+reiser4_block_nr estimate_add_entry_common(const struct inode *inode)
 {
 	return estimate_one_insert_into_item(reiser4_tree_by_inode(inode));
 }
@@ -431,7 +432,7 @@ reiser4_block_nr estimate_add_entry_comm
 /* this is common implementation of estimate.rem_entry method of dir
    plugin
 */
-reiser4_block_nr estimate_rem_entry_common(const struct inode * inode)
+reiser4_block_nr estimate_rem_entry_common(const struct inode *inode)
 {
 	return estimate_one_item_removal(reiser4_tree_by_inode(inode));
 }
@@ -440,8 +441,8 @@ reiser4_block_nr estimate_rem_entry_comm
    plugin
 */
 reiser4_block_nr
-dir_estimate_unlink_common(const struct inode * parent,
-			   const struct inode * object)
+dir_estimate_unlink_common(const struct inode *parent,
+			   const struct inode *object)
 {
 	reiser4_block_nr res;
 
@@ -471,10 +472,10 @@ void check_light_weight(struct inode *in
 
 /* looks for name specified in @dentry in directory @parent and if name is
    found - key of object found entry points to is stored in @entry->key */
-int reiser4_lookup_name(struct inode *parent,	/* inode of directory to lookup for
-					 * name in */
+int reiser4_lookup_name(struct inode *parent,	/* inode of directory to lookup
+					 * for name in */
 		struct dentry *dentry,	/* name to look for */
-		reiser4_key * key /* place to store key */ )
+		reiser4_key * key/* place to store key */)
 {
 	int result;
 	coord_t *coord;
@@ -542,9 +543,9 @@ estimate_init(struct inode *parent, stru
 }
 
 /* helper function for reiser4_dir_init_common(). Create "." and ".." */
-static int create_dot_dotdot(struct inode *object /* object to create dot and
-						   * dotdot for */ ,
-			     struct inode *parent /* parent of @object */)
+static int create_dot_dotdot(struct inode *object/* object to create dot and
+						  * dotdot for */ ,
+			     struct inode *parent/* parent of @object */)
 {
 	int result;
 	struct dentry dots_entry;
@@ -617,7 +618,7 @@ static int create_dot_dotdot(struct inod
  * @name.
  */
 static int
-check_item(const struct inode *dir, const coord_t * coord, const char *name)
+check_item(const struct inode *dir, const coord_t *coord, const char *name)
 {
 	item_plugin *iplug;
 	char buf[DE_NAME_BUF_LEN];
@@ -646,7 +647,7 @@ check_item(const struct inode *dir, cons
 }
 
 static int
-check_entry(const struct inode *dir, coord_t * coord, const struct qstr *name)
+check_entry(const struct inode *dir, coord_t *coord, const struct qstr *name)
 {
 	return WITH_COORD(coord, check_item(dir, coord, name->name));
 }
@@ -683,9 +684,9 @@ struct entry_actor_args {
 /* Function called by reiser4_find_entry() to look for given name
    in the directory. */
 static int entry_actor(reiser4_tree * tree UNUSED_ARG /* tree being scanned */ ,
-		       coord_t * coord /* current coord */ ,
+		       coord_t *coord /* current coord */ ,
 		       lock_handle * lh /* current lock handle */ ,
-		       void *entry_actor_arg /* argument to scan */ )
+		       void *entry_actor_arg/* argument to scan */)
 {
 	reiser4_key unit_key;
 	struct entry_actor_args *args;
@@ -801,7 +802,7 @@ int reiser4_find_entry(struct inode *dir
 	 */
 	result = reiser4_object_lookup(dir, &entry->key, coord, lh, mode,
 				       FIND_EXACT, LEAF_LEVEL, LEAF_LEVEL,
-				       flags, NULL /*ra_info */ );
+				       flags, NULL/*ra_info */);
 	if (result == CBK_COORD_FOUND) {
 		struct entry_actor_args arg;
 

--=-Hs6KnuuYiKGkxjVbwKsF--

