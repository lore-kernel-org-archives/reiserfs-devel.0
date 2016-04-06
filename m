From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: [PATCH] reiser4: port for Linux-4.5
Date: Wed, 06 Apr 2016 03:42:45 +0300
Message-ID: <1459903365.31752.2.camel@intelfx.name>
References: <56FB9A57.3040906@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-I0CK6eBaEnJzyS8N4s+S"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=an7/SmXZcNfhpT6W5OKDZxyArldUogfvkfuJUcvB/Rk=;
        b=hvmrIoiHoMGoiJYZZeUahh0YvMS/+oM+isOUYrJ7wiJP5nkXXp2pBLw+SexQovELRQ
         dK6dIYpwYsY7qDr2FGKHTGZXeNMSE5a0pyc1Nqu48v9RdrLhLuQorkCM/l2hBNK/OyAi
         DhIWMETIqraNWo+W9g7fzLcgl8gCu0jna9nbg=
In-Reply-To: <56FB9A57.3040906@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>


--=-I0CK6eBaEnJzyS8N4s+S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-03-30 at 11:20 +0200, Edward Shishkin wrote:
> . Adjust for the new ->get_link() of vfs's inode_operations: we don't
> =C2=A0=C2=A0=C2=A0support RCU mode;
> . check returned value of __copy_from_user() to make gcc happy
> =C2=A0=C2=A0=C2=A0(the path is never invoked) in create_item_node40().
>=20
> Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

Hi Edward,

could you please send a separate patch with adjustments for 4.4?

Thanks,
--=20
Ivan Shapovalov / intelfx /
--=-I0CK6eBaEnJzyS8N4s+S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXBFuFAAoJEHveF8jk4w6dtBYQAKO1ZZKJGCS4qbxWIMGABExr
PAwwVBmPwFsuNraAbMC2rHZLmIP5fYDLJWjfu2uCeuhaZ1Npx2H0Mpi52YhEka2V
17sk8+cPE8s81b7l3HrQFafcSfWqW0wmLagiHGtnwmJVyKs72yWhJONdOqD0JJx/
788r6RrO7JJxyoJmjWXHxbUT9HIaMdBdZzruUNbWajkayg8g8b1Hube+1eT8aDIk
pxwZC++dKzWzMVyPUUxVuTSsZW01Rskuf08pVJOrsWuy49GIosLmXJzC/7DE3jW6
w5HDRP2dAD15cZwOLUk5dBmLJndBNaegOhXS7cV4Envp6aCn8JJUVvREiKqD681t
JY2ZxGFDG4qzBdqKCyie0VD4Cgq0T4R0ftYC0znsFQYqJSBW1s+kqsaEcCFN1IlA
+8JX1krn86isBjRkQxgEAQ9Evv6NVaCxAsiB1TshfbNPkFWGv3xPQkseRov2y/tf
j0LavQQNeSgS+QkK/L9oBBl/ifB6A7Tgbx40D0MtHgPiHSQ4ONa8PhmbCxcbI84V
g3d4ckb2jlIZ7cKHyGt1+7V9AgsUMHk14jdUTmoLATAt5sSzBKAZyx6Gx3s0RUKT
5gFS+qPAzmJqjCuXbOg7WCMlYwXDkwKW+3i/DT0nCNSBjeFaYxI7pJlJHUQhxzQb
6eLelkwV8OodlX8U0soH
=7GMw
-----END PGP SIGNATURE-----

--=-I0CK6eBaEnJzyS8N4s+S--

