From: Flavien Bridault <f.bridault@fra.net>
Subject: Re: [PATCH] reiser4progs compiling with GCC4.0
Date: Fri, 27 May 2005 17:07:40 +0200
Message-ID: <1117206460.6191.2.camel@Gargamel.ravioli>
References: <1117136170.9409.1.camel@Gargamel.ravioli>
	 <200505271511.23873.vitaly@namesys.com>
Reply-To: disk@sourcemage.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-O8y2wi+ew1xKor87/oaG"
Return-path: <reiserfs-list-return-24176-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200505271511.23873.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-O8y2wi+ew1xKor87/oaG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le vendredi 27 mai 2005 =C3=A0 15:11 +0400, Vitaly a =C3=A9crit :
> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 26 =D0=9C=D0=B0=D0=B9 2005 2=
3:36 Flavien Bridault =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(a):
> > Hi people,
> >
> > I searched a bit on the mail archive and I didn't find anything about
> > that except about the devel gcc4.0 tree.
> >
> > With stable gcc4.0 reiser4progs fails to compile because of three
> > "static declarations that follows a non-static declarations". I so made
> > the following patch to get it compiling, but I would like to know if it
> > seems correct to you (and if it has not already be done ;-) ) before I
> > integrate it in the Source Mage grimoire.
>=20
> thank you for the report. your patch creates different static variables=20
> in each c file that includes the header. please try the attached patch.
>=20
> -- Vitaly

I did the previous one without knowing what should be the visibility of
these variables, so your solution is indeed much better. :-)
And that compiles like a charm with gcc4.0. :-)=20
I will integrate it in Source Mage spell. Can we expect that this fix
will be included in next reiser4progs release ?

Thanks !
--=20
-- -- -- -- -- -- --
Flavien Bridault
Source Mage GNU/Linux - Disk Section Guru

irc: vlaaad
jabber: vlaaad@amessage.be


--=-O8y2wi+ew1xKor87/oaG
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBClze72em/EE6e1kQRAtUaAKDFiHfJhQz1gtyUkzdXsyeFjLPILACeJXsp
oggzh3Yjk9/ipg1cEhiBn9M=
=+d4o
-----END PGP SIGNATURE-----

--=-O8y2wi+ew1xKor87/oaG--

