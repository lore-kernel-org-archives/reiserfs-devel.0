From: Christophe Saout <christophe@saout.de>
Subject: Re: mongo_copy: cp: cannot stat
	`/mnt/testfs/testdir0-0-0/f92':	Input/output error
Date: Thu, 05 Aug 2004 02:06:50 +0200
Message-ID: <1091664410.9177.2.camel@leto.cs.pocnet.net>
References: <20040804065840.17C7915C7C@mail03.powweb.com>
	 <4110A0FA.3030007@namesys.com> <4110A38E.6070905@namesys.com>
	 <4110A561.9050200@namesys.com> <4110DBD6.7010904@namesys.com>
	 <20040804183801.GU1284@nysv.org>  <41115962.1030407@namesys.com>
	 <1091659605.8276.3.camel@leto.cs.pocnet.net> <411177E1.1040209@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Gy6AsDCvwlmwnYE5NoRK"
Return-path: <reiserfs-list-return-20010-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <411177E1.1040209@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Markus =?ISO-8859-1?Q?T=F6rnqvist?= <mjt@nysv.org>, "Vladimir V. Saveliev" <vs@namesys.com>, David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

--=-Gy6AsDCvwlmwnYE5NoRK
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 04.08.2004, 16:57 -0700 schrieb Hans Reiser:

> >>V4 likes stack.  If someone can convince me that kmalloc is as efficien=
t=20
> >>as stack, I'd like to hear it, because I know I lack expertise on the t=
opic.
> >>   =20
> >>
> >
> >The disassembled fast path of kmalloc (with a size of the object known
> >at compile time) fits on one page. Most of the time it will just return
> >a pointer from a pool of cached and cache-hot objects.
> >
> whereas using stack is 0 instructions or?

More or less. But who's counting? ;-)


--=-Gy6AsDCvwlmwnYE5NoRK
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBEXoZZCYBcts5dM0RAiQ8AJwOIVxO5SoNzP0lr8tkp6IBZTuZ8ACfbT6Q
jqAzue1wFDcEOkt9emB7DwU=
=GIRO
-----END PGP SIGNATURE-----

--=-Gy6AsDCvwlmwnYE5NoRK--

