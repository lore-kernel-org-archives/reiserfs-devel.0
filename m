From: Zan Lynx <zlynx@acm.org>
Subject: Interesting observation on Reiser4 flush delays and IO scheduler
Date: Thu, 02 Aug 2007 14:28:28 -0600
Message-ID: <1186086508.14479.14.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-+9n5iDXPkwxkiNFqUcHt"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>


--=-+9n5iDXPkwxkiNFqUcHt
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On my laptop while running heavy disk read/write loads, I have
discovered that the deadline IO scheduler gives me a much better "feel"
and much shorter (and fewer) system freezes.  This is as compared to the
CFQ scheduler.

I'm not sure why this is yet.  A rough guess is that Reiser4's atom
merging, etc, is not preserving the data CFQ needs to time slice and
prioritize disk IO.  But I don't have any evidence for this guess.  Is
it plausible?

Something to think about.
--=20
Zan Lynx <zlynx@acm.org>

--=-+9n5iDXPkwxkiNFqUcHt
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.5 (GNU/Linux)

iD8DBQBGsj5sG8fHaOLTWwgRAsyPAKCp3eYJOSSFHRkJ0z5zhX/KB6zSAQCeP6hl
4u5ua9kqavRE029z3/cZ7mA=
=0XYc
-----END PGP SIGNATURE-----

--=-+9n5iDXPkwxkiNFqUcHt--

