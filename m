From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680, minor corruptions
Date: Fri, 27 Jun 2003 20:13:44 +0400
Message-ID: <20030627161344.GA13908@namesys.com>
References: <20030625054031.GA11576@namesys.com> <3EF9A0F6.4030401@g-house.de> <3EF9E939.1050501@g-house.de> <20030626092608.GA12252@namesys.com> <3EFAE933.6040206@g-house.de> <20030627092821.GA29715@namesys.com> <3EFC361A.4030009@g-house.de> <20030627122556.GA8753@namesys.com> <3EFC396A.7080808@g-house.de> <20030627123800.GA9214@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <reiserfs-list-return-14739-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030627123800.GA9214@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

On Fri, Jun 27, 2003 at 04:38:00PM +0400, Oleg Drokin wrote:

> I was looking in the wrong direction, when I produced that patch,
> so it will produce zero output.
> I hope to come up with ultimate fix soon enough. ;)

Well, there is a patch below that does *not* work for me ;)
But it should work.
I have traced the new problem to a cross compiler that compiles
code in a different way than native compiler for whatever reason
(demo is attached as test.c program, it should print "result is 1"
in case it is compiled correctly and stuff about unknown
uniqueness if it is miscompiled. In fact may be this is just correct compiler behaviour.)
I now think that when I compile a kernel with native compiler, it should work
with below patch. But I can verify that only tomorrow it seems.
You might try that patch as well to see if it helps you before I try it ;)
The patch is "obviously correct" one. (except that it does not work
with my cross compiler and kernel does work without patch which is really-really strange).

===== fs/reiserfs/bitmap.c 1.26 vs edited =====
--- 1.26/fs/reiserfs/bitmap.c	Sun May 18 01:09:36 2003
+++ edited/fs/reiserfs/bitmap.c	Fri Jun 27 16:58:44 2003
@@ -43,7 +43,7 @@
     test_bit(_ALLOC_ ## optname , &SB_ALLOC_OPTS(s))
 
 static inline void get_bit_address (struct super_block * s,
-				    unsigned long block, int * bmap_nr, int * offset)
+				    b_blocknr_t block, int * bmap_nr, int * offset)
 {
     /* It is in the bitmap block number equal to the block
      * number divided by the number of bits in a block. */
@@ -54,7 +54,7 @@
 }
 
 #ifdef CONFIG_REISERFS_CHECK
-int is_reusable (struct super_block * s, unsigned long block, int bit_value)
+int is_reusable (struct super_block * s, b_blocknr_t block, int bit_value)
 {
     int i, j;
 
@@ -107,7 +107,7 @@
 static inline  int is_block_in_journal (struct super_block * s, int bmap, int
 off, int *next)
 {
-    unsigned long tmp;
+    b_blocknr_t tmp;
 
     if (reiserfs_in_journal (s, bmap, off, 1, &tmp)) {
 	if (tmp) {              /* hint supplied */
@@ -235,7 +235,7 @@
 /* Tries to find contiguous zero bit window (given size) in given region of
  * bitmap and place new blocks there. Returns number of allocated blocks. */
 static int scan_bitmap (struct reiserfs_transaction_handle *th,
-			unsigned long *start, unsigned long finish,
+			b_blocknr_t *start, b_blocknr_t finish,
 			int min, int max, int unfm, unsigned long file_block)
 {
     int nr_allocated=0;
@@ -281,7 +281,7 @@
 }
 
 static void _reiserfs_free_block (struct reiserfs_transaction_handle *th,
-				  unsigned long block)
+				  b_blocknr_t block)
 {
     struct super_block * s = th->t_super;
     struct reiserfs_super_block * rs;
@@ -327,7 +327,7 @@
 }
 
 void reiserfs_free_block (struct reiserfs_transaction_handle *th, 
-                          unsigned long block)
+                          b_blocknr_t block)
 {
     struct super_block * s = th->t_super;
 
@@ -340,7 +340,7 @@
 
 /* preallocated blocks don't need to be run through journal_mark_freed */
 void reiserfs_free_prealloc_block (struct reiserfs_transaction_handle *th, 
-                          unsigned long block) {
+                          b_blocknr_t block) {
     RFALSE(!th->t_super, "vs-4060: trying to free block on nonexistent device");
     RFALSE(is_reusable (th->t_super, block, 1) == 0, "vs-4070: can not free such block");
     _reiserfs_free_block(th, block) ;
@@ -589,15 +589,15 @@
 
 static inline int old_hashed_relocation (reiserfs_blocknr_hint_t * hint)
 {
-    unsigned long border;
-    unsigned long hash_in;
+    b_blocknr_t border;
+    u32 long hash_in;
     
     if (hint->formatted_node || hint->inode == NULL) {
 	return 0;
       }
 
     hash_in = le32_to_cpu((INODE_PKEY(hint->inode))->k_dir_id);
-    border = hint->beg + (unsigned long) keyed_hash(((char *) (&hash_in)), 4) % (hint->end - hint->beg - 1);
+    border = hint->beg + (u32) keyed_hash(((char *) (&hash_in)), 4) % (hint->end - hint->beg - 1);
     if (border > hint->search_start)
 	hint->search_start = border;
 
@@ -606,7 +606,7 @@
   
 static inline int old_way (reiserfs_blocknr_hint_t * hint)
 {
-    unsigned long border;
+    b_blocknr_t border;
     
     if (hint->formatted_node || hint->inode == NULL) {
 	return 0;
@@ -622,7 +622,7 @@
 static inline void hundredth_slices (reiserfs_blocknr_hint_t * hint)
 {
     struct key * key = &hint->key;
-    unsigned long slice_start;
+    b_blocknr_t slice_start;
 
     slice_start = (keyed_hash((char*)(&key->k_dir_id),4) % 100) * (hint->end / 100);
     if ( slice_start > hint->search_start || slice_start + (hint->end / 100) <= hint->search_start) {
@@ -910,7 +910,7 @@
 int reiserfs_can_fit_pages ( struct super_block *sb /* superblock of filesystem
 						       to estimate space */ )
 {
-	unsigned long space;
+	b_blocknr_t space;
 
 	spin_lock(&REISERFS_SB(sb)->bitmap_lock);
 	space = (SB_FREE_BLOCKS(sb) - REISERFS_SB(sb)->reserved_blocks) >> ( PAGE_CACHE_SHIFT - sb->s_blocksize_bits);
===== fs/reiserfs/do_balan.c 1.17 vs edited =====
--- 1.17/fs/reiserfs/do_balan.c	Sun May 18 01:09:35 2003
+++ edited/fs/reiserfs/do_balan.c	Fri Jun 27 17:07:28 2003
@@ -1250,12 +1250,12 @@
 
 static void free_thrown(struct tree_balance *tb) {
     int i ;
-    unsigned long blocknr ;
+    b_blocknr_t blocknr ;
     for (i = 0; i < sizeof (tb->thrown)/sizeof (tb->thrown[0]); i++) {
 	if (tb->thrown[i]) {
 	    blocknr = tb->thrown[i]->b_blocknr ;
 	    if (buffer_dirty (tb->thrown[i]))
-	      printk ("free_thrown deals with dirty buffer %ld\n", blocknr);
+	      printk ("free_thrown deals with dirty buffer %d\n", blocknr);
 	    brelse(tb->thrown[i]) ; /* incremented in store_thrown */
 	    reiserfs_free_block (tb->transaction_handle, blocknr);
 	}
@@ -1339,7 +1339,7 @@
 
 #ifdef CONFIG_REISERFS_CHECK
 
-int is_reusable (struct super_block * s, unsigned long block, int bit_value);
+int is_reusable (struct super_block * s, b_blocknr_t block, int bit_value);
 static void check_internal_node (struct super_block * s, struct buffer_head * bh, char * mes)
 {
   struct disk_child * dc;
===== fs/reiserfs/fix_node.c 1.28 vs edited =====
--- 1.28/fs/reiserfs/fix_node.c	Tue Sep  3 10:28:56 2002
+++ edited/fs/reiserfs/fix_node.c	Fri Jun 27 17:07:12 2003
@@ -758,7 +758,7 @@
             ) {
   struct buffer_head  * p_s_new_bh,
     		      *	p_s_Sh = PATH_H_PBUFFER (p_s_tb->tb_path, n_h);
-  unsigned long	      *	p_n_blocknr,
+  b_blocknr_t	      *	p_n_blocknr,
     			a_n_blocknrs[MAX_AMOUNT_NEEDED] = {0, };
   int       		n_counter,
    			n_number_of_freeblk,
@@ -879,7 +879,7 @@
             ) {
   struct buffer_head  * p_s_father, * left;
   struct super_block  * p_s_sb = p_s_tb->tb_sb;
-  unsigned long         n_left_neighbor_blocknr;
+  b_blocknr_t		n_left_neighbor_blocknr;
   int                   n_left_neighbor_position;
 
   if ( ! p_s_tb->FL[n_h] ) /* Father of the left neighbor does not exist. */
@@ -2501,7 +2501,7 @@
     /* deal with list of allocated (used and unused) nodes */
     for ( i = 0; i < MAX_FEB_SIZE; i++ ) {
 	if ( tb->FEB[i] ) {
-	    unsigned long blocknr  = tb->FEB[i]->b_blocknr ;
+	    b_blocknr_t blocknr  = tb->FEB[i]->b_blocknr ;
 	    /* de-allocated block which was not used by balancing and
                bforget about buffer for it */
 	    brelse (tb->FEB[i]);
===== fs/reiserfs/inode.c 1.78 vs edited =====
--- 1.78/fs/reiserfs/inode.c	Wed Jun  4 11:50:34 2003
+++ edited/fs/reiserfs/inode.c	Fri Jun 27 15:55:43 2003
@@ -506,7 +506,7 @@
 			struct buffer_head * bh_result, int create)
 {
     int repeat, retval;
-    b_blocknr_t allocated_block_nr = 0;// b_blocknr_t is unsigned long
+    b_blocknr_t allocated_block_nr = 0;// b_blocknr_t is (unsigned) 32 bit int
     INITIALIZE_PATH(path);
     int pos_in_item;
     struct cpu_key key;
===== fs/reiserfs/journal.c 1.69 vs edited =====
--- 1.69/fs/reiserfs/journal.c	Wed Jun  4 11:50:34 2003
+++ edited/fs/reiserfs/journal.c	Fri Jun 27 17:11:29 2003
@@ -507,7 +507,7 @@
 */
 int reiserfs_in_journal(struct super_block *p_s_sb,
                         int bmap_nr, int bit_nr, int search_all, 
-			unsigned long *next_zero_bit) {
+			b_blocknr_t *next_zero_bit) {
   struct reiserfs_journal_cnode *cn ;
   struct reiserfs_list_bitmap *jb ;
   int i ;
@@ -761,7 +761,7 @@
 */
 static struct reiserfs_journal_list *find_newer_jl_for_cn(struct reiserfs_journal_cnode *cn) {
   struct super_block *sb = cn->sb;
-  unsigned long blocknr = cn->blocknr ;
+  b_blocknr_t blocknr = cn->blocknr ;
 
   cn = cn->hprev ;
   while(cn) {
@@ -791,7 +791,7 @@
   while(cn) {
     if (cn->blocknr != 0) {
       if (debug) {
-        printk("block %lu, bh is %d, state %ld\n", cn->blocknr, cn->bh ? 1: 0, 
+        printk("block %u, bh is %d, state %ld\n", cn->blocknr, cn->bh ? 1: 0, 
 	        cn->state) ;
       }
       cn->state = 0 ;
@@ -1105,7 +1105,7 @@
 {
     struct reiserfs_journal_list *pjl ; /* previous list for this cn */
     struct reiserfs_journal_cnode *cn, *walk_cn ;
-    unsigned long blocknr ;
+    b_blocknr_t blocknr ;
     int run = 0 ;
     int orig_trans_id = jl->j_trans_id ;
     struct buffer_head *saved_bh ; 
@@ -2421,7 +2421,7 @@
 **
 ** returns 1 if it cleaned and relsed the buffer. 0 otherwise
 */
-static int remove_from_transaction(struct super_block *p_s_sb, unsigned long blocknr, int already_cleaned) {
+static int remove_from_transaction(struct super_block *p_s_sb, b_blocknr_t blocknr, int already_cleaned) {
   struct buffer_head *bh ;
   struct reiserfs_journal_cnode *cn ;
   int ret = 0;
@@ -2474,7 +2474,7 @@
 */
 static int can_dirty(struct reiserfs_journal_cnode *cn) {
   struct super_block *sb = cn->sb;
-  unsigned long blocknr = cn->blocknr  ;
+  b_blocknr_t blocknr = cn->blocknr  ;
   struct reiserfs_journal_cnode *cur = cn->hprev ;
   int can_dirty = 1 ;
   
@@ -2710,7 +2710,7 @@
 **
 ** Then remove it from the current transaction, decrementing any counters and filing it on the clean list.
 */
-int journal_mark_freed(struct reiserfs_transaction_handle *th, struct super_block *p_s_sb, unsigned long blocknr) {
+int journal_mark_freed(struct reiserfs_transaction_handle *th, struct super_block *p_s_sb, b_blocknr_t blocknr) {
   struct reiserfs_journal_cnode *cn = NULL ;
   struct buffer_head *bh = NULL ;
   struct reiserfs_list_bitmap *jb = NULL ;
@@ -2719,7 +2719,7 @@
   if (reiserfs_dont_log(th->t_super)) {
     bh = sb_find_get_block(p_s_sb, blocknr) ;
     if (bh && buffer_dirty (bh)) {
-      printk ("journal_mark_freed(dont_log): dirty buffer on hash list: %lx %ld\n", bh->b_state, blocknr);
+      printk ("journal_mark_freed(dont_log): dirty buffer on hash list: %lx %d\n", bh->b_state, blocknr);
       BUG ();
     }
     brelse (bh);
===== include/linux/reiserfs_fs.h 1.49 vs edited =====
--- 1.49/include/linux/reiserfs_fs.h	Wed Jun  4 11:50:34 2003
+++ edited/include/linux/reiserfs_fs.h	Fri Jun 27 17:01:42 2003
@@ -269,7 +269,7 @@
 #define NO_BALANCING_NEEDED  (-4)
 #define NO_MORE_UNUSED_CONTIGUOUS_BLOCKS (-5)
 
-typedef unsigned long b_blocknr_t;
+typedef __u32 b_blocknr_t;
 typedef __u32 unp_t;
 
 struct unfm_nodeinfo {
@@ -1730,11 +1730,11 @@
 int journal_end(struct reiserfs_transaction_handle *, struct super_block *, unsigned long) ;
 int journal_end_sync(struct reiserfs_transaction_handle *, struct super_block *, unsigned long) ;
 int journal_mark_dirty_nolog(struct reiserfs_transaction_handle *, struct super_block *, struct buffer_head *bh) ;
-int journal_mark_freed(struct reiserfs_transaction_handle *, struct super_block *, unsigned long blocknr) ;
+int journal_mark_freed(struct reiserfs_transaction_handle *, struct super_block *, b_blocknr_t blocknr) ;
 int push_journal_writer(char *w) ;
 int pop_journal_writer(int windex) ;
 int journal_transaction_should_end(struct reiserfs_transaction_handle *, int) ;
-int reiserfs_in_journal(struct super_block *p_s_sb, int bmap_nr, int bit_nr, int searchall, unsigned long *next) ;
+int reiserfs_in_journal(struct super_block *p_s_sb, int bmap_nr, int bit_nr, int searchall, b_blocknr_t *next) ;
 int journal_begin(struct reiserfs_transaction_handle *, struct super_block *p_s_sb, unsigned long) ;
 void flush_async_commits(struct super_block *p_s_sb) ;
 
@@ -2105,8 +2105,8 @@
 typedef struct __reiserfs_blocknr_hint reiserfs_blocknr_hint_t;
 
 int reiserfs_parse_alloc_options (struct super_block *, char *);
-int is_reusable (struct super_block * s, unsigned long block, int bit_value);
-void reiserfs_free_block (struct reiserfs_transaction_handle *th, unsigned long);
+int is_reusable (struct super_block * s, b_blocknr_t block, int bit_value);
+void reiserfs_free_block (struct reiserfs_transaction_handle *th, b_blocknr_t);
 int reiserfs_allocate_blocknrs(reiserfs_blocknr_hint_t *, b_blocknr_t * , int, int);
 extern inline int reiserfs_new_form_blocknrs (struct tree_balance * tb,
 					      b_blocknr_t *new_blocknrs, int amount_needed)
===== include/linux/reiserfs_fs_sb.h 1.23 vs edited =====
--- 1.23/include/linux/reiserfs_fs_sb.h	Wed Jun  4 11:50:34 2003
+++ edited/include/linux/reiserfs_fs_sb.h	Fri Jun 27 17:10:56 2003
@@ -133,7 +133,7 @@
 struct reiserfs_journal_cnode {
   struct buffer_head *bh ;		 /* real buffer head */
   struct super_block *sb ;		 /* dev of real buffer head */
-  unsigned long blocknr ;		 /* block number of real buffer head, == 0 when buffer on disk */		 
+  __u32 blocknr ;		 /* block number of real buffer head, == 0 when buffer on disk */		 
   long state ;
   struct reiserfs_journal_list *jlist ;  /* journal list this cnode lives in */
   struct reiserfs_journal_cnode *next ;  /* next in transaction list */

Bye,
    Oleg

--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="test.c"

#include <stdio.h>
#include <sys/types.h>
#define V1_DIRECT_UNIQUENESS 0xffffffff
#define V1_DIRENTRY_UNIQUENESS 500
#define V1_ANY_UNIQUENESS 555 // FIXME: comment is required
#define V1_INDIRECT_UNIQUENESS 0xfffffffe
#define V1_SD_UNIQUENESS 0

#define TYPE_STAT_DATA 0
#define TYPE_INDIRECT 1
#define TYPE_DIRECT 2
#define TYPE_DIRENTRY 3
#define TYPE_MAXTYPE 3
#define TYPE_ANY 15 // FIXME: comment is required

static inline int uniqueness2type (unsigned int uniqueness)
{
    switch (uniqueness) {
    case V1_SD_UNIQUENESS: return TYPE_STAT_DATA;
    case V1_INDIRECT_UNIQUENESS: return TYPE_INDIRECT;
    case V1_DIRECT_UNIQUENESS: return TYPE_DIRECT;
    case V1_DIRENTRY_UNIQUENESS: return TYPE_DIRENTRY;
    default:
printf("vs-500: unknown uniqueness %d\n", uniqueness);
return TYPE_ANY;
    }
}

int main(void)
{
unsigned int a=V1_INDIRECT_UNIQUENESS;
printf("result is %d\n", uniqueness2type(a));
return 0;
}

--Dxnq1zWXvFF0Q93v--
