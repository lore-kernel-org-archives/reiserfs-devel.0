From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH] reiser4: precise discard - general case
Date: Tue, 10 Feb 2015 23:42:24 +0300
Message-ID: <1423600944.24885.9.camel@gmail.com>
References: <5495DB0D.1080005@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-GrMXBfdhRzrCkfKgt2I3"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=NTte4KNMOE+8s5aNg/CEH18kfyy58NSydDKwCdx+lpM=;
        b=c/RfJfE7vcVUQ7NCtzWLXYjgk7cLSWBX/3lTUKEO2wh0hEwegESxMY9BLR4rStccqv
         c1ZaWonAAvGjMgZjLfDHORvyP1ARrUNRKHNSPNGzwieOOb8G5rbSevmcK2oj4CWXwOF0
         uGpZTiJ5D2eMMoAWrmCHfeC5LG2TRRr7GLH8z6OyuegiyBGpap2gyD3St2V1cOkHTgwf
         RfFetEYMU/YDMftJSsSndQseC8xZdlgnQeh/nUvxCOiM4yKU2n7bkstb9/JqpWDJUErJ
         oAJR+eoqj+xR53K72AOp58W8+/14eIA8E3ECIkL5W84e6CKrorgCxu6F/OpFg7+u8VQP
         eLsA==
In-Reply-To: <5495DB0D.1080005@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--=-GrMXBfdhRzrCkfKgt2I3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2014-12-20 at 21:24 +0100, Edward Shishkin wrote:
> This is the promised generalization, which is supposed to work for all=
=20
> discard
> offsets and all discard unit sizes without any restrictions.
>=20
> Complications in comparison with the previous implementation:
>=20
> In this general case we need "precise" coordinates, where every=20
> individual byte
> can be addressed. All local variables, which represent precise=20
> coordinates are
> denoted with "prefixes" (a_len, d_off, p_tailp, etc). Local variables,=
=20
> which represent
> "non-precise" coordinates (they are usually of type reiser4_block_nr)=20
> are denoted
> without prefixes (start, len, end, tailp, etc).
>=20
> Blocks, which contain head and tail paddings are now calculated using the
> function size_in_blocks(), which actually is an expression for the=20
> minimal number
> of blocks containing the precise extent.
>=20
> The next trouble is "peculiarity in 0", encountered when calculating the=
=20
> blocks of
> head padding. if discard offset is different from 0, then the first=20
> discard unit of the
> partition is partial (its other part doesn't belong to our partition, so=
=20
> we can not
> discard it). We handle this peculiarity by an additional check.
>=20
> In other bits everything is the same.
>=20
> Possible optimization: If discard unit sizes are always powers of 2,=20
> then it makes
> sense to replace "do_div(offset, unit_size)" with "offset & (unit_size -=
=20
> 1)".
>=20
> Mount options discard.offset=3Dxxx,discard.unit=3Dyyy are to emulate vari=
ous
> discard unit sizes and offsets on devices _without_ trim support (e.g.=
=20
> HDDs).
> This is only for debugging purposes, don't use it for real SSD devices:=
=20
> the kernel
> retrieves the discard parameters on its own.
>=20
> This patch is against the patch series of Ivan Shapovalov:
> http://marc.info/?l=3Dreiserfs-devel&m=3D141841865432082&w=3D2
>=20
> Current status: not well-tested.
>=20
> Edward.

Hi,

I've found a bug in our implementation (don't know when it appeared,
maybe it was quite some time ago). I've intended to fix it and send
a patch along with description, but I still can't think of a viable fix.

So: the problem is that check_free_blocks() isn't idempotent, because it
allocates blocks if the whole extent is clean. Therefore, it must not be
called for overlapping ranges. However, in some conditions tail padding
of some extent and head padding of next extent may overlap in terms of
disk blocks (gluing code only catches overlapping erase units).

This will yield a false negative when checking the head padding, so it
does not lead to any data losses (just to inefficiency).

Comments appreciated...

Thanks,
--=20
Ivan Shapovalov / intelfx /

--=-GrMXBfdhRzrCkfKgt2I3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlTabTAACgkQxUKljSIMAnBPjgEA4fbt/mD5KbwTU8Lakh5Xsdd9
c2x5/pOcBsTTsV4wcyoBAOQoR4NoUIP8DYK+Sdr4N5Y/P6IaUo5jLKBp4b++fnpp
=MQE0
-----END PGP SIGNATURE-----

--=-GrMXBfdhRzrCkfKgt2I3--

