From: Prakash Punnoor <prakash@punnoor.de>
Subject: Re: reiser4 nfsroot problem
Date: Thu, 17 Aug 2006 19:59:58 +0200
Message-ID: <200608171959.58620.prakash@punnoor.de>
References: <200608171835.52188.prakash@punnoor.de> <200608171838.24526.prakash@punnoor.de> <200608172136.02795.zam@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1960303.bkLOy46RMb";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29622-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608172136.02795.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

--nextPart1960303.bkLOy46RMb
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Donnerstag 17 August 2006 19:36 schrieb Alexander Zarochentsev:
> Hello,
>
> On 17 August 2006 20:38, Prakash Punnoor wrote:
> > Am Donnerstag 17 August 2006 18:35 schrieb Prakash Punnoor:
> > > Hi,
> > >
> > > Using the reiser4 patch 3 for 2.6.17 with a 2.6.18-rc4 kernel (I
> > > ported the reiser4 patch by hand with help of mm kernel...) I
> > > wasn't able to boot a nfsroot client with the "image" residing on a
> > > master with reiser4 partition. The same setup works w/o problems
> > > once I moved the "image" to an ext3 partition.
> >
> > Perhaps I should note, that the master is x86_64 and the client x86.
> > Do you need more infos to reproduce the problem?
>
> did it work with reiser4 with another kernels, before 2.6.17 ?
> does plain nfs mount work, not nfsroot?

I haven't tested it with another kernel. Mounting the export on the master=
=20
itself and on another maschine in userspace works though. Just nfsroot bork=
s.
=2D-=20
(=9C=3D                 =3D=9C)
//\ Prakash Punnoor /\\
V_/                 \_V

--nextPart1960303.bkLOy46RMb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBE5K6exU2n/+9+t5gRAhVBAKCkYUQ2UgBiCfeh0e/43FPomOpjzQCgyyEp
wKlr5uYLXBewngWbWdOKBn8=
=0+wx
-----END PGP SIGNATURE-----

--nextPart1960303.bkLOy46RMb--
