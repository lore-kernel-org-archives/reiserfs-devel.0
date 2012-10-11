From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 02/10] reiserfsprogs: fix set-but-not-used gcc warnings
Date: Thu, 11 Oct 2012 13:11:14 -0400
Message-ID: <20121011200115.8936A200A4@oldboy.suse.de>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fsck/main.c             |    3 ---
 fsck/pass0.c            |   17 ++++++++++-------
 fsck/super.c            |    6 ------
 lib/io.c                |    4 +---
 reiserfscore/fix_node.c |    7 -------
 reiserfscore/lbalance.c |    2 --
 reiserfscore/prints.c   |    2 --
 7 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index 64f10f7..911af8d 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -751,11 +751,8 @@ static void reiserfsck_replay_journal (reiserfs_filsys_t * fs) {
 
 static int the_end (reiserfs_filsys_t * fs)
 {
-    struct reiserfs_super_block * sb;
     int ret = EXIT_FIXED;
 
-    sb = fs->fs_ondisk_sb;
-
     /* put bitmap and objectid map on place */
     reiserfs_delete_bitmap (fs->fs_bitmap2);
     fs->fs_bitmap2 = fsck_new_bitmap (fs);
diff --git a/fsck/pass0.c b/fsck/pass0.c
index a5d649e..c29ea8e 100644
--- a/fsck/pass0.c
+++ b/fsck/pass0.c
@@ -244,9 +244,7 @@ static int verify_directory_item (reiserfs_filsys_t * fs, struct buffer_head * b
     int bad, lost_found;
     int i, j;
     char buf[4096];
-    int dirty;
     int hash_code;
-    int bad_locations;
     int min_entry_size = 1;
 
 #ifdef DEBUG_VERIFY_DENTRY
@@ -258,9 +256,6 @@ static int verify_directory_item (reiserfs_filsys_t * fs, struct buffer_head * b
     item = B_I_PITEM (bh,ih);
     deh = (struct reiserfs_de_head *)item;
 
-    dirty = 0;
-    bad_locations = 0;
- 
     if ( (get_ih_entry_count (ih) > (get_ih_item_len(ih) / (DEH_SIZE + min_entry_size))) ||
           (get_ih_entry_count (ih) == 0))
     {
@@ -417,21 +412,29 @@ static int verify_directory_item (reiserfs_filsys_t * fs, struct buffer_head * b
        screwed up */
     {
 	int prev_loc;
+#ifdef DEBUG_VERIFY_DENTRY
 	int loc_fixed;
+#endif
 
 
 	prev_loc = get_ih_item_len (ih);
 	for (i = 0; i < get_ih_entry_count (ih); i ++) {
+#ifdef DEBUG_VERIFY_DENTRY
 	    loc_fixed = 0;
+#endif
 	    if (de_bad_location (deh + i)) {
 		set_deh_location (deh + i, prev_loc/* - 1*/);
 		mark_buffer_dirty (bh);
+#ifdef DEBUG_VERIFY_DENTRY
 		loc_fixed = 1;
+#endif
 	    } else {
 		if (get_deh_location (deh + i) >= prev_loc) {
 		    set_deh_location (deh + i, prev_loc/* - 1*/);
 		    mark_buffer_dirty (bh);
+#ifdef DEBUG_VERIFY_DENTRY
 		    loc_fixed = 1;
+#endif
 		}
 	    }
 
@@ -448,7 +451,9 @@ static int verify_directory_item (reiserfs_filsys_t * fs, struct buffer_head * b
 		}
 		if (get_deh_location (deh + i) != (DEH_SIZE * get_ih_entry_count (ih))) {
 		    set_deh_location (&deh[i], (DEH_SIZE * get_ih_entry_count (ih)));
+#ifdef DEBUG_VERIFY_DENTRY
 		    loc_fixed = 1;
+#endif
 		    mark_buffer_dirty (bh);
 		}
 	    }
@@ -639,7 +644,6 @@ static void pass0_correct_leaf (reiserfs_filsys_t * fs,
     __u64 fs_size;
     __u64 offset;
     int symlnk = 0;
-    int bad_order;
     
     unsigned long unfm_ptr;
 //    unsigned int nr_items;
@@ -664,7 +668,6 @@ static void pass0_correct_leaf (reiserfs_filsys_t * fs,
  start_again:
 
     ih = B_N_PITEM_HEAD (bh, 0);
-    bad_order = 0;
     for (i = 0; i < (nr_items = get_blkh_nr_items (B_BLK_HEAD (bh))); i ++, ih ++) {
 
 	if (is_indirect_ih(ih) && (get_ih_item_len (ih) % 4 != 0)) {
diff --git a/fsck/super.c b/fsck/super.c
index cf91558..d34310b 100644
--- a/fsck/super.c
+++ b/fsck/super.c
@@ -191,12 +191,6 @@ void rebuild_sb (reiserfs_filsys_t * fs, char * filename, struct fsck_data * dat
     struct stat stat_buf;
     int retval, exit_code = EXIT_OK;
 
-#if defined(HAVE_LIBUUID) && defined(HAVE_UUID_UUID_H)
-    char uuid[37];
-    
-    uuid[36] = '\0';
-#endif
-
     if (!no_reiserfs_found (fs)) {
         sb = getmem (sizeof (*sb));
         if (!is_opened_rw (fs)) {
diff --git a/lib/io.c b/lib/io.c
index 24bf5cf..3f9fe6a 100644
--- a/lib/io.c
+++ b/lib/io.c
@@ -658,7 +658,7 @@ void do_fsck_rollback (int fd_device, int fd_journal_device, FILE * progress) {
     int b_dev;
     int n_dev = 0;
     int n_journal_dev = 0;
-    unsigned long total, done = 0;
+    unsigned long done = 0;
 
     if (fd_device == 0) {
         fprintf(stderr, "rollback: unspecified device, exit\n");
@@ -688,8 +688,6 @@ void do_fsck_rollback (int fd_device, int fd_journal_device, FILE * progress) {
     
     fread (&rollback_blocks_number, sizeof (rollback_blocks_number), 1, s_rollback_file);
 
-    total = rollback_blocks_number;
-    
     while (1) {
         print_how_far (progress, &done, rollback_blocks_number, 1, 0/*not quiet*/);
 	
diff --git a/reiserfscore/fix_node.c b/reiserfscore/fix_node.c
index 92ef814..1de0f5a 100644
--- a/reiserfscore/fix_node.c
+++ b/reiserfscore/fix_node.c
@@ -1918,11 +1918,6 @@ static int dc_check_balance_leaf (struct tree_balance * tb, int h)
 {
     struct virtual_node * vn = tb->tb_vn;
 
-    /* Number of bytes that must be deleted from (value is negative if bytes
-       are deleted) buffer which contains node being balanced.  The mnemonic
-       is that the attempted change in node space used level is levbytes
-       bytes. */
-    int levbytes;
     /* the maximal item size */
     int n_ret_value;
     /* F0 is the parent of the node whose balance is currently being checked */
@@ -1931,8 +1926,6 @@ static int dc_check_balance_leaf (struct tree_balance * tb, int h)
     
     F0 = PATH_H_PPARENT (tb->tb_path, 0);
 
-    levbytes = tb->insert_size[h];
-
     if ( ! F0 ) {
 	/* S[0] is the root now. */
 	set_parameters (tb, h, 0, 0, 1, NULL, -1, -1);
diff --git a/reiserfscore/lbalance.c b/reiserfscore/lbalance.c
index e9323ba..cf42587 100644
--- a/reiserfscore/lbalance.c
+++ b/reiserfscore/lbalance.c
@@ -370,10 +370,8 @@ static int leaf_copy_items (reiserfs_filsys_t * fs,
 			    int last_first, int cpy_num,
 			    int cpy_bytes)
 {
-    struct buffer_head * dest;
     int pos, i, src_nr_item, bytes;
 
-    dest = dest_bi->bi_bh;
     if ( cpy_num == 0 )
 	return 0;
  
diff --git a/reiserfscore/prints.c b/reiserfscore/prints.c
index 5ef84d7..e68ef01 100644
--- a/reiserfscore/prints.c
+++ b/reiserfscore/prints.c
@@ -511,7 +511,6 @@ static int is_symlink = 0;
 static int print_leaf (FILE * fp, reiserfs_filsys_t * fs, struct buffer_head * bh,
 		       int print_mode, int first, int last)
 {
-    struct block_head * blkh;
     struct item_head * ih;
     int i;
     int from, to;
@@ -520,7 +519,6 @@ static int print_leaf (FILE * fp, reiserfs_filsys_t * fs, struct buffer_head * b
     if (!is_tree_node (bh, DISK_LEAF_NODE_LEVEL))
 	return 1;
     
-    blkh = B_BLK_HEAD (bh);
     ih = B_N_PITEM_HEAD (bh,0);
     real_nr = leaf_count_ih(bh->b_data, bh->b_size);
     nr = get_blkh_nr_items((struct block_head *)bh->b_data);
-- 
1.7.10.4


