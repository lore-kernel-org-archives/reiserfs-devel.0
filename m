From: Craig Shelley <craig@microtron.org.uk>
Subject: Re: More Slowdown - testscript [Part 2]
Date: Wed, 23 Nov 2005 01:47:04 +0000
Message-ID: <1132710424.7328.7.camel@teratron.lan.etheus.net>
References: <200511171447.41362.mail@earthworm.de>
	 <437CBC63.3050202@namesys.com> <200511172040.39955.mail@earthworm.de>
	 <43820CAD.3090605@namesys.com> <20051121210136.GA25708@favonius>
	 <4383677F.8060106@namesys.com>
	 <3aa654a40511221127x68d059c5hfdfd4254aec0e1b5@mail.gmail.com>
	 <1132709496.7650.24.camel@teratron.lan.etheus.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-WCVGXdQZBi+Bfwjfdnfa"
Return-path: <reiserfs-list-return-27091-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1132709496.7650.24.camel@teratron.lan.etheus.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-WCVGXdQZBi+Bfwjfdnfa
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Here are the results after testing on 2.6.12.1 which is not affected by the=
 sync problem.
Notice how sync b1 and c1 are now hardly affected by the recursive ls.

sync a1

real    0m0.072s
user    0m0.001s
sys     0m0.002s


sync a2

real    0m0.012s
user    0m0.000s
sys     0m0.001s


sync a3

real    0m0.012s
user    0m0.001s
sys     0m0.001s


sync a4

real    0m0.011s
user    0m0.002s
sys     0m0.000s


Performing recursive ls

real    0m0.307s
user    0m0.090s
sys     0m0.210s


sync b1

real    0m0.013s
user    0m0.000s
sys     0m0.003s


sync b2

real    0m0.011s
user    0m0.001s
sys     0m0.000s


sync b3

real    0m0.011s
user    0m0.000s
sys     0m0.002s


sync b4

real    0m0.011s
user    0m0.000s
sys     0m0.002s


Performing recursive ls

real    0m0.704s
user    0m0.209s
sys     0m0.480s


sync c1

real    0m0.018s
user    0m0.000s
sys     0m0.006s


sync c2

real    0m0.011s
user    0m0.000s
sys     0m0.002s


sync c3

real    0m0.011s
user    0m0.001s
sys     0m0.001s


sync c4

real    0m0.011s
user    0m0.000s
sys     0m0.001s

--=20
Craig Shelley
EMail: craig@microtron.org.uk
Jabber: shell@jabber.earth.li

--=-WCVGXdQZBi+Bfwjfdnfa
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDg8oY5OI9vmOoVqERArvFAKCj8l3LoyaFUZsPZJktN8WlCeR/hgCg+drk
5TQpgPKUcjUerzIOgLn4+gE=
=9O7N
-----END PGP SIGNATURE-----

--=-WCVGXdQZBi+Bfwjfdnfa--

