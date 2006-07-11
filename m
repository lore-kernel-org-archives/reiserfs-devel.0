From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: any way to disable fsync?
Date: Tue, 11 Jul 2006 15:14:56 -0600
Message-ID: <1152652496.3732.7.camel@localhost>
References: <op.tcjl3meld4os1z@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-wO1Zqf77glTtls7VmJVv"
Return-path: <reiserfs-list-return-28952-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.tcjl3meld4os1z@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
To: =?UTF-8?Q?=C5=81ukasz?= Mierzwa <prymitive@pcserwis.net>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

--=-wO1Zqf77glTtls7VmJVv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 2006-07-11 at 23:03 +0200, =C5=81ukasz Mierzwa wrote:
[snip]
> So my question is: is there any way to disable fsync for reiser4? (beside=
 =20
> patching it to fake fsync instead of doing them).

http://ftp.die.net/pub/qmail-tools/libnosync.c

--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-wO1Zqf77glTtls7VmJVv
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iD8DBQBEtBTQG8fHaOLTWwgRAtCHAJ0aZAg0nTQ1U1ctfxFZEOFXV73n8wCfeSQO
3sSH27Nhck1P0otYUouYE0s=
=j/H7
-----END PGP SIGNATURE-----

--=-wO1Zqf77glTtls7VmJVv--

