From: Craig Shelley <craig@microtron.org.uk>
Subject: Re: More Slowdown - testscript [noatime,nodiratime]
Date: Wed, 23 Nov 2005 20:23:29 +0000
Message-ID: <1132777409.7458.8.camel@teratron.lan.etheus.net>
References: <200511171447.41362.mail@earthworm.de>
	 <437CBC63.3050202@namesys.com> <200511172040.39955.mail@earthworm.de>
	 <43820CAD.3090605@namesys.com> <20051121210136.GA25708@favonius>
	 <4383677F.8060106@namesys.com>
	 <3aa654a40511221127x68d059c5hfdfd4254aec0e1b5@mail.gmail.com>
	 <1132709496.7650.24.camel@teratron.lan.etheus.net>
	 <1132710424.7328.7.camel@teratron.lan.etheus.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-mTV+5963a2NJ+OoaeFzy"
Return-path: <reiserfs-list-return-27119-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1132710424.7328.7.camel@teratron.lan.etheus.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-mTV+5963a2NJ+OoaeFzy
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

With the noatime and nodiratime options, the problem of accessing files
causing a massive sync time has gone. See the results below.

Although this option has made the system useable, I don't think it has
fully solved the problem. I think fsync() and sync() performance is
still poor, I will do a bit more testing and get back.

Regards,

--=20
Craig Shelley
EMail: craig@microtron.org.uk
Jabber: shell@jabber.earth.li


Results:

craig@teratron.lan.etheus.net:~$ ./testscript.sh

sync a1

real    0m0.870s
user    0m0.000s
sys     0m0.000s


sync a2

real    0m0.083s
user    0m0.004s
sys     0m0.000s


sync a3

real    0m0.075s
user    0m0.000s
sys     0m0.004s


sync a4

real    0m0.083s
user    0m0.000s
sys     0m0.000s


Performing recursive ls

real    0m0.314s
user    0m0.076s
sys     0m0.228s


sync b1

real    0m0.077s
user    0m0.000s
sys     0m0.000s


sync b2

real    0m0.083s
user    0m0.000s
sys     0m0.000s


sync b3

real    0m0.075s
user    0m0.000s
sys     0m0.004s


sync b4

real    0m0.083s
user    0m0.000s
sys     0m0.000s


Performing recursive ls

real    0m0.744s
user    0m0.236s
sys     0m0.504s


sync c1

real    0m0.078s
user    0m0.000s
sys     0m0.000s


sync c2

real    0m0.083s
user    0m0.000s
sys     0m0.000s


sync c3

real    0m0.074s
user    0m0.000s
sys     0m0.004s


sync c4

real    0m0.083s
user    0m0.000s
sys     0m0.000s

--=-mTV+5963a2NJ+OoaeFzy
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDhM/B5OI9vmOoVqERAor1AKDRJy1VzhoDfOsx98zOLH+dFr3hMQCguUUX
GIZ1o9Pko+XoElbsKWQPaXw=
=Hjrt
-----END PGP SIGNATURE-----

--=-mTV+5963a2NJ+OoaeFzy--

