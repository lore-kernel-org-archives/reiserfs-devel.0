From: Milan =?ISO-8859-1?B?SG9seuRwZmVs?= <listen@mjh.name>
Subject: Re: BitTorrent+Reiser4: curiouser and curiouser
Date: Fri, 22 Sep 2006 23:01:55 +0200
Message-ID: <20060922230155.7d877335.listen@mjh.name>
References: <4513827A.50809@slaphack.com>
	<4513AC55.1080400@muenning.com>
	<45141B73.2000404@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__22_Sep_2006_23_01_55_+0200_Fs.H5e.uWF9w.B1d"
Return-path: <reiserfs-list-return-29977-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45141B73.2000404@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Signature=_Fri__22_Sep_2006_23_01_55_+0200_Fs.H5e.uWF9w.B1d
Content-Type: text/plain; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 22 Sep 2006 12:20:51 -0500
David Masover <ninja@slaphack.com> wrote:

> Konstantin M=FCnning wrote:
> > Have you used -f or -ff with strace?
>=20
> I used -f.  What's the difference between that and -ff?

-ff puts messages for process n into filen <name>.n, where <name> is
given to -o. -o can be given with -f too, then all syscalls are written
in one file prefixed with the process ids.  See also strace(1)

As mentioned already, futex() is usually used for interprocess
communication, e. g. waiting for another thread / process.=20

Regards,
Milan

--Signature=_Fri__22_Sep_2006_23_01_55_+0200_Fs.H5e.uWF9w.B1d
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iQIVAwUBRRRPSWGQ1TgKZKJkAQIIZRAAwD5ylcpcS5wcgr+bLqM/xM1gaaZoRF0E
KtsQ0Ds+w9LamYC0DKkl/twBPb5saoSN564OLjYy2K0vR9UCxI9rzh+S2hYANoSx
l7TwJNjvc+IN3sABcsMDfyvQAlMozZAfFWSz4NbCW+Soyb4VQvoZYiGz/vHzXQUO
eTPxzBHy6hYpHwu9UBO3dGFNqJ3XTInKoGFGvsZIS4QZZnHSxzTXmS0bsUwzRZ3r
3Iq/1DDDYplWunIJa8f8pYPQYi7rfuB2dymqUaI1fHzIzjjXrBaoJ1IcoBpI5ixJ
NM19rAABeoVVgJAo8082pqGxuJT2//BiODDSWUeVnpVYiRjadc8ebAWTKFNecS5X
tKUjZ49xoKtq7PM/xJikcwgEJLaE+uCK1x0Bt/NyMCw+wn//EXGcu8pRGUZMs+Et
yc9Xq2VQOL0q2XLJkeV+FgDwaBgFB+0ZtZKXXN7JV9PzAB+6SqiUw6VNX30NdO7a
VThoR+Jv9qwHLOYK972rI2lsEIPWxxi1ciZTnRKsaKdIojmiUuy2vn3nc67LQh/C
dFUwSFdfFbh9bglZ9oNRSdhuzrswZ3blHmBTD2K4NXcmrDIyv/PZTTT5HVARbJjw
QXrMBCp6T3v0rIRgc6lBRrayAIA3t+RhGn2Mo0uiTjrqkvZd/+5wv5ygTktOv7xk
D6ARtjNUC3g=
=8ASn
-----END PGP SIGNATURE-----

--Signature=_Fri__22_Sep_2006_23_01_55_+0200_Fs.H5e.uWF9w.B1d--
