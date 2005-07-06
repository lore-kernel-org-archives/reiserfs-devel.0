From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: reiser4 plugins
Date: Wed, 06 Jul 2005 15:28:40 -0600
Message-ID: <1120685320.13341.35.camel@localhost>
References: <42CB1E12.2090005@namesys.com> <1740726161-BeMail@cr593174-a>
	 <87hdf8zqca.fsf@evinrude.uhoreg.ca> <42CB7DE0.4050200@namesys.com>
	 <1120675943.13341.10.camel@localhost>  <87mzozemqp.fsf@evinrude.uhoreg.ca>
	 <1120681998.13341.23.camel@localhost>  <42CC44D9.8000306@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-4xTXE/3zbbxvZmZS4A8o"
Return-path: <reiserfs-list-return-25012-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42CC44D9.8000306@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

--=-4xTXE/3zbbxvZmZS4A8o
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2005-07-06 at 15:53 -0500, David Masover wrote:
> Jonathan Briggs wrote:
[snip]
> > /a/b/c, /a/b/d, /a/b/e, /b
> > mv /a/b /b
> > Now you have to change the stored grand-parent inodes for /a/b/c, /a/b/=
d
> > and /a/b/e so that they reference /b/b instead of /a/b.
>=20
> no, c, d, and e all would reference /a/b's *inode*, not *pathname*.=20
> Then /a/b would reference /a.  So with the above mv, you just change the=20
> reference in /a/b (now /b/b) to point to /b as parent.

I misunderstood the reference to parent(s).  It's a list of parent
inodes, one parent per hard link, not a list of all (grand)*parents up
to the root.

But I see it now.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-4xTXE/3zbbxvZmZS4A8o
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCzE0IG8fHaOLTWwgRAnGBAJ0YRrU0vvbhRS7hnRiPvZUag1/bAgCeI2z/
uUB8AKZNyia611Uguy4/VBs=
=p6SP
-----END PGP SIGNATURE-----

--=-4xTXE/3zbbxvZmZS4A8o--

