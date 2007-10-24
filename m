From: Dushan Tcholich <dusanc@gmail.com>
Subject: [28/8] inode.c cleanup
Date: Thu, 25 Oct 2007 00:31:01 +0200
Message-ID: <1193265061.24225.34.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-Z+VXdnD2BweUgjU/xYXS"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-Z+VXdnD2BweUgjU/xYXS
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 20 errors, 7 warnings, 709 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.

Bye

Dushan

--=-Z+VXdnD2BweUgjU/xYXS
Content-Disposition: attachment; filename=inode.c.patch
Content-Type: text/x-patch; name=inode.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- inode.c.orig	2007-10-25 00:23:41.000000000 +0200
+++ inode.c	2007-10-25 00:29:14.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 /* Inode specific operations. */
 
@@ -23,7 +24,7 @@
 
 /* return reiser4 internal tree which inode belongs to */
 /* Audited by: green(2002.06.17) */
-reiser4_tree *reiser4_tree_by_inode(const struct inode *inode /* inode queried */ )
+reiser4_tree *reiser4_tree_by_inode(const struct inode *inode/* inode queried*/)
 {
 	assert("nikita-256", inode != NULL);
 	assert("nikita-257", inode->i_sb != NULL);
@@ -78,7 +79,7 @@ ino_t oid_to_uino(oid_t oid)
 	   is impossible. Work-around is to somehow hash oid into user visible
 	   inode number.
 	 */
-	oid_t max_ino = (ino_t) ~ 0;
+	oid_t max_ino = (ino_t) ~0;
 
 	if (REISER4_INO_IS_OID || (oid <= max_ino))
 		return oid;
@@ -92,7 +93,7 @@ ino_t oid_to_uino(oid_t oid)
 }
 
 /* check that "inode" is on reiser4 file-system */
-int is_reiser4_inode(const struct inode *inode /* inode queried */ )
+int is_reiser4_inode(const struct inode *inode/* inode queried */)
 {
 	return inode != NULL && is_reiser4_super(inode->i_sb);
 }
@@ -100,7 +101,7 @@ int is_reiser4_inode(const struct inode 
 /* Maximal length of a name that can be stored in directory @inode.
 
    This is used in check during file creation and lookup. */
-int reiser4_max_filename_len(const struct inode *inode /* inode queried */ )
+int reiser4_max_filename_len(const struct inode *inode/* inode queried */)
 {
 	assert("nikita-287", is_reiser4_inode(inode));
 	assert("nikita-1710", inode_dir_item_plugin(inode));
@@ -112,7 +113,7 @@ int reiser4_max_filename_len(const struc
 
 #if REISER4_USE_COLLISION_LIMIT
 /* Maximal number of hash collisions for this directory. */
-int max_hash_collisions(const struct inode *dir /* inode queried */ )
+int max_hash_collisions(const struct inode *dir/* inode queried */)
 {
 	assert("nikita-1711", dir != NULL);
 	return reiser4_inode_data(dir)->plugin.max_collisions;
@@ -152,8 +153,8 @@ int setup_inode_ops(struct inode *inode 
 			inode->i_blocks = 0;
 			assert("vs-42", fplug->h.id == SPECIAL_FILE_PLUGIN_ID);
 			inode->i_op = &file_plugins[fplug->h.id].inode_ops;
-			/* initialize inode->i_fop and inode->i_rdev for block and char
-			   devices */
+			/* initialize inode->i_fop and inode->i_rdev for block
+			   and char devices */
 			init_special_inode(inode, inode->i_mode, rdev);
 			/* all address space operations are null */
 			inode->i_mapping->a_ops =
@@ -197,7 +198,7 @@ int setup_inode_ops(struct inode *inode 
 /* Initialize inode from disk data. Called with inode locked.
    Return inode locked. */
 static int init_inode(struct inode *inode /* inode to intialise */ ,
-		      coord_t * coord /* coord of stat data */ )
+		      coord_t *coord/* coord of stat data */)
 {
 	int result;
 	item_plugin *iplug;
@@ -299,8 +300,8 @@ static int read_inode(struct inode *inod
 
 /* initialise new reiser4 inode being inserted into hash table. */
 static int init_locked_inode(struct inode *inode /* new inode */ ,
-			     void *opaque	/* key of stat data passed to the
-						 * iget5_locked as cookie */ )
+			     void *opaque	/* key of stat data passed to
+						* the iget5_locked as cookie */)
 {
 	reiser4_key *key;
 
@@ -312,7 +313,8 @@ static int init_locked_inode(struct inod
 	return 0;
 }
 
-/* reiser4_inode_find_actor() - "find actor" supplied by reiser4 to iget5_locked().
+/* reiser4_inode_find_actor() - "find actor" supplied by reiser4 to
+   iget5_locked().
 
    This function is called by iget5_locked() to distinguish reiser4 inodes
    having the same inode numbers. Such inodes can only exist due to some error
@@ -320,11 +322,11 @@ static int init_locked_inode(struct inod
    (objectids) are distinguished by their packing locality.
 
 */
-static int reiser4_inode_find_actor(struct inode *inode	/* inode from hash table to
-							 * check */ ,
-				    void *opaque	/* "cookie" passed to
-							 * iget5_locked(). This is stat data
-							 * key */ )
+static int reiser4_inode_find_actor(struct inode *inode	/* inode from hash table
+							 * to check */ ,
+				    void *opaque /* "cookie" passed to
+						  * iget5_locked(). This is stat
+						  * data key */ )
 {
 	reiser4_key *key;
 
@@ -487,43 +489,43 @@ void reiser4_make_bad_inode(struct inode
 	return;
 }
 
-file_plugin *inode_file_plugin(const struct inode * inode)
+file_plugin *inode_file_plugin(const struct inode *inode)
 {
 	assert("nikita-1997", inode != NULL);
 	return reiser4_inode_data(inode)->pset->file;
 }
 
-dir_plugin *inode_dir_plugin(const struct inode * inode)
+dir_plugin *inode_dir_plugin(const struct inode *inode)
 {
 	assert("nikita-1998", inode != NULL);
 	return reiser4_inode_data(inode)->pset->dir;
 }
 
-formatting_plugin *inode_formatting_plugin(const struct inode * inode)
+formatting_plugin *inode_formatting_plugin(const struct inode *inode)
 {
 	assert("nikita-2000", inode != NULL);
 	return reiser4_inode_data(inode)->pset->formatting;
 }
 
-hash_plugin *inode_hash_plugin(const struct inode * inode)
+hash_plugin *inode_hash_plugin(const struct inode *inode)
 {
 	assert("nikita-2001", inode != NULL);
 	return reiser4_inode_data(inode)->pset->hash;
 }
 
-fibration_plugin *inode_fibration_plugin(const struct inode * inode)
+fibration_plugin *inode_fibration_plugin(const struct inode *inode)
 {
 	assert("nikita-2001", inode != NULL);
 	return reiser4_inode_data(inode)->pset->fibration;
 }
 
-cipher_plugin *inode_cipher_plugin(const struct inode * inode)
+cipher_plugin *inode_cipher_plugin(const struct inode *inode)
 {
 	assert("edward-36", inode != NULL);
 	return reiser4_inode_data(inode)->pset->cipher;
 }
 
-compression_plugin *inode_compression_plugin(const struct inode * inode)
+compression_plugin *inode_compression_plugin(const struct inode *inode)
 {
 	assert("edward-37", inode != NULL);
 	return reiser4_inode_data(inode)->pset->compression;
@@ -536,37 +538,37 @@ compression_mode_plugin *inode_compressi
 	return reiser4_inode_data(inode)->pset->compression_mode;
 }
 
-cluster_plugin *inode_cluster_plugin(const struct inode * inode)
+cluster_plugin *inode_cluster_plugin(const struct inode *inode)
 {
 	assert("edward-1328", inode != NULL);
 	return reiser4_inode_data(inode)->pset->cluster;
 }
 
-file_plugin *inode_create_plugin(const struct inode * inode)
+file_plugin *inode_create_plugin(const struct inode *inode)
 {
 	assert("edward-1329", inode != NULL);
 	return reiser4_inode_data(inode)->pset->create;
 }
 
-digest_plugin *inode_digest_plugin(const struct inode * inode)
+digest_plugin *inode_digest_plugin(const struct inode *inode)
 {
 	assert("edward-86", inode != NULL);
 	return reiser4_inode_data(inode)->pset->digest;
 }
 
-item_plugin *inode_sd_plugin(const struct inode * inode)
+item_plugin *inode_sd_plugin(const struct inode *inode)
 {
 	assert("vs-534", inode != NULL);
 	return reiser4_inode_data(inode)->pset->sd;
 }
 
-item_plugin *inode_dir_item_plugin(const struct inode * inode)
+item_plugin *inode_dir_item_plugin(const struct inode *inode)
 {
 	assert("vs-534", inode != NULL);
 	return reiser4_inode_data(inode)->pset->dir_item;
 }
 
-file_plugin *child_create_plugin(const struct inode * inode)
+file_plugin *child_create_plugin(const struct inode *inode)
 {
 	assert("edward-1329", inode != NULL);
 	return reiser4_inode_data(inode)->hset->create;

--=-Z+VXdnD2BweUgjU/xYXS--

