From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: 2 minutes for a reiser4 filesystem to mount.
Date: Sun, 25 Oct 2015 01:39:24 +0300
Message-ID: <1445726364.7642.6.camel@gmail.com>
References: <n0b6ql$6t4$1@ger.gmane.org> <1445636264.2412.0.camel@gmail.com>
	 <BLU436-SMTP17E43BAB1F0262E99F242F9B260@phx.gbl>
	 <B4C46971-499C-4275-A153-D0FE220401D3@gmail.com>
	 <BLU436-SMTP14768256E7F72AB73706D159B250@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-/APpZU/PnEPRIebQdU1c"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=jiESa27+iwYz12HhETF9lJvJ6ZUlqdHKKfbIH1iW5pA=;
        b=DB/r8aTWlKXksUIFctDy80QbYR/zIN+moWnnNqVBaghhtKVfyF0nz43klIl8vvPKQo
         60g18TQZfPC3Jb9dzXByW53t1AlTaYHnFM3AZu3DmcwhwbVDv25qVaXf5fzGF4RNrFS/
         zgIVaMqOYgiKgf/J0lPwYYIYK54IqwmK4B/EcM5Q6YNmdZ8Q/4k6F576HE6KGU2JLs+e
         9Rzrc3rGwBOIQPGLEINdvrxn2H2CpzvKA91r6kDuO7FrIZSqlKteHaLIR1EQHt4O2HNE
         z2l5nrnb5iMHLUqG2q9UYvnyqmlFq9IYSM39vLDgo/s7zTBBQN4xctlK7RSq1K2mKGJs
         iy3A==
In-Reply-To: <BLU436-SMTP14768256E7F72AB73706D159B250@phx.gbl>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Georgios Tsalikis <georgios.tsalikis@hol.gr>
Cc: reiserfs-devel@vger.kernel.org


--=-/APpZU/PnEPRIebQdU1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-10-24 at 22:41 +0300, Georgios Tsalikis wrote:
> On 24/10/2015 01:58 =CF=80=CE=BC, Ivan Shapovalov wrote:
> > > 24 =D0=BE=D0=BA=D1=82. 2015 =D0=B3., =D0=B2 1:06, Georgios Tsalikis <=
georgios.tsalikis@hol
> > > .gr> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0):
> > >=20
> > > > On 24/10/2015 12:37 =CF=80=CE=BC, Ivan Shapovalov wrote:
> > > > > On 2015-10-22 at 20:38 +0300, Georgios Tsalikis wrote:
> > > > > The filesystem is 1.7GB large, lies in a GPT patition and is
> > > > > formated
> > > > > with -o node=3Dnode41 without any other override. The kernel is
> > > > > 4.2.3
> > > > > with
> > > > > the 4.2.2 patch.
> > > > > I tried the same on a 250MB partition and it mounts
> > > > > instantly. dmesg
> > > > > shows nothing special
> > > > > Any ideas? Thanks in advance. :)
> > > > Hello,
> > > >=20
> > > > try "dont_load_bitmap" in mount options. However, this is
> > > > anyway very
> > > > strange for a ~2GB partition...
> > > I am sorry, did i write 1.7GB? I meant 1.7TB... i am old and such
> > > figures dont fit my mind easily!
> > Ah, so it's 1.7 TB? Then it's not unusual at all. Indeed, try
> > mounting with `-o dont_load_bitmap`.
> >=20
> I did so and it worked. Thank you. But what does that option do?=20

This option tells reiser4 to load bitmap blocks on demand, and not all
at once at filesystem mount time.

The bitmap is how reiser4 stores information about which on-disk blocks
are allocated and which are free (one bit corresponds to one block,
hence the name).

The 2TiB filesystem has 2*1024^4 / 4096 =3D=C2=A0536870912 blocks, which ta=
ke
536870912 / (8*4096) =3D 16384 bitmap blocks, so it takes 120/16384 ~ 7ms
to load one block, which is not that unusual (given that the bitmap
loading doesn't seem to be optimized too well: each block is read in a
separate request).

> And which are the other options and their function?

I'm afraid that the full list of reiser4 options can only be found in
code (file init_super.c, functions push_sb_field_opts() and
reiser4_init_super_data().

--=20
Ivan Shapovalov / intelfx /


--=-/APpZU/PnEPRIebQdU1c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlYsCJwACgkQxUKljSIMAnAyEgEA75sterQJd9skbnES6jUUl5OY
mlwNIt7gZskqcIC43UUA/36+rXdMQ1Wx+ZlCUKbMn5JnvUQU5VCGfWw3hGjJ1yTS
=Q7Xc
-----END PGP SIGNATURE-----

--=-/APpZU/PnEPRIebQdU1c--

