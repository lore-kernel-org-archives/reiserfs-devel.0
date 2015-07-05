From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Sun, 05 Jul 2015 18:13:26 +0300
Message-ID: <1436109206.6440.12.camel@gmail.com>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>
	 <1435648387.15634.3.camel@gmail.com> <559245B3.1020804@gmail.com>
	 <1435651611.15634.12.camel@gmail.com> <55925A3C.6000604@gmail.com>
	 <1435793708.3758.14.camel@gmail.com> <559790E1.2020009@gmail.com>
	 <1436032389.25552.6.camel@gmail.com> <559826F3.9010201@gmail.com>
	 <1436101712.6440.3.camel@gmail.com>
	 <CADW=+3=J7Rt1yxtTfW=ZCLC40-D1FPCFR7KGSyp_YLgcRcH3FQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-RHdo/lUEW4pcR1wMiNNm"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=NUywPmyBUcyRYXtdgRU+KzE5KgMIqjxJwkZtENmZUdA=;
        b=dO0h8MuTAvBq1JJGPOIoBiZZCUxGxaMzuPSw2wu4Ew1FTIn6H9HmPfN0k/wwwky883
         pmYFgQ8dCYcdXz8I1lwErmmn20/SPxtbJ9EfsucwvYfLixkmTg36EDOlXOTO9JxzFQxe
         nvpMmdC0TcC5GvBpzB9kankrvowWHuwxHGyfy1d4EEI5Tfsq/1GpGXLwv9hlV7A3Z/ev
         Lci6/Cl9r40efTv8Zscww9qqMZU/gxfzxo1i053YGSOl6p0C8Q3VFPsHDqmzwsEDpyRx
         2xlV072NAZskEqIYnifVTaxq5X7x7U/gs4ZPQJRN9lu7EdpL0/aM5loSXr2RlcLAlMTR
         aIwg==
In-Reply-To: <CADW=+3=J7Rt1yxtTfW=ZCLC40-D1FPCFR7KGSyp_YLgcRcH3FQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: =?UTF-8?Q?Du=C5=A1an_=C4=8Coli=C4=87?= <dusanc@gmail.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>


--=-RHdo/lUEW4pcR1wMiNNm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-07-05 at 16:06 +0200, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> On 5 Jul 2015 15:12, "Ivan Shapovalov" <intelfx100@gmail.com> wrote:
> >=20
> > On 2015-07-05 at 02:33 +0800, Edward Shishkin wrote:
> > > On 07/05/2015 01:53 AM, Ivan Shapovalov wrote:

> > > > On 2015-07-04 at 15:53 +0800, Edward Shishkin wrote:
> > > > >=20
> > > > > [...]
> > > > > And how to test directly at mount time?
> > > > Something along the lines of
> > > > - allocate 1 MiB of contiguous space
> > > > - fill it with non-zeros
> > > > - for N =3D 1, 2, 4, ...:
> > > >    - discard N sectors from the contiguous space
> > > >    - check if anything in the discarded space became zero
> > > > -filled
> > > >    - if it did, infer alignnment from the first zero-filled=20
> > > > block,
> > > >      infer granularity from the zero-filled region size.
> > >=20
> > >=20
> > > mkfs seems to be more suitable for this funny business
> >=20
> > Yeah, sure. So... new superblock format with two extra fields?
> >=20
> But what happens when someone makes an image of whole partition and=20
> uses it
> on new different ssd?

Maybe we can make a tunefs.reiser4 (just) for that purpose.

--=20
Ivan Shapovalov / intelfx /

--=-RHdo/lUEW4pcR1wMiNNm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlWZSZYACgkQxUKljSIMAnBHhgD+P7bLwtvr7Q8H3x1+zKGMIevK
jNMNmrUX9kqr4tNUzM8BAOenR4RQ6X4Jo0R/HwvZRH7ZJQYWWhxxer/msjJCA3d8
=V3Zd
-----END PGP SIGNATURE-----

--=-RHdo/lUEW4pcR1wMiNNm--

