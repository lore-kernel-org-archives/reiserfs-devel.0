From: "Vladimir V. Saveliev" <saveliev.v.v@gmail.com>
Subject: Re: [PATCH] reiserfs: > 8 TB fs support
Date: Tue, 07 Aug 2007 17:46:52 +0300
Message-ID: <46B885DC.1030907@namesys.com>
References: <46B77DAD.3030805@suse.com>
Reply-To: vs@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:reply-to:user-agent:x-accept-language:mime-version:to:cc:subject:references:in-reply-to:content-type:content-transfer-encoding:from;
        b=P3juZW2a5s8ltGJrLqSddhOirf7v8Jb44Qg18XadN0jky0nnbSZI0G7PD4/jJD8UmXNheD5K55FKFqCJNWJHEta4AOlFZjGX420V8tTJrgk8jUBqo/W9Bv6wCgNieLUpljLtk7W+g8BKsu/1waoY6dKrVOpVdG4If20yXt7/gGg=
In-Reply-To: <46B77DAD.3030805@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Hello

yes, thanks for making a fix for this old bug.
I just made few trivial warnings below.

Jeff Mahoney wrote:
> Oops. My MUA still had the old address in it.
> 
>  The reiserfs disk format is designed to handle file systems up to
>  2^32-1 blocks, which at 4KiB blocks means ~ 16 TiB - 4KiB.
> 
>  Unfortunately, the superblock's s_bmap_nr value, which contains a
>  count of the number of bitmap blocks in the file system is a 16 bit
>  value. This limits the usable size of the file system to
>  8 TiB (4096^2 * 8 * 65536).
> 
>  Changing the disk format this late in the game, especially with a file
>  system without sane superblock versioning, is a tough sell. This patch
>  implements the following changes:
> 
>  * The s_bmap_nr value is no longer accessed directly. Instead, an
>    in-core 32-bit value is used instead. The real value is only
>    accessed directly during mount and resize.
>  * If the value of s_bmap_nr is valid, then the value is used as-is.
>  * If the value of s_bmap_nr has overflowed, the on-disk value is
>    zeroed out and the number of bitmaps is calculate on mount and
>    resize.
>  * Quick audit for signed int variables used to store block numbers.
> 
>  The reason for zeroing it out is simple. If it has overflowed, it's
>  invalid anyway. Kernels mounting these file systems may end up
>  with unpredictible results, the most obvious of which occurs in
>  kernels with dynamic bitmaps: it will BUG almost immediately.
>  Alternatively, if the value is zeroed, the memory allocation for
>  tracking the bitmap blocks will end up being vmalloc(0), causing
>  mount to fail when a NULL pointer is returned. Since the
>  ZERO_SIZE_PTR changes haven't been merged in these older kernels,
>  the failure won't result in an Oops, just a failed mount.
> 
>  A matching change for reiserfsprogs will also be submitted to support
>  the s_bmap_nr == 0 value as valid.
> 
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
> 
> ---
> 
>  fs/reiserfs/bitmap.c           |   56 ++++++++++++++++++++++++-----------------
>  fs/reiserfs/inode.c            |   12 ++++----
>  fs/reiserfs/journal.c          |   18 +++++++------
>  fs/reiserfs/resize.c           |    9 +++++-
>  fs/reiserfs/stree.c            |    2 -
>  include/linux/reiserfs_fs.h    |    3 ++
>  include/linux/reiserfs_fs_sb.h |    1 
>  7 files changed, 62 insertions(+), 39 deletions(-)
> 
> --- a/fs/reiserfs/bitmap.c	2007-08-06 14:32:14.000000000 -0400
> +++ b/fs/reiserfs/bitmap.c	2007-08-06 15:31:40.000000000 -0400
> @@ -47,7 +47,9 @@
>      test_bit(_ALLOC_ ## optname , &SB_ALLOC_OPTS(s))
>  
>  static inline void get_bit_address(struct super_block *s,
> -				   b_blocknr_t block, int *bmap_nr, int *offset)
> +				   b_blocknr_t block,
> +				   unsigned int *bmap_nr,
> +				   unsigned int *offset)
>  {
>  	/* It is in the bitmap block number equal to the block
>  	 * number divided by the number of bits in a block. */
> @@ -59,7 +61,7 @@ static inline void get_bit_address(struc
>  #ifdef CONFIG_REISERFS_CHECK
>  int is_reusable(struct super_block *s, b_blocknr_t block, int bit_value)
>  {
> -	int bmap, offset;
> +	unsigned int bmap, offset;
>  
>  	if (block == 0 || block >= SB_BLOCK_COUNT(s)) {
>  		reiserfs_warning(s,
> @@ -75,22 +77,23 @@ int is_reusable(struct super_block *s, b
>  	if (unlikely(test_bit(REISERFS_OLD_FORMAT,
>  			      &(REISERFS_SB(s)->s_properties)))) {
>  		b_blocknr_t bmap1 = REISERFS_SB(s)->s_sbh->b_blocknr + 1;
> -		if (block >= bmap1 && block <= bmap1 + SB_BMAP_NR(s)) {
> +		if (block >= bmap1 &&
> +		    block <= bmap1 + REISERFS_SB(s)->s_bmap_nr) {
>  			reiserfs_warning(s, "vs: 4019: is_reusable: "
>  					 "bitmap block %lu(%u) can't be freed or reused",
> -					 block, SB_BMAP_NR(s));
> +					 block, REISERFS_SB(s)->s_bmap_nr);
>  			return 0;
>  		}
>  	} else {
>  		if (offset == 0) {
>  			reiserfs_warning(s, "vs: 4020: is_reusable: "
>  					 "bitmap block %lu(%u) can't be freed or reused",
> -					 block, SB_BMAP_NR(s));
> +					 block, REISERFS_SB(s)->s_bmap_nr);
>  			return 0;
>  		}
>  	}
>  
> -	if (bmap >= SB_BMAP_NR(s)) {
> +	if (bmap >= REISERFS_SB(s)->s_bmap_nr) {
>  		reiserfs_warning(s,
>  				 "vs-4030: is_reusable: there is no so many bitmap blocks: "
>  				 "block=%lu, bitmap_nr=%d", block, bmap);

bmap is now unsigned int, so printf specifier should be %u.

> @@ -143,8 +146,8 @@ static int scan_bitmap_block(struct reis
>  

Probably you should change int bmap_n parameter of scan_bitmap_block to
unsigned int as well.

>  	BUG_ON(!th->t_trans_id);
>  
> -	RFALSE(bmap_n >= SB_BMAP_NR(s), "Bitmap %d is out of range (0..%d)",
> -	       bmap_n, SB_BMAP_NR(s) - 1);
> +	RFALSE(bmap_n >= REISERFS_SB(s)->s_bmap_nr, "Bitmap %d is out of range (0..%d)",
> +	       bmap_n, REISERFS_SB(s)->s_bmap_nr - 1);

one more printf specifier to fix

>  	PROC_INFO_INC(s, scan_bitmap.bmap);
>  /* this is unclear and lacks comments, explain how journal bitmaps
>     work here for the reader.  Convey a sense of the design here. What
> @@ -249,12 +252,12 @@ static int bmap_hash_id(struct super_blo
>  	} else {
>  		hash_in = (char *)(&id);
>  		hash = keyed_hash(hash_in, 4);
> -		bm = hash % SB_BMAP_NR(s);
> +		bm = hash % REISERFS_SB(s)->s_bmap_nr;
>  		if (!bm)
>  			bm = 1;
>  	}
>  	/* this can only be true when SB_BMAP_NR = 1 */
> -	if (bm >= SB_BMAP_NR(s))
> +	if (bm >= REISERFS_SB(s)->s_bmap_nr)
>  		bm = 0;
>  	return bm;
>  }
> @@ -316,9 +319,9 @@ static int scan_bitmap(struct reiserfs_t
>  	/* find every bm and bmap and bmap_nr in this file, and change them all to bitmap_blocknr
>  	 * - Hans, it is not a block number - Zam. */
>  
> -	int bm, off;
> -	int end_bm, end_off;
> -	int off_max = s->s_blocksize << 3;
> +	unsigned int bm, off;
> +	unsigned int end_bm, end_off;
> +	unsigned int off_max = s->s_blocksize << 3;
>  
>  	BUG_ON(!th->t_trans_id);
>  
> @@ -328,10 +331,10 @@ static int scan_bitmap(struct reiserfs_t
>  
>  	get_bit_address(s, *start, &bm, &off);
>  	get_bit_address(s, finish, &end_bm, &end_off);
> -	if (bm > SB_BMAP_NR(s))
> +	if (bm > REISERFS_SB(s)->s_bmap_nr)
>  		return 0;
> -	if (end_bm > SB_BMAP_NR(s))
> -		end_bm = SB_BMAP_NR(s);
> +	if (end_bm > REISERFS_SB(s)->s_bmap_nr)
> +		end_bm = REISERFS_SB(s)->s_bmap_nr;
>  
>  	/* When the bitmap is more than 10% free, anyone can allocate.
>  	 * When it's less than 10% free, only files that already use the
> @@ -385,7 +388,7 @@ static void _reiserfs_free_block(struct 
>  	struct reiserfs_super_block *rs;
>  	struct buffer_head *sbh, *bmbh;
>  	struct reiserfs_bitmap_info *apbi;
> -	int nr, offset;
> +	unsigned int nr, offset;
>  
>  	BUG_ON(!th->t_trans_id);
>  
> @@ -397,10 +400,12 @@ static void _reiserfs_free_block(struct 
>  
>  	get_bit_address(s, block, &nr, &offset);
>  
> -	if (nr >= sb_bmap_nr(rs)) {
> +	if (nr >= REISERFS_SB(s)->s_bmap_nr) {
>  		reiserfs_warning(s, "vs-4075: reiserfs_free_block: "
> -				 "block %lu is out of range on %s",
> -				 block, reiserfs_bdevname(s));
> +				 "block %lu is out of range on %s "
> +				 "(nr=%lu,max=%lu)", block,

%lu is for unsigned long, nr and REISERFS_SB(s)->s_bmap_nr are unsigned
int, so %u is to be used.

> +				 reiserfs_bdevname(s), nr,
> +				 REISERFS_SB(s)->s_bmap_nr);
>  		return;
>  	}
>  
> @@ -1324,14 +1329,21 @@ struct buffer_head *reiserfs_read_bitmap
>  int reiserfs_init_bitmap_cache(struct super_block *sb)
>  {
>  	struct reiserfs_bitmap_info *bitmap;
> +	unsigned int blocks = SB_BLOCK_COUNT(sb);
> +	unsigned int bmap_nr = blocks >> (sb->s_blocksize_bits + 3);
>  
> -	bitmap = vmalloc(sizeof (*bitmap) * SB_BMAP_NR(sb));
> +	if (blocks & ~(sb->s_blocksize << 3))
> +		++bmap_nr;
> +
> +
> +	bitmap = vmalloc(sizeof (*bitmap) * bmap_nr);
>  	if (bitmap == NULL)
>  		return -ENOMEM;
>  
> -	memset(bitmap, 0, sizeof (*bitmap) * SB_BMAP_NR(sb));
> +	memset(bitmap, 0, sizeof (*bitmap) * bmap_nr);
>  
>  	SB_AP_BITMAP(sb) = bitmap;
> +	REISERFS_SB(sb)->s_bmap_nr = bmap_nr;
>  
>  	return 0;
>  }
> --- a/fs/reiserfs/inode.c	2007-08-06 14:32:14.000000000 -0400
> +++ b/fs/reiserfs/inode.c	2007-08-06 15:03:04.000000000 -0400
> @@ -197,7 +197,7 @@ static inline void set_block_dev_mapped(
>  // files which were created in the earlier version can not be longer,
>  // than 2 gb
>  //
> -static int file_capable(struct inode *inode, long block)
> +static int file_capable(struct inode *inode, unsigned int block)

block is logical block number within a file, not disk block address.
It should be sector_t probably.
This has nothing to do with amount of bitmaps. So, I am not sure that
this change is related to the topic of the patch.


>  {
>  	if (get_inode_item_key_version(inode) != KEY_FORMAT_3_5 ||	// it is new file.
>  	    block < (1 << (31 - inode->i_sb->s_blocksize_bits)))	// old file, but 'block' is inside of 2gb
> @@ -240,7 +240,7 @@ static int file_capable(struct inode *in
>  // Please improve the english/clarity in the comment above, as it is
>  // hard to understand.
>  
> -static int _get_block_create_0(struct inode *inode, long block,
> +static int _get_block_create_0(struct inode *inode, unsigned int block,

the same as above.

>  			       struct buffer_head *bh_result, int args)
>  {
>  	INITIALIZE_PATH(path);
> @@ -248,7 +248,7 @@ static int _get_block_create_0(struct in
>  	struct buffer_head *bh;
>  	struct item_head *ih, tmp_ih;
>  	int fs_gen;
> -	int blocknr;
> +	unsigned int blocknr;

there is b_blocknr_t (which is __u32) in reiserfs_fs.h which is supposed
to used for disk block addresses.

>  	char *p = NULL;
>  	int chars;
>  	int ret;
> @@ -567,7 +567,7 @@ static int convert_tail_for_hole(struct 
>  }
>  
>  static inline int _allocate_block(struct reiserfs_transaction_handle *th,
> -				  long block,

_allocate_block puts block to reiserfs_blocknr_hint_t's field block,
which is defined as long. Probably you should change that as well.

> +				  unsigned int block,
>  				  struct inode *inode,
>  				  b_blocknr_t * allocated_block_nr,
>  				  struct treepath *path, int flags)
> @@ -1068,8 +1068,8 @@ static int real_space_diff(struct inode 
>  	return bytes;
>  }
>  
> -static inline loff_t to_real_used_space(struct inode *inode, ulong blocks,
> -					int sd_size)
> +static inline loff_t to_real_used_space(struct inode *inode,
> +                                        unsigned int blocks, int sd_size)
>  {

The callers of to_real_used_space passes inode->i_blocks as parameter
blocks. inode->i_blocks is blkcnt_t. So, this is probably also not
directly related to the patch topic.

>  	if (S_ISLNK(inode->i_mode) || S_ISDIR(inode->i_mode)) {
>  		return inode->i_size +
> --- a/fs/reiserfs/journal.c	2007-08-06 14:32:14.000000000 -0400
> +++ b/fs/reiserfs/journal.c	2007-08-06 15:09:13.000000000 -0400
> @@ -219,11 +219,12 @@ static void allocate_bitmap_nodes(struct
>  	}
>  }
>  
> -static int set_bit_in_list_bitmap(struct super_block *p_s_sb, int block,
> +static int set_bit_in_list_bitmap(struct super_block *p_s_sb,
> +                                  unsigned int block,
>  				  struct reiserfs_list_bitmap *jb)
>  {
> -	int bmap_nr = block / (p_s_sb->s_blocksize << 3);
> -	int bit_nr = block % (p_s_sb->s_blocksize << 3);
> +	unsigned int bmap_nr = block / (p_s_sb->s_blocksize << 3);
> +	unsigned int bit_nr = block % (p_s_sb->s_blocksize << 3);
>  

Maybe __u32 or b_blocknr_t?

>  	if (!jb->bitmaps[bmap_nr]) {
>  		jb->bitmaps[bmap_nr] = get_bitmap_node(p_s_sb);
> @@ -239,7 +240,7 @@ static void cleanup_bitmap_list(struct s
>  	if (jb->bitmaps == NULL)
>  		return;
>  
> -	for (i = 0; i < SB_BMAP_NR(p_s_sb); i++) {
> +	for (i = 0; i < REISERFS_SB(p_s_sb)->s_bmap_nr; i++) {
>  		if (jb->bitmaps[i]) {
>  			free_bitmap_node(p_s_sb, jb->bitmaps[i]);
>  			jb->bitmaps[i] = NULL;
> @@ -2279,8 +2280,9 @@ static int journal_read_transaction(stru
>     Right now it is only used from journal code. But later we might use it
>     from other places.
>     Note: Do not use journal_getblk/sb_getblk functions here! */
> -static struct buffer_head *reiserfs_breada(struct block_device *dev, int block,
> -					   int bufsize, unsigned int max_block)
> +static struct buffer_head *reiserfs_breada(struct block_device *dev,
> +                                           unsigned int block, int bufsize,
> +                                           unsigned int max_block)
>  {

journal_read passes unsigned long cur_dblock as parameter block of
reiserfs_reada. Changing parameter block to unsigned int does not make
things better. Both (cur_dblock and parameter block) should be __u32 or
b_blocknr_t.


>  	struct buffer_head *bhlist[BUFNR];
>  	unsigned int blocks = BUFNR;
> @@ -2649,7 +2651,7 @@ int journal_init(struct super_block *p_s
>  	journal->j_persistent_trans = 0;
>  	if (reiserfs_allocate_list_bitmaps(p_s_sb,
>  					   journal->j_list_bitmap,
> -					   SB_BMAP_NR(p_s_sb)))
> +					   REISERFS_SB(p_s_sb)->s_bmap_nr))
>  		goto free_and_return;
>  	allocate_bitmap_nodes(p_s_sb);
>  
> @@ -2657,7 +2659,7 @@ int journal_init(struct super_block *p_s
>  	SB_JOURNAL_1st_RESERVED_BLOCK(p_s_sb) = (old_format ?
>  						 REISERFS_OLD_DISK_OFFSET_IN_BYTES
>  						 / p_s_sb->s_blocksize +
> -						 SB_BMAP_NR(p_s_sb) +
> +						 REISERFS_SB(p_s_sb)->s_bmap_nr +
>  						 1 :
>  						 REISERFS_DISK_OFFSET_IN_BYTES /
>  						 p_s_sb->s_blocksize + 2);
> --- a/fs/reiserfs/resize.c	2007-08-06 14:32:14.000000000 -0400
> +++ b/fs/reiserfs/resize.c	2007-08-06 15:12:04.000000000 -0400
> @@ -61,7 +61,7 @@ int reiserfs_resize(struct super_block *
>  	}
>  
>  	/* count used bits in last bitmap block */
> -	block_r = SB_BLOCK_COUNT(s) - (SB_BMAP_NR(s) - 1) * s->s_blocksize * 8;
> +	block_r = SB_BLOCK_COUNT(s) - (REISERFS_SB(s)->s_bmap_nr - 1) * s->s_blocksize * 8;
>  
>  	/* count bitmap blocks in new fs */
>  	bmap_nr_new = block_count_new / (s->s_blocksize * 8);
> @@ -73,7 +73,7 @@ int reiserfs_resize(struct super_block *
>  
>  	/* save old values */
>  	block_count = SB_BLOCK_COUNT(s);
> -	bmap_nr = SB_BMAP_NR(s);
> +	bmap_nr = REISERFS_SB(s)->s_bmap_nr;
>  
>  	/* resizing of reiserfs bitmaps (journal and real), if needed */
>  	if (bmap_nr_new > bmap_nr) {
> @@ -206,6 +206,11 @@ int reiserfs_resize(struct super_block *
>  			   free_blocks + (block_count_new - block_count -
>  					  (bmap_nr_new - bmap_nr)));
>  	PUT_SB_BLOCK_COUNT(s, block_count_new);
> +
> +	REISERFS_SB(s)->s_bmap_nr = bmap_nr_new;
> +	if (bmap_would_wrap(bmap_nr_new))
> +		bmap_nr_new = 0;
> +
>  	PUT_SB_BMAP_NR(s, bmap_nr_new);
>  	s->s_dirt = 1;
>  
> --- a/fs/reiserfs/stree.c	2007-08-06 14:32:14.000000000 -0400
> +++ b/fs/reiserfs/stree.c	2007-08-06 14:44:46.000000000 -0400
> @@ -611,7 +611,7 @@ int search_by_key(struct super_block *p_
>  					   DISK_LEAF_NODE_LEVEL */
>      )
>  {
> -	int n_block_number;
> +	unsigned int n_block_number;

Maybe __u32 or b_blocknr_t?

>  	int expected_level;
>  	struct buffer_head *p_s_bh;
>  	struct path_element *p_s_last_element;
> --- a/include/linux/reiserfs_fs.h	2007-08-06 14:32:14.000000000 -0400
> +++ b/include/linux/reiserfs_fs.h	2007-08-06 15:38:37.000000000 -0400
> @@ -229,6 +229,9 @@ struct reiserfs_super_block {
>           ((!is_reiserfs_jr(SB_DISK_SUPER_BLOCK(s)) ? \
>           SB_ONDISK_JOURNAL_SIZE(s) + 1 : SB_ONDISK_RESERVED_FOR_JOURNAL(s)))
>  
> +/* s_bmap_nr is a u16 */
> +#define bmap_would_wrap(n)		(n >= 65536)
> +
>  int is_reiserfs_3_5(struct reiserfs_super_block *rs);
>  int is_reiserfs_3_6(struct reiserfs_super_block *rs);
>  int is_reiserfs_jr(struct reiserfs_super_block *rs);
> --- a/include/linux/reiserfs_fs_sb.h	2007-08-06 14:32:14.000000000 -0400
> +++ b/include/linux/reiserfs_fs_sb.h	2007-08-06 14:44:46.000000000 -0400
> @@ -410,6 +410,7 @@ struct reiserfs_sb_info {
>  	char *s_qf_names[MAXQUOTAS];
>  	int s_jquota_fmt;
>  #endif
> +	unsigned int s_bmap_nr;
>  };
>  
>  /* Definitions of reiserfs on-disk properties: */
> 

