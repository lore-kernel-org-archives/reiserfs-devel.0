From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: Debian kernel 4.7.2-1 build on Sid and Jessie fails
Date: Fri, 02 Sep 2016 16:49:11 +0100
Message-ID: <1472831351.25374.61.camel@decadent.org.uk>
References: <20160902103548.87A163318CC@mictlantecuhtli.metztli-it.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-SVnG+vlACi+Hd4bX9Yxw"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20160902103548.87A163318CC@mictlantecuhtli.metztli-it.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jose R Rodriguez <jose.r.r@metztli.com>
Cc: debian-kernel@lists.debian.org, debian-boot@lists.debian.org, reiserfs-devel@vger.kernel.org


--=-SVnG+vlACi+Hd4bX9Yxw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-09-02 at 03:35 -0700, Jose R Rodriguez wrote:
> Niltze, all!
>=20
> Currently running Reiser4-patched kernel 4.7 built from pristine
> source upstream:
>=20
> Linux mictlantecuhtli 4.7.0.tezcatlipoca #1 SMP PREEMPT Wed Aug 10
> 05:04:17 PDT 2016 x86_64 GNU/Linux
>=20
> On the other hand, I have experienced multiple issues building
> Debian'ized kernel 4.7.2-1 -- first building on Jessie modified for
> GCC 4.9;
> =C2=A0and then attempting build on Jessie-built GCC 5.3. And finally I
> attempted the build on Debian Unstable and it failed, as well.
> Below are the offending sections -- which, by the way -- roughly
> correspond in all instances of Debian and GCC:
[...]

This happens if you invoke debian/rules directly and not through dpkg-
buildpackage.

debian/rules.real does:

=C2=A0=C2=A0=C2=A0=C2=A0ifdef OVERRIDE_HOST_TYPE
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CROSS_COMPILE :=3D $(OVERRIDE_HOST_TYPE=
)-
=C2=A0=C2=A0=C2=A0=C2=A0else ifneq ($(DEB_BUILD_ARCH),$(DEB_HOST_ARCH))
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CROSS_COMPILE :=3D $(DEB_HOST_GNU_TYPE)=
-
=C2=A0=C2=A0=C2=A0=C2=A0else
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CROSS_COMPILE :=3D
=C2=A0=C2=A0=C2=A0=C2=A0endif

So the assumption is that all those architecture variables, or none,
are defined. =C2=A0dpkg-buildpackage does define them all.

However, debian/rules does:

=C2=A0 =C2=A0 DEB_HOST_ARCH :=3D $(shell dpkg-architecture -qDEB_HOST_ARCH)

and does not define any other architecture variables.

We should probably include /usr/share/dpkg/architecture.mk in
debian/rules instead.

Ben.

--=C2=A0
Ben Hutchings
Unix is many things to many people,
but it's never been everything to anybody.
--=-SVnG+vlACi+Hd4bX9Yxw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJXyZ93AAoJEOe/yOyVhhEJ7UcP/RHycFhuCluKfSHwY2TSxw7C
6ywINzEH4PCQ9CZWK6g68EESj+qZYt8t76eG7lFviZ8OEim+lCQO71SPQDnzThpO
hc1AHeb7aNbF0tYXshU2Jits6lZjIiLp8pQIBK6IcQ/5vPX2LY8DDdbI+yp10VyT
CB8GXzPlYWcrp81WSJCUaUlCxX5GQ2065BrTcglFEd3nh252HKetoGtlRWpt54G1
5pfNpUd5yNSq9vznw1eujmVA9Anh1EY5FGzdEAuJj+yz+id/Ow/LHnVjO3I29oZA
37HdxUFxFgM46m3QUDnVEQ9vg1M59+BRg4RGE8nha0p9PLAvgMjNEzxqeQJT32q3
IbukYBsajLbs+xcZbnU9XLlJGyWtdqrsDeo8PTCxJrQc7kSUQiOubI6/8iAmnPzD
XNcLt+UGp1bL9/7TM5zKM1NhnCrIIg3LwdiJwmpN8ewz3F2OCUKZDHoF3S5Y+uZQ
9sT7hF9r85LtZ9SjaGKUABCFfPDqYLBxI8c5/37jUk09wttldSZRxW134mLLy/Ed
yw9mxm69DcEnBsUFB7Aj/1TcZ4l+PdpI38nAwkEu6vumwoVisGlpqafXFTcBUtlQ
leVyZDYJkBYV683Tk4mx7YGlAXBe2bBGmhGcw2N9zrZt6MwNyqLMGTv6TefrXCiU
c6kxtDuxoRPTPDfMPoH0
=V0gt
-----END PGP SIGNATURE-----

--=-SVnG+vlACi+Hd4bX9Yxw--
