From: "Burnes, James" <james.burnes@gwl.com>
Subject: RE: Fwd: reiser4 non-free?
Date: Mon, 3 May 2004 11:41:35 -0600
Message-ID: <3DF9165145FACB4C96977FF650C1E9040C469F16@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18396-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, Martin List-Petersen <martin+debian-devel@list-petersen.net>
Cc: Don Armstrong <don@donarmstrong.com>, debian-legal@lists.debian.org, reiserfs-list@namesys.com

Is there any way to do an MD5 of either (1) each module in a software
subsystem or (2) each software version and then have a central registry
where interested developers and users can go to see the credits?

That way you could simply do an MD5 of the current binary and use that
fingerprint to see who wrote and contributed to it.  Much like the CDDB
database takes a track/time fingerprint of CD's and then tells you which
songs and artist made the CD.

This could be a kind of historical registry for developers.  If they
want to they can use it to demonstrate to potential employers,
contractors and/or new IPOs to prove their contributions.

It might also be invaluable to eventual science historians that would
like to research the individuals contributing to certain important
systems.

That would seem to be the scalable way to do it.  You could also include
the credits in the source code, but not require them to be duplicated in
in GPL derived works.

I'm sure there are angles I haven't thought of since I'm running on 3
hours sleep.  Maybe a way to look at binary diffs and say, "this is 95%
similar to ReiserFS Version 4.3, would you like to view the credits for
this system?"

Or something like that.

jim burnes
security engineer
great-west, denver
=20

> -----Original Message-----
> From: Hans Reiser [mailto:reiser@namesys.com]
> Sent: Monday, May 03, 2004 11:05 AM
> To: Martin List-Petersen
> Cc: Don Armstrong; debian-legal@lists.debian.org; reiserfs-
> list@namesys.com
> Subject: Re: Fwd: reiser4 non-free?
>=20
> Martin List-Petersen wrote:
>=20
> >On Sun, 2004-05-02 at 22:55, Don Armstrong wrote:
> >
> >
> >>>>Furthermore, the list of credits are still included (to my
knowledge)
> >>>>in /usr/share/doc/resierfsprogs/README.gz.
> >>>>
> >>>>
> >>>oh, well, that is almost as good as putting them on the dark side
of
> >>>the moon....  a credit read by no one has no meaning.
> >>>
> >>>
> >
> >I don't know what you are reading once you've installed a new program
on
> >your system, but the README, README.Debian and the man-pages are for
me
> >usually the FIRST place, since it might hold valuable information and
> >safe me the trouble, which i may have, if i didn't had read it.
> >
> >
> I never read these (except the man pages) unless the install fails in
> some way (I read the NVIDIA ones many times....), and neither do 99%
of
> real users, including 99% of reiserfs users.  As a user, I can handle
> the distro flashing information on my screen as it installs and I can
> read that, or printing credits when I select a particular package for
> the install, and I can handle a tool printing credits when it starts
up
> (ala mkreiser4) for me to read, but going through a list of 3000
> packages after the install completes and reading their readmes and
> credits files just ain't gonna happen.
>=20
> As a developer, I can probably be talked out of anything that makes
the
> install slower or more awkward or adds more clicks.  If there is
another
> paradigm in place for displaying info about the packages during the
> install (I encourage you to have one), I would most likely be happy to
> conform to that.
>=20
> >So, if you know somebody (including yourself) that doesn't do it I'm
> >really in doubt about the security of your system. There is actually
> >useful information in there.
> >
> >/Martin
> >--
> >The camel has a single hump;
> >The dromedary two;
> >Or else the other way around.
> >I'm never sure.  Are you?
> >                -- Ogden Nash
> >
> >
> >
> >
> >
> >

