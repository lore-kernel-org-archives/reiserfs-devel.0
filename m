From: Anthony DeRobertis <asd@suespammers.org>
Subject: Re: plagiarism of reiserfs by Debian
Date: 21 Apr 2003 22:28:53 -0400
Message-ID: <1050978535.32589.90.camel@bohr>
References: <20030419230654.GF26352@cheney.cx>
	<F592E162-72C9-11D7-ADF3-00050285B655@ncpro.com> 
	<20030420034150.GP32700@zewt.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-EbpeK8hjZ+2lZ9V8kYQe"
Return-path: <reiserfs-list-return-13747-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030420034150.GP32700@zewt.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Cc: debian-devel@lists.debian.org, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>, Vitaly Fertman <vitaly@namesys.com>

--=-EbpeK8hjZ+2lZ9V8kYQe
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-04-19 at 23:41, Glenn Maynard wrote:

> 1. Is software licensed in the manner Hans intends DFSG-free?  That is,
> is it DFSG-free to require that interactive programs output a full

NON-interactive programs. mkreiserfs is not interactive. It is passed
arguments on the command line, makes a file system, and exits.

If there actually is a page full of credits in that usage, then there
are very good reasons to remove it. It makes it very difficult to use in
shell scripts. It makes it difficult to use on terminals w/o limitless
scroll back. It makes it difficult to find error messages, both from it
and other commands.

There is a serious problem with $CMD if the common usage of $CMD turns
out to be:
    $CMD $ARGS > /dev/null 2>&1
If I can't legally fix $CMD, I doubt that $CMD is DFSG-free.

--=-EbpeK8hjZ+2lZ9V8kYQe
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+pKjl+z+IwlXqWf4RAkryAKCHRhWM5TOwHpmd0jqBI9qnWTu2GACeLKqq
jBnDyVLi0VI+GlsqvU3Sf9k=
=InWD
-----END PGP SIGNATURE-----

--=-EbpeK8hjZ+2lZ9V8kYQe--

