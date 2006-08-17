From: Prakash Punnoor <prakash@punnoor.de>
Subject: Re: reiser4 nfsroot problem
Date: Thu, 17 Aug 2006 18:38:24 +0200
Message-ID: <200608171838.24526.prakash@punnoor.de>
References: <200608171835.52188.prakash@punnoor.de>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2274213.IYFQvoiUHW";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29620-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608171835.52188.prakash@punnoor.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nextPart2274213.IYFQvoiUHW
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Donnerstag 17 August 2006 18:35 schrieb Prakash Punnoor:
> Hi,
>
> Using the reiser4 patch 3 for 2.6.17 with a 2.6.18-rc4 kernel (I ported t=
he
> reiser4 patch by hand with help of mm kernel...) I wasn't able to boot a
> nfsroot client with the "image" residing on a master with reiser4
> partition. The same setup works w/o problems once I moved the "image" to =
an
> ext3 partition.

Perhaps I should note, that the master is x86_64 and the client x86. Do you=
=20
need more infos to reproduce the problem?
=2D-=20
(=B0=3D                 =3D=B0)
//\ Prakash Punnoor /\\
V_/                 \_V

--nextPart2274213.IYFQvoiUHW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBE5JuAxU2n/+9+t5gRAqwSAJwJb5y7ue5wlEL/6gr/HPZWwN5S5wCg5qtb
3g1r/fiWChYLiKZ7mqLjbbg=
=hF7I
-----END PGP SIGNATURE-----

--nextPart2274213.IYFQvoiUHW--
