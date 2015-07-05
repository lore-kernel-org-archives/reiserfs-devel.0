From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Sun, 05 Jul 2015 16:08:32 +0300
Message-ID: <1436101712.6440.3.camel@gmail.com>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>
		 <1435648387.15634.3.camel@gmail.com> <559245B3.1020804@gmail.com>
		 <1435651611.15634.12.camel@gmail.com> <55925A3C.6000604@gmail.com>
		 <1435793708.3758.14.camel@gmail.com> <559790E1.2020009@gmail.com>
	 <1436032389.25552.6.camel@gmail.com> <559826F3.9010201@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-0QLAfFsNYRJFgLdRLT1U"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:date:in-reply-to:references:content-type
         :mime-version;
        bh=jRQKPDQKXCCuJ+hV8vOXq73+lahtcHUBvNv6kskPvbc=;
        b=NgCeFRSc51EvbvGAMrdn4z1DugdAHSFJVlIa1z9Nw5akOBUUD48GrlbsiqF5fTegiW
         CTvcRCYBqa7mbJnJH3RloQRXBdrngsrZpytvP5IYkwfJ2PE5Y5ziIJ8SQThaaCHWM+be
         Z+jzjiVrVObMF77M+CKANQAKXfuqoHoiQH7lopGraJyFOA5kg/jhWwpwEtHmpof4weYI
         24T55Zwp9lWSNFoUwg3u9/cLplSYxY/IXL5hyvJQzFZQSRGF88qkArWwS1VTKIFF5N9/
         fWJXFRBvBP/kBvt6Ic5lGk4pyq5FhVg81PhOxvgs5VLfVcNFGDRkA/yO7sFNEBaXlZI9
         OFMg==
In-Reply-To: <559826F3.9010201@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--=-0QLAfFsNYRJFgLdRLT1U
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-07-05 at 02:33 +0800, Edward Shishkin wrote:
> On 07/05/2015 01:53 AM, Ivan Shapovalov wrote:
> > On 2015-07-04 at 15:53 +0800, Edward Shishkin wrote:
> > >=20
> > > [...]
> > > And how to test directly at mount time?
> > Something along the lines of
> > - allocate 1 MiB of contiguous space
> > - fill it with non-zeros
> > - for N =3D 1, 2, 4, ...:
> >    - discard N sectors from the contiguous space
> >    - check if anything in the discarded space became zero-filled
> >    - if it did, infer alignnment from the first zero-filled block,
> >      infer granularity from the zero-filled region size.
>=20
>=20
> mkfs seems to be more suitable for this funny business

Yeah, sure. So... new superblock format with two extra fields?

>=20
>=20
> > > It seems that nobody cares about it..
> > It's just ATA interface does not provide necessary data.
>=20
>=20
> OK, so our precise discard extension is waiting for the
> best times..
I hope we'll be able to merge it eventually (esp. the final patch which
accounts for non-idempotence of check-and-allocate-blocks).

Thanks,
--=20
Ivan Shapovalov / intelfx /

--=-0QLAfFsNYRJFgLdRLT1U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlWZLFAACgkQxUKljSIMAnDbdgD9Fr3CEcooAxXYxI7tTnpqkrby
dOe7yW1FlpswUOZRZUkA/3FRrkZyYyrEmU91KqYaxVyvB1OmCSExnAL8FI3bDqn6
=fpvU
-----END PGP SIGNATURE-----

--=-0QLAfFsNYRJFgLdRLT1U--

