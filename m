From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: ReiserFS 3.6.x vs Reiser4
Date: Mon, 11 Nov 2002 17:51:03 +0300
Message-ID: <15823.50135.517241.494150@laputa.namesys.com>
References: <1951002912.20021111084143@kgpa.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11961-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1951002912.20021111084143@kgpa.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Oleg O. Ossovitskii" <oleg@kgpa.ru>
Cc: ReiserFS-Team <reiserfs-list@namesys.com>

Oleg O. Ossovitskii writes:
 > Hello, All!
 > 
 > I made simple FS comparision. From a user point of view - unpacking
 > files, copying, deleting etc. Reiser4 is more space effectively, and
 > it remove files faster than reiserfs3, but speed of copying many small files
 > (kernel 2.5.44 source code) is approximately equal to reiserfs3.6. But
 > of reiser4 reliability is still low.
 > 
 > root@(vc/1)[/mnt/reiser4tst]# fdisk -l /dev/hda
 > 
 > Disk /dev/hda: 255 heads, 63 sectors, 4982 cylinders
 > Units = cylinders of 16065 * 512 bytes
 > 
 >    Device Boot    Start       End    Blocks   Id  System
 >    /dev/hda1   *         1        66    530113+   6  FAT16
 >    /dev/hda2            67        83    136552+  82  Linux swap
 >    /dev/hda3            84        86     24097+  83  Linux
 >    /dev/hda4            87      4981  39319087+   f  Win95 Ext'd (LBA)
 >    /dev/hda5            87       405   2562336    7  HPFS/NTFS
 >    /dev/hda6           406      1425   8193118+   7  HPFS/NTFS
 >    /dev/hda7          1426      2190   6144831   83  Linux
 >    /dev/hda8          2191      2321   1052226   83  Linux
 >    /dev/hda9          2322      2582   2096451    b  Win95 FAT32
 >    /dev/hda10         2583      3220   5124703+   b  Win95 FAT32
 >    /dev/hda11         3221      4495  10241406    7  HPFS/NTFS
 >    /dev/hda12         4496      4619    995998+  83  Linux
 >    /dev/hda13         4620      4743    995998+  83  Linux
 > 
 > 
 > /dev/hda12 is Reiser4
 > /dev/hda13 is ReiserFs 3.6.25
 > 
 > root@(vc/1)[/mnt/reiser4tst]# df -ah .
 > Filesystem            Size  Used Avail Use% Mounted on
 > /dev/hda12            973M   29M  944M   3% /mnt/reiser4tst
 > 
 > root@(vc/1)[/mnt/reiser3tst]# df -ah .
 > Filesystem            Size  Used Avail Use% Mounted on
 > /dev/hda13            973M   61M  912M   6% /mnt/reiser3tst
 > 
 > Tests description:
 > 1. unpacking linux-2.5.44.tar.bz2
 >    $ ls -l linux-2.5.44.tar.bz2
 >    29260
 > 2. cp -Rd linux-2.5.44 linux-2.5.44-test1
 > 3. du -sk linux-2.5.44
 > 4. rm -rf linux-2.5.44-tst1
 > 5. rm -rf linux-2.5.44
 > 
 > -------------+--------------------+---------------------
 > Test number  |   ReiserFS 3.6.25  |   Reiser4
 >     1        |       1m22.868s    |   1m24.153s
 >     2        |       1m24.127s    |   1m23.050s
 >     3        |  0m5.727s/183656k  | 0m3.706s/157401k
 >     4        |       0m9.896s     |   0m3.185s(*)
 >     5        |       0m6.921s     |   0m33.011s
 > -------------+--------------------+---------------------
 > (*) rm couldn't remove directories recursively, and gave warnings/errors:
 >     rm: cannot remove directory `linux-2.5.44-tst1/arch/um': Directory not empty
 >     rm: cannot remove directory `linux-2.5.44-tst1/arch/x86_64': Directory not empty
 >     ... and so on 

Are there any messages in the kernel log at this time? Can you reproduce
this with CONFIG_REISER4_CHECK/Assertions on?

 >     After that Reiser4 partition stay unmountable and have unremovable 
 >     directories till reboot
 >     After reboot directories was succesfully removed, but they still contained
 >     files

You mean, rm still complains about not empty directories? Can you please
check whether they actually *are*?

It would be great if you could reproduce it and send to me
(personally---too large for list) strace of failing rm.

 >     Test #5 done after reboot - I got significant Reiser4 slowdown
 > 
 > --- Sys info ---
 > # uname -a

Nikita.
