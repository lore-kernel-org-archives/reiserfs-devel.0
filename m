From: Paul Wagland <paul@kungfoocoder.org>
Subject: Re: EACCESS vs ENOENT for nonexistent files-within-files
Date: Wed, 15 Sep 2004 15:18:03 +0200
Message-ID: <20040915151803.vl9es48kkosg4k88@www.wagland.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=_72e0bpotdpts";
	protocol="application/pgp-signature"; micalg="pgp-sha1"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21757-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <nikita@clusterfs.com>
Cc: evilninja <evilninja@gmx.net>, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>

--=_72e0bpotdpts
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Wed 15 Sep 2004 01:41:40 PM CEST, Nikita Danilov wrote:
> evilninja writes:
>  > evil@prinz:/tmp$ touch file.txt
>  > evil@prinz:/tmp$ cat file.txt/.htaccess
>  > cat: file.txt/.htaccess: Not a directory
>  > evil@prinz:/tmp$ chmod +x file.txt
>  > evil@prinz:/tmp$ cat file.txt/.htaccess
>  > cat: file.txt/.htaccess: Not a directory
>
> But in reiser4 file.txt _is_ a directory. That's the whole point: it
> contains other objects inside.

[...]

> This is very simple: do be able to do a lookup one needs +x bit. No +x
> bit--no lookup. No lookup---impossible to determine exists .htaccess or
> not.
>
> Permission bits determine what operations are possible on
> object. Letting user to know that .htaccess doesn't exist while
> permission bits on parent explicitly disable lookups is a security
> hole.

I'm sorry to be so blunt on this... but this is just plain dumb. Really. For as
long as I have known, an executable bit on a file means that you can "execute"
that file. Now  you try to say, yeah, that, but as well, it means whether or
not you can access the files attributes?

Seriously. What were you thinking?

Does this mean (for example) that on a sgid file, only the group can see the
attributes? Even if the file is world readable? Does this really make sense?

Here is the rub... you are breaking the rules of "one object - one purpose".
Surely this is not how it is meant to be? On a file, the execute bit is meant
for "can I run this file". On a dir, this bit is for "Can I see inside this
directory". They do not match!

Paul.

--=_72e0bpotdpts
Content-Type: application/pgp-signature
Content-Description: PGP Digital Signature
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBSEELtch0EvEFvxURArI3AJ4iJnxPTvX2+cAl8fIS2+U9CM1a2gCbBW2J
8P9XVZTdTkTyZxQt8g2xyXs=
=WcQk
-----END PGP SIGNATURE-----

--=_72e0bpotdpts--
