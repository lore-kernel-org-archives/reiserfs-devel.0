From: Christophe Saout <christophe@saout.de>
Subject: Re: Quicker alternative to "find /"?
Date: Mon, 16 Aug 2004 14:52:45 +0200
Message-ID: <1092660765.28417.4.camel@leto.cs.pocnet.net>
References: <20040815231640.3c926886.felix.klee.reiserfs@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-hpRY7OvylaYmoCZv7GGx"
Return-path: <reiserfs-list-return-20324-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040815231640.3c926886.felix.klee.reiserfs@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Felix E. Klee" <felix.klee.reiserfs@gmx.net>
Cc: reiserfs-list@namesys.com

--=-hpRY7OvylaYmoCZv7GGx
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 15.08.2004, 23:16 +0200 schrieb Felix E. Klee:

> I'd like to store the directory structure of a partition formatted as
> ReiserFS into a file. Currently, I use
>=20
>     find / >file
>=20
> This process takes approximately 5 minutes (the result is 26MB of
> data). Are there any alternative *quicker* ways to do this?

The main problem is that find only uses one thread. This thread only
reads one directory at once and as a result of that you'll get a lot of
seeks.

This can usually be improved *a lot* by doing a massively multi-threaded
search with a lot of threads trying to read a lot of directories at
once. The disk io scheduler will then linearize all the outstanding read
requests.

I've done something similar to speed up a diff -r using a shell script
(not for find but for reading the file content that should be compared).


--=-hpRY7OvylaYmoCZv7GGx
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBIK4dZCYBcts5dM0RAttqAJ9ANMxdfh8wocxrd9r8E6LdSg5V1gCfVSk+
AY6tMOwcuYm/qUtFWBrJXjc=
=UDza
-----END PGP SIGNATURE-----

--=-hpRY7OvylaYmoCZv7GGx--

