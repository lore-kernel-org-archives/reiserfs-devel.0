From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: Slowdown is gone & apt-get works with updated reiser4. So
	nevermind...
Date: Fri, 11 Nov 2005 15:06:07 -0700
Message-ID: <1131746768.9841.6.camel@localhost>
References: <200511111359.39715.jgilmore@glycou.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-7v1L48/GJlri/sMkAbji"
Return-path: <reiserfs-list-return-26869-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511111359.39715.jgilmore@glycou.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: John Gilmore <jgilmore@glycou.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

--=-7v1L48/GJlri/sMkAbji
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2005-11-11 at 13:59 +0000, John Gilmore wrote:
[snip]
> <rant>
> There is, btw, one main reason that I've decided that whatever trouble it=
 may=20
> cause, and whatever growing pangs I may experience along the way, root=20
> reiser4 is worth it. Does anybody remember GoBack? It was a versioning sy=
stem=20
> for windows 95/98 that was incredibly flexible and useful.
[snip]

I have a "goback" utility for my Linux machines.  It's a 300 GB USB2
drive and rdiff-backup. :)

You could do a similar thing to GoBack with any recent Linux kernel and
inotify, actually.

Create a series of snapshot directories that contain copies of every
file.  Use inotify to watch all changes.  Every 15 minutes update the
snapshots with the changed files.

Or you might be able to hook it into rdiff-backup or something like it,
to update only the changed files every 15 minutes, without needing to do
full disk scans to find the changes.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-7v1L48/GJlri/sMkAbji
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBDdRXPG8fHaOLTWwgRAl+7AJoD6fH6GrUNnYFw8LnbIyh/bibXiQCeKuMX
rjsOROjMbMIqzbIUeurXUjU=
=0otY
-----END PGP SIGNATURE-----

--=-7v1L48/GJlri/sMkAbji--

