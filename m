From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: > 8 TB fs support
Date: Tue, 07 Aug 2007 11:13:11 -0400
Message-ID: <46B88C07.5050907@suse.com>
References: <46B77DAD.3030805@suse.com> <46B885DC.1030907@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <46B885DC.1030907@namesys.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vs@namesys.com
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Vladimir V. Saveliev wrote:
> Hello
> 
> yes, thanks for making a fix for this old bug.
> I just made few trivial warnings below.

Great, thanks for the feedback. I've integrated your suggestions, except
where commented below.

>> --- a/fs/reiserfs/inode.c	2007-08-06 14:32:14.000000000 -0400
>> +++ b/fs/reiserfs/inode.c	2007-08-06 15:03:04.000000000 -0400
>> @@ -197,7 +197,7 @@ static inline void set_block_dev_mapped(
>>  // files which were created in the earlier version can not be longer,
>>  // than 2 gb
>>  //
>> -static int file_capable(struct inode *inode, long block)
>> +static int file_capable(struct inode *inode, unsigned int block)
> 
> block is logical block number within a file, not disk block address.
> It should be sector_t probably.
> This has nothing to do with amount of bitmaps. So, I am not sure that
> this change is related to the topic of the patch.
> 
>>  {
>>  	if (get_inode_item_key_version(inode) != KEY_FORMAT_3_5 ||	// it is new file.
>>  	    block < (1 << (31 - inode->i_sb->s_blocksize_bits)))	// old file, but 'block' is inside of 2gb
>> @@ -240,7 +240,7 @@ static int file_capable(struct inode *in
>>  // Please improve the english/clarity in the comment above, as it is
>>  // hard to understand.
>>  
>> -static int _get_block_create_0(struct inode *inode, long block,
>> +static int _get_block_create_0(struct inode *inode, unsigned int block,
> 
> the same as above.

No, these weren't strictly related to the topic of the patch. It was
part of the hunt for places where block numbers are handled with signed
variables. On 32-bit systems, this is no different than 'int block,'
which is just wrong. I'll change it to sector_t or I may split the type
safety patches out and have the largefs stuff just handle the bitmap
differences.

>> @@ -1068,8 +1068,8 @@ static int real_space_diff(struct inode 
>>  	return bytes;
>>  }
>>  
>> -static inline loff_t to_real_used_space(struct inode *inode, ulong blocks,
>> -					int sd_size)
>> +static inline loff_t to_real_used_space(struct inode *inode,
>> +                                        unsigned int blocks, int sd_size)
>>  {
> 
> The callers of to_real_used_space passes inode->i_blocks as parameter
> blocks. inode->i_blocks is blkcnt_t. So, this is probably also not
> directly related to the patch topic.

No, it's not. Again, part of the audit, though this one can just be
reverted anyway since it's a no-op.

>> --- a/fs/reiserfs/journal.c	2007-08-06 14:32:14.000000000 -0400
>> +++ b/fs/reiserfs/journal.c	2007-08-06 15:09:13.000000000 -0400
>> @@ -219,11 +219,12 @@ static void allocate_bitmap_nodes(struct
>>  	}
>>  }
>>  
>> -static int set_bit_in_list_bitmap(struct super_block *p_s_sb, int block,
>> +static int set_bit_in_list_bitmap(struct super_block *p_s_sb,
>> +                                  unsigned int block,
>>  				  struct reiserfs_list_bitmap *jb)
>>  {
>> -	int bmap_nr = block / (p_s_sb->s_blocksize << 3);
>> -	int bit_nr = block % (p_s_sb->s_blocksize << 3);
>> +	unsigned int bmap_nr = block / (p_s_sb->s_blocksize << 3);
>> +	unsigned int bit_nr = block % (p_s_sb->s_blocksize << 3);
>>  
> 
> Maybe __u32 or b_blocknr_t?

Why? It doesn't refer to block numbers at all. It's not strictly needed
since we won't exceed the range of a signed int, but it's a value that
can never be negative.

>> @@ -2279,8 +2280,9 @@ static int journal_read_transaction(stru
>>     Right now it is only used from journal code. But later we might use it
>>     from other places.
>>     Note: Do not use journal_getblk/sb_getblk functions here! */
>> -static struct buffer_head *reiserfs_breada(struct block_device *dev, int block,
>> -					   int bufsize, unsigned int max_block)
>> +static struct buffer_head *reiserfs_breada(struct block_device *dev,
>> +                                           unsigned int block, int bufsize,
>> +                                           unsigned int max_block)
>>  {
> 
> journal_read passes unsigned long cur_dblock as parameter block of
> reiserfs_reada. Changing parameter block to unsigned int does not make
> things better. Both (cur_dblock and parameter block) should be __u32 or
> b_blocknr_t.

Without the change, block is a signed int, which is wrong. OTOH, it
probably won't ever be a problem since it would require the journal to
be past the 8 TB boundary. I'll change it to b_blocknr_t just the same.

I've split out the patches, and I'll post the series shortly.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFGuIwGLPWxlyuTD7IRAuckAJwLbaNYIjte9Ssd/otSYBNS75QVxACeJief
48XI/7hklkl2jkYktxaApTQ=
=7aHC
-----END PGP SIGNATURE-----
