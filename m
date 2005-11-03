From: Fionn Behrens <fionn@spamfilter.de>
Subject: Re: reiser4 in 2.6.14 - lockups with mmapped files
Date: Thu, 03 Nov 2005 15:30:06 +0100
Message-ID: <1131028204.13284.29.camel@laptop>
References: <1130860221.12859.23.camel@laptop>  <436796F6.10603@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-HKsP97wv+CWDWq2xZovL"
Return-path: <reiserfs-list-return-26770-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <436796F6.10603@namesys.com>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-HKsP97wv+CWDWq2xZovL
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


In the mean time I mailed the archck patch maintainer and he readily
acknowledged that his reiser4 patch is flawed. He recommended that I
should apply the "*-2" patches from
ftp.namesys.com/pub/reiser4-for-2.6/2.6.14-rc4-mm1 . Unfortunately the
spinlock-2 patch wont apply cleanly but has seven failed hunks. Since I
have no idea how relevant these patches are I wanted to ask again
whether I should try to fix that patch or just leave it for now and try
the USE_EFLUSH(1) solution first? What would be the most effective
approach?

br,
	Fionn
--=20
 New laws should have better reasons than "recommended by lawyers"
 and "they handle it the same way in the US".       *** Lawrence Lessig


--=-HKsP97wv+CWDWq2xZovL
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDah7rjkvYSI4bFywRAtMIAJ4zFHgSg1rvLVx6tN/xTB7XyRnKagCfdiog
qIo8Yv1CEqcIK4kX9pTr0Ow=
=JSB9
-----END PGP SIGNATURE-----

--=-HKsP97wv+CWDWq2xZovL--


