From: Linux Tard <linuxtard@yahoo.com>
Subject: Re: Trying to mount ReiserFS file system read only results in change
Date: Sat, 24 Dec 2005 08:55:34 -0800 (PST)
Message-ID: <20051224165534.85690.qmail@web34615.mail.mud.yahoo.com>
References: <43AC11B5.1060803@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27506-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43AC11B5.1060803@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>, Jeff Mahoney <jeffm@suse.com>

Hi Vladimar,

Thank you kindly.  This patch worked for 2.4.32 and
testing indicates journal count is not incremented
when ReiserFS is mounted read only.  Very happy.=20
Thank you!

Happy Holidays!

kind regards,
-lt


--- "Vladimir V. Saveliev" <vs@namesys.com> wrote:

> Hello
>=20
> Linux Tard wrote:
> > Hi Vladimar,
> >=20
> > Thank you again. =20
> >=20
> > --- "Vladimir V. Saveliev" <vs@namesys.com> wrote:
> >>I do not think that this is  a good way.
> >>
> >=20
> > Why is this? =20
>=20
> reiserfs used to increment mount id on each mount.
> Not updating it might confuse
> code which relays on that fact: journal replay
> and/or reiserfsck.
>=20
> > Is there something else other than
> > preventing journal increment this would do?=20
> Again, we
> > use this kernel only in certain situations.
> >=20
> >>I would propose the following patch.
> >>=20
> >> fs/reiserfs/journal.c |    1 +
> >> 1 files changed, 1 insertion(+)
> >>
> >>diff -puN
> >>
> >
>
fs/reiserfs/journal.c~reiserfs-dont-update-journla-header-mounting-readonly
> >>fs/reiserfs/journal.c
> >>---
> >>
> >
>
linux-2.6.15-rc5-mm3/fs/reiserfs/journal.c~reiserfs-dont-update-journla-hea=
der-mounting-readonly
> >>2005-12-20 13:09:28.000000000 +0300
> >>+++ linux-2.6.15-rc5-mm3-vs/fs/reiserfs/journal.c
> >>2005-12-20 13:10:51.000000000 +0300
> >>@@ -2458,6 +2458,7 @@ static int
> journal_read(struct
> >>super_blo
> >> 			      replay_count, get_seconds() - start);
> >> 	}
> >> 	if (!bdev_read_only(p_s_sb->s_bdev) &&
> >>+	    !(p_s_sb->s_flags & MS_RDONLY) &&
> >> 	    _update_journal_header_block(p_s_sb,
> >>journal->j_start,
> >> 					 journal->j_last_flush_trans_id)) {
> >> 		/* replay failed, caller must call
> >>free_journal_ram and abort
> >=20
> > We not able to test this patch.  We're using
> 2.4.32
> > kernel.  Output of patch;
> >=20
> > [root@dumb linux-2.4.32]# patch -p1 <
> >
>
reiserfs_dont_update_journla_header_mounting_readonly.patch
> >  --dry-run
> > patching file fs/reiserfs/journal.c
> > Hunk #1 FAILED at 2458.
> > 1 out of 1 hunk FAILED -- saving rejects to file
> > fs/reiserfs/journal.c.rej
> > [root@dumb linux-2.4.32]#
> >=20
> > And the REJ file;
> >=20
> > [root@dumb reiserfs]# more journal.c.rej=20
> > ***************
> > *** 2458,2463 ****
> >                               replay_count,
> > get_seconds() - start);
> >         }
> >         if (!bdev_read_only(p_s_sb->s_bdev) &&
> >             _update_journal_header_block(p_s_sb,
> > journal->j_start,
> >                                        =20
> > journal->j_last_flush_trans_id)) {
> >                 /* replay failed, caller must call
> > free_journal_ram and abort
> > --- 2458,2464 ----
> >                               replay_count,
> > get_seconds() - start);
> >         }
> >         if (!bdev_read_only(p_s_sb->s_bdev) &&
> > +           !(p_s_sb->s_flags & MS_RDONLY) &&
> >             _update_journal_header_block(p_s_sb,
> > journal->j_start,
> >                                        =20
> > journal->j_last_flush_trans_id)) {
> >                 /* replay failed, caller must call
> > free_journal_ram and abort
> > [root@dumb reiserfs]#
> >=20
> >=20
> >=20
> >=20
> >=20
> > I'm guessing you made patch for 2.6 kernel?  Or
> > failure for some other reason? =20
>=20
> yes, it was for 2.6. Please try the attached, it is
> for 2.4.32.
>=20
> > We have to use 2.4 series kernel now.  Would you
> be
> > able to write this patch for 2.4 kernel if it was
> for
> > 2.6?
> >=20
> > kind regards,
> > -lt
> >=20
> >=20
> >=20
> > =09
> > 	=09
> > __________________________________=20
> > Yahoo! for Good - Make a difference this year.=20
> > http://brand.yahoo.com/cybergivingweek2005/
> >=20
> >=20
>=20
> >=20
> This patch makes reiserfs to avoid journal header
> update when filesystem is being mounted readonly.
>=20
> diff -puN
>
fs/reiserfs/journal.c~reiserfs-dont-update-journla-header-mounting-readonly
> fs/reiserfs/journal.c
>=20
>=20
>  fs/reiserfs/journal.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff -puN
>
fs/reiserfs/journal.c~reiserfs-dont-update-journla-header-mounting-readonly
> fs/reiserfs/journal.c
> ---
>
linux-2.4.32/fs/reiserfs/journal.c~reiserfs-dont-update-journla-header-moun=
ting-readonly
> 2005-12-23 17:54:14.222498915 +0300
> +++ linux-2.4.32-vs/fs/reiserfs/journal.c	2005-12-23
> 17:57:46.063947196 +0300
> @@ -1804,7 +1804,8 @@ start_log_replay:
>      printk("reiserfs: replayed %d transactions in
> %lu seconds\n", replay_count,=20
>  	    CURRENT_TIME - start) ;
>    }
> -  if (!is_read_only(p_s_sb->s_dev) &&=20
> +  if (!is_read_only(p_s_sb->s_dev) &&
> +      !(p_s_sb->s_flags & MS_RDONLY) &&
>         _update_journal_header_block(p_s_sb,
> SB_JOURNAL(p_s_sb)->j_start,=20
>                                   =20
> SB_JOURNAL(p_s_sb)->j_last_flush_trans_id))
>    {
>=20
> _
>=20



	=09
__________________________________________=20
Yahoo! DSL =96 Something to write home about.=20
Just $16.99/mo. or less.=20
dsl.yahoo.com=20

