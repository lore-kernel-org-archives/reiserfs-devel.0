From: Fionn Behrens <fionn@spamfilter.de>
Subject: SOLVED: reiser4 in 2.6.14 - lockups with mmapped files
Date: Fri, 04 Nov 2005 22:12:34 +0100
Message-ID: <1131138753.14425.2.camel@laptop>
References: <1130860221.12859.23.camel@laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-zudrjKa58Bsv2Rk+VsF5"
Return-path: <reiserfs-list-return-26782-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1130860221.12859.23.camel@laptop>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-zudrjKa58Bsv2Rk+VsF5
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Di, 2005-11-01 at 16:50 +0100, Fionn Behrens wrote:
> Hi all,
>=20
> it looks like any time any mmapped file is synced to a reiser4
> partition, the process who tries to do that will freeze forever.

The archck patch maintainer released an update which no longer exhibits
the problem. After several hours of run time and some stress tests I
didnt experience a problem so far.

thanks for your advice and best regards,
					Fionn
--=20
 Taking away civil rights to protect a free democracy is like taking off
 the tires of a car to protect it from flats.=20

--=-zudrjKa58Bsv2Rk+VsF5
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDa87AjkvYSI4bFywRAmJgAJ90IudhVXQT/+z1Pf+aUAdCZ/9TOQCeMW2h
HDq3VGzIyRsTnl7CW9M1fao=
=Pq0E
-----END PGP SIGNATURE-----

--=-zudrjKa58Bsv2Rk+VsF5--


