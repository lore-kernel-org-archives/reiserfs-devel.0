From: "Oleg O. Ossovitskii" <oleg@kgpa.ru>
Subject: ReiserFS 3.6.x vs Reiser4
Date: Mon, 11 Nov 2002 08:41:43 +0200
Message-ID: <1951002912.20021111084143@kgpa.ru>
Reply-To: "Oleg O. Ossovitskii" <oleg@kgpa.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11959-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS-Team <reiserfs-list@namesys.com>

Hello, All!

I made simple FS comparision. From a user point of view - unpacking
files, copying, deleting etc. Reiser4 is more space effectively, and
it remove files faster than reiserfs3, but speed of copying many small files
(kernel 2.5.44 source code) is approximately equal to reiserfs3.6. But
of reiser4 reliability is still low.

root@(vc/1)[/mnt/reiser4tst]# fdisk -l /dev/hda

Disk /dev/hda: 255 heads, 63 sectors, 4982 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
   /dev/hda1   *         1        66    530113+   6  FAT16
   /dev/hda2            67        83    136552+  82  Linux swap
   /dev/hda3            84        86     24097+  83  Linux
   /dev/hda4            87      4981  39319087+   f  Win95 Ext'd (LBA)
   /dev/hda5            87       405   2562336    7  HPFS/NTFS
   /dev/hda6           406      1425   8193118+   7  HPFS/NTFS
   /dev/hda7          1426      2190   6144831   83  Linux
   /dev/hda8          2191      2321   1052226   83  Linux
   /dev/hda9          2322      2582   2096451    b  Win95 FAT32
   /dev/hda10         2583      3220   5124703+   b  Win95 FAT32
   /dev/hda11         3221      4495  10241406    7  HPFS/NTFS
   /dev/hda12         4496      4619    995998+  83  Linux
   /dev/hda13         4620      4743    995998+  83  Linux


/dev/hda12 is Reiser4
/dev/hda13 is ReiserFs 3.6.25

root@(vc/1)[/mnt/reiser4tst]# df -ah .
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda12            973M   29M  944M   3% /mnt/reiser4tst

root@(vc/1)[/mnt/reiser3tst]# df -ah .
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda13            973M   61M  912M   6% /mnt/reiser3tst

Tests description:
1. unpacking linux-2.5.44.tar.bz2
   $ ls -l linux-2.5.44.tar.bz2
   29260
2. cp -Rd linux-2.5.44 linux-2.5.44-test1
3. du -sk linux-2.5.44
4. rm -rf linux-2.5.44-tst1
5. rm -rf linux-2.5.44

-------------+--------------------+---------------------
Test number  |   ReiserFS 3.6.25  |   Reiser4
    1        |       1m22.868s    |   1m24.153s
    2        |       1m24.127s    |   1m23.050s
    3        |  0m5.727s/183656k  | 0m3.706s/157401k
    4        |       0m9.896s     |   0m3.185s(*)
    5        |       0m6.921s     |   0m33.011s
-------------+--------------------+---------------------
(*) rm couldn't remove directories recursively, and gave warnings/errors:
    rm: cannot remove directory `linux-2.5.44-tst1/arch/um': Directory not empty
    rm: cannot remove directory `linux-2.5.44-tst1/arch/x86_64': Directory not empty
    ... and so on 
    After that Reiser4 partition stay unmountable and have unremovable 
    directories till reboot
    After reboot directories was succesfully removed, but they still contained
    files
    Test #5 done after reboot - I got significant Reiser4 slowdown

--- Sys info ---
# uname -a
Linux oleg 2.5.46-reiser4 #1 Fri Nov 8 19:31:10 EET 2002 i686 unknown
glibc-2.2.5
gcc-3.2
reiser4progs-0.1.0 (builded w/gcc-3.1.1)

root@(vc/1)[/mnt/reiser4tst]# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 8
model name      : Pentium III (Coppermine)
stepping        : 6
cpu MHz         : 731.555
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat pse36 mmx fxsr sse
bogomips        : 1441.79

root@(vc/1)[/mnt/reiser4tst]# free
Unknown HZ value! (93) Assume 100.
     total       used       free     shared    buffers     cached
     Mem:        125324      55220      70104          0      22640      19072
     -/+ buffers/cache:      13508     111816
     Swap:       136544          0     136544

root@(vc/1)[/proc]# lsmod
Module                  Size  Used by    Not tainted
snd-ens1371            15928   0
snd-ac97-codec         35172   0  [snd-ens1371]
snd-rawmidi            18848   0  [snd-ens1371]
8139too                18612   1
mii                     3848   0  [8139too]
crc32                   1748   1  [8139too]

=== kernel config ===
CONFIG_REISER4_FS=y
# CONFIG_REISER4_CHECK is not set
CONFIG_REISERFS_FS=y
# CONFIG_REISERFS_CHECK is not set
CONFIG_REISERFS_PROC_INFO=y
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
=== kernel config ===        

root@(vc/1)[/proc]# mount
[...]
/dev/hda12 on /mnt/reiser4tst type reiser4 (rw)
/dev/hda13 on /mnt/reiser3tst type reiserfs (rw)


After test#5 I run reiser4fsck and got a lot of errors:

root@(vc/1)[/tmp]# reiser4fsck /dev/hda12
[...]
Error: Node (54635): the length (8238) of the item (0) is invalid.
Error: Node (54635): the item (0) length was fixed to (4032).
Error: Node (54636): the length (24397) of the item (0) is invalid.
Error: Node (54636): the item (0) length was fixed to (4032).

Best regards, Oleg O. Ossovitskii
software engineer, KGPA Ltd., Kaliningrad, West Russia
tel: +7(0112)46-23-40, fax: +7(0112)43-64-96
mailto:oleg@kgpa.ru, icq# 33366588

