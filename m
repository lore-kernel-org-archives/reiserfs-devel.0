From: James <jtp@nc.rr.com>
Subject: failed reiserfs partition - help!
Date: Tue, 24 Aug 2010 12:37:42 -0400
Message-ID: <AANLkTikznBfLD366L00+bWu0JGfutxO8NyhDQR1n8Azy@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:sender:received:from:date
         :x-google-sender-auth:message-id:subject:to:content-type;
        bh=ABAbNA0FYDI4mpEloEiEG9c5GrIOanPdpIrRybyIaOE=;
        b=I8lK7LIFTxOz8Vk1SxRGc9eG+XnuqDZV7KV2H+SI/2NwRGsWHhZ+IM4Fd61ZHoG2xy
         tpuTxSv5I0AH4Ox9JLdsiZlLgmRPIjBZUBwnDQGqpVMHnhmsxBzyph3IEVD52H87ORJP
         8XQqidfBV5KI1WAk/049YD27223BrYGHSLcz4=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

All,

I'm in desperate need of some help recovering a reiserfs partition
that went awry for some unknown reason. A quick list of events:

- purchased brand new WD "My Passport" drive -- 320GB, 2.5GB
- cleared partition table with a "dd if=/dev/urandom of=/dev/sdX bs=5M count=10"
- created one single large partition
- mkreiserfs /dev/sdX1
- copied data into the new hard drive

All seemed well. I mounted the partition, copied critical data into
the partition, then *cleanly* unmounted the partition after confirming
that all the data was on the drive with no issues. Then "it the the
fan":

Upon attempting to remount the partition, the partition would not
mount. In fact, upon attempting to remount the partition, here's what
happens (according to /var/log/dmesg):

-->8--

[18723.893570] usb-storage: device found at 8
[18723.893572] usb-storage: waiting for device to settle before scanning
[18728.893199] usb-storage: device scan complete
[18728.895310] scsi 13:0:0:0: Direct-Access     WD       My Passport
071A 2011 PQ: 0 ANSI: 4
[18728.897305] scsi 13:0:0:1: Enclosure         WD       SES Device
2011 PQ: 0 ANSI: 4
[18728.898987] sd 13:0:0:0: Attached scsi generic sg4 type 0
[18728.899119] ses 13:0:0:1: Attached Enclosure device
[18728.899222] ses 13:0:0:1: Attached scsi generic sg5 type 13
[18728.901909] sd 13:0:0:0: [sdf] 625086464 512-byte logical blocks:
(320 GB/298 GiB)
[18728.905166] sd 13:0:0:0: [sdf] Write Protect is off
[18728.905170] sd 13:0:0:0: [sdf] Mode Sense: 2b 00 10 08
[18728.905173] sd 13:0:0:0: [sdf] Assuming drive cache: write through
[18728.910673] sd 13:0:0:0: [sdf] Assuming drive cache: write through
[18728.910677]  sdf: sdf1
[18728.954536] sd 13:0:0:0: [sdf] Assuming drive cache: write through
[18728.954541] sd 13:0:0:0: [sdf] Attached SCSI disk
[18729.204285] REISERFS (device sdf1): found reiserfs format "3.6"
with standard journal
[18729.204305] REISERFS (device sdf1): using ordered data mode
[18729.233424] REISERFS (device sdf1): journal params: device sdf1,
size 8192, journal first block 18, max trans len 1024, max batch 900,
max commit age 30, max trans age 30
[18729.233645] REISERFS (device sdf1): checking transaction log (sdf1)
[18730.204418] REISERFS warning: reiserfs-5090 is_tree_node: node
level 5687 does not match to the expected one 65534
[18730.204422] REISERFS error (device sdf1): vs-5150 search_by_key:
invalid format found in block 0. Fsck?
[18730.204426] REISERFS (device sdf1): Remounting filesystem read-only
[18730.204430] REISERFS error (device sdf1): vs-13070
reiserfs_read_locked_inode: i/o failure occurred trying to find stat
data of [1 2 0x0 SD]
[18730.204436] REISERFS (device sdf1): Using r5 hash to sort names
root@gentoo:~# fdisk -l /dev/sdf

Disk /dev/sdf: 320.0 GB, 320044269568 bytes
255 heads, 63 sectors/track, 38909 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x2dbafd11

  Device Boot      Start         End      Blocks   Id  System
/dev/sdf1               1       38909   312536511   83  Linux

--8<--

I know the data is in tact because (a) I have not written anything to
the disk, and (b) using tools like foremost / scalpel have
successfully "restored" much of the data on the drive. (unfortunately
foremost does not restore file names and it'll be incredibly difficult
for me to properly restore the previous data structure)

I've attempted to recover the drive using "reiserfsck
--scan-whole-partition --rebuild-tree /dev/sdf1", to no avail:

-->8--

root@gentoo:~# reiserfsck --scan-whole-partition --rebuild-tree /dev/sdf1
reiserfsck 3.6.21 (2009 www.namesys.com)

*snip*

Will rebuild the filesystem (/dev/sdf1) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Replaying journal: No transactions found
###########
reiserfsck --rebuild-tree started at Tue Aug 24 01:46:49 2010
###########

Pass 0:
####### Pass 0 #######
The whole partition (78134112 blocks) is to be scanned
Skipping 10595 blocks (super block, journal, bitmaps) 78123517 blocks
will be read
0%....20%....40%...                                             left
0, 8521 /seccsecccccseccccc
Could not find a hash in use. Using "r5"
       "r5" hash is selected
Flushing..finished
       Read blocks (but not data blocks) 78123517
               Leaves among those 0
               Objectids found 2

Pass 1 (will try to insert 0 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished

Flushing..finished
       0 leaves read
               0 inserted
####### Pass 2 #######
Flushing..finished


No reiserfs metadata found.  If you are sure that you had the reiserfs
on this partition,  then the start  of the partition  might be changed
or all data were wiped out. The start of the partition may get changed
by a partitioner  if you have used one.  Then you probably rebuilt the
superblock as there was no one.  Zero the block at 64K offset from the
start of the partition (a new super block you have just built) and try
to move the start of the partition a few cylinders aside  and check if
debugreiserfs /dev/xxx detects a reiserfs super block. If it does this
is likely to be the right super block version. If this makes you
nervous, try  www.namesys.com/support.html,  and for $25 the author of
fsck,  or a colleague  if he is out,  will  step you through it all.

Aborted (core dumped)

--8<--

The issue seems to be the *superblock* is not correct. I confirmed
with a "reiserfsck --check /dev/sdf1"

-->8--

root@gentoo:~# reiserfsck --check /dev/sdf1
reiserfsck 3.6.21 (2009 www.namesys.com)

*snip*

Will read-only check consistency of the filesystem on /dev/sdf1
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
###########
reiserfsck --check started at Tue Aug 24 04:48:00 2010
###########
Replaying journal: No transactions found
Checking internal tree..

Bad root block 0. (--rebuild-tree did not complete)

Aborted (core dumped)

--8<--

I've also attempted to rebuild the superblock (which seems to be the
big problem here), but this didn't work either.

-->8--

root@gentoo:~# reiserfsck --rebuild-sb /dev/sdf1
reiserfsck 3.6.21 (2009 www.namesys.com)

*snip*

Will check superblock and rebuild it if needed
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
rebuild-sb: wrong tree height occured (65535), zeroed
Reiserfs super block in block 16 on 0x851 of format 3.6 with standard journal
Count of blocks on the device: 78134112
Number of bitmaps: 2385
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 78134112
Root block: 0
Filesystem is NOT clean
Tree height: 0
Hash function used to sort names: "r5"
Objectid map size 2, max 972
Journal parameters:
       Device [0x0]
       Magic [0x0]
       Size 8193 blocks (including 1 for journal header) (first block 18)
       Max transaction length 1024 blocks
       Max batch size 900 blocks
       Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0xfa03:
       FATAL corruptions exist.
        some corruptions exist.
sb_version: 2
inode generation number: 0
UUID: 1704f9d1-2de0-40f7-8f73-aa3cbd6b35ba
LABEL:
Set flags in SB:
Mount count: 0
Maximum mount count: Disabled. Run fsck.reiserfs(8) or use
tunefs.reiserfs(8) to enable.
Last fsck run: Never with a version that supports this feature. Check
interval in days: Disabled. Run fsck.reiserfs(8) or use
tunefs.reiserfs(8) to enable.
Is this ok ? (y/n)[n]: y
The fs may still be unconsistent. Run reiserfsck --check.

--8<--

I apologize of the long post; I'm in a pretty big pickle and am
desperate for some help. The data is on the drive -- what bothers me
is that this randomly happened. The portable drive was cleanly
unmounted so I can't really see what could have caused this issue.

Any thoughts, ideas, or beer to get over this issue would be greatly
appreciated.

Thanks!
-james
