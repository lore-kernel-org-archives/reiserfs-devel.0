From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH] reiser4: implement ->rename2() of struct
 inode_operations.
Date: Fri, 27 Feb 2015 20:42:35 +0300
Message-ID: <1425058955.17105.2.camel@gmail.com>
References: <1424992884-29692-1-git-send-email-intelfx100@gmail.com>
	 <54F05BB5.5030104@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-20NXfxosjWiqguG1uKtP"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=XN0BvYmBs8Ts6SBCx1gXd5WUk6ZDL0kZQgrQ+igyYvQ=;
        b=rFI+SyhdJahkPDbQDzCaMseyrrca7DEHD3wNHjpjRZ/It3n8hYuz4hkBCSgtrXw5EG
         /YRXNxv8TS+GpYQucC8bGTK5vIIMZtR11USjVmA6Ytp9/ef/iBMNaEJ/SRfbgXDNyipO
         uFS4Q8t/iNWNHZvkKVny0wP32+eVsikPxwK/vs7JPXkyFo3wB2bqKv+DfJ2XyTUg10/C
         jI8+dRryF7cPXK/UQcWlfrTlmLiE98eJ0gMnSQUG22SpdsdEOu8z6xKQjXytZf8aAEcA
         rX/AqvTX3ybrhxYrzLXN4PixQvwwU6N/L1g65jXjfeN9PtOQpP6CeY/lVg8CsEgUe6wE
         24Eg==
In-Reply-To: <54F05BB5.5030104@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--=-20NXfxosjWiqguG1uKtP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-02-27 at 12:57 +0100, Edward Shishkin wrote:
> On 02/27/2015 12:21 AM, Ivan Shapovalov wrote:
> > For now, only support the basic case of flags =3D=3D 0.
> > Also support the case of flags =3D=3D RENAME_NOREPLACE, because it is a=
 no-op for
> > local filesystems (destination existence is already checked by VFS).
>=20
> Great,
> Thanks!
>=20
> > Thus no functional changes to the existing code.
> >
> > Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> > ---
> >
> > Could you please estimate whether it would be hard to also implement th=
e
> > RENAME_EXCHANGE flag?
>=20
> Why do we need this?

For no particular reason.
Supporting an interface is better than not supporting it (if it comes at
no expense to existing workloads), isn't it? ;)

That said, if you have better ideas for junior jobs, then I'm all ears.

Thanks,
--=20
Ivan Shapovalov / intelfx /

--=-20NXfxosjWiqguG1uKtP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlTwrI4ACgkQxUKljSIMAnAHBgD/e6RUL/4mbX0N7shX+zRzClx7
Tqc5K9yRnbgULc85IRcBAIVK1Ddv5n+yugnx4wmL4vGf+KsFz4efzlAeL/D3N99F
=HObx
-----END PGP SIGNATURE-----

--=-20NXfxosjWiqguG1uKtP--

