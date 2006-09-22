From: Thomas Kuther <gimpel@sonnenkinder.org>
Subject: Re: r4 observations
Date: Fri, 22 Sep 2006 16:17:19 +0200
Message-ID: <20060922161719.5a6ac405@SiRiUS.home>
References: <ees2cj$15h$1@sea.gmane.org>
	<200609211502.01497.vs@namesys.com>
	<eetseh$vjq$2@sea.gmane.org>
	<20060922140244.33865730@SiRiUS.home>
	<ef0kra$aqj$3@sea.gmane.org>
	<20060922144930.64117aaf@SiRiUS.home>
	<ef0n8i$aqj$5@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary=Sig_p6LKsjzYqT.jYB9bVn7pm9A;
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-list-return-29974-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ef0n8i$aqj$5@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Sig_p6LKsjzYqT.jYB9bVn7pm9A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 22 Sep 2006 13:08:34 +0000 (UTC)
"Peter" <sw98234@hotmail.com> wrote:

> On Fri, 22 Sep 2006 14:49:30 +0200, Thomas Kuther wrote:
>=20
> snip...
>=20
> >=20
> > Yes, that was me :)
> > As i seemed to be the only person hitting that bug, i didn't
> > mention it here on the list nor on LKML. I just warned the users in
> > the -beyond and -no sources threads some releases
> > ago ... .17-beyond1 thread IIRC... and stopped using fcache patched
> > kernels, because i like my /usr/portage flying on a reiser4
> > partition ;)
> >=20
> > Regards
> > Tom
>=20
> I passed this along to the beyond maintainer fwiw. Still a very
> disturbing problem. And, it appears, you're not alone. Well, not too
> alone anyway!
>=20
> --=20
> Peter

Looking at the patchlist, Con dropped fcache in 2.6.18-ck1, so if
Iphitus doesn't explicitly add it, future -beyond kernels should be
fine.
But lets clean out this issue somehow. Vladimir, you asked if Peter
runs Gentoo, so seems there is something gentoo vs. reiser4-specific
known, which somewhat explains why it always only busted my /usr
partition. So, if I got that right, reiser4 needs to be fixed for
fcache in -mm so it can deal with portage. No idea if, why and how this
is related, portage on reiser4 with a kernel w/o fcache works like a
charme, so it did the last 2 years here.

And fcache has to be fixed, because if I disable something in the
kernel config, it shouldn't be able to cause such trouble!
This fact is even more annoying than the fact that fcache, portage and
reiser4 don't play well toghether IMHO. But that's OT on this list.

Regards,
Tom



--Sig_p6LKsjzYqT.jYB9bVn7pm9A
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFFE/BzaMf8HmTow1YRArCfAJ94umwRFgdq/PiXiNY/f+NgxtvB/ACfYGLL
TsBAZYv7RHNi+jQNcukdEvI=
=SIJl
-----END PGP SIGNATURE-----

--Sig_p6LKsjzYqT.jYB9bVn7pm9A--
