From: "Hesse, Christian" <mail@earthworm.de>
Subject: Re: More Slowdown
Date: Thu, 17 Nov 2005 14:47:35 +0100
Message-ID: <200511171447.41362.mail@earthworm.de>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2731560.YMtujemJC9";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26980-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: "Vladimir V. Saveliev" <vs@namesys.com>

--nextPart2731560.YMtujemJC9
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Vladimir V. Saveliev wrote:
> Please try whether the attached patch improves anything. It simplifies
> fsync by avoid commiting of transactions which do not modify file being
> fsync-ed.=20
>
> The patch applied to 2.6.14-mm2 with warnings, but that can be ignored.

Hi everybody,

I'm suffering the same problem, sync and fsync are horribly slow. I've writ=
ten=20
a small test program:

http://www.earthworm.de/tmp/reiser4-fsync.c

with 2.6.13:
sync()                                  =3D 0 <0.000198>
fsync(3)                                =3D 0 <0.003353>

with 2.6.14 (with and without patch):
sync()                                  =3D 0 <2.092873>
fsync(3)                                =3D 0 <0.132579>
=2D-=20
Christian

--nextPart2731560.YMtujemJC9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.19 (GNU/Linux)

iD8DBQBDfIn9lZfG2c8gdSURArXDAKDdMZyi96ZVVSr4vhCcts5bWQ1gvQCg640d
EUeotkZ+iryX0s/QbBjT/Xk=
=QUBp
-----END PGP SIGNATURE-----

--nextPart2731560.YMtujemJC9--
