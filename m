From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: Fastest way to "find / -mtime +7".....
Date: Tue, 19 Jul 2005 16:00:23 -0600
Message-ID: <1121810424.15596.19.camel@localhost>
References: <FD5AA849-D432-4881-B70F-E71369520749@surfcity.net>
	 <1121798933.15596.13.camel@localhost>  <20050719200902.GM1508@vestdata.no>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-PxFkNCIrIv4Q68JnG6Wn"
Return-path: <reiserfs-list-return-25204-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050719200902.GM1508@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Ragnar =?ISO-8859-1?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Cc: Ed Walker <ewalker@surfcity.net>, reiserfs-list@namesys.com

--=-PxFkNCIrIv4Q68JnG6Wn
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, 2005-07-19 at 22:09 +0200, Ragnar Kj=F8rstad wrote:
> On Tue, Jul 19, 2005 at 12:48:53PM -0600, Jonathan Briggs wrote:
> > > this is pretty slow on reiser, at least compared with ext2/3, and I =20
> > > understand that it may be because the find command returns the names =
=20
> > > in a non-optimal order (ie readdir order?).
> >=20
> > I think Reiser3 is slow more because with mtime, find has to stat each
> > file.=20
>=20
> The two issues are related.
>=20
> Readdir will return the filenames in hash order. Find will then go and
> stat each file, still in hash order.
>=20
> Problem is, the inodes are not sorted in directory hash order on the
> disk. They tend to be in approximate creation order. So, the disk access
> pattern is nearly random access, meaning every stat is likely to touch a
> new block and readahead is completely useless.
[snip]
How about some kind of stat-data readahead logic?  If the first two or
three directory entries are stat'd, queue up the rest (or next
hundred/thousand) of them.  If the disk queue is given the whole pile of
stat requests at once instead of one at a time, it should be able to
sort them into a reasonable order.

This might even be a VFS thing to do instead of per-FS.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-PxFkNCIrIv4Q68JnG6Wn
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBC3Xf3G8fHaOLTWwgRAl76AJ4qdIZW3x+SEzcE4AEE8CLhdFEizgCcDYEi
XE5ckUtIijii3rXijphP4LM=
=3lhv
-----END PGP SIGNATURE-----

--=-PxFkNCIrIv4Q68JnG6Wn--

