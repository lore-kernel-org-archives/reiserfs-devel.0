From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH RESUBMIT] reiserfs: Remove 2 TB file size limit
Date: Mon, 01 Nov 2010 09:58:06 -0400
Message-ID: <4CCEC76E.8000602@suse.com>
References: <4BF43A65.405@suse.com>	<AANLkTilTAapxpbA3ty5CuO0Nr0YKmxR_mFtRpyrqiCzF@mail.gmail.com>	<4BF45F94.40500@gmail.com>	<4BF5893C.3010802@suse.com>	<AANLkTinM2JzWu6mcY2zRl9WQXVc184X-VCCUWyn54QqZ@mail.gmail.com> <AANLkTimv88HX-cpGPoWvbhIkOK25YVhusstfLG7oaGBn@mail.gmail.com> <4C17E9E0.6070105@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4C17E9E0.6070105@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Leonardo Chiquitto <leonardo.lists@gmail.com>, T.Shearouse@gmail.com, reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06/15/2010 05:00 PM, Edward Shishkin wrote:
> Leonardo Chiquitto wrote:
>> On Fri, May 21, 2010 at 10:17 AM, Tim Shearouse
>> <t.shearouse@gmail.com> wrote:
>>  
>>> On Thu, May 20, 2010 at 2:10 PM, Jeff Mahoney <jeffm@suse.com> wrote:
>>>    
>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>> Hash: SHA1
>>>>
>>>> On 05/19/2010 06:00 PM, Edward Shishkin wrote:
>>>>      
>>>>> Leonardo Chiquitto wrote:
>>>>>        
>>>>>> On Wed, May 19, 2010 at 4:22 PM, Jeff Mahoney <jeffm@suse.com> wrote:
>>>>>>
>>>>>>          
>>>>>>>  In its early life, reiserfs had an evolving s_max_bytes. It
>>>>>>> started out
>>>>>>>  at 4 GB, then was raised to MAX_LFS_FILESIZE, then dropped to 2 TiB
>>>>>>> when
>>>>>>>  it was observed that struct stat only had a 32-bit st_blocks field.
>>>>>>>
>>>>>>>  Since then, both the kernel and glibc have evolved as well and
>>>>>>> now both
>>>>>>>  support 64-bit st_blocks. Applications that can't deal with these
>>>>>>> ranges
>>>>>>>  are assumed to be "legacy" or "broken." File systems now routinely
>>>>>>>  support file sizes much larger than can be represented by 2^32 *
>>>>>>> 512.
>>>>>>>
>>>>>>>  But we never revisited that limitation. ReiserFS has always been
>>>>>>> able to
>>>>>>>  support larger file sizes (up to 16 TiB, in fact), but the
>>>>>>> s_max_bytes
>>>>>>>  limitation has prevented that.
>>>>>>>
>>>>>>>  This patch adds a max_file_offset helper to set s_max_bytes to a
>>>>>>> more
>>>>>>>  appropriate value. I noticed that XFS adjusts the limit based on
>>>>>>> the
>>>>>>>  CPU but I'd prefer to err on the side of compatibility and place
>>>>>>> the
>>>>>>>  limit at the smaller of the 32-bit MAX_LFS_FILESIZE and the maximum
>>>>>>>  supported by the file system. At a 4k block size, this is
>>>>>>> conveniently
>>>>>>>  also the advertised maximum file size of reiserfs.
>>>>>>>
>>>>>>>  Update: This version properly extends PAGE_SIZE_CACHE so the
>>>>>>> math works
>>>>>>>         on 32-bit systems.
>>>>>>>
>>>>>>>  This bug is tracked at:
>>>>>>> https://bugzilla.novell.com/show_bug.cgi?id=592100
>>>>>>>
>>>>>>> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
>>>>>>> - ---
>>>>>>>  fs/reiserfs/super.c |   17 +++++++++++++----
>>>>>>>  1 file changed, 13 insertions(+), 4 deletions(-)
>>>>>>>
>>>>>>> - --- a/fs/reiserfs/super.c
>>>>>>> +++ b/fs/reiserfs/super.c
>>>>>>> @@ -1309,6 +1309,18 @@ out_err:
>>>>>>>        return err;
>>>>>>>  }
>>>>>>>  +static inline loff_t
>>>>>>> +reiserfs_max_file_offset(struct super_block *sb)
>>>>>>> +{
>>>>>>> +       /* Limited by stat_data->sd_blocks, 2^32-1 blocks */
>>>>>>> +       loff_t fs_max = ((u64)sb->s_blocksize << 32) -
>>>>>>> sb->s_blocksize;
>>>>>>> +
>>>>>>> +       /* Limited by 32-bit MAX_LFS_FILESIZE */
>>>>>>> +       loff_t page_cache_max = (((u64)PAGE_CACHE_SIZE << 31)-1);
>>>>>>> +
>>>>>>> +       return min(fs_max, page_cache_max);
>>>>>>> +}
>>>>>>> +
>>>>>>>  static int read_super_block(struct super_block *s, int offset)
>>>>>>>  {
>>>>>>>        struct buffer_head *bh;
>>>>>>> @@ -1398,10 +1410,7 @@ static int read_super_block(struct super
>>>>>>>        s->dq_op = &reiserfs_quota_operations;
>>>>>>>  #endif
>>>>>>>  -      /* new format is limited by the 32 bit wide i_blocks field,
>>>>>>> want to
>>>>>>> - -      ** be one full block below that.
>>>>>>> - -      */
>>>>>>> - -     s->s_maxbytes = (512LL << 32) - s->s_blocksize;
>>>>>>> +       s->s_maxbytes = reiserfs_max_file_offset(s);
>>>>>>>        return 0;
>>>>>>>  }
>>>>>>>
>>>>>>>             
>>>>>> Hello ReiserFS developers,
>>>>>>
>>>>>> Any chance to have this patch submitted to 2.6.35?
>>>>>>           
>>>>> I wouldn't rely on this. Reiserfsprogs also should be aware
>>>>> of the new limits. It's all long..
>>>>>         
>>>> I certainly hope not. Things would be broken already. The 2 TB limit is
>>>> 2048 * 2^32.
>>>>
>>>> - -Jeff
>>>>
>>>>      
>>>>>>  We're hitting the 2TB
>>>>>> file limit here and this patch resolves the problem.
>>>>>>
>>>>>> Thanks,
>>>>>> Leonardo
>>>>>>           
>>>> - -- 
>>>> Jeff Mahoney
>>>> SUSE Labs
>>>>       
>>> I do not believe this patch will cause problems. As you mention,
>>> ReiserFS was intended to support a max 16TB filesize.
>>>
>>> Edward, it looks to me as though reiserfsprogs will be aware of the
>>> new limits, unless I am missing something (it does not have its own
>>> method for accessing the super block somewhere, correct?).
>>>     
>>
>> Hello,
>>
>> I apologize for insisting here but it's really important for us to get
>> this fixed upstream. Please, can someone submit it for 2.6.35
> 
> I guess nobody will accept this to 2.6.35..
> We only can push it to -mm with the following proceeding
> from the akpm's side..
> 
>>  or,
>> if the patch is not a good idea, give a little insight on what's wrong?
>>   
> 
> Jeff, did you have any chances to run and fsck this on 32 and 64-bit
> machines?

Revisiting this since we'd really like to include the patch in our
products. I'm doing this testing today.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAkzOx24ACgkQLPWxlyuTD7I7CQCghqjn8J9gV+D4qsAZUS9UJ1NT
Rm0An2PWE1wVfrPpL1uUyF5E3Y7eWJaY
=iDCV
-----END PGP SIGNATURE-----
