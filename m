From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: How do you apply these patches  to kernel source code
Date: Mon, 12 May 2014 16:00:06 +0400
Message-ID: <2349093.Mttj53d3Ki@intelfx-laptop>
References: <1f2566482eb2fb37209738f0d84467b1@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2727742.tJyfIlR2gm"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=r82K2T3D38y1WKgDseLrr1235Pf1HexWy16WcOv9XgA=;
        b=N/lRE4UQveVBM6dEeeZglH27s2XrSVjJe0Awer74wdC3FtbA5oxxJmgds+8yuq7NrG
         cjlrrktfFSAEcOpVfuas8TV9g5xUx876Fgd3zYJc/8GU96YAvg1XKR4onTioCv9U9NAN
         4PQQXgUHfGv7gEFZy+tsr9otjGpeK1JMD9hRTsloIJDnUg2chGPqU/nhWQqNq0TMgguq
         bjTmuKyTC23wvaDz/EZ7up70msVeHHM+fy0kZCY08SrM9xpQaLJ/hwwZZEOky3Tdr3Ee
         qEMu5fqBmn9eJA1kuvynU0F9Ixp2gYCVV4yfoKtFxS5dxRym5WJSb6ifkhZ0ZX7S+Jhp
         8LeQ==
In-Reply-To: <1f2566482eb2fb37209738f0d84467b1@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org


--nextPart2727742.tJyfIlR2gm
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 12 May 2014 at 20:52:27, doiggl@velocitynet.com.au wrote:=09
> Hello,
> How do you apply these patches [1] to kernel source code ?.
> So far I have applied this patch [2] to the kernel source code.
>=20
> Do I save each as a txt .patch file and apply with command
> # patch < patch.file
>=20
> I using linux-3.14.tar.xz
> --Thanks Glenn
>=20
>=20
> [1]
> [PATCHv3 1/5] reiser4: discard support: make space_allocator's
> check_blocks()
> .
> .
> [PATCHv3 5/5] reiser4: discard support: downgrade all reiser4_log() t=
o
> reiser4_debug().
>=20
> http://www.spinics.net/lists/reiserfs-devel/msg03886.html
>=20
> [2]
> reiser4-for-3.14.1.patch
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

These git-formatted patches (1) are saved to text files "as is" (as in=20=

mailbox) and then applied using
`patch -p1 -i $patch`
or
`patch -p1 < $patch`
on top of a source tree with reiser4 (2) itself already applied.

Actually, if you have a git tree, you can also do
`cat $all_patches | git am`
on top of that tree. This will keep commit metadata, applying each patc=
h as a=20
separate commit.

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart2727742.tJyfIlR2gm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EABEIAAYFAlNwt8sACgkQxUKljSIMAnCYAgEA1dCKgx8IpQxhVlBIjM3f4sxK
7ZBKh2Mb51xaIuFM08QA/AhgLHrpX0qEPo3YiQ5No1WNZUwJnKcs+jmtQh7WstQf
=spgi
-----END PGP SIGNATURE-----

--nextPart2727742.tJyfIlR2gm--

