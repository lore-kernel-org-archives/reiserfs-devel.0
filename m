From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: [PATCH] reiser4: port for Linux-4.5
Date: Wed, 06 Apr 2016 18:37:20 +0300
Message-ID: <1459957040.5177.3.camel@intelfx.name>
References: <56FB9A57.3040906@gmail.com>
	 <1459905738.31752.7.camel@intelfx.name> <57052A06.2020207@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qgo2Ez5Z2ekL0RfjwMSz"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=SdexDgaSd3R3E+qUjENUbXVtnu28YASQgUWVwESiKf4=;
        b=IUDNOWIXaha3ePn0OTzWTiKVqL87RNwopKUEl0vY1RCb2xE1MJuqtz7sA99fOcOBde
         gCfKMisn0Fpw0/3+7Fe7kCaHFJHcIRktfAksxTVBoCDp/BnZ6pmzLoYOtJpWK9MrTfO+
         JAKUdzKi4902T3gpZrz7HwL4BeaP6m8gak7sg=
In-Reply-To: <57052A06.2020207@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>


--=-qgo2Ez5Z2ekL0RfjwMSz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-04-06 at 17:23 +0200, Edward Shishkin wrote:
> On 04/06/2016 03:22 AM, Ivan Shapovalov wrote:
> >=20
> > [...]
> > By the way: I've noticed many times that the resulting squashed
> > patch
> > which you put on sourceforge is _different_ from what can be
> > composed
> > using incremental patches you send on the ML.
>=20
> I never announced any peculiar properties of the patches that I
> send to the mailing list. This is mostly for me (to look at the mail
> archive and to refresh memory.

OK. Life could've been easier...

> > Maybe you could finally consider having a git repo somewhere (e. g.
> > on
> > github)? It would be much easier to work with the code (and, for me
> > in
> > particular, to learn how it works) this way.
>=20
> I'll consider it sooner or later, since all Namesys archives are
> git-based, but it seems that probably "later", because currently I am
> very busy..

ditto.

Thanks anyway,
--=20
Ivan Shapovalov / intelfx /
--=-qgo2Ez5Z2ekL0RfjwMSz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXBS0wAAoJEHveF8jk4w6dn2EP/2WVcVsdu11/8Ru5OtfDwAr8
dNJGDdUKY7I5Co8iot8GLBK+/mBNc9fIT8GOy6tKkH73kTIeg82jrzKYF6uyV3kD
mn8b7eF0FRmnz+gnMaytUcDg6fHqUyMXug0NWh+BnK+AfuFO9ykIhLz5YHMLlHkF
nepb97It/cbGIwzBb8fhm50rAbbFZXytxEnHBF/7dCaXvqQo7DRWCtn7wKcbaPjr
dGIiAtrpi9mMaB4rgy4SEiQMPTjE9YiAwAulTkXmqP8IgjUbpI72rJb/U65e6emv
xtAmk057g3T4SerwTKvPeZT0MD4MG7ZPu66b2OHQoxdYrNz8L13qgTvY7g5Kwb1D
cFgAB1o22Bp8Y30WVpf/96tHaiD2XbEqer26FyjBTr4qE2nq6CWfI12gFGkUX7RM
yiiAX0VMpBfWqkgZNkJusZRqUNos0Ad+fv7p0LBZkrHMCJoVPvdaRQtWbEnQ/+q8
Wd0xnbUpeKkfeKKKTKMf1Y1I1yYuPUmpnErIEv7yy0yV52BkTb7GMH7bbEWXGzN8
D/mfocDgle03ZKjYM3E4vRDmP1UqoHxg1JJnrBsNb4eHsM5iNM2sAdVAmN/SL7xr
chEBmTlYBarep6pKzQVx3VwuW9ZzJl+zo8DJ/84kjRX5mLbBKxrb6pqCNJYwHdf6
zffEkFQ2t0i93dxxfBq2
=fn69
-----END PGP SIGNATURE-----

--=-qgo2Ez5Z2ekL0RfjwMSz--

