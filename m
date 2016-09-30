From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: [PATCH] Adjust reiser4 for 3.15: replace
 truncate_inode_pages(..., 0) with truncate_inode_pages_final(...).
Date: Fri, 30 Sep 2016 09:47:05 +0300
Message-ID: <1475218025.19471.1.camel@intelfx.name>
References: <20160930063629.13794-1-intelfx@intelfx.name>
         <20160930064332.19365-1-intelfx@intelfx.name>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-xIYsYNA/f4gPlqA0Q72K"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:references
         :mime-version;
        bh=cVEirczXWHNHu8ccTy2l67FJWnDqJ0PIKM4qKn8lsE0=;
        b=f+GhgmALy73tIpYY1hDagMVz1YB++Sh6V1IcdAnYGpcRo3DTl64nyXYu9vfBrwNp/5
         p6eUyMPaBC8nvmGGIftB56r0XkoySR9N/diyAa2iHOkapSnprl/BrDz16STH9mAu/ywJ
         /awzG2B/PH98gMsbCs5J/9J5shrAdeYb9vNW4=
In-Reply-To: <20160930064332.19365-1-intelfx@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--=-xIYsYNA/f4gPlqA0Q72K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-09-30 at 09:43 +0300, Ivan Shapovalov wrote:
> Upstream commit 91b0abe36a7b2b3b02d7500925a5f8455334f0e5
> "mm + fs: store shadow entries in page cache".
>=20
> Moreover, the truncate_inode_pages(..., 0) in
> delete_object_cryptcompress()
> is not needed at all.
>=20
> Signed-off-by: Ivan Shapovalov <intelfx@intelfx.name>
> ---
> =C2=A0plugin/file/cryptcompress.c | 2 --
> =C2=A0super_ops.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 2 +-
> =C2=A02 files changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/plugin/file/cryptcompress.c
> b/plugin/file/cryptcompress.c
> index 59d8df8..5433de9 100644
> --- a/plugin/file/cryptcompress.c
> +++ b/plugin/file/cryptcompress.c
> @@ -3595,8 +3595,6 @@ int delete_object_cryptcompress(struct inode
> *inode)
> =C2=A0			(unsigned long long)get_inode_oid(inode),
> =C2=A0			result);
> =C2=A0	}
> -	truncate_inode_pages(inode->i_mapping, 0);
> -	assert("edward-1487", pages_truncate_ok(inode, 0));
> =C2=A0	/* and remove stat data */
> =C2=A0	return reiser4_delete_object_common(inode);
> =C2=A0}
> diff --git a/super_ops.c b/super_ops.c
> index 73c18f2..697580c 100644
> --- a/super_ops.c
> +++ b/super_ops.c
> @@ -215,7 +215,7 @@ static void reiser4_evict_inode(struct inode
> *inode)
> =C2=A0			fplug->delete_object(inode);
> =C2=A0	}
> =C2=A0
> -	truncate_inode_pages(&inode->i_data, 0);
> +	truncate_inode_pages_final(&inode->i_data);
> =C2=A0	inode->i_blocks =3D 0;
> =C2=A0	clear_inode(inode);
> =C2=A0	reiser4_exit_context(ctx);

BTW, this raises a question: in the ->evict_inode path, are we ever
allowed to call plain truncate_inode_pages() (i. e. not *_final())?

The ->delete_object plugin methods do this as part of their logic,
actually. At least the cryptcompress plugin calls
truncate_inode_pages(..., new_size) at the end of
prune_cryptcompress(), however I suspect that the regular file plugin
also does this deep inside reiser4's guts.

--=C2=A0
Ivan Shapovalov / intelfx /
--=-xIYsYNA/f4gPlqA0Q72K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJX7gppAAoJEHveF8jk4w6dvJIP/3QbVx9Pp2qxUzJIs6N0fTFd
f5Z04bnr7w50VB8Rg4YTGhNTgR3BumKcSkXEwFKBQBT1GUxkMvvI1BoSmWs58bIA
jl+HMnrozHfsImzgH9unKCfbanoxxmM0ja/uRFPE+w6Vf5k50iyGQRMr3WZJ6mDe
CicCD0pglW/3uyvD/NAWKOTZSc80rEH8fNk5atfmYaADayedwxls+bup9JsDwOit
Eb9nsEV8Qm7kuzp4yGW8FmRqI2kLx0BWCggq/ppbqI+HopP1MjYDzosvp/c9GrkL
Wjrhrr38Hy73pSonZ6svWjTtpSMtQGyU9dfaD47qXV17jFp/76eJIW9Cr3DawcaC
4xDmswICxn/pMafNDaE8eDvAe1k4iI9nVg4vGCLfbiHm+GlEIDL2gtt9AXVE+PBP
kuqIGo0yKFooGiy6WuJUCMVFnv1h5nPlKlBN/jDOZ18FvGOBotQ+VnCnb3igRngh
mdxeqeGSE8UXe4O72uZpjUg/y2wxXnGOiQfx2rVnlD4w2D3ss0+j2oSu+Gg0/N9m
0QparNAUIm+xIDpZc6W56ljLguIFqj/K52gyXF/WPCJoqnK5SK21ZbOHAZazInB7
OdBXLWch7UNDgom6Mt561Kc+4N7pV3vBqc8O1Tc8VL9AwJ4I0KvyYKCt/JonKM9C
CoVT6TQRHf/cLxA3N/jw
=mHVH
-----END PGP SIGNATURE-----

--=-xIYsYNA/f4gPlqA0Q72K--

