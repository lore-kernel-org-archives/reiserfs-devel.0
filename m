From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Sun, 23 Jul 2006 13:48:28 +0200
Message-ID: <20060723114828.GC27825@lug-owl.de>
References: <44C12F0A.1010008@namesys.com> <20060722130219.GB7321@thunk.org> <44C26F65.4000103@namesys.com> <44C28A8F.1050408@garzik.org> <44C32348.8020704@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S1BNGpv0yoYahz37"
Return-path: <reiserfs-list-return-29160-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <44C32348.8020704@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Jeff Garzik <jeff@garzik.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

--S1BNGpv0yoYahz37
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2006-07-23 01:20:40 -0600, Hans Reiser <reiser@namesys.com> wrote:
> There is nothing about small patches that makes them better code.  There

Erm, a small patch is something which should _obviously_ fix one
issue. A small patch, containing at max some 100 lines, can easily be
read and understood.

A complete filesystem (I'm co-maintaining one for an ancient on-disk
format, too) isn't really easy to understand or to verify from looking
at it for 5min.

> is no reason we should favor them, if the developers are willing to work
> on something for 5 years to escape a local optimum, that is often the
> RIGHT thing to do.

I give a shit of nothing to some 5 year work if I cannot verify that
it won't hurt me at some point.

> It is importand that we embrace our diversity, and be happy for the
> strength it gives us.  Some of us are good at small patches that evolve,
> and some are good at escaping local optimums.  We all have value, both
> trees and grass have their place in the world.

Just put reiser4 in some GIT tree and publish it. Maybe you can place
it on git.kernel.org .

MfG, JBG

--=20
       Jan-Benedict Glaw       jbglaw@lug-owl.de                +49-172-760=
8481
 Signature of:                     ...und wenn Du denkst, es geht nicht meh=
r,
 the second  :                            kommt irgendwo ein Lichtlein her.

--S1BNGpv0yoYahz37
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFEw2IMHb1edYOZ4bsRAtBDAJ0Qym+4r9bF+dHPNoYYiOAmfVEkZgCfXkWF
3zck3qVosxcJYtP3AZyCC4U=
=AqyK
-----END PGP SIGNATURE-----

--S1BNGpv0yoYahz37--
