From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Question on Reiser4 regarding power failures
Date: Mon, 29 Nov 2004 14:16:35 +0100
Message-ID: <200411291416.35601.christian.mayrhuber@gmx.net>
References: <200411291025.11004.BernhardPrell@vantagefilm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22612-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411291025.11004.BernhardPrell@vantagefilm.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Monday 29 November 2004 10:25, Bernhard Prell wrote:
> Christian Mayrhuber wrote:
> > I'd suggest to do the following for pull the plug scenarios on producti=
ve
> > systems with reiserfs:
>=20
> > 1) Disable write caching for ide drives with "hdparm -W 0 /dev/hdX"
> > =A0 =A0This is the most important thing to do.
>=20
> Will this really help to protect against partially written sectors and fr=
om=20
> there resulting read-errors (If a disk loses power while writing a sector=
=20
the=20
> CRC-Check will fail and the disk reports an read-error that's not caused =
by=20
a=20
> real hardware defect)? Changing the write cache strategy just "moves" the=
=20
> problem "in time" - maybe the propability that something happens is lower=
,=20
> because the amount of data that gets written at a certain point of time i=
s=20
> smaller.=20
I guess it's all about probability. If you can reduce the risk of a=20
non-bootable system from say 50% to 5% it'll often save your day.

If the harddisk is not able to finish writing a sector during a power failu=
re=20
I guess nothing can help you. Maybe some reiserfs guy (lady?) knows how
nasty the behavior of ide drives during a power failure still is if the
write cache is already disabled.

My experience is vastly positive with disabled write caches. I didn't have =
a=20
corrupted unbootable reiserfs since I disabled the write cache on the=20
harddisk. I must admit I'm not running that old kernels.
The 2.4.7 kernel is a rather old beast with reiserfs bugs. You should=20
be using a newer one.

I did some tests with kernel 2.6.9, the "barrier=3Dflush" mount option and =
a=20
enabled write cache. Whilst cp'ing a kernel tree I was switching off and th=
e=20
system survived every time.=20
I'll stick to "barrier=3Dflush" as it seems to be safe enough for me.

=2D-=20
lg, Chris
