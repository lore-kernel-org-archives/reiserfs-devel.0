From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: v3 logging speedups for 2.6
Date: Mon, 12 Jan 2004 21:33:51 +0100
Message-ID: <200401122133.52123.Dieter.Nuetzel@hamburg.de>
References: <1071166228.11147.122.camel@tiny.suse.com> <1071168158.10849.131.camel@tiny.suse.com> <200401122108.40205.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16463-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200401122108.40205.Dieter.Nuetzel@hamburg.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Am Montag, 12. Januar 2004 21:08 schrieb Dieter N=FCtzel:
> Am Donnerstag, 11. Dezember 2003 19:42 schrieb Chris Mason:
> > On Thu, 2003-12-11 at 13:30, Dieter N=FCtzel wrote:
> > > Am Donnerstag, 11. Dezember 2003 19:10 schrieb Chris Mason:
> > > > Hello everyone,
> > > >
> > > > This is part one of the data logging port to 2.6, it includes all t=
he
> > > > cleanups and journal performance fixes.  Basically, it's everything
> > > > except the data=3Djournal and data=3Dordered changes.
> > > >
> > > > The 2.6 merge has a few new things as well, I've changed things
> > > > around so that metadata and log blocks will go onto the system dirty
> > > > lists. This should make it easier to improve log performance, since
> > > > most of the work will be done outside the journal locks.
> > > >
> > > > The code works for me, but should be considered highly experimental.
> > > > In general, it is significantly faster than vanilla 2.6.0-test11,
> > > > I've done tests with dbench, iozone, synctest and a few others.=20
> > > > streaming writes didn't see much improvement (they were already at
> > > > disk speeds), but most other tests did.
> > > >
> > > > Anyway, for the truly daring among you:
> > > >
> > > > ftp.suse.com/pub/people/mason/patches/data-logging/experimental/2.6=
=2E0
> > > >-t est11
> > > >
> > > > The more bug reports I get now, the faster I'll be able to stabilize
> > > > things.  Get the latest reiserfsck and check your disks after each
> > > > use.
> > >
> > > Chris,
> > >
> > > with which kernel should I start on my SuSE 9.0?
> > > A special SuSE 2.6.0-test11 + data logging?
> > > Or plane native? --- There are such much patches in SuSE kernels...
> >
> > For the moment you can only try it on vanilla 2.6.0-test11.   The suse
> > 2.6 rpms have acls/xattrs and the new logging stuff won't apply.
> >
> > Jeff and I will fix that when the logging merge is really complete.  At
> > the rate I'm going, that should be by the end of next week, this part of
> > the merge was the really tricky bits.
>
> Chris,
>
> can we have something against Gerd Knorr's <kraxel@suse.de> SuSE 2.6.1
> kernel version, please?
>
> reiserfs-journal-writer
> Works fine (applies), still compiling...;-)

Works fine!

Greetings,
	Dieter

> reiserfs-logging
> Show some rejects:
>
> SunWave1 src/linux# patch -p1 -E -N < ../patches/reiserfs-logging
> patching file fs/reiserfs/journal.c
> Hunk #38 FAILED at 2217.
> Hunk #39 succeeded at 2256 (offset 3 lines).
> Hunk #40 FAILED at 2294.
> Hunk #41 succeeded at 2423 with fuzz 1 (offset 40 lines).
> Hunk #42 succeeded at 2438 (offset 40 lines).
> Hunk #43 succeeded at 2456 (offset 40 lines).
> Hunk #44 succeeded at 2480 (offset 40 lines).
> Hunk #45 succeeded at 2519 (offset 40 lines).
> Hunk #46 succeeded at 2581 (offset 56 lines).
> Hunk #47 succeeded at 2606 (offset 56 lines).
> Hunk #48 succeeded at 2657 (offset 60 lines).
> Hunk #49 succeeded at 2727 (offset 60 lines).
> Hunk #50 succeeded at 2744 (offset 60 lines).
> Hunk #51 succeeded at 2754 (offset 60 lines).
> Hunk #52 succeeded at 2792 (offset 60 lines).
> Hunk #53 succeeded at 2832 (offset 60 lines).
> Hunk #54 succeeded at 2856 (offset 60 lines).
> Hunk #55 succeeded at 2888 (offset 60 lines).
> Hunk #56 succeeded at 2897 (offset 60 lines).
> Hunk #57 succeeded at 2985 (offset 60 lines).
> Hunk #58 FAILED at 3036.
> Hunk #59 succeeded at 3062 (offset 64 lines).
> Hunk #60 succeeded at 3096 with fuzz 1 (offset 67 lines).
> Hunk #61 succeeded at 3113 (offset 67 lines).
> Hunk #62 succeeded at 3147 (offset 67 lines).
> Hunk #63 succeeded at 3163 (offset 67 lines).
> Hunk #64 succeeded at 3176 (offset 67 lines).
> Hunk #65 succeeded at 3183 (offset 67 lines).
> Hunk #66 succeeded at 3219 (offset 67 lines).
> Hunk #67 succeeded at 3241 (offset 67 lines).
> 3 out of 67 hunks FAILED -- saving rejects to file
> fs/reiserfs/journal.c.rej patching file fs/reiserfs/objectid.c
> patching file fs/reiserfs/super.c
> Hunk #1 succeeded at 61 (offset 2 lines).
> Hunk #2 succeeded at 90 (offset 2 lines).
> Hunk #3 succeeded at 844 with fuzz 1 (offset 35 lines).
> Hunk #4 succeeded at 862 with fuzz 2 (offset 37 lines).
> Hunk #5 succeeded at 1442 with fuzz 1 (offset 47 lines).
> patching file fs/reiserfs/ibalance.c
> patching file fs/reiserfs/procfs.c
> patching file fs/reiserfs/fix_node.c
> patching file fs/reiserfs/inode.c
> Hunk #1 FAILED at 960.
> Hunk #2 succeeded at 1629 (offset 12 lines).
> 1 out of 2 hunks FAILED -- saving rejects to file fs/reiserfs/inode.c.rej
> patching file fs/reiserfs/do_balan.c
> patching file mm/page-writeback.c
> patching file include/linux/reiserfs_fs_i.h
> Hunk #2 FAILED at 50.
> 1 out of 2 hunks FAILED -- saving rejects to file
> include/linux/reiserfs_fs_i.h.rej
> patching file include/linux/reiserfs_fs_sb.h
> Hunk #1 succeeded at 107 (offset 1 line).
> Hunk #2 succeeded at 121 (offset 1 line).
> Hunk #3 FAILED at 155.
> Hunk #4 succeeded at 166 (offset 5 lines).
> Hunk #5 succeeded at 207 (offset 5 lines).
> Hunk #6 succeeded at 228 (offset 5 lines).
> Hunk #7 succeeded at 421 (offset 9 lines).
> Hunk #8 succeeded at 491 (offset 24 lines).
> Hunk #9 succeeded at 500 (offset 24 lines).
> 1 out of 9 hunks FAILED -- saving rejects to file
> include/linux/reiserfs_fs_sb.h.rej
> patching file include/linux/reiserfs_fs.h
>
> I haven't the time to do it myself, today...

=2D-=20
Dieter N=FCtzel
@home: <Dieter.Nuetzel () hamburg ! de>
