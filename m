From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: compilation issue with reiser4progs-0.4.20
Date: Fri, 26 Dec 2003 22:53:32 +0100
Message-ID: <3FECADDC.2070007@free.fr>
References: <3FEB5FE0.7020805@free.fr> <3FEB84EE.3040301@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16407-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FEB84EE.3040301@libero.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Domenico Andreoli wrote:
| Laurent Riffard wrote:
|
|> I tried it because it was noticed in
|> http://thebsh.namesys.com/snapshots/LATEST/READ.ME. I had the
|> following output :
|>
|> reiser4progs-0.4.20$ ./prepare
|> Running aclocal...
|> Running autoheader...
|> Running autoconf...
|> Running automake --add-missing...
|> automake: libreiser4/Makefile.am: warning: automake does not
|> support libreiser4_alone_la_LDFLAGS being defined conditionally
|>
| hi Laurent,
|
| probably you want to upgrade your automake, i use version 1.7.9
and i've
| no problems.
|
| cheers
| dom
|
| -----[ Domenico Andreoli, aka cavok
|  --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
|    ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50


Hi Domenico

You were right, I needed to upgrade automake. For Mandrake 9.2 users :
# urpmi automake1.7
# update-alternatives --config automake
Now, "prepare" runs without any warnings.

Thanks for your help
- --
laurent


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE/7K3cUqUFrirTu6IRAoP6AKCU2G9xXPngNgzWYNLHjBfXmD1j8QCfbgD8
xEsAa+K7+KmbmoseGBJ6nTo=
=ILX2
-----END PGP SIGNATURE-----

