From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] various allocator optimizations
Date: 13 Mar 2003 10:59:12 -0500
Message-ID: <1047571151.8219.956.camel@tiny.suse.com>
References: <1047400482.8215.312.camel@tiny.suse.com>
	 <20030311194205.A4493@namesys.com>
	 <1047499021.8219.604.camel@tiny.suse.com>  <3E6F9DE3.2070902@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13244-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E6F9DE3.2070902@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

On Wed, 2003-03-12 at 15:51, Hans Reiser wrote:
> Chris Mason wrote:
> 
> >[ dirid based grouping spreads things out too much on the disk ]
> >
> >The btree already has a metric for grouping, it's the packing locality. 
> >I realized this morning that we just aren't being very smart about how
> >we use it.  If one directory has 1 thousand subdirs with 1 file each,
> >should they all be in different packing localities? 
> >
> > probably not.
> >
> I would also like an API for letting users/apps choose packing 
> localities, that way an rpm package can all go into the same packing 
> locality even though semantically it scatters files across ten 
> directories.  What do you think?
> 
More knobs for the admin are good, something like setattr
INHERIT_PACKING dir

> >
> >So I played around with the patch below, it tries to define a span over
> >which a given packing locality used.  When new files or directories are
> >created, their packing locality is chosen based on how much of the tree
> >the packing locality of their parent directory is using.
> >
> This is cool.  Good heuristic!

Ok, more testing showed that patch wasn't bad, but wasn't great either. 
Under a multiprocess test, the buffers in the path would get moved away
and there wasn't enough data to make a good decision.  So the patch
below changes things around a little, and records the span during
search_by_key instead of trying to compute it after the search is over.

The end result is that if the keys in level 3 or higher of the tree have
the same packing locality in adjacent keys, we use the dirid as the
packing locality.  Otherwise we reuse the parent directory packing
locality.

On a 100MB subset of /usr/share/doc, this results in 4 packing
localities for 737 directories.  In combination with the dirid grouping
allocator, it does a nice job of preventing fragmentation in the
multi-writer and deletion cases.

The results are really interesting.  For reading a fresh copy of /usr,
skip_busy alone needs 1m50s.  dirid_groups needs 2m40s and the packing
locality code brings that down to 2m10s.  Not too bad against
skip_busy's best case.

When I use 10 procs to fill a directory tree, (~1GB of data total),
skip_busy alone needs 3m7s to read it, and the external fragmentation is
10%.

If I run the same test with the new packing locality code +
dirid_groups, it only takes 2m to read it and the fragmentation is 3%.

In other words, I think this is a really good compromise between the
current defaults and a more optimal case for fragmentation, and I expect
its performance to hold up much better as the filesystem ages.

The patch is below against 2.4.21-pre is below.  It should be considered
extremely risky and is really only meant for review by those interested.

(note, this changes the default mount alloc option to dirid_groups + 5%
border + skip_busy)

--- 1.18/fs/reiserfs/bitmap.c	Thu Sep 12 04:39:21 2002
+++ edited/fs/reiserfs/bitmap.c	Thu Mar 13 10:18:37 2003
@@ -33,6 +33,8 @@
 #define  _ALLOC_hashed_formatted_nodes 7
 #define  _ALLOC_old_way 8
 #define  _ALLOC_hundredth_slices 9
+#define  _ALLOC_dirid_groups 10
+#define  _ALLOC_oid_groups 11
 
 #define  concentrating_formatted_nodes(s)     test_bit(_ALLOC_concentrating_formatted_nodes, &SB_ALLOC_OPTS(s))
 #define  displacing_large_files(s)            test_bit(_ALLOC_displacing_large_files, &SB_ALLOC_OPTS(s))
@@ -260,8 +262,18 @@
     get_bit_address (s, *start, &bm, &off);
     get_bit_address (s, finish, &end_bm, &end_off);
 
-    // With this option set first we try to find a bitmap that is at least 10%
-    // free, and if that fails, then we fall back to old whole bitmap scanning
+    /* When the bitmap is more than 10% free, anyone can allocate.
+     * When it's less than 10% free, only files that already use the
+     * bitmap are allowed. Once we pass 80% full, this restriction
+     * is lifted.
+     *
+     * We do this so that files that grow later still have space close to
+     * their original allocation. This improves locality, and presumably
+     * performance as a result.
+     *
+     * This is only an allocation policy and does not make up for getting a
+     * bad hint. Decent hinting must be implemented for this to work well.
+     */
     if ( TEST_OPTION(skip_busy, s) && SB_FREE_BLOCKS(s) > SB_BLOCK_COUNT(s)/20 ) {
 	for (;bm < end_bm; bm++, off = 0) {
 	    if ( ( off && (!unfm || (file_block != 0))) || SB_AP_BITMAP(s)[bm].free_count > (s->s_blocksize << 3) / 10 )
@@ -392,6 +404,16 @@
   }
 }
 
+void reiserfs_init_alloc_options (struct super_block *s)
+{
+    set_bit (_ALLOC_concentrating_formatted_nodes, &SB_ALLOC_OPTS(s));
+    set_bit (_ALLOC_skip_busy, &SB_ALLOC_OPTS(s));
+    set_bit (_ALLOC_dirid_groups, &SB_ALLOC_OPTS(s));
+    s->u.reiserfs_sb.s_alloc_options.border = 20;
+
+    reiserfs_warning ("allocator defaults = [%08x]\n", SB_ALLOC_OPTS(s));
+}
+
 /* block allocator related options are parsed here */
 int reiserfs_parse_alloc_options(struct super_block * s, char * options)
 {
@@ -435,6 +457,15 @@
 	    continue;
 	}
 
+        if (!strcmp(this_char, "dirid_groups")) {
+	    SET_OPTION(dirid_groups);
+	    continue;
+        }
+        if (!strcmp(this_char, "oid_groups")) {
+	    SET_OPTION(oid_groups);
+	    continue;
+        }
+
 	if (!strcmp(this_char, "hashed_formatted_nodes")) {
 	    SET_OPTION(hashed_formatted_nodes);
 	    continue;
@@ -476,6 +507,7 @@
 	return 1;
     }
 
+    reiserfs_warning ("allocator options = [%08x]\n", SB_ALLOC_OPTS(s));
     return 0;
 }
 
@@ -498,17 +530,87 @@
     hint->search_start = hint->beg + keyed_hash(hash_in, 4) % (hint->end - hint->beg);
 }
 
-static void inline get_left_neighbor(reiserfs_blocknr_hint_t *hint)
+/* 
+ * Relocation based on dirid, hashing them into a given bitmap block
+ * files. Formatted nodes are unaffected, a seperate policy covers them 
+ */
+static void 
+dirid_groups (reiserfs_blocknr_hint_t *hint)
+{
+    if (hint->inode) {
+        char * hash_in = NULL;
+	unsigned long hash;
+	unsigned long mask;
+	__u32 dirid;
+
+	/* effectively turns the disk in 64MB groups (4k blocksize), 
+	 * but the bigger your disk is the less likely hash collisions
+	 * are, leading to dynamically bigger groups based on 
+	 * your disk size
+	 */
+	dirid = le32_to_cpu(INODE_PKEY(hint->inode)->k_dir_id);
+	/* keep the root dir and it's first set of subdirs close to
+	 * the start of the disk
+	 */
+	if (dirid <= 2) {
+	    hash = 0;
+	} else {
+	    hash_in = (char *)(&dirid);
+	    hash = keyed_hash(hash_in, 4);
+	}
+	mask = (hint->inode->i_sb->s_blocksize << 2) - 1;
+	hash = hint->beg + hash % (hint->end - hint->beg);
+	hash &= ~mask;
+
+	hint->search_start = hash;
+    }
+}
+
+/* 
+ * Relocation based on oid, hashing them into a given bitmap block
+ * files. Formatted nodes are unaffected, a seperate policy covers them 
+ */
+static void 
+oid_groups (reiserfs_blocknr_hint_t *hint)
+{
+    if (hint->inode) {
+        char * hash_in = NULL;
+	unsigned long hash;
+	unsigned long mask;
+	__u32 oid;
+
+	oid = le32_to_cpu(INODE_PKEY(hint->inode)->k_objectid);
+	hash_in = (char *)(&oid);
+
+	/* effectively turns the disk in 64MB groups (4k blocksize), 
+	 * but the bigger your disk is the less likely hash collisions
+	 * are, leading to dynamically bigger groups based on 
+	 * your disk size
+	 */
+	mask = (hint->inode->i_sb->s_blocksize << 2) - 1;
+	hash = keyed_hash(hash_in, 4);
+	hash = hint->beg + hash % (hint->end - hint->beg);
+	hash &= ~mask;
+
+	hint->search_start = hash;
+    }
+}
+
+/* returns 1 if it finds an indirect item and gets valid hint info
+ * from it, otherwise 0
+ */
+static int get_left_neighbor(reiserfs_blocknr_hint_t *hint)
 {
     struct path * path;
     struct buffer_head * bh;
     struct item_head * ih;
     int pos_in_item;
     __u32 * item;
+    int ret = 0;
 
     if (!hint->path)		/* reiserfs code can call this function w/o pointer to path
 				 * structure supplied; then we rely on supplied search_start */
-	return;
+	return 0;
 
     path = hint->path;
     bh = get_last_bh(path);
@@ -529,6 +631,7 @@
 	    int t=get_block_num(item,pos_in_item);
 	    if (t) {
 		hint->search_start = t;
+		ret = 1;
 		break;
 	    }
 	    pos_in_item --;
@@ -537,7 +640,7 @@
     }
 
     /* does result value fit into specified region? */
-    return;
+    return ret;
 }
 
 /* should be, if formatted node, then try to put on first part of the device
@@ -640,6 +743,7 @@
     struct super_block *s = hint->th->t_super;
     hint->beg = 0;
     hint->end = SB_BLOCK_COUNT(s) - 1;
+    int unfm_hint;
 
     /* This is former border algorithm. Now with tunable border offset */
     if (concentrating_formatted_nodes(s))
@@ -668,19 +772,14 @@
 	return;
     }
 
-    /* attempt to copy a feature from old block allocator code */
-    if (TEST_OPTION(old_hashed_relocation, s) && !hint->formatted_node) {
-	old_hashed_relocation(hint);
-    }
-
     /* if none of our special cases is relevant, use the left neighbor in the
        tree order of the new node we are allocating for */
     if (hint->formatted_node && TEST_OPTION(hashed_formatted_nodes,s)) {
-	hash_formatted_node(hint);
+        hash_formatted_node(hint);
 	return;
-    } 
+    }
 
-    get_left_neighbor(hint);
+    unfm_hint = get_left_neighbor(hint);
 
     /* Mimic old block allocator behaviour, that is if VFS allowed for preallocation,
        new blocks are displaced based on directory ID. Also, if suggested search_start
@@ -705,10 +804,29 @@
 	return;
     }
 
-    if (TEST_OPTION(old_hashed_relocation, s))
+    /* old_hashed_relocation only works on unformatted */
+    if (!unfm_hint && !hint->formatted_node &&
+        TEST_OPTION(old_hashed_relocation, s))
+    {
 	old_hashed_relocation(hint);
-    if (TEST_OPTION(new_hashed_relocation, s))
+    }
+    /* new_hashed_relocation works with both formatted/unformatted nodes */
+    if ((!unfm_hint || hint->formatted_node) &&
+        TEST_OPTION(new_hashed_relocation, s))
+    {
 	new_hashed_relocation(hint);
+    }
+    /* dirid grouping works only on unformatted nodes */
+    if (!unfm_hint && !hint->formatted_node && TEST_OPTION(dirid_groups,s))
+    {
+        dirid_groups(hint);
+    }
+
+    /* oid grouping works only on unformatted nodes */
+    if (!unfm_hint && !hint->formatted_node && TEST_OPTION(oid_groups,s))
+    {
+        oid_groups(hint);
+    }
     return;
 }
 
@@ -772,28 +890,35 @@
     struct super_block *s = hint->th->t_super;
     b_blocknr_t start = hint->search_start;
     b_blocknr_t finish = SB_BLOCK_COUNT(s) - 1;
-    int second_pass = 0;
+    int passno = 0;
     int nr_allocated = 0;
 
     determine_prealloc_size(hint);
-    while((nr_allocated
-	  += allocate_without_wrapping_disk(hint, new_blocknrs + nr_allocated, start, finish,
-					  amount_needed - nr_allocated, hint->prealloc_size))
-	  < amount_needed) {
-
-	/* not all blocks were successfully allocated yet*/
-	if (second_pass) {	/* it was a second pass; we must free all blocks */
+    do {
+	switch (passno++) {
+        case 0: /* Search from hint->search_start to end of disk */
+            start = hint->search_start;
+            finish = SB_BLOCK_COUNT(s) - 1;
+            break;
+        case 1: /* Search from hint->beg to hint->search_start */
+            start = hint->beg;
+            finish = hint->search_start;
+            break;
+        case 2: /* Last chance: Search from 0 to hint->beg */
+            start = 0;
+            finish = hint->beg;
+	    break;
+        default: /* We've tried searching everywhere, not enough space */
+	    /* not all blocks were successfully allocated yet*/
 	    while (nr_allocated --)
 		reiserfs_free_block(hint->th, new_blocknrs[nr_allocated]);
 
 	    return NO_DISK_SPACE;
-	} else {		/* refine search parameters for next pass */
-	    second_pass = 1;
-	    finish = start;
-	    start = 0;
-	    continue;
-	}
-    }
+        }
+    } while((nr_allocated += allocate_without_wrapping_disk(hint, 
+                          new_blocknrs + nr_allocated, start, finish,
+			  amount_needed - nr_allocated, hint->prealloc_size)) 
+			  < amount_needed) ;
     return CARRY_ON;
 }
 
--- 1.41/fs/reiserfs/inode.c	Mon Jan 20 05:19:30 2003
+++ edited/fs/reiserfs/inode.c	Thu Mar 13 10:17:09 2003
@@ -1485,6 +1485,8 @@
     struct cpu_key key;
     struct item_head ih;
     struct stat_data sd;
+    __u32 packing;
+    __u32 checked_packing = 0;
     int retval;
     int err ;
   
@@ -1503,7 +1505,8 @@
 	    inode -> i_flags &= ~ ( S_IMMUTABLE | S_APPEND );
 
     /* item head of new item */
-    ih.ih_key.k_dir_id = INODE_PKEY (dir)->k_objectid;
+    packing = INODE_PKEY(dir)->k_dir_id;
+    ih.ih_key.k_dir_id = packing;
     ih.ih_key.k_objectid = cpu_to_le32 (reiserfs_get_unused_objectid (th));
     if (!ih.ih_key.k_objectid) {
 	err = -ENOMEM ;
@@ -1541,6 +1544,7 @@
     else
 	make_le_item_head (&ih, 0, KEY_FORMAT_3_6, SD_OFFSET, TYPE_STAT_DATA, SD_SIZE, MAX_US_INT);
 
+packing_restart:
     /* key to search for correct place for new stat data */
     _make_cpu_key (&key, KEY_FORMAT_3_6, le32_to_cpu (ih.ih_key.k_dir_id),
 		   le32_to_cpu (ih.ih_key.k_objectid), SD_OFFSET, TYPE_STAT_DATA, 3/*key length*/);
@@ -1555,6 +1559,14 @@
 	pathrelse (&path_to_key);
 	err = -EEXIST;
 	goto out_bad_inode;
+    }
+    if (!checked_packing) {
+	checked_packing = choose_packing(dir, &path_to_key);
+	if (checked_packing != packing) {
+	    ih.ih_key.k_dir_id = checked_packing;
+	    pathrelse(&path_to_key);
+	    goto packing_restart;
+	}
     }
 
     if (old_format_only (sb)) {
--- 1.20/fs/reiserfs/stree.c	Fri Aug  9 11:22:33 2002
+++ edited/fs/reiserfs/stree.c	Thu Mar 13 10:16:06 2003
@@ -298,6 +298,47 @@
 /* Maximal possible key. It is never in the tree. */
 const struct key  MAX_KEY = {0xffffffff, 0xffffffff, {{0xffffffff, 0xffffffff},}};
 
+static int packing_locality_span(struct super_block *sb, 
+                                 struct path *path, __u32 cpu_packing) 
+{
+    int path_offset;
+    int pos;
+    struct buffer_head *bh;
+    struct key *key;
+
+    path_offset = path->path_length;
+    pos = PATH_OFFSET_POSITION(path, path_offset); 
+    bh = PATH_OFFSET_PBUFFER(path, path_offset);
+
+    if (pos) {
+	/* check left */
+	key = B_N_PDELIM_KEY(bh, pos - 1);
+	if (le32_to_cpu(key->k_dir_id) != cpu_packing) {
+	    return 0;
+	}
+    }
+    if (pos != B_NR_ITEMS(bh)) {
+	key = B_N_PDELIM_KEY(bh, pos + 1);
+	if (le32_to_cpu(key->k_dir_id) != cpu_packing) {
+	    return 0;
+	}
+    }
+    return 1;
+}
+
+/* returns an le32 packing locality */
+__u32 choose_packing(struct inode *parent, struct path *path)
+{
+    __u32 grandparent;
+    int levels = path->span;
+
+    grandparent = le32_to_cpu(INODE_PKEY(parent)->k_dir_id);
+
+    if (levels <= (DISK_LEAF_NODE_LEVEL + 1)) {
+        return INODE_PKEY(parent)->k_dir_id;
+    }
+    return INODE_PKEY(parent)->k_objectid;
+}
 
 /* Get delimiting key of the buffer by looking for it in the buffers in the path, starting from the bottom
    of the path, and going upwards.  We must check the path's validity at each step.  If the key is not in
@@ -757,6 +807,16 @@
 	/* ok, we have acquired next formatted node in the tree */
 	n_node_level = B_LEVEL (p_s_bh);
 
+	if (n_node_level != DISK_LEAF_NODE_LEVEL &&
+	    !packing_locality_span(p_s_sb, p_s_search_path, 
+	                           p_s_key->on_disk_key.k_dir_id)) 
+        {
+	    /* span is the deepest level in the tree where the same packing
+	     * locality wasn't found in the adjacent pointers
+	     */
+	    p_s_search_path->span = n_node_level;
+	}
+
 	PROC_INFO_BH_STAT( p_s_sb, p_s_bh, n_node_level - 1 );
 
 	RFALSE( n_node_level < n_stop_level,
--- 1.27/fs/reiserfs/super.c	Wed Oct 30 11:42:36 2002
+++ edited/fs/reiserfs/super.c	Tue Mar 11 10:49:36 2003
@@ -1121,17 +1121,16 @@
     int old_magic;
     struct reiserfs_super_block * rs;
 
-
     memset (&s->u.reiserfs_sb, 0, sizeof (struct reiserfs_sb_info));
 
     /* Set default values for options: non-aggressive tails */
     s->u.reiserfs_sb.s_mount_opt = ( 1 << REISERFS_SMALLTAIL );
-    /* default block allocator option: skip_busy */
-    s->u.reiserfs_sb.s_alloc_options.bits = ( 1 << 5);
     /* If file grew past 4 blocks, start preallocation blocks for it. */
     s->u.reiserfs_sb.s_alloc_options.preallocmin = 4;
     /* Preallocate by 8 blocks (9-1) at once */
     s->u.reiserfs_sb.s_alloc_options.preallocsize = 9;
+    /* setup default block allocator options */
+    reiserfs_init_alloc_options(s);
 
     if (reiserfs_parse_options (s, (char *) data, &(s->u.reiserfs_sb.s_mount_opt), &blocks) == 0) {
 	return NULL;
===== include/linux/reiserfs_fs.h 1.26 vs edited =====
--- 1.26/include/linux/reiserfs_fs.h	Mon Jan 20 05:19:30 2003
+++ edited/include/linux/reiserfs_fs.h	Thu Mar 13 10:16:06 2003
@@ -1106,6 +1106,7 @@
   int                   path_length;                      	/* Length of the array above.   */
   struct  path_element  path_elements[EXTENDED_MAX_HEIGHT];	/* Array of the path elements.  */
   int			pos_in_item;
+  int			span;
 };
 
 #define pos_in_item(path) ((path)->pos_in_item)
@@ -1684,6 +1685,7 @@
 								const struct cpu_key * p_s_cpu_key, 
 								struct path * p_s_search_path);
 extern inline void decrement_bcount (struct buffer_head * p_s_bh);
+__u32 choose_packing(struct inode *, struct path *);
 void decrement_counters_in_path (struct path * p_s_search_path);
 void pathrelse (struct path * p_s_search_path);
 int reiserfs_check_path(struct path *p) ;
@@ -1953,6 +1955,7 @@
 typedef struct __reiserfs_blocknr_hint reiserfs_blocknr_hint_t;
 
 int reiserfs_parse_alloc_options (struct super_block *, char *);
+void reiserfs_init_alloc_options (struct super_block *s);
 int is_reusable (struct super_block * s, unsigned long block, int bit_value);
 void reiserfs_free_block (struct reiserfs_transaction_handle *th, unsigned long);
 int reiserfs_allocate_blocknrs(reiserfs_blocknr_hint_t *, b_blocknr_t * , int, int);






