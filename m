From: Christophe Saout <christophe@saout.de>
Subject: Re: Problem - reiser4(2004.08.13), apache(2.0.50) and
	"AllowOverride All"
Date: Tue, 24 Aug 2004 21:20:28 +0200
Message-ID: <1093375229.9503.6.camel@leto.cs.pocnet.net>
References: <412B71F6.6020603@zappa.cx>
	 <1093373015.9503.3.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Gn+Y+CTdHU0mtHIKD7Hg"
Return-path: <reiserfs-list-return-20489-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093373015.9503.3.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andreas Sundstrom <sunkan@zappa.cx>
Cc: reiserfs-list@namesys.com

--=-Gn+Y+CTdHU0mtHIKD7Hg
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 24.08.2004, 20:43 +0200 schrieb Christophe Saout:

> Well, this as a ENOTDIR vs. EPERM problem.

Sorry, this was already known. My current apache 2.0.50 seems to call
lstat first though. Perhaps this is already solved? Because I noticed
apache2 doing this while stracing processes for fun on a machine not
running Reiser4 some time ago.

But to make sure nothing goes wrong Apache should not use ENOTDIR at all
or at least have some workaround that calls stat on a file if it returns
EPERM to make sure... (ugly?).


--=-Gn+Y+CTdHU0mtHIKD7Hg
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBK5T8ZCYBcts5dM0RAih5AKCQu87VFFcVyfuHVIWGg6Kvd1bQ0gCeMw9U
dXziZBV1M25ObxZNkhlwwBg=
=Ae+I
-----END PGP SIGNATURE-----

--=-Gn+Y+CTdHU0mtHIKD7Hg--

