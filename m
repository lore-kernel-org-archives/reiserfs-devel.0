From: reiserfs@xy1.org
Subject: Kernel panic with small file systems and extended partition
Date: Fri, 25 Jun 2004 11:33:29 +0200
Message-ID: <20040625093329.GA2208@xy1.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19376-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello,

I retested the kernel panic with reiserfs and SLES9 (kernel 2.6.x).

First the good news:
It doesn't crash on Power PC based computers.

The problem occurs only if you create first a big extended partition:
And then in the extended partition you must create a small logical 
partition (<= 100 MB) big enough.

Then mkfs.reiserfs the_small_partition

The go in the directory an try this: cp -r /usr/* .

And then cp will make "Segmentation fault" or be "Killed", and with dmesg 
you will get a kernel panic with reiserfs.

You can no more reboot the machine, because shutdown -r or reboot does no 
more reboot the machine (kernel blocked?!), only a power off or reset can 
reboot the computer.

The problem occurs only on kernel 2.6.x and x86 32 bits and 64 bits.

Here an example on a dual opteron computer:

lice03:/ # uname -a
Linux lice03 2.6.5-7.5-smp #1 SMP Mon Apr 19 19:30:53 UTC 2004 x86_64 
x86_64 x86_64 GNU/Linux

lice03:/ # fdisk /dev/hda

The number of cylinders for this disk is set to 9730.
There is nothing wrong with that, but this is larger than 1024,
and could in certain setups cause problems with:
1) software that runs at boot time (e.g., old versions of LILO)
2) booting and partitioning software from other OSs
   (e.g., DOS FDISK, OS/2 FDISK)

Command (m for help): p

Disk /dev/hda: 80.0 GB, 80032038912 bytes
255 heads, 63 sectors/track, 9730 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hda1               1         262     2104483+  82  Linux swap
/dev/hda2             263        2873    20972857+  83  Linux
/dev/hda3            2874        9729    55070820    f  W95 Ext'd (LBA)
/dev/hda5            2874        2893      160618+  8e  Linux LVM
/dev/hda6            2894        2914      168651   8e  Linux LVM
/dev/hda7            2915        2925       88326   8e  Linux LVM
/dev/hda8            2926        2938      104391   83  Linux
/dev/hda9            2939        4155     9775521   83  Linux
/dev/hda10           4156        5372     9775521   83  Linux

Command (m for help): 

We take for example partition /dev/hda8:

lice03:/ # mkfs.reiserfs /dev/hda8
mkfs.reiserfs 3.6.13 (2003 www.namesys.com)

A pair of credits:
Hans Reiser was the project initiator,  source of all funding for the first 
5.5
years. He is the architect and official maintainer.

Many persons came to www.namesys.com/support.html,  and got a question 
answered
for $25, or just gave us a small donation there.


Guessing about desired format.. Kernel 2.6.5-7.5-smp is running.
Format 3.6 with standard journal
Count of blocks on the device: 26096
Number of blocks consumed by mkreiserfs formatting process: 8212
Blocksize: 4096
Hash function used to sort names: "r5"
Journal Size 8193 blocks (first block 18)
Journal Max transaction length 1024
inode generation number: 0
UUID: ff178eab-e61d-4f81-9d9a-a430c0c60c1c
ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
        ALL DATA WILL BE LOST ON '/dev/hda8'!
Continue (y/n):y
Initializing journal - 0%....20%....40%....60%....80%....100%
Syncing..ok
ReiserFS is successfully created on /dev/hda8.
lice03:/ # 

lice03:/ # mount -t reiserfs -v /dev/hda8 /mnt/
/dev/hda8 on /mnt type reiserfs (rw)
lice03:/ # df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda2              21G  2.6G   18G  13% /
tmpfs                 1.5G  4.0K  1.5G   1% /dev/shm
/dev/mapper/system-big
                      100M   33M   68M  33% /local
/dev/hda8             102M   33M   70M  32% /mnt
lice03:/ # 

lice03:/ # cd mnt/
lice03:/mnt # l
total 512
  0 drwxr-xr-x   4 root root  80 Jun 25 11:25 ./
512 drwxr-xr-x  24 root root 592 Jun 18 17:25 ../
lice03:/mnt # cp -r /usr/* .

Message from syslogd@linux at Fri Jun 25 11:25:26 2004 ...
linux kernel: general protection fault: 0000 [1] SMP 
Segmentation fault
lice03:/mnt # 


dmesg:
ReiserFS: hda8: warning: allocator defaults = [00001420]

ReiserFS: hda8: found reiserfs format "3.6" with standard journal
ReiserFS: hda8: using ordered data mode
ReiserFS: hda8: journal params: device hda8, size 8192, journal first block 
18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
ReiserFS: hda8: checking transaction log (hda8)
ReiserFS: hda8: Using r5 hash to sort names
ReiserFS: hda8: warning: Created .reiserfs_priv on hda8 - reserved for 
xattr storage.
general protection fault: 0000 [1] SMP 
CPU 0 
Pid: 15069, comm: cp Not tainted 2.6.5-7.5-smp
RIP: 0010:[<ffffffffa00442fa>] 
<ffffffffa00442fa>{:reiserfs:scan_bitmap_block+106}
RSP: 0018:0000010096dc1a28  EFLAGS: 00010282
RAX: 0000000000000010 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 00000100be927580 RSI: 0000000000000001 RDI: 28feebc400000400
RBP: 0000000000000001 R08: 0000000000000010 R09: 0000000000000011
R10: 0000010096dc1c08 R11: 00000000000065ef R12: ffffff00003e8010
R13: 0000010096dc1af0 R14: 0000000000000801 R15: 000001009ffda800
FS:  0000002a95baa7e0(0000) GS:ffffffff804dde80(0000) 
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
CR2: 0000000000521000 CR3: 0000000000101000 CR4: 00000000000006e0
Process cp (pid: 15069, stackpage=100a3e3f360)
Stack: 000001008fd4c15c 0000001100000000 0000000100000010 0000010096dc1db8 
       0000000000000000 0000000000000001 0000000000000001 000001009ffda800 
       0000000000000001 0000010096dc1b40 
Call Trace:<ffffffffa00459ac>{:reiserfs:reiserfs_allocate_blocknrs+3084} 
       
<ffffffffa0051e84>{:reiserfs:reiserfs_allocate_blocks_for_region+516} 
       <ffffffffa0051ccf>{:reiserfs:reiserfs_allocate_blocks_for_region+79} 
       <ffffffffa006225d>{:reiserfs:search_for_position_by_key+589} 
       <ffffffff80159584>{add_to_page_cache+100} 
<ffffffffa005194c>{:reiserfs:reiserfs_prepare_file_region_for_write+1404} 
       <ffffffffa0053454>{:reiserfs:reiserfs_file_write+1300} 
       <ffffffff801f88da>{avc_has_perm+90} 
<ffffffff801885ba>{cp_new_stat+234} 
       <ffffffff801f9eb2>{inode_has_perm+98} 
<ffffffff801fa4bb>{selinux_file_permission+299} 
       <ffffffff8017e9f4>{vfs_write+228} <ffffffff8017eb19>{sys_write+73} 
       <ffffffff80110734>{system_call+124} 

Code: 8b 07 a8 04 74 05 e8 7b d9 13 e0 41 0f b7 44 24 02 31 d2 3b 
RIP <ffffffffa00442fa>{:reiserfs:scan_bitmap_block+106} RSP 
<0000010096dc1a28>
 
lice03:/mnt # 

Perhaps it's a bug, because the kernel could be patched by SuSE,
but could you please verify if the bug occurs also on current kernels like 
2.6.6 or 2.6.7. Reiserfs should not crash on a stable kernel releases!!

My kernel was 2.6.5-7.5-smp of:
lice03:/etc # cat SuSE-release 
SUSE LINUX Server 9 (x86_64) Beta3.5
VERSION = 9
lice03:/etc # 

Best regards,
saf
-- 
No more spam!
Free disposable email addresses:
http://TrashMail.net/
