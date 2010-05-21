From: Tim Shearouse <t.shearouse@gmail.com>
Subject: Re: [PATCH RESUBMIT] reiserfs: Remove 2 TB file size limit
Date: Fri, 21 May 2010 08:17:42 -0500
Message-ID: <AANLkTinM2JzWu6mcY2zRl9WQXVc184X-VCCUWyn54QqZ@mail.gmail.com>
References: <4BF43A65.405@suse.com>
	 <AANLkTilTAapxpbA3ty5CuO0Nr0YKmxR_mFtRpyrqiCzF@mail.gmail.com>
	 <4BF45F94.40500@gmail.com> <4BF5893C.3010802@suse.com>
Reply-To: T.Shearouse@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:reply-to
         :in-reply-to:references:date:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=8zOhb6xJk0IflQOnw0cgQLU/HcAsLows4plRYT0hiGE=;
        b=IB+wHRL5M+PYrKImOiJ1tyHJtgXqb+r31yYlzJaaQFPUYrjeti6Qk9rvqE8NWgDLqQ
         rUjQnDTSnSsN8JSyiaRS4h5640nSbJMtRxyznUQ/kPOUXoQfcjCmmOunz1ns/Ufkotnv
         FG+9VaBW/iR9B+GbupQZz8amRezeKVOWePIPw=
In-Reply-To: <4BF5893C.3010802@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Leonardo Chiquitto <leonardo.lists@gmail.com>, reiserfs-devel@vger.kernel.org

On Thu, May 20, 2010 at 2:10 PM, Jeff Mahoney <jeffm@suse.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 05/19/2010 06:00 PM, Edward Shishkin wrote:
>> Leonardo Chiquitto wrote:
>>> On Wed, May 19, 2010 at 4:22 PM, Jeff Mahoney <jeffm@suse.com> wrot=
e:
>>>
>>>> =A0In its early life, reiserfs had an evolving s_max_bytes. It sta=
rted out
>>>> =A0at 4 GB, then was raised to MAX_LFS_FILESIZE, then dropped to 2=
 TiB
>>>> when
>>>> =A0it was observed that struct stat only had a 32-bit st_blocks fi=
eld.
>>>>
>>>> =A0Since then, both the kernel and glibc have evolved as well and =
now both
>>>> =A0support 64-bit st_blocks. Applications that can't deal with the=
se
>>>> ranges
>>>> =A0are assumed to be "legacy" or "broken." File systems now routin=
ely
>>>> =A0support file sizes much larger than can be represented by 2^32 =
* 512.
>>>>
>>>> =A0But we never revisited that limitation. ReiserFS has always bee=
n
>>>> able to
>>>> =A0support larger file sizes (up to 16 TiB, in fact), but the s_ma=
x_bytes
>>>> =A0limitation has prevented that.
>>>>
>>>> =A0This patch adds a max_file_offset helper to set s_max_bytes to =
a more
>>>> =A0appropriate value. I noticed that XFS adjusts the limit based o=
n the
>>>> =A0CPU but I'd prefer to err on the side of compatibility and plac=
e the
>>>> =A0limit at the smaller of the 32-bit MAX_LFS_FILESIZE and the max=
imum
>>>> =A0supported by the file system. At a 4k block size, this is conve=
niently
>>>> =A0also the advertised maximum file size of reiserfs.
>>>>
>>>> =A0Update: This version properly extends PAGE_SIZE_CACHE so the ma=
th works
>>>> =A0 =A0 =A0 =A0 on 32-bit systems.
>>>>
>>>> =A0This bug is tracked at:
>>>> https://bugzilla.novell.com/show_bug.cgi?id=3D592100
>>>>
>>>> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
>>>> - ---
>>>> =A0fs/reiserfs/super.c | =A0 17 +++++++++++++----
>>>> =A01 file changed, 13 insertions(+), 4 deletions(-)
>>>>
>>>> - --- a/fs/reiserfs/super.c
>>>> +++ b/fs/reiserfs/super.c
>>>> @@ -1309,6 +1309,18 @@ out_err:
>>>> =A0 =A0 =A0 =A0return err;
>>>> =A0}
>>>> =A0+static inline loff_t
>>>> +reiserfs_max_file_offset(struct super_block *sb)
>>>> +{
>>>> + =A0 =A0 =A0 /* Limited by stat_data->sd_blocks, 2^32-1 blocks */
>>>> + =A0 =A0 =A0 loff_t fs_max =3D ((u64)sb->s_blocksize << 32) - sb-=
>s_blocksize;
>>>> +
>>>> + =A0 =A0 =A0 /* Limited by 32-bit MAX_LFS_FILESIZE */
>>>> + =A0 =A0 =A0 loff_t page_cache_max =3D (((u64)PAGE_CACHE_SIZE << =
31)-1);
>>>> +
>>>> + =A0 =A0 =A0 return min(fs_max, page_cache_max);
>>>> +}
>>>> +
>>>> =A0static int read_super_block(struct super_block *s, int offset)
>>>> =A0{
>>>> =A0 =A0 =A0 =A0struct buffer_head *bh;
>>>> @@ -1398,10 +1410,7 @@ static int read_super_block(struct super
>>>> =A0 =A0 =A0 =A0s->dq_op =3D &reiserfs_quota_operations;
>>>> =A0#endif
>>>> =A0- =A0 =A0 =A0/* new format is limited by the 32 bit wide i_bloc=
ks field,
>>>> want to
>>>> - - =A0 =A0 =A0** be one full block below that.
>>>> - - =A0 =A0 =A0*/
>>>> - - =A0 =A0 s->s_maxbytes =3D (512LL << 32) - s->s_blocksize;
>>>> + =A0 =A0 =A0 s->s_maxbytes =3D reiserfs_max_file_offset(s);
>>>> =A0 =A0 =A0 =A0return 0;
>>>> =A0}
>>>>
>>>
>>> Hello ReiserFS developers,
>>>
>>> Any chance to have this patch submitted to 2.6.35?
>>
>> I wouldn't rely on this. Reiserfsprogs also should be aware
>> of the new limits. It's all long..
>
> I certainly hope not. Things would be broken already. The 2 TB limit =
is
> 2048 * 2^32.
>
> - -Jeff
>
>>> =A0We're hitting the 2TB
>>> file limit here and this patch resolves the problem.
>>>
>>> Thanks,
>>> Leonardo
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe
>>> reiserfs-devel" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
>>>
>>>
>>
>
>
> - --
> Jeff Mahoney
> SUSE Labs
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2.0.15 (GNU/Linux)
> Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/
>
> iEYEARECAAYFAkv1iTwACgkQLPWxlyuTD7I/yQCcCrGCVlu15YW7tBPbXb08SR7U
> xc0AmwT5nDgG9T9apDXyQtqlpkx5vwva
> =3Dgb6N
> -----END PGP SIGNATURE-----
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

I do not believe this patch will cause problems. As you mention,
ReiserFS was intended to support a max 16TB filesize.

Edward, it looks to me as though reiserfsprogs will be aware of the
new limits, unless I am missing something (it does not have its own
method for accessing the super block somewhere, correct?).
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
