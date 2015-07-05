From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Sun, 05 Jul 2015 18:11:48 +0300
Message-ID: <1436109108.6440.10.camel@gmail.com>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>
			 <1435648387.15634.3.camel@gmail.com> <559245B3.1020804@gmail.com>
			 <1435651611.15634.12.camel@gmail.com> <55925A3C.6000604@gmail.com>
			 <1435793708.3758.14.camel@gmail.com> <559790E1.2020009@gmail.com>
		 <1436032389.25552.6.camel@gmail.com> <559826F3.9010201@gmail.com>
	 <1436101712.6440.3.camel@gmail.com> <5599353F.3090005@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-noaY4efPC77fen6ifJ8K"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:date:in-reply-to:references:content-type
         :mime-version;
        bh=1nWU9OkzdVxgyTcKHrwWoJCOxuCk5AltkxThYrR7+cw=;
        b=ccVAZcNfer0jPz1x5AturwASwuCN4KionLzqEOmaA1ey4lVsTclaqtwRUV3lAd7FC0
         iErVxADULslQOWne9lJ/3sB4ASfsr8aHcTyYMSh0f8SAGidOTJAvVGmi40A5nWGtw+K5
         KhR3sSCQAVmF4u8eiBM564YfNxAGXg5EoyUZEYnx7eBn7r+gj4H8+cfyxP3eY9+9NSPl
         440qqW8XkjyQU1zhcqX3JfVhkcJwgIZ1nNK8qEt5uYTmi9+xlBUO2QjPRTcH3b7x3RfM
         Xns+WTAAKNGdWwOK6EXQX5VzNJ7uaYe8QrAJXD2M/ZpMacU8fRUs4uBnkuvjr34HwQJr
         T+Yw==
In-Reply-To: <5599353F.3090005@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--=-noaY4efPC77fen6ifJ8K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-07-05 at 21:46 +0800, Edward Shishkin wrote:
>=20
> On 07/05/2015 09:08 PM, Ivan Shapovalov wrote:
> > On 2015-07-05 at 02:33 +0800, Edward Shishkin wrote:
> > > On 07/05/2015 01:53 AM, Ivan Shapovalov wrote:
> > > > On 2015-07-04 at 15:53 +0800, Edward Shishkin wrote:
> > > > > [...]
> > > > > And how to test directly at mount time?
> > > > Something along the lines of
> > > > - allocate 1 MiB of contiguous space
> > > > - fill it with non-zeros
> > > > - for N =3D 1, 2, 4, ...:
> > > >     - discard N sectors from the contiguous space
> > > >     - check if anything in the discarded space became zero
> > > > -filled
> > > >     - if it did, infer alignnment from the first zero-filled=20
> > > > block,
> > > >       infer granularity from the zero-filled region size.
> > >=20
> > > mkfs seems to be more suitable for this funny business
> > Yeah, sure. So... new superblock format with two extra fields?
>=20
>=20
> The change will be forward and backward compatible, so there is no
> need in a new format. Just add two new fields to the superblock40.

So there will be zeroes in case we mount a non-aware filesystem,
correct?

>=20
> Also people will want to "mount -o discard" when discard parameters
> are not known. In this case I think to provide them=20
> discard_extents().
> which is currently merged. Otherwise use discard_precise_extents().

Yeah.=20
I'll do something with this after I finish porting ->write()
to ->write_iter() (or if I run into heavy problems with that).

Thanks,
--=20
Ivan Shapovalov / intelfx /

--=-noaY4efPC77fen6ifJ8K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlWZSTUACgkQxUKljSIMAnBQdQEAlWC5fXzhB4FKxbWSawyeqNSx
DNqcJ5e/eZaaHcqhtA4BAM/qAFCgHo2zuQLLaDprdUT+4myfvxepKn1H8BeIc4Af
=wZvn
-----END PGP SIGNATURE-----

--=-noaY4efPC77fen6ifJ8K--

