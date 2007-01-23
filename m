From: sean finney <seanius@seanius.net>
Subject: Re: reiserfsprogs: options for recovering from reiserfsck/"Not
	enough allocable blocks"
Date: Tue, 23 Jan 2007 17:05:26 +0100
Message-ID: <1169568327.5468.71.camel@localhost>
References: <1169558949.5468.40.camel@localhost>
	 <200701231919.37775.vs@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-c9rVk33qWNh0RkHgZn7B"
Return-path: <reiserfs-list-return-30442-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200701231919.37775.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--=-c9rVk33qWNh0RkHgZn7B
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

hi vladimir,

On Tue, 2007-01-23 at 19:19 +0300, Vladimir V. Saveliev wrote:
> You should setup a linear raid (IMPORTANT: with no persistent super block=
) of /dev/mapper/vg0-backup and some spare device.
> Spare device does not have to be big. I do not think that you can not fin=
d 50mb of disk space to create a loop device on that space.
> Then you have to run --rebuild-sb and --rebuild-tree
>=20
> See more details at http://www.mail-archive.com/reiserfs-list@namesys.com=
/msg21597.html

thanks for this.  it's less complicated than i thought.  i'll report
back tomorrow morning/afternoon after i've had the chance to run it.

> > (2) reiserfsprogs 3.6.20, which may have a fix?  doesn't look released
> > yet, and i'm not sure how stable/dangerous it is.
> >=20
> 3.6.20 does not have a fix for that bug.
>=20
> > also, i've heard mention of --scan-whole-partition.  would that be
> > advisable in this situation with 3.6.19? =20
>=20
> no

thanks for the clarifications on these, saves me some time and possible
fs corruption :)



	sean

--=-c9rVk33qWNh0RkHgZn7B
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBFtjJGynjLPm522B0RAtznAKCJYZUmZFnF45GJtmBVgzhEbe+nDQCfeEOv
k2HsjpJDj3RKmXORnoyvsFY=
=dh8R
-----END PGP SIGNATURE-----

--=-c9rVk33qWNh0RkHgZn7B--

