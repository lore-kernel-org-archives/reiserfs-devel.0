From: Bennett Todd <bet@rahul.net>
Subject: software packaging and ReiserFS v4
Date: Wed, 3 Sep 2003 12:54:09 -0400
Message-ID: <20030903165409.GD4714@rahul.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Return-path: <reiserfs-list-return-15531-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've got this thought that ReiserFS v4 may make it possible to
implement a _really_ trivial software package management system,
with even better power than rpm.

I'm building myself a new Linux distrib; my proximate motivation is
that while there's lots I like about Red Hat --- in particular, rpm
is the best software package mgmt tool I've used or heard of ---
there's still a lot of accumulated cruft there.

As I've gotten deeper into the project, I've had my nose rubbed in
the fact that rpm is the accumulating cruft heart; it's the worst.
Way, way overdue for a rewrite.

So I started fantasizing about the replacement. Some bits are easy;
rather than trying to write a parser for yet another poorly
documented subtle and complex file format like rpm spec files, the
spec file will simply be a Lua <URL:http://www.lua.org/> source file
that exports the necessary data.

Then I started thinking about the database that a good software
packging tool needs to maintain. After a bit, it hit me that
ReiserFS 4 would be _killer_!

Let the package install process deposit the "spec file" (lua data
decl) in /var/lib/pkg/{pkgname}. Addenda like e.g. the checksums,
and pre- and post-install scripts can be
/var/lib/pkg/{pkgname}/sha1, /var/lib/pkg/{pkgname}/pre,
/var/lib/pkg/{pkgname}/post, etc. Whatever open-ended addenda the
package should wish to keep track of on a per-package basis can be
simply added there.

The one tricky bit --- and it's the performance downfall of the
current rpm --- is the reverse-mapping database, the one that maps a
pathname of an installed file to the package that installed it.
Maintaining that, and ensuring its consistency with the forward
database, makes rpm slow.

With ReiserFS v4 its as natural as can be; a file /usr/bin/foo,
installed by a package foo, would simply have a symlink

	/usr/bin/foo/pkg -> /var/lib/pkg/foo

Besides scaling elegantly and staying wonderfully simple, this has
the additional otherwise-impossible feature that the package
attribution automatically correctly updates if you move the file
(although the forward mappings within /var/lib/pkg/foo wouldn't
update automagically).

I'm continuing to do the preliminary, basic dev of my new distrib on
Reiser 3 w/ rpm, because they're what I've got, but when v4 comes
around I'm seriously hoping to re-wrap the whole schmeer taking full
advantage of v4 to make a very simple new package manager.

-Bennett

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/VhyxHZWg9mCTffwRAjiBAJwJUlu5fyKhYrIgu1TpmCnxWA+XugCfWXWA
Ue3FcstpLIMCAMCgbXVh6fU=
=1fUO
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
