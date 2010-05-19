From: Leonardo Chiquitto <leonardo.lists@gmail.com>
Subject: Re: [PATCH RESUBMIT] reiserfs: Remove 2 TB file size limit
Date: Wed, 19 May 2010 16:46:55 -0300
Message-ID: <AANLkTilTAapxpbA3ty5CuO0Nr0YKmxR_mFtRpyrqiCzF@mail.gmail.com>
References: <4BF43A65.405@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=BKHMLbldxZMhKDWhxk9Fm/9l47XjtcyxMN8ynKTDr8k=;
        b=QTyqvKsmr4DmLHZFUPyi7P2nWV45+gwmqZFkX8C+OCntL8Q6GqwUBEPw0FN5+Y6tMH
         E/g3SCtRjqxBLNQgUTDRKrS21qh7g9K7xclRFA6pO31Ufds1vJItORHh+GwErlT6PugS
         TW4Zej5lMEPVR3NRjws0KcEGWI7nOJR+gQIgU=
In-Reply-To: <4BF43A65.405@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org
Cc: Jeff Mahoney <jeffm@suse.com>

On Wed, May 19, 2010 at 4:22 PM, Jeff Mahoney <jeffm@suse.com> wrote:
> =A0In its early life, reiserfs had an evolving s_max_bytes. It starte=
d out
> =A0at 4 GB, then was raised to MAX_LFS_FILESIZE, then dropped to 2 Ti=
B when
> =A0it was observed that struct stat only had a 32-bit st_blocks field=
=2E
>
> =A0Since then, both the kernel and glibc have evolved as well and now=
 both
> =A0support 64-bit st_blocks. Applications that can't deal with these =
ranges
> =A0are assumed to be "legacy" or "broken." File systems now routinely
> =A0support file sizes much larger than can be represented by 2^32 * 5=
12.
>
> =A0But we never revisited that limitation. ReiserFS has always been a=
ble to
> =A0support larger file sizes (up to 16 TiB, in fact), but the s_max_b=
ytes
> =A0limitation has prevented that.
>
> =A0This patch adds a max_file_offset helper to set s_max_bytes to a m=
ore
> =A0appropriate value. I noticed that XFS adjusts the limit based on t=
he
> =A0CPU but I'd prefer to err on the side of compatibility and place t=
he
> =A0limit at the smaller of the 32-bit MAX_LFS_FILESIZE and the maximu=
m
> =A0supported by the file system. At a 4k block size, this is convenie=
ntly
> =A0also the advertised maximum file size of reiserfs.
>
> =A0Update: This version properly extends PAGE_SIZE_CACHE so the math =
works
> =A0 =A0 =A0 =A0 on 32-bit systems.
>
> =A0This bug is tracked at: https://bugzilla.novell.com/show_bug.cgi?i=
d=3D592100
>
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
> - ---
> =A0fs/reiserfs/super.c | =A0 17 +++++++++++++----
> =A01 file changed, 13 insertions(+), 4 deletions(-)
>
> - --- a/fs/reiserfs/super.c
> +++ b/fs/reiserfs/super.c
> @@ -1309,6 +1309,18 @@ out_err:
> =A0 =A0 =A0 =A0return err;
> =A0}
> =A0+static inline loff_t
> +reiserfs_max_file_offset(struct super_block *sb)
> +{
> + =A0 =A0 =A0 /* Limited by stat_data->sd_blocks, 2^32-1 blocks */
> + =A0 =A0 =A0 loff_t fs_max =3D ((u64)sb->s_blocksize << 32) - sb->s_=
blocksize;
> +
> + =A0 =A0 =A0 /* Limited by 32-bit MAX_LFS_FILESIZE */
> + =A0 =A0 =A0 loff_t page_cache_max =3D (((u64)PAGE_CACHE_SIZE << 31)=
-1);
> +
> + =A0 =A0 =A0 return min(fs_max, page_cache_max);
> +}
> +
> =A0static int read_super_block(struct super_block *s, int offset)
> =A0{
> =A0 =A0 =A0 =A0struct buffer_head *bh;
> @@ -1398,10 +1410,7 @@ static int read_super_block(struct super
> =A0 =A0 =A0 =A0s->dq_op =3D &reiserfs_quota_operations;
> =A0#endif
> =A0- =A0 =A0 =A0/* new format is limited by the 32 bit wide i_blocks =
field, want to
> - - =A0 =A0 =A0** be one full block below that.
> - - =A0 =A0 =A0*/
> - - =A0 =A0 s->s_maxbytes =3D (512LL << 32) - s->s_blocksize;
> + =A0 =A0 =A0 s->s_maxbytes =3D reiserfs_max_file_offset(s);
> =A0 =A0 =A0 =A0return 0;
> =A0}

Hello ReiserFS developers,

Any chance to have this patch submitted to 2.6.35? We're hitting the 2T=
B
file limit here and this patch resolves the problem.

Thanks,
Leonardo
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
