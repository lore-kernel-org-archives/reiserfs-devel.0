From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 8/8] tree.c cleanup
Date: Tue, 23 Oct 2007 14:15:56 +0200
Message-ID: <1193141756.6236.48.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-mxMOdXzyn9BsD/XjZSxn"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-mxMOdXzyn9BsD/XjZSxn
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- tree.c.orig	2007-10-23 11:26:21.000000000 +0200
+++ tree.c	2007-10-23 11:38:49.000000000 +0200
@@ -205,10 +205,10 @@ const reiser4_block_nr UBER_TREE_ADDR = 
 
 #define CUT_TREE_MIN_ITERATIONS 64
 
-static int find_child_by_addr(znode * parent, znode * child, coord_t *
result);
+static int find_child_by_addr(znode * parent, znode * child, coord_t
*result);
 
 /* return node plugin of coord->node */
-node_plugin *node_plugin_by_coord(const coord_t * coord)
+node_plugin *node_plugin_by_coord(const coord_t *coord)
 {
 	assert("vs-1", coord != NULL);
 	assert("vs-2", coord->node != NULL);
@@ -223,11 +223,11 @@ insert_result insert_by_key(reiser4_tree
 			    const reiser4_key * key /* key of new item */ ,
 			    reiser4_item_data * data	/* parameters for item
 							 * creation */ ,
-			    coord_t * coord /* resulting insertion coord */ ,
+			    coord_t *coord /* resulting insertion coord */ ,
 			    lock_handle * lh	/* resulting lock
 						 * handle */ ,
-			    tree_level stop_level /** level where to insert */ ,
-			    __u32 flags /* insertion flags */ )
+			    tree_level stop_level /* level where to insert */ ,
+			    __u32 flags/* insertion flags */)
 {
 	int result;
 
@@ -236,7 +236,7 @@ insert_result insert_by_key(reiser4_tree
 
 	result = coord_by_key(tree, key, coord, lh, ZNODE_WRITE_LOCK,
 			      FIND_EXACT, stop_level, stop_level,
-			      flags | CBK_FOR_INSERT, NULL /*ra_info */ );
+			      flags | CBK_FOR_INSERT, NULL/*ra_info */);
 	switch (result) {
 	default:
 		break;
@@ -245,7 +245,7 @@ insert_result insert_by_key(reiser4_tree
 		break;
 	case CBK_COORD_NOTFOUND:
 		assert("nikita-2017", coord->node != NULL);
-		result = insert_by_coord(coord, data, key, lh, 0 /*flags */ );
+		result = insert_by_coord(coord, data, key, lh, 0/*flags */);
 		break;
 	}
 	return result;
@@ -253,15 +253,18 @@ insert_result insert_by_key(reiser4_tree
 
 /* insert item by calling carry. Helper function called if short-cut
    insertion failed  */
-static insert_result insert_with_carry_by_coord(coord_t * coord,	/*
coord where to insert */
-						lock_handle * lh,	/* lock handle of insertion
-									 * node */
-						reiser4_item_data * data,	/* parameters of new
-										 * item */
-						const reiser4_key * key,	/* key of new item */
-						carry_opcode cop,	/* carry operation to perform */
+static insert_result insert_with_carry_by_coord(coord_t *coord,
+					/* coord where to insert */
+						lock_handle * lh,
+					/* lock handle of insertion node */
+						reiser4_item_data * data,
+					/* parameters of new item */
+						const reiser4_key * key,
+					/* key of new item */
+						carry_opcode cop,
+					/* carry operation to perform */
 						cop_insert_flag flags
-						/* carry flags */ )
+					/* carry flags */ )
 {
 	int result;
 	carry_pool *pool;
@@ -314,14 +317,14 @@ static insert_result insert_with_carry_b
    different block.
 
 */
-static int paste_with_carry(coord_t * coord,	/* coord of paste */
+static int paste_with_carry(coord_t *coord,	/* coord of paste */
 			    lock_handle * lh,	/* lock handle of node
 						 * where item is
 						 * pasted */
 			    reiser4_item_data * data,	/* parameters of new
 							 * item */
 			    const reiser4_key * key,	/* key of new item */
-			    unsigned flags /* paste flags */ )
+			    unsigned flags/* paste flags */)
 {
 	int result;
 	carry_pool *pool;
@@ -373,7 +376,7 @@ static int paste_with_carry(coord_t * co
    that will do full carry().
 
 */
-insert_result insert_by_coord(coord_t * coord	/* coord where to
+insert_result insert_by_coord(coord_t *coord	/* coord where to
 						 * insert. coord->node has
 						 * to be write locked by
 						 * caller */ ,
@@ -382,7 +385,7 @@ insert_result insert_by_coord(coord_t * 
 			      const reiser4_key * key /* key of new item */ ,
 			      lock_handle * lh	/* lock handle of write
 						 * lock on node */ ,
-			      __u32 flags /* insertion flags */ )
+			      __u32 flags/* insertion flags */)
 {
 	unsigned item_size;
 	int result;
@@ -449,12 +452,13 @@ insert_result insert_by_coord(coord_t * 
 insert_result
 insert_extent_by_coord(coord_t *
 		       coord
-		       /* coord where to insert. coord->node * has to be write *
locked by caller */
+		       /* coord where to insert. coord->node has to be write
+			  locked by caller */
 		       ,
 		       reiser4_item_data * data /* data to be inserted */ ,
 		       const reiser4_key * key /* key of new item */ ,
 		       lock_handle *
-		       lh /* lock handle of write lock on * node */ )
+		       lh/* lock handle of write lock on * node */)
 {
 	assert("vs-405", coord != NULL);
 	assert("vs-406", data != NULL);

--=-mxMOdXzyn9BsD/XjZSxn
Content-Disposition: attachment; filename=tree.c.patch
Content-Type: text/x-patch; name=tree.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- tree.c.orig	2007-10-23 11:26:21.000000000 +0200
+++ tree.c	2007-10-23 11:38:49.000000000 +0200
@@ -205,10 +205,10 @@ const reiser4_block_nr UBER_TREE_ADDR = 
 
 #define CUT_TREE_MIN_ITERATIONS 64
 
-static int find_child_by_addr(znode * parent, znode * child, coord_t * result);
+static int find_child_by_addr(znode * parent, znode * child, coord_t *result);
 
 /* return node plugin of coord->node */
-node_plugin *node_plugin_by_coord(const coord_t * coord)
+node_plugin *node_plugin_by_coord(const coord_t *coord)
 {
 	assert("vs-1", coord != NULL);
 	assert("vs-2", coord->node != NULL);
@@ -223,11 +223,11 @@ insert_result insert_by_key(reiser4_tree
 			    const reiser4_key * key /* key of new item */ ,
 			    reiser4_item_data * data	/* parameters for item
 							 * creation */ ,
-			    coord_t * coord /* resulting insertion coord */ ,
+			    coord_t *coord /* resulting insertion coord */ ,
 			    lock_handle * lh	/* resulting lock
 						 * handle */ ,
-			    tree_level stop_level /** level where to insert */ ,
-			    __u32 flags /* insertion flags */ )
+			    tree_level stop_level /* level where to insert */ ,
+			    __u32 flags/* insertion flags */)
 {
 	int result;
 
@@ -236,7 +236,7 @@ insert_result insert_by_key(reiser4_tree
 
 	result = coord_by_key(tree, key, coord, lh, ZNODE_WRITE_LOCK,
 			      FIND_EXACT, stop_level, stop_level,
-			      flags | CBK_FOR_INSERT, NULL /*ra_info */ );
+			      flags | CBK_FOR_INSERT, NULL/*ra_info */);
 	switch (result) {
 	default:
 		break;
@@ -245,7 +245,7 @@ insert_result insert_by_key(reiser4_tree
 		break;
 	case CBK_COORD_NOTFOUND:
 		assert("nikita-2017", coord->node != NULL);
-		result = insert_by_coord(coord, data, key, lh, 0 /*flags */ );
+		result = insert_by_coord(coord, data, key, lh, 0/*flags */);
 		break;
 	}
 	return result;
@@ -253,15 +253,18 @@ insert_result insert_by_key(reiser4_tree
 
 /* insert item by calling carry. Helper function called if short-cut
    insertion failed  */
-static insert_result insert_with_carry_by_coord(coord_t * coord,	/* coord where to insert */
-						lock_handle * lh,	/* lock handle of insertion
-									 * node */
-						reiser4_item_data * data,	/* parameters of new
-										 * item */
-						const reiser4_key * key,	/* key of new item */
-						carry_opcode cop,	/* carry operation to perform */
+static insert_result insert_with_carry_by_coord(coord_t *coord,
+					/* coord where to insert */
+						lock_handle * lh,
+					/* lock handle of insertion node */
+						reiser4_item_data * data,
+					/* parameters of new item */
+						const reiser4_key * key,
+					/* key of new item */
+						carry_opcode cop,
+					/* carry operation to perform */
 						cop_insert_flag flags
-						/* carry flags */ )
+					/* carry flags */ )
 {
 	int result;
 	carry_pool *pool;
@@ -314,14 +317,14 @@ static insert_result insert_with_carry_b
    different block.
 
 */
-static int paste_with_carry(coord_t * coord,	/* coord of paste */
+static int paste_with_carry(coord_t *coord,	/* coord of paste */
 			    lock_handle * lh,	/* lock handle of node
 						 * where item is
 						 * pasted */
 			    reiser4_item_data * data,	/* parameters of new
 							 * item */
 			    const reiser4_key * key,	/* key of new item */
-			    unsigned flags /* paste flags */ )
+			    unsigned flags/* paste flags */)
 {
 	int result;
 	carry_pool *pool;
@@ -373,7 +376,7 @@ static int paste_with_carry(coord_t * co
    that will do full carry().
 
 */
-insert_result insert_by_coord(coord_t * coord	/* coord where to
+insert_result insert_by_coord(coord_t *coord	/* coord where to
 						 * insert. coord->node has
 						 * to be write locked by
 						 * caller */ ,
@@ -382,7 +385,7 @@ insert_result insert_by_coord(coord_t * 
 			      const reiser4_key * key /* key of new item */ ,
 			      lock_handle * lh	/* lock handle of write
 						 * lock on node */ ,
-			      __u32 flags /* insertion flags */ )
+			      __u32 flags/* insertion flags */)
 {
 	unsigned item_size;
 	int result;
@@ -449,12 +452,13 @@ insert_result insert_by_coord(coord_t * 
 insert_result
 insert_extent_by_coord(coord_t *
 		       coord
-		       /* coord where to insert. coord->node * has to be write * locked by caller */
+		       /* coord where to insert. coord->node has to be write
+			  locked by caller */
 		       ,
 		       reiser4_item_data * data /* data to be inserted */ ,
 		       const reiser4_key * key /* key of new item */ ,
 		       lock_handle *
-		       lh /* lock handle of write lock on * node */ )
+		       lh/* lock handle of write lock on * node */)
 {
 	assert("vs-405", coord != NULL);
 	assert("vs-406", data != NULL);

--=-mxMOdXzyn9BsD/XjZSxn--

