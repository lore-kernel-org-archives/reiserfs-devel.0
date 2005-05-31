From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: File as a directory - VFS Changes
Date: Tue, 31 May 2005 10:55:15 -0600
Message-ID: <1117558515.13252.21.camel@localhost>
References: <17050.62052.318426.711322@gargle.gargle.HOWL>
	 <75229416615-BeMail@cr593174-a>
	 <17052.12223.708707.757538@gargle.gargle.HOWL>
	 <429C7D0A.6040200@namesys.com>
	 <200505311630.j4VGUeIt007432@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-tYtl9BSbLB1s3255oQcj"
Return-path: <reiserfs-list-return-24235-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200505311630.j4VGUeIt007432@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Valdis.Kletnieks@vt.edu
Cc: Hans Reiser <reiser@namesys.com>, Nikita Danilov <nikita@clusterfs.com>, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com

--=-tYtl9BSbLB1s3255oQcj
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2005-05-31 at 12:30 -0400, Valdis.Kletnieks@vt.edu wrote:
> On Tue, 31 May 2005 08:04:42 PDT, Hans Reiser said:
>=20
> > >Cycle may consists of more graph nodes than fits into memory.=20
> > >
> > There are pathname length restrictions already in the kernel that shoul=
d
> > prevent that, yes?
>=20
> The problem is that although a *single* pathname can't be longer than som=
e
> length, you can still create a cycle.  Consider for instance a pathname r=
estriction
> of 1024 chars.  Filenames A, B, and C are all 400 characters long.  A poi=
nts at B,
> B points at C - and C points back to A.
>=20
> Also, although the set of inodes *in the cycle* fits in memory, the set o=
f
> inodes *in the entire graph* that has to be searched to verify the presen=
ce of
> a cycle may not (in general, you have to be ready to examine *all* the in=
odes
> unless you can do some pruning (unallocated, provably un-cycleable, and s=
o
> on)).  THis is the sort of thing that you can afford to do in userspace d=
uring
> an fsck, but certainly can't do in the kernel on every syscall that might
> create a cycle...

You can avoid cycles by redefining the problem.

Every file or "data object" has one single True Name which is their
inode or OID.  Each data object then has one or more "names" as
properties.  Names are either single strings with slash separators for
directories, or each directory element is a unique object in an object
list.  Directories then become queries that return the set of objects
holding that directory name.  The query results are of course cached and
updated whenever a name property changes.

Now there are no cycles, although a naive Unix "find" program could get
stuck in a loop.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-tYtl9BSbLB1s3255oQcj
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCnJbzG8fHaOLTWwgRAvm9AJ9vVst9ZePTdpJf7PGqVNe+Jxo69gCfevCB
Kir/mH6obLh0Ha8snDDRCyM=
=sq3I
-----END PGP SIGNATURE-----

--=-tYtl9BSbLB1s3255oQcj--

