From: David B Harris <david@eelf.ddts.net>
Subject: Re: new credit printing mechanism now present in reiserfsprogs
Date: Wed, 23 Jul 2003 04:15:53 -0400
Message-ID: <20030723041553.791f4115.david@eelf.ddts.net>
References: <3F1E3D05.3090309@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha1"; boundary="=.1nDTM+izhP,+BX"
Return-path: <reiserfs-list-return-14999-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F1E3D05.3090309@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: mason <mason@namesys.com>, reiserfs mailing list <reiserfs-list@namesys.com>, Debian Development <debian-devel@lists.debian.org>

--=.1nDTM+izhP,+BX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

(That's a really long recipient list - does this need only go to
reiserfs-list@namesys.com and debian-devel@lists.debian.org?)

On Wed, 23 Jul 2003 11:45:09 +0400
Hans Reiser <reiser@namesys.com> wrote:
> it now prints two random credits rather than all of them, and credits 
> for the developers are in place.  suggestions about how to improve this 
> while preserving the credits (e.g. printing them at a different stage of 
> mkreiserfs, etc.) are welcome.

If mkreiserfs was slower, I would suggest printing them at the start of
the program. It gives people something to read while they're waiting for
it to finish. (They would probably be more likely to read it, too.)

It takes less than 4 seconds on a regular file of 410M here, though, so
that's not a whole lot of time. Does it take longer on bigger
filesystems? Lots of people are making many-gigabyte filesystems these
days, so perhaps that really is a good idea.


--=.1nDTM+izhP,+BX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/HkQ5uCQ/g7GxJcARAmSxAJ9dFxWrnhJP3FIMXQhkXEOmKbfAsgCeNroW
7gryTHXXtYycJrRuFF+tYqE=
=tLm5
-----END PGP SIGNATURE-----

--=.1nDTM+izhP,+BX--
