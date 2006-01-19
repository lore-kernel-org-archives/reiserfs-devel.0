From: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Subject: Re: reiserfs tails and disk space
Date: Thu, 19 Jan 2006 13:53:49 -0600
Message-ID: <20060119195349.GC11010@untroubled.org>
References: <20060117181548.GB11010@untroubled.org> <43CD3E45.6080304@namesys.com> <200601182134.49888.vitaly@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Return-path: <reiserfs-list-return-27801-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200601182134.49888.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2006 at 09:34:49PM +0300, Vitaly Fertman wrote:
> thank you for the report, the attached patch should fix=20
> the broken mount options. please try it.

It does indeed fix the problem.  What other mount options would have
been affected by this problem?  In what version of the kernel was this
problem introduced?

Thanks.
--=20
Bruce Guenter <bruce@untroubled.org> http://untroubled.org/
OpenPGP key: 699980E8 / D0B7 C8DD 365D A395 29DA  2E2A E96F B2DC 6999 80E8

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFDz+5N6W+y3GmZgOgRAo4BAKCVbauZn7u8O01rjSDKK6rWqBOkBACdG+Tz
2bCuWba4ll2y9MOfM1y7l5k=
=qr2s
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
