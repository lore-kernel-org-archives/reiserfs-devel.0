From: Bennett Todd <bet@rahul.net>
Subject: Re: software packaging and ReiserFS v4
Date: Wed, 3 Sep 2003 17:37:42 -0400
Message-ID: <20030903213742.GA13146@rahul.net>
References: <20030903165409.GD4714@rahul.net> <3F565A8F.4010209@botz.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Return-path: <reiserfs-list-return-15536-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F565A8F.4010209@botz.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: J?rgen Botz <jurgen@botz.org>
Cc: reiserfs-list@namesys.com

--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

2003-09-03T17:18:07 J?rgen Botz:
> >With ReiserFS v4 its as natural as can be; a file /usr/bin/foo,
> >installed by a package foo, would simply have a symlink
> >
> >	/usr/bin/foo/pkg -> /var/lib/pkg/foo
> >
> >Besides scaling elegantly and staying wonderfully simple, this has
> >the additional otherwise-impossible feature that the package
> >attribution automatically correctly updates if you move the file
> >(although the forward mappings within /var/lib/pkg/foo wouldn't
> >update automagically).
>=20
> They could, with the right plug-in.

A plug-in to reach in and edit the forward references in the package
database misses my vision of "simple"; I think I'd rather live
without it (after all, we do now) than live with it.

> Without such a plug-in I don't see why you need reiser4 for
> this... [...]

I'd have an executable, /usr/bin/wc, installed by the
textutils-2.0.21-5 package, and its reverse link would be

	/usr/bin/wc/pkg -> /var/lib/pkg/textutils-2.0.21-5

How would you do that without Reiser4's ability to pun the same
pathname as both a file and an associated directory?

> in fact, this kind of scheme has already been implemented
> in some older package managers.  There are several LISA papers
> talking about this kind of thing since the early 90s.  In
> particular the CMU "depot" system comes to mind.

A different vision; I prefer for my /usr/bin/wc to be a real file,
not a symlink to /usr/depot/textutils-2.0.21-5/bin/wc or whatever.
Different people, different tastes:-).

> But take this idea further.... in my ideal system there is no /usr.
> /usr is just a historical artifact, anyway.

It serves some pragmatic roles; distinguishing the minimum needed to
get booted up (/bin, /sbin, ...) from the stuff that's only needed
multiuser (/usr/bin, ...) is sometimes helpful. And a small,
rarely-accessed, readonly / is less prone to damage.

> Nor is there a $HOME.  Depending on your point of view (more
> about that below) there is only /, /bin, [...] The key to this
> are what we might call "perspectives".  Every user has their own
> perspective, or maybe more than one that they can chose between.
> [...]

I _think_ this was big in Plan 9, if I'm not mistaken.

Different folks are game for different things.

I'm rebellious enough to be fantasizing a nice simple software
package manager that can easily allow an rpm user to say "bpm"
instead and have all the same commands work --- or have all but a
couple of them trivially implementable using normal native system
commands for that matter --- by taking advantage of Reiserfs 4's
open-ended attributes dir stuff. But I'm not so sublime about
completely abandoning the Filesystem Heirarchy Standard.

-Bennett

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/Vl8lHZWg9mCTffwRAiNMAJ4p2GiZFa1HMCakHpGQELsVMPpQ8wCeIIsm
YJhcc5aspnVBS4pypoZnifc=
=Uuav
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
