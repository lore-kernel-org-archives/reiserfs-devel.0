From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: File as a directory - VFS Changes
Date: Tue, 31 May 2005 15:01:25 -0600
Message-ID: <1117573285.13252.63.camel@localhost>
References: <17050.62052.318426.711322@gargle.gargle.HOWL>
	 <75229416615-BeMail@cr593174-a>
	 <17052.12223.708707.757538@gargle.gargle.HOWL>
	 <429C7D0A.6040200@namesys.com>
	 <200505311630.j4VGUeIt007432@turing-police.cc.vt.edu>
	 <1117558515.13252.21.camel@localhost>  <429C97F9.8000009@namesys.com>
	 <1117559594.13252.26.camel@localhost>  <429CAC86.3080308@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-crSBM2xT2fAtSG4fAKyf"
Return-path: <reiserfs-list-return-24247-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429CAC86.3080308@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Valdis.Kletnieks@vt.edu, Nikita Danilov <nikita@clusterfs.com>, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com, Nate Diller <ndiller@namesys.com>

--=-crSBM2xT2fAtSG4fAKyf
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I should create an example.

Wherever I used True Name previously, use OID instead.  True Name was
simply another term for a unique object identifier.

Three files with OIDs of 1001, 1002, and 1003.
Object 1001:
name: /tmp/A/file1
name: /tmp/A/B/file1
name: /tmp/A/B/C/file1

Object 1002:
name: /tmp/A/file2

Object 1003:
name: /tmp/A/B/file3

Three query objects (directories) with OIDs of 1, 2, and 3.
Object 1:
name: /tmp/A
name: /tmp/A/B/C/A
query: name begins with /tmp/A/
query result cache: B->2, file1->1001, file2->1002

Object 2:
name: /tmp/A/B
query: name begins with /tmp/A/B/
query result cache: C->3, file1->1001, file3->1003

Object 3:
name: /tmp/A/B/C
query: name begins with /tmp/A/B/C/
query result cache: A->1, file1->1001

Now there is a A -> B -> C -> A directory loop.  But removing
name: /tmp/A/B/C/A from Object 1 fixes the loop.  Deleting Object 1 also
fixes the loop.  Deleting any of Object 1, 2 or 3 does not affect any
other object, because in this scheme, directory objects do not need to
actually exist: they are just queries that return objects with certain
names.

One problem I already see with it is that there is no way to enforce the
Unix "x" permission without real directory traversal.  But I never liked
that anyway. :)

Are there other problems with it?  Did I explain it clearly?

On Tue, 2005-05-31 at 11:27 -0700, Hans Reiser wrote:
> Well,. if you allow multiple true names, then you start to resemble
> something I suggested a few years ago, in which I outlined a taxonomy of
> links, and suggested that some links would count towards the reference
> count and some would not.
>=20
> Of course, that does nothing for the cycle problem......
>=20
> How are cycles handled for symlinks currently?
>=20
> Hans
>=20
> Jonathan Briggs wrote:
>=20
> >Either that isn't allowed, or it immediately vanishes from all
> >directories.
> >
> >If deleting by OID isn't allowed, then every name property must be
> >removed in order to delete the file.
> >
> >Personally, I would allow deleting the OID.  It would be a convenient
> >way to be sure every instance of a file was deleted.
> >
> >On Tue, 2005-05-31 at 09:59 -0700, Hans Reiser wrote:
> > =20
> >
> >>What happens when you unlink the True Name?
> >>
> >>Hans
> >>
> >>Jonathan Briggs wrote:
> >>
> >>   =20
> >>
> >>>You can avoid cycles by redefining the problem.
> >>>
> >>>Every file or "data object" has one single True Name which is their
> >>>inode or OID.  Each data object then has one or more "names" as
> >>>properties.  Names are either single strings with slash separators for
> >>>directories, or each directory element is a unique object in an object
> >>>list.  Directories then become queries that return the set of objects
> >>>holding that directory name.  The query results are of course cached a=
nd
> >>>updated whenever a name property changes.
> >>>
> >>>Now there are no cycles, although a naive Unix "find" program could ge=
t
> >>>stuck in a loop.
> >>>=20
> >>>
> >>>     =20
> >>>
>=20
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-crSBM2xT2fAtSG4fAKyf
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCnNClG8fHaOLTWwgRAvQXAKCaTMFuaDrXoYSY/pyw04gzWqAt+gCgjjpo
cihnZdWfMf0dw37n1yIBAFA=
=mVHf
-----END PGP SIGNATURE-----

--=-crSBM2xT2fAtSG4fAKyf--

