From: "Robin H. Johnson" <robbat2@orbis-terrarum.net>
Subject: Re: fsck in background?
Date: Mon, 31 Mar 2003 02:47:40 -0800
Message-ID: <20030331104740.GB23949@cherenkov.orbis-terrarum.net>
References: <3E8818CD.1000500@dotcom.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Return-path: <reiserfs-list-return-13478-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E8818CD.1000500@dotcom.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
To: myciel <myciel@dotcom.pl>
Cc: reiserfs-list@namesys.com

--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2003 at 12:30:37PM +0200, myciel wrote:
> Yes, I know this sounds strange, but if one have 1T filesystem full of
> small files, reiserfsck estimates duration to be of order of months,
While this would be nice, it is possible that duration is a little off
;-).=20
Our 1.2Tb RAID3 (single ReiserFS partition) takes ~3 hours to run fsck.
Again, mostly small files, but only at 50% capacity so far.

We've got another 1Tb RAID3 array arriving in about 5 weeks, and I'll
test it out to see how long reiserfsck actually takes when it's full of
small files. The joys of a research sysadmin :-).

> so I'm curious if maybe fscking in background is planned? - idea is not n=
ew
> and bsd guys say that they have it  for freebsd 5.0 in ffs.
I dunno if this is planned for Reiser4 or not, but it certainly would be
nice :-).

--=20
Robin Hugh Johnson
E-Mail     : robbat2@orbis-terrarum.net
Home Page  : http://www.orbis-terrarum.net/?l=3Dpeople.robbat2
ICQ#       : 30269588 or 41961639
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks

iD8DBQE+iBzMsnuUTjSIToURAs5rAJ9A4NFskMJAFvYCOM4ug8r4HsnsRQCgs6uq
LTZO0ha4q0NPfieGDsUB5GI=
=8egD
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
