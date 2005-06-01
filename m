From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: File as a directory - VFS Changes
Date: Wed, 01 Jun 2005 08:06:52 -0600
Message-ID: <1117634812.26560.33.camel@titania.zlynx.org>
References: <17050.62052.318426.711322@gargle.gargle.HOWL>
	 <75229416615-BeMail@cr593174-a>
	 <17052.12223.708707.757538@gargle.gargle.HOWL>
	 <429C7D0A.6040200@namesys.com>
	 <200505311630.j4VGUeIt007432@turing-police.cc.vt.edu>
	 <1117558515.13252.21.camel@localhost> <429C97F9.8000009@namesys.com>
	 <1117559594.13252.26.camel@localhost> <429CAC86.3080308@namesys.com>
	 <1117573285.13252.63.camel@localhost> <1117573714.13252.69.camel@localhost>
	 <17052.59096.785042.935234@gargle.gargle.HOWL>
	 <1117580508.25017.21.camel@localhost>
	 <17053.36948.892227.432434@gargle.gargle.HOWL>
	 <17053.37172.885941.857716@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-vLig2S0siWDLK/8relQ1"
Return-path: <reiserfs-list-return-24264-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17053.37172.885941.857716@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Hans Reiser <reiser@namesys.com>, Valdis.Kletnieks@vt.edu, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com, Nate Diller <ndiller@namesys.com>

--=-vLig2S0siWDLK/8relQ1
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2005-06-01 at 14:43 +0400, Nikita Danilov wrote:
> Nikita Danilov writes:
>=20
> [...]
>=20
>  >=20
>  >  >=20
>  >  > Yes. :-)  It is radical, and the idea is taken from databases.  I
>  >  > thought that seemed to be the direction Reiser filesystems were mov=
ing.
>  >  > In this scheme a name is just another bit of metadata and not
>  >  > first-class important information.  The name-query directories woul=
d be
>  >  > there for traditional filesystem users and Unix compatibility.  The=
y
>  >  > would probably be virtual and dynamic, only being created when need=
ed
>  >  > and only being persistent if assigned meta-data (extra names (links=
),
>  >  > non-default permission bits, etc) or for performance reasons (faste=
r to
>  >  > load from cache than searching every file).
>  >=20
>  > That latter bit, about making them persistent, is where the tr
>  >=20
>=20
> [Hmm... grue ate my message.]
>=20
> That latter bit, about making them persistent, is where the trouble
> begins: once queries acquire identity and a place in the file system
> name-space, they logically become part of that very name-space they are
> querying! This leads to various complication, and you are trying to work
> around them by claiming that queries are not _always_ part of name-space
> ("file1 [only] **appears** to be a child..."). This non-uniform behavior
> is a big disadvantage.

In this scheme, query objects were always part of the name-space.

None of the objects are really children of any of the others. They only
appear to be children when viewed through a set of name-query
directories.  In reality every object would be an equal in the true OID
name-space.  Only meta-data objects are children of their data objects.

You could also create a confusing query named /tmp/G that returned
results for /usr/lib/.  This is the same sort of abuse that creates
A->B->C->A loops: the query was deliberately set to have a misleading
name/name-query relationship.

The user is responsible for sensible naming.   Under normal use, a user
would hardly notice the difference between traditional directories and
this name-query system. =20

With persistent disk cache of queries and lookup tables for common
names, it does start to look like regular directory structures, but it
is still coming at the problem from the opposite direction.  Traditional
directories store information about a file (its name) outside the file,
and this system would store everything about a file with the file
itself.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-vLig2S0siWDLK/8relQ1
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCncD8G8fHaOLTWwgRAvHeAKCfYWh2fbNndkocxMyu/3RLvmXJcACfexy4
0ce1+iZdjZcfG8m5wa+jiH0=
=+bJe
-----END PGP SIGNATURE-----

--=-vLig2S0siWDLK/8relQ1--

