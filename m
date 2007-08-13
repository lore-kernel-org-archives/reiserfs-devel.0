From: Zan Lynx <zlynx@acm.org>
Subject: Re: [PATCH] reiser4: fix readpage_unix_file
Date: Mon, 13 Aug 2007 10:37:27 -0600
Message-ID: <1187023047.7855.1.camel@localhost>
References: <46BE15CF.50605@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-y3ke0/3aASIH8Ns0X7wM"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <46BE15CF.50605@namesys.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>


--=-y3ke0/3aASIH8Ns0X7wM
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sun, 2007-08-12 at 00:02 +0400, Edward Shishkin wrote:
> Andrew,
> please, apply.
>=20
> Thanks,
> Edward.

> . If nominated (by VFS) page is out of file size, then fill it
>   by zeros instead of returning -EINVAL (this prevents returning
>   an unexpected error (-EINVAL) by some apps that don't check
>   file size).
>=20
> . Check if the page became uptodate while it was being unlocked.
>=20
> Signed-off-by: Edward Shishkin <edward@namesys.com>=20

I applied this patch this weekend.  It has fixed the problem I was
having.  My system backup completed without any of the invalid read
errors and all files appear correct.  Thank you.
--=20
Zan Lynx <zlynx@acm.org>

--=-y3ke0/3aASIH8Ns0X7wM
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.5 (GNU/Linux)

iD8DBQBGwIjHG8fHaOLTWwgRAqaSAJ4wOxFyQJ0rIFmjLUsb6vnvSQclAACgnye4
4awCcCacQXrXmVuzrQv5KWw=
=kC0l
-----END PGP SIGNATURE-----

--=-y3ke0/3aASIH8Ns0X7wM--

