From: "Vladimir V. Saveliev" <saveliev.v.v@gmail.com>
Subject: Re: [PATCH] reiserfs: > 8 TB fs support
Date: Tue, 07 Aug 2007 19:48:24 +0300
Message-ID: <46B8A258.6040606@namesys.com>
References: <46B77DAD.3030805@suse.com> <46B885DC.1030907@namesys.com> <46B88C07.5050907@suse.com>
Reply-To: vs@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:reply-to:user-agent:x-accept-language:mime-version:to:cc:subject:references:in-reply-to:content-type:content-transfer-encoding:from;
        b=noXT5tQI9uLhv64hyUdoJQQc9JW/UKJAIBqP8DnKQDu16VYpLlaHAycqi+6fT/J+M7TkPoPlM+9uf2MxUFmnrV9LzY/TiohyTR2/FtT9TjPpw85ypmJA/vfRtosczJ5oBZycG/WmH5NbTmEqoohZac7iBVjxW9Gyeu/yOcJVIw4=
In-Reply-To: <46B88C07.5050907@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Jeff Mahoney wrote:
> Vladimir V. Saveliev wrote:
>>> Hello
>>>
>>> yes, thanks for making a fix for this old bug.
>>> I just made few trivial warnings below.
> 
> Great, thanks for the feedback. I've integrated your suggestions, except
> where commented below.
> 
>>>> --- a/fs/reiserfs/inode.c	2007-08-06 14:32:14.000000000 -0400
>>>> +++ b/fs/reiserfs/inode.c	2007-08-06 15:03:04.000000000 -0400
>>>> @@ -197,7 +197,7 @@ static inline void set_block_dev_mapped(
>>>>  // files which were created in the earlier version can not be longer,
>>>>  // than 2 gb
>>>>  //
>>>> -static int file_capable(struct inode *inode, long block)
>>>> +static int file_capable(struct inode *inode, unsigned int block)
>>> block is logical block number within a file, not disk block address.
>>> It should be sector_t probably.
>>> This has nothing to do with amount of bitmaps. So, I am not sure that
>>> this change is related to the topic of the patch.
>>>
>>>>  {
>>>>  	if (get_inode_item_key_version(inode) != KEY_FORMAT_3_5 ||	// it is new file.
>>>>  	    block < (1 << (31 - inode->i_sb->s_blocksize_bits)))	// old file, but 'block' is inside of 2gb
>>>> @@ -240,7 +240,7 @@ static int file_capable(struct inode *in
>>>>  // Please improve the english/clarity in the comment above, as it is
>>>>  // hard to understand.
>>>>  
>>>> -static int _get_block_create_0(struct inode *inode, long block,
>>>> +static int _get_block_create_0(struct inode *inode, unsigned int block,
>>> the same as above.
> 
> No, these weren't strictly related to the topic of the patch. It was
> part of the hunt for places where block numbers are handled with signed
> variables. On 32-bit systems, this is no different than 'int block,'
> which is just wrong. I'll change it to sector_t or I may split the type
> safety patches out and have the largefs stuff just handle the bitmap
> differences.
> 
>>>> @@ -1068,8 +1068,8 @@ static int real_space_diff(struct inode 
>>>>  	return bytes;
>>>>  }
>>>>  
>>>> -static inline loff_t to_real_used_space(struct inode *inode, ulong blocks,
>>>> -					int sd_size)
>>>> +static inline loff_t to_real_used_space(struct inode *inode,
>>>> +                                        unsigned int blocks, int sd_size)
>>>>  {
>>> The callers of to_real_used_space passes inode->i_blocks as parameter
>>> blocks. inode->i_blocks is blkcnt_t. So, this is probably also not
>>> directly related to the patch topic.
> 
> No, it's not. Again, part of the audit, though this one can just be
> reverted anyway since it's a no-op.
> 
>>>> --- a/fs/reiserfs/journal.c	2007-08-06 14:32:14.000000000 -0400
>>>> +++ b/fs/reiserfs/journal.c	2007-08-06 15:09:13.000000000 -0400
>>>> @@ -219,11 +219,12 @@ static void allocate_bitmap_nodes(struct
>>>>  	}
>>>>  }
>>>>  
>>>> -static int set_bit_in_list_bitmap(struct super_block *p_s_sb, int block,
>>>> +static int set_bit_in_list_bitmap(struct super_block *p_s_sb,
>>>> +                                  unsigned int block,
>>>>  				  struct reiserfs_list_bitmap *jb)
>>>>  {
>>>> -	int bmap_nr = block / (p_s_sb->s_blocksize << 3);
>>>> -	int bit_nr = block % (p_s_sb->s_blocksize << 3);
>>>> +	unsigned int bmap_nr = block / (p_s_sb->s_blocksize << 3);
>>>> +	unsigned int bit_nr = block % (p_s_sb->s_blocksize << 3);
>>>>  
>>> Maybe __u32 or b_blocknr_t?
> 
> Why? 

Oops, that comment is about function parameter 'block'.
It would be nice if we used __u32 for block disk addresses everywhere
(which is probably not easy to do).

It doesn't refer to block numbers at all. It's not strictly needed
> since we won't exceed the range of a signed int, but it's a value that
> can never be negative.
> 
>>>> @@ -2279,8 +2280,9 @@ static int journal_read_transaction(stru
>>>>     Right now it is only used from journal code. But later we might use it
>>>>     from other places.
>>>>     Note: Do not use journal_getblk/sb_getblk functions here! */
>>>> -static struct buffer_head *reiserfs_breada(struct block_device *dev, int block,
>>>> -					   int bufsize, unsigned int max_block)
>>>> +static struct buffer_head *reiserfs_breada(struct block_device *dev,
>>>> +                                           unsigned int block, int bufsize,
>>>> +                                           unsigned int max_block)
>>>>  {
>>> journal_read passes unsigned long cur_dblock as parameter block of
>>> reiserfs_reada. Changing parameter block to unsigned int does not make
>>> things better. Both (cur_dblock and parameter block) should be __u32 or
>>> b_blocknr_t.
> 
> Without the change, block is a signed int, which is wrong. OTOH, it
> probably won't ever be a problem since it would require the journal to
> be past the 8 TB boundary. I'll change it to b_blocknr_t just the same.
> 

Journal can be moved ast 8Tb with tunereiserfs (even it is likely that
nobody ever did that).

> I've split out the patches, and I'll post the series shortly.
> 
> -Jeff
> 
> --
> Jeff Mahoney
> SUSE Labs
