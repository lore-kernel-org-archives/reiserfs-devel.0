From: Bennett Todd <bet@rahul.net>
Subject: Re: production use of reiserfs
Date: Mon, 1 Dec 2003 12:54:03 -0500
Message-ID: <20031201175403.GC545@rahul.net>
References: <200311280846.12697.ivan@t1.unisoftbg.com> <1070291978.4355.6.camel@redeeman.linux.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Return-path: <reiserfs-list-return-16195-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1070291978.4355.6.camel@redeeman.linux.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Redeeman <redeeman@metanurb.dk>
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2003-12-01T10:19:39 Redeeman:
> i feel that the linux filesystems is much more unstable after a
> power failure than windows filesystens, but in advance they are
> much faster.

In advance they're much faster because they're much more
sophisticated, with a great deal of design and implementation
focused on making them fast. Until this additional complexity is
very well debugged, they can be more fragile. ext2 is quite robust,
and I've found ext3 to be bulletproof on crashing machines.

Reiserfs is more sophisticated yet, but it has hit a quite stable
plateau; current kernel + current reiserfsprogs = very robust, with
one notable caveat: reiserfs does more critical and elaborate
computation than other filesystems, so it has acquired a reputation
for flushing hardware bugs out of the wainscotting.

If you're using reiserfs in a current prod kernel on a filesystem
built with current reiserfsprogs, and you see a crash, look for a
hardware problem. If reiserfs crashes when ext3 doesn't, look
especially hard for marginal CPU or memory that gets flaky when it's
rode hard.

> but ofcourse, windows filesystems are made to be crash proof.

If Linux crashed as often as Windows, all our filesystems would be
as robust in the face of crashes as vfat. Practice makes perfect.

-Bennett

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/y4A7HZWg9mCTffwRAvH2AKDNlWCK7gDMD4vTJp7DfAVc8aItugCfaX6n
dnMTtpVcsVYWI4UDA+bGmU0=
=DzOl
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--
