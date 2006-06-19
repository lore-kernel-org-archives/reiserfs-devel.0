From: Andreas =?iso-8859-1?Q?Sch=E4fer?= <gentryx@gmx.de>
Subject: Re: Backup solution
Date: Mon, 19 Jun 2006 21:54:41 +0200
Message-ID: <20060619195441.GA22540@wintermute>
References: <d94c5e090606181312w23860bx459e78677b976254@mail.gmail.com> <20060619184921.GB3895@zero>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Return-path: <reiserfs-list-return-28824-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060619184921.GB3895@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 14:49 Mon 19 Jun     , Tom Vier wrote:
> On Sun, Jun 18, 2006 at 10:12:14PM +0200, Gert wrote:
> > Dunno if this is the right place to ask but does anyone know of any Open
> > Source solutions that can back up Reiser/Ext3 on OES Linux and NSS on O=
ES
> > NW?
>=20
> I use the standard gnu tar -g (incremental mode). Works well for me. Sear=
ch
> freshmeat.net for "backup".

I use rsnapshot (http://www.rsnapshot.org/). It uses hardlinks to
create space efficient incremental backups worth full ones. Doing an
incremental backup of my approx. 300 GiB master node to another node
via 100 MiBit FastEthernet takes less than 15 min. To an external USB
2.0 harddisk a bit faster.

Cheers!
-Andreas

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFElwEBxQzSAzXqsyYRAuPFAJ9+ZYQ7KkmfDex1Fw5iAJoAj3LlYgCeNbKg
mLhKMwBQiwYehXeoXt6t08M=
=1A/F
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
