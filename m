From: Baldur Norddahl <bbn-reiserfs@dark.x.dtu.dk>
Subject: Filesystem corruption after resize
Date: Tue, 11 Jun 2002 18:55:13 +0200
Message-ID: <20020611165513.GB23259@dark.x.dtu.dk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10718-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello,

First something about my setup:

md0: 8x80 GB in a RAID5 configuration
md1: 4x160 GB in a RAID5 configuration
/dev/vg01/stuff: the union of md0 and md1 done with lvm.

dark:/mnt# reiserfsck -V

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1a

dark:/mnt# resize_reiserfs -v

<-------------resize_reiserfs, 2002------------->
reiserfsprogs 3.x.1a

Usage: resize_reiserfs  [-s[+|-]#[G|M|K]] [-fqv] device

dark:/mnt# cat /proc/version 
Linux version 2.4.18 (root@dark) (gcc version 2.95.4 20011006 (Debian
prerelease)) #1 SMP Fri Apr 12 13:40:03 CEST 2002

The system is a dual AMD Athlon(tm) MP 1800+ (1533 MHz), with 1 GB memory.

Now recently one of the 160 GB disks died. Since I still had enough free
space and I wanted to preserve the redundancy, I used resize_reiserfs to
shrink the filesystem. Then I used lvm to move it away from the
non-redundant md1 device.

The exact commands used are:

resize_reiserfs -s 400G /dev/vg01/stuff
lvreduce -l 16693 /dev/vg01/stuff
pvmove -v /dev/md1
vgreduce -v vg01 /dev/md1
resize_reiserfs /dev/vg01/stuff
reiserfsck --check /dev/vg01/stuff

This all worked like a charm, until I noticed that a nightly script that
scans all files, no longer was able to access about 20 files (access denied
even though the script is running as root).

Dmesg is full of this:

vs-5150: search_by_key: invalid format found in block 66153. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat
data of [163330 163334 0x0 SD]
is_leaf: free space seems wrong: level=1, nr_items=1, free_space=3040 rdkey 
vs-5150: search_by_key: invalid format found in block 72879. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat
data of [168724 168732 0x0 SD]
is_tree_node: node level 29122 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 70647. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat
data of [167220 167223 0x0 SD]
is_tree_node: node level 2 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 66153. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat
data of [163330 163334 0x0 SD]

and so on, there is alot of this stuff repeating.

reiserfsck --fix-fixable /dev/vg01/stuff crashes.

Btw. a seperate problem, I am never able to unmount this filesystem
properly. I always get this error:

dark:/mnt# umount stuff
umount: /mnt/stuff: device is busy
dark:/mnt# fuser -v stuff

                     USER        PID ACCESS COMMAND
stuff                root     kernel mount  /mnt/stuff

So without rebooting I can't quote the exact output from --fix-fixable, but
it is approximate the same as when I just run it plain:

dark:/mnt# reiserfsck -l /root/reiserfsck.log /dev/vg01/stuff

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1a

Will read-only check consistency of the filesystem on /dev/vg01/stuff
Will put log info to '/root/reiserfsck.log'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Tue Jun 11 16:36:38 2002
###########
Filesystem seems mounted read-only. Skipping journal replay..
Checking S+tree../  4 (of   6)/ 27 (of 132)/ 44 (of 152)bit 1359513587,
bitsize 136749056
reiserfsck: bitmap.c:168: reiserfs_bitmap_test_bit: Assertion `bit_number <
bm->bm_bit_size' failed.
Aborted


What can I do to resolve this?

Thanks,
  Baldur


