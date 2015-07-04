From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Sat, 04 Jul 2015 20:53:09 +0300
Message-ID: <1436032389.25552.6.camel@gmail.com>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>
	 <1435648387.15634.3.camel@gmail.com> <559245B3.1020804@gmail.com>
	 <1435651611.15634.12.camel@gmail.com> <55925A3C.6000604@gmail.com>
	 <1435793708.3758.14.camel@gmail.com> <559790E1.2020009@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-l1uuwlVUfrL9Qzhc+cnP"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:date:in-reply-to:references:content-type
         :mime-version;
        bh=Zg2PvRIBiTtXhNZ12KsnHBK2kfDNXCEkgWC12PG4KTU=;
        b=jwrmnDIv4dSNXdN6JyazUfI/YHczwxP04HLPPoItsMkKlnlfxoyt+PMlNNn+Wdl7Lk
         QGLdkWIKlBMKP6Z8ZOdlub4FYzCj8jga9ttAiBmdWQlEezWtvx84ys2zKM0pQTSDXzBp
         yGt8Dni6pu09FT0W0gTiE8b1RR5Uut4BzlAsjHrdLai6u3588bvw2OszAlBxD14hoZas
         9lXb6p2EYbymRQv7F3R0pPuCPXf/uyuledZZX84miADUGLhx0mTB2/9o5t8CTxUp+RGf
         Z91MLbvxiq4lnj7F52WNIXWzfl/2OLMNvlkp/jxzn2fjSJgIxzygv3D5ewtjvc3WLHFl
         J1Uw==
In-Reply-To: <559790E1.2020009@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--=-l1uuwlVUfrL9Qzhc+cnP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-07-04 at 15:53 +0800, Edward Shishkin wrote:
>=20
> On 07/02/2015 07:35 AM, Ivan Shapovalov wrote:
> > On 2015-06-30 at 10:58 +0200, Edward Shishkin wrote:
> > > [...]
> > > BTW, we need to do something with the "precise discard > > > extensio=
n":
> > > http://sourceforge.net/projects/reiser4/files/patches/
> > > It reports erase unit 512 bytes for my samsung SSD 840 EVO.
> > > You said that this is incorrect. If so, then how to retrieve=20
> > > correct
> > > discard parameters?
> > I was wrong about usage of `hdparm -I`. The "limit" it says about
> > is in fact "how many 512-byte blocks worth of LBA ranges can be=20
> > given
> > to the drive in a single ATA trim command"[1].
> >=20
> > In fact, the standard (referenced below) doesn't seem to contain
> > any references to the trim granularity, let alone to define any=20
> > means
> > to query it.
> >=20
> > So, I guess, the kernel will never tell us correct values for ATA=20
> > SSDs,
> > and the only option is direct testing at mount time.
>=20
>=20
> And how to test directly at mount time?

Something along the lines of
- allocate 1 MiB of contiguous space
- fill it with non-zeros
- for N =3D 1, 2, 4, ...:
  - discard N sectors from the contiguous space
  - check if anything in the discarded space became zero-filled
  - if it did, infer alignnment from the first zero-filled block,
    infer granularity from the zero-filled region size.

> It seems that nobody cares about it..

It's just ATA interface does not provide necessary data.

--=20
Ivan Shapovalov / intelfx /

--=-l1uuwlVUfrL9Qzhc+cnP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlWYHYUACgkQxUKljSIMAnAYiAEAxdvn8cqgu4JbkeTU1zsmEDgc
n2zdzrViNXfHHQseEWsA/A7MmR8cyqm/9q8i8frlNyryONhBqpqjal3yt+UHiBef
=aUv1
-----END PGP SIGNATURE-----

--=-l1uuwlVUfrL9Qzhc+cnP--

