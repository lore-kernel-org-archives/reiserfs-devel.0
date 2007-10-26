From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 65/8] inode_ops.c cleanup
Date: Fri, 26 Oct 2007 13:46:44 +0200
Message-ID: <1193399204.4615.12.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-0yvz5jNPrB0cDWTDkRqD"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-0yvz5jNPrB0cDWTDkRqD
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 3 errors, 8 warnings, 897 lines checked
patched:total: 2 errors, 0 warnings, 903 lines checked
leftover:

#48: FILE: inode_ops.c:48:
+int reiser4_lookup_name(struct inode *dir, struct dentry *, reiser4_key
*);

^

ERROR: need consistent spacing around '*' (ctx:WxB)
#427: FILE: inode_ops.c:427:
+static int setattr_reserve(reiser4_tree *);
                                         ^




--=-0yvz5jNPrB0cDWTDkRqD
Content-Disposition: attachment; filename=inode_ops.c.patch
Content-Type: text/x-patch; name=inode_ops.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- inode_ops.c.orig	2007-10-26 13:44:46.000000000 +0200
+++ inode_ops.c	2007-10-26 13:44:10.000000000 +0200
@@ -511,9 +511,10 @@ int reiser4_getattr_common(struct vfsmou
    method of file plugin, adding directory entry to parent and update parent
    directory's stat data.
 */
-static reiser4_block_nr estimate_create_vfs_object(struct inode *parent,	/* parent object */
+static reiser4_block_nr estimate_create_vfs_object(struct inode *parent,
+						   /* parent object */
 						   struct inode *object
-						   /* object */ )
+						   /* object */)
 {
 	assert("vpf-309", parent != NULL);
 	assert("vpf-307", object != NULL);
@@ -540,8 +541,8 @@ static reiser4_block_nr estimate_create_
    . instantiate dentry
 
 */
-static int do_create_vfs_child(reiser4_object_create_data * data,	/* parameters of new
-									   object */
+static int do_create_vfs_child(reiser4_object_create_data * data,
+				/* parameters of new object */
 			       struct inode **retobj)
 {
 	int result;
@@ -646,7 +647,7 @@ static int do_create_vfs_child(reiser4_o
 	/* call file plugin's method to initialize plugin specific part of
 	 * inode */
 	if (obj_plug->init_inode_data)
-		obj_plug->init_inode_data(object, data, 1 /*create */ );
+		obj_plug->init_inode_data(object, data, 1/*create */);
 
 	/* obtain directory plugin (if any) for new object. */
 	obj_dir = inode_dir_plugin(object);
@@ -789,9 +790,11 @@ create_vfs_object(struct inode *parent,
 /* helper for link_common. Estimate disk space necessary to add a link
    from @parent to @object
 */
-static reiser4_block_nr common_estimate_link(struct inode *parent,	/* parent directory */
+static reiser4_block_nr common_estimate_link(struct inode *parent,
+					    /* parent directory */
 					     struct inode *object
-					     /* object to which new link is being cerated */
+					    /* object to which new link is being
+					     * cerated */
 					     )
 {
 	reiser4_block_nr res = 0;
@@ -803,7 +806,8 @@ static reiser4_block_nr common_estimate_
 
 	fplug = inode_file_plugin(object);
 	dplug = inode_dir_plugin(parent);
-	/* VS-FIXME-HANS: why do we do fplug->estimate.update(object) twice instead of multiplying by 2? */
+	/* VS-FIXME-HANS: why do we do fplug->estimate.update(object) twice
+	 * instead of multiplying by 2? */
 	/* reiser4_add_nlink(object) */
 	res += fplug->estimate.update(object);
 	/* add_entry(parent) */
@@ -821,9 +825,11 @@ static reiser4_block_nr common_estimate_
 /* Estimate disk space necessary to remove a link between @parent and
    @object.
 */
-static reiser4_block_nr estimate_unlink(struct inode *parent,	/* parent directory */
+static reiser4_block_nr estimate_unlink(struct inode *parent,	/* parent
+								 * directory */
 					struct inode *object
-					/* object to which new link is being cerated */
+					/* object to which new link is being
+					 * created */
 					)
 {
 	reiser4_block_nr res = 0;

--=-0yvz5jNPrB0cDWTDkRqD--

