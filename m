From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 2/3] reiserfs: ignore s_bmap_nr on disk for file systems >=
 8 TiB
Date: Tue, 07 Aug 2007 11:28:36 -0400
Message-ID: <46B88FA4.1040900@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>

 The reiserfs disk format is designed to handle file systems up to
 2^32-1 blocks, which at 4KiB blocks means ~ 16 TiB - 4KiB.

 Unfortunately, the superblock's s_bmap_nr value, which contains a
 count of the number of bitmap blocks in the file system is a 16 bit
 value. This limits the usable size of the file system to
 8 TiB (4096^2 * 8 * 65536).

 Changing the disk format this late in the game, especially with a file
 system without sane superblock versioning, is a tough sell. This patch
 implements the following changes:

 * The s_bmap_nr value is no longer accessed directly. Instead, an
   in-core 32-bit value is used instead. The real value is only
   accessed directly during mount and resize.
 * If the value of s_bmap_nr is valid, then the value is used as-is.
 * If the value of s_bmap_nr has overflowed, the on-disk value is
   zeroed out and the number of bitmaps is calculate on mount and
   resize.

 The reason for zeroing it out is simple. If it has overflowed, it's
 invalid anyway. Kernels mounting these file systems may end up
 with unpredictible results, the most obvious of which occurs in
 kernels with dynamic bitmaps: it will BUG almost immediately.
 Alternatively, if the value is zeroed, the memory allocation for
 tracking the bitmap blocks will end up being vmalloc(0), causing
 mount to fail when a NULL pointer is returned. Since the
 ZERO_SIZE_PTR changes haven't been merged in these older kernels,
 the failure won't result in an Oops, just a failed mount.

 A matching change for reiserfsprogs will also be submitted to support
 the s_bmap_nr == 0 value as valid.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

---

 fs/reiserfs/bitmap.c           |   44 +++++++++++++++++++++++++----------------
 fs/reiserfs/journal.c          |    6 ++---
 fs/reiserfs/resize.c           |    9 ++++++--
 include/linux/reiserfs_fs.h    |    3 ++
 include/linux/reiserfs_fs_sb.h |    1 
 5 files changed, 41 insertions(+), 22 deletions(-)

--- a/fs/reiserfs/bitmap.c	2007-08-07 11:07:22.000000000 -0400
+++ b/fs/reiserfs/bitmap.c	2007-08-07 11:07:29.000000000 -0400
@@ -77,25 +77,26 @@ int is_reusable(struct super_block *s, b
 	if (unlikely(test_bit(REISERFS_OLD_FORMAT,
 			      &(REISERFS_SB(s)->s_properties)))) {
 		b_blocknr_t bmap1 = REISERFS_SB(s)->s_sbh->b_blocknr + 1;
-		if (block >= bmap1 && block <= bmap1 + SB_BMAP_NR(s)) {
+		if (block >= bmap1 &&
+		    block <= bmap1 + REISERFS_SB(s)->s_bmap_nr) {
 			reiserfs_warning(s, "vs: 4019: is_reusable: "
 					 "bitmap block %lu(%u) can't be freed or reused",
-					 block, SB_BMAP_NR(s));
+					 block, REISERFS_SB(s)->s_bmap_nr);
 			return 0;
 		}
 	} else {
 		if (offset == 0) {
 			reiserfs_warning(s, "vs: 4020: is_reusable: "
 					 "bitmap block %lu(%u) can't be freed or reused",
-					 block, SB_BMAP_NR(s));
+					 block, REISERFS_SB(s)->s_bmap_nr);
 			return 0;
 		}
 	}
 
-	if (bmap >= SB_BMAP_NR(s)) {
+	if (bmap >= REISERFS_SB(s)->s_bmap_nr) {
 		reiserfs_warning(s,
 				 "vs-4030: is_reusable: there is no so many bitmap blocks: "
-				 "block=%lu, bitmap_nr=%d", block, bmap);
+				 "block=%lu, bitmap_nr=%u", block, bmap);
 		return 0;
 	}
 
@@ -145,8 +146,8 @@ static int scan_bitmap_block(struct reis
 
 	BUG_ON(!th->t_trans_id);
 
-	RFALSE(bmap_n >= SB_BMAP_NR(s), "Bitmap %d is out of range (0..%d)",
-	       bmap_n, SB_BMAP_NR(s) - 1);
+	RFALSE(bmap_n >= REISERFS_SB(s)->s_bmap_nr, "Bitmap %u is out of range (0..%u)",
+	       bmap_n, REISERFS_SB(s)->s_bmap_nr - 1);
 	PROC_INFO_INC(s, scan_bitmap.bmap);
 /* this is unclear and lacks comments, explain how journal bitmaps
    work here for the reader.  Convey a sense of the design here. What
@@ -251,12 +252,12 @@ static int bmap_hash_id(struct super_blo
 	} else {
 		hash_in = (char *)(&id);
 		hash = keyed_hash(hash_in, 4);
-		bm = hash % SB_BMAP_NR(s);
+		bm = hash % REISERFS_SB(s)->s_bmap_nr;
 		if (!bm)
 			bm = 1;
 	}
 	/* this can only be true when SB_BMAP_NR = 1 */
-	if (bm >= SB_BMAP_NR(s))
+	if (bm >= REISERFS_SB(s)->s_bmap_nr)
 		bm = 0;
 	return bm;
 }
@@ -330,10 +331,10 @@ static int scan_bitmap(struct reiserfs_t
 
 	get_bit_address(s, *start, &bm, &off);
 	get_bit_address(s, finish, &end_bm, &end_off);
-	if (bm > SB_BMAP_NR(s))
+	if (bm > REISERFS_SB(s)->s_bmap_nr)
 		return 0;
-	if (end_bm > SB_BMAP_NR(s))
-		end_bm = SB_BMAP_NR(s);
+	if (end_bm > REISERFS_SB(s)->s_bmap_nr)
+		end_bm = REISERFS_SB(s)->s_bmap_nr;
 
 	/* When the bitmap is more than 10% free, anyone can allocate.
 	 * When it's less than 10% free, only files that already use the
@@ -399,10 +400,12 @@ static void _reiserfs_free_block(struct 
 
 	get_bit_address(s, block, &nr, &offset);
 
-	if (nr >= sb_bmap_nr(rs)) {
+	if (nr >= REISERFS_SB(s)->s_bmap_nr) {
 		reiserfs_warning(s, "vs-4075: reiserfs_free_block: "
-				 "block %lu is out of range on %s",
-				 block, reiserfs_bdevname(s));
+				 "block %lu is out of range on %s "
+				 "(nr=%u,max=%u)", block,
+				 reiserfs_bdevname(s), nr,
+				 REISERFS_SB(s)->s_bmap_nr);
 		return;
 	}
 
@@ -1326,14 +1329,21 @@ struct buffer_head *reiserfs_read_bitmap
 int reiserfs_init_bitmap_cache(struct super_block *sb)
 {
 	struct reiserfs_bitmap_info *bitmap;
+	unsigned int blocks = SB_BLOCK_COUNT(sb);
+	unsigned int bmap_nr = blocks >> (sb->s_blocksize_bits + 3);
 
-	bitmap = vmalloc(sizeof (*bitmap) * SB_BMAP_NR(sb));
+	if (blocks & ~(sb->s_blocksize << 3))
+		++bmap_nr;
+
+
+	bitmap = vmalloc(sizeof (*bitmap) * bmap_nr);
 	if (bitmap == NULL)
 		return -ENOMEM;
 
-	memset(bitmap, 0, sizeof (*bitmap) * SB_BMAP_NR(sb));
+	memset(bitmap, 0, sizeof (*bitmap) * bmap_nr);
 
 	SB_AP_BITMAP(sb) = bitmap;
+	REISERFS_SB(sb)->s_bmap_nr = bmap_nr;
 
 	return 0;
 }
--- a/fs/reiserfs/journal.c	2007-08-07 11:07:22.000000000 -0400
+++ b/fs/reiserfs/journal.c	2007-08-07 11:07:29.000000000 -0400
@@ -240,7 +240,7 @@ static void cleanup_bitmap_list(struct s
 	if (jb->bitmaps == NULL)
 		return;
 
-	for (i = 0; i < SB_BMAP_NR(p_s_sb); i++) {
+	for (i = 0; i < REISERFS_SB(p_s_sb)->s_bmap_nr; i++) {
 		if (jb->bitmaps[i]) {
 			free_bitmap_node(p_s_sb, jb->bitmaps[i]);
 			jb->bitmaps[i] = NULL;
@@ -2651,7 +2651,7 @@ int journal_init(struct super_block *p_s
 	journal->j_persistent_trans = 0;
 	if (reiserfs_allocate_list_bitmaps(p_s_sb,
 					   journal->j_list_bitmap,
-					   SB_BMAP_NR(p_s_sb)))
+					   REISERFS_SB(p_s_sb)->s_bmap_nr))
 		goto free_and_return;
 	allocate_bitmap_nodes(p_s_sb);
 
@@ -2659,7 +2659,7 @@ int journal_init(struct super_block *p_s
 	SB_JOURNAL_1st_RESERVED_BLOCK(p_s_sb) = (old_format ?
 						 REISERFS_OLD_DISK_OFFSET_IN_BYTES
 						 / p_s_sb->s_blocksize +
-						 SB_BMAP_NR(p_s_sb) +
+						 REISERFS_SB(p_s_sb)->s_bmap_nr +
 						 1 :
 						 REISERFS_DISK_OFFSET_IN_BYTES /
 						 p_s_sb->s_blocksize + 2);
--- a/fs/reiserfs/resize.c	2007-08-07 11:07:25.000000000 -0400
+++ b/fs/reiserfs/resize.c	2007-08-07 11:07:29.000000000 -0400
@@ -61,7 +61,7 @@ int reiserfs_resize(struct super_block *
 	}
 
 	/* count used bits in last bitmap block */
-	block_r = SB_BLOCK_COUNT(s) - (SB_BMAP_NR(s) - 1) * s->s_blocksize * 8;
+	block_r = SB_BLOCK_COUNT(s) - (REISERFS_SB(s)->s_bmap_nr - 1) * s->s_blocksize * 8;
 
 	/* count bitmap blocks in new fs */
 	bmap_nr_new = block_count_new / (s->s_blocksize * 8);
@@ -73,7 +73,7 @@ int reiserfs_resize(struct super_block *
 
 	/* save old values */
 	block_count = SB_BLOCK_COUNT(s);
-	bmap_nr = SB_BMAP_NR(s);
+	bmap_nr = REISERFS_SB(s)->s_bmap_nr;
 
 	/* resizing of reiserfs bitmaps (journal and real), if needed */
 	if (bmap_nr_new > bmap_nr) {
@@ -206,6 +206,11 @@ int reiserfs_resize(struct super_block *
 			   free_blocks + (block_count_new - block_count -
 					  (bmap_nr_new - bmap_nr)));
 	PUT_SB_BLOCK_COUNT(s, block_count_new);
+
+	REISERFS_SB(s)->s_bmap_nr = bmap_nr_new;
+	if (bmap_would_wrap(bmap_nr_new))
+		bmap_nr_new = 0;
+
 	PUT_SB_BMAP_NR(s, bmap_nr_new);
 	s->s_dirt = 1;
 
--- a/include/linux/reiserfs_fs.h	2007-08-07 11:07:22.000000000 -0400
+++ b/include/linux/reiserfs_fs.h	2007-08-07 11:07:29.000000000 -0400
@@ -229,6 +229,9 @@ struct reiserfs_super_block {
          ((!is_reiserfs_jr(SB_DISK_SUPER_BLOCK(s)) ? \
          SB_ONDISK_JOURNAL_SIZE(s) + 1 : SB_ONDISK_RESERVED_FOR_JOURNAL(s)))
 
+/* s_bmap_nr is a u16 */
+#define bmap_would_wrap(n)		(n >= 65536)
+
 int is_reiserfs_3_5(struct reiserfs_super_block *rs);
 int is_reiserfs_3_6(struct reiserfs_super_block *rs);
 int is_reiserfs_jr(struct reiserfs_super_block *rs);
--- a/include/linux/reiserfs_fs_sb.h	2007-08-07 11:07:14.000000000 -0400
+++ b/include/linux/reiserfs_fs_sb.h	2007-08-07 11:07:29.000000000 -0400
@@ -410,6 +410,7 @@ struct reiserfs_sb_info {
 	char *s_qf_names[MAXQUOTAS];
 	int s_jquota_fmt;
 #endif
+	unsigned int s_bmap_nr;
 };
 
 /* Definitions of reiserfs on-disk properties: */

