From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 2/6] reiser4: block_alloc, plugin/space/bitmap: add a
 method for "exact" block allocation.
Date: Fri, 19 Dec 2014 16:43:16 +0100
Message-ID: <54944794.1020709@gmail.com>
References: <1418418632-18396-1-git-send-email-intelfx100@gmail.com> <1418418632-18396-3-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=AALcLH53ZBv7KO4qnN4qZ6kKw3Y1r90jsSd63IZAWGk=;
        b=hDXq9kUVMNDT8V9IU1n8bxUzEvWytFgAMnuq4K/rbJIX3wG/IA0CP/RRwHgbKeCX85
         j8/Y3pdO/6ivvtOj69zauNIhEHDB2YUJ5mqaOjTMuh+B4BiA9jQqieNByrGzl3FYkVDl
         wQJ4v977+Bl/Yw+Y/9ErzWGKRKjaiSuhbi3tpP/kaddUYutV1LYNowTFopezZm1GKLd+
         +ny4vemO9crotaf5/WB4K5IGc1pu/TT3x8aIg5zvmddcWMh7EvnDYUwFDi98vqbphfmj
         OqUOgOn7LtFxW2eKpmRiN27Fs2XhjoGk9H1rmS59d77cdUv3dDQsLJ5a8WkwKX6fiaj3
         QOQw==
In-Reply-To: <1418418632-18396-3-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Yes, this is exactly what I wanted,
Thanks!
Edward.


On 12/12/2014 10:10 PM, Ivan Shapovalov wrote:
> This allows to allocate exact count of blocks at exact position.
> In particular, 'precise discard' implementation will need this interface
> to perform padding of the discard extents.
>
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>   fs/reiser4/block_alloc.c                  | 36 ++++++++++++
>   fs/reiser4/block_alloc.h                  |  3 +
>   fs/reiser4/plugin/space/bitmap.c          | 94 +++++++++++++++++++++++--------
>   fs/reiser4/plugin/space/bitmap.h          |  3 +
>   fs/reiser4/plugin/space/space_allocator.h | 10 +++-
>   5 files changed, 120 insertions(+), 26 deletions(-)
>
> diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
> index be1a795..fc4cf04 100644
> --- a/fs/reiser4/block_alloc.c
> +++ b/fs/reiser4/block_alloc.c
> @@ -759,6 +759,42 @@ int reiser4_alloc_blocks(reiser4_blocknr_hint * hint, reiser4_block_nr * blk,
>   	return ret;
>   }
>   
> +/* This is a version of reiser4_alloc_blocks() for use in special conditions,
> + * where an allocation must have exact length and position.
> + *
> + * It does not use reiser4_blocknr_hint; instead, all parameters are passed
> + * directly.
> + */
> +int reiser4_alloc_blocks_exact(const reiser4_block_nr * blk,
> +			       const reiser4_block_nr * len,
> +			       block_stage_t stage, reiser4_ba_flags_t flags)
> +{
> +	int ret;
> +	reiser4_context *ctx;
> +
> +	assert("intelfx-70", blk != NULL);
> +	assert("intelfx-71", len != NULL);
> +
> +	ctx = get_current_context();
> +
> +	ret = reiser4_alloc_blocks_pre(*len, stage, flags);
> +
> +	if (ret != 0) {
> +		return ret;
> +	}
> +
> +	ret = sa_alloc_blocks_exact(reiser4_get_space_allocator(ctx->super),
> +				    blk, len);
> +
> +	if (ret == 0) {
> +		reiser4_alloc_blocks_post_success(*blk, *len, stage, flags);
> +	} else {
> +		reiser4_alloc_blocks_post_failure(*len, stage);
> +	}
> +
> +	return ret;
> +}
> +
>   /**
>    * ask block allocator for some unformatted blocks
>    */
> diff --git a/fs/reiser4/block_alloc.h b/fs/reiser4/block_alloc.h
> index a4e98af..a09be1d 100644
> --- a/fs/reiser4/block_alloc.h
> +++ b/fs/reiser4/block_alloc.h
> @@ -109,6 +109,9 @@ int reiser4_alloc_blocks(reiser4_blocknr_hint * hint,
>   int reiser4_dealloc_blocks(const reiser4_block_nr *,
>   			   const reiser4_block_nr *,
>   			   block_stage_t, reiser4_ba_flags_t flags);
> +int reiser4_alloc_blocks_exact(const reiser4_block_nr * start,
> +			       const reiser4_block_nr * len,
> +			       block_stage_t stage, reiser4_ba_flags_t flags);
>   
>   static inline int reiser4_alloc_block(reiser4_blocknr_hint * hint,
>   				      reiser4_block_nr * start,
> diff --git a/fs/reiser4/plugin/space/bitmap.c b/fs/reiser4/plugin/space/bitmap.c
> index 3da3f6b..7d15619 100644
> --- a/fs/reiser4/plugin/space/bitmap.c
> +++ b/fs/reiser4/plugin/space/bitmap.c
> @@ -1222,8 +1222,14 @@ void reiser4_dealloc_blocks_bitmap(reiser4_space_allocator * allocator,
>   	release_and_unlock_bnode(bnode);
>   }
>   
> +typedef enum {
> +	CHECK_FREE,
> +	CHECK_FREE_AND_ALLOC,
> +	CHECK_BUSY
> +} check_blocks_mode;
> +
>   static int check_blocks_one_bitmap(bmap_nr_t bmap, bmap_off_t start_offset,
> -                                    bmap_off_t end_offset, int desired)
> +				   bmap_off_t end_offset, check_blocks_mode mode)
>   {
>   	struct super_block *super = reiser4_get_current_sb();
>   	struct bitmap_node *bnode = get_bnode(super, bmap);
> @@ -1236,14 +1242,29 @@ static int check_blocks_one_bitmap(bmap_nr_t bmap, bmap_off_t start_offset,
>   
>   	assert("nikita-2216", jnode_is_loaded(bnode->wjnode));
>   
> -	if (desired) {
> +	switch (mode) {
> +	case CHECK_BUSY:
>   		ret = reiser4_find_next_zero_bit(bnode_working_data(bnode),
> -						  end_offset, start_offset)
> -		      >= end_offset;
> -	} else {
> -		ret = reiser4_find_next_set_bit(bnode_working_data(bnode),
>   						 end_offset, start_offset)
>   		      >= end_offset;
> +
> +		break;
> +
> +	case CHECK_FREE:
> +	case CHECK_FREE_AND_ALLOC:
> +		ret = reiser4_find_next_set_bit(bnode_working_data(bnode),
> +						end_offset, start_offset)
> +		      >= end_offset;
> +
> +		if (mode == CHECK_FREE_AND_ALLOC && ret) {
> +			reiser4_set_bits(bnode_working_data(bnode),
> +					 start_offset, end_offset);
> +		}
> +
> +		break;
> +
> +	default:
> +		impossible("intelfx-67", "wrong block check/alloc mode: %d", mode);
>   	}
>   
>   	release_and_unlock_bnode(bnode);
> @@ -1251,9 +1272,8 @@ static int check_blocks_one_bitmap(bmap_nr_t bmap, bmap_off_t start_offset,
>   	return ret;
>   }
>   
> -/* plugin->u.space_allocator.check_blocks(). */
> -int reiser4_check_blocks_bitmap(const reiser4_block_nr * start,
> -				 const reiser4_block_nr * len, int desired)
> +static int check_blocks_bitmap(reiser4_block_nr start, reiser4_block_nr len,
> +			       check_blocks_mode mode)
>   {
>   	struct super_block *super = reiser4_get_current_sb();
>   
> @@ -1262,21 +1282,13 @@ int reiser4_check_blocks_bitmap(const reiser4_block_nr * start,
>   	bmap_off_t offset, end_offset;
>   	const bmap_off_t max_offset = bmap_bit_count(super->s_blocksize);
>   
> -	assert("intelfx-9", start != NULL);
> -	assert("intelfx-10", ergo(len != NULL, *len > 0));
> +	assert("intelfx-10", len > 0);
>   
> -	if (len != NULL) {
> -		check_block_range(start, len);
> -		end = *start + *len - 1;
> -	} else {
> -		/* on next line, end is used as temporary len for check_block_range() */
> -		end = 1; check_block_range(start, &end);
> -		end = *start;
> -	}
> +	check_block_range(&start, &len);
> +	parse_blocknr(&start, &bmap, &offset);
>   
> -	parse_blocknr(start, &bmap, &offset);
> -
> -	if (end == *start) {
> +	end = start + len - 1;
> +	if (end == start) {
>   		end_bmap = bmap;
>   		end_offset = offset;
>   	} else {
> @@ -1288,11 +1300,45 @@ int reiser4_check_blocks_bitmap(const reiser4_block_nr * start,
>   	assert("intelfx-5", ergo(end_bmap == bmap, end_offset >= offset));
>   
>   	for (; bmap < end_bmap; bmap++, offset = 0) {
> -		if (!check_blocks_one_bitmap(bmap, offset, max_offset, desired)) {
> +		if (!check_blocks_one_bitmap(bmap, offset, max_offset, mode)) {
>   			return 0;
>   		}
>   	}
> -	return check_blocks_one_bitmap(bmap, offset, end_offset, desired);
> +	return check_blocks_one_bitmap(bmap, offset, end_offset, mode);
> +}
> +
> +/* plugin->u.space_allocator.alloc_blocks_exact() */
> +int reiser4_alloc_blocks_exact_bitmap(reiser4_space_allocator * allocator,
> +				      const reiser4_block_nr * start,
> +				      const reiser4_block_nr * len)
> +{
> +	int ret;
> +
> +	assert("intelfx-66", start != NULL);
> +
> +	if (len != NULL)
> +		ret = check_blocks_bitmap(*start, *len, CHECK_FREE_AND_ALLOC);
> +	else
> +		ret = check_blocks_bitmap(*start, 1, CHECK_FREE_AND_ALLOC);
> +
> +	if (ret == 0)
> +		return RETERR(-ENOSPC);
> +	else
> +		return 0;
> +}
> +
> +/* plugin->u.space_allocator.check_blocks(). */
> +int reiser4_check_blocks_bitmap(const reiser4_block_nr * start,
> +				const reiser4_block_nr * len, int desired)
> +{
> +	check_blocks_mode mode = desired ? CHECK_BUSY : CHECK_FREE;
> +
> +	assert("intelfx-9", start != NULL);
> +
> +	if (len != NULL)
> +		return check_blocks_bitmap (*start, *len, mode);
> +	else
> +		return check_blocks_bitmap (*start, 1, mode);
>   }
>   
>   /* conditional insertion of @node into atom's overwrite set  if it was not there */
> diff --git a/fs/reiser4/plugin/space/bitmap.h b/fs/reiser4/plugin/space/bitmap.h
> index 4590498..9679f3c 100644
> --- a/fs/reiser4/plugin/space/bitmap.h
> +++ b/fs/reiser4/plugin/space/bitmap.h
> @@ -19,6 +19,9 @@ extern int reiser4_alloc_blocks_bitmap(reiser4_space_allocator *,
>   				       reiser4_blocknr_hint *, int needed,
>   				       reiser4_block_nr * start,
>   				       reiser4_block_nr * len);
> +extern int reiser4_alloc_blocks_exact_bitmap(reiser4_space_allocator *,
> +					     const reiser4_block_nr * start,
> +					     const reiser4_block_nr * len);
>   extern int reiser4_check_blocks_bitmap(const reiser4_block_nr *,
>   					const reiser4_block_nr *, int);
>   extern void reiser4_dealloc_blocks_bitmap(reiser4_space_allocator *,
> diff --git a/fs/reiser4/plugin/space/space_allocator.h b/fs/reiser4/plugin/space/space_allocator.h
> index 71bfd11..7567bda 100644
> --- a/fs/reiser4/plugin/space/space_allocator.h
> +++ b/fs/reiser4/plugin/space/space_allocator.h
> @@ -29,9 +29,15 @@ static inline void sa_dealloc_blocks (reiser4_space_allocator * al, reiser4_bloc
>   	reiser4_dealloc_blocks_##allocator (al, start, len);								\
>   }															\
>   															\
> -static inline int sa_check_blocks (const reiser4_block_nr * start, const reiser4_block_nr * end, int desired) 		\
> +static inline int sa_check_blocks (const reiser4_block_nr * start, const reiser4_block_nr * end, int desired)		\
>   {															\
> -	return reiser4_check_blocks_##allocator (start, end, desired);							        \
> +	return reiser4_check_blocks_##allocator (start, end, desired);							\
> +}															\
> +															\
> +static inline int sa_alloc_blocks_exact (reiser4_space_allocator * al, const reiser4_block_nr * start,			\
> +					 const reiser4_block_nr * len)							\
> +{															\
> +	return reiser4_alloc_blocks_exact_##allocator (al, start, len);							\
>   }															\
>   															\
>   static inline void sa_pre_commit_hook (void)										\

