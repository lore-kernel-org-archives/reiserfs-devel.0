From: Christophe Saout <christophe@saout.de>
Subject: Re: repacker
Date: Thu, 26 Aug 2004 01:01:33 +0200
Message-ID: <1093474893.12518.4.camel@leto.cs.pocnet.net>
References: <1093474401.12559.0.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-MTyvb7nBVWZomO0eRMGD"
Return-path: <reiserfs-list-return-20538-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093474401.12559.0.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
To: redeeman@metanurb.dk
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

--=-MTyvb7nBVWZomO0eRMGD
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 26.08.2004, 00:53 +0200 schrieb Redeeman:

> hey, i notice its possible to activate the repacker in reiser4, and i
> tried it, on a not-important partition, and it didnt seem to cause any
> harm, is this generalyl safe? :)

Well, I just played around with it. The system locked up under memory
pressure and when running it backwards it produced tons of extents that
should have been merged (an fsck fixed that). And I managed to get an
Oops in end_io_handler. I can provide a screenshot if someone is
interested (if this really shouldn't have happene despite the repacker
not being ready yet).

But: It didn't damage a single bit of data. The storage tree itself
seems really robust.

Under normal conditions the left-to-right repacker seems to work just
fine.

echo -n 1 > /sys/fs/reiser4/<fill in device>/repacker/start

I was playing with the version in the -mm tree.


--=-MTyvb7nBVWZomO0eRMGD
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBLRpNZCYBcts5dM0RAickAJ4kFL7usZnMfA4DiX5Ol9xNzc2TBQCfYuES
5GTAZyqZAxuIGzd4WNqeID4=
=05yn
-----END PGP SIGNATURE-----

--=-MTyvb7nBVWZomO0eRMGD--

