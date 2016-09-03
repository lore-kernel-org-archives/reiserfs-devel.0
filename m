From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: Debian kernel 4.7.2-1 build on Sid and Jessie fails
Date: Sat, 03 Sep 2016 18:30:47 +0100
Message-ID: <1472923847.25374.75.camel@decadent.org.uk>
References: <20160902103548.87A163318CC@mictlantecuhtli.metztli-it.com>
	 <1472831351.25374.61.camel@decadent.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7yQzJAjot03nI1YUF6dS"
Return-path: <bounce-debian-boot=debian-boot=m.gmane.org@lists.debian.org>
In-Reply-To: <1472831351.25374.61.camel@decadent.org.uk>
Resent-Message-ID: <lC8eKG5L6DF.A.9BE.Q3wyXB@bendel>
List-Id: <reiserfs-devel.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-boot/>
List-Post: <mailto:debian-boot@lists.debian.org>
List-Help: <mailto:debian-boot-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-boot-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-boot-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/1472923847.25374.75.camel@decadent.org.uk
To: Jose R Rodriguez <jose.r.r@metztli.com>
Cc: debian-kernel@lists.debian.org, debian-boot@lists.debian.org, reiserfs-devel@vger.kernel.org


--=-7yQzJAjot03nI1YUF6dS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-09-02 at 16:49 +0100, Ben Hutchings wrote:
> On Fri, 2016-09-02 at 03:35 -0700, Jose R Rodriguez wrote:
> >=20
> > Niltze, all!
> >=20
> > Currently running Reiser4-patched kernel 4.7 built from pristine
> > source upstream:
> >=20
> > Linux mictlantecuhtli 4.7.0.tezcatlipoca #1 SMP PREEMPT Wed Aug 10
> > 05:04:17 PDT 2016 x86_64 GNU/Linux
> >=20
> > On the other hand, I have experienced multiple issues building
> > Debian'ized kernel 4.7.2-1 -- first building on Jessie modified for
> > GCC 4.9;
> > =C2=A0and then attempting build on Jessie-built GCC 5.3. And finally I
> > attempted the build on Debian Unstable and it failed, as well.
> > Below are the offending sections -- which, by the way -- roughly
> > correspond in all instances of Debian and GCC:
> [...]
>=20
> This happens if you invoke debian/rules directly and not through dpkg-
> buildpackage.

Rather, it can happen in some circumstances, but...

> debian/rules.real does:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0ifdef OVERRIDE_HOST_TYPE
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CROSS_COMPILE :=3D $(OVERRIDE_HOST_TY=
PE)-
> =C2=A0=C2=A0=C2=A0=C2=A0else ifneq ($(DEB_BUILD_ARCH),$(DEB_HOST_ARCH))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CROSS_COMPILE :=3D $(DEB_HOST_GNU_TYP=
E)-
> =C2=A0=C2=A0=C2=A0=C2=A0else
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CROSS_COMPILE :=3D
> =C2=A0=C2=A0=C2=A0=C2=A0endif
>=20
> So the assumption is that all those architecture variables, or none,
> are defined. =C2=A0dpkg-buildpackage does define them all.
>=20
> However, debian/rules does:
>=20
> =C2=A0 =C2=A0 DEB_HOST_ARCH :=3D $(shell dpkg-architecture -qDEB_HOST_ARC=
H)
>=20
> and does not define any other architecture variables.

...variable definitions in debian/rules don't automatically propagate
to debian/rules.real, so this doesn't explain the failure. =C2=A0And
although I have seen this failure myself, I can't reproduce it now.

> We should probably include /usr/share/dpkg/architecture.mk in
> debian/rules instead.

I now think it should be included in debian/rules.real. =C2=A0However, unti=
l
I have a way to reproduce the problem, I'm not going to attempt a fix.

Ben.

--=20
Ben Hutchings
Once a job is fouled up, anything done to improve it makes it worse.

--=-7yQzJAjot03nI1YUF6dS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJXywjHAAoJEOe/yOyVhhEJVtoQAMCzZ9UMB/i9zr3aVlKn5RYM
KUpQcxxLsWM1yRn8Oau3wkWnLWLQcLLHlkaHoreRLdgI6XSc4yQIMpEBBppogJ62
ifKQpceRlQxZ1F3W3aEFj3Pk+DuqOGU33ZTIpdZ5R0ayBlQRzbtMaO5mhyNH8Sku
13A0DudhquC06hbnyqWK1bocfrQoy36+LBX2O+B4SkqntQRGHX3pcdbsM/tgxof0
ehWz3Uvi68VfSaNnxhNQJ5CbmGB9MTjuVWb1HX8zyrTj4otY2R5UyWmu6NgliA+9
XPOkcV/yB1jpUm+u00CqmCLJocIFOZWBA3v6XIKGqpr799fW5g+u82vRR/6YssDH
uKOBDgkv4clzT1GLjvSOcrDom9gFB5zueO39afnrlwpsEtPWFrD6ZBHzzDOnb+6d
ogMo+300gqGOkkuT3NrIFvJFitO1doOrjkOD1LpV1OOdZ/d+rFMJZZZkeveRN/1d
oEG6bB2uyNfHZom27K6kVPqthRR61St1MSvoXELT9QdoZYblrvYfjtHZeu/e8+jh
6z5QoU5+UyzAP8GTnZtncMTNMWpeCY6jzhHXPGjYQmEt3NpcpCMSeKn2GXqS3iCK
vNnMMOTN8f6Cg2LjUYNxAx6KUUDgXEGAlDvXPUZvy4N1TWNcQrNhk1mMgJfyp2yX
2WnLxbmfZQ3UA8gHmhF0
=OjSa
-----END PGP SIGNATURE-----

--=-7yQzJAjot03nI1YUF6dS--

