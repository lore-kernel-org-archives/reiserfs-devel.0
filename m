From: Jonathan Briggs <jbriggs@esoft.com>
Subject: New Reiser4 snapshot slower?
Date: Fri, 26 Mar 2004 14:00:38 -0700
Message-ID: <1080334838.23552.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-kXkKYgaEzYBeW5OLO22e"
Return-path: <reiserfs-list-return-17515-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

--=-kXkKYgaEzYBeW5OLO22e
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This command:
# dd if=3D/dev/zero of=3Dtestfile bs=3D4k count=3D256k
seems to take longer than it did before.  The difference seems to be all
system time.

I will have to reboot to an old version later, to get accurate numbers.

I don't have debugging turned on, so that's not it.  Has something
changed that would have made this slower?
--=20
Jonathan Briggs
jbriggs@esoft.com

--=-kXkKYgaEzYBeW5OLO22e
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBAZJn2G8fHaOLTWwgRAtTAAKCevndedP7rF2RyyYSYgdtxosEgVgCeIUVZ
3kSzaOka3CchtF+Tx8WGJPw=
=rNi3
-----END PGP SIGNATURE-----

--=-kXkKYgaEzYBeW5OLO22e--

