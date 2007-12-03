From: "Edward Shishkin" <edward.shishkin@gmail.com>
Subject: Re: [PATCH 2/2] reiserfs: Add mount counting
Date: Mon, 3 Dec 2007 23:36:57 +0300
Message-ID: <5c7c368b0712031236i33abc7bdtd7a14354c67169b3@mail.gmail.com>
References: <474B4BCF.1000905@suse.com> <47545D0D.6080608@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=1pbp/UCDifmDVjhVY0xTZFYc4AVJ4m+KcXPzfzuhPJM=;
        b=WbJD1FPi1jzrLj7+ZvL6MXktD5KQPQ0qfJkKcQIsmBxBn5s7KxUNfi0WLL8EvCMv6RLiTZpMeICKHCaoM+YtjspuahXUDVcSLN3HyN4QBh6/ThRCJqeyAiU2jDJyq47tCIL4/JBSlcadAHlpOP6+kSxcFyR9GjP83bjCsR4nYcI=
In-Reply-To: <47545D0D.6080608@suse.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward@namesys.com>

Hi Jeff.

Personally, I don't object.
What does official reservation mean?
I can send a request to Hans, but I guess
we'll receive his "yes" or "no" with substantial delay..

Thanks,
Edward.


On 12/3/07, Jeff Mahoney <jeffm@suse.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Any comments on this? I'd like to be able to check this into our kernel
> tree, but I can't do so until these fields have been officially reserved.
>
> - -Jeff
>
> Jeff Mahoney wrote:
> >  The following patch adds the fields for tracking mount counts and
> >  last fsck timestamps to the superblock. It also increments the mount
> >  count on every read-write mount.
> >
> > Signed-off-by: Jeff Mahoney <jeffm@suse.com>
> > ---
> >
> >  fs/reiserfs/super.c            |    6 +++++-
> >  include/linux/reiserfs_fs.h    |    6 +++++-
> >  include/linux/reiserfs_fs_sb.h |    3 +++
> >  3 files changed, 13 insertions(+), 2 deletions(-)
> >
> > --- a/fs/reiserfs/super.c     2007-11-26 17:09:51.000000000 -0500
> > +++ b/fs/reiserfs/super.c     2007-11-26 17:32:21.000000000 -0500
> > @@ -1239,6 +1239,8 @@ static int reiserfs_remount(struct super
> >               REISERFS_SB(s)->s_mount_state = sb_umount_state(rs);
> >               s->s_flags &= ~MS_RDONLY;
> >               set_sb_umount_state(rs, REISERFS_ERROR_FS);
> > +             if (!old_format_only(s))
> > +                     set_sb_mnt_count(rs, sb_mnt_count(rs) + 1);
> >               /* mark_buffer_dirty (SB_BUFFER_WITH_SB (s), 1); */
> >               journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB(s));
> >               REISERFS_SB(s)->s_mount_state = REISERFS_VALID_FS;
> > @@ -1764,7 +1766,9 @@ static int reiserfs_fill_super(struct su
> >                       } else if (!silent) {
> >                               reiserfs_info(s, "using 3.5.x disk format\n");
> >                       }
> > -             }
> > +             } else
> > +                     set_sb_mnt_count(rs, sb_mnt_count(rs) + 1);
> > +
> >
> >               journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB(s));
> >               errval = journal_end(&th, s, 1);
> > --- a/include/linux/reiserfs_fs.h     2007-11-26 17:09:58.000000000 -0500
> > +++ b/include/linux/reiserfs_fs.h     2007-11-26 17:22:35.000000000 -0500
> > @@ -171,7 +171,11 @@ struct reiserfs_super_block {
> >       __le32 s_flags;         /* Right now used only by inode-attributes, if enabled */
> >       unsigned char s_uuid[16];       /* filesystem unique identifier */
> >       unsigned char s_label[16];      /* filesystem volume label */
> > -     char s_unused[88];      /* zero filled by mkreiserfs and
> > +     __le16 s_mnt_count;             /* Count of mounts since last fsck */
> > +     __le16 s_max_mnt_count;         /* Maximum mounts before check */
> > +     __le32 s_lastcheck;             /* Timestamp of last fsck */
> > +     __le32 s_check_interval;        /* Interval between checks */
> > +     char s_unused[76];      /* zero filled by mkreiserfs and
> >                                * reiserfs_convert_objectid_map_v1()
> >                                * so any additions must be updated
> >                                * there as well. */
> > --- a/include/linux/reiserfs_fs_sb.h  2007-11-26 17:09:58.000000000 -0500
> > +++ b/include/linux/reiserfs_fs_sb.h  2007-11-26 17:24:54.000000000 -0500
> > @@ -73,6 +73,9 @@ typedef enum {
> >  #define sb_version(sbp)            (le16_to_cpu((sbp)->s_v1.s_version))
> >  #define set_sb_version(sbp,v)      ((sbp)->s_v1.s_version = cpu_to_le16(v))
> >
> > +#define sb_mnt_count(sbp)       (le16_to_cpu((sbp)->s_mnt_count))
> > +#define set_sb_mnt_count(sbp, v)   ((sbp)->s_mnt_count = cpu_to_le16(v))
> > +
> >  #define sb_reserved_for_journal(sbp) \
> >                (le16_to_cpu((sbp)->s_v1.s_reserved_for_journal))
> >  #define set_sb_reserved_for_journal(sbp,v) \
> >
>
>
> - --
> Jeff Mahoney
> SUSE Labs
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2.0.4-svn0 (GNU/Linux)
> Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org
>
> iD8DBQFHVF0NLPWxlyuTD7IRApOuAJ4+oIw0W37hkDrUv8GSGNgX9R8itwCbBWOx
> FLf7hNIByLk/lkjsLm/4HIY=
> =gzSp
> -----END PGP SIGNATURE-----
> -
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
