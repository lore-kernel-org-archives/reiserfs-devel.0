From: jeffm@suse.com
Subject: [patch 8/9] [PATCH] reiserfsprogs: Support for file systems > 8 TB
Date: Thu, 24 Jan 2008 15:02:34 -0500
Message-ID: <20080124200337.822896000@suse.com>
References: <20080124200226.606635000@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfsprogs-large-fs.diff
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

 The reiserfs disk format tries to support large file systems, but falls
 short in the superblock format where it contains the number of bitmaps
 in the file system as a 16 bit value. This limits the file system size
 to 65536 bitmap blocks, which can describe 8TiB - 128MiB.

 The following patch is somewhat of a backport of the bitmap tracking
 behavior in reiserfsprogs 3.6.20. It calculates the bmap count on the
 fly rather than depending on the superblock value.

 It also teaches fsck to detect and adjust s_bmap_nr when it's not zero
 but describes a file system larger than 8 TB. In order to do this, many
 places which use get_sb_bmap_nr() directly need to use the calculated
 value instead.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

---
 debugreiserfs/corruption.c        |    4 ++--
 debugreiserfs/pack.c              |    5 ++---
 fsck/check_tree.c                 |    5 +++--
 fsck/pass0.c                      |    2 +-
 fsck/pass1.c                      |    2 +-
 fsck/super.c                      |   18 +++++++++++-------
 include/reiserfs_lib.h            |    4 ++++
 mkreiserfs/mkreiserfs.c           |    9 ++++++---
 reiserfscore/bitmap.c             |   29 +++++++++++++++++++----------
 reiserfscore/node_formats.c       |    2 +-
 reiserfscore/prints.c             |    8 +++++---
 reiserfscore/reiserfslib.c        |    6 +++++-
 resize_reiserfs/do_shrink.c       |   10 ++++++----
 resize_reiserfs/resize_reiserfs.c |    6 ++++--
 14 files changed, 70 insertions(+), 40 deletions(-)

--- a/debugreiserfs/corruption.c	2004-08-19 05:31:49.000000000 -0400
+++ b/debugreiserfs/corruption.c	2008-01-24 13:39:05.000000000 -0500
@@ -157,7 +157,7 @@ static void edit_super_block (reiserfs_f
 		strncpy (fs->fs_ondisk_sb->s_v1.s_magic, str, n > 10 ? 10 : n);
     
     /* __u16 sb_fsck_state; */
-    printf ("\tFielsystem state: current: %u: new:", get_sb_fs_state (fs->fs_ondisk_sb));
+    printf ("\tFilesystem state: current: %u: new:", get_sb_fs_state (fs->fs_ondisk_sb));
     getline (&str, &n, stdin);
     if (str2int (str, &num))
 		set_sb_fs_state (fs->fs_ondisk_sb, num);
@@ -809,7 +809,7 @@ void do_bitmap_corruption (reiserfs_fils
 	struct buffer_head * bh;
 	unsigned int i;
 
-	nr_bitmap_to_corrupt = (unsigned long)get_rand (1, get_sb_bmap_nr (fs->fs_ondisk_sb) - 1);
+	nr_bitmap_to_corrupt = (unsigned long)get_rand (1, reiserfs_fs_bmap_nr(fs) - 1);
 
 	if ((data(fs)->log_file_name) && (data(fs)->log)) {
 		fprintf (data(fs)->log, "%lu bitmaps will be corrupted\n", nr_bitmap_to_corrupt);
--- a/debugreiserfs/pack.c	2004-05-24 18:50:01.000000000 -0400
+++ b/debugreiserfs/pack.c	2008-01-24 13:39:05.000000000 -0500
@@ -581,13 +581,12 @@ static void pack_frozen_data (reiserfs_f
     /* super block */
     reiserfs_warning (stderr, "super block..");fflush (stderr);
     send_block (fs, fs->fs_super_bh, 1/*send block even if its format is not determined */);
-    reiserfs_warning (stderr, "ok\nbitmaps..(%d).. ", 
-		      get_sb_bmap_nr (fs->fs_ondisk_sb));
+    reiserfs_warning (stderr, "ok\nbitmaps..(%d).. ", reiserfs_fs_bmap_nr(fs));
     fflush (stderr);
 
     /* bitmaps */
     block = fs->fs_super_bh->b_blocknr + 1;
-    for (i = 0; i < get_sb_bmap_nr (fs->fs_ondisk_sb); i ++) {
+    for (i = 0; i < reiserfs_fs_bmap_nr(fs); i ++) {
 	bh = bread (fs->fs_dev, block, fs->fs_blocksize);
 	if (!bh) {
 	    fprintf (stderr, "pack_frozen_data: bread failed: %lu\n", block);
--- a/fsck/check_tree.c	2008-01-24 13:39:05.000000000 -0500
+++ b/fsck/check_tree.c	2008-01-24 13:39:05.000000000 -0500
@@ -142,9 +142,10 @@ static void init_control_bitmap (reiserf
     unsigned int i;
     unsigned long block;
     unsigned long reserved;
+    unsigned int blocks = get_sb_block_count(fs->fs_ondisk_sb);
     
 
-    control_bitmap = reiserfs_create_bitmap(get_sb_block_count(fs->fs_ondisk_sb));
+    control_bitmap = reiserfs_create_bitmap(blocks);
     if (!control_bitmap)
 	die ("init_control_bitmap: Failed to allocate a control bitmap.");
 
@@ -161,7 +162,7 @@ static void init_control_bitmap (reiserf
 
     /* bitmaps */
     block = fs->fs_super_bh->b_blocknr + 1;
-    for (i = 0; i < get_sb_bmap_nr (fs->fs_ondisk_sb); i ++) {
+    for (i = 0; i < reiserfs_fs_bmap_nr(fs); i ++) {
         we_met_it (block);
 
 	if (spread_bitmaps (fs))
--- a/fsck/pass0.c	2004-10-04 13:11:34.000000000 -0400
+++ b/fsck/pass0.c	2008-01-24 13:39:05.000000000 -0500
@@ -1802,7 +1802,7 @@ static void init_source_bitmap (reiserfs
     block = fs->fs_super_bh->b_blocknr + 1;
 
     reserved = fsck_source_bitmap(fs)->bm_bit_size;
-    for (i = 0; i < get_sb_bmap_nr (fs->fs_ondisk_sb); i ++) {
+    for (i = 0; i < reiserfs_fs_bmap_nr(fs); i ++) {
 	if (!reiserfs_bitmap_test_bit (fsck_source_bitmap (fs), block)) {
 	    /* bitmap is definitely broken, mark all blocks of this bitmap block as used */
 	
--- a/fsck/pass1.c	2004-10-04 12:19:22.000000000 -0400
+++ b/fsck/pass1.c	2008-01-24 13:39:05.000000000 -0500
@@ -483,7 +483,7 @@ static void init_new_bitmap (reiserfs_fi
 
     /* mark bitmap blocks as used */
     block = fs->fs_super_bh->b_blocknr + 1;
-    for (i = 0; i < get_sb_bmap_nr (fs->fs_ondisk_sb); i ++) {
+    for (i = 0; i < reiserfs_fs_bmap_nr(fs); i ++) {
 	mark_block_used (block, 1);
 	if (spread_bitmaps (fs))
 	    block = (block / (fs->fs_blocksize * 8) + 1) * (fs->fs_blocksize * 8);
--- a/fsck/super.c	2004-10-13 09:05:15.000000000 -0400
+++ b/fsck/super.c	2008-01-24 13:39:05.000000000 -0500
@@ -178,7 +178,7 @@ void rebuild_sb (reiserfs_filsys_t * fs,
     int magic_was_found = 0;
     unsigned long block_count = 0;
     __u16 p_oid_maxsize;
-    __u16 p_bmap_nr;
+    unsigned int bmap_nr;
     __u32 p_jp_journal_1st_block = 0;
     __u32 p_jp_dev_size = 0;
     int standard_journal = -1;
@@ -446,12 +446,16 @@ void rebuild_sb (reiserfs_filsys_t * fs,
 	set_sb_oid_maxsize (sb, p_oid_maxsize);
     }
 
-    p_bmap_nr = (block_count + (fs->fs_blocksize * 8 - 1)) / (fs->fs_blocksize * 8);
-    if (get_sb_bmap_nr (sb) != p_bmap_nr) {
-	fsck_log("rebuild-sb: wrong bitmap number occured (%lu), fixed (%lu)\n", 
-		get_sb_bmap_nr (sb), p_bmap_nr);
-	set_sb_bmap_nr (sb, 
-		(block_count + (fs->fs_blocksize * 8 - 1)) / (fs->fs_blocksize * 8));
+    bmap_nr = reiserfs_fs_bmap_nr(fs);
+
+    if (reiserfs_bmap_over(bmap_nr) && get_sb_bmap_nr(sb) != 0) {
+	fsck_log("rebuild-sb: wrong bitmap number occured (%u), fixed (0) "
+	         "(really %u)\n", get_sb_bmap_nr (sb), bmap_nr);
+	set_sb_bmap_nr (sb, 0);
+    } else if (get_sb_bmap_nr(sb) != bmap_nr) {
+	fsck_log("rebuild-sb: wrong bitmap number occured (%u), "
+		 "fixed (%u)\n", get_sb_bmap_nr (sb), bmap_nr);
+	set_sb_bmap_nr (sb, bmap_nr);
     }
 
     if (get_sb_root_block (sb) > block_count) {
--- a/include/reiserfs_lib.h	2008-01-24 13:39:04.000000000 -0500
+++ b/include/reiserfs_lib.h	2008-01-24 13:39:05.000000000 -0500
@@ -152,6 +152,9 @@ void mark_badblock(reiserfs_filsys_t *fs
 int create_badblock_bitmap (reiserfs_filsys_t * fs, char * badblocks_file);
 void add_badblock_list (reiserfs_filsys_t * fs, int no_badblock_in_tree_yet);
 void badblock_list(reiserfs_filsys_t * fs, badblock_func_t action, void *data);
+#define reiserfs_fs_bmap_nr(fs) reiserfs_bmap_nr(get_sb_block_count(fs->fs_ondisk_sb), fs->fs_blocksize)
+#define reiserfs_bmap_nr(count, blk_size) ((count - 1) / (blk_size * 8) + 1)
+#define reiserfs_bmap_over(nr) (nr > ((1LL << 16) - 1))
 
 extern struct key root_dir_key;
 extern struct key parent_root_dir_key;
@@ -166,6 +169,7 @@ int reiserfs_create_ondisk_bitmap (reise
 void reiserfs_free_ondisk_bitmap (reiserfs_filsys_t *);
 void reiserfs_close_ondisk_bitmap (reiserfs_filsys_t *);
 int reiserfs_flush_to_ondisk_bitmap (reiserfs_bitmap_t * bm, reiserfs_filsys_t * fs);
+unsigned int reiserfs_calc_bmap_nr(reiserfs_filsys_t *fs, unsigned int blocks);
 
 reiserfs_bitmap_t * reiserfs_create_bitmap (unsigned int bit_count);
 int reiserfs_expand_bitmap (reiserfs_bitmap_t * bm, unsigned int bit_count);
--- a/mkreiserfs/mkreiserfs.c	2008-01-24 13:39:05.000000000 -0500
+++ b/mkreiserfs/mkreiserfs.c	2008-01-24 13:39:05.000000000 -0500
@@ -223,7 +223,7 @@ static void make_bitmap (reiserfs_filsys
     /* mark bitmaps as used */
     block = fs->fs_super_bh->b_blocknr + 1;
 
-    for (i = 0; i < get_sb_bmap_nr (sb); i ++) {
+    for (i = 0; i < reiserfs_fs_bmap_nr(fs); i ++) {
 	reiserfs_bitmap_set_bit (fs->fs_bitmap2, block);
 	marked ++;
 	if (spread_bitmaps (fs))
@@ -350,8 +350,11 @@ static void report (reiserfs_filsys_t * 
     reiserfs_warning (stdout, "Hash function used to sort names: %s\n",
 		      code2name (get_sb_hash_code (sb)));
     if (mode & DEBUG_MODE) {
-        reiserfs_warning (stdout, "Number of bitmaps: %u\n", get_sb_bmap_nr (sb));
-        reiserfs_warning (stdout, "Root block: %u\n", get_sb_root_block (sb));
+        reiserfs_warning (stdout, "Number of bitmaps: %u", get_sb_bmap_nr (sb));
+	if (get_sb_bmap_nr(sb) != reiserfs_fs_bmap_nr(fs))
+		reiserfs_warning(stdout, " (really uses %u)",
+		                 reiserfs_fs_bmap_nr(fs));
+        reiserfs_warning (stdout, "\nRoot block: %u\n", get_sb_root_block (sb));
         reiserfs_warning (stdout, "Tree height: %d\n", get_sb_tree_height (sb));
         reiserfs_warning (stdout, "Objectid map size %d, max %d\n", 
 			  get_sb_oid_cursize (sb), get_sb_oid_maxsize (sb));
--- a/reiserfscore/bitmap.c	2004-08-19 06:10:45.000000000 -0400
+++ b/reiserfscore/bitmap.c	2008-01-24 13:39:05.000000000 -0500
@@ -685,25 +685,35 @@ void reiserfs_free_ondisk_bitmap (reiser
     }
 }
 
-
 /* read bitmap blocks */
 int reiserfs_open_ondisk_bitmap (reiserfs_filsys_t * fs)
 {
+    unsigned int blocks = get_sb_block_count(fs->fs_ondisk_sb) ;
+    unsigned int bmap_nr = reiserfs_bmap_nr(blocks, fs->fs_blocksize);
+
     if (fs->fs_bitmap2)
 	reiserfs_panic ("bitmap is initiaized already");
 
-    fs->fs_bitmap2 = reiserfs_create_bitmap (get_sb_block_count (fs->fs_ondisk_sb));
+    fs->fs_bitmap2 = reiserfs_create_bitmap (blocks);
     if (!fs->fs_bitmap2)
 	return -1;
 
-    if ((get_sb_block_count (fs->fs_ondisk_sb) + fs->fs_blocksize * 8 - 1) / 
-	(fs->fs_blocksize * 8) != get_sb_bmap_nr (fs->fs_ondisk_sb)) 
-    {
-	reiserfs_warning (stderr, "%s: wrong either bitmaps number,\n", __FUNCTION__);
-	reiserfs_warning (stderr, "count of blocks or blocksize, run with --rebuild-sb "
-	    "to fix it\n");
+    if (reiserfs_bmap_over(bmap_nr)) {
+	     if (get_sb_bmap_nr(fs->fs_ondisk_sb) != 0) {
+		reiserfs_warning (stderr, "%s: large file system has "
+		                  "incorrect bitmap count %u. Should be 0 "
+				  "to indicate overflow.\nPlease re-run with "
+				  "--rebuild-sb to fix it.\n", __FUNCTION__,
+				  get_sb_bmap_nr(fs->fs_ondisk_sb));
+		return -1;
+	     }
+    } else if (bmap_nr != get_sb_bmap_nr (fs->fs_ondisk_sb)) {
+	reiserfs_warning (stderr, "%s: wrong either bitmaps number,\n",
+	                  __FUNCTION__);
+	reiserfs_warning (stderr, "count of blocks or blocksize, run with "
+	                  "--rebuild-sb to fix it\n");
 	return -1;
-    }    	
+    }
 
     return reiserfs_fetch_ondisk_bitmap (fs->fs_bitmap2, fs);
 }
@@ -720,7 +730,6 @@ int reiserfs_create_ondisk_bitmap (reise
     return 1;
 }
 
-
 void reiserfs_close_ondisk_bitmap (reiserfs_filsys_t * fs)
 {
     if (!fs->fs_bitmap2)
--- a/reiserfscore/node_formats.c	2004-09-29 11:15:58.000000000 -0400
+++ b/reiserfscore/node_formats.c	2008-01-24 13:39:05.000000000 -0500
@@ -372,7 +372,7 @@ int block_of_bitmap (reiserfs_filsys_t *
 	return (block == (REISERFS_DISK_OFFSET_IN_BYTES / fs->fs_blocksize + 1)) ;
     } else {
 	/* bitmap in */
-	return (block > 2ul && block < 3ul + get_sb_bmap_nr(fs->fs_ondisk_sb)) ? 1 : 0;
+	return (block > 2ul && block < 3ul + reiserfs_fs_bmap_nr(fs)) ? 1 : 0;
     }
     return 0;
 }
--- a/reiserfscore/prints.c	2004-09-16 08:23:11.000000000 -0400
+++ b/reiserfscore/prints.c	2008-01-24 13:39:05.000000000 -0500
@@ -641,8 +641,10 @@ int print_super_block (FILE * fp, reiser
 		get_sb_block_count (sb), get_sb_free_blocks (sb), get_sb_block_size (sb));
     } else {
 	reiserfs_warning (fp, "Count of blocks on the device: %u\n", get_sb_block_count (sb));
-	reiserfs_warning (fp, "Number of bitmaps: %u\n", get_sb_bmap_nr (sb));
-	reiserfs_warning (fp, "Blocksize: %d\n", get_sb_block_size (sb));
+	reiserfs_warning (fp, "Number of bitmaps: %u", get_sb_bmap_nr (sb));
+	if (get_sb_bmap_nr (sb) != reiserfs_fs_bmap_nr(fs))
+		reiserfs_warning (fp, " (really uses %u)", reiserfs_fs_bmap_nr(fs));
+	reiserfs_warning (fp, "\nBlocksize: %d\n", get_sb_block_size (sb));
 	reiserfs_warning (fp, "Free blocks (count of blocks - used [journal, "
 		      "bitmaps, data, reserved] blocks): %u\n", get_sb_free_blocks (sb));
 	reiserfs_warning (fp, "Root block: %u\n", get_sb_root_block (sb));
@@ -916,7 +918,7 @@ void print_bmap (FILE * fp, reiserfs_fil
 
 
     sb = fs->fs_ondisk_sb;
-    bmap_nr = get_sb_bmap_nr (sb);
+    bmap_nr = reiserfs_fs_bmap_nr(fs);
     bits_per_block = fs->fs_blocksize * 8;
     blocks = bits_per_block;
 
--- a/reiserfscore/reiserfslib.c	2008-01-24 13:39:04.000000000 -0500
+++ b/reiserfscore/reiserfslib.c	2008-01-24 13:39:05.000000000 -0500
@@ -160,6 +160,7 @@ reiserfs_filsys_t * reiserfs_open (char 
     fs->fs_flags = flags; /* O_RDONLY or O_RDWR */
 
     fs->fs_format = get_reiserfs_format (sb);
+
     
     /*reiserfs_read_bitmap_blocks(fs);*/
     if (flags & O_RDWR)
@@ -181,6 +182,7 @@ reiserfs_filsys_t * reiserfs_create (cha
 				     int new_format)
 {
     reiserfs_filsys_t * fs;
+    unsigned int bmap_nr = reiserfs_bmap_nr(block_count, block_size);;
 
 
     /* convert root dir key and parent root dir key to little endian format */
@@ -278,8 +280,10 @@ reiserfs_filsys_t * reiserfs_create (cha
     /* sb_fsck_state */
     /* sb_hash_function_code */
     /* sb_tree_height */
+
     set_sb_bmap_nr (fs->fs_ondisk_sb,
-		    (block_count + (block_size * 8 - 1)) / (block_size * 8));
+                    reiserfs_bmap_over(bmap_nr) ? 0 : bmap_nr);
+
     set_sb_version (fs->fs_ondisk_sb, version);
     /* sb_not_used1 */
 
--- a/resize_reiserfs/do_shrink.c	2004-08-19 07:27:54.000000000 -0400
+++ b/resize_reiserfs/do_shrink.c	2008-01-24 13:39:05.000000000 -0500
@@ -187,8 +187,7 @@ int shrink_fs(reiserfs_filsys_t * fs, lo
 
 	/* is shrinking possible ? */
 	if (get_sb_block_count(ondisk_sb) - blocks > 
-	    get_sb_free_blocks(ondisk_sb) + get_sb_bmap_nr(ondisk_sb) - 
-	    bmap_nr_new) 
+	    get_sb_free_blocks(ondisk_sb) + reiserfs_fs_bmap_nr(fs) - bmap_nr_new)
 	{
 	    fprintf(stderr, "resize_reiserfs: can\'t shrink fs; too many "
 		"blocks already allocated\n");
@@ -226,7 +225,7 @@ int shrink_fs(reiserfs_filsys_t * fs, lo
 	blocks_used = 
 	    get_sb_block_count(fs->fs_ondisk_sb)
 	    - get_sb_free_blocks(fs->fs_ondisk_sb)
-	    - get_sb_bmap_nr(fs->fs_ondisk_sb)
+	    - reiserfs_fs_bmap_nr(fs)
 	    - get_jp_journal_size(sb_jp (fs->fs_ondisk_sb))
 	    - REISERFS_DISK_OFFSET_IN_BYTES / fs->fs_blocksize
 	    - 2; /* superblock itself and 1 descriptor after the journal */
@@ -289,10 +288,13 @@ int shrink_fs(reiserfs_filsys_t * fs, lo
 
 	set_sb_free_blocks (ondisk_sb, get_sb_free_blocks(ondisk_sb)
 			    - (get_sb_block_count(ondisk_sb) - blocks)
-			    + (get_sb_bmap_nr(ondisk_sb) - bmap_nr_new)
+			    + (reiserfs_fs_bmap_nr(fs) - bmap_nr_new)
 			    + bad_count);
 	set_sb_block_count (ondisk_sb, blocks);
 	set_sb_bmap_nr (ondisk_sb, bmap_nr_new);
 
+	set_sb_bmap_nr (fs->fs_ondisk_sb,
+	                reiserfs_bmap_over(bmap_nr_new) ? 0 : bmap_nr_new);
+
 	return 0;
 }
--- a/resize_reiserfs/resize_reiserfs.c	2004-08-19 07:47:13.000000000 -0400
+++ b/resize_reiserfs/resize_reiserfs.c	2008-01-24 13:39:05.000000000 -0500
@@ -114,14 +114,16 @@ static int expand_fs (reiserfs_filsys_t 
 
     /* count bitmap blocks in new fs */
     bmap_nr_new = (block_count_new - 1) / (fs->fs_blocksize * 8) + 1;
-    bmap_nr_old = get_sb_bmap_nr(sb);
+    bmap_nr_old = reiserfs_fs_bmap_nr(fs);
 	
     /* update super block buffer*/
     set_sb_free_blocks (sb, get_sb_free_blocks(sb) + 
 			(block_count_new - get_sb_block_count(sb)) - 
 			(bmap_nr_new - bmap_nr_old));
     set_sb_block_count (sb, block_count_new);
-    set_sb_bmap_nr (sb, bmap_nr_new);
+
+    set_sb_bmap_nr (fs->fs_ondisk_sb,
+                    reiserfs_bmap_over(bmap_nr_new) ? 0 : bmap_nr_new);
 
     /* mark new bitmap blocks as used */
     for (i = bmap_nr_old; i < bmap_nr_new; i++)


