From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: File as a directory - Ordered Relations
Date: Tue, 31 May 2005 10:46:15 -0600
Message-ID: <1117557975.13252.12.camel@localhost>
References: <6708893568-BeMail@cr593174-a> <4297FA03.6050603@slaphack.com>
	 <200505281942.j4SJgbpi009886@turing-police.cc.vt.edu>
	 <429ACC7E.4040101@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-lAjjqoJ3KmHKBjWZrM3j"
Return-path: <reiserfs-list-return-24234-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429ACC7E.4040101@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Valdis.Kletnieks@vt.edu, David Masover <ninja@slaphack.com>, "Alexander G. M. Smith" <agmsmith@rogers.com>, Leo Comerford <leocomerford@gmail.com>, reiserfs-list@namesys.com

--=-lAjjqoJ3KmHKBjWZrM3j
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2005-05-30 at 01:19 -0700, Hans Reiser wrote:
> Valdis.Kletnieks@vt.edu wrote:
>=20
> >On Fri, 27 May 2005 23:56:35 CDT, David Masover said:
> >
> > =20
> >
> >>Hans, comment please?  Is this approaching v5 / v6 / Future Vision?  It
> >>does seem more than a little "clunky" when applied to v4...
> >>   =20
> >>
> Well, if you read our whitepaper, we consider relational algebra to be a
> functional subset of what we will implement (which implies we think
> relational algebra should be possible in the filesystem naming.)
>=20
> >
> >I'm not Hans, but I *will* ask "How much of this is *rationally* doable
> >without some help from the VFS?".
> >
> Think of VFS as a standards committee.  That means that 5-15 years after
> we implement it, they will copy it, break it, and then demand that we
> conform to their breakage.=20
>=20
> Anytimes someone says it should go into VFS, what they really mean is,
> nobody should get ahead of them because it will increase their workload.;=
-)
>=20
> VFS is a baseline.  Once you support VFS, and your performance is good,
> you can start to innovate.  Next year we finally start to seriously
> innovate, after 10 years of groundwork.  The storage layer was never the
> interesting part of our plans, not to me.....

Why innovate in the filesystem though, when it would work just as well
or better in the VFS layer?  Files as directories and meta-files would
work for all filesystems.  Ext3 with extended attributes could support
the same file structures as Reiser4.  Reiser4 would then be the most
efficient implementation of the general case.

=46rom the last LKML discussion, it didn't look to me as if the kernel
maintainers are going to accept Reiser4's stranger features into the
mainline kernel, so if you're going to be implementing and maintaining
them separately anyway, why not do it in the implementation of all
namespaces, in the VFS code?
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-lAjjqoJ3KmHKBjWZrM3j
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCnJTXG8fHaOLTWwgRAg6LAJ0YdjJpz1/3NRBW9B9FGi32ZnsWhwCeOib0
io91LuNR+0K6mpIKCyhH/bs=
=j7zG
-----END PGP SIGNATURE-----

--=-lAjjqoJ3KmHKBjWZrM3j--

