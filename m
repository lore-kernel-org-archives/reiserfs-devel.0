From: Ryan Underwood <nemesis-lists@icequake.net>
Subject: Re: [OpenAFS] Re: Problems with reiserfs when start OpenAFS 1.2.11-fc1 Segmentation fault with kernel 2.4.22-1.2174.nptl
Date: Thu, 4 Mar 2004 19:40:44 -0600
Message-ID: <20040305014044.GA27737@dbz.icequake.net>
References: <20040304005117.M99283@soltis.cc> <20040304005913.M1858@soltis.cc> <20040304002804.GA5722@dbz.icequake.net> <20040304014303.M64769@soltis.cc> <4046A6A8.2000609@matchmail.com> <20040304071846.GB324@dbz.icequake.net> <20040304230725.GA19887@internet2.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Return-path: <reiserfs-list-return-17084-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040304230725.GA19887@internet2.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Dan Pritts <danno@internet2.edu>
Cc: Mike Fedyk <mfedyk@matchmail.com>, jds <jds@soltis.cc>, Ryan Underwood <nemesis-lists@icequake.net>, reiserfs-list@namesys.com, openafs-info@openafs.org

--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 04, 2004 at 06:07:25PM -0500, Dan Pritts wrote:
> >=20
> > You might also think about bigger than 100MB cache file.  A big cache
> > helps out AFS client performance tremendously.  But definitely use ext2
> > and not ext3 as others have said.
>=20
> I realize it won't work out of the box, but has anyone given any
> thought to putting the cache in tmpfs?
>=20
> Seems like this might be the best of both worlds - when the system is low
> on RAM it can use swap, but when you've got plenty of RAM you avoid the
> overhead of writing the cache files to disk.

I thought about it, and indeed it would be beneficial when running a
server with no writeable medium.  But there was some discussion on the
OpenAFS list a while back, and it would take some work to make the cache
manager work with tmpfs.  Basically it's the same problem with tmpfs as
with reiser, xfs, etc as a cache; the cache manager was developer rather
closely coupled to ext2, and other filesystems just don't support the
operations that the cache manager currently needs.

I'm not sure if there are any plans to fix that at the moment, perhaps
bigger fish to fry, such as getting some real AFS functionality going
for 2.6 users.  For 2.6, we need a per-process credentials API as well
as a way for the OpenAFS module to install its hooks.  I haven't seen=20
anything happening recently except for the very feature-limited kAFS
client (no authentication, no cache, etc).

--=20
Ryan Underwood, <nemesis@icequake.net>

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAR9qbIonHnh+67jkRAkgoAKCvR9CWk6gNoVETOcJmczT+yOkLRgCglgNr
XGAHk80a1jWYfQmFNf/SIWY=
=8FwQ
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
