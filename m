From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: Reiser4: Format 4.0.1: Meta(data) checksums
Date: Fri, 18 Sep 2015 13:02:28 +0200
Message-ID: <1442574148.5227.6.camel@decadent.org.uk>
References: <55E470E0.2070304@gmail.com>
	 <CAM12Q5Qkx-3ShOJjXd02_4Af0it3wv+39hXDW4sFhBosg=i3SQ@mail.gmail.com>
	 <CAFCWPPL+qqq0UgqV0F2T54EfmvVYmN6iWeuoVNvExR+dYqZWmg@mail.gmail.com>
	 <CAM12Q5T43V0-j5fGDrY4euTJE7jA5Tv2L+L678oRMvV6vJgyqA@mail.gmail.com>
	 <1441804577.3968.2.camel@gmail.com>
	 <CAM12Q5Q4Si+hAh92gw3pUHL4x9--bqTNbDyNugkKiy3shdBS2Q@mail.gmail.com>
	 <1441887004.4227.2.camel@gmail.com>
	 <CAM12Q5TCFxqrUpPC37MUWq7bSbu-fq2Ny0-E9iAhVDfECY7U9w@mail.gmail.com>
	 <1442149593.3827.1.camel@gmail.com>
	 <CAM12Q5QySio0eJMYe91YQEB19Z+xwmJ6sjVEKDD9Be8TCf5Bvg@mail.gmail.com>
	 <1442505391.4102.6.camel@gmail.com>
	 <1442526678.5227.3.camel@decadent.org.uk>
	 <1442569896.15714.14.camel@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-aDWftliu7pY7cOyTEX7S"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1442569896.15714.14.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Ivan Shapovalov <intelfx100@gmail.com>, Jose R R <jose.r.r@metztli.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Milan =?UTF-8?Q?Bu=C5=A1ka?= <milan.buska@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org, debian-kernel@lists.debian.org


--=-aDWftliu7pY7cOyTEX7S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2015-09-18 at 12:51 +0300, Ivan Shapovalov wrote:
> On 2015-09-17 at 23:51 +0200, Ben Hutchings wrote:
[...]
> > The proper way to put extra dependencies in modules is:
> >=20
> > /* Soft module dependencies. See man modprobe.d for details.
> >  * Example: MODULE_SOFTDEP("pre: module-foo module-bar post: module
> > -baz")
> >  */
> > #define MODULE_SOFTDEP(_softdep) MODULE_INFO(softdep, _softdep)
> >=20
> > However initramfs-tools still needs to be fixed to follow these
> > dependencies.
> >=20
> > Ben.
> >=20
>=20
> Hi Ben,
>=20
> yeah, I've considered softdeps, but at least in arch linux the
> mkinitcpio tool doesn't look at softdeps at all.
>=20
> So, there is no way to append something to the "depends" field in the
> module info (i. e. "hard" dependencies). Correct?

Right, the hard dependencies are calculated by depmod based on symbol
usage.

Ben.

--=20
Ben Hutchings
[W]e found...that it wasn't as easy to get programs right as we had thought=
.
... I realized that a large part of my life from then on was going to be sp=
ent
in finding mistakes in my own programs. - Maurice Wilkes, 1949

--=-aDWftliu7pY7cOyTEX7S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVfvvROe/yOyVhhEJAQqtWw/+J1dSo4UjTg1UduloswaIgMcvovH4RDxt
4n0HkrE86ezxlRtKASS2de9QsRcS0TaFeeUWntOFhbRkzTLfu0UDw9hI8alieqGf
+b+uKpa60e7BMEOxuQ3txSaFymQ0MIgAHPfHvsps61yiYi5CrhBC3+O1ZYtRIp8w
RDJ5V+T0ildD/rmOyjmkpoAY3R9/jgjaXyWl6F+YRpAldHmgF3xRS0qAMxLEB752
+7x/FouWNhQKhLIzp81BmJelyyeE/2oHiYC6cPiWojeO4gXp7vRSSKDENzpnbDR+
CxA7Pl60/Z/KWrY3NvMaGC+6rzlQXuTivFrK/gQuavX6pebrj1wB25/iZ9GdqZUB
493Gcz7SGYCssazSafXQGEgnzCOsMMdwmmi6eZFz3+IvZxm96iOOnN0Hwt3TXxtw
I9WAjyAPDfkmkzguXctVsL7Inx8ZuOFQb2eefEa5bytG9xyi/ibC13NjIYTPvk7W
e9v4yf537n07gwaP6D8m4U6fCqDusBKlrUxtPYP4P4wDlkmou7mJzLGZecKbMDWa
bRGfT3OnTz2fciRKemKy+l0B7ezJ8nWBdLOzKjnCT4SLytFBTaNEXSt/VUTGYnv/
dbEcSMOxr581koeJ6FEOxCLLJg8I9tKWqIEvHCQvi698ZqLCcEwNoWY9gKBxPFI0
IlDlv5S1/e4=
=yOuj
-----END PGP SIGNATURE-----

--=-aDWftliu7pY7cOyTEX7S--
