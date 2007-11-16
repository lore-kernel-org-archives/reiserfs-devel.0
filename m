From: Thomas Kuther <gimpel@sonnenkinder.org>
Subject: Re: Reiser4 and loop device problems
Date: Fri, 16 Nov 2007 10:24:23 +0100
Message-ID: <20071116102423.1de5fb66@sirius>
References: <20071115224457.2202be3e@sirius>
	<a08621850711151349m6ae91e74led14485dd41c2f8f@mail.gmail.com>
	<20071115231053.5066b94e@sirius>
	<b8d16a880711151502h509cac93m7453a66b551f4fae@mail.gmail.com>
	<20071116002731.5aa736df@sirius>
	<45639.76.236.51.34.1195179949.squirrel@scotch.ics.uci.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Sn2XQfum6VXFnddpvFpPVvP";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <45639.76.236.51.34.1195179949.squirrel@scotch.ics.uci.edu>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: jfeise@feise.com
Cc: reiserfs-devel@vger.kernel.org

--Sig_/Sn2XQfum6VXFnddpvFpPVvP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Do, 15.11.07 18:25 "Joe Feise" <jfeise@feise.com> wrote:

> On Thu, November 15, 2007 15:27, Thomas Kuther wrote:
> > On Fr, 16.11.07 12:02 "Christopher Sawtell" <csawtell@gmail.com>
> > wrote:
> >
> >> > > Can you remember the last kernel that worked?
> >> > >
> >> > > Thanks
> >> > >
> >> > > Dushan
> >> >
> >> > Unfortunately not for sure. I'm not even sure if it ever worked
> >> > at all, to be honest. There were some old threads from 2003
> >> > saying that loop is not supported (yet). Did that ever change?
> >>
> >> Yes.
> >>
> >> imogen ~ # uname -r
> >> 2.6.22.9
> >> imogen ~ # cd /media/Isos/Debian/
> >> imogen Debian # mount -o loop -t iso9660
> >> Debian-Etch-4.0-r1-Binary-1-20070819.iso /mnt/tmp
> >> imogen Debian # ls /mnt/tmp
> >> README.html          README.txt   debian  install      md5sum.txt
> >> tools README.mirrors.html  autorun.bat  dists   install.386  pics
> >> README.mirrors.txt   autorun.inf  doc     isolinux     pool
> >>
> >> But it's broken for linux-2.6.23.1
> >>
> >> If I can be of any further assistance, please do not hesitate to
> >> ask.
> >>
> >
> > So which version of reiser4 patch, progs etc do you use?
> >
> > Edward wrote, it never did. Now.. WTF? :)
>=20
> Works here as well on 2.6.22.6:
> joe: mkdir mnt
> joe: sudo mount -o loop -t iso9660 KnoppMythR5F27.iso mnt
> joe: ls -l mnt
> total 10
> dr-xr-xr-x  3 root   root   2048 Sep  8 19:39 KNOPPIX/
> dr-xr-xr-x  3 root   root   2048 May 29  2006 boot/
>=20
> Vanilla kernel with reiser4-for-2.6.22-2.patch.gz and
> reiser4progs-1.0.6.tar.gz
>=20
> -Joe
>=20

Jup, I also tested a plain .22 with namesys patch, and it works
fine. Didn't test with cryptcompress though.

So it seems that something between .22 and .23 broke it again.
Thanks for helping to answer Dushan's question :)

Regards,
Tom

--Sig_/Sn2XQfum6VXFnddpvFpPVvP
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iD8DBQFHPWHNMQFfAqZTGfwRAiP9AJ9DRZEJxscFaZXJYqr+HlkpXuiX4wCbBYKV
+wq3DcIxzHFXsuChukKBjdc=
=vQjH
-----END PGP SIGNATURE-----

--Sig_/Sn2XQfum6VXFnddpvFpPVvP--
