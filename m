From: Mike Benoit <mikeb@netnation.com>
Subject: Re: Reiser4 input/output errors...
Date: Tue, 02 Sep 2003 09:37:59 -0700
Message-ID: <1062520679.1971.4.camel@mikeb.staff.netnation.com>
References: <1062453181.2791.17.camel@mikeb.staff.netnation.com>
	 <1062479004.31361.3.camel@haron.namesys.com>
Reply-To: mikeb@netnation.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15514-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1062479004.31361.3.camel@haron.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yury Umanets <umka@namesys.com>
Cc: reiserfs-list@namesys.com

Here is the debug output when I mount the partition, and try deleting
the files that caused an input/output error before.

Sep  2 09:32:06 mikeb kernel: ================ fs info (mount ok)
=================
Sep  2 09:32:06 mikeb kernel: root block: 44467
Sep  2 09:32:06 mikeb kernel: tree height: 3
Sep  2 09:32:06 mikeb kernel: Oids: next to use 81385, in use 59
Sep  2 09:32:06 mikeb kernel: Block counters:
Sep  2 09:32:06 mikeb kernel: ^Iblock count^I1394308
Sep  2 09:32:06 mikeb kernel: ^Ifree blocks^I1385737
Sep  2 09:32:06 mikeb kernel: ^Iused blocks^I8571
Sep  2 09:32:06 mikeb kernel: ^Igrabbed^I0
Sep  2 09:32:06 mikeb kernel: ^Ifake allocated formatted^I0
Sep  2 09:32:06 mikeb kernel: ^Ifake allocated unformatted^I0
Sep  2 09:32:06 mikeb kernel: Root directory key: (29:1:0:0:2a:0)[stat
data]
Sep  2 09:32:06 mikeb kernel: Diskmap is not present
Sep  2 09:32:06 mikeb kernel: =========== disk format info (reiser40)
=============
Sep  2 09:32:32 mikeb kernel: readdir: inode: 42 offset: 0
Sep  2 09:32:32 mikeb kernel: readdir: (0:0:0:0:0:0)[]
Sep  2 09:32:32 mikeb kernel:  pos: 0 entry_no: 0
Sep  2 09:32:32 mikeb kernel: readdir: ., 1, 42
Sep  2 09:32:32 mikeb kernel: readdir: entry: offset: 0
Sep  2 09:32:32 mikeb kernel: readdir: .., 2, 42
Sep  2 09:32:32 mikeb kernel: readdir: entry: offset: 1
Sep  2 09:32:32 mikeb kernel: readdir: linux-2.6.0-test4, 3, 65537
Sep  2 09:32:32 mikeb kernel: readdir: entry: offset: 2
Sep  2 09:32:32 mikeb kernel: readdir: linux-2.6.0-test4.tar.bz2, 4,
65536
Sep  2 09:32:32 mikeb kernel: readdir: entry: offset: 3
Sep  2 09:32:32 mikeb kernel: readdir_exit: offset: 4
Sep  2 09:32:32 mikeb kernel: lookup inode: 42 "linux-2.6.0-test4"
Sep  2 09:32:32 mikeb kernel: [2607]: check_item: "linux-2.6.0-test4",
"linux-2.6.0-test4" in 42 (44469)
Sep  2 09:32:32 mikeb kernel: lookup inode: 42
"linux-2.6.0-test4.tar.bz2"
Sep  2 09:32:32 mikeb kernel: [2607]: check_item:
"linux-2.6.0-test4.tar.bz2", "linux-2.6.0-test4.tar.bz2" in 42 (44469)
Sep  2 09:32:32 mikeb kernel: readdir: inode: 42 offset: 4
Sep  2 09:32:32 mikeb kernel: readdir:
(0:0:16c696e75782d32:2:e362e302d746573:2deb20078b0e)[^Alinux-2.6.0-tes...]
Sep  2 09:32:32 mikeb kernel:  pos: 0 entry_no: 3
Sep  2 09:32:32 mikeb kernel: readdir_exit: offset: 4
Sep  2 09:32:37 mikeb kernel: readdir: inode: 65537 offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: (0:0:0:0:0:0)[]
Sep  2 09:32:37 mikeb kernel:  pos: 0 entry_no: 0
Sep  2 09:32:37 mikeb kernel: readdir: ., 1, 65537
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: .., 2, 42
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 1
Sep  2 09:32:37 mikeb kernel: readdir: drivers, 3, 65538
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 2
Sep  2 09:32:37 mikeb kernel: readdir_exit: offset: 3
Sep  2 09:32:37 mikeb kernel: lookup inode: 65537 "drivers"
Sep  2 09:32:37 mikeb kernel: [2608]: check_item: "drivers", "drivers"
in 65537 (8088)
Sep  2 09:32:37 mikeb kernel: readdir: inode: 65538 offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: (0:0:0:0:0:0)[]
Sep  2 09:32:37 mikeb kernel:  pos: 0 entry_no: 0
Sep  2 09:32:37 mikeb kernel: readdir: ., 1, 65538
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: .., 2, 65537
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 1
Sep  2 09:32:37 mikeb kernel: readdir: net, 3, 65841
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 2
Sep  2 09:32:37 mikeb kernel: readdir_exit: offset: 3
Sep  2 09:32:37 mikeb kernel: lookup inode: 65538 "net"
Sep  2 09:32:37 mikeb kernel: [2608]: check_item: "net", "net" in 65538
(8088)
Sep  2 09:32:37 mikeb kernel: readdir: inode: 65841 offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: (0:0:0:0:0:0)[]
Sep  2 09:32:37 mikeb kernel:  pos: 0 entry_no: 0
Sep  2 09:32:37 mikeb kernel: readdir: ., 1, 65841
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: .., 2, 65538
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 1
Sep  2 09:32:37 mikeb kernel: readdir: e100, 3, 66000
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 2
Sep  2 09:32:37 mikeb kernel: readdir: sk98lin, 4, 65843
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 3
Sep  2 09:32:37 mikeb kernel: readdir_exit: offset: 4
Sep  2 09:32:37 mikeb kernel: lookup inode: 65841 "e100"
Sep  2 09:32:37 mikeb kernel: [2608]: check_item: "e100", "e100" in
65841 (8088)
Sep  2 09:32:37 mikeb kernel: readdir: inode: 66000 offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: (0:0:0:0:0:0)[]
Sep  2 09:32:37 mikeb kernel:  pos: 0 entry_no: 0
Sep  2 09:32:37 mikeb kernel: readdir_exit: offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: inode: 65841 offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: (0:0:0:0:0:0)[]
Sep  2 09:32:37 mikeb kernel:  pos: 0 entry_no: 0
Sep  2 09:32:37 mikeb kernel: readdir: ., 1, 65841
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: .., 2, 65538
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 1
Sep  2 09:32:37 mikeb kernel: readdir: e100, 3, 66000
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 2
Sep  2 09:32:37 mikeb kernel: readdir: sk98lin, 4, 65843
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 3
Sep  2 09:32:37 mikeb kernel: readdir_exit: offset: 4
Sep  2 09:32:37 mikeb kernel: lookup inode: 65841 "sk98lin"
Sep  2 09:32:37 mikeb kernel: [2608]: check_item: "sk98lin", "sk98lin"
in 65841 (8088)
Sep  2 09:32:37 mikeb kernel: readdir: inode: 65843 offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: (0:0:0:0:0:0)[]
Sep  2 09:32:37 mikeb kernel:  pos: 0 entry_no: 0
Sep  2 09:32:37 mikeb kernel: readdir_exit: offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: inode: 65841 offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: (0:0:0:0:0:0)[]
Sep  2 09:32:37 mikeb kernel:  pos: 0 entry_no: 0
Sep  2 09:32:37 mikeb kernel: readdir: ., 1, 65841
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: .., 2, 65538
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 1
Sep  2 09:32:37 mikeb kernel: readdir: e100, 3, 66000
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 2
Sep  2 09:32:37 mikeb kernel: readdir: sk98lin, 4, 65843
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 3
Sep  2 09:32:37 mikeb kernel: readdir_exit: offset: 4
Sep  2 09:32:37 mikeb kernel: readdir: inode: 65841 offset: 4
Sep  2 09:32:37 mikeb kernel: readdir:
(0:0:736b39386c696e:0:0:0)[sk98lin]
Sep  2 09:32:37 mikeb kernel:  pos: 0 entry_no: 3
Sep  2 09:32:37 mikeb kernel: readdir_exit: offset: 4
Sep  2 09:32:37 mikeb kernel: unlink: 65538/net
Sep  2 09:32:37 mikeb kernel: readdir: inode: 65538 offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: (0:0:0:0:0:0)[]
Sep  2 09:32:37 mikeb kernel:  pos: 0 entry_no: 0
Sep  2 09:32:37 mikeb kernel: readdir: ., 1, 65538
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: .., 2, 65537
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 1
Sep  2 09:32:37 mikeb kernel: readdir: net, 3, 65841
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 2
Sep  2 09:32:37 mikeb kernel: readdir_exit: offset: 3
Sep  2 09:32:37 mikeb kernel: readdir: inode: 65538 offset: 3
Sep  2 09:32:37 mikeb kernel: readdir: (0:0:6e657400000000:0:0:0)[net]
Sep  2 09:32:37 mikeb kernel:  pos: 0 entry_no: 2
Sep  2 09:32:37 mikeb kernel: readdir_exit: offset: 3
Sep  2 09:32:37 mikeb kernel: readdir: inode: 65537 offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: (0:0:0:0:0:0)[]
Sep  2 09:32:37 mikeb kernel:  pos: 0 entry_no: 0
Sep  2 09:32:37 mikeb kernel: readdir: ., 1, 65537
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 0
Sep  2 09:32:37 mikeb kernel: readdir: .., 2, 42
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 1
Sep  2 09:32:37 mikeb kernel: readdir: drivers, 3, 65538
Sep  2 09:32:37 mikeb kernel: readdir: entry: offset: 2
Sep  2 09:32:37 mikeb kernel: readdir_exit: offset: 3
Sep  2 09:32:37 mikeb kernel: readdir: inode: 65537 offset: 3
Sep  2 09:32:37 mikeb kernel: readdir:
(0:0:64726976657273:0:0:0)[drivers]
Sep  2 09:32:37 mikeb kernel:  pos: 0 entry_no: 2
Sep  2 09:32:37 mikeb kernel: readdir_exit: offset: 3


[root@mikeb e100]# pwd
/home/test2/linux-2.6.0-test4/drivers/net/e100
[root@mikeb e100]# ls -l
ls: reading directory .: Input/output error
total 0

Sep  2 09:35:17 mikeb kernel: readdir: inode: 66000 offset: 0
Sep  2 09:35:17 mikeb kernel: readdir: (0:0:0:0:0:0)[]
Sep  2 09:35:17 mikeb kernel:  pos: 0 entry_no: 0
Sep  2 09:35:17 mikeb kernel: readdir_exit: offset: 0


On Mon, 2003-09-01 at 22:03, Yury Umanets wrote:
> On Tue, 2003-09-02 at 01:53, Mike Benoit wrote:
> > I assume this isn't supposed to happen?
> > 
> > [root@mikeb home]# mkfs.reiser4 /dev/hda8
> > mkfs.reiser4 0.4.12
> > Copyright (C) 2001, 2002, 2003 by Hans Reiser, licensing governed by
> > reiser4progs/COPYING.
> > 
> > Information: Reiser4 is going to be created on /dev/hda8.
> > (Yes/No): Yes
> > Creating reiser4 on /dev/hda8...done
> > Synchronizing /dev/hda8...done
> > 
> > [root@mikeb home]# mount -t reiser4 /dev/hda8 /home/test2
> > [root@mikeb test2]# cd /home/test2
> > [root@mikeb test2]# cp /usr/src/linux-2.6.0-test4.tar.bz2 ./
> > [root@mikeb test2]# tar jxf linux-2.6.0-test4.tar.bz2
> > 
> > [root@mikeb test2]# rm -rf linux-2.6.0-test4/
> > rm: reading directory `linux-2.6.0-test4//drivers/net/e100':
> > Input/output error
> > rm: reading directory `linux-2.6.0-test4//drivers/net/sk98lin':
> > Input/output error
> > rm: cannot remove directory `linux-2.6.0-test4//drivers/net': Directory
> > not empty
> > 
> > I tried this on two different partitions (/dev/hda7 and /dev/hda8) the
> > exact same files had the error on both, so it seems to be reproducible.
> > It does however work fine if I use ext3 on the said partitions. This is
> > a brand new HD (about a week old) so I doubt it has any bad blocks
> > (badblocks /dev/hda8 doesn't report anything).
> > 
> > [root@mikeb home]# mkfs.reiser4 --version
> > mkfs.reiser4 0.4.12
> > 
> > Kernel: 2.6.0-test4 #5 Mon Sep 1 14:20:14 PDT 2003 i686 unknown unknown
> > GNU/Linux
> > 
> > CONFIG_REISER4_FS=y
> > CONFIG_REISER4_LARGE_KEY=y
> > 
> > CPU:
> > cpu family      : 6
> > model           : 8
> > model name      : AMD Athlon(tm) Processor
> > stepping        : 1
> > cpu MHz         : 1662.612
> > cache size      : 256 KB
> > 
> > Distro: Mandrake 9.2beta.
> 
> There is something interesting in kernel logs?
-- 
Best Regards,
 
Mike Benoit
NetNation Communications Inc.
Systems Engineer
Tel: 604-684-6892 or 888-983-6600
 ---------------------------------------
 
 Disclaimer: Opinions expressed here are my own and not 
 necessarily those of my employer

