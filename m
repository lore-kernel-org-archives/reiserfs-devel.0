From: Alan Chu <alanchu@MIT.EDU>
Subject: Gnu Parted error, Kernel Panic, Reiserfs
Date: Sat, 10 Apr 2004 16:01:13 -0400 (EDT)
Message-ID: <Pine.GSO.4.55L.0404101549560.18241@ohmmjbeq-ovatb.zvg.rqh>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17837-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

I tried to resize down my root partition using Gnu Parted, off of a boot
disk. It failed midway, saying that there was an "invalid node". After
rebooting, I get kernel panic:

-----
sh-2021: reiserfs_read_super: can not find reiserfs on ide0(3,9)
XFS: bad magic number
XFS: SB validate failed
Kernel panic: VFS: Unable to mount root fs on 03:09
-----

I checked my partitions, and their numbers haven't changed (hda1 is still
hda1, hda2 is still hda2, etc.) so /etc/fstab should be fine.

I searched around on the Gentoo forums, but most answers involve someone
trying to install Gentoo. Before using parted, my gentoo worked fine. So,
the kernel options should be correct.

So I used the Linux "Recovery is Possible 6.9" boot disk, and ran
"reiserfsck --check" on my /dev/hda9, which is my / partition. The output
was the following:

-----
Replaying journal..
No transactions found
Checking internal tree..
Bad root block 0.
(--rebuild-tree did not complete)
Aborted
-----

Funny thing is, I didn't run "--rebuild-tree" yet. So, next, I tried the
"--rebuild-tree" option, since nothing is working, and I still get kernel
panic. Here is my rebuild.log file, the output of "reiserfsck
--rebuild-tree": http://us.share.geocities.com/entertext/rebuild.log

Then, I tried booting gentoo linux, and I get the following error, which
is different from my previous error, but kind of similar, I guess:

-----
reiserfs: checking transaction log (device ide0(3,9))...
for (ide0(3,9))
Warning, log replay starting on readonly filesystem
ide0(3,9): Using r5 hash to sort names
VFS: Mounted root (reiserfs filesystem) readonly.
mount_devfs_fs(): unable to mount devfs, err: -2
Freeing unused kernel memory: 132k freed
Warning: unable to open an initial console
Kernel panic: No init found.  Try passing init= option to kernel.
-----

Please help me!  I really appreciate it.

Alan

Other specifications about my setup:

-I have a Dell C840 Latitude laptop, dual boot with Windows XP.
-I use the Gentoo Kernel 2.4.22-r7
-Here's the partition setup for my HD:
/dev/hda1 Dell FAT partition (BIOS I think)
/dev/hda2 NTFS (C:\ drive for Windows XP)
/dev/hda4 Windows extended LBA partition
/dev/hda5 NTFS partition (just for documents)
/dev/hda6 FAT32 partition (for transfering files btw 2 OSes)
/dev/hda7 ext2 partition (Gentoo linux boot partition)
/dev/hda8 swap partition
/dev/hda9 root partition (for Gentoo linux)

*Note /dev/hda3 is "missing".  This isn't a typo.  It happened after I
used Partition Magic a few months ago.
