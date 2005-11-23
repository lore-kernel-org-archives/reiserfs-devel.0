From: "Hesse, Christian" <mail@earthworm.de>
Subject: Re: Collect data?
Date: Wed, 23 Nov 2005 13:21:17 +0100
Message-ID: <200511231321.18455.mail@earthworm.de>
References: <200511171447.41362.mail@earthworm.de> <200511231253.37328.mail@earthworm.de> <20051123121751.GC26252@favonius>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1833970.H6PJ3Q2Izf";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27108-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051123121751.GC26252@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
To: sander@humilis.net
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com, "E.Gryaznova" <grev@namesys.com>

--nextPart1833970.H6PJ3Q2Izf
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 23 November 2005 13:17, Sander wrote:
> Hesse, Christian wrote (ao):
> > For Sander's list:
> >
> > http://www.earthworm.de/tmp/reiser4-fsync.c
> > strace -T -e sync,fsync reiser4-fsync
>
> I've added this one, but it segfaults at my system:
>
> $ gcc -o reiser4-fsync reiser4-fsync.c
> $ strace -T -e sync,fsync ./reiser4-fsync
> Segmentation fault
>
> Any idea?

I think that is caused by a patch in -mm. You should read "2.6.15-rc1-mm2=20
breaks strace" on lkml.

> > Good kernels is everything 2.6.13* and before.
>
> Added, thanks!
=2D-=20
Christian

--nextPart1833970.H6PJ3Q2Izf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.19 (GNU/Linux)

iD8DBQBDhF6+lZfG2c8gdSURAmXiAKC8v13AaYvlTQO4YtwiqpdXq5ZVkwCfcvhx
8VPgj19sEluYD8P9OrEcEF0=
=H/jN
-----END PGP SIGNATURE-----

--nextPart1833970.H6PJ3Q2Izf--
