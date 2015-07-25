From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: Building kernel the Debian way fails
Date: Sat, 25 Jul 2015 15:58:55 +0100
Message-ID: <1437836335.12842.7.camel@decadent.org.uk>
References: <CAM12Q5Q0B_kgJ9e8ti2SWaGQwsccGu6zd2-EULz-jvuxXL4Fng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-16s7FxLTxtHOUkvhVoZQ"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAM12Q5Q0B_kgJ9e8ti2SWaGQwsccGu6zd2-EULz-jvuxXL4Fng@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jose R R <Jose.r.r@metztli-it.com>, debian-kernel@lists.debian.org, debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>


--=-16s7FxLTxtHOUkvhVoZQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2015-07-24 at 22:23 -0700, Jose R R wrote:
[...]
> Procedure executes for a while but then:
>=20
> [...]
> xt_unregister_targets                            module:
> net/netfilter/x_tables, version: 0x1ab6dab6 -> 0x967580ea, export:
> EXPORT_SYMBOL
> yield_to                                         module: vmlinux,
> version: 0x64772de8 -> 0x7e986552, export: EXPORT_SYMBOL_GPL
> zap_vma_ptes                                     module: vmlinux,
> version: 0x51123f12 -> 0xe4761abe, export: EXPORT_SYMBOL_GPL
> zero_fill_bio                                    module: vmlinux,
> version: 0x999a9bec -> 0x2f0438ba, export: EXPORT_SYMBOL
> zerocopy_sg_from_iter                            module: vmlinux,
> version: 0x156cb754 -> 0x3396ed70, export: EXPORT_SYMBOL
> zl10036_attach                                   module:
> drivers/media/dvb-frontends/zl10036, version: 0x01c15872 ->
> 0x5ad87e01, export: EXPORT_SYMBOL
> zl10039_attach                                   module:
> drivers/media/dvb-frontends/zl10039, version: 0x4d52eac4 ->
> 0x99661045, export: EXPORT_SYMBOL
> zl10353_attach                                   module:
> drivers/media/dvb-frontends/zl10353, version: 0xd7c34f95 ->
> 0x6f771756, export: EXPORT_SYMBOL
>=20
> Removed symbols:
> bdi_unregister                                   ignored, module:
> vmlinux, version: 0xa88ae9e6, export: EXPORT_SYMBOL
[...]

See
<http://kernel-handbook.alioth.debian.org/ch-versions.html#s-abi-maintenanc=
e>

Ben.

--=20
Ben Hutchings
It is easier to change the specification to fit the program than vice versa=
.


--=-16s7FxLTxtHOUkvhVoZQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVbOkL+e/yOyVhhEJAQps4Q/9F3bUHOJRy/f5xiaX4pdjLaTbYqseYBGg
DcJmucco3V/TpPF3xNHPx/p1Xi3fiNLuqMjjYVa6EiWTQaf66Dx+xID7+t3/Wct4
heAlhaLBj0J8DIkeB8TpDgs9zDig7PiO1huWb+tMWAWe3qYUmFPbWK8vU9LmlpOD
2xN2usKi7FfvkuPGxQA/5bFCCCMqlOVFrqraU4nKWae2uwaRCJY8sFqoQwp7qzJr
nN3tsOEbvuzZxW3WGzNrraMrLzWA1bTSWrmiZaT/NRxA3fSwwNVwBzZ/3nTXc0cD
CGcaffC3cYkIyzrz3O+5c2UH46WXoZf7W77trvrEdxu5DFq23UubSw2CVcM9zuBa
Lirv2T0C8PrEmiyWJjnnXeKjyAdaed9ta+C+fyaqH4J24h7X7p1mJ9eMbV1r/0yQ
lvf41ASr43DwbHvZwWHOVFj5dnZ7Gv9UNPb+7pGfQBxBZMQih2SsBGbamVAmd6ji
ZCYE6EDdfWMs4Rb6yVmegRUrHs1Jba1SfQ6P9JtzmW4+FJgp9AvvzIbkJ+D3aTAW
RsLqXA2Q9R2iWZeLUjn83+5E2yC9vsXCNOJH5ZOcWjwERcfwy5L8jdCSE/lGfcGH
JDvo2xUbpdckC0ZgH8LzEhqUVEo2/nDoQBNBxoETPLMZit6oBtd0xgiwOArFiAuD
w5HoETwPxI8=
=8XdB
-----END PGP SIGNATURE-----

--=-16s7FxLTxtHOUkvhVoZQ--
