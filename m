From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: "No kernel modules were found" netboot d-i with custom reiser4
 kernel.
Date: Thu, 13 Aug 2015 12:20:10 +0200
Message-ID: <1439461210.10857.88.camel@decadent.org.uk>
References: <CAM12Q5Sh659WuFmOccHdsnFRhdNiKfk9iri9mO1AkJQmHnY2eQ@mail.gmail.com>
	 <20150729150045.GC23647@mraw.org>
	 <CAM12Q5RUYpU+hKgf5MBGv_puOuWtiUTStVjpSw9GvnTKNyhkCQ@mail.gmail.com>
	 <CAM12Q5Rbje6nReoTpSDw2Xf6_AxJxH5dhGh7fNTCi=89ogZ+Lg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-KdFkLwvhVrGb9NZHPUsi"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAM12Q5Rbje6nReoTpSDw2Xf6_AxJxH5dhGh7fNTCi=89ogZ+Lg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jose R R <Jose.r.r@metztli-it.com>, Cyril Brulebois <kibi@debian.org>
Cc: debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>


--=-KdFkLwvhVrGb9NZHPUsi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2015-08-13 at 02:45 -0700, Jose R R wrote:
[...]
> QUESTION:
> How do I specify -- prior to building a reiser4-patched kernel the
> 'debian way' -- a directive to build the *extra* reiser4 module  UDEB?
>=20
> Before/After specifying reiser4 as a module in .config (i.e., make -C
> debian/build/build_amd64_none_amd64 menuconfig ), I have tried adding
> the reiser4 directive to the debian/rules.gen inside the kernel tree
> source -- still it does not generate a reiser4 module UDEB.
[...]

Look under debian/installer in the linux source package and read the
kernel-wedge documentation.

Ben.

--=20
Ben Hutchings
Time is nature's way of making sure that everything doesn't happen at once.


--=-KdFkLwvhVrGb9NZHPUsi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVcxvWue/yOyVhhEJAQo9RBAA0L1fF/K+8tk6HIEXq0TtBV9/h8MVcIsA
0M9qN/BOPy2agCqpJnKTWzvWHmVT8uHm/1Z5xswPBXR0ttm4Wj8PW4le8EDNp+Xi
oxs3mbokjB8HP1iu0j/OAVRE4AyKBXUxPvg8vl5fNbIsY2Tdw7Ao9vUWGm0JzVqn
OHyZ0m2LzE14KmtVwY8MoN89mHaxIHVmtfs6tZ+LstD4L7XsEzv4TUOqorYz7YDN
jxnpu/QV8ovt3PJ9KeOiwRd5oCv12HAHRKWUg63gUgqscaHH3uLsFZ3Z9Ak/mBiS
0msbyQLtvxrscS1f9e2e0xbKzdkz85cueGgL2N4BJSxO9u45mUrgvBuz5BCNIm3s
KUF20kgsIlBRp+KGAbR4zmAUQy1KP/k4w5b89Iy/WuYREwCLyN1xE7p/vbXSxiDw
w9jJHF0sQmbpLhO9eBx4k+2+e1CUTHnQqO1ik+GYZePWFmV311yggyU/DAemztXj
/tns6lyzph8Y84PYgzF+M9zOo2f33CPUetjNJcmrTprAXJRPV/Zju30LMhlY6l12
FQ2evKH+vKGamhJ66RZtqNa1YrJ1m9qt3YEkpEmBN+Q2Wavm9K2vYt34vUel+apG
jdilryAL1LO8p9tYel7clu+ctdD6+nkEdWc2CEx9lUKZKYzs0XD4XuWJzbDTIXdj
ejV54mnaHBQ=
=4KA1
-----END PGP SIGNATURE-----

--=-KdFkLwvhVrGb9NZHPUsi--
