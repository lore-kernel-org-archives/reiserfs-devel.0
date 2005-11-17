From: "Hesse, Christian" <mail@earthworm.de>
Subject: Re: More Slowdown or reiser4 update for 2.6.14-mm2
Date: Thu, 17 Nov 2005 20:40:32 +0100
Message-ID: <200511172040.39955.mail@earthworm.de>
References: <200511171447.41362.mail@earthworm.de> <437CBC63.3050202@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3053679.ayLyeWrdc7";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26988-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <437CBC63.3050202@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--nextPart3053679.ayLyeWrdc7
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 17 November 2005 18:22, Vladimir V. Saveliev wrote:
> Hello
>
> Hesse, Christian wrote:
> > Vladimir V. Saveliev wrote:
> >>Please try whether the attached patch improves anything. It simplifies
> >>fsync by avoid commiting of transactions which do not modify file being
> >>fsync-ed.
> >>
> >>The patch applied to 2.6.14-mm2 with warnings, but that can be ignored.
> >
> > Hi everybody,
> >
> > I'm suffering the same problem, sync and fsync are horribly slow. I've
> > written a small test program:
> >
> > http://www.earthworm.de/tmp/reiser4-fsync.c
> >
> > with 2.6.13:
> > sync()                                  =3D 0 <0.000198>
> > fsync(3)                                =3D 0 <0.003353>
> >
> > with 2.6.14 (with and without patch):
> > sync()                                  =3D 0 <2.092873>
> > fsync(3)                                =3D 0 <0.132579>
>
> I tried your test on a box with reiser4 root fs:
> 2.6.13:
> strace -T -e sync,fsync ./eworm xx
> fsync(3)                                =3D 0 <0.158808>
>
> 2.6.14-mm2 +
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.14-mm2/reiser4-for-2.6.14-m=
m2
>-1.patch.gz
>
> strace -T -e sync,fsync ./eworm xx
> fsync(3)                                =3D 0 <0.005373>
>
> Would you please try whether 2.6.14-mm2 with fresh reiser4 update fsyncs
> better?

No change, still bad performance: up to 2 seconds in sync(), up to 0.2 seco=
nds=20
in fsync().
=2D-=20
Christian

--nextPart3053679.ayLyeWrdc7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.19 (GNU/Linux)

iD8DBQBDfNy3lZfG2c8gdSURAoMGAJ9MpxuIpOvJoan+6ayprK341I6VvgCfRroL
L+Kscj6eo8x7YkRB4CDsmWk=
=baoc
-----END PGP SIGNATURE-----

--nextPart3053679.ayLyeWrdc7--
