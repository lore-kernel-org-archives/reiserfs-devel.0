From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: File as a directory - VFS Changes
Date: Tue, 31 May 2005 15:08:34 -0600
Message-ID: <1117573714.13252.69.camel@localhost>
References: <17050.62052.318426.711322@gargle.gargle.HOWL>
	 <75229416615-BeMail@cr593174-a>
	 <17052.12223.708707.757538@gargle.gargle.HOWL>
	 <429C7D0A.6040200@namesys.com>
	 <200505311630.j4VGUeIt007432@turing-police.cc.vt.edu>
	 <1117558515.13252.21.camel@localhost>  <429C97F9.8000009@namesys.com>
	 <1117559594.13252.26.camel@localhost>  <429CAC86.3080308@namesys.com>
	 <1117573285.13252.63.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-T9pgF2fK1/nafjdd4Hdo"
Return-path: <reiserfs-list-return-24248-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1117573285.13252.63.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Valdis.Kletnieks@vt.edu, Nikita Danilov <nikita@clusterfs.com>, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com, Nate Diller <ndiller@namesys.com>

--=-T9pgF2fK1/nafjdd4Hdo
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2005-05-31 at 15:01 -0600, Jonathan Briggs wrote:
> I should create an example.
>=20
> Wherever I used True Name previously, use OID instead.  True Name was
> simply another term for a unique object identifier.
>=20
> Three files with OIDs of 1001, 1002, and 1003.
> Object 1001:
> name: /tmp/A/file1
> name: /tmp/A/B/file1
> name: /tmp/A/B/C/file1
>=20
> Object 1002:
> name: /tmp/A/file2
>=20
> Object 1003:
> name: /tmp/A/B/file3
>=20
> Three query objects (directories) with OIDs of 1, 2, and 3.
> Object 1:
> name: /tmp/A
> name: /tmp/A/B/C/A
> query: name begins with /tmp/A/
> query result cache: B->2, file1->1001, file2->1002
>=20
> Object 2:
> name: /tmp/A/B
> query: name begins with /tmp/A/B/
> query result cache: C->3, file1->1001, file3->1003
>=20
> Object 3:
> name: /tmp/A/B/C
> query: name begins with /tmp/A/B/C/
> query result cache: A->1, file1->1001
>=20
> Now there is a A -> B -> C -> A directory loop.  But removing
> name: /tmp/A/B/C/A from Object 1 fixes the loop.  Deleting Object 1 also
> fixes the loop.  Deleting any of Object 1, 2 or 3 does not affect any
> other object, because in this scheme, directory objects do not need to
> actually exist: they are just queries that return objects with certain
> names.

I forgot to address Nikita's point about reclaiming lost cycles.  In
this case, let me create Object 4 for /tmp
Object 4:
name: /tmp
query: name begins with /tmp/
query result cache: A->1

Now, if we delete Object 4, are Objects 1,2,3 lost?  I would say not
because they still have names.  When the shell calls chdir("/tmp") a new
query object (directory) must be created dynamically, and Objects
1001,1002,1003 still have their names that start with /tmp and so they
immediately appear again.  Their names still start with /, so the top
level query will still find them and /tmp as well.

Therefore, the cycle is never detached and lost.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-T9pgF2fK1/nafjdd4Hdo
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCnNJSG8fHaOLTWwgRAouXAKCCwWn+g2ge6BjlMRr9KBRE2CBTsQCgjv8i
iQ7HK1lmy3UZ/lshYM4AmjI=
=jHvj
-----END PGP SIGNATURE-----

--=-T9pgF2fK1/nafjdd4Hdo--

