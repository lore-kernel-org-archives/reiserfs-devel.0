From: Christophe Saout <christophe@saout.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 16:25:13 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <1093530313.11694.56.camel@leto.cs.pocnet.net>
References: <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de>
	 <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org>
	 <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk>
	 <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org>
	 <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk>
	 <20040826001152.GB23423@mail.shareable.org>
	 <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk>
	 <20040826010049.GA24731@mail.shareable.org> <412DA40B.5040806@namesys.com>
	 <20040826140500.GA29965@fs.tum.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ayEJYZR3115GeyJhdEGR"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040826140500.GA29965@fs.tum.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Adrian Bunk <bunk@fs.tum.de>
Cc: Hans Reiser <reiser@namesys.com>, Jamie Lokier <jamie@shareable.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>


--=-ayEJYZR3115GeyJhdEGR
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 26.08.2004, 16:05 +0200 schrieb Adrian Bunk:

> > Yes, this was part of the plan, tar file-directory plugins would be cut=
e.
>=20
> Silly question:
>=20
> GNU Midnight Commander allows for ages to go into e.g. tar files, so I=20
> know the benefits of this. Additionally, in GNU Midnight Commander, this=20
> works no matter which file system I use (e.g. it works on iso9660), and=20
> it even works the same way on other OS's like e.g. Solaris and NetBSD.
>=20
> What is the technical reason why a tar plugin should be reiser4=20
> specific, instead of a generic VFS or userspace solution that would=20
> allow the same also on other fs like e.g. iso9660?

I don't think that this should be done inside the kernel. tar is a
perfectly valid userspace application.

What reiser4 can do, but the VFS can't is to insert or remove data in
the middle of a file. Adding this above the page cache would probably be
almost impossible (truncate seems already complicated enough).

But below page-cache and thus invisible from the VFS or the applications
it is extremely useful for the compression plugin. When changing some
data in the middle of the file the compressed data might grow in size.
reiser4 can handle this inside the storage layer and doesn't mess with
the rest of the filesystem.


--=-ayEJYZR3115GeyJhdEGR
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBLfLJZCYBcts5dM0RAsyfAJ93usHbDXqOrv2ObJ3BYvO03yWSvwCeJ15d
cXzraPHedm+u0kJwcHUVADg=
=GB1W
-----END PGP SIGNATURE-----

--=-ayEJYZR3115GeyJhdEGR--

