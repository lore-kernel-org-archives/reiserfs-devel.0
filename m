From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: File as a directory - VFS Changes
Date: Thu, 02 Jun 2005 12:35:33 -0600
Message-ID: <1117737334.9224.51.camel@localhost>
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
	 <1117634812.26560.33.camel@titania.zlynx.org>
	 <17053.51551.825703.450388@gargle.gargle.HOWL>
	 <1117640452.12866.9.camel@localhost>
	 <17053.61465.359382.791640@gargle.gargle.HOWL>
	 <1117652606.28827.7.camel@localhost>
	 <17054.57795.295945.256623@gargle.ga
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-7/YGAiVmJI9Hp9sDL6h3"
Return-path: <reiserfs-list-return-24292-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17054.57795.295945.256623@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Hans Reiser <reiser@namesys.com>, Valdis.Kletnieks@vt.edu, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com, Nate Diller <ndiller@namesys.com>

--=-7/YGAiVmJI9Hp9sDL6h3
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2005-06-02 at 14:38 +0400, Nikita Danilov wrote:
> Jonathan Briggs writes:
>  > On Wed, 2005-06-01 at 21:27 +0400, Nikita Danilov wrote:
>  > [snip]
>  > > Frankly speaking, I suspect that name-as-attribute is going to limit
>  > > usability of file system significantly.

Usability as in features?  Or usability as in performance?

>  > >=20
>  > > Note, that in the "real world", only names from quite limited class =
are
>  > > attributes of objects, viz. /proper names/ like "France", or "Jonath=
an
>  > > Briggs". Communication wouldn't get any far if only proper names wer=
e
>  > > allowed.
>  > >=20
>  > > Nikita.
>  >=20
>  > Bringing up /proper names/ from the real world agrees with my idea
>  > though! :-)
>=20
> I don't understand why if you are liberty to design new namespace model
> from scratch (it seems POSIX semantics are not binding in our case), you
> are going to faithfully replicate deficiencies of natural languages.
>=20
> It is common trait in both science and engineering that when two flavors
> of the same functionality (real names vs. indices) arise, an attempt is
> made to reduce one of them to another, simplifying the system as a
> result.

A index is an arrangement of information about the indexed items.  The
index contents *belong* to the items.  An index by name?  That name
belongs to the item.  An index by date?  Those dates are properties of
the item.  Anything that can be indexed about an item can be described
as a property of the item.

Only for efficiency reasons are index data not included with the item
data.

>=20
> In our case, motivation to reduce one type of names to another is even
> more pressing, as these types are incompatible: in the presence of
> cycles or dynamic queries, namespace visible through the directory
> hierarchy is different from the namespace of real names.

Queries create indexes based on properties of the items.  This is no
different from directories, which are indexes based on names of the
items.

In the same way that you can descend a directory tree and copy the names
found into each item, you can check each item and copy the names found
into a directory tree.

>=20
> Indices cannot be reduced to real names (as rename is impossible to
> implement efficiently), but real names can very well be reduced to
> indices as exemplified by each and every UNIX file system out there.
>=20
> So, the question is: what real names buy one, that indices do not?

By storing the names in the items, cycles become solvable because you
can always look at the current directory's name(s) to see where you
really are.  Every name becomes absolutely connected to the top of the
namespace instead of depending on a parent pointer that may not ever
connect to the top.

If speeding up rename was very important, you can replace every pathname
component with a indirect reference instead of using simple strings.
Changing directory levels is still difficult.

--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-7/YGAiVmJI9Hp9sDL6h3
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCn1F1G8fHaOLTWwgRAujuAKChvWuGTxbmT8SpIZ5h3/LAAc3+SACggqId
cNPXBQFIwoHZj4bb1BubPOs=
=qU3s
-----END PGP SIGNATURE-----

--=-7/YGAiVmJI9Hp9sDL6h3--

