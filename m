From: Christophe Saout <christophe@saout.de>
Subject: Re: Problem - reiser4(2004.08.13), apache(2.0.50) and
	"AllowOverride All"
Date: Tue, 24 Aug 2004 20:43:35 +0200
Message-ID: <1093373015.9503.3.camel@leto.cs.pocnet.net>
References: <412B71F6.6020603@zappa.cx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-BFOH8z46JCtas7PTSGlz"
Return-path: <reiserfs-list-return-20487-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412B71F6.6020603@zappa.cx>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andreas Sundstrom <sunkan@zappa.cx>
Cc: reiserfs-list@namesys.com

--=-BFOH8z46JCtas7PTSGlz
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 24.08.2004, 18:51 +0200 schrieb Andreas Sundstrom:

> If I enable "AllowOverride All" in apache it can no longer serve files
> from reiser4 filesystems.
>=20
> Here's an error from apache:
>=20
> (13)Permission denied: /var/www/htdocs/valid-xhtml11.png/.htaccess pcfg_o=
penfile: unable to check htaccess file, ensure it is=20
> readable, referer: http://zappa.cx/

Well, this as a ENOTDIR vs. EPERM problem.

Apache2 expects the filesystem to return ENOTDIR when it tries to access
some_file/.htaccess. reiser4 returns EPERM and apache2 thinks that
some_file is actually a directory but doesn't have permissions to access
that directory.


--=-BFOH8z46JCtas7PTSGlz
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBK4xXZCYBcts5dM0RAovXAKCE7FLolnnXpH4UXYIQ5RMqTNc7BwCeKVcQ
mEPmr+PSgYGqdE5rHBsFsnk=
=GlUy
-----END PGP SIGNATURE-----

--=-BFOH8z46JCtas7PTSGlz--

