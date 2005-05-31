From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: File as a directory - VFS Changes
Date: Tue, 31 May 2005 11:13:13 -0600
Message-ID: <1117559594.13252.26.camel@localhost>
References: <17050.62052.318426.711322@gargle.gargle.HOWL>
	 <75229416615-BeMail@cr593174-a>
	 <17052.12223.708707.757538@gargle.gargle.HOWL>
	 <429C7D0A.6040200@namesys.com>
	 <200505311630.j4VGUeIt007432@turing-police.cc.vt.edu>
	 <1117558515.13252.21.camel@localhost>  <429C97F9.8000009@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-aYH+bKdD+wFgFI+FQmMy"
Return-path: <reiserfs-list-return-24238-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429C97F9.8000009@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Valdis.Kletnieks@vt.edu, Nikita Danilov <nikita@clusterfs.com>, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com

--=-aYH+bKdD+wFgFI+FQmMy
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Either that isn't allowed, or it immediately vanishes from all
directories.

If deleting by OID isn't allowed, then every name property must be
removed in order to delete the file.

Personally, I would allow deleting the OID.  It would be a convenient
way to be sure every instance of a file was deleted.

On Tue, 2005-05-31 at 09:59 -0700, Hans Reiser wrote:
> What happens when you unlink the True Name?
>=20
> Hans
>=20
> Jonathan Briggs wrote:
>=20
> >
> >You can avoid cycles by redefining the problem.
> >
> >Every file or "data object" has one single True Name which is their
> >inode or OID.  Each data object then has one or more "names" as
> >properties.  Names are either single strings with slash separators for
> >directories, or each directory element is a unique object in an object
> >list.  Directories then become queries that return the set of objects
> >holding that directory name.  The query results are of course cached and
> >updated whenever a name property changes.
> >
> >Now there are no cycles, although a naive Unix "find" program could get
> >stuck in a loop.
> > =20
> >
>=20
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-aYH+bKdD+wFgFI+FQmMy
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCnJspG8fHaOLTWwgRApZmAJ9tVJf7ezQyVziMwI0OEeNc/pqhwQCfRmyQ
v9cy71oamNzr00FqeYEm4wE=
=xbhk
-----END PGP SIGNATURE-----

--=-aYH+bKdD+wFgFI+FQmMy--

