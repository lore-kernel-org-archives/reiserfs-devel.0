From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: [PATCH] updated data=ordered patch for 2.6.3
Date: Tue, 2 Mar 2004 20:53:56 +0100
Message-ID: <200403022053.56904.Dieter.Nuetzel@hamburg.de>
References: <1077165373.22253.45.camel@watt.suse.com> <1078251361.3931.32.camel@watt.suse.com> <200403021922.11785.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17012-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403021922.11785.Dieter.Nuetzel@hamburg.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>, Christophe Saout <christophe@saout.de>

Am Dienstag, 2. M=E4rz 2004 19:22 schrieb Dieter N=FCtzel:
> Am Dienstag, 2. M=E4rz 2004 19:16 schrieb Chris Mason:
> > On Tue, 2004-03-02 at 13:14, Dieter N=FCtzel wrote:
> > > Am Montag, 1. M=E4rz 2004 15:38 schrieb Chris Mason:
> > > > On Mon, 2004-03-01 at 09:30, Christophe Saout wrote:
> > > > > Am Mo, den 01.03.2004 schrieb Chris Mason um 15:01:
> > > > > > > It seems you introduced a bug here. I installed the patches
> > > > > > > yesterday and found a lockup on my notebook when running lilo
> > > > > > > (with /boot on the root reiserfs filesystem).
> > > > > > >
> > > > > > > A SysRq-T showed that lilo is stuck in fsync:
> > > > > >
> > > > > > Ugh, I use grub so I haven't tried lilo.  Could you please send
> > > > > > me the full sysrq-t, this is probably something stupid.
> > > > >
> > > > > Yes. I could reproduce it by simply creating a dummy /boot volume
> > > > > on reiserfs. I copied the content of /boot, ran lilo and it hung
> > > > > again. The other reiserfs filesystems were still usable (but a
> > > > > global sync hangs afterwards). I also attached a bzipped strace of
> > > > > the lilo process.
> > > >
> > > > Ok, thanks.  The problem is in reiserfs_unpack(), which needs
> > > > updating for the patch.  Fixing.
> > >
> > > Progress?
> > >
> > > I'll try on SuSE 2.6.3-16.
> >
> > Not fixed there yet.  Slight delay yesterday since I'm trying to roll
> > out the fix and some quota patches.  Should be ready this afternoon.
>
> OK, I start with the older...

Ups, data-logging IS already in SuSE's 2.6.3-16 kernel ;-)

What's needed? --- The reiserfs_unpack() fix and your speed up patch?

[-]
> Also, the code has some extra performance tweaks to smooth out
> performance both with and without data=3Dordered.  There are new
> mechanisms to trigger metadata/commit block writeback and to help
> throttle writers.  The goal is to reduce the huge bursts of io during a
> commit and during data=3Dordered writeback.
[-]

00x-xxx?

Thanks,
	Dieter
