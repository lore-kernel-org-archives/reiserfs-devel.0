From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 1/3] reiserfs: fix usage of signed ints for block numbers
Date: Tue, 07 Aug 2007 11:28:33 -0400
Message-ID: <46B88FA1.5080902@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>

 This patch does a quick signedness check for block numbers. There are
 a number of places where signed integers are used for block numbers,
 which limits the usable file system size to 8 TiB. The disk format,
 excepting a problem which will be fixed in the following patch,
 supports file systems up to 16 TiB in size. This patch cleans up those
 sites so that we can enable the full usable size.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

---

 fs/reiserfs/bitmap.c        |   20 +++++++++++---------
 fs/reiserfs/inode.c         |    8 ++++----
 fs/reiserfs/journal.c       |   12 +++++++-----
 fs/reiserfs/stree.c         |    2 +-
 include/linux/reiserfs_fs.h |    8 +++++---
 5 files changed, 28 insertions(+), 22 deletions(-)

--- a/fs/reiserfs/bitmap.c	2007-08-07 11:07:20.000000000 -0400
+++ b/fs/reiserfs/bitmap.c	2007-08-07 11:07:22.000000000 -0400
@@ -47,7 +47,9 @@
     test_bit(_ALLOC_ ## optname , &SB_ALLOC_OPTS(s))
 
 static inline void get_bit_address(struct super_block *s,
-				   b_blocknr_t block, int *bmap_nr, int *offset)
+				   b_blocknr_t block,
+				   unsigned int *bmap_nr,
+				   unsigned int *offset)
 {
 	/* It is in the bitmap block number equal to the block
 	 * number divided by the number of bits in a block. */
@@ -59,7 +61,7 @@ static inline void get_bit_address(struc
 #ifdef CONFIG_REISERFS_CHECK
 int is_reusable(struct super_block *s, b_blocknr_t block, int bit_value)
 {
-	int bmap, offset;
+	unsigned int bmap, offset;
 
 	if (block == 0 || block >= SB_BLOCK_COUNT(s)) {
 		reiserfs_warning(s,
@@ -132,8 +134,8 @@ static inline int is_block_in_journal(st
 /* it searches for a window of zero bits with given minimum and maximum lengths in one bitmap
  * block; */
 static int scan_bitmap_block(struct reiserfs_transaction_handle *th,
-			     int bmap_n, int *beg, int boundary, int min,
-			     int max, int unfm)
+                             unsigned int bmap_n, int *beg, int boundary,
+                             int min, int max, int unfm)
 {
 	struct super_block *s = th->t_super;
 	struct reiserfs_bitmap_info *bi = &SB_AP_BITMAP(s)[bmap_n];
@@ -309,16 +311,16 @@ __le32 reiserfs_choose_packing(struct in
  * bitmap and place new blocks there. Returns number of allocated blocks. */
 static int scan_bitmap(struct reiserfs_transaction_handle *th,
 		       b_blocknr_t * start, b_blocknr_t finish,
-		       int min, int max, int unfm, unsigned long file_block)
+		       int min, int max, int unfm, sector_t file_block)
 {
 	int nr_allocated = 0;
 	struct super_block *s = th->t_super;
 	/* find every bm and bmap and bmap_nr in this file, and change them all to bitmap_blocknr
 	 * - Hans, it is not a block number - Zam. */
 
-	int bm, off;
-	int end_bm, end_off;
-	int off_max = s->s_blocksize << 3;
+	unsigned int bm, off;
+	unsigned int end_bm, end_off;
+	unsigned int off_max = s->s_blocksize << 3;
 
 	BUG_ON(!th->t_trans_id);
 
@@ -385,7 +387,7 @@ static void _reiserfs_free_block(struct 
 	struct reiserfs_super_block *rs;
 	struct buffer_head *sbh, *bmbh;
 	struct reiserfs_bitmap_info *apbi;
-	int nr, offset;
+	unsigned int nr, offset;
 
 	BUG_ON(!th->t_trans_id);
 
--- a/fs/reiserfs/inode.c	2007-08-07 11:07:20.000000000 -0400
+++ b/fs/reiserfs/inode.c	2007-08-07 11:07:22.000000000 -0400
@@ -197,7 +197,7 @@ static inline void set_block_dev_mapped(
 // files which were created in the earlier version can not be longer,
 // than 2 gb
 //
-static int file_capable(struct inode *inode, long block)
+static int file_capable(struct inode *inode, sector_t block)
 {
 	if (get_inode_item_key_version(inode) != KEY_FORMAT_3_5 ||	// it is new file.
 	    block < (1 << (31 - inode->i_sb->s_blocksize_bits)))	// old file, but 'block' is inside of 2gb
@@ -240,7 +240,7 @@ static int file_capable(struct inode *in
 // Please improve the english/clarity in the comment above, as it is
 // hard to understand.
 
-static int _get_block_create_0(struct inode *inode, long block,
+static int _get_block_create_0(struct inode *inode, sector_t block,
 			       struct buffer_head *bh_result, int args)
 {
 	INITIALIZE_PATH(path);
@@ -248,7 +248,7 @@ static int _get_block_create_0(struct in
 	struct buffer_head *bh;
 	struct item_head *ih, tmp_ih;
 	int fs_gen;
-	int blocknr;
+	b_blocknr_t blocknr;
 	char *p = NULL;
 	int chars;
 	int ret;
@@ -567,7 +567,7 @@ static int convert_tail_for_hole(struct 
 }
 
 static inline int _allocate_block(struct reiserfs_transaction_handle *th,
-				  long block,
+				  sector_t block,
 				  struct inode *inode,
 				  b_blocknr_t * allocated_block_nr,
 				  struct treepath *path, int flags)
--- a/fs/reiserfs/journal.c	2007-08-07 11:07:20.000000000 -0400
+++ b/fs/reiserfs/journal.c	2007-08-07 11:07:22.000000000 -0400
@@ -219,11 +219,12 @@ static void allocate_bitmap_nodes(struct
 	}
 }
 
-static int set_bit_in_list_bitmap(struct super_block *p_s_sb, int block,
+static int set_bit_in_list_bitmap(struct super_block *p_s_sb,
+                                  unsigned int block,
 				  struct reiserfs_list_bitmap *jb)
 {
-	int bmap_nr = block / (p_s_sb->s_blocksize << 3);
-	int bit_nr = block % (p_s_sb->s_blocksize << 3);
+	unsigned int bmap_nr = block / (p_s_sb->s_blocksize << 3);
+	unsigned int bit_nr = block % (p_s_sb->s_blocksize << 3);
 
 	if (!jb->bitmaps[bmap_nr]) {
 		jb->bitmaps[bmap_nr] = get_bitmap_node(p_s_sb);
@@ -2279,8 +2280,9 @@ static int journal_read_transaction(stru
    Right now it is only used from journal code. But later we might use it
    from other places.
    Note: Do not use journal_getblk/sb_getblk functions here! */
-static struct buffer_head *reiserfs_breada(struct block_device *dev, int block,
-					   int bufsize, unsigned int max_block)
+static struct buffer_head *reiserfs_breada(struct block_device *dev,
+                                           b_blocknr_t block, int bufsize,
+                                           b_blocknr_t max_block)
 {
 	struct buffer_head *bhlist[BUFNR];
 	unsigned int blocks = BUFNR;
--- a/fs/reiserfs/stree.c	2007-08-07 11:07:20.000000000 -0400
+++ b/fs/reiserfs/stree.c	2007-08-07 11:07:22.000000000 -0400
@@ -611,7 +611,7 @@ int search_by_key(struct super_block *p_
 					   DISK_LEAF_NODE_LEVEL */
     )
 {
-	int n_block_number;
+	b_blocknr_t n_block_number;
 	int expected_level;
 	struct buffer_head *p_s_bh;
 	struct path_element *p_s_last_element;
--- a/include/linux/reiserfs_fs.h	2007-08-07 11:07:20.000000000 -0400
+++ b/include/linux/reiserfs_fs.h	2007-08-07 11:07:22.000000000 -0400
@@ -2043,7 +2043,7 @@ struct buffer_head *get_FEB(struct tree_
  * arguments, such as node, search path, transaction_handle, etc. */
 struct __reiserfs_blocknr_hint {
 	struct inode *inode;	/* inode passed to allocator, if we allocate unf. nodes */
-	long block;		/* file offset, in blocks */
+	sector_t block;		/* file offset, in blocks */
 	struct in_core_key key;
 	struct treepath *path;	/* search path, used by allocator to deternine search_start by
 				 * various ways */
@@ -2101,7 +2101,8 @@ static inline int reiserfs_new_form_bloc
 static inline int reiserfs_new_unf_blocknrs(struct reiserfs_transaction_handle
 					    *th, struct inode *inode,
 					    b_blocknr_t * new_blocknrs,
-					    struct treepath *path, long block)
+					    struct treepath *path,
+					    sector_t block)
 {
 	reiserfs_blocknr_hint_t hint = {
 		.th = th,
@@ -2118,7 +2119,8 @@ static inline int reiserfs_new_unf_block
 static inline int reiserfs_new_unf_blocknrs2(struct reiserfs_transaction_handle
 					     *th, struct inode *inode,
 					     b_blocknr_t * new_blocknrs,
-					     struct treepath *path, long block)
+					     struct treepath *path,
+					     sector_t block)
 {
 	reiserfs_blocknr_hint_t hint = {
 		.th = th,

-- 
Jeff Mahoney
SUSE Labs
