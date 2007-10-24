From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 30/8] jnode.c cleanup
Date: Thu, 25 Oct 2007 01:02:12 +0200
Message-ID: <1193266932.24225.49.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-aJQTRVnLy1HfbfwwnjW5"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-aJQTRVnLy1HfbfwwnjW5
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 17 errors, 9 warnings, 1924 lines checked
patched:total: 1 errors, 4 warnings, 1923 lines checked

Leftovers:

ERROR: do not initialise statics to 0 or NULL
#126: FILE: jnode.c:126:
+static struct kmem_cache *_jnode_slab = NULL;

WARNING: line over 80 characters
#853: FILE: jnode.c:853:
+                              z->nr_items ==
le16_to_cpu(get_unaligned(&nh->nr_items)));

WARNING: printk() should include KERN_ facility level
#1849: FILE: jnode.c:1849:
+               printk("%s: null\n", prefix);

WARNING: line over 80 characters
#1854: FILE: jnode.c:1854:
+           ("%s: %p: state: %lx: [%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s],
level: %i,"

WARNING: printk() should include KERN_ facility level
#1880: FILE: jnode.c:1880:
+               printk("inode: %llu, index: %lu, ",



--=-aJQTRVnLy1HfbfwwnjW5
Content-Disposition: attachment; filename=jnode.c.patch
Content-Type: text/x-patch; name=jnode.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- jnode.c.orig	2007-10-25 00:53:32.000000000 +0200
+++ jnode.c	2007-10-25 00:59:42.000000000 +0200
@@ -142,8 +142,8 @@ static inline int jnode_is_parsed(jnode 
 /* hash table support */
 
 /* compare two jnode keys for equality. Used by hash-table macros */
-static inline int jnode_key_eq(const struct jnode_key * k1,
-			       const struct jnode_key * k2)
+static inline int jnode_key_eq(const struct jnode_key *k1,
+			       const struct jnode_key *k2)
 {
 	assert("nikita-2350", k1 != NULL);
 	assert("nikita-2351", k2 != NULL);
@@ -153,7 +153,7 @@ static inline int jnode_key_eq(const str
 
 /* Hash jnode by its key (inode plus offset). Used by hash-table macros */
 static inline __u32 jnode_key_hashfn(j_hash_table * table,
-				     const struct jnode_key * key)
+				     const struct jnode_key *key)
 {
 	assert("nikita-2352", key != NULL);
 	assert("nikita-3346", IS_POW(table->_buckets));
@@ -171,14 +171,14 @@ TYPE_SAFE_HASH_DEFINE(j, jnode, struct j
 #undef KMALLOC
 
 /* call this to initialise jnode hash table */
-int jnodes_tree_init(reiser4_tree * tree /* tree to initialise jnodes for */ )
+int jnodes_tree_init(reiser4_tree * tree/* tree to initialise jnodes for */)
 {
 	assert("nikita-2359", tree != NULL);
 	return j_hash_init(&tree->jhash_table, 16384);
 }
 
 /* call this to destroy jnode hash table. This is called during umount. */
-int jnodes_tree_done(reiser4_tree * tree /* tree to destroy jnodes for */ )
+int jnodes_tree_done(reiser4_tree * tree/* tree to destroy jnodes for */)
 {
 	j_hash_table *jtable;
 	jnode *node;
@@ -404,7 +404,7 @@ static jnode *jfind_nolock(struct addres
 	return radix_tree_lookup(jnode_tree_by_inode(mapping->host), index);
 }
 
-jnode *jfind(struct address_space * mapping, unsigned long index)
+jnode *jfind(struct address_space *mapping, unsigned long index)
 {
 	reiser4_tree *tree;
 	jnode *node;
@@ -557,7 +557,8 @@ static jnode *find_get_jnode(reiser4_tre
 	write_lock_tree(tree);
 	shadow = jfind_nolock(mapping, index);
 	if (likely(shadow == NULL)) {
-		/* add new jnode to hash table and inode's radix tree of jnodes */
+		/* add new jnode to hash table and inode's radix tree of
+		 * jnodes */
 		jref(result);
 		hash_unformatted_jnode(result, mapping, index);
 	} else {
@@ -630,7 +631,7 @@ static jnode *do_jget(reiser4_tree * tre
 /*
  * return jnode for @pg, creating it if necessary.
  */
-jnode *jnode_of_page(struct page * pg)
+jnode *jnode_of_page(struct page *pg)
 {
 	jnode *result;
 
@@ -739,9 +740,8 @@ static struct page *jnode_lock_page(jnod
 
 		spin_lock_jnode(node);
 		page = jnode_page(node);
-		if (page == NULL) {
+		if (page == NULL)
 			break;
-		}
 
 		/* no need to page_cache_get( page ) here, because page cannot
 		   be evicted from memory without detaching it from jnode and
@@ -871,7 +871,7 @@ void jload_prefetch(jnode * node)
 /* load jnode's data into memory */
 int jload_gfp(jnode * node /* node to load */ ,
 	      gfp_t gfp_flags /* allocation flags */ ,
-	      int do_kmap /* true if page should be kmapped */ )
+	      int do_kmap/* true if page should be kmapped */)
 {
 	struct page *page;
 	int result = 0;
@@ -940,7 +940,7 @@ int jload_gfp(jnode * node /* node to lo
 
 	return 0;
 
-      failed:
+failed:
 	jrelse_tail(node);
 	return result;
 
@@ -993,13 +993,13 @@ int jinit_new(jnode * node, gfp_t gfp_fl
 
 	return 0;
 
-      failed:
+failed:
 	jrelse(node);
 	return result;
 }
 
 /* release a reference to jnode acquired by jload(), decrement ->d_count */
-void jrelse_tail(jnode * node /* jnode to release references to */ )
+void jrelse_tail(jnode * node/* jnode to release references to */)
 {
 	assert("nikita-489", atomic_read(&node->d_count) > 0);
 	atomic_dec(&node->d_count);
@@ -1011,7 +1011,7 @@ void jrelse_tail(jnode * node /* jnode t
 
 /* drop reference to node data. When last reference is dropped, data are
    unloaded. */
-void jrelse(jnode * node /* jnode to release references to */ )
+void jrelse(jnode * node/* jnode to release references to */)
 {
 	struct page *page;
 
@@ -1614,7 +1614,7 @@ static int jnode_try_drop(jnode * node)
 }
 
 /* jdelete() -- Delete jnode from the tree and file system */
-static int jdelete(jnode * node /* jnode to finish with */ )
+static int jdelete(jnode * node/* jnode to finish with */)
 {
 	struct page *page;
 	int result;
@@ -1707,9 +1707,8 @@ static int jdrop_in_tree(jnode * node, r
 		jnode_remove(node, jtype, tree);
 		write_unlock_tree(tree);
 		jnode_free(node, jtype);
-		if (page != NULL) {
+		if (page != NULL)
 			reiser4_drop_page(page);
-		}
 	} else {
 		/* busy check failed: reference was acquired by concurrent
 		 * thread. */
@@ -1837,12 +1836,12 @@ static const char *jnode_type_name(jnode
 	}
 }
 
-#define jnode_state_name( node, flag )			\
-	( JF_ISSET( ( node ), ( flag ) ) ? ((#flag "|")+6) : "" )
+#define jnode_state_name(node, flag)			\
+	(JF_ISSET((node), (flag)) ? ((#flag "|")+6) : "")
 
 /* debugging aid: output human readable information about @node */
 static void info_jnode(const char *prefix /* prefix to print */ ,
-		       const jnode * node /* node to print */ )
+		       const jnode * node/* node to print */)
 {
 	assert("umka-068", prefix != NULL);
 

--=-aJQTRVnLy1HfbfwwnjW5--

