From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv5 00/10] reiser4: batch discard support (FITRIM ioctl):
 initial implementation.
Date: Fri, 13 Feb 2015 12:39:47 +0300
Message-ID: <1423820387.14444.1.camel@gmail.com>
References: <1423788499-30430-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-yVJUvfMiFcLWED4XIu3/"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:date:in-reply-to:references:content-type
         :mime-version;
        bh=U5xcf5wdY50vQjqz7zgIzWPvoVQYNVnoH4u3THQUtes=;
        b=XWzQtGkOyrc3RqYFk/BOEefB3teTXf08kU7DLGnhwneWqlb8C+6I+vwG4SLf/TheXu
         S99lRa3ZKAm+S278XaHIX6lI4uYVSN+kNpnc+UcBme1LNQKTTh7lDnmLknGcuwGNN6uE
         zvQW4NOa3weU89chcGyGq17cYctyHsJA3X9+Uwqhbn57qX3jlFPW+MIAVdxuCJz3MZ29
         k+w/JpA/3rgwunYkadSWhN+H34s3my/uf+I2dOMAM9+QWi46m6KC7K9QphTbuQNPPDoG
         gUUR+qv7c7F5CxJ0ePb91e7RL1yAUvBAnNBVRpGBP2nOYGaIqXa7yLUc2WvzEJNJf2NY
         9qaA==
In-Reply-To: <1423788499-30430-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org


--=-yVJUvfMiFcLWED4XIu3/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-02-13 at 03:48 +0300, Ivan Shapovalov wrote:
> [...]
>=20
> Ivan Shapovalov (10):
>   reiser4: block_alloc: add BA_SOME_SPACE flag for grabbing a fixed amoun=
t of space.
>   reiser4: block_alloc: add a "monotonic_forward" parameter to reiser4_bl=
ocknr_hint to allocate blocks only in forward direction.
>   reiser4: block_alloc: move block accounting by pre-commit hook into blo=
ck_alloc.c and document BA_DEFER behavior.
>   reiser4: txnmgr: free allocated but unneeded atom in atom_begin_and_ass=
ign_to_txnh().
>   reiser4: txnmgr: add reiser4_create_atom() which creates an empty atom =
without capturing any nodes.
>   reiser4: txnmgr: move "empty atom" shortcut slightly below.
>   reiser4: batch discard support: add a dummy FITRIM ioctl handler for di=
rectories.
>   reiser4: batch discard support: actually implement the FITRIM ioctl han=
dler.
>   reiser4: block_alloc: add a "min_len" parameter to reiser4_blocknr_hint=
 to limit allocated extent length from below.
>   reiser4: batch discard support: honor minimal extent length passed from=
 the userspace.
>=20
>  [...]

This is a diff between v4 and v5, for ease of reviewing.

diff --git a/fs/reiser4/plugin/file_ops.c b/fs/reiser4/plugin/file_ops.c
index 7686406..5f0d374 100644
--- a/fs/reiser4/plugin/file_ops.c
+++ b/fs/reiser4/plugin/file_ops.c
@@ -161,7 +161,7 @@ long reiser4_ioctl_dir_common(struct file *file, unsign=
ed int cmd, unsigned long
 	}
=20
 	default:
-		ret =3D RETERR(-ENOSYS);
+		ret =3D RETERR(-ENOTTY);
 		break;
 	}

--=20
Ivan Shapovalov / intelfx /


--=-yVJUvfMiFcLWED4XIu3/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlTdxmMACgkQxUKljSIMAnDwNwEAga1B7kB7nwQ83JNn/0GEX9Bi
pEa7Hs2nTymgfqhIxUgBAKweedz0wVndjHIioavMocYzqMeOsmLQ1DFg0wovea2M
=INd0
-----END PGP SIGNATURE-----

--=-yVJUvfMiFcLWED4XIu3/--

