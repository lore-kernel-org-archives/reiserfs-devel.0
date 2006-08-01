From: Christian Trefzer <ctrefzer@gmx.de>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion)
Date: Tue, 1 Aug 2006 10:50:33 +0200
Message-ID: <20060801085033.GA14461@hermes.uziel.local>
References: <1154164364.2903.10.camel@laptopd505.fenrus.org> <44CBA4BF.80301@slaphack.com> <200607300132.28326.sarathmenon@gmail.com> <44CBC557.4050403@slaphack.com> <20060730115526.GB5336@hermes.uziel.local> <7a329d910607301410x6d6fb4f0sa946c8764be82ab1@mail.gmail.com> <20060730213757.GB6420@hermes.uziel.local> <20060730214237.GC6420@hermes.uziel.local> <7a329d910607310821p69e964f7t8d29300f3221cfa3@mail.gmail.com> <44CE286F.6000700@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Return-path: <reiserfs-list-return-29376-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <44CE286F.6000700@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Wil Reichert <wil.reichert@gmail.com>, Sarath Menon <sarathmenon@gmail.com>, reiserfs-list@namesys.com

--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2006 at 10:57:35AM -0500, David Masover wrote:
>
> Wil Reichert wrote:
>
> >Any idea how the fragmentation resulting from re-syncing the tree
> >affects performance over time?
>=20
> Yes, it does affect it a lot.  I have no idea how much, and I've never=20
> benchmarked it, but purely subjectively, my portage has gotten slower=20
> over time.

Delayed allocation still performs a lot better here than the v3
"immediate" allocation. In addition, tree balancing operations are
performed on flush as well, so what you get on disk is basically an
almost-optimal tree. Of course, this will change a bit over time, but
with v4 it takes a lot longer for that to happen than with v3 afaict.
There _has_ been some worthwile development in the meantime : )

Kind regards,
Chris

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iQIVAwUBRM8V2KnY3eLOiwZcAQpkvg//d2G6uG5c6NlN3lo2E4we7oTM/uNoK8hF
gnV6bNuufec68n75KyeIjD7oa7LIqrz6Vv4+zoWkFGQki9ar+DQclghjI+PEfGvq
BxZGLGIbdQ0QdZTtDTeIs2uIYCyO1kY4vSHiM/9NTxbqTHUjjMEVALOhORcmSpO1
z93FPluWGp6ctgRz8yRqhrSCPckhkQceUAxF33AO9Rq5y9j4DVbZyziZsZjPR8qt
FI/JONTYMuwDywbHyq2gcBy9VKMVG4Erwi5pJPETVz8MfQh+8QmBdaT5gDr/QBdd
yHOFBOjHxzeN8F8/7a4+2eCWSRXkRogXkzmwBiyf0zYE4Bw7S8GjkfV27axi2cSP
TH3+G0GcqBIfOyix8UqCnRtr9M7+EKIheUWpgYLvzofQ4GE0kWiNWLTjKAc8C0l3
DyMU5L47wHUqmmJThB1X6BfEoLM8rIR0MP48R01xiXtUqSxlLpp9BByFi+Rh6EJy
uVMu1UcuXhBTiUDkaBLWLxWKyU4E37BqMGaxViD/dLfTH5PizGNd8TtuLl8OWG/D
Z+f/nJwDjUkTY0Kn4jPuXUNK8mT+XJgyNUW+O+3KJmV3ZU806zD0F7C71dutLruq
QLBvaTAXr64KjtPrxMS5Rwc0Wu4X2qE6AQIEXYFKd6Ig5rsz0Cz7LmAT7o7cvWCE
opmVdMOzUG8=
=4dRj
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--

