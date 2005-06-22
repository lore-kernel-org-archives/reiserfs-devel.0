From: Roman I Khimov <rik@osrc.info>
Subject: How to make Reiser4 plugins&namespace magic work?
Date: Wed, 22 Jun 2005 18:21:57 +0400
Message-ID: <1119450117.2429.35.camel@rik-note.loc>
Reply-To: rik@osrc.info
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Lkq8+UZQS+Aq4QZp8Y6I"
Return-path: <reiserfs-list-return-24460-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--=-Lkq8+UZQS+Aq4QZp8Y6I
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hello.

Andrew Morton mentioned that "patches still contain all the
reiser4-specific namespace enhancements, only it is disabled, so it is
effectively dead code" and it seems this explains why I didn't see any
of Reiser4 namespace magic last time I've tried to play with it.

But actually I want to see it and I want to play with it - any recipe
for how to revive this code?

Thanks.

--=20
                            Roman
 ,---------------------------. ,--------------------------.
/     http://www.3os.ru/      V    http://www.osrc.info/   \         .o.
\    mailto: rik@3os.ru       ^   mailto: rik@osrc.info    /         ..o
 `---------------------------' `--------------------------'          ooo
gpg --recv-keys 0xE5E055C3 --keyserver hkp://subkeys.pgp.net

--=-Lkq8+UZQS+Aq4QZp8Y6I
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: =?koi8-r?Q?=FC=D4=C1?= =?koi8-r?Q?_=DE=C1=D3=D4=D8?=
	=?koi8-r?Q?_=D3=CF=CF=C2=DD=C5=CE=C9=D1?=
	=?koi8-r?Q?_=D0=CF=C4=D0=C9=D3=C1=CE=C1?=
	=?koi8-r?Q?_=C3=C9=C6=D2=CF=D7=CF=CA?=
	=?koi8-r?Q?_=D0=CF=C4=D0=C9=D3=D8=C0?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBCuXQEXJ70z+XgVcMRAl56AKCY6Tyq0wiDntFqIYv3xRk2n33PdgCdFmBW
HUi53n/T2d3Cq1ZRVXiMLlA=
=ps9T
-----END PGP SIGNATURE-----

--=-Lkq8+UZQS+Aq4QZp8Y6I--

