From: Christophe Saout <christophe@saout.de>
Subject: Re: reproducable deadlock condition (reiser4)
Date: Wed, 29 Sep 2004 17:48:42 +0200
Message-ID: <1096472922.11946.2.camel@leto.cs.pocnet.net>
References: <1096116193.12503.7.camel@leto.cs.pocnet.net>
	 <559718553.20040925144815@tnonline.net>
	 <1096116729.12503.15.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-GHiaUOg9eLrXrCtdH8Un"
Return-path: <reiserfs-list-return-21961-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1096116729.12503.15.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Spam <spam@tnonline.net>
Cc: reiserfs-list@namesys.com

--=-GHiaUOg9eLrXrCtdH8Un
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 25.09.2004, 14:52 +0200 schrieb Christophe Saout:

> > > it seems I've found a deadlock in reiser4.
> > >=20
> > > I don't know how it happens, but every time i want to run "emerge php=
"
> > > the command compiles php and wants to install it but just before the =
end
> > > it hangs (when running some PEAR commands). The whole system freezes =
a
> > > couple of seconds after that. /var/log/messages contains some lines
> > > saying "clong length 0" but these lines never actually get commited t=
o
> > > disk when the build directory is on the /var volume.
> > >=20
> > > Interestingly the same deadlock occurs if I try to run the build on
> > > another volume, so it seams to be the I/O pattern that's causing the =
problem.
> > >=20
> > > I've tried it four times so far, always with the same result. The
> > > filesystems are all clean.
> > >=20
> > > Should I turn on debugging? I can also provide ssh access to someone =
if
> > > he wants to look himself.
> >
> >   I to had problems with rc1. For example the repacker would also
> >   freeze my system or corrupt the disk data. But I switched to rc2-mm1
> >   and since then I have not had any reiser4 errors at all. It could be
> >   worth a try.
>=20
> Ok. Let the patch-fest begin...

Well, bad news.

I upgraded to -rc2-mm4 and the problem is still there.


--=-GHiaUOg9eLrXrCtdH8Un
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBBWtlaZCYBcts5dM0RAvEgAJ9fM7Z3OU0NxQlqmoFJyIKATDG9ggCeKykI
RmuxbnJargYKFGebMZyH/Bs=
=HyAO
-----END PGP SIGNATURE-----

--=-GHiaUOg9eLrXrCtdH8Un--

