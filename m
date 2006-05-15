From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH] Reiser4 should use gfp_t type for gfp_flags variables
Date: Mon, 15 May 2006 18:56:08 +0200
Message-ID: <780.722735408013$1147713948@news.gmane.org>
Return-path: <reiserfs-list-return-28619-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline; filename=reiser4_use_gfp_t.patch
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: Laurent Riffard <laurent.riffard@free.fr>

Reiser4 should use gfp_t type for gfp_flags variables.

Signed-off-by: Laurent Riffard <laurent.riffard@free.fr>
---
 fs/reiser4/carry.c           |    2 +-
 fs/reiser4/emergency_flush.c |    4 ++--
 fs/reiser4/flush_queue.c     |    6 +++---
 fs/reiser4/fsdata.c          |    2 +-
 fs/reiser4/jnode.c           |    6 +++---
 fs/reiser4/jnode.h           |    6 +++---
 fs/reiser4/page_cache.c      |    6 +++---
 fs/reiser4/page_cache.h      |    2 +-
 fs/reiser4/txnmgr.h          |    2 +-
 fs/reiser4/znode.c           |    6 +++---
 fs/reiser4/znode.h           |    6 +++---
 11 files changed, 24 insertions(+), 24 deletions(-)

Index: linux-2.6-mm/fs/reiser4/jnode.c
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/jnode.c
+++ linux-2.6-mm/fs/reiser4/jnode.c
@@ -788,7 +788,7 @@ static inline int jparse(jnode * node)
 
 /* Lock a page attached to jnode, create and attach page to jnode if it had no
  * one. */
-struct page *jnode_get_page_locked(jnode * node, int gfp_flags)
+struct page *jnode_get_page_locked(jnode * node, gfp_t gfp_flags)
 {
 	struct page *page;
 
@@ -867,7 +867,7 @@ void jload_prefetch(jnode * node)
 
 /* load jnode's data into memory */
 int jload_gfp(jnode * node /* node to load */ ,
-	      int gfp_flags /* allocation flags */ ,
+	      gfp_t gfp_flags /* allocation flags */ ,
 	      int do_kmap /* true if page should be kmapped */ )
 {
 	struct page *page;
@@ -963,7 +963,7 @@ int jstartio(jnode * node)
 
 /* Initialize a node by calling appropriate plugin instead of reading
  * node from disk as in jload(). */
-int jinit_new(jnode * node, int gfp_flags)
+int jinit_new(jnode * node, gfp_t gfp_flags)
 {
 	struct page *page;
 	int result;
Index: linux-2.6-mm/fs/reiser4/jnode.h
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/jnode.h
+++ linux-2.6-mm/fs/reiser4/jnode.h
@@ -373,7 +373,7 @@ jnode *find_get_jnode(reiser4_tree * tre
 		      unsigned long index);
 
 void unhash_unformatted_jnode(jnode *);
-struct page *jnode_get_page_locked(jnode *, int gfp_flags);
+struct page *jnode_get_page_locked(jnode *, gfp_t gfp_flags);
 extern jnode *page_next_jnode(jnode * node) NONNULL;
 extern void jnode_init(jnode * node, reiser4_tree * tree, jnode_type) NONNULL;
 extern void jnode_make_dirty(jnode * node) NONNULL;
@@ -519,14 +519,14 @@ static inline void jnode_set_reloc(jnode
 
 /* jload/jwrite/junload give a bread/bwrite/brelse functionality for jnodes */
 
-extern int jload_gfp(jnode * node, int gfp, int do_kmap) NONNULL;
+extern int jload_gfp(jnode * node, gfp_t gfp, int do_kmap) NONNULL;
 
 static inline int jload(jnode * node)
 {
 	return jload_gfp(node, GFP_KERNEL, 1);
 }
 
-extern int jinit_new(jnode * node, int gfp_flags) NONNULL;
+extern int jinit_new(jnode * node, gfp_t gfp_flags) NONNULL;
 extern int jstartio(jnode * node) NONNULL;
 
 extern void jdrop(jnode * node) NONNULL;
Index: linux-2.6-mm/fs/reiser4/page_cache.h
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/page_cache.h
+++ linux-2.6-mm/fs/reiser4/page_cache.h
@@ -32,7 +32,7 @@ static inline void lock_and_wait_page_wr
 
 #define jprivate(page) ((jnode *)page_private(page))
 
-extern int page_io(struct page *page, jnode * node, int rw, int gfp);
+extern int page_io(struct page *page, jnode * node, int rw, gfp_t gfp);
 extern void drop_page(struct page *page);
 extern void reiser4_invalidate_pages(struct address_space *, pgoff_t from,
 				     unsigned long count, int even_cows);
Index: linux-2.6-mm/fs/reiser4/carry.c
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/carry.c
+++ linux-2.6-mm/fs/reiser4/carry.c
@@ -180,7 +180,7 @@ typedef enum {
 static int carry_level_invariant(carry_level * level, carry_queue_state state);
 #endif
 
-static int perthread_pages_reserve(int nrpages, int gfp)
+static int perthread_pages_reserve(int nrpages, gfp_t gfp)
 {
 	return 0;
 }
Index: linux-2.6-mm/fs/reiser4/emergency_flush.c
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/emergency_flush.c
+++ linux-2.6-mm/fs/reiser4/emergency_flush.c
@@ -248,7 +248,7 @@
 
 static int flushable(jnode * node, struct page *page, int);
 static int needs_allocation(const jnode * node);
-static eflush_node_t *ef_alloc(unsigned int flags);
+static eflush_node_t *ef_alloc(gfp_t flags);
 static reiser4_ba_flags_t ef_block_flags(const jnode * node);
 static int ef_free_block(jnode * node, const reiser4_block_nr * blk,
 			 block_stage_t stage, eflush_node_t * ef);
@@ -519,7 +519,7 @@ void eflush_done_at(struct super_block *
 	ef_hash_done(&get_super_private(super)->efhash_table);
 }
 
-static eflush_node_t *ef_alloc(unsigned int flags)
+static eflush_node_t *ef_alloc(gfp_t flags)
 {
 	return kmem_cache_alloc(eflush_slab, flags);
 }
Index: linux-2.6-mm/fs/reiser4/flush_queue.c
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/flush_queue.c
+++ linux-2.6-mm/fs/reiser4/flush_queue.c
@@ -137,7 +137,7 @@ void done_fqs(void)
 }
 
 /* create new flush queue object */
-static flush_queue_t *create_fq(unsigned int gfp)
+static flush_queue_t *create_fq(gfp_t gfp)
 {
 	flush_queue_t *fq;
 
@@ -539,7 +539,7 @@ int write_fq(flush_queue_t * fq, long *n
    atom lock is obtained by different ways in different parts of reiser4,
    usually it is current atom, but we need a possibility for getting fq for the
    atom of given jnode. */
-static int fq_by_atom_gfp(txn_atom *atom, flush_queue_t **new_fq, int gfp)
+static int fq_by_atom_gfp(txn_atom *atom, flush_queue_t **new_fq, gfp_t gfp)
 {
 	flush_queue_t *fq;
 
@@ -649,7 +649,7 @@ void init_atom_fq_parts(txn_atom *atom)
 /* get a flush queue for an atom pointed by given jnode (spin-locked) ; returns
  * both atom and jnode locked and found and took exclusive access for flush
  * queue object.  */
-int fq_by_jnode_gfp(jnode * node, flush_queue_t ** fq, int gfp)
+int fq_by_jnode_gfp(jnode * node, flush_queue_t ** fq, gfp_t gfp)
 {
 	txn_atom *atom;
 	int ret;
Index: linux-2.6-mm/fs/reiser4/page_cache.c
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/page_cache.c
+++ linux-2.6-mm/fs/reiser4/page_cache.c
@@ -184,7 +184,7 @@
 #include <linux/writeback.h>
 #include <linux/blkdev.h>
 
-static struct bio *page_bio(struct page *, jnode *, int rw, unsigned int gfp);
+static struct bio *page_bio(struct page *, jnode *, int rw, gfp_t gfp);
 
 static struct address_space_operations formatted_fake_as_ops;
 
@@ -370,7 +370,7 @@ formatted_readpage(struct file *f UNUSED
  *
  * Submits single page read or write.
  */
-int page_io(struct page *page, jnode *node, int rw, int gfp)
+int page_io(struct page *page, jnode *node, int rw, gfp_t gfp)
 {
 	struct bio *bio;
 	int result;
@@ -405,7 +405,7 @@ int page_io(struct page *page, jnode *no
 
 /* helper function to construct bio for page */
 static struct bio *page_bio(struct page *page, jnode * node, int rw,
-			    unsigned int gfp)
+			    gfp_t gfp)
 {
 	struct bio *bio;
 	assert("nikita-2092", page != NULL);
Index: linux-2.6-mm/fs/reiser4/txnmgr.h
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/txnmgr.h
+++ linux-2.6-mm/fs/reiser4/txnmgr.h
@@ -663,7 +663,7 @@ struct flush_queue {
 };
 
 extern int fq_by_atom(txn_atom *, flush_queue_t **);
-extern int fq_by_jnode_gfp(jnode *, flush_queue_t **, int);
+extern int fq_by_jnode_gfp(jnode *, flush_queue_t **, gfp_t);
 extern void fq_put_nolock(flush_queue_t *);
 extern void fq_put(flush_queue_t *);
 extern void fuse_fq(txn_atom * to, txn_atom * from);
Index: linux-2.6-mm/fs/reiser4/znode.c
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/znode.c
+++ linux-2.6-mm/fs/reiser4/znode.c
@@ -307,7 +307,7 @@ void znodes_tree_done(reiser4_tree * tre
 /* ZNODE STRUCTURES */
 
 /* allocate fresh znode */
-znode *zalloc(unsigned int gfp_flag /* allocation flag */ )
+znode *zalloc(gfp_t gfp_flag /* allocation flag */ )
 {
 	znode *node;
 
@@ -464,7 +464,7 @@ static z_hash_table *znode_get_htable(co
 */
 znode *zget(reiser4_tree * tree,
 	    const reiser4_block_nr * const blocknr,
-	    znode * parent, tree_level level, int gfp_flag)
+	    znode * parent, tree_level level, gfp_t gfp_flag)
 {
 	znode *result;
 	__u32 hashi;
@@ -641,7 +641,7 @@ int zload(znode * node)
 }
 
 /* call node plugin to initialise newly allocated node. */
-int zinit_new(znode * node /* znode to initialise */ , int gfp_flags)
+int zinit_new(znode * node /* znode to initialise */ , gfp_t gfp_flags)
 {
 	return jinit_new(ZJNODE(node), gfp_flags);
 }
Index: linux-2.6-mm/fs/reiser4/znode.h
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/znode.h
+++ linux-2.6-mm/fs/reiser4/znode.h
@@ -166,11 +166,11 @@ ON_DEBUG(extern atomic_t delim_key_versi
 #define	ZF_ISSET(p,f)	        JF_ISSET(ZJNODE(p), (f))
 #define	ZF_SET(p,f)		JF_SET  (ZJNODE(p), (f))
 extern znode *zget(reiser4_tree * tree, const reiser4_block_nr * const block,
-		   znode * parent, tree_level level, int gfp_flag);
+		   znode * parent, tree_level level, gfp_t gfp_flag);
 extern znode *zlook(reiser4_tree * tree, const reiser4_block_nr * const block);
 extern int zload(znode * node);
 extern int zload_ra(znode * node, ra_info_t * info);
-extern int zinit_new(znode * node, int gfp_flags);
+extern int zinit_new(znode * node, gfp_t gfp_flags);
 extern void zrelse(znode * node);
 extern void znode_change_parent(znode * new_parent, reiser4_block_nr * block);
 
@@ -226,7 +226,7 @@ extern int znode_contains_key(znode * no
 extern int znode_contains_key_lock(znode * node, const reiser4_key * key);
 extern unsigned znode_save_free_space(znode * node);
 extern unsigned znode_recover_free_space(znode * node);
-extern znode *zalloc(unsigned int gfp_flag);
+extern znode *zalloc(gfp_t gfp_flag);
 extern void zinit(znode *, const znode * parent, reiser4_tree *);
 extern int zparse(znode * node);
 
Index: linux-2.6-mm/fs/reiser4/fsdata.c
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/fsdata.c
+++ linux-2.6-mm/fs/reiser4/fsdata.c
@@ -32,7 +32,7 @@ static void kill_cursor(dir_cursor *);
  * Shrinks d_cursor_cache. Scan LRU list of unused cursors, freeing requested
  * number. Return number of still freeable cursors.
  */
-static int d_cursor_shrink(int nr, unsigned int mask)
+static int d_cursor_shrink(int nr, gfp_t mask)
 {
 	if (nr != 0) {
 		dir_cursor *scan;

--

