From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] updated data=ordered patch for 2.6.3
Date: Tue, 02 Mar 2004 13:16:01 -0500
Message-ID: <1078251361.3931.32.camel@watt.suse.com>
References: <1077165373.22253.45.camel@watt.suse.com>
	 <1078151441.7036.2.camel@leto.cs.pocnet.net>
	 <1078151895.2146.227.camel@watt.suse.com>
	 <200403021914.06928.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17009-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403021914.06928.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list@namesys.com, Christophe Saout <christophe@saout.de>

On Tue, 2004-03-02 at 13:14, Dieter N=FCtzel wrote:
> Am Montag, 1. M=E4rz 2004 15:38 schrieb Chris Mason:
> > On Mon, 2004-03-01 at 09:30, Christophe Saout wrote:
> > > Am Mo, den 01.03.2004 schrieb Chris Mason um 15:01:
> > > > > It seems you introduced a bug here. I installed the patches yeste=
rday
> > > > > and found a lockup on my notebook when running lilo (with /boot on
> > > > > the root reiserfs filesystem).
> > > > >
> > > > > A SysRq-T showed that lilo is stuck in fsync:
> > > >
> > > > Ugh, I use grub so I haven't tried lilo.  Could you please send me =
the
> > > > full sysrq-t, this is probably something stupid.
> > >
> > > Yes. I could reproduce it by simply creating a dummy /boot volume on
> > > reiserfs. I copied the content of /boot, ran lilo and it hung again. =
The
> > > other reiserfs filesystems were still usable (but a global sync hangs
> > > afterwards). I also attached a bzipped strace of the lilo process.
> >
> > Ok, thanks.  The problem is in reiserfs_unpack(), which needs updating
> > for the patch.  Fixing.
>=20
> Progress?
>=20
> I'll try on SuSE 2.6.3-16.

Not fixed there yet.  Slight delay yesterday since I'm trying to roll
out the fix and some quota patches.  Should be ready this afternoon.

-chris


