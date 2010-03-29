From: Marcus Becker <Becker_Marcus1@web.de>
Subject: problem with corrupted filesystem
Date: Mon, 29 Mar 2010 18:32:32 +0200 (CEST)
Message-ID: <20393773.244349.1269880352409.JavaMail.fmail@mwmweb061>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: reiserfs-devel@vger.kernel.org

I had some folders left after failed emerge in /var/tmp/portage, so I t=
ried to remove the folders in there and got the error "directory not em=
pty"
I was able to move the subfolder "locale" to my /root folder and then r=
emove the directory with all other subdirectories
in the /root folder I still wasn't able to remove "locale"

After fsck.reiser4 --fix /dev/sda3 problem is solved, here is the relev=
ant output:

disi-laptop ~ # uname -a
Linux disi-laptop 2.6.33-zen1 #3 ZEN SMP Sat Mar 27 17:00:34 GMT 2010=20
i686 Intel(R) Pentium(R) M processor 1.60GHz GenuineIntel GNU/Linux

disi-laptop ~ # mkfs.reiser4 --version
mkfs.reiser4 1.0.7
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by=20
reiser4progs/COPYING.
disi-laptop ~ # ls
locale  xorg.conf.new
disi-laptop ~ # ls -l
total 5
drwx------ 2 root root    4 Mar 27 15:35 locale
-rw-r--r-- 1 root root 3944 Mar 27 15:05 xorg.conf.new
disi-laptop ~ # man ls
disi-laptop ~ # ls -li
total 5
509520 drwx------ 2 root root    4 Mar 27 15:35 locale
1584446 -rw-r--r-- 1 root root 3944 Mar 27 15:05 xorg.conf.new
disi-laptop ~ # mv locale locale_moved
disi-laptop ~ # ls -li
total 5
509520 drwx------ 2 root root    4 Mar 29 16:58 locale_moved
1584446 -rw-r--r-- 1 root root 3944 Mar 27 15:05 xorg.conf.new
disi-laptop ~ # rm -rf locale_moved/
rm: cannot remove `locale_moved': Directory not empty
disi-laptop ~ # ls -lai locale_moved/
total 1
509520 drwx------ 2 root root 4 Mar 29 16:58 .
99103 drwx------ 3 root root 9 Mar 29 16:58 ..
disi-laptop ~ # rmdir locale_moved/
rmdir: failed to remove `locale_moved/': Directory not empty
-- 3 root root 9 Mar 29 16:58 ..

fsck_sda3.log:
=46SCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (411349), item=
 (3),=20
[7c641:6c6f63616c6500:7c650] (stat40): wrong bytes (264), Fixed to (100=
).=20
=46SCK: obj40_repair.c: 350: obj40_stat_lw_check: Node (411349), item (=
3),
[7c641:6c6f63616c6500:7c650] (stat40): wrong size (4), Fixed to (2).=20


disi-laptop ~ # ls
locale_moved  xorg.conf.new
disi-laptop ~ # ls -li
total 5
509520 drwx------ 2 root root    2 Mar 29 16:58 locale_moved
1584446 -rw-r--r-- 1 root root 3944 Mar 27 15:05 xorg.conf.new
disi-laptop ~ # mv locale_moved locale
disi-laptop ~ # ls -li
total 5
509520 drwx------ 2 root root    2 Mar 29 17:20 locale
1584446 -rw-r--r-- 1 root root 3944 Mar 27 15:05 xorg.conf.new
disi-laptop ~ # rm -r locale
disi-laptop ~ # ls -li
total 4
1584446 -rw-r--r-- 1 root root 3944 Mar 27 15:05 xorg.conf.new

Here is the related forum post: http://forums.gentoo.org/viewtopic-p-62=
23315.html#6223315

thanks,

Marcus
___________________________________________________________
WEB.DE DSL: Internet, Telefon und Entertainment f=C3=BCr nur 19,99 EUR/=
mtl.!
http://produkte.web.de/go/02/
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
