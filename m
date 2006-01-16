From: Heiko Przybyl <lil_tux@web.de>
Subject: Re: Bug (?) with 2.6.15-mm4
Date: Mon, 16 Jan 2006 21:29:51 +0100
Message-ID: <43CC023F.2080809@web.de>
References: <20060116182241.GA5121@gelma.net> <43CBF44C.60106@feise.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig6A7D0D4BCC5C673A5C7D8576"
Return-path: <reiserfs-list-return-27751-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43CBF44C.60106@feise.com>
Sender: lil_tux@web.de
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------enig6A7D0D4BCC5C673A5C7D8576
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

just a quick dirty and possible bad thought:


-mm4:

+i386-enable-4k-stacks-by-default.patch

 Test 4k stacks some more


reiser4:

Note: please make sure that you have checked in

    Code maturity level options
    ---> Prompt for development and/or incomplete code/drivers

and NOT checked in

    Kernel hacking ---> Use 4Kb for kernel stacks instead of 8Kb



maybe the default config option of 4k stacks kills reiser4? so i won't te=
st
it for now :-)


cya Heiko


--------------enig6A7D0D4BCC5C673A5C7D8576
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.19 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFDzAJCqrqqic7aKcsRAjdNAJ9Bp4pvq2Gbto9KPgGNUrId5zBckgCeNPk5
d27duFce6Y5Lag2stvxP4x0=
=Ii2C
-----END PGP SIGNATURE-----

--------------enig6A7D0D4BCC5C673A5C7D8576--
