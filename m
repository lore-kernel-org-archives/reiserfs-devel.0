From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: [PATCH] updated data=ordered patch for 2.6.3
Date: Tue, 2 Mar 2004 19:14:06 +0100
Message-ID: <200403021914.06928.Dieter.Nuetzel@hamburg.de>
References: <1077165373.22253.45.camel@watt.suse.com> <1078151441.7036.2.camel@leto.cs.pocnet.net> <1078151895.2146.227.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17008-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1078151895.2146.227.camel@watt.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>, Christophe Saout <christophe@saout.de>

Am Montag, 1. M=E4rz 2004 15:38 schrieb Chris Mason:
> On Mon, 2004-03-01 at 09:30, Christophe Saout wrote:
> > Am Mo, den 01.03.2004 schrieb Chris Mason um 15:01:
> > > > It seems you introduced a bug here. I installed the patches yesterd=
ay
> > > > and found a lockup on my notebook when running lilo (with /boot on
> > > > the root reiserfs filesystem).
> > > >
> > > > A SysRq-T showed that lilo is stuck in fsync:
> > >
> > > Ugh, I use grub so I haven't tried lilo.  Could you please send me the
> > > full sysrq-t, this is probably something stupid.
> >
> > Yes. I could reproduce it by simply creating a dummy /boot volume on
> > reiserfs. I copied the content of /boot, ran lilo and it hung again. The
> > other reiserfs filesystems were still usable (but a global sync hangs
> > afterwards). I also attached a bzipped strace of the lilo process.
>
> Ok, thanks.  The problem is in reiserfs_unpack(), which needs updating
> for the patch.  Fixing.

Progress?

I'll try on SuSE 2.6.3-16.

Thanks,
	Dieter
