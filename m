From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: future r4 maintenance question
Date: Sat, 22 Jul 2006 11:53:06 -0700
Message-ID: <1153594386.6659.172.camel@ipso.snappymail.ca>
References: <1992401892.20060722173244@wp.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Jg/vKR+4CgnqEz3reLby"
Return-path: <reiserfs-list-return-29140-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1992401892.20060722173244@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Pysiak Satriani <pysiak.satriani@wp.pl>
Cc: reiserfs-list@namesys.com

--=-Jg/vKR+4CgnqEz3reLby
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2006-07-22 at 17:32 +0200, Pysiak Satriani wrote:
> Hello,
>=20
> one of the concerns of LKML folks about r4 is that namesys after
> finishing their work with r4 will "rush off" to reiser5 leaving
> r4 as "stable" in a "bugfix-mode only"
>=20
> I understand that way of things - you don't mess with a "stable" branch
> software.
>=20
> But a question arises. Will namesys keep r4 in a bugfix-only mode
> (as with reiserfs v3) or will it have resources planned not only
> for bugfixes but for updates too ?
>=20
> I think that's a thing that needs to be very clear.
>=20

I don't understand the concerns here? Kernel v2.4 is essentially in
"bug-fix only" mode right now, yet I don't see many people complaining
that the kernel developers have abandoned it. I personally think its
crazy to expect major features be back ported to old versions.=20

For as long as I've been alive programmers have released a major version
of their software, and only maintained it with minor version bug fixes
while they work on the next major version to introduce features to it.=20

Hans himself has pretty much followed that same path with ReiserFS V3,
and now V4. There just happened to be a several year gap in between.

I don't know what Hans has in mind in regards to ReiserV5, but ReiserV4
was designed with plugins in mind so adding additional features (even
advanced ones) to it should be much easier than most other file systems.

Just like many other applications that support plugins/extensions/addons
( like Firefox, Thunderbird, Azureus ) I would be incredibly surprised
if Reiser4 doesn't spawn a large community of people completely
independent of Namesys that create plugins from the useless, to the
amazingly useful for years to come.

--=20
Mike Benoit <ipso@snappymail.ca>

--=-Jg/vKR+4CgnqEz3reLby
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBEwnQRMhKjsejwBhgRApREAJ44nEatuHAt3fdnI/iZhC3Lh9ysbwCfeLi6
yeUZ0Vd4CK1rxRxBf2oSkPk=
=CMW6
-----END PGP SIGNATURE-----

--=-Jg/vKR+4CgnqEz3reLby--

