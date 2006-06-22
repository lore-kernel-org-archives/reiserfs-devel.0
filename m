From: Christian Trefzer <ctrefzer@gmx.de>
Subject: Re: Reiser4 for 2.6.17 Vanilla?
Date: Thu, 22 Jun 2006 16:02:21 +0200
Message-ID: <20060622140221.GB11656@hermes.uziel.local>
References: <200606220955.06975.rmeijer@internet.gr> <20060622125029.GA11656@hermes.uziel.local> <200606221641.14242.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NKoe5XOeduwbEQHU"
Return-path: <reiserfs-list-return-28835-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200606221641.14242.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Raymond A. Meijer" <rmeijer@internet.gr>
Cc: reiserfs-list@namesys.com

--NKoe5XOeduwbEQHU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2006 at 04:41:13PM +0300, Raymond A. Meijer wrote:
> > The patch reiser4-for-2.6.16-4 should apply just fine, I use it myself
> > on top of 2.6.17.
>=20
> The thing is, I want to use 2.6.17-ck1 as well... I'll give it a shot wit=
h=20
> this patch and see what happens :)

You might want to take a look at the -beyond patchset, which
consolidates a lot of pretty stable yet far from mainline features,
including reiser4, ck, suspend2, libata pata, etc. More info and source
code available at
	http://iphitus.loudas.com/archck.php

The latest version is against 2.6.16, and it might take some time before
the first 2.6.17 patchset arrives since the author tends to be busy with
school sometimes.

Kind regards,
Chris

--NKoe5XOeduwbEQHU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iQIVAwUBRJqi7F2m8MprmeOlAQLCpQ/9FQKirXGM9OiiVx/zBwhR2iI4C4Q3mvVf
OSk1h6FouUSYwqM1h2GGkNGCDyD3vM45NjOj87HzlElyiIBwr6ymtG2ZBWMvqUZc
tzk0FZwtUSOgNtm7W6AsyiHWx5LBJOjWsngd6NkfSJs+OM/oNBcOSwrhNqRfi0yA
2JY8TF5vDwFnCREnNSBjqay5IJ79V5Ej8F5/wwwtwI+fYjFGsjcZQc6Crx+lWHcc
IPwsCE94S2bLnOWmiw19CHqy8SLqXvIoyLG1Sv0fGCvesb8KSav/cHX8eWn+KhI6
WVwJENBjXAr9SABqpPijrxjVdtjINugIeSSB2MaGj3lJygKgSnOw1xl2XyP03f+R
4LnzypGg3/KjAciXzGnnoFU14lYKkpZwwMecEPEZocnN+R+Lsf1tR/F8zlUZNoJY
bS/Iork2bqEiGdAczpOq+J1pFzVhHqXLQpKAAmgwz3zWD0PGep1Xu9Fxml4gH5Kg
MMF/frVBx8p0M4mdDlQLIpKt3rk7WUyA7puvRxanHMxexsHsHyCqUgiDueb4rXxs
5J7t67MDjQBNjHbDLJZQmEs5VrABN3OjtqoZnZwa+8HwKBi63FfZbgQT3CsyzZp/
EXpRcth+FjeKJ0bASqQaN07y2Xf1ws17WTdQqDToyUHGYTaZmO0Zm4PSoqnGrbqL
dVUqKv0In/I=
=7mIs
-----END PGP SIGNATURE-----

--NKoe5XOeduwbEQHU--

