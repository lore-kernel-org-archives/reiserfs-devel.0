From: Mike Benoit <mikeb@netnation.com>
Subject: Reiser4 input/output errors...
Date: Mon, 01 Sep 2003 14:53:01 -0700
Message-ID: <1062453181.2791.17.camel@mikeb.staff.netnation.com>
Reply-To: mikeb@netnation.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15507-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I assume this isn't supposed to happen?

[root@mikeb home]# mkfs.reiser4 /dev/hda8
mkfs.reiser4 0.4.12
Copyright (C) 2001, 2002, 2003 by Hans Reiser, licensing governed by
reiser4progs/COPYING.

Information: Reiser4 is going to be created on /dev/hda8.
(Yes/No): Yes
Creating reiser4 on /dev/hda8...done
Synchronizing /dev/hda8...done

[root@mikeb home]# mount -t reiser4 /dev/hda8 /home/test2
[root@mikeb test2]# cd /home/test2
[root@mikeb test2]# cp /usr/src/linux-2.6.0-test4.tar.bz2 ./
[root@mikeb test2]# tar jxf linux-2.6.0-test4.tar.bz2

[root@mikeb test2]# rm -rf linux-2.6.0-test4/
rm: reading directory `linux-2.6.0-test4//drivers/net/e100':
Input/output error
rm: reading directory `linux-2.6.0-test4//drivers/net/sk98lin':
Input/output error
rm: cannot remove directory `linux-2.6.0-test4//drivers/net': Directory
not empty

I tried this on two different partitions (/dev/hda7 and /dev/hda8) the
exact same files had the error on both, so it seems to be reproducible.
It does however work fine if I use ext3 on the said partitions. This is
a brand new HD (about a week old) so I doubt it has any bad blocks
(badblocks /dev/hda8 doesn't report anything).

[root@mikeb home]# mkfs.reiser4 --version
mkfs.reiser4 0.4.12

Kernel: 2.6.0-test4 #5 Mon Sep 1 14:20:14 PDT 2003 i686 unknown unknown
GNU/Linux

CONFIG_REISER4_FS=y
CONFIG_REISER4_LARGE_KEY=y

CPU:
cpu family      : 6
model           : 8
model name      : AMD Athlon(tm) Processor
stepping        : 1
cpu MHz         : 1662.612
cache size      : 256 KB

Distro: Mandrake 9.2beta.


-- 
Best Regards,
 
Mike Benoit


