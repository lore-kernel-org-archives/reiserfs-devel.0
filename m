From: Valdis.Kletnieks@vt.edu
Subject: Re: error compiling reiserfsprogs
Date: Wed, 30 Apr 2003 17:24:44 -0400
Message-ID: <200304302124.h3ULOi5J009954@turing-police.cc.vt.edu>
References: <00e001c30f5a$91f71bf0$0f02a8c0@observer>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_915987416P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13909-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Wed, 30 Apr 2003 13:53:36 PDT."
             <00e001c30f5a$91f71bf0$0f02a8c0@observer> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Network Operations <downtown@cwo.com>
Cc: reiserfs-list@namesys.com

--==_Exmh_915987416P
Content-Type: text/plain; charset=us-ascii

On Wed, 30 Apr 2003 13:53:36 PDT, Network Operations <downtown@cwo.com>  said:
> Hello,
> 
> When I try to compile reiserfsprogs-3.6.6 on Slackware linux 8.1 (kernel
> 2.4.20) I receive the errors below (second paragraph).

> gcc -DHAVE_CONFIG_H -I. -I. -I../include     -g -O2 -Wall -c `test -f 'io.c'
> || echo './'`io.c
> In file included from /usr/include/bits/errno.h:25,
>                  from /usr/include/errno.h:36,
>                  from io.c:9:
> /usr/include/linux/errno.h:4: asm/errno.h: No such file or directory

Did you symlink /usr/include/linux to /usr/src/linux-2.whatever/include?

If so, don't do that. ;)

Did you install whatever kernel-headers package your release of *GCC* (*not*
the kernel itself) wants installed?  If not, do so.

Userspace compiles with the userspace /usr/include/linux, because it has
to match what glibc thinks of the world.

Kernel space compiles with the kernel headers, because it has to match what
the rest of the kernel thinks of the world.

Mix the two at your own risk.

--==_Exmh_915987416P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE+sD8ccC3lWbTT17ARAqgAAJ9q69JQeide8kdWM94yN5OlhZUBlACgzkLV
vkDdj4uxmzzVDMzGXQKV028=
=CBw4
-----END PGP SIGNATURE-----

--==_Exmh_915987416P--
