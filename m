From: Laurent Riffard <laurent.riffard@free.fr>
Subject: compilation issue with reiser4progs-0.4.20
Date: Thu, 25 Dec 2003 23:08:32 +0100
Message-ID: <3FEB5FE0.7020805@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16405-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Hi

I just want to inform you with the following issue : if you try to
~ compile reiser4progs-0.4.20 and type "./prepare" before
"./configure" (without any option), it won't compile.

I tried it because it was noticed in
http://thebsh.namesys.com/snapshots/LATEST/READ.ME. I had the
following output :

reiser4progs-0.4.20$ ./prepare
Running aclocal...
Running autoheader...
Running autoconf...
Running automake --add-missing...
automake: libreiser4/Makefile.am: warning: automake does not
support libreiser4_alone_la_LDFLAGS being defined conditionally

As a consequence, the macro libnode40_static_la_CFLAGS is defined
in the Makefiles with "-DENABLE_LARGE_KEY -DENABLE_SHORT_KEY" but
it is not used in the compilation command line. And compilation of
plugin/node/node40/node40.c will fail.

Just untar the tarball, apply the patch from
http://marc.theaimsgroup.com/?l=reiserfs&m=107237319006797&w=2 ,
and "./configure" works for me.

- --
laurent
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE/61/gUqUFrirTu6IRAhj3AJ9dsCOecaFPIy6Ox6eWDUdRgbqhGwCfS4bP
HJBqBJijQMDgJ/YgC11yer4=
=T7F/
-----END PGP SIGNATURE-----

