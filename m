From: Christophe Saout <christophe@saout.de>
Subject: reproducable deadlock condition (reiser4)
Date: Sat, 25 Sep 2004 14:43:13 +0200
Message-ID: <1096116193.12503.7.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-hWmQh+ms/NWxY3PwWQye"
Return-path: <reiserfs-list-return-21918-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-hWmQh+ms/NWxY3PwWQye
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

it seems I've found a deadlock in reiser4.

I don't know how it happens, but every time i want to run "emerge php"
the command compiles php and wants to install it but just before the end
it hangs (when running some PEAR commands). The whole system freezes a
couple of seconds after that. /var/log/messages contains some lines
saying "clong length 0" but these lines never actually get commited to
disk when the build directory is on the /var volume.

Interestingly the same deadlock occurs if I try to run the build on
another volume.

I've tried it four times so far, always with the same result. The
filesystems are all clean.

Should I turn on debugging? I can also provide ssh access to someone if
he wants to look himself.

The reiser4 version is from 2.6.9-rc1-mm1, I think.


--=-hWmQh+ms/NWxY3PwWQye
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBBVWfhZCYBcts5dM0RAscGAJ4gVZisV5/VFH2x/jNKPnMnyqI3+gCfUYx/
P79Bk//m8EFyepA5efrxr/Y=
=50o0
-----END PGP SIGNATURE-----

--=-hWmQh+ms/NWxY3PwWQye--

