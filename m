From: Stewart Smith <stewart@flamingspork.com>
Subject: Re: Fwd: reiser4 non-free?
Date: Fri, 30 Apr 2004 18:34:11 +1000
Message-ID: <1083314051.23952.2.camel@faith>
References: <20040424193246.GA2490@raptus.homelinux.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-VK356yEbVvMKEjCm5mMv"
Return-path: <reiserfs-list-return-18311-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040424193246.GA2490@raptus.homelinux.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Domenico Andreoli <cavok@tiscali.it>
Cc: Hans Reiser <reiser@namesys.com>, Sami Liedes <sliedes@cc.hut.fi>, ed@debian.org, debian-legal@lists.debian.org, reiserfs-list@namesys.com

--=-VK356yEbVvMKEjCm5mMv
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sun, 2004-04-25 at 05:32, Domenico Andreoli wrote:
> > Also, a clustering file system built to work on top of this file
> > system shall be considered a derivative work for the purposes of
> > interpreting the GPL license granted herein.  Plugins are also to be
> > considered derivative works.  Share code or pay money, we give you the
> > choice.
>=20
> Surely a license cannot add anything to the set of derived works (if
> the other work is not derived, the license obviously doesn't apply to
> it and hence never gets to say it is derived; if it is, it is even
> without the license saying so). However I believe -legal has not
> considered text like this a problem before (I might be wrong though).

It doesn't "add", it clarifies. i.e. if you build a clustered file
system that does stuff specific to reiserfs (e.g. use the reiser4
syscall), then that will be considered a derived work, and must be
distributable under the GPL.

Sure, you could go to court and argue that it isn't - but namesys have a
clear clarification of what they consider, so I hope your lawyer is good
:)

Think of it in the same light as the clarification in the kernel's copy
of the GPL saying that userspace programs aren't derived. except here
it's the other way around.
--=20
Stewart Smith (stewart@flamingspork.com)
http://www.flamingspork.com/


--=-VK356yEbVvMKEjCm5mMv
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAkg+C3tgLgERgy8oRAjzeAJ9CI94t44nDc8Ea8qaUHsOo7Y+wIQCdEEOf
JzxMqpf67iNA9iAs5owFaNw=
=yxG1
-----END PGP SIGNATURE-----

--=-VK356yEbVvMKEjCm5mMv--

