From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 64/8] inode_ops_rename.c cleanup
Date: Fri, 26 Oct 2007 13:38:09 +0200
Message-ID: <1193398689.4615.7.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-eIteHjtydCX8KSRDakJP"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-eIteHjtydCX8KSRDakJP
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 12 errors, 12 warnings, 914 lines checked
patched:total: 0 errors, 1 warnings, 921 lines checked
leftover:

WARNING: line over 80 characters
#130: FILE: inode_ops_rename.c:130:
+
&entry));




--=-eIteHjtydCX8KSRDakJP
Content-Disposition: attachment; filename=inode_ops_rename.c.patch
Content-Type: text/x-patch; name=inode_ops_rename.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- inode_ops_rename.c.orig	2007-10-26 13:37:06.000000000 +0200
+++ inode_ops_rename.c	2007-10-26 13:34:38.000000000 +0200
@@ -13,11 +13,11 @@ static int replace_name(struct inode *to
 						 * to be re-targeted at */
 			struct inode *from_dir,	/* directory where @from_coord
 						 * lives */
-			struct inode *from_inode,	/* inode @from_coord
-							 * originally point to */
-			coord_t * from_coord,	/* where directory entry is in
+			struct inode *from_inode, /* inode @from_coord
+						   * originally point to */
+			coord_t *from_coord,	/* where directory entry is in
 						 * the tree */
-			lock_handle * from_lh /* lock handle on @from_coord */ )
+			lock_handle * from_lh/* lock handle on @from_coord */)
 {
 	item_plugin *from_item;
 	int result;
@@ -30,8 +30,7 @@ static int replace_name(struct inode *to
 		return result;
 	from_item = item_plugin_by_coord(from_coord);
 	if (plugin_of_group(item_plugin_by_coord(from_coord),
-			    DIR_ENTRY_ITEM_TYPE))
-	{
+			    DIR_ENTRY_ITEM_TYPE)) {
 		reiser4_key to_key;
 
 		build_sd_key(to_inode, &to_key);
@@ -97,9 +96,10 @@ static int add_name(struct inode *inode,
 						 * re-targeted at */
 		    struct inode *dir,	/* directory where @coord lives */
 		    struct dentry *name,	/* new name */
-		    coord_t * coord,	/* where directory entry is in the tree */
+		    coord_t *coord,	/* where directory entry is in the tree
+					 */
 		    lock_handle * lh,	/* lock handle on @coord */
-		    int is_dir /* true, if @inode is directory */ )
+		    int is_dir/* true, if @inode is directory */)
 {
 	int result;
 	reiser4_dir_entry_desc entry;
@@ -142,14 +142,16 @@ static int add_name(struct inode *inode,
 	return result;
 }
 
-static reiser4_block_nr estimate_rename(struct inode *old_dir,	/* directory where @old is located */
-					struct dentry *old_name,	/* old name */
-					struct inode *new_dir,	/* directory where @new is located */
-					struct dentry *new_name /* new name */ )
+static reiser4_block_nr estimate_rename(struct inode *old_dir,
+					/* directory where @old is located */
+					struct dentry *old_name,/* old name */
+					struct inode *new_dir,
+					/* directory where @new is located */
+					struct dentry *new_name/* new name */)
 {
 	reiser4_block_nr res1, res2;
-	dir_plugin *p_parent_old, *p_parent_new;
-	file_plugin *p_child_old, *p_child_new;
+	dir_plugin * p_parent_old, *p_parent_new;
+	file_plugin * p_child_old, *p_child_new;
 
 	assert("vpf-311", old_dir != NULL);
 	assert("vpf-312", new_dir != NULL);
@@ -169,7 +171,8 @@ static reiser4_block_nr estimate_rename(
 
 	/* replace_name */
 	{
-		/* reiser4_add_nlink(p_child_old) and reiser4_del_nlink(p_child_old) */
+		/* reiser4_add_nlink(p_child_old) and
+		 * reiser4_del_nlink(p_child_old) */
 		res1 += 2 * p_child_old->estimate.update(old_name->d_inode);
 		/* update key */
 		res1 += 1;
@@ -180,7 +183,8 @@ static reiser4_block_nr estimate_rename(
 
 	/* else add_name */
 	{
-		/* reiser4_add_nlink(p_parent_new) and reiser4_del_nlink(p_parent_new) */
+		/* reiser4_add_nlink(p_parent_new) and
+		 * reiser4_del_nlink(p_parent_new) */
 		res2 +=
 		    2 * inode_file_plugin(new_dir)->estimate.update(new_dir);
 		/* reiser4_add_nlink(p_parent_old) */
@@ -227,11 +231,14 @@ static reiser4_block_nr estimate_rename(
 	return res1;
 }
 
-static int hashed_rename_estimate_and_grab(struct inode *old_dir,	/* directory where @old is located */
-					   struct dentry *old_name,	/* old name */
-					   struct inode *new_dir,	/* directory where @new is located */
+static int hashed_rename_estimate_and_grab(struct inode *old_dir,
+					/* directory where @old is located */
+					   struct dentry *old_name,
+					/* old name */
+					   struct inode *new_dir,
+					/* directory where @new is located */
 					   struct dentry *new_name
-					   /* new name */ )
+					/* new name */)
 {
 	reiser4_block_nr reserve;
 
@@ -271,7 +278,7 @@ static int can_rename(struct inode *old_
 	return 0;
 }
 
-int reiser4_find_entry(struct inode *, struct dentry *, lock_handle *,
+int reiser4_find_entry(struct inode *, struct dentry *, lock_handle * ,
 	       znode_lock_mode, reiser4_dir_entry_desc *);
 int reiser4_update_dir(struct inode *);
 
@@ -291,7 +298,7 @@ int reiser4_rename_common(struct inode *
 			  struct dentry *old_name /* old name */ ,
 			  struct inode *new_dir /* directory where @new
 						 * is located */ ,
-			  struct dentry *new_name /* new name */ )
+			  struct dentry *new_name/* new name */)
 {
 	/* From `The Open Group Base Specifications Issue 6'
 
@@ -384,7 +391,7 @@ int reiser4_rename_common(struct inode *
 	file_plugin *fplug;
 
 	reiser4_dir_entry_desc *old_entry, *new_entry, *dotdot_entry;
-	lock_handle *new_lh, *dotdot_lh;
+	lock_handle * new_lh, *dotdot_lh;
 	struct dentry *dotdot_name;
 	struct reiser4_dentry_fsdata *dataonstack;
 
@@ -619,7 +626,7 @@ int reiser4_rename_common(struct inode *
 			  struct dentry *old_name /* old name */ ,
 			  struct inode *new_dir /* directory where @new
 						 * is located */ ,
-			  struct dentry *new_name /* new name */ )
+			  struct dentry *new_name/* new name */)
 {
 	/* From `The Open Group Base Specifications Issue 6'
 
@@ -906,7 +913,7 @@ int reiser4_rename_common(struct inode *
 				result = safe_link_add(new_inode, SAFE_UNLINK);
 		}
 	}
-      exit:
+exit:
 	context_set_commit_async(ctx);
 	reiser4_exit_context(ctx);
 	return result;

--=-eIteHjtydCX8KSRDakJP--

