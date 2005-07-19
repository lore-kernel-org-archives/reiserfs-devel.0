From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: Fastest way to "find / -mtime +7".....
Date: Tue, 19 Jul 2005 12:48:53 -0600
Message-ID: <1121798933.15596.13.camel@localhost>
References: <FD5AA849-D432-4881-B70F-E71369520749@surfcity.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-5FlDrCr72Pa6/tldB+LX"
Return-path: <reiserfs-list-return-25202-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <FD5AA849-D432-4881-B70F-E71369520749@surfcity.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Ed Walker <ewalker@surfcity.net>
Cc: reiserfs-list@namesys.com

--=-5FlDrCr72Pa6/tldB+LX
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2005-07-19 at 10:55 -0700, Ed Walker wrote:
> I've got a lot of small maildir files stored on a reiser-fs =20
> partition.  Currently we expire out the old stuff using
>      find /mail -mtime +7 -type f -print0 | xargs -0 rm -rf
>=20
> this is pretty slow on reiser, at least compared with ext2/3, and I =20
> understand that it may be because the find command returns the names =20
> in a non-optimal order (ie readdir order?).
>=20
> Is there something we can do to speed it up?  Any suggestions?
>=20
> Thanks-
>=20
> Ed

I think Reiser3 is slow more because with mtime, find has to stat each
file.  I did a couple ad-hoc tests and it seems to be about 40x slower
on directory list with stat than just plain directory lists.  I didn't
try ext2/3.

I believe the reiser3 directory order problems with maildir are related
to something else, like not finding new mail at the end of the
readdir()?=20
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-5FlDrCr72Pa6/tldB+LX
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBC3UsVG8fHaOLTWwgRAq0BAJ914OJh/Wj2VD2Idx8IdiOpIHnNbACdHPBC
YHQuXtDA2WC6O3VyTCj/zr0=
=XNjS
-----END PGP SIGNATURE-----

--=-5FlDrCr72Pa6/tldB+LX--

