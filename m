From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Sat, 04 Jul 2015 21:06:29 +0300
Message-ID: <1436033189.3178.0.camel@gmail.com>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>
	 <1435648387.15634.3.camel@gmail.com> <559245B3.1020804@gmail.com>
	 <1435651611.15634.12.camel@gmail.com> <55925A3C.6000604@gmail.com>
	 <1435793708.3758.14.camel@gmail.com> <559790E1.2020009@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-P5iJkXtZN7tSzwMmw9Np"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:date:in-reply-to:references:content-type
         :mime-version;
        bh=Y1//NQJ1aLZR/q3/mySWdis8Y1iXLGQwjPf/KxBL0NU=;
        b=p/UNd+uJbe50pmsmN7IvCVw4rg6jdeRSJp4MP2YKx2B/XqxWRxh2MNk/OEiE5wMiMi
         SBnPscpERswKSlVSNkF2C7RWmXhVu6uku3eswt9unQk9X/hj+3O4JoizKA2EmBgT+yB8
         j85M2xOMbx5CCdvqS4Co5cNxNbrPnTXD05gCgQY0jTBAffkhQvQYGHrQv3LpK0D1CZt3
         NmPugv2tuP0g9lHdDO2J0nU2x5MBWxl1jVP/TVX1g4K1O9T7VK/GE9UQpfjLy2y11Pn5
         hoFbxfyiy+gI1PoFmQXNPi48Tdb46pKrN4IYpx6W18PjROOy1qdBj4udYAAXbtHcMY3l
         h1TA==
In-Reply-To: <559790E1.2020009@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--=-P5iJkXtZN7tSzwMmw9Np
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-07-04 at 15:53 +0800, Edward Shishkin wrote:
>=20
> On 07/02/2015 07:35 AM, Ivan Shapovalov wrote:
> > On 2015-06-30 at 10:58 +0200, Edward Shishkin wrote:
> > > [...]
> > > BTW, we need to do something with the "precise discard=20
> > > extension":
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

--=-P5iJkXtZN7tSzwMmw9Np
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlWYIKUACgkQxUKljSIMAnAeCgEAmJuqeFw2KW9L1wruTDEL9J14
Ye+2DVsunbZojad5aGoA/2srL0nDIH76TKHTjraNM7ps8hUEyTkLaJ9WKs5lqCQ4
=yXEN
-----END PGP SIGNATURE-----

--=-P5iJkXtZN7tSzwMmw9Np--

