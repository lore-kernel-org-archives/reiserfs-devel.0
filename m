From: Bernhard Sadlowski <sat06@mat.mohn.bertelsmann.de>
Subject: No mount of reiserfs 3.6 after power loss
Date: Mon, 10 May 2010 18:03:15 +0200
Message-ID: <201005101803.15557.sat06@mat.mohn.bertelsmann.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,

I have trouble to mount a reiserfs 3.6 filesystem after a power loss. It is 
living on a md raid1 (2xSATA) with cryptsetup. I have used this setup for 
years without any problem so far. With "strings" I see data and text inside 
the /dev/mapper/... device, so it seems the data could be intact.

[139977.209415] REISERFS (device dm-2): found reiserfs format "3.6" with 
standard journal
[139977.209852] REISERFS (device dm-2): using ordered data mode
[139977.214845] attempt to access beyond end of device
[139977.214858] dm-2: rw=0, want=18401083744, limit=1781801088
[139977.214870] REISERFS warning (device dm-2): sh-459 journal_init: unable to 
read journal header
[139977.247350] REISERFS warning (device dm-2): sh-2022 reiserfs_fill_super: 
unable to initialize journal space

I found also a mail with similiar content from 5/2009 but no solution: 
http://marc.info/?l=reiserfs-devel&m=124143380020910&w=2

I can break the mirror and experiment with the second copy. 

The System is Debian:

# uname -a
Linux k8 2.6.32-trunk-vserver-amd64 #1 SMP Sun Jan 10 23:45:41 UTC 2010 x86_64 
GNU/Linux

# fdisk -l /dev/sda

Disk /dev/sda: 1000.2 GB, 1000204886016 bytes
255 heads, 63 sectors/track, 121601 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0xff7911e5

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1        3917    31463271    7  HPFS/NTFS
/dev/sda2            3918       10445    52436160   83  Linux
/dev/sda3           10446       10689     1959930   82  Linux swap / Solaris
/dev/sda4           10690      121601   890900640   fd  Linux raid autodetect

#fdisk -l /dev/sdb

Disk /dev/sdb: 1000.2 GB, 1000204886016 bytes
255 heads, 63 sectors/track, 121601 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0x00f7cee4

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1               1        3917    31463271    b  W95 FAT32
/dev/sdb2   *        3918       10445    52436160   83  Linux
/dev/sdb3           10446       10689     1959930   82  Linux swap / Solaris
/dev/sdb4           10690      121601   890900640   fd  Linux raid autodetect

sda4 + sdb4 are the mirrors.

My Steps so far:

1) I tried to reiserfsck with --check, result:

bread: Cannot read the block (2535232620): (Invalid argument).

reiserfs_open: Your partition is not big enough to contain the 
filesystem of (2535232620) blocks as was specified in the found super block.
Failed to open the filesystem.

If the partition table has not been changed, and the partition is
valid  and  it really  contains  a reiserfs  partition,  then the
superblock  is corrupted and you need to run this utility with
--rebuild-sb.

2) next --rebuild-sb and then --check tells me to run --rebuild-tree. After

# reiserfsck --rebuild-tree
 
most of the files are gone. 

3) I will just try to recover with the -S option, but I hoped to get the 
directory structure intact without any files in lost+found.

Any advice? 

Thanks,
Bernhard
