From: Roman I Khimov <rik@osrc.info>
Subject: Re: How to make Reiser4 plugins&namespace magic work?
Date: Wed, 22 Jun 2005 23:20:13 +0400
Message-ID: <1119468013.8038.2.camel@rik-note.loc>
References: <1119450117.2429.35.camel@rik-note.loc>
	 <42B98483.1000209@namesys.com>
Reply-To: rik@osrc.info
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-viVzA0369sycBASzj0Zy"
Return-path: <reiserfs-list-return-24474-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42B98483.1000209@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

--=-viVzA0369sycBASzj0Zy
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It works! Thank you, Edward. :)

=D0=92 =D0=A1=D1=80=D0=B4, 22.06.2005, =D0=B2 19:32, Edward Shishkin =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
> >Andrew Morton mentioned that "patches still contain all the
> >reiser4-specific namespace enhancements, only it is disabled, so it is
> >effectively dead code" and it seems this explains why I didn't see any
> >of Reiser4 namespace magic last time I've tried to play with it.
> >
> >But actually I want to see it and I want to play with it - any recipe
> >for how to revive this code?
> >
> >Thanks.
> >
> > =20
> >
> Hello.
> You might want to enable pseudo interface having
>  #define ENABLE_REISER4_PSEUDO (1)
> in reiser4.h, build the kernel and read this paper:
> http://thebsh.namesys.com/v4/pseudo.html
> Note, that this paper is not updated, so use "...." instead of "metas".
> Also in order to use this interface for regular files the last ones=20
> should have an executable flag.
>=20
> Thanks,
> Edward.
--=20
                            Roman
 ,---------------------------. ,--------------------------.
/     http://www.3os.ru/      V    http://www.osrc.info/   \         .o.
\    mailto: rik@3os.ru       ^   mailto: rik@osrc.info    /         ..o
 `---------------------------' `--------------------------'          ooo
gpg --recv-keys 0xE5E055C3 --keyserver hkp://subkeys.pgp.net

--=-viVzA0369sycBASzj0Zy
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: =?koi8-r?Q?=FC=D4=C1?= =?koi8-r?Q?_=DE=C1=D3=D4=D8?=
	=?koi8-r?Q?_=D3=CF=CF=C2=DD=C5=CE=C9=D1?=
	=?koi8-r?Q?_=D0=CF=C4=D0=C9=D3=C1=CE=C1?=
	=?koi8-r?Q?_=C3=C9=C6=D2=CF=D7=CF=CA?=
	=?koi8-r?Q?_=D0=CF=C4=D0=C9=D3=D8=C0?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBCubnsXJ70z+XgVcMRAnd+AJsGPFXkrBnRKL0TkKK029MeL/Oc1wCgolut
ifLhkiG7B3+SaG6KfHiX9P0=
=HeFV
-----END PGP SIGNATURE-----

--=-viVzA0369sycBASzj0Zy--

