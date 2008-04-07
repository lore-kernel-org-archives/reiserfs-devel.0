From: Zan Lynx <zlynx@acm.org>
Subject: Re: Reiser4: errors AFTER fsck
Date: Mon, 07 Apr 2008 10:16:46 -0600
Message-ID: <1207585006.31700.2.camel@localhost>
References: <loom.20080405T115310-647@post.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-mP61C/80TyI2bQDm8OqH"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <loom.20080405T115310-647@post.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Mat <jackdachef@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--=-mP61C/80TyI2bQDm8OqH
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2008-04-05 at 12:06 +0000, Mat wrote:
> Volker,
>=20
> storing the portage-tree on a "critical" partition such as /var isn't pro=
bably a
> good idea (yet),=20
> reiser4 gets more stable on an almost daily / weekly basis now but I stil=
l have
> the feeling that it's somewhat fragile in terms of use as a / (root / sys=
tem)
> partition; data-partitions seem to be completely rock-solid & safe, thoug=
h :)

I have been using Reiser4 as / on my laptop for a couple of years now
and have not had any serious problems that caused data loss.  I've had a
few problems here and there but they have been solved fairly quickly.
I've had to run full tree rebuilds overnight several times but never
lost anything I've missed. :)

I do run nightly backups to an external disk, that's probably why I
never lost anything.  Murphy is waiting for the external disk to fail
before he screws me. :)
--=20
Zan Lynx <zlynx@acm.org>

--=-mP61C/80TyI2bQDm8OqH
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEABECAAYFAkf6SO4ACgkQolqWs/Y4NLw2cgCgl3hZArIRqyikYFQ0B2Qo4HaZ
gsUAnAk6LQ1K+tzE1YLs2+rTYi3mPnN1
=L1IQ
-----END PGP SIGNATURE-----

--=-mP61C/80TyI2bQDm8OqH--

