From: Christophe Saout <christophe@saout.de>
Subject: reiser4 metas and hard links...
Date: Wed, 25 Aug 2004 01:00:41 +0200
Message-ID: <1093388441.10277.6.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-zTTcmAh1Tc8X3Xt3lEHO"
Return-path: <reiserfs-list-return-20492-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-zTTcmAh1Tc8X3Xt3lEHO
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

ln metas/bmap test

produces a nice Oops.

Please look at the LKML thread about "silent semantic changes", there
seem to be some real problems with file/directory hybrids.

Anyway, I personally think these things should belong inside the generic
filesystem code and not a specific filesystem. As should some other
things, perhaps (kcond?).


--=-zTTcmAh1Tc8X3Xt3lEHO
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBK8iZZCYBcts5dM0RAkmxAJoDTJFfQ+G75d4JWAnCMLx6b3HO6gCgp2qt
/suF1ofJubUoF/K86JNAyhY=
=Sbc6
-----END PGP SIGNATURE-----

--=-zTTcmAh1Tc8X3Xt3lEHO--

