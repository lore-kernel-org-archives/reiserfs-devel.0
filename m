From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Wed, 06 Apr 2016 19:54:04 +0300
Message-ID: <1459961644.5177.6.camel@intelfx.name>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>
	 <1435648387.15634.3.camel@gmail.com> <559245B3.1020804@gmail.com>
	 <1435651611.15634.12.camel@gmail.com> <55925A3C.6000604@gmail.com>
	 <1435793708.3758.14.camel@gmail.com> <559790E1.2020009@gmail.com>
	 <1436032389.25552.6.camel@gmail.com> <559826F3.9010201@gmail.com>
	 <1436101712.6440.3.camel@gmail.com>
	 <CADW=+3=J7Rt1yxtTfW=ZCLC40-D1FPCFR7KGSyp_YLgcRcH3FQ@mail.gmail.com>
	 <1436109206.6440.12.camel@gmail.com> <56BA2793.7090906@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-1wHIWPgDUMnG6xWiuLpu"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:references
         :mime-version;
        bh=W5Q7AmdBpeP+sqHKgvWiJIeL7EInl6pwpCUwiCslumI=;
        b=aoLroRq7rCGmqui1QCIMRVdWCLJ9spaRC97UcoPVzeOOgGzcG9vNHlNqGpe+H2nne7
         FVxTNxQacQLDSVRfd5Q3x/mPbPmsIBJFqr5dF4sGn28/rxxVmYNUs9ohAhniyYB8xW9H
         VGOy/n/LeOfOzkniHp4jSrCxPkF2enzGqIcp4=
In-Reply-To: <56BA2793.7090906@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, =?UTF-8?Q?Du=C5=A1an_=C4=8Coli=C4=87?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>


--=-1wHIWPgDUMnG6xWiuLpu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-02-09 at 18:53 +0100, Edward Shishkin wrote:
> Hi all,
>=20
> There is a pending patch for precise discarsd, which I can not merge
> because it is incomplete. Just want to know, is there any progress on
> this?
>=20
> So we found that calculating discard params by mkfs and storing
> them in superblock is a dirty option, so I suggest to reserve a
> contiguous area (1 MiB?) on disk at "mkfs -d" time (just mark it busy
> in the bitmap). And calculate erase unit size and offset at mount
> time.
> If calculation failed for some reasons, then use non-precise discard.
>=20
> So, I think, we'll need one d32 field in disk superblock, which
> indicates
> number of reserved blocks (0 means no reservation) and a pair of
> definitions in disk_format40.h:
>=20
> #define FORMAT40_FIRST_RESERVED_FOR_PROBING \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0((REISER4_MASTER_OFFSET / PAGE_=
CACHE_SIZE) + 6)
> #define FORMAT40_MAX_BLOCKS_RESERVED_FOR_PROBING
>=20
> If any questions, or technical stoppers, then let me know.
>=20
> Thanks,
> Edward.

I guess it would be nicer to allocate the needed space dynamically at
mount time. However, there is a problem: where to put the probing code
in the fill_super() (I suppose?) sequence? We want the allocator to be
intact, but nothing should be written to the filesystem so far.

--
Ivan Shapovalov / intelfx /

>=20
>=20
> On 07/05/2015 05:13 PM, Ivan Shapovalov wrote:
> >=20
> > On 2015-07-05 at 16:06 +0200, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> > >=20
> > > On 5 Jul 2015 15:12, "Ivan Shapovalov"<intelfx100@gmail.com>=C2=A0=C2=
=A0wro
> > > te:
> > > >=20
> > > > On 2015-07-05 at 02:33 +0800, Edward Shishkin wrote:
> > > > >=20
> > > > > On 07/05/2015 01:53 AM, Ivan Shapovalov wrote:
> > > > > >=20
> > > > > > On 2015-07-04 at 15:53 +0800, Edward Shishkin wrote:
> > > > > > >=20
> > > > > > > [...]
> > > > > > > And how to test directly at mount time?
> > > > > > Something along the lines of
> > > > > > - allocate 1 MiB of contiguous space
> > > > > > - fill it with non-zeros
> > > > > > - for N =3D 1, 2, 4, ...:
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0- discard N sectors from the contiguous=
 space
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0- check if anything in the discarded sp=
ace became zero
> > > > > > -filled
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0- if it did, infer alignnment from the =
first zero-
> > > > > > filled
> > > > > > block,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0infer granularity from the =
zero-filled region size.
> > > > > mkfs seems to be more suitable for this funny business
> > > > Yeah, sure. So... new superblock format with two extra fields?
> > > >=20
> > > But what happens when someone makes an image of whole partition
> > > and
> > > uses it
> > > on new different ssd?
> > Maybe we can make a tunefs.reiser4 (just) for that purpose.
--=-1wHIWPgDUMnG6xWiuLpu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXBT8sAAoJEHveF8jk4w6dHUYP/02dcexstrMY38XSgUrsXhZV
lntGo66jwAOawK3BcboVVhq3dnZr5rHMeldGspEMh7VHFrTeirn9Hh5DIRxgM7lY
NOelOtZrRR1KyiQiABXNLoaTlfbvS92UUCY0Zl2TrAxpWtLg3Iz+5dQzMpP++GYc
+/k0cNQoGKbfCHYBz5iBaeO2ht6scK3Bd/k/sryN9wE3yNmc/ttsYqJ9ayBssrz9
ujaxASfnNjAj6aEYVX1IZZ3x4IwswhVkHF8/nnNZ7YCwG8aN78hbhgOUQirOXWfi
vhvRmnLnoZ46jnkYQaVG/qqT1uKT0k37zEkdHocv40yqqpONl2aHJOnPvvfpPz4m
vAvHCP38ecUxlG/sASKmqqyKBiVBN3WyFWS8EceH78WC8eB//o3lcDeyLYZqYnpo
6dgkjbGSaj12FrWjX0SN/FAkMsdgb6fPezwKz4WRjEc7Q+ECtkubHF6+m16VsYAI
alWu0UilS3FD/Imnv9ZTkjlbuOpbu/2X06LpQz6B7qyQKqC7sn/+I03rAm2+b1Ws
23QUntOzBrZXIFiLUnny+hVrXzec5r+tSIDYFoUS1cdXIQRtioor6g7b2CkNdTs8
ZqQNWCcukbABLAP20fgBCLJDrkuuHGZsuk5aUOGdcXO0B235c6jGAzYLX2MGCOMv
SBOKAXtJMO0sGkSJcAed
=pTrm
-----END PGP SIGNATURE-----

--=-1wHIWPgDUMnG6xWiuLpu--

