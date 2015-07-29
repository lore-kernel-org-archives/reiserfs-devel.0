From: Cyril Brulebois <kibi@debian.org>
Subject: Re: "No kernel modules were found" netboot d-i with custom reiser4
 kernel.
Date: Wed, 29 Jul 2015 17:00:45 +0200
Message-ID: <20150729150045.GC23647@mraw.org>
References: <CAM12Q5Sh659WuFmOccHdsnFRhdNiKfk9iri9mO1AkJQmHnY2eQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Return-path: <bounce-debian-boot=debian-boot=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <CAM12Q5Sh659WuFmOccHdsnFRhdNiKfk9iri9mO1AkJQmHnY2eQ@mail.gmail.com>
Resent-Message-ID: <PD__0xFgU0N.A.LtB.vqOuVB@bendel>
List-Id: <reiserfs-devel.vger.kernel.org>
List-URL: <http://lists.debian.org/debian-boot/>
List-Post: <mailto:debian-boot@lists.debian.org>
List-Help: <mailto:debian-boot-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-boot-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-boot-request@lists.debian.org?subject=unsubscribe>
To: Jose R R <Jose.r.r@metztli-it.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>


--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Jose R R <Jose.r.r@metztli-it.com> (2015-07-29):
> Niltze, all-
>=20
> Building kernel the 'Debian way':
>=20
> Replaced abi string at debian/config/defines (from default value of 2)
> to a more descriptive string:
>=20
> [abi]
> abiname: reiser4
>=20
> (guided by hint that debian devs sometimes set abiname string "trunk")
>=20
> Everything builds beautifully, especially UDEBs for modules/kernel
> like couple shown below:
> [...]
>=20
> 3.7M  kernel-image-4.0.0-reiser4-amd64-di_4.0.8-2_amd64.udeb
> 34M   linux-image-4.0.0-reiser4-amd64_4.0.8-2_amd64.deb
>=20
> Once kernel build is finished, I place the approxiamately 54 generated
> UDEBs at the installer/build/localudebs directory and modify
> installer/build/config/amd64.cfg
>=20
> # The version of the kernel to use.
> ## KERNELVERSION =3D $(LINUX_KERNEL_ABI)-amd64
> KERNELVERSION =3D 4.0.0-reiser4-amd64
> ## KERNELMAJOR =3D 2.6
> KERNELMAJOR =3D 4.0
> KERNELNAME =3D vmlinuz
>=20
> save modifications and execute command:
> make build_netboot-gtk
>=20
> The resulting netboot d-i iso image uses the custom kernel to start
> the Debian installation -- as can be verified by executing in an
> alternate shell: uname -a:
> Linux [host] 4.0.0-reiser4-amd64 #1 SMP Debian 4.0.8-2 (2015-07-22)
> x86_64 GNU/Linux;
>=20
> nevertheless stops at 'no kernel modules were found' and thus d-i can
> not proceed further to install custom built kernel with reiser4
> built-into-the-kernel support -- much less to detect/format a
> disk/partition win Reiser4.
>=20
> https://pbs.twimg.com/media/CK-ZehmUwAAjx-V.png:large
>=20
> Any insight provided will be appreciated. Thanks in advance.

Stuff you put under localudebs/ is only used to replace/complement
what's in the archive if something pulls it in. You probably want to
add some packages to some list under build/pkg-lists.

There's also a monolithic target you could use to bundle almost
everything into your image. This is a bigger hammer though.

Mraw,
KiBi.

--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVuOqdAAoJEP+RSvDCs1UgV0gP/i5eZNwHjBAn6ZdfVCPSv3O9
EZ61ZO6+TYgjF9DGThb3kAdNttH7y7dCABuhldhdy3gu28B3HaMOgprKZjynE+om
iWpHM614nZzq2BdWPSW3dvH9XsZIGuU3U1zj1sIwnCbHgfXdVWe4OgWCIVCylpnd
biHJNuVtH84hWSpDQqvN8/i2TzJiclolyGaSaAku4tOml05eV1P+mchTrSmv1e2a
lZD/mXIacXuzQHnhlGT+ad4fuRw3wiOnGFnerWsd9l0UaWjXOy28Kp9+JI+yDXKe
+t3LVbVUk8qkN+E1sZqXrGXWAYmYiu2LZ2lj7TstGFQlnJJPamh11rfTVVZmo4eM
rUvDOIh2Qpo36izV2ch6fzqO2nXW4U0+TUgoeX0H9EETSbOoFbOf15pJIYhvLfab
Ilu8HcfA4L17j8wXHd24nSir3BC6IQQAy22c52YGcDRbheuSxDN052r0NZG0sX83
EWrOPNl67iq/GSr+qYA53fAcL9pFP1trIw1YK6hSJIVIZ0c11NsL6DKDvD2zbT3Q
OeoyS4aiz+WWgD7k9mN24tDfrp9fsbAyNDtocEDZ3jNGUuA/1sjPbG7og0Iv7wvo
Z7Mv3xU1XgdHQi3FZL9EDC5reKcz4j2kc2O6UWLCIXNfcvBvOTq/Su5aumFcuNA/
zzFYzzuqcWJePJa0Bgjw
=nvPl
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--

