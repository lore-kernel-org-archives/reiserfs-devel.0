From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: on-demand bitmap loading (testing only)
Date: Wed, 06 Jul 2005 17:22:07 -0400
Message-ID: <42CC4B7F.2070506@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010201010208050309050107"
Return-path: <reiserfs-list-return-25011-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--------------010201010208050309050107
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

 Currently, ReiserFS will read and keep in memory all the bitmaps for
 the filesystem on mount. After the journal is replayed, it will read
 them in again. On huge filesystems, this can be a resource hog and a
 performance/ availability problem.

 For example, on a maximum size (~16 TB) ReiserFS filesystem, there are
 2^32 blocks, which require 131072 bitmaps to describe them. This means
 that without loading any of the metadata tree or accessing file data,
 just over 512M of RAM must be allocated (and is unswappable) for the
 filesystem to be mounted and completely idle. All of that data is
 distributed evenly over the entire disk, and must be read (twice!)
 on mount.

 There have been reports of large filesystems taking an unacceptably
 long time to mount. These mount times can take your 5 9's down pretty
 quickly.

 The following patch implements on-demand loading for bitmaps. Rather
 than pin all the bitmaps in memory as we do now, when a bitmap is
 needed it is read from disk. If it is needed frequently, the buffer
 cache will use existing heuristics to keep it around. The caching of
 bitmap metadata is kept, so that bitmaps that are known to be full are
 skipped completely.

 I have done some very basic testing on this, but I'd like to have some
 more eyes take a look.

 Caveats:

 The error handling in this revision is incomplete. This is a known
 issue as I would like to end up applying this patch after reworking
 the error handling in ReiserFS as a whole. Ultimately, a
 reiserfs_error() similar to ext3 will be introduced, which will allow
 smoother handling of errors than currently available.

 The "old bitmap" code is untested. In principle, the difference boils
 down to only where the bitmap block is located.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCzEt/LPWxlyuTD7IRAt4iAJ48L0ldd+jgowf1Qf6f6e90wbgacwCgjo5o
RSQzCzJAnYeLpYQDzkLBGVc=
=5ux1
-----END PGP SIGNATURE-----

--------------010201010208050309050107
Content-Type: text/x-patch;
 name="reiserfs-on-demand-bitmaps.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfs-on-demand-bitmaps.diff"

From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: implement on-demand bitmap loading (testing only)

 Currently, ReiserFS will read and keep in memory all the bitmaps for the
 filesystem on mount. After the journal is replayed, it will read them in
 again. On huge filesystems, this can be a resource hog and a performance/
 availability problem.

 For example, on a maximum size (~16 TB) ReiserFS filesystem, there are
 2^32 blocks, which require 131072 bitmaps to describe them. This means that
 without loading any of the metadata tree or accessing file data, just over
 512M of RAM must be allocated (and is unswappable) for the filesystem to
 be mounted and completely idle. All of that data is distributed evenly over
 the entire disk, and must be read (twice!) on mount.

 There have been reports of large filesystems taking an unacceptably long time
 to mount. These mount times can take your 5 9's down pretty quickly.

 The following patch implements on-demand loading for bitmaps. Rather than pin
 all the bitmaps in memory as we do now, when a bitmap is needed it is read
 from disk. If it is needed frequently, the buffer cache will use existing
 heuristics to keep it around. The caching of bitmap metadata is kept, so that
 bitmaps that are known to be full are skipped completely.

 I have done some very basic testing on this, but I'd like to have some more
 eyes take a look.

 Caveats:

 The error handling in this revision is incomplete. This is a known issue
 as I would like to end up applying this patch after reworking the error
 handling in ReiserFS as a whole. Ultimately, a reiserfs_error() similar to
 ext3 will be introduced, which will allow smoother handling of errors than
 currently available.

 The "old bitmap" code is untested. In principle, the difference boils down to
 only where the bitmap block is located.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX dontdiff linux-2.6.12.1/fs/reiserfs/bitmap.c linux-2.6.12.1.devel/fs/reiserfs/bitmap.c
--- linux-2.6.12.1/fs/reiserfs/bitmap.c	2005-06-30 12:51:42.000000000 -0400
+++ linux-2.6.12.1.devel/fs/reiserfs/bitmap.c	2005-06-30 16:40:29.000000000 -0400
@@ -61,6 +61,8 @@ static inline void get_bit_address (stru
 int is_reusable (struct super_block * s, b_blocknr_t block, int bit_value)
 {
     int i, j;
+    unsigned int bmap = block >> s->s_blocksize_bits;
+    struct buffer_head *bh;
 
     if (block == 0 || block >= SB_BLOCK_COUNT (s)) {
 	reiserfs_warning (s, "vs-4010: is_reusable: block number is out of range %lu (%u)",
@@ -68,14 +70,29 @@ int is_reusable (struct super_block * s,
 	return 0;
     }
 
-    /* it can't be one of the bitmap blocks */
-    for (i = 0; i < SB_BMAP_NR (s); i ++)
-	if (block == SB_AP_BITMAP (s)[i].bh->b_blocknr) {
-	    reiserfs_warning (s, "vs: 4020: is_reusable: "
-			      "bitmap block %lu(%u) can't be freed or reused",
-			      block, SB_BMAP_NR (s));
-	    return 0;
-	}
+    /* Old format filesystem? Unlikely, but the bitmaps are all up front so
+     * we need to account for it. */
+    if (unlikely (test_bit(REISERFS_OLD_FORMAT,
+                           &(REISERFS_SB(sb)->s_properties)))) {
+            block_nr_t bmap1 = REISERFS_SB(sb)->s_bh->b_blocknr + 1;
+            if (block >= REISERFS_SB(sb)->s_bh->b_blocknr + 1 + bmap &&
+                block <= REISERFS_SB(sb)->s_bh->b_blocknr + 1 + SB_BMAP_NR(s)) {
+                    reiserfs_warning (s, "vs: 4019: is_reusable: "
+                                      "bitmap block %lu(%u) can't be freed or "
+                                      "reused", block, SB_BMAP_NR (s));
+                    return 0
+            }
+    } else {
+            if (block & ((s->s_blocksize << 3) - 1 ) == 0)
+                    reiserfs_warning (s, "vs: 4020: is_reusable: "
+                                      "bitmap block %lu(%u) can't be freed or "
+                                      "reused", block, SB_BMAP_NR (s));
+                    return 0;
+                }
+            }
+    }
+
+
   
     get_bit_address (s, block, &i, &j);
 
@@ -85,16 +102,22 @@ int is_reusable (struct super_block * s,
 	return 0;
     }
 
+    bh  = read_bitmap_block (s, bmap);
+    if (!bh)
+        return 0;
+
     if ((bit_value == 0 && 
-         reiserfs_test_le_bit(j, SB_AP_BITMAP(s)[i].bh->b_data)) ||
+         reiserfs_test_le_bit(j, bh->b_data)) ||
 	(bit_value == 1 && 
-	 reiserfs_test_le_bit(j, SB_AP_BITMAP (s)[i].bh->b_data) == 0)) {
+	 reiserfs_test_le_bit(j, bh->b_data) == 0)) {
 	reiserfs_warning (s, "vs-4040: is_reusable: corresponding bit of block %lu does not "
 			  "match required value (i==%d, j==%d) test_bit==%d",
-		block, i, j, reiserfs_test_le_bit (j, SB_AP_BITMAP (s)[i].bh->b_data));
+		block, i, j, reiserfs_test_le_bit (j, bh->b_data));
 
+	brelse (bh);
 	return 0;
     }
+    brelse (bh);
 
     if (bit_value == 0 && block == SB_ROOT_BLOCK (s)) {
 	reiserfs_warning (s, "vs-4050: is_reusable: this is root block (%u), "
@@ -134,6 +157,7 @@ static int scan_bitmap_block (struct rei
 {
     struct super_block *s = th->t_super;
     struct reiserfs_bitmap_info *bi=&SB_AP_BITMAP(s)[bmap_n];
+    struct buffer_head *bh;
     int end, next;
     int org = *beg;
 
@@ -150,22 +174,22 @@ static int scan_bitmap_block (struct rei
 	reiserfs_warning (s, "NULL bitmap info pointer for bitmap %d", bmap_n);
 	return 0;
     }
-    if (buffer_locked (bi->bh)) {
-       PROC_INFO_INC( s, scan_bitmap.wait );
-       __wait_on_buffer (bi->bh);
-    }
+
+    bh = read_bitmap_block (s, bmap_n);
+    if (!bh)
+        return 0;
 
     while (1) {
-	cont:
 	if (bi->free_count < min)
 		return 0; // No free blocks in this bitmap
 
 	/* search for a first zero bit -- beggining of a window */
 	*beg = reiserfs_find_next_zero_le_bit
-	        ((unsigned long*)(bi->bh->b_data), boundary, *beg);
+	        ((unsigned long*)(bh->b_data), boundary, *beg);
   
 	if (*beg + min > boundary) { /* search for a zero bit fails or the rest of bitmap block
 				      * cannot contain a zero window of minimum size */
+	    brelse (bh);
 	    return 0;
 	}
 
@@ -173,7 +197,7 @@ static int scan_bitmap_block (struct rei
 	    continue;
 	/* first zero bit found; we check next bits */
 	for (end = *beg + 1;; end ++) {
-	    if (end >= *beg + max || end >= boundary || reiserfs_test_le_bit (end, bi->bh->b_data)) {
+	    if (end >= *beg + max || end >= boundary || reiserfs_test_le_bit (end, bh->b_data)) {
 		next = end;
 		break;
 	    }
@@ -187,11 +211,11 @@ static int scan_bitmap_block (struct rei
 	 * (end) points to one bit after the window end */
 	if (end - *beg >= min) { /* it seems we have found window of proper size */
 	    int i;
-	    reiserfs_prepare_for_journal (s, bi->bh, 1);
+	    reiserfs_prepare_for_journal (s, bh, 1);
 	    /* try to set all blocks used checking are they still free */
 	    for (i = *beg; i < end; i++) {
 		/* It seems that we should not check in journal again. */
-		if (reiserfs_test_and_set_le_bit (i, bi->bh->b_data)) {
+		if (reiserfs_test_and_set_le_bit (i, bh->b_data)) {
 		    /* bit was set by another process
 		     * while we slept in prepare_for_journal() */
 		    PROC_INFO_INC( s, scan_bitmap.stolen );
@@ -202,21 +226,22 @@ static int scan_bitmap_block (struct rei
 		    }
 		    /* otherwise we clear all bit were set ... */
 		    while (--i >= *beg)
-			reiserfs_test_and_clear_le_bit (i, bi->bh->b_data);
-		    reiserfs_restore_prepared_buffer (s, bi->bh);
+			reiserfs_test_and_clear_le_bit (i, bh->b_data);
+		    reiserfs_restore_prepared_buffer (s, bh);
 		    *beg = org;
 		    /* ... and search again in current block from beginning */
-		    goto cont;	
+		    continue;
 		}
 	    }
 	    bi->free_count -= (end - *beg);
-	    journal_mark_dirty (th, s, bi->bh);
+	    journal_mark_dirty (th, s, bh);
 
 	    /* free block count calculation */
 	    reiserfs_prepare_for_journal (s, SB_BUFFER_WITH_SB(s), 1);
 	    PUT_SB_FREE_BLOCKS(s, SB_FREE_BLOCKS(s) - (end - *beg));
 	    journal_mark_dirty (th, s, SB_BUFFER_WITH_SB(s));
 
+	    brelse (bh);
 	    return end - (*beg);
 	} else {
 	    *beg = next;
@@ -349,7 +374,7 @@ static void _reiserfs_free_block (struct
 {
     struct super_block * s = th->t_super;
     struct reiserfs_super_block * rs;
-    struct buffer_head * sbh;
+    struct buffer_head * sbh, *bmbh;
     struct reiserfs_bitmap_info *apbi;
     int nr, offset;
 
@@ -370,16 +395,23 @@ static void _reiserfs_free_block (struct
 	return;
     }
 
-    reiserfs_prepare_for_journal(s, apbi[nr].bh, 1 ) ;
+    bmbh = read_bitmap_block (s, nr);
+    if (!bmbh) {
+        reiserfs_warning (s, "jdm-4077: reiserfs_free_block: couldn't read bitmap %d\n", nr);
+        return;
+    }
+
+    reiserfs_prepare_for_journal(s, bmbh, 1 ) ;
 
     /* clear bit for the given block in bit map */
-    if (!reiserfs_test_and_clear_le_bit (offset, apbi[nr].bh->b_data)) {
+    if (!reiserfs_test_and_clear_le_bit (offset, bmbh->b_data)) {
 	reiserfs_warning (s, "vs-4080: reiserfs_free_block: "
 			  "free_block (%s:%lu)[dev:blocknr]: bit already cleared",
 			  reiserfs_bdevname (s), block);
     }
     apbi[nr].free_count ++;
-    journal_mark_dirty (th, s, apbi[nr].bh);
+    journal_mark_dirty (th, s, bmbh);
+    brelse (bmbh);
 
     reiserfs_prepare_for_journal(s, sbh, 1) ;
     /* update super block */
@@ -1168,3 +1200,82 @@ int reiserfs_can_fit_pages ( struct supe
 
 	return space>0?space:0;
 }
+
+/* cache_bitmap_metadata - Caches bitmap metadata so that the bitmap itself
+ *                         need not be reloaded only to find that it is full.
+ * @bh: buffer_head containing the bitmap data
+ * @info: info struct to cache the data
+ *
+ * This will cache the number of free blocks and which block is the first
+ * available. 
+ *
+ * The values are considered uncached if ->first_zero_hint is 0, since
+ * the bitmap block itself always occupies block 0 of the bitmap.
+ *
+ */
+static void
+cache_bitmap_metadata (struct super_block *sb, struct buffer_head *bh,
+                       struct reiserfs_bitmap_info *info)
+{
+	unsigned long *cur = (unsigned long *)bh->b_data;
+	int i;
+
+	for (i = sb->s_blocksize / sizeof (*cur); i > 0; i--, cur++) {
+		/* 0 and ~0 are special, we can optimize for them */
+		if (*cur == 0) {
+			info->first_zero_hint = i << 3;
+			info->free_count += sizeof (*cur) << 3;
+		} else if (*cur != ~0L) { /* A mix, investigate */
+			int b;
+			for (b = sizeof (*cur) << 3; b >= 0; b--) {
+				if (!reiserfs_test_le_bit (b, cur)) {
+					info->first_zero_hint = (i << 3) + b;
+					info->free_count++;
+				}
+			}
+		}
+	}
+
+	/* The first bit must ALWAYS be 1 */
+	BUG_ON (info->first_zero_hint == 0);
+}
+
+/* read_bitmap_block - reads a bitmap block from disk dynamically
+ * @sb: super_block associated with filesystem
+ * @bitmap: bitmap number to load
+ *
+ * On huge filesystems, the initial load time for bitmaps is unacceptably long.
+ * Mount time as long as 15 minutes have been reported on huge (~ 15 TiB)
+ * filesystems. Pinning the bitmaps in memory on these huge filesystems is
+ * also a non-trivial resource use - 480 MB on that same 15 TiB filesystem.
+ * Loading the bitmaps dynamically on demand alleviates both problems.
+ */
+struct buffer_head *
+read_bitmap_block (struct super_block *sb, unsigned int bitmap)
+{
+	unsigned int block = (sb->s_blocksize << 3) * bitmap;
+	struct reiserfs_bitmap_info *info = SB_AP_BITMAP (sb) + bitmap;
+	struct buffer_head *bh;
+
+	/* Way old format filesystems had the bitmaps packed up front.
+	 * I doubt there are any of these left, but just in case... */
+	if (test_bit(REISERFS_OLD_FORMAT, &(REISERFS_SB(sb)->s_properties))) {
+		block = REISERFS_SB (sb)->s_sbh->b_blocknr + 1 + bitmap;
+	}
+
+	bh = sb_bread (sb, block);
+
+	if (bh == NULL) {
+		reiserfs_warning (sb, "jdm-4900: Cannot read bitmap %u "
+		                      "(block %u)", bitmap, block);
+		return NULL;
+	}
+
+	/* If we've already cached the metadata, ->first_zero_hint must be > 0,
+	 * since the bitmap itself occupies the first block described by the
+	 * bitmap */
+	if (info->first_zero_hint == 0)
+		cache_bitmap_metadata (sb, bh, info);
+
+	return bh;
+}
diff -ruNpX dontdiff linux-2.6.12.1/fs/reiserfs/resize.c linux-2.6.12.1.devel/fs/reiserfs/resize.c
--- linux-2.6.12.1/fs/reiserfs/resize.c	2005-03-02 02:37:55.000000000 -0500
+++ linux-2.6.12.1.devel/fs/reiserfs/resize.c	2005-06-30 16:13:07.000000000 -0400
@@ -21,9 +21,9 @@ int reiserfs_resize (struct super_block 
 {
         int err = 0;
 	struct reiserfs_super_block * sb;
-        struct reiserfs_bitmap_info *bitmap;
+	struct reiserfs_bitmap_info *bitmap, *info;
 	struct reiserfs_bitmap_info *old_bitmap = SB_AP_BITMAP(s);
-	struct buffer_head * bh;
+	struct buffer_head * bh, *bmbh;
 	struct reiserfs_transaction_handle th;
 	unsigned int bmap_nr_new, bmap_nr;
 	unsigned int block_r_new, block_r;
@@ -107,29 +107,31 @@ int reiserfs_resize (struct super_block 
 	
 	    /* allocate additional bitmap blocks, reallocate array of bitmap
 	     * block pointers */
-	    bitmap = vmalloc(sizeof(struct reiserfs_bitmap_info) * bmap_nr_new);
+	    bitmap = vmalloc(sizeof(*bitmap) * bmap_nr_new);
 	    if (!bitmap) {
 		/* Journal bitmaps are still supersized, but the memory isn't
 		 * leaked, so I guess it's ok */
 		printk("reiserfs_resize: unable to allocate memory.\n");
 		return -ENOMEM;
 	    }
-	    memset (bitmap, 0, sizeof (struct reiserfs_bitmap_info) * SB_BMAP_NR(s));
-	    for (i = 0; i < bmap_nr; i++)
-		bitmap[i] = old_bitmap[i];
+
+	    /* Copy what we have, clear out the rest */
+	    memcpy (bitmap, old_bitmap, sizeof (*bitmap) * SB_BMAP_NR(s));
+	    memset (bitmap + SB_BMAP_NR(s), 0,
+	            sizeof (*bitmap) * (bmap_nr - SB_BMAP_NR(s)));
 
 	    /* This doesn't go through the journal, but it doesn't have to.
 	     * The changes are still atomic: We're synced up when the journal
 	     * transaction begins, and the new bitmaps don't matter if the
 	     * transaction fails. */
 	    for (i = bmap_nr; i < bmap_nr_new; i++) {
-		bitmap[i].bh = sb_getblk(s, i * s->s_blocksize * 8);
-		memset(bitmap[i].bh->b_data, 0, sb_blocksize(sb));
-		reiserfs_test_and_set_le_bit(0, bitmap[i].bh->b_data);
-
-		set_buffer_uptodate(bitmap[i].bh);
-		mark_buffer_dirty(bitmap[i].bh) ;
-		sync_dirty_buffer(bitmap[i].bh);
+		bmbh = sb_bread (s, i * s->s_blocksize * 8);
+		memset(bmbh->b_data, 0, sb_blocksize(sb));
+		reiserfs_test_and_set_le_bit(0, bmbh->b_data);
+
+		set_buffer_uptodate(bmbh);
+		mark_buffer_dirty(bmbh) ;
+		sync_dirty_buffer(bmbh);
 		// update bitmap_info stuff
 		bitmap[i].first_zero_hint=1;
 		bitmap[i].free_count = sb_blocksize(sb) * 8 - 1;
@@ -146,27 +148,46 @@ int reiserfs_resize (struct super_block 
 	if (err)
 	    return err;
 
-	/* correct last bitmap blocks in old and new disk layout */
-	reiserfs_prepare_for_journal(s, SB_AP_BITMAP(s)[bmap_nr - 1].bh, 1);
-	for (i = block_r; i < s->s_blocksize * 8; i++)
-	    reiserfs_test_and_clear_le_bit(i, 
-					   SB_AP_BITMAP(s)[bmap_nr - 1].bh->b_data);
-	SB_AP_BITMAP(s)[bmap_nr - 1].free_count += s->s_blocksize * 8 - block_r;
-	if ( !SB_AP_BITMAP(s)[bmap_nr - 1].first_zero_hint)
-	    SB_AP_BITMAP(s)[bmap_nr - 1].first_zero_hint = block_r;
+	/* Extend old last bitmap block - new blocks have been made available */
+	bmbh = read_bitmap_block (s, bmap_nr - 1);
+	if (!bmbh) {
+	    int jerr = journal_end (&th, s, 10);
+	    if (jerr)
+		return jerr;
+	    return -EIO;
+	}
 
-	journal_mark_dirty(&th, s, SB_AP_BITMAP(s)[bmap_nr - 1].bh);
+	info = SB_AP_BITMAP(s) + bmap_nr - 1;
+	reiserfs_prepare_for_journal(s, bmbh, 1);
+	for (i = block_r; i < s->s_blocksize * 8; i++)
+	    reiserfs_test_and_clear_le_bit(i, bmbh->b_data);
+	info->free_count += s->s_blocksize * 8 - block_r;
+	if ( !info->first_zero_hint)
+	    info->first_zero_hint = block_r;
+
+	journal_mark_dirty(&th, s, bmbh);
+	brelse (bmbh);
+
+	/* Correct new last bitmap block - It may not be full */
+	bmbh = read_bitmap_block (s, bmap_nr_new - 1);
+	info = SB_AP_BITMAP(s) + bmap_nr_new - 1;
+	if (!bmbh) {
+	    int jerr = journal_end (&th, s, 10);
+	    if (jerr)
+		return jerr;
+	    return -EIO;
+	}
 
-	reiserfs_prepare_for_journal(s, SB_AP_BITMAP(s)[bmap_nr_new - 1].bh, 1);
+	reiserfs_prepare_for_journal(s, bmbh, 1);
 	for (i = block_r_new; i < s->s_blocksize * 8; i++)
-	    reiserfs_test_and_set_le_bit(i,
-					 SB_AP_BITMAP(s)[bmap_nr_new - 1].bh->b_data);
-	journal_mark_dirty(&th, s, SB_AP_BITMAP(s)[bmap_nr_new - 1].bh);
+	    reiserfs_test_and_set_le_bit(i, bmbh->b_data);
+	journal_mark_dirty(&th, s, bmbh);
  
-	SB_AP_BITMAP(s)[bmap_nr_new - 1].free_count -= s->s_blocksize * 8 - block_r_new;
+	info->free_count -= s->s_blocksize * 8 - block_r_new;
 	/* Extreme case where last bitmap is the only valid block in itself. */
-	if ( !SB_AP_BITMAP(s)[bmap_nr_new - 1].free_count )
-	    SB_AP_BITMAP(s)[bmap_nr_new - 1].first_zero_hint = 0;
+	if ( !info->free_count )
+	    info->first_zero_hint = 0;
+
  	/* update super */
 	reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1) ;
 	free_blocks = SB_FREE_BLOCKS(s);
diff -ruNpX dontdiff linux-2.6.12.1/fs/reiserfs/super.c linux-2.6.12.1.devel/fs/reiserfs/super.c
--- linux-2.6.12.1/fs/reiserfs/super.c	2005-06-30 12:51:42.000000000 -0400
+++ linux-2.6.12.1.devel/fs/reiserfs/super.c	2005-06-30 16:15:26.000000000 -0400
@@ -417,7 +417,6 @@ int remove_save_link (struct inode * ino
 
 static void reiserfs_put_super (struct super_block * s)
 {
-  int i;
   struct reiserfs_transaction_handle th ;
   th.t_trans_id = 0;
 
@@ -445,9 +444,6 @@ static void reiserfs_put_super (struct s
   */
   journal_release(&th, s) ;
 
-  for (i = 0; i < SB_BMAP_NR (s); i ++)
-    brelse (SB_AP_BITMAP (s)[i].bh);
-
   vfree (SB_AP_BITMAP (s));
 
   brelse (SB_BUFFER_WITH_SB (s));
@@ -1188,6 +1184,20 @@ static int reiserfs_remount (struct supe
   return 0;
 }
 
+static struct reiserfs_bitmap_info *
+init_bitmap_cache (struct super_block *sb)
+{
+	struct reiserfs_bitmap_info *bitmap;
+
+	bitmap = vmalloc (sizeof (*bitmap) * SB_BMAP_NR (sb));
+	if (bitmap)
+		memset (bitmap, 0, sizeof (*bitmap) * SB_BMAP_NR (sb));
+
+	return bitmap;
+}
+
+
+#if 0
 /* load_bitmap_info_data - Sets up the reiserfs_bitmap_info structure from disk.
  * @sb - superblock for this filesystem
  * @bi - the bitmap info to be loaded. Requires that bi->bh is valid.
@@ -1293,6 +1303,7 @@ static int read_old_bitmaps (struct supe
   return 0;
 }
 
+#endif
 static int read_super_block (struct super_block * s, int offset)
 {
     struct buffer_head * bh;
@@ -1389,7 +1400,6 @@ static int read_super_block (struct supe
 
 /* after journal replay, reread all bitmap and super blocks */
 static int reread_meta_blocks(struct super_block *s) {
-  int i ;
   ll_rw_block(READ, 1, &(SB_BUFFER_WITH_SB(s))) ;
   wait_on_buffer(SB_BUFFER_WITH_SB(s)) ;
   if (!buffer_uptodate(SB_BUFFER_WITH_SB(s))) {
@@ -1397,6 +1407,7 @@ static int reread_meta_blocks(struct sup
     return 1 ;
   }
 
+#if 0
   for (i = 0; i < SB_BMAP_NR(s) ; i++) {
     ll_rw_block(READ, 1, &(SB_AP_BITMAP(s)[i].bh)) ;
     wait_on_buffer(SB_AP_BITMAP(s)[i].bh) ;
@@ -1406,6 +1417,7 @@ static int reread_meta_blocks(struct sup
       return 1 ;
     }
   }
+#endif
   return 0 ;
 
 }
@@ -1639,8 +1651,9 @@ static int reiserfs_fill_super (struct s
     sbi->s_mount_state = SB_REISERFS_STATE(s);
     sbi->s_mount_state = REISERFS_VALID_FS ;
 
-    if (old_format ? read_old_bitmaps(s) : read_bitmaps(s)) {
-	SWARN(silent, s, "jmacd-8: reiserfs_fill_super: unable to read bitmap");
+    SB_AP_BITMAP(s) = init_bitmap_cache (s);
+    if (!SB_AP_BITMAP(s)) {
+	SWARN(silent, s, "jdm-8: reiserfs_fill_super: unable to init bitmap cache");
 	goto error;
     }
 #ifdef CONFIG_REISERFS_CHECK
@@ -1799,12 +1812,7 @@ static int reiserfs_fill_super (struct s
 	journal_release_error(NULL, s) ;
     }
     if (SB_DISK_SUPER_BLOCK (s)) {
-	for (j = 0; j < SB_BMAP_NR (s); j ++) {
-	    if (SB_AP_BITMAP (s))
-		brelse (SB_AP_BITMAP (s)[j].bh);
-	}
-	if (SB_AP_BITMAP (s))
-	    vfree (SB_AP_BITMAP (s));
+	vfree (SB_AP_BITMAP (s));
     }
     if (SB_BUFFER_WITH_SB (s))
 	brelse(SB_BUFFER_WITH_SB (s));
diff -ruNpX dontdiff linux-2.6.12.1/include/linux/reiserfs_fs.h linux-2.6.12.1.devel/include/linux/reiserfs_fs.h
--- linux-2.6.12.1/include/linux/reiserfs_fs.h	2005-06-30 12:51:48.000000000 -0400
+++ linux-2.6.12.1.devel/include/linux/reiserfs_fs.h	2005-06-30 16:13:59.000000000 -0400
@@ -2111,6 +2111,7 @@ void reiserfs_init_alloc_options (struct
  */
 __le32 reiserfs_choose_packing(struct inode *dir);
 
+struct buffer_head * read_bitmap_block (struct super_block *sb, unsigned int bitmap);
 int is_reusable (struct super_block * s, b_blocknr_t block, int bit_value);
 void reiserfs_free_block (struct reiserfs_transaction_handle *th, struct inode *, b_blocknr_t, int for_unformatted);
 int reiserfs_allocate_blocknrs(reiserfs_blocknr_hint_t *, b_blocknr_t * , int, int);
diff -ruNpX dontdiff linux-2.6.12.1/include/linux/reiserfs_fs_sb.h linux-2.6.12.1.devel/include/linux/reiserfs_fs_sb.h
--- linux-2.6.12.1/include/linux/reiserfs_fs_sb.h	2005-03-02 02:38:09.000000000 -0500
+++ linux-2.6.12.1.devel/include/linux/reiserfs_fs_sb.h	2005-06-30 15:43:09.000000000 -0400
@@ -269,7 +269,6 @@ struct reiserfs_bitmap_info
     // FIXME: Won't work with block sizes > 8K
     __u16  first_zero_hint;
     __u16  free_count;
-    struct buffer_head *bh; /* the actual bitmap */
 };
 
 struct proc_dir_entry;
@@ -419,6 +418,7 @@ struct reiserfs_sb_info
 /* Definitions of reiserfs on-disk properties: */
 #define REISERFS_3_5 0
 #define REISERFS_3_6 1
+#define REISERFS_OLD_FORMAT 2
 
 enum reiserfs_mount_options {
 /* Mount options */

--------------010201010208050309050107--
