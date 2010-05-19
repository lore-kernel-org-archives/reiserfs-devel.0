From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH RESUBMIT] reiserfs: Remove 2 TB file size limit
Date: Thu, 20 May 2010 00:00:52 +0200
Message-ID: <4BF45F94.40500@gmail.com>
References: <4BF43A65.405@suse.com> <AANLkTilTAapxpbA3ty5CuO0Nr0YKmxR_mFtRpyrqiCzF@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <AANLkTilTAapxpbA3ty5CuO0Nr0YKmxR_mFtRpyrqiCzF@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Leonardo Chiquitto <leonardo.lists@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>

Leonardo Chiquitto wrote:
> On Wed, May 19, 2010 at 4:22 PM, Jeff Mahoney <jeffm@suse.com> wrote:
>   
>>  In its early life, reiserfs had an evolving s_max_bytes. It started out
>>  at 4 GB, then was raised to MAX_LFS_FILESIZE, then dropped to 2 TiB when
>>  it was observed that struct stat only had a 32-bit st_blocks field.
>>
>>  Since then, both the kernel and glibc have evolved as well and now both
>>  support 64-bit st_blocks. Applications that can't deal with these ranges
>>  are assumed to be "legacy" or "broken." File systems now routinely
>>  support file sizes much larger than can be represented by 2^32 * 512.
>>
>>  But we never revisited that limitation. ReiserFS has always been able to
>>  support larger file sizes (up to 16 TiB, in fact), but the s_max_bytes
>>  limitation has prevented that.
>>
>>  This patch adds a max_file_offset helper to set s_max_bytes to a more
>>  appropriate value. I noticed that XFS adjusts the limit based on the
>>  CPU but I'd prefer to err on the side of compatibility and place the
>>  limit at the smaller of the 32-bit MAX_LFS_FILESIZE and the maximum
>>  supported by the file system. At a 4k block size, this is conveniently
>>  also the advertised maximum file size of reiserfs.
>>
>>  Update: This version properly extends PAGE_SIZE_CACHE so the math works
>>         on 32-bit systems.
>>
>>  This bug is tracked at: https://bugzilla.novell.com/show_bug.cgi?id=592100
>>
>> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
>> - ---
>>  fs/reiserfs/super.c |   17 +++++++++++++----
>>  1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> - --- a/fs/reiserfs/super.c
>> +++ b/fs/reiserfs/super.c
>> @@ -1309,6 +1309,18 @@ out_err:
>>        return err;
>>  }
>>  +static inline loff_t
>> +reiserfs_max_file_offset(struct super_block *sb)
>> +{
>> +       /* Limited by stat_data->sd_blocks, 2^32-1 blocks */
>> +       loff_t fs_max = ((u64)sb->s_blocksize << 32) - sb->s_blocksize;
>> +
>> +       /* Limited by 32-bit MAX_LFS_FILESIZE */
>> +       loff_t page_cache_max = (((u64)PAGE_CACHE_SIZE << 31)-1);
>> +
>> +       return min(fs_max, page_cache_max);
>> +}
>> +
>>  static int read_super_block(struct super_block *s, int offset)
>>  {
>>        struct buffer_head *bh;
>> @@ -1398,10 +1410,7 @@ static int read_super_block(struct super
>>        s->dq_op = &reiserfs_quota_operations;
>>  #endif
>>  -      /* new format is limited by the 32 bit wide i_blocks field, want to
>> - -      ** be one full block below that.
>> - -      */
>> - -     s->s_maxbytes = (512LL << 32) - s->s_blocksize;
>> +       s->s_maxbytes = reiserfs_max_file_offset(s);
>>        return 0;
>>  }
>>     
>
> Hello ReiserFS developers,
>
> Any chance to have this patch submitted to 2.6.35?

I wouldn't rely on this. Reiserfsprogs also should be aware
of the new limits. It's all long..

>  We're hitting the 2TB
> file limit here and this patch resolves the problem.
>
> Thanks,
> Leonardo
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

