From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 51/8] search.c cleanup
Date: Thu, 25 Oct 2007 16:57:01 +0200
Message-ID: <1193324221.15901.64.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-k9s6jX8dFMBRFaqWGGtF"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-k9s6jX8dFMBRFaqWGGtF
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 35 errors, 26 warnings, 1611 lines checked
patched:total: 2 errors, 5 warnings, 1613 lines checked
leftover:

These first two are false I think, but maybe this could be written some
other way?

ERROR: need consistent spacing around '*' (ctx:WxB)
#103: FILE: search.c:103:
+       read_lock(&((cbk_cache *)cache)->guard);
                               ^

ERROR: need consistent spacing around '*' (ctx:WxB)
#127: FILE: search.c:127:
+       read_unlock(&((cbk_cache *)cache)->guard);
                                 ^

WARNING: line over 80 characters
#438: FILE: search.c:438:
+
GN_CAN_USE_UPPER_LEVELS);

WARNING: line over 80 characters
#698: FILE: search.c:698:
+                           "reiser-2018: Too many iterations. Tree
corrupted, or (less likely) starvation occurring.";

WARNING: printk() should include KERN_ facility level
#1494: FILE: search.c:1494:
+               printk("%s: null\n", prefix);

WARNING: printk() should include KERN_ facility level
#1499: FILE: search.c:1499:
+               printk("%s: data: %p, length: %i\n", prefix,

WARNING: printk() should include KERN_ facility level
#1511: FILE: search.c:1511:
+       printk("%s: %s\n", prefix, sprint_address(block));




--=-k9s6jX8dFMBRFaqWGGtF
Content-Disposition: attachment; filename=search.c.patch
Content-Type: text/x-patch; name=search.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- search.c.orig	2007-10-25 16:39:54.000000000 +0200
+++ search.c	2007-10-25 16:54:07.000000000 +0200
@@ -48,7 +48,7 @@ static void cbk_cache_init_slot(cbk_cach
 }
 
 /* Initialize coord cache */
-int cbk_cache_init(cbk_cache *cache /* cache to init */ )
+int cbk_cache_init(cbk_cache * cache/* cache to init */)
 {
 	int i;
 
@@ -70,7 +70,7 @@ int cbk_cache_init(cbk_cache *cache /* c
 }
 
 /* free cbk cache data */
-void cbk_cache_done(cbk_cache * cache /* cache to release */ )
+void cbk_cache_done(cbk_cache * cache/* cache to release */)
 {
 	assert("nikita-2493", cache != NULL);
 	if (cache->slot != NULL) {
@@ -80,14 +80,15 @@ void cbk_cache_done(cbk_cache * cache /*
 }
 
 /* macro to iterate over all cbk cache slots */
-#define for_all_slots(cache, slot)						\
-	for ((slot) = list_entry((cache)->lru.next, cbk_cache_slot, lru);	\
-	     &(cache)->lru != &(slot)->lru;					\
-	     (slot) = list_entry(slot->lru.next, cbk_cache_slot, lru))
+#define for_all_slots(cache, slot)					\
+	for ((slot) = list_entry((cache)->lru.next, cbk_cache_slot, lru); \
+	     &(cache)->lru != &(slot)->lru;				\
+	     (slot) = list_entry(slot->lru.next, cbk_cache_slot,
+				 lru))
 
 #if REISER4_DEBUG
 /* this function assures that [cbk-cache-invariant] invariant holds */
-static int cbk_cache_invariant(const cbk_cache *cache)
+static int cbk_cache_invariant(const cbk_cache * cache)
 {
 	cbk_cache_slot *slot;
 	int result;
@@ -112,7 +113,8 @@ static int cbk_cache_invariant(const cbk
 			/* all cached nodes are different */
 			scan = slot;
 			while (result) {
-				scan = list_entry(scan->lru.next, cbk_cache_slot, lru);
+				scan = list_entry(scan->lru.next,
+						  cbk_cache_slot, lru);
 				if (&cache->lru == &scan->lru)
 					break;
 				if (slot->node == scan->node)
@@ -130,7 +132,7 @@ static int cbk_cache_invariant(const cbk
 
 /* Remove references, if any, to @node from coord cache */
 void cbk_cache_invalidate(const znode * node /* node to remove from cache */ ,
-			  reiser4_tree * tree /* tree to remove node from */ )
+			  reiser4_tree * tree/* tree to remove node from */)
 {
 	cbk_cache_slot *slot;
 	cbk_cache *cache;
@@ -156,9 +158,10 @@ void cbk_cache_invalidate(const znode * 
 
 /* add to the cbk-cache in the "tree" information about "node". This
     can actually be update of existing slot in a cache. */
-static void cbk_cache_add(const znode *node /* node to add to the cache */ )
+static void cbk_cache_add(const znode * node/* node to add to the cache */)
 {
 	cbk_cache *cache;
+
 	cbk_cache_slot *slot;
 	int i;
 
@@ -213,14 +216,14 @@ static level_lookup_result search_to_lef
 static cbk_handle *cbk_pack(cbk_handle * handle,
 			    reiser4_tree * tree,
 			    const reiser4_key * key,
-			    coord_t * coord,
+			    coord_t *coord,
 			    lock_handle * active_lh,
 			    lock_handle * parent_lh,
 			    znode_lock_mode lock_mode,
 			    lookup_bias bias,
 			    tree_level lock_level,
 			    tree_level stop_level,
-			    __u32 flags, ra_info_t * info)
+			    __u32 flags, ra_info_t *info)
 {
 	memset(handle, 0, sizeof *handle);
 
@@ -256,7 +259,7 @@ lookup_result coord_by_key(reiser4_tree 
 						 * part of file-system
 						 * super-block */ ,
 			   const reiser4_key * key /* key to look for */ ,
-			   coord_t * coord	/* where to store found
+			   coord_t *coord	/* where to store found
 						 * position in a tree. Fields
 						 * in "coord" are only valid if
 						 * coord_by_key() returned
@@ -273,19 +276,20 @@ lookup_result coord_by_key(reiser4_tree 
 			   lookup_bias bias	/* what to return if coord
 						 * with exactly the @key is
 						 * not in the tree */ ,
-			   tree_level lock_level	/* tree level where to start
-							 * taking @lock type of
-							 * locks */ ,
-			   tree_level stop_level	/* tree level to stop. Pass
-							 * LEAF_LEVEL or TWIG_LEVEL
-							 * here Item being looked
-							 * for has to be between
-							 * @lock_level and
-							 * @stop_level, inclusive */ ,
+			   tree_level lock_level/* tree level where to start
+						 * taking @lock type of
+						 * locks */ ,
+			   tree_level stop_level/* tree level to stop. Pass
+						 * LEAF_LEVEL or TWIG_LEVEL
+						 * here Item being looked
+						 * for has to be between
+						 * @lock_level and
+						 * @stop_level, inclusive */ ,
 			   __u32 flags /* search flags */ ,
 			   ra_info_t *
 			   info
-			   /* information about desired tree traversal readahead */
+			   /* information about desired tree traversal
+			    * readahead */
 			   )
 {
 	cbk_handle handle;
@@ -322,15 +326,15 @@ lookup_result coord_by_key(reiser4_tree 
 
 /* like coord_by_key(), but starts traversal from vroot of @object rather than
  * from tree root. */
-lookup_result reiser4_object_lookup(struct inode * object,
+lookup_result reiser4_object_lookup(struct inode *object,
 				    const reiser4_key * key,
-				    coord_t * coord,
+				    coord_t *coord,
 				    lock_handle * lh,
 				    znode_lock_mode lock_mode,
 				    lookup_bias bias,
 				    tree_level lock_level,
 				    tree_level stop_level, __u32 flags,
-				    ra_info_t * info)
+				    ra_info_t *info)
 {
 	cbk_handle handle;
 	lock_handle parent_lh;
@@ -393,7 +397,7 @@ static lookup_result coord_by_handle(cbk
    sequence of entries with identical keys and alikes.
 */
 int reiser4_iterate_tree(reiser4_tree * tree /* tree to scan */ ,
-			 coord_t * coord /* coord to start from */ ,
+			 coord_t *coord /* coord to start from */ ,
 			 lock_handle * lh /* lock handle to start with and to
 					   * update along the way */ ,
 			 tree_iterate_actor_t actor /* function to call on each
@@ -625,7 +629,7 @@ static int prepare_object_lookup(cbk_han
 
 /* main function that handles common parts of tree traversal: starting
     (fake znode handling), restarts, error handling, completion */
-static lookup_result traverse_tree(cbk_handle * h /* search handle */ )
+static lookup_result traverse_tree(cbk_handle * h/* search handle */)
 {
 	int done;
 	int iterations;
@@ -646,7 +650,7 @@ static lookup_result traverse_tree(cbk_h
 	vroot_used = 0;
 
 	/* loop for restarts */
-      restart:
+restart:
 
 	assert("nikita-3024", reiser4_schedulable());
 
@@ -660,9 +664,9 @@ static lookup_result traverse_tree(cbk_h
 	if (!vroot_used && h->object != NULL) {
 		vroot_used = 1;
 		done = prepare_object_lookup(h);
-		if (done == LOOKUP_REST) {
+		if (done == LOOKUP_REST)
 			goto restart;
-		} else if (done == LOOKUP_DONE)
+		else if (done == LOOKUP_DONE)
 			return h->result;
 	}
 	if (h->parent_lh->node == NULL) {
@@ -747,10 +751,10 @@ static lookup_result traverse_tree(cbk_h
 */
 static void find_child_delimiting_keys(znode * parent	/* parent znode, passed
 							 * locked */ ,
-				       const coord_t * parent_coord	/* coord where
-									 * pointer to
-									 * child is
-									 * stored */ ,
+				       const coord_t *parent_coord
+							/* coord where pointer
+							 * to child is stored
+							 */ ,
 				       reiser4_key * ld	/* where to store left
 							 * delimiting key */ ,
 				       reiser4_key * rd	/* where to store right
@@ -793,7 +797,7 @@ static void find_child_delimiting_keys(z
  * @child child node
  */
 int
-set_child_delimiting_keys(znode * parent, const coord_t * coord, znode * child)
+set_child_delimiting_keys(znode * parent, const coord_t *coord, znode * child)
 {
 	reiser4_tree *tree;
 
@@ -827,7 +831,7 @@ set_child_delimiting_keys(znode * parent
 
    See comments in a code.
 */
-static level_lookup_result cbk_level_lookup(cbk_handle * h /* search handle */ )
+static level_lookup_result cbk_level_lookup(cbk_handle * h/* search handle */)
 {
 	int ret;
 	int setdk;
@@ -944,9 +948,8 @@ static level_lookup_result cbk_level_loo
 		return LOOKUP_REST;
 
 	h->result = zload_ra(active, h->ra_info);
-	if (h->result) {
+	if (h->result)
 		return LOOKUP_DONE;
-	}
 
 	/* sanity checks */
 	if (sanity_check(h)) {
@@ -976,7 +979,7 @@ static level_lookup_result cbk_level_loo
 
 	return ret;
 
-      fail_or_restart:
+fail_or_restart:
 	if (h->result == -E_DEADLOCK)
 		return LOOKUP_REST;
 	return LOOKUP_DONE;
@@ -1038,7 +1041,7 @@ static int key_is_ld(znode * node, const
 /* Process one node during tree traversal.
 
    This is called by cbk_level_lookup(). */
-static level_lookup_result cbk_node_lookup(cbk_handle * h /* search handle */ )
+static level_lookup_result cbk_node_lookup(cbk_handle * h/* search handle */)
 {
 	/* node plugin of @active */
 	node_plugin *nplug;
@@ -1078,9 +1081,9 @@ static level_lookup_result cbk_node_look
 		if (result == NS_FOUND) {
 			/* success of tree lookup */
 			if (!(h->flags & CBK_UNIQUE)
-			    && key_is_ld(active, h->key)) {
+			    && key_is_ld(active, h->key))
 				return search_to_left(h);
-			} else
+			else
 				h->result = CBK_COORD_FOUND;
 		} else {
 			h->result = CBK_COORD_NOTFOUND;
@@ -1115,7 +1118,7 @@ static level_lookup_result cbk_node_look
 }
 
 /* scan cbk_cache slots looking for a match for @h */
-static int cbk_cache_scan_slots(cbk_handle * h /* cbk handle */ )
+static int cbk_cache_scan_slots(cbk_handle * h/* cbk handle */)
 {
 	level_lookup_result llr;
 	znode *node;
@@ -1244,7 +1247,7 @@ static int cbk_cache_scan_slots(cbk_hand
 			result = 0;
 
 			write_lock(&(cache->guard));
-			if (slot->node == h->active_lh->node /*node */ ) {
+			if (slot->node == h->active_lh->node/*node */) {
 				/* if this node is still in cbk cache---move
 				   its slot to the head of the LRU list. */
 				list_move(&slot->lru, &cache->lru);
@@ -1283,7 +1286,7 @@ static int cbk_cache_scan_slots(cbk_hand
    of coord_by_key.
 
 */
-static int cbk_cache_search(cbk_handle * h /* cbk handle */ )
+static int cbk_cache_search(cbk_handle * h/* cbk handle */)
 {
 	int result = 0;
 	tree_level level;
@@ -1380,7 +1383,7 @@ static void update_stale_dk(reiser4_tree
  * duplicate keys), it sis cheaper to scan to the left on the stop level once.
  *
  */
-static level_lookup_result search_to_left(cbk_handle * h /* search handle */ )
+static level_lookup_result search_to_left(cbk_handle * h/* search handle */)
 {
 	level_lookup_result result;
 	coord_t *coord;
@@ -1441,7 +1444,7 @@ static level_lookup_result search_to_lef
 				h->flags |= CBK_DKSET;
 
 				h->block = *znode_get_block(neighbor);
-				/* clear coord -> node so that cbk_level_lookup()
+				/* clear coord->node so that cbk_level_lookup()
 				   wouldn't overwrite parent hint in neighbor.
 
 				   Parent hint was set up by
@@ -1464,7 +1467,7 @@ static level_lookup_result search_to_lef
 }
 
 /* debugging aid: return symbolic name of search bias */
-static const char *bias_name(lookup_bias bias /* bias to get name of */ )
+static const char *bias_name(lookup_bias bias/* bias to get name of */)
 {
 	if (bias == FIND_EXACT)
 		return "exact";
@@ -1483,7 +1486,7 @@ static const char *bias_name(lookup_bias
 #if REISER4_DEBUG
 /* debugging aid: print human readable information about @p */
 void print_coord_content(const char *prefix /* prefix to print */ ,
-			 coord_t * p /* coord to print */ )
+			 coord_t *p/* coord to print */)
 {
 	reiser4_key key;
 
@@ -1503,7 +1506,7 @@ void print_coord_content(const char *pre
 
 /* debugging aid: print human readable information about @block */
 void reiser4_print_address(const char *prefix /* prefix to print */ ,
-		   const reiser4_block_nr * block /* block number to print */ )
+		   const reiser4_block_nr * block/* block number to print */)
 {
 	printk("%s: %s\n", prefix, sprint_address(block));
 }
@@ -1511,7 +1514,7 @@ void reiser4_print_address(const char *p
 
 /* return string containing human readable representation of @block */
 char *sprint_address(const reiser4_block_nr *
-		     block /* block number to print */ )
+		     block/* block number to print */)
 {
 	static char address[30];
 
@@ -1525,17 +1528,16 @@ char *sprint_address(const reiser4_block
 }
 
 /* release parent node during traversal */
-static void put_parent(cbk_handle * h /* search handle */ )
+static void put_parent(cbk_handle * h/* search handle */)
 {
 	assert("nikita-383", h != NULL);
-	if (h->parent_lh->node != NULL) {
+	if (h->parent_lh->node != NULL)
 		longterm_unlock_znode(h->parent_lh);
-	}
 }
 
 /* helper function used by coord_by_key(): release reference to parent znode
    stored in handle before processing its child. */
-static void hput(cbk_handle * h /* search handle */ )
+static void hput(cbk_handle * h/* search handle */)
 {
 	assert("nikita-385", h != NULL);
 	done_lh(h->parent_lh);
@@ -1544,7 +1546,7 @@ static void hput(cbk_handle * h /* searc
 
 /* Helper function used by cbk(): update delimiting keys of child node (stored
    in h->active_lh->node) using key taken from parent on the parent level. */
-static int setup_delimiting_keys(cbk_handle * h /* search handle */ )
+static int setup_delimiting_keys(cbk_handle * h/* search handle */)
 {
 	znode *active;
 	reiser4_tree *tree;
@@ -1573,7 +1575,7 @@ static int setup_delimiting_keys(cbk_han
  * pointers */
 static int
 block_nr_is_correct(reiser4_block_nr * block /* block number to check */ ,
-		    reiser4_tree * tree /* tree to check against */ )
+		    reiser4_tree * tree/* tree to check against */)
 {
 	assert("nikita-757", block != NULL);
 	assert("nikita-758", tree != NULL);
@@ -1583,7 +1585,7 @@ block_nr_is_correct(reiser4_block_nr * b
 }
 
 /* check consistency of fields */
-static int sanity_check(cbk_handle * h /* search handle */ )
+static int sanity_check(cbk_handle * h/* search handle */)
 {
 	assert("nikita-384", h != NULL);
 

--=-k9s6jX8dFMBRFaqWGGtF--

