From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: File as a directory - VFS Changes
Date: Tue, 31 May 2005 17:01:48 -0600
Message-ID: <1117580508.25017.21.camel@localhost>
References: <17050.62052.318426.711322@gargle.gargle.HOWL>
	 <75229416615-BeMail@cr593174-a>
	 <17052.12223.708707.757538@gargle.gargle.HOWL>
	 <429C7D0A.6040200@namesys.com>
	 <200505311630.j4VGUeIt007432@turing-police.cc.vt.edu>
	 <1117558515.13252.21.camel@localhost> <429C97F9.8000009@namesys.com>
	 <1117559594.13252.26.camel@localhost> <429CAC86.3080308@namesys.com>
	 <1117573285.13252.63.camel@localhost> <1117573714.13252.69.camel@localhost>
	 <17052.59096.785042.935234@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-P0sa63gcdL1K+CG09GfU"
Return-path: <reiserfs-list-return-24251-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17052.59096.785042.935234@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Hans Reiser <reiser@namesys.com>, Valdis.Kletnieks@vt.edu, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com, Nate Diller <ndiller@namesys.com>

--=-P0sa63gcdL1K+CG09GfU
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2005-06-01 at 02:36 +0400, Nikita Danilov wrote:
> Jonathan Briggs writes:
>  > On Tue, 2005-05-31 at 15:01 -0600, Jonathan Briggs wrote:
>  > > I should create an example.
>  > >=20
>  > > Wherever I used True Name previously, use OID instead.  True Name wa=
s
>  > > simply another term for a unique object identifier.
>  > >=20
>  > > Three files with OIDs of 1001, 1002, and 1003.
>  > > Object 1001:
>  > > name: /tmp/A/file1
>  > > name: /tmp/A/B/file1
>  > > name: /tmp/A/B/C/file1
>  > >=20
>  > > Object 1002:
>  > > name: /tmp/A/file2
>  > >=20
>  > > Object 1003:
>  > > name: /tmp/A/B/file3
>  > >=20
>  > > Three query objects (directories) with OIDs of 1, 2, and 3.
>  > > Object 1:
>  > > name: /tmp/A
>  > > name: /tmp/A/B/C/A
>  > > query: name begins with /tmp/A/
>  > > query result cache: B->2, file1->1001, file2->1002
>  > >=20
>  > > Object 2:
>  > > name: /tmp/A/B
>  > > query: name begins with /tmp/A/B/
>  > > query result cache: C->3, file1->1001, file3->1003
>  > >=20
>  > > Object 3:
>  > > name: /tmp/A/B/C
>  > > query: name begins with /tmp/A/B/C/
>  > > query result cache: A->1, file1->1001
>  > >=20
>  > > Now there is a A -> B -> C -> A directory loop.  But removing
>  > > name: /tmp/A/B/C/A from Object 1 fixes the loop.  Deleting Object 1 =
also
>  > > fixes the loop.  Deleting any of Object 1, 2 or 3 does not affect an=
y
>  > > other object, because in this scheme, directory objects do not need =
to
>  > > actually exist: they are just queries that return objects with certa=
in
>  > > names.
>=20
> One problem with the above is that directory structure is inconsistent
> with lists of names associated with objects. For example, file1 is a
> child of /tmp/A/B/C/A, but Object 1001 doesn't list /tmp/A/B/C/A/file1
> among its names.

file1 *appears* to be a child because it is actually returned as the
query result for its name of /tmp/A/file1 because A is a query
for /tmp/A/.  If the shell was smart enough to normalize its path by
asking the directory for its name, it would know that /tmp/A/B/C/A
was /tmp/A.   But yes, a stupid program could be confused by the
difference between names.

>=20
>  >=20
>  > I forgot to address Nikita's point about reclaiming lost cycles.  In
>  > this case, let me create Object 4 for /tmp
>  > Object 4:
>  > name: /tmp
>  > query: name begins with /tmp/
>  > query result cache: A->1
>  >=20
>  > Now, if we delete Object 4, are Objects 1,2,3 lost?  I would say not
>  > because they still have names.  When the shell calls chdir("/tmp") a n=
ew
>  > query object (directory) must be created dynamically, and Objects
>  > 1001,1002,1003 still have their names that start with /tmp and so they
>  > immediately appear again.  Their names still start with /, so the top
>  > level query will still find them and /tmp as well.
>=20
> Object 4 is "/tmp". Once it was removed what does it _mean_ for, say,
> Object 1003 to have a name "/tmp/A/B/file3"? What is "/tmp" bit there?
> Just a string? If so, and your directories are but queries, what does it
> mean for directory to be removed? How mv /tmp/A /tmp/A1 is implemented?
> By scanning whole file system and updating leaf name-lists?

Well, the name doesn't mean anything. :-)  It is just a convenient
metadata for describing where to find the file in a hierarchy, and for
Unix compatibility.

If a directory was removed by a standard rm -rf, it would work as
expected because it would descend the tree removing names (unlink) from
each object it found.

Moving an object with "mv" would change its name.  Moving a top-level
directory like /usr would require visiting every object starting
with /usr and doing an edit.  A compression scheme could be used where
the most-used top-level directory names were replaced with lookup
tables, then /usr could be renamed just once in the table.

> It seems that what you are proposing is a radical departure from file
> system namespace as we know it. :-) In your scheme all structural
> information is encoded in leaves _only_, and directories just do some
> kind of pattern matching. This is closer to a relational database than
> to the current file-systems where directories are the only source of
> the structural inform

Yes. :-)  It is radical, and the idea is taken from databases.  I
thought that seemed to be the direction Reiser filesystems were moving.
In this scheme a name is just another bit of metadata and not
first-class important information.  The name-query directories would be
there for traditional filesystem users and Unix compatibility.  They
would probably be virtual and dynamic, only being created when needed
and only being persistent if assigned meta-data (extra names (links),
non-default permission bits, etc) or for performance reasons (faster to
load from cache than searching every file).
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-P0sa63gcdL1K+CG09GfU
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCnOzcG8fHaOLTWwgRAhWyAKCHcZbDsMY8NlF02/VVIiwVSTC1ogCgl+RX
zsUK4JmTjteFLsGKgA+DRmc=
=6SaC
-----END PGP SIGNATURE-----

--=-P0sa63gcdL1K+CG09GfU--

