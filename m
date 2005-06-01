From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: File as a directory - VFS Changes
Date: Wed, 01 Jun 2005 09:40:52 -0600
Message-ID: <1117640452.12866.9.camel@localhost>
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
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-j/iXRnnngGk95b+8F3c5"
Return-path: <reiserfs-list-return-24266-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17053.51551.825703.450388@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Hans Reiser <reiser@namesys.com>, Valdis.Kletnieks@vt.edu, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com, Nate Diller <ndiller@namesys.com>

--=-j/iXRnnngGk95b+8F3c5
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2005-06-01 at 18:42 +0400, Nikita Danilov wrote:
> Jonathan Briggs writes:
>  > On Wed, 2005-06-01 at 14:43 +0400, Nikita Danilov wrote:
>  > > Nikita Danilov writes:
>=20
> [...]
>=20
>  > >=20
>  > > That latter bit, about making them persistent, is where the trouble
>  > > begins: once queries acquire identity and a place in the file system
>  > > name-space, they logically become part of that very name-space they =
are
>  > > querying! This leads to various complication, and you are trying to =
work
>  > > around them by claiming that queries are not _always_ part of name-s=
pace
>  > > ("file1 [only] **appears** to be a child..."). This non-uniform beha=
vior
>  > > is a big disadvantage.
>  >=20
>  > In this scheme, query objects were always part of the name-space.
>=20
> Then, paths visible through queries are inconsistent with names of
> underlying objects. You querying system returns fake results
> ("/tmp/A/B/C/A/file1") that are not present in the database queries are
> ran against. This is *wrong*. Nobody is going to tolerate DBMS that
> sometimes returns extra rows in SELECT statement, right?

If you wished to enforce name-query directories always having a single
name and their query always being identical to their name, then that
wouldn't happen.

However, query directories (or "smart folders") will have this namespace
problem in every case and there is no avoiding it.  If the query is for
every file modified in the past day, the file path through the query
directory is not going to match any given name of the file.  Same for
keyword queries, ownership queries, or whatever.

In the traditional directory system, a file doesn't have an official
name, just links to it from directory entries.  Perhaps if you think of
the proposed "name" meta-data as a "preferred name" the idea would work
better for you?
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-j/iXRnnngGk95b+8F3c5
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCndcEG8fHaOLTWwgRAt39AKCft127yI8cotR/540zYbBwArwJOACggC4E
Lhoe1BOjwfc8wVwQ02E38N8=
=r+z4
-----END PGP SIGNATURE-----

--=-j/iXRnnngGk95b+8F3c5--

