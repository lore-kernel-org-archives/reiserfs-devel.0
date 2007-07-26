From: Zan Lynx <zlynx@acm.org>
Subject: Question about memory pressure freezes
Date: Thu, 26 Jul 2007 16:25:57 -0600
Message-ID: <1185488757.33588.6.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-gWQngKWDIAwniOoDG8Qk"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>


--=-gWQngKWDIAwniOoDG8Qk
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I have often experienced nearly full system freezes for up to five
seconds at a time while memory is being flushed to disk.

I'm not sure if this is a general Linux problem or a Reiser4 problem, so
I thought I'd ask.

A sysrq-T during the freeze shows many processes trying to acquire a
memory page, and Reiser4 flushing atoms and doing sync things.

My working theory right now is that Reiser4 spends time flushing a lot
of data at once before returning.

If I am right about that, would it not make more sense to flush a few
pages, return to the kernel, flush a few more pages, return to the
kernel, etc, etc?  That way programs could get a bit of RAM and make
some progress.

Of course I could be completely off about what's going on.
--=20
Zan Lynx <zlynx@acm.org>

--=-gWQngKWDIAwniOoDG8Qk
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.5 (GNU/Linux)

iD8DBQBGqR91G8fHaOLTWwgRAoQhAJ4yHfeMog/dSZhMR2PladZQ7l94zACfQIf2
30fiDTmlN3U1AJ32GOb0NZg=
=WH8f
-----END PGP SIGNATURE-----

--=-gWQngKWDIAwniOoDG8Qk--

