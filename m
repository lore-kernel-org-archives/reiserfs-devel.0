From: Tyler Phelps <tyler@pandora.com>
Subject: Bug report: reiserfsck --rebuild-tree not progressing
Date: Mon, 10 Apr 2006 17:34:58 -0700
Message-ID: <b19177749f9fd8399d24c21c4f355efd@pandora.com>
Reply-To: System Administrators <sysadmin@pandora.com>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28466-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: System Administrators <sysadmin@pandora.com>

Two sentence summary:  reiserfsck --rebuild-tree on a 1.4TB reiserfs 
filesystem seems to be spinning its wheels.  The reiserfsck has been 
running for a little more than 56 hours, the progress meter hasn't 
changed in over 24 hours, very little I/O activity is happening, and 
the reiserfsck process is utilizing 100% of one of the two CPUs in the 
system.

I'll provide system information first, then explain the problem in 
detail.

Hardware:
4U rackmount system with 16gb of memory and dual opteron cpus running 
in a controlled environment datacenter.  The partition in question sits 
on twelve 250gb drives (Western Digital Caviar Raid Edition 7200rpm 
SATA.. model number WD2500SD).  It is the only partition that resides 
on these drives.  The partition contains postgres data and nothing 
else.. the rest of the system lives on a separate set of disks.  The 
raid array is half hardware and half software.  The twelve disks are 
formed into six pairs.. each pair is formed into a raid 1 mirror.  This 
mirroring is done in hardware on two different 8-port 3ware 9500S 
controller cards.  EVMS is used to provide a software raid 0 stripe 
array that spans the six mirrored pairs.

Distro and kernel:
The system is running Debian using the sarge (stable) codeline, version 
1:3.3.4-6sarge1.  The kernel is self-compiled version 2.6.13.1.  No 
reiserfs-specific patches have been applied to the kernel source.  The 
kernel configuration can be provided as needed.. for now, the following 
are the lines from the config that contain "REISER":

CONFIG_REISERFS_FS=y
# CONFIG_REISERFS_CHECK is not set
CONFIG_REISERFS_PROC_INFO=y
# CONFIG_REISERFS_FS_XATTR is not set

Version:
I'm using the reiserfsprogs package from the sarge codeline.  The 
following is metadata about said package:

Package: reiserfsprogs
Status: install ok installed
Priority: optional
Section: admin
Installed-Size: 1079
Maintainer: Ed Boraas <ed@debian.org>
Architecture: i386
Version: 1:3.6.17-2
Depends: libc6 (>= 2.3.2.ds1-4), libuuid1
Description: User-level tools for ReiserFS filesystems
  This package contains utilities to create, check, resize, and debug 
ReiserFS
  filesystems.
  .
  NOTE: Releases of Linux prior to 2.4.1 do not support ReiserFS on 
their own.
  Thus, these tools will only be useful with Linux 2.4.1 or later, or if 
your
  kernel has been built with the ReiserFS patch applied. This patch can 
be found
  in the appropriate kernel-patch-<version>-reiserfs packages.
  .
  Homepage: http://www.namesys.com/

The following is mount information about the filesystem, taken from 
dmesg:

ReiserFS: dm-12: found reiserfs format "3.6" with standard journal
ReiserFS: dm-12: using ordered data mode
ReiserFS: dm-12: journal params: device dm-12, size 8192, journal first 
block 18, max trans len 1024, max batch 900, max commit age 30, max 
trans age 30
ReiserFS: dm-12: checking transaction log (dm-12)
ReiserFS: dm-12: Using r5 hash to sort names

The following are syslog messages from the kernel.  The filesystem 
trouble began at about 2:50am which matches the following log entries:

Apr  6 02:50:03 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:03 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:03 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:03 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:03 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:03 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:03 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:03 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:03 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:04 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:04 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:04 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:04 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:04 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:04 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:04 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:04 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:05 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:05 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:05 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:05 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:05 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:05 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:05 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:05 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:06 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:06 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not ounos
Apr  6 02:50:06 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:06 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:06 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 02:50:06 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:05 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:05 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:06 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:08 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:09 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:09 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:10 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:10 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:11 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:12 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:12 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:12 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:13 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:14 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:17 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:18 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:18 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:18 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:21 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:21 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:22 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:22 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:22 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:23 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:23 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:24 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:25 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:26 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:26 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:26 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:27 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:27 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:27 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:28 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:28 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:29 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)
Apr  6 07:00:29 gwar kernel: ReiserFS: dm-12: warning: vs-13060: 
reiserfs_update_sd: stat data of object [124 983 0x0 SD] (nlink == 1) 
not found (pos 1)

So here's what happened..

At around 2:50am on Apr 6 a standard sql query to insert something into 
the database hung.  From this point on, the process consumed 100% of 
one of the two cpus.  Any attempt to strace the process would cause 
strace to immediately hang.  All attempts to kill the process failed.  
The system needed to be up for business reasons so it was decided that 
the fastest way to recover postgres would be to reboot the system.  The 
system shutdown without any trouble.  At boot, postgres failed to 
start.. the following are log messages from that event:

2006-04-06 11:59:33.410 PDT PANIC:  could not count blocks of relation 
1663/16815/17215: Permission denied
2006-04-06 11:59:33.413 PDT LOG:  startup process (PID 3898) was 
terminated by signal 6
2006-04-06 11:59:33.413 PDT LOG:  aborting startup due to startup 
process failure
2006-04-06 11:59:33.419 PDT LOG:  logger shutting down

We began to look at the data files in postgres' data directory.  We 
found two files that responded with a "permission denied" message for 
any attempt to browse or manipulate them (using programs such as ls, 
stat, cp, etc.)  After browsing forums and newsgroups we concluded that 
this behavior may be indicative of a filesystem problem.  An example of 
one of the files exhibiting the behavior:

find: ./data/base/16815/17215.15: Permission denied

The partition was unmounted from the system.  We started an fsck using 
the following command:

reiserfsck --check --logfile /root/postgres-gwar-20060407.log 
/dev/evms/postgres

Unfortunately, this fsck was cutoff by a dropped ssh connection and the 
fsck wasn't running within screen (oops).  Based on the progress 
indicator, it seems that the check was about 2/3 of the way through the 
process.  The following is the contents of the logfile:

tyler@gwar ~> sudo cat /root/postgres-fsck-20060407.log
bad_path: The right delimiting key [124 982 0x3c001 IND (1)] of the 
node (227226375) must be greater than the last (6) element's key [124 
984 0x1 IND (1)] within the node.
vpf-10630: The on-disk and the correct bitmaps differs. Will be fixed 
later.

A second fsck was started (within screen) using the following command:

reiserfsck --fix-fixable /dev/evms/postgres

Unfortunately I don't have the verbatim output of this command.  The 
command completed successfully and found one problem which could only 
be fixed by running the fsck with --rebuild-tree.

We made a backup of the data minus the two files with permission denied 
problems to a different system.  We used this backup to start a 
parallel recovery effort to restore postgres on a different system 
using all of the data except the two broken files which couldn't be 
backed up.

A third reiserfsck was started using the following command:

reiserfsck --rebuild-tree /dev/evms/postgres

The following is the output from that command thus far:

Will rebuild the filesystem (/dev/evms/postgres) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
Replaying journal..
Reiserfs journal '/dev/evms/postgres' in blocks [18..8211]: 0 
transactions replayed
###########
reiserfsck --rebuild-tree started at Sat Apr  8 07:57:05 2006
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 264008904 blocks marked used
Skipping 19386 blocks (super block, journal, bitmaps) 263989518 blocks 
will be read
0%....block 162165170: The free space (6) is incorrect, should be 
(4072) - corrected
block 162165260: The free space (3) is incorrect, should be (4072) - 
corrected
block 162165340: The free space (3) is incorrect, should be (4072) - 
corrected
block 225738748: The number of items (5055) is incorrect, should be (1) 
- corrected
block 225738748: The free space (14) is incorrect, should be (13) - 
corrected
pass0: vpf-10110: block 225738748, item (0): Unknown item type found 
[1310733 1188392 0x1a7445900000000 ??? (4)] - deleted
                                                            left 0, 
20739 /sec
1424 directory entries were hashed with "r5" hash.
         "r5" hash is selected
Flushing..finished
         Read blocks (but not data blocks) 263989518
                 Leaves among those 95376536
                         - leaves all contents of which could not be 
saved and deleted 4
                 Objectids found 1426

Pass 1 (will try to insert 95376532 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%.                                                       
    left 0, 3581 /seccc
Flushing..finished
         95376532 leaves read
                 95376530 inserted
                 2 not inserted
####### Pass 2 #######

Pass 2:
0%....20%....40%....60%...                                       left 
1, 0 /sec

The process has been "stuck" at this progress for more than 24 hours.

The reiserfsck process seems to be using 100% of one of the CPUs but 
very little I/O activity is happening.  The following is output about 
system resources from various commands:

tyler@gwar ~> vmstat 1
procs -----------memory---------- ---swap-- -----io---- --system-- 
----cpu----
  r  b   swpd   free   buff  cache   si   so    bi    bo   in    cs us 
sy id wa
  1  0      0 15491440 700792  31092    0    0    51     0    2    20 29 
  6 62  3
  1  0      0 15491068 701080  31076    0    0   128    72  272    32 50 
  0 50  0
  1  0      0 15490820 701328  31100    0    0   128     0  257    26 50 
  0 50  0
  1  0      0 15490696 701536  31096    0    0   128     0  260    24 50 
  0 50  0
  1  0      0 15491564 700620  31196    0    0   128     0  262    27 50 
  0 50  0
  1  0      0 15491440 700664  31152    0    0     0     0  257    23 50 
  0 50  0
  1  0      0 15491192 700900  31188    0    0    72    76  275    57 50 
  0 50  0

tyler@gwar ~> ps aux | grep reiserfsck
root      9835 89.9  1.0 183296 180200 pts/1 R+   Apr08 2933:14 
reiserfsck --rebuild-tree /dev/evms/postgres

tyler@gwar ~> top
top - 14:17:26 up 4 days,  2:20,  1 user,  load average: 1.00, 1.00, 
1.00
Tasks: 159 total,   2 running, 157 sleeping,   0 stopped,   0 zombie
  Cpu0 : 100.0% us,  0.0% sy,  0.0% ni,  0.0% id,  0.0% wa,  0.0% hi,  
0.0% si
  Cpu1 :  0.0% us,  0.0% sy,  0.0% ni, 100.0% id,  0.0% wa,  0.0% hi,  
0.0% si
Mem:  16508948k total,  1018516k used, 15490432k free,   701212k buffers
Swap:  8388596k total,        0k used,  8388596k free,    31216k cached
   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
  9835 root      25   0  179m 175m  688 R 99.7  1.1   2933:53 reiserfsck
     1 root      15   0  1588  516  452 S  0.0  0.0   0:00.75 init

tyler@gwar ~> free
              total       used       free     shared    buffers     
cached
Mem:      16508948    1042440   15466508          0     702812      
55116
-/+ buffers/cache:     284512   16224436
Swap:      8388596          0    8388596

I/O activity according to iostat.  The /dev/evms/postgres device lives 
on the six devices sdb through sdg.

tyler@gwar ~> iostat 1 -k
Linux 2.6.13.1-20050914 (gwar.savagebeast.com)  04/10/06
... output truncated ...
avg-cpu:  %user   %nice    %sys %iowait   %idle
           50.00    0.00    0.00    0.00   50.00

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sda               0.00         0.00         0.00          0          0
sdb               1.00        24.00         0.00         24          0
sdc               0.00         0.00         0.00          0          0
sdd               1.00         8.00         0.00          8          0
sde               1.00        32.00         0.00         32          0
sdf               1.00        32.00         0.00         32          0
sdg               1.00        32.00         0.00         32          0
sdh               0.00         0.00         0.00          0          0

I'm not convinced that the process is hung because an strace of the 
process reveals that it's actively making system calls.  It crossed my 
mind that the fsck may be looping.. this is supported by the fact that 
CPU utilization is high while I/O is minimal.  However, for what it's 
worth, in a test of 65,000 lines of strace output there wasn't a single 
duplicate line... if it is looping, it's not making identical calls 
over and over.

The following is 100 lines of an strace of the process.

_llseek(3, 242647523328, [242647523328], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647527424, [242647527424], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647531520, [242647531520], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647535616, [242647535616], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647539712, [242647539712], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647474176, [242647474176], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647543808, [242647543808], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647547904, [242647547904], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647552000, [242647552000], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647560192, [242647560192], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 1169951559680, [1169951559680], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200\240w\316\0\0\0\0\6\0\0\0|"..., 
4096) = 4096
_llseek(3, 1169951563776, [1169951563776], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200\20\201\311\0\0\0\0\16\0\21"..., 
4096) = 4096
_llseek(3, 1169951567872, [1169951567872], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200 v\313\0\0\0\0\0\0\21\300|"..., 
4096) = 4096
_llseek(3, 1169951571968, [1169951571968], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200P\351\344\0\0\0\0\0\0\0\0|"..., 
4096) = 4096
_llseek(3, 1169951576064, [1169951576064], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200\260\223\331\0\0\0\0\0\0\0"..., 
4096) = 4096
_llseek(3, 1169951580160, [1169951580160], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200\0B\314\0\0\0\0\34\0\21\300"..., 
4096) = 4096
_llseek(3, 1169951584256, [1169951584256], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200@\26\333\0\0\0\0\v\0\21\300"..., 
4096) = 4096
_llseek(3, 1169951588352, [1169951588352], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200P:\327\0\0\0\0\20\0\21\300"..., 
4096) = 4096
_llseek(3, 1169951592448, [1169951592448], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200\300N\350\0\0\0\0\25\0\21\300"..., 
4096) = 4096
_llseek(3, 1169951596544, [1169951596544], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200`\23\323\0\0\0\0\0\0\322\r"..., 
4096) = 4096
_llseek(3, 1169951600640, [1169951600640], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200\0206\312\0\0\0\0\0\0\0\0|"..., 
4096) = 4096
_llseek(3, 1169951604736, [1169951604736], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200\340&\324\0\0\0\0\20\0\21\300"..., 
4096) = 4096
_llseek(3, 1169951608832, [1169951608832], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200\320\335\313\0\0\0\0\0\0\21"..., 
4096) = 4096
_llseek(3, 1169951612928, [1169951612928], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\334\1\0\0\334\1\257\324\0\0\0\0L\0\21\300"..., 
4096) = 4096
_llseek(3, 1169951617024, [1169951617024], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200\20+\366\0\0\0\0\36\0\21\300"..., 
4096) = 4096
_llseek(3, 1169951621120, [1169951621120], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200@\354\324\0\0\0\0\1\0\377\377"..., 
4096) = 4096
_llseek(3, 242647564288, [242647564288], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647568384, [242647568384], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647572480, [242647572480], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647576576, [242647576576], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647580672, [242647580672], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647515136, [242647515136], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647584768, [242647584768], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647588864, [242647588864], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647592960, [242647592960], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647601152, [242647601152], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647605248, [242647605248], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647609344, [242647609344], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647613440, [242647613440], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 242647617536, [242647617536], SEEK_SET) = 0
write(3, "\1\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0\0"..., 
4096) = 4096
_llseek(3, 1169951625216, [1169951625216], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200\200\374\315\0\0\0\0\0\0\21"..., 
4096) = 4096
_llseek(3, 1169951629312, [1169951629312], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200\0\276\356\0\0\0\0\0\0\21\300"..., 
4096) = 4096
_llseek(3, 1169951633408, [1169951633408], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200@\337\354\0\0\0\0\1\0\30\0"..., 
4096) = 4096
_llseek(3, 1169951637504, [1169951637504], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200\360\245\351\0\0\0\0\24\0\0"..., 
4096) = 4096
_llseek(3, 1169951641600, [1169951641600], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200\320G\315\0\0\0\0\36\0\21\300"..., 
4096) = 4096
_llseek(3, 1169951645696, [1169951645696], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200\200\267\327\0\0\0\0\6\0\21"..., 
4096) = 4096
_llseek(3, 1169951649792, [1169951649792], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200\0\322\356\0\0\0\0\n\0\21\300"..., 
4096) = 4096
_llseek(3, 1169951653888, [1169951653888], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200 c\352\0\0\0\0\36\0\332\360"..., 
4096) = 4096
_llseek(3, 1169951657984, [1169951657984], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200\300\203\355\0\0\0\0\0\0\21"..., 
4096) = 4096
_llseek(3, 1169951662080, [1169951662080], SEEK_SET) = 0
read(3, "\1\0\1\0`\0 \0\200\0\0\0\200\20\266\312\0\0\0\0\0\0\0\0"..., 
4096) = 4096

The following are the file descriptors of process 9835 (the reiserfsck 
process) according to /proc:

tyler@gwar ~> sudo ls -laF /proc/9835/fd/
total 5
dr-x------    2 root     root            0 Apr 10 16:24 ./
dr-xr-xr-x    5 root     root            0 Apr 10 15:41 ../
lrwx------    1 root     root           64 Apr 10 16:24 0 -> /dev/pts/1
lrwx------    1 root     root           64 Apr 10 16:24 1 -> /dev/pts/1
lrwx------    1 root     root           64 Apr 10 16:24 2 -> /dev/pts/1
lrwx------    1 root     root           64 Apr 10 16:24 3 -> 
/dev/evms/postgres
lrwx------    1 root     root           64 Apr 10 16:24 4 -> 
/dev/evms/postgres

The parallel recovery effort to bring up postgres on different hardware 
using the backup has proceeded smoothly.  As a result, if the fsck has 
in fact croaked it's not devastating.. but it is troublesome.

1.  Is it normal for pass 2 of the --rebuild-tree operation to stay at 
the same "progress" for more than 24 hours?
2.  Is it normal for the reiserfsck operation to use significant CPU 
resources while I/O activity is minimal?
3.  For a filesystem of such size, is it reasonable for the fsck to 
take many days to complete?
4.  How long do you recommend that I leave it in this state before 
aborting the fsck?

I've tried to provide as much useful information as I can think of.. if 
there's additional information that you need, I'll do my best to 
provide it.

Thank you for your help.

-Tyler

