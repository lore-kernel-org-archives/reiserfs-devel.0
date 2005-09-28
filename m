From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: iosched (was Re: Full of surprises - A reiser4 story from
	userland)
Date: Wed, 28 Sep 2005 16:20:36 -0600
Message-ID: <1127946036.10565.111.camel@localhost>
References: <1127914812.12894.96.camel@laptop>
	 <200509281825.49873.vitaly@namesys.com> <1127921286.12894.106.camel@laptop>
	 <433ABD7B.1010903@slaphack.com> <1127932340.12894.149.camel@laptop>
	 <5d8b7b90509281213c95e30c@mail.gmail.com>
	 <200509281952.j8SJq9Uo007371@turing-police.cc.vt.edu>
	 <433AFDF6.3070404@namesys.com> <5a59ce53050928143267c9d779@mail.gmail.com>
	 <5a59ce53050928143341084b5b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-7+ZpHAkX6YuBf6+vUpux"
Return-path: <reiserfs-list-return-26326-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5a59ce53050928143341084b5b@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: studdugie <studdugie@gmail.com>
Cc: reiserfs-list@namesys.com

--=-7+ZpHAkX6YuBf6+vUpux
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2005-09-28 at 17:33 -0400, studdugie wrote:
> On 9/28/05, Hans Reiser <reiser@namesys.com> wrote:
> >  Check out the latest cfq in the latest kernel, it is much better than
> > the others for most applications.  Anticipatory used to be the best, bu=
t
> > cfq-3 is better now.
> >
> When you say the best is that a general conclusion for both single
> disks and RAID?

I find (but no hard data to provide) that no-op or deadline seems to
work best when working with an intelligent RAID controller.  Just push
the queue to the controller and it'll sort out the best way to get
things.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-7+ZpHAkX6YuBf6+vUpux
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBDOxc0G8fHaOLTWwgRAqvTAJ9vD9glAI6WcKw+QOzPzbM3s6TsQQCfXPJ9
Roz/b4+97/4CciBSdbVEjQU=
=XDir
-----END PGP SIGNATURE-----

--=-7+ZpHAkX6YuBf6+vUpux--

