From: Thomas Kuther <gimpel@sonnenkinder.org>
Subject: Re: Reiser4 and loop device problems
Date: Fri, 16 Nov 2007 00:27:31 +0100
Message-ID: <20071116002731.5aa736df@sirius>
References: <20071115224457.2202be3e@sirius>
	<a08621850711151349m6ae91e74led14485dd41c2f8f@mail.gmail.com>
	<20071115231053.5066b94e@sirius>
	<b8d16a880711151502h509cac93m7453a66b551f4fae@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IjoaD1fZwVF1QxNcNYjjgbC";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <b8d16a880711151502h509cac93m7453a66b551f4fae@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org, Christopher Sawtell <csawtell@gmail.com>

--Sig_/IjoaD1fZwVF1QxNcNYjjgbC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fr, 16.11.07 12:02 "Christopher Sawtell" <csawtell@gmail.com> wrote:

> > > Can you remember the last kernel that worked?
> > >
> > > Thanks
> > >
> > > Dushan
> >
> > Unfortunately not for sure. I'm not even sure if it ever worked at
> > all, to be honest. There were some old threads from 2003 saying
> > that loop is not supported (yet). Did that ever change?
>=20
> Yes.
>=20
> imogen ~ # uname -r
> 2.6.22.9
> imogen ~ # cd /media/Isos/Debian/
> imogen Debian # mount -o loop -t iso9660
> Debian-Etch-4.0-r1-Binary-1-20070819.iso /mnt/tmp
> imogen Debian # ls /mnt/tmp
> README.html          README.txt   debian  install      md5sum.txt
> tools README.mirrors.html  autorun.bat  dists   install.386  pics
> README.mirrors.txt   autorun.inf  doc     isolinux     pool
>=20
> But it's broken for linux-2.6.23.1
>=20
> If I can be of any further assistance, please do not hesitate to ask.
>=20

So which version of reiser4 patch, progs etc do you use?

Edward wrote, it never did. Now.. WTF? :)

Regards,
Tom

--Sig_/IjoaD1fZwVF1QxNcNYjjgbC
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iD8DBQFHPNX1MQFfAqZTGfwRAk/GAJ4h/qFXS5/oqwtL5FT1d57KRKqY8wCfdFXL
LOvUWRdFg/wC+E162SOrDnk=
=7dMJ
-----END PGP SIGNATURE-----

--Sig_/IjoaD1fZwVF1QxNcNYjjgbC--
