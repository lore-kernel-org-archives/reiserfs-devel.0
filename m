From: Bennett Todd <bet@rahul.net>
Subject: Re: Carrying Attributes too Far
Date: Fri, 19 Sep 2003 09:46:31 -0400
Message-ID: <20030919134631.GG544@rahul.net>
References: <3F6A1606.9070707@mrs.umn.edu> <7936815179-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Az4VpBrmI9+OyhK/"
Return-path: <reiserfs-list-return-15704-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <7936815179-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

--Az4VpBrmI9+OyhK/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2003-09-18T17:44:13 Alexander G. M. Smith:
> They need to be hidden sometimes. [...] Or be prepared for them to
> make a mess, like storing all their e-mail inside an attribute on
> an e-mail icon.

And that thought provoked some pondering in me.

I've been thinking about these new semantics in Reiserfs v4 in terms
of the ability to take a file, and attach some addenda on it by
viewing it as a directory instead.

As a Maildir user, your above comment turned that view upside down
--- you're saying someone will attach an icon to the directory that
happens to be their Maildir folder. Viewing directories (non-leaf
nodes of the tree) as files is the dual, the same concept viewed
backwards, as viewing files (leaves) as directories.

There's a nice satisfying generality to this vision, but I'm sorta
pondering, what semantics are right to show in the POSIX API?

For attributes like owner/group/perm, clearly they get projected
into the pretend inode structure for the file they're attached to,
the file shows up as a file, not a directory, when you stat it, so
archivers like tar, tree-walkers like find, directory listers like
ls, etc. see what they expect.

If someone were to want to attach an icon to a directory describing
what it contained, that'd be an opposite case; stat should still
report the internal node as a directory, you shouldn't see the icon
unless you explicitly tried to open that internal node with a file
open syscall.

Perhaps this distinction makes it a little more concrete what sorts
of uses of this file/directory duality are going to be good
engineering? Or is it just that only a subset of Reiserfs V4's
brilliant new semantics will remain a good, comfortable fit for
POSIX semantic expectations, able to be cleanly and pleasantly
reflected back through a compatibility layer; more daring
applications will depart more pervasively from POSIX.

If both sorts of operations I described above are going to be
permissible and possible, its at least easy to distinguish which
view should be reflected back through the compatibility api --- that
would be, whichever view was created first. If you create a file
then attach attributes to it, it'll show up as a file. If you create
a directory then attach a file to it, it'll show up as a directory.

-Bennett

--Az4VpBrmI9+OyhK/
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/awi3HZWg9mCTffwRAulbAJ459ZjjuXe2Sa5KTllLxVAUQsCLxACgpe8Y
v9XCWbULp/QTG0/5wsh2IpI=
=zuWJ
-----END PGP SIGNATURE-----

--Az4VpBrmI9+OyhK/--
