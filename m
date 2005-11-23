From: Craig Shelley <craig@microtron.org.uk>
Subject: Re: More Slowdown - testscript
Date: Wed, 23 Nov 2005 01:31:36 +0000
Message-ID: <1132709496.7650.24.camel@teratron.lan.etheus.net>
References: <200511171447.41362.mail@earthworm.de>
	 <437CBC63.3050202@namesys.com> <200511172040.39955.mail@earthworm.de>
	 <43820CAD.3090605@namesys.com> <20051121210136.GA25708@favonius>
	 <4383677F.8060106@namesys.com>
	 <3aa654a40511221127x68d059c5hfdfd4254aec0e1b5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-8jYe3cZ+zt/4bSN91lr5"
Return-path: <reiserfs-list-return-27090-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3aa654a40511221127x68d059c5hfdfd4254aec0e1b5@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-8jYe3cZ+zt/4bSN91lr5
Content-Type: multipart/mixed; boundary="=-eZDUg8P3KtBW6L9ShF74"


--=-eZDUg8P3KtBW6L9ShF74
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

The slow sync problems still exist with fresh vanilla kernel patched
with Reiser4 only (reiser4-for-2.6.14-1.patch). The slow sync occurs
regardless of which IO scheduler is in use.

craig@teratron.lan.etheus.net:~$ uname -a
Linux teratron.lan.etheus.net 2.6.14.2 #2 PREEMPT Tue Nov 22 23:48:39
GMT 2005 i686 GNU/Linux

See the attached testscript.sh=20
These are the results from the script:

sync a1

real    0m1.301s
user    0m0.000s
sys     0m0.000s


sync a2

real    0m0.341s
user    0m0.004s
sys     0m0.000s


sync a3

real    0m0.341s
user    0m0.004s
sys     0m0.004s


sync a4

real    0m0.307s
user    0m0.000s
sys     0m0.000s


Performing recursive ls

real    0m0.307s
user    0m0.080s
sys     0m0.220s


sync b1

real    0m9.716s
user    0m0.000s
sys     0m0.024s


sync b2

real    0m0.391s
user    0m0.004s
sys     0m0.000s


sync b3

real    0m0.316s
user    0m0.000s
sys     0m0.000s


sync b4

real    0m0.341s
user    0m0.000s
sys     0m0.000s


Performing recursive ls

real    0m0.734s
user    0m0.216s
sys     0m0.516s


sync c1

real    0m53.698s
user    0m0.000s
sys     0m0.108s


sync c2

real    0m0.665s
user    0m0.000s
sys     0m0.004s


sync c3

real    0m0.125s
user    0m0.000s
sys     0m0.008s


sync c4

real    0m0.125s
user    0m0.000s
sys     0m0.000s




Sync a1->a4 execute relatively quickly
The recursive ls happen very quickly because the data is already cached.
Syncs immediately after the recursive ls take ages. This is really
strange since the recursive ls does not touch the disk because the data
is cached.
My guess is that when sync is called, the cache of ALL recently accessed
data is either being committed back to disk, or being re-read.=20

--=20
Craig Shelley
EMail: craig@microtron.org.uk
Jabber: shell@jabber.earth.li

--=-eZDUg8P3KtBW6L9ShF74
Content-Disposition: attachment; filename=testscript.sh
Content-Type: application/x-shellscript; name=testscript.sh
Content-Transfer-Encoding: base64

IyEvYmluL2Jhc2gKCmVjaG8gLWUgIlxuXG5zeW5jIGExIgp0aW1lIHN5bmMKZWNobyAtZSAiXG5c
bnN5bmMgYTIiCnRpbWUgc3luYwplY2hvIC1lICJcblxuc3luYyBhMyIKdGltZSBzeW5jCmVjaG8g
LWUgIlxuXG5zeW5jIGE0Igp0aW1lIHN5bmMKZWNobyAtZSAiXG5cblBlcmZvcm1pbmcgcmVjdXJz
aXZlIGxzIgp0aW1lIGxzIC1SIC91c3Ivc3JjL2xpbnV4ID4gL2Rldi9udWxsCmVjaG8gLWUgIlxu
XG5zeW5jIGIxIgp0aW1lIHN5bmMKZWNobyAtZSAiXG5cbnN5bmMgYjIiCnRpbWUgc3luYwplY2hv
IC1lICJcblxuc3luYyBiMyIKdGltZSBzeW5jCmVjaG8gLWUgIlxuXG5zeW5jIGI0Igp0aW1lIHN5
bmMKZWNobyAtZSAiXG5cblBlcmZvcm1pbmcgcmVjdXJzaXZlIGxzIgp0aW1lIGxzIC1SICIkSE9N
RSIgPiAvZGV2L251bGwKZWNobyAtZSAiXG5cbnN5bmMgYzEiCnRpbWUgc3luYwplY2hvIC1lICJc
blxuc3luYyBjMiIKdGltZSBzeW5jCmVjaG8gLWUgIlxuXG5zeW5jIGMzIgp0aW1lIHN5bmMKZWNo
byAtZSAiXG5cbnN5bmMgYzQiCnRpbWUgc3luYwo=


--=-eZDUg8P3KtBW6L9ShF74--

--=-8jYe3cZ+zt/4bSN91lr5
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDg8Z45OI9vmOoVqERAnlKAJ4ljQf+OSAWcwJPVXxOoqJDLHsVuQCdGuyN
Bx22K124G2yoeCQFT8DJl7k=
=eDCT
-----END PGP SIGNATURE-----

--=-8jYe3cZ+zt/4bSN91lr5--

