From: Bennett Todd <bet@rahul.net>
Subject: Re: software packaging and ReiserFS v4
Date: Wed, 3 Sep 2003 21:28:46 -0400
Message-ID: <20030904012846.GA1825@rahul.net>
References: <20030903165409.GD4714@rahul.net> <3F565A8F.4010209@botz.org> <20030903213742.GA13146@rahul.net> <3F566284.40406@botz.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Return-path: <reiserfs-list-return-15540-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F566284.40406@botz.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: J?rgen Botz <jurgen@botz.org>
Cc: reiserfs-list@namesys.com

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2003-09-03T17:52:04 J?rgen Botz:
> Bennett Todd wrote:
> >>>(although the forward mappings within /var/lib/pkg/foo wouldn't
> >>>update automagically).
> >>
> >>They could, with the right plug-in.
> >
> >A plug-in to reach in and edit the forward references in the package
> >database misses my vision of "simple";
>
> There is no need for a separate "package database" with your
> scheme.  What is the package database but the contents of your
> 'pkg' directory?

The package database is the contents of /var/lib/pkg/ --- files,
each nearly completely documenting one package, with addenda as
needed under each --- plus the symlinks under each installed file
back representing the inverse map.

> Your links (/usr/bin/program/pkg -> /pkg/program/...) provide the
> inversion.  You only need a plug-in to make this "symbolic link"
> something that gets atomically changed at both ends.

The problem is that the forward maps aren't a symlink, they're text
files enumerating the contents of the package together with
attributes (is this a doc file, a config file, ...) and the
checksums table (a text file, w/ full pathnames and sha1 sums in
hex); that last usually signed by a detached OpenPGP sig.

> I can only paraphrase Hans: The filesystem *is* the database.

More than before, yes, but I don't quite see how it's practical for
it to be _every_ database.

-Bennett

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/VpVOHZWg9mCTffwRAhSHAJwJrOtnZTcgCFXv3kb4w8AZs4dA3wCgpTuZ
eOPRfFQ8k94fzf96URz0pAg=
=aaWn
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
