From: Chris Mason <mason@suse.com>
Subject: [PATCH] various allocator optimizations
Date: 11 Mar 2003 11:34:43 -0500
Message-ID: <1047400482.8215.312.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-vtFZm2AflywkvWZ0TV3t"
Return-path: <reiserfs-list-return-13187-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-vtFZm2AflywkvWZ0TV3t
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello all,

There are 3 patches attached

group-alloc-4.diff	    # against 2.4.21-pre + data logging + quota
group-alloc-4-vanilla.diff  # against 2.4.21-pre

These two are block allocator ideas from Jeff Mahoney and I, it:

changes blocknrs_and_prealloc_arrays_from_search_start into three
passes.  pass1 goes from the hint to the end of the disk, pass2 goes
from the border to the hint, and pass3 goes from the start of the disk
to the border.

This was done because the old system would start over at the beginning
of the disk if the first pass failed, which would allocate data blocks
inside the border reserved for formatted nodes.

changes get_left_neighbor to return 1 if it finds a good block number to
use as the allocation hint.  This lets us call the hashing/grouping
schemes only when get_left_neighbor doesn't find something useful in the
path.

Adds alloc=dirid_groups and alloc=oid_groups mount options.  They hash
into the disk for data block allocations, and then round the hash down
to a 64MB boundary within the bitmap block.

changes the default alloc parameters to
dirid_groups:skip_busy:concentrating_formatted_nodes=5

Overall, I believe this will significantly improve fragmentation over
time.  oid_groups should only be used if your FS has a small number of
large files in each directory, or a very large number of files in a
single directory.

Also attached is search_reada-4.diff, which implements readahead on leaf
nodes during search_by_key calls.  It applies to both the data logging
and vanilla kernels.

-chris



--=-vtFZm2AflywkvWZ0TV3t
Content-Disposition: attachment; filename=group-alloc-4-vanilla.diff
Content-Type: text/plain; name=group-alloc-4-vanilla.diff; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

--- 1.18/fs/reiserfs/bitmap.c	Thu Sep 12 04:39:21 2002
+++ edited/fs/reiserfs/bitmap.c	Tue Mar 11 11:13:45 2003
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
+    s->u.reiserfs_sb.s_alloc_options.border = 5;
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
 
@@ -498,17 +530,81 @@
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
+	dirid = le32_to_cpu(INODE_PKEY(hint->inode)->k_dir_id);
+	hash_in = (char *)(&dirid);
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
@@ -529,6 +625,7 @@
 	    int t=get_block_num(item,pos_in_item);
 	    if (t) {
 		hint->search_start = t;
+		ret = 1;
 		break;
 	    }
 	    pos_in_item --;
@@ -537,7 +634,7 @@
     }
 
     /* does result value fit into specified region? */
-    return;
+    return ret;
 }
 
 /* should be, if formatted node, then try to put on first part of the device
@@ -640,6 +737,7 @@
     struct super_block *s = hint->th->t_super;
     hint->beg = 0;
     hint->end = SB_BLOCK_COUNT(s) - 1;
+    int unfm_hint;
 
     /* This is former border algorithm. Now with tunable border offset */
     if (concentrating_formatted_nodes(s))
@@ -668,19 +766,14 @@
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
@@ -705,10 +798,29 @@
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
 
@@ -772,28 +884,35 @@
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
--- 1.26/include/linux/reiserfs_fs.h	Mon Jan 20 05:19:30 2003
+++ edited/include/linux/reiserfs_fs.h	Tue Mar 11 10:52:16 2003
@@ -1953,6 +1953,7 @@
 typedef struct __reiserfs_blocknr_hint reiserfs_blocknr_hint_t;
 
 int reiserfs_parse_alloc_options (struct super_block *, char *);
+void reiserfs_init_alloc_options (struct super_block *s);
 int is_reusable (struct super_block * s, unsigned long block, int bit_value);
 void reiserfs_free_block (struct reiserfs_transaction_handle *th, unsigned long);
 int reiserfs_allocate_blocknrs(reiserfs_blocknr_hint_t *, b_blocknr_t * , int, int);

--=-vtFZm2AflywkvWZ0TV3t
Content-Disposition: attachment; filename=group-alloc-4.diff
Content-Type: text/plain; name=group-alloc-4.diff; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

diff -ur linux.beta3.1/fs/reiserfs/bitmap.c linux.beta3/fs/reiserfs/bitmap.c
--- linux.beta3.1/fs/reiserfs/bitmap.c	2003-03-10 20:36:37.000000000 -0500
+++ linux.beta3/fs/reiserfs/bitmap.c	2003-03-11 09:50:26.000000000 -0500
@@ -34,6 +34,8 @@
 #define  _ALLOC_hashed_formatted_nodes 7
 #define  _ALLOC_old_way 8
 #define  _ALLOC_hundredth_slices 9
+#define  _ALLOC_dirid_groups 10
+#define  _ALLOC_oid_groups 11
 
 #define  concentrating_formatted_nodes(s)     test_bit(_ALLOC_concentrating_formatted_nodes, &SB_ALLOC_OPTS(s))
 #define  displacing_large_files(s)            test_bit(_ALLOC_displacing_large_files, &SB_ALLOC_OPTS(s))
@@ -261,8 +263,18 @@
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
@@ -408,6 +420,16 @@
   }
 }
 
+void reiserfs_init_alloc_options (struct super_block *s)
+{
+    set_bit (_ALLOC_concentrating_formatted_nodes, &SB_ALLOC_OPTS(s));
+    set_bit (_ALLOC_skip_busy, &SB_ALLOC_OPTS(s));
+    set_bit (_ALLOC_dirid_groups, &SB_ALLOC_OPTS(s));
+    s->u.reiserfs_sb.s_alloc_options.border = 5;
+
+    reiserfs_warning ("allocator defaults = [%08x]\n", SB_ALLOC_OPTS(s));
+}
+
 /* block allocator related options are parsed here */
 int reiserfs_parse_alloc_options(struct super_block * s, char * options)
 {
@@ -451,6 +473,15 @@
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
@@ -492,6 +523,7 @@
 	return 1;
     }
 
+    reiserfs_warning ("allocator options = [%08x]\n", SB_ALLOC_OPTS(s));
     return 0;
 }
 
@@ -514,17 +546,81 @@
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
+	dirid = le32_to_cpu(INODE_PKEY(hint->inode)->k_dir_id);
+	hash_in = (char *)(&dirid);
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
@@ -545,6 +641,7 @@
 	    int t=get_block_num(item,pos_in_item);
 	    if (t) {
 		hint->search_start = t;
+		ret = 1;
 		break;
 	    }
 	    pos_in_item --;
@@ -553,7 +650,7 @@
     }
 
     /* does result value fit into specified region? */
-    return;
+    return ret;
 }
 
 /* should be, if formatted node, then try to put on first part of the device
@@ -655,6 +752,7 @@
     struct super_block *s = hint->th->t_super;
     hint->beg = 0;
     hint->end = SB_BLOCK_COUNT(s) - 1;
+    int unfm_hint;
 
     /* This is former border algorithm. Now with tunable border offset */
     if (concentrating_formatted_nodes(s))
@@ -683,19 +781,14 @@
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
@@ -720,10 +813,29 @@
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
 
@@ -787,7 +899,7 @@
     struct super_block *s = hint->th->t_super;
     b_blocknr_t start = hint->search_start;
     b_blocknr_t finish = SB_BLOCK_COUNT(s) - 1;
-    int second_pass = 0;
+    int passno = 0;
     int nr_allocated = 0;
 
     determine_prealloc_size(hint);
@@ -809,30 +921,44 @@
 	}
     }
 
-    while((nr_allocated
-	  += allocate_without_wrapping_disk(hint, new_blocknrs + nr_allocated, start, finish,
-					  amount_needed - nr_allocated, hint->prealloc_size))
-	  < amount_needed) {
-
-	/* not all blocks were successfully allocated yet*/
-	if (second_pass) {	/* it was a second pass; we must free all blocks */
+    do {
+        switch (passno++) {
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
+            break;
+        default: /* We've tried searching everywhere, not enough space */
 	    if (!hint->formatted_node) {
 #ifdef REISERQUOTA_DEBUG
-		printk(KERN_DEBUG "reiserquota: freeing (nospace) %d blocks id=%u\n", amount_needed + hint->prealloc_size - nr_allocated, hint->inode->i_uid);
+                printk(KERN_DEBUG "reiserquota: freeing (nospace) %d blocks id=%u\n",
+                            amount_needed + hint->prealloc_size - nr_allocated,
+                            hint->inode->i_uid);
 #endif
-		DQUOT_FREE_BLOCK_NODIRTY(hint->inode, amount_needed + hint->prealloc_size - nr_allocated);     /* Free not allocated blocks */
+                /* Free not allocated blocks */
+                DQUOT_FREE_BLOCK_NODIRTY(hint->inode,
+                        amount_needed + hint->prealloc_size - nr_allocated);
 	    }
+            /* Free the blocks */
 	    while (nr_allocated --)
-		reiserfs_free_block(hint->th, hint->inode, new_blocknrs[nr_allocated], !hint->formatted_node);
+		reiserfs_free_block(hint->th, hint->inode,
+                                    new_blocknrs[nr_allocated],
+                                    !hint->formatted_node);
+
+            return NO_DISK_SPACE;
+        }
+    } while ((nr_allocated += allocate_without_wrapping_disk (hint,
+                            new_blocknrs + nr_allocated, start, finish,
+                            amount_needed - nr_allocated, hint->prealloc_size))
+                        < amount_needed);
 
-	    return NO_DISK_SPACE;
-	} else {		/* refine search parameters for next pass */
-	    second_pass = 1;
-	    finish = start;
-	    start = 0;
-	    continue;
-	}
-    }
     if ( !hint->formatted_node && amount_needed + hint->prealloc_size > nr_allocated + INODE_INFO(hint->inode)->i_prealloc_count) {
     /* Some of preallocation blocks were not allocated */
 #ifdef REISERQUOTA_DEBUG
diff -ur linux.beta3.1/fs/reiserfs/super.c linux.beta3/fs/reiserfs/super.c
--- linux.beta3.1/fs/reiserfs/super.c	2003-03-10 20:36:37.000000000 -0500
+++ linux.beta3/fs/reiserfs/super.c	2003-03-10 20:37:31.000000000 -0500
@@ -1288,18 +1288,17 @@
     char *jdev_name;
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
     /* Initialize the rwsem for xattr dir */
     init_rwsem(&s->u.reiserfs_sb.xattr_dir_sem);
+    /* Setup default block allocator options */
+    reiserfs_init_alloc_options (s);
 
     if (reiserfs_parse_options (s, (char *) data, &(s->u.reiserfs_sb.s_mount_opt), &blocks) == 0) {
       return NULL;
diff -ur linux.beta3.1/include/linux/reiserfs_fs.h linux.beta3/include/linux/reiserfs_fs.h
--- linux.beta3.1/include/linux/reiserfs_fs.h	2003-03-10 20:36:37.000000000 -0500
+++ linux.beta3/include/linux/reiserfs_fs.h	2003-03-10 20:41:55.000000000 -0500
@@ -2228,6 +2228,7 @@
 typedef struct __reiserfs_blocknr_hint reiserfs_blocknr_hint_t;
 
 int reiserfs_parse_alloc_options (struct super_block *, char *);
+void reiserfs_init_alloc_options (struct super_block *s);
 int is_reusable (struct super_block * s, unsigned long block, int bit_value);
 void reiserfs_free_block (struct reiserfs_transaction_handle *th, struct inode *inode, unsigned long, int);
 int reiserfs_allocate_blocknrs(reiserfs_blocknr_hint_t *, b_blocknr_t * , int, int);

--=-vtFZm2AflywkvWZ0TV3t
Content-Disposition: attachment; filename=search_reada-4.diff
Content-Type: text/plain; name=search_reada-4.diff; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

===== fs/reiserfs/stree.c 1.19 vs edited =====
--- 1.19/fs/reiserfs/stree.c	Tue Jul 16 09:58:57 2002
+++ edited/fs/reiserfs/stree.c	Wed Jul 17 12:02:17 2002
@@ -598,26 +598,32 @@
 
 
 
-#ifdef SEARCH_BY_KEY_READA
+#define SEARCH_BY_KEY_READA 32
 
 /* The function is NOT SCHEDULE-SAFE! */
-static void search_by_key_reada (struct super_block * s, int blocknr)
+static void search_by_key_reada (struct super_block * s, 
+                                 struct buffer_head **bh, 
+				 unsigned long *b, int num)
 {
-    struct buffer_head * bh;
+    int i,j;
   
-    if (blocknr == 0)
-	return;
-
-    bh = getblk (s->s_dev, blocknr, s->s_blocksize);
-  
-    if (!buffer_uptodate (bh)) {
-	ll_rw_block (READA, 1, &bh);
+    for (i = 0 ; i < num ; i++) {
+	bh[i] = sb_getblk (s, b[i]);
+	if (buffer_uptodate(bh[i])) {
+	    brelse(bh[i]);
+	    break;
+	}
+	touch_buffer(bh[i]);
+    } 
+    if (i) {
+	ll_rw_block(READA, i, bh);
+    }
+    for(j = 0 ; j < i ; j++) {
+        if (bh[j])
+	    brelse(bh[j]);
     }
-    bh->b_count --;
 }
 
-#endif
-
 /**************************************************************************
  * Algorithm   SearchByKey                                                *
  *             look for item in the Disk S+Tree by its key                *
@@ -660,6 +666,9 @@
     int				n_node_level, n_retval;
     int 			right_neighbor_of_leaf_node;
     int				fs_gen;
+    struct buffer_head *reada_bh[SEARCH_BY_KEY_READA];
+    unsigned long      reada_blocks[SEARCH_BY_KEY_READA];
+    int reada_count = 0;
 
 #ifdef CONFIG_REISERFS_CHECK
     int n_repeat_counter = 0;
@@ -694,11 +703,11 @@
 	fs_gen = get_generation (p_s_sb);
 	expected_level --;
 
-#ifdef SEARCH_BY_KEY_READA
-	/* schedule read of right neighbor */
-	search_by_key_reada (p_s_sb, right_neighbor_of_leaf_node);
-#endif
-
+	/* schedule read of right neighbors */
+	if (reada_count) {
+	    search_by_key_reada (p_s_sb, reada_bh, reada_blocks, reada_count);
+	    reada_count = 0;
+	}
 	/* Read the next tree node, and set the last element in the path to
            have a pointer to it. */
 	if ( ! (p_s_bh = p_s_last_element->pe_buffer =
@@ -786,11 +795,19 @@
 	   position in the node. */
 	n_block_number = B_N_CHILD_NUM(p_s_bh, p_s_last_element->pe_position);
 
-#ifdef SEARCH_BY_KEY_READA
-	/* if we are going to read leaf node, then calculate its right neighbor if possible */
-	if (n_node_level == DISK_LEAF_NODE_LEVEL + 1 && p_s_last_element->pe_position < B_NR_ITEMS (p_s_bh))
-	    right_neighbor_of_leaf_node = B_N_CHILD_NUM(p_s_bh, p_s_last_element->pe_position + 1);
-#endif
+	/* if we are going to read leaf node, then try to find good leaves
+	** for read ahead as well.  Don't bother for stat data though
+	*/
+	if (n_node_level == DISK_LEAF_NODE_LEVEL + 1 && 
+	    p_s_last_element->pe_position < B_NR_ITEMS (p_s_bh) &&
+	    !is_statdata_cpu_key(p_s_key))
+	{
+	    int pos = p_s_last_element->pe_position;
+	    int limit = B_NR_ITEMS(p_s_bh);
+	    while(pos <= limit && reada_count < SEARCH_BY_KEY_READA) { 
+	        reada_blocks[reada_count++] = B_N_CHILD_NUM(p_s_bh, pos++);
+	    }
+        }
     }
 }
 

--=-vtFZm2AflywkvWZ0TV3t--

