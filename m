From: "Lamont R. Peterson" <lamont@gurulabs.com>
Subject: Re: Quicker alternative to "find /"?
Date: Fri, 27 Aug 2004 13:21:40 -0600
Message-ID: <1093634500.2851.225.camel@localhost.localdomain>
References: <20040815231640.3c926886.felix.klee.reiserfs@gmx.net>
	 <411FF929.7040405@slaphack.com>
	 <20040816140420.11dc210c.felix.klee.reiserfs@gmx.net>
	 <200408161429.27131.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-z7W3M51iYi5c+YfBICus"
Return-path: <reiserfs-list-return-20936-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408161429.27131.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-z7W3M51iYi5c+YfBICus
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-08-16 at 06:29, Christian Mayrhuber wrote:
> On Monday 16 August 2004 14:04, Felix E. Klee wrote:
> > Thanks for the hints. I did some benchmarks:
> >
> > find / >/tmp/find.dirtree:
> >     3:44 (1st run)
> >     3:47 (repeated run)
> > updatedb -u --output=3D/tmp/updatedb.dirtree:
> >     8:51
> >     8:47
> > ls -R / >/tmp/ls.dirtree:
> >     6:16
> >     6:55
> >
> > With less than 4 minutes find is by far the fastest of these
> > methods.

Interesting.  I wonder what ls is doing that find is not.  The updatedb
result does not surprise me in the least.
[SNIP]
> For a backup?
> If you use tar, you can list it's contents after the backup.
>=20
> I use star to backup file system meta data (rights, acl's, attributes),=20
> because our stupid commercial backup software looses the directory rights=
=20
> (that's what you have a backup software for).
> http://freshmeat.net/projects/star/

Does star really work with FACLs now?  Last time I tested it, I could
not get it to really work.

Have you tested your backups (performed test restores, that is) to
verify the FACLs?

What version are you using?

> for backup:
> "/usr/bin/star -c -M -z -meta artype=3Dexustar f=3Dmeta-backup.star.gz /"
>=20
> for restore:
> /usr/bin/star -x -z -U -meta f=3Dmeta-backup.star.gz
>=20
> You may want to try it, I doubt that it's faster than find, though.
--=20
Lamont R. Peterson <lamont@gurulabs.com>
Senior Instructor
Guru Labs, L.C. http://www.GuruLabs.com/

--=-z7W3M51iYi5c+YfBICus
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBL4nDRK8Q4zt1QRURApyuAKDPYkM25wcVbU2zGDCXMAPiTmOV4wCgjuPp
pokzG4kytFo7tEYprtsKmZ0=
=57hG
-----END PGP SIGNATURE-----

--=-z7W3M51iYi5c+YfBICus--

