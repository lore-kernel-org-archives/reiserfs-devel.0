From: Christophe Saout <christophe@saout.de>
Subject: Re: reiser4 plugins (was: silent semantic changes with reiser4)
Date: Thu, 26 Aug 2004 17:48:54 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <1093535334.5482.1.camel@leto.cs.pocnet.net>
References: <20040826014542.4bfe7cc3.akpm@osdl.org>
	 <1093522729.9004.40.camel@leto.cs.pocnet.net> <20040826124929.GA542@lst.de>
	 <1093525234.9004.55.camel@leto.cs.pocnet.net> <20040826130718.GB820@lst.de>
	 <1093526273.11694.8.camel@leto.cs.pocnet.net>
	 <20040826132439.GA1188@lst.de>
	 <1093527307.11694.23.camel@leto.cs.pocnet.net>
	 <20040826134034.GA1470@lst.de>
	 <1093528683.11694.36.camel@leto.cs.pocnet.net>
	 <20040826153748.GA3700@lst.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-bSwd1y9Gf+7i9zGKHhE6"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040826153748.GA3700@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com


--=-bSwd1y9Gf+7i9zGKHhE6
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 26.08.2004, 17:37 +0200 schrieb Christoph Hellwig:

> > > compression or encryption must sit below the pagecache to work nicely=
,
> > > and this hint things that usually sit at the pagecache level.  But le=
t's
> > > assume you have a valid use for different file_operations, why don't =
you
> > > simply add in different file_operations instead of adding another
> > > internal dispatch layer? =20
> >=20
> > I don't know, ask Hans. How could the VFS know it a filesystem wants to
> > do something specific with a file that is completely transparent to the
> > VFS?
>=20
> The VFS shouldn't, that the whole point.  That's why it allows the
> filesystem to register different method tables for each object.

Only the objects it can distinguish.

>         ops->file    =3D reiser4_file_operations;
>         ops->symlink =3D reiser4_symlink_inode_operations;
>         ops->special =3D reiser4_special_inode_operations;
>         ops->dentry  =3D reiser4_dentry_operations;
>         ops->as      =3D reiser4_as_operations;

How could reiser4 register other operations for files that should be
stored encrypted or compressed? It's all under reiser4_file_operations.


--=-bSwd1y9Gf+7i9zGKHhE6
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBLgZlZCYBcts5dM0RAuwyAJ0b5C+KYJcGgRQCClYiyvuKPLe9HQCgqpRV
2F2FKtmT/ZliTFgXl14l5dQ=
=3y8l
-----END PGP SIGNATURE-----

--=-bSwd1y9Gf+7i9zGKHhE6--

