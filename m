From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: other system with datacorruption  (2.425 + datalogging patches)
Date: Mon, 24 Jul 2006 09:16:47 -0700
Message-ID: <1153757807.5735.30.camel@ipso.snappymail.ca>
References: <200607201452.09270.fjcabello@visual-tools.com>
	 <200607241230.48265.fjcabello@visual-tools.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-NNtx1NF++huc4Krzf9K3"
Return-path: <reiserfs-list-return-29178-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607241230.48265.fjcabello@visual-tools.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Francisco Javier Cabello <fjcabello@visual-tools.com>
Cc: reiserfs-list@namesys.com

--=-NNtx1NF++huc4Krzf9K3
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The MythTV issue should only cause severe slowdown while writing data
after freespace falls below 10%. I have not seen it cause any corruption
whatsoever.

I'm in the process of testing Jeff's patch to fix this issue right now.


On Mon, 2006-07-24 at 12:30 +0200, Francisco Javier Cabello wrote:
> Hello,
> I have been 'googling' and I have found people reporting problems with My=
thtv=20
> and reiserfs v3. Could be any problem if freespace falls bellow 10%?
>=20
> Regards,
>=20
> Paco
>=20
> On Thursday, 20 de July de 2006 14:52, Francisco Javier Cabello wrote:
> > Hello,
> > I have other system with data corruption.
> > I send you the output of 'reiserfsck --check'
> >
> > Regards,
> >
> > Paco
>=20
--=20
Mike Benoit <ipso@snappymail.ca>

--=-NNtx1NF++huc4Krzf9K3
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBExPJvMhKjsejwBhgRAmxVAKCNvgghXKRCGHVXysnT7HNY7QgaFwCfWf7x
NwhbG2fK8EhfFLHT/bJCkb4=
=Rp7g
-----END PGP SIGNATURE-----

--=-NNtx1NF++huc4Krzf9K3--

