From: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Subject: Reiserfs concurrent write problems
Date: Mon, 26 Apr 2004 11:26:48 -0600
Message-ID: <20040426172648.GA22918@em.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Return-path: <reiserfs-list-return-18225-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greetings.

I have been running a series of custom benchmarks to see what
filesystems perform best for a maildir-based mail server.

	http://untroubled.org/benchmarking/2004-04/

So far, reiserfs has by far the best reading rate, but has serious
problems when more than one writer is trying to fsync concurrently.
Also, adding an external journal actually slows down the procedure
instead of improving performance.  Are there any configuration changes
or patches I should be trying to improve write performance?

Thanks.
--=20
Bruce Guenter <bruceg@em.ca> http://em.ca/~bruceg/ http://untroubled.org/
OpenPGP key: 699980E8 / D0B7 C8DD 365D A395 29DA  2E2A E96F B2DC 6999 80E8

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAjUZY6W+y3GmZgOgRAoWeAKCOSehD5t4a8zCuoE7doHhYhV/wwgCgqAA5
aOdR82maw81Ee7+J8tT2cjE=
=ODMC
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
