From: Bennett Todd <bet@rahul.net>
Subject: user-space cmd/lib to compute hash filename ordering?
Date: Wed, 10 Sep 2003 10:04:51 -0400
Message-ID: <20030910140451.GB6663@rahul.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Return-path: <reiserfs-list-return-15621-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm continuing to work on my new software packaging system.

I'm going to have to make a custom archive-builder, stock cpio isn't
suitable even though the file format will be cpio, since the pkg
creator needs to have explicit control over the owner/group/perms
of the files installed without having the package building user
actually able to set those perms on real files.

Since I'm going to need to create my own cpio file builder, and
since I've decided to teach it how to order files in the archives
(so it can put the metadata and manifest info up at the front for
quick access) I'm thinking it'd be sexy to add a --reiser option
that orders all the files in the archive in reiserfs hash order, so
a simple naive unpack will deposit files in the most efficient
fashion into a Reiserfs filesystem.

Is there a library routine or cmdline utility I can use to compute
this ordering?

Thanks,

-Bennett

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/Xy+DHZWg9mCTffwRAiNYAJ9nzp59etgF0qnBtKj/L3drRplW0QCg10TT
ZaikvlGIADXkuRz9J9jWqdw=
=oIFg
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
