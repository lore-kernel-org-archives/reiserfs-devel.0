From: "Adam Goryachev" <adam@websitemanagers.com.au>
Subject: Possible bug in reiserfsck 3.6.11
Date: Tue, 23 Sep 2003 23:23:13 +1000
Message-ID: <NDBBJPAGKLCMDEIEKOPBAEDMOCAA.adam@websitemanagers.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15726-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I had a few possible errors on my reiserfs partition, so after much thought
etc, I unmounted it tonight and tried to run reiserfsck (after upgrading
reiserfsck to the current version).

The first run --check found some problems (I actually stopped it part way
since I knew there were probs) so I ran --fix-fixable, this told me I still
needed to run rebuild-tree to fix 2 problems left over. I did that, and got
the below error, twice, exactly the same each time, so I am told (by the
output) that it probably is not hardware error (same block each time)...

Any help would be immensely helpful. Also, I can't mount the partition any
longer because mount says:
[root@castle /root]# mount /dev/md1
mount: Not a directory

The system is:
AMD Athlon XP processor
512MB RAM

IDE interfaces are:
00:04.1 IDE interface: VIA Technologies, Inc. Bus Master IDE (rev 06)
00:0b.0 RAID bus controller: CMD Technology Inc PCI0649 (rev 02)
00:11.0 Unknown mass storage controller: Promise Technology, Inc. 20265 (rev
02)

I'm not sure which disk is on which interface, but there are a total of 4
disks in the system.
3 x 40GB + 1 x 80G
The 3 x 40GB makes up a raid5 array on /dev/md0
The 1 x 80G + md0 makes up a raid1 array on /dev/md1

The disks are arranged one drive per cable.
Thus, there are two raid5 disks on one controller (primary + secondary
interface) and the remaining two disks are on the other controller)

Running redhat-release 7.1 with Linux Kernel 2.4.19-pre9
AFAIK, I don't think there are any patches applied, the only one that
*might* be is the lm_sensors patch from lm_sensors-2.6.1

Oh, and the machine hasn't been rebooted in 259 days, so it is pretty
stable, the only reboots in the last few years were basically kernel
upgrades.

Any other information that is required, please let me know, but hopefully I
have included it all here...

[root@castle /root]# reiserfsck /dev/md1 --rebuild-tree -q
reiserfsck 3.6.11 (2003 www.namesys.com)

*************************************************************
** Do not  run  the  program  with  --rebuild-tree  unless **
** something is broken and MAKE A BACKUP  before using it. **
** If you have bad sectors on a drive  it is usually a bad **
** idea to continue using it. Then you probably should get **
** a working hard drive, copy the file system from the bad **
** drive  to the good one -- dd_rescue is  a good tool for **
** that -- and only then run this program.                 **
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will rebuild the filesystem (/dev/md1) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Tue Sep 23 22:35:09 2003
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 5764691 blocks marked used
Skipping 8791 blocks (super block, journal, bitmaps) 5755900 blocks will be
read
0%pass0: vpf-10210: block 11281, item 0: The item with wrong offset or
length found [392 104981 0x9d DRCT (2)], len 308 - deleted
pass0: block 31120, item 296 299 0x1 DIR (3), len 3288, location 764 entry
count 83, fsck need 0, format old: 2 entries were deleted
....20%....40%....60%....80%....100%
2 directory entries were hashed with not set hash.
233061 directory entries were hashed with "r5" hash.
	"r5" hash is selected
Flushing..finished
	Read blocks (but not data blocks) 5755900
		Leaves among those 89192
		Objectids found 233081
Pass 1 (will try to insert 89192 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%
The problem has occurred looks like a hardware problem (perhaps memory).
Send us the bug report only if the second run dies at the same place with
the same block number.

build_the_tree: Nothing but leaves are expected. Block 59337 - broken leaf

Aborted (core dumped)
[root@castle /root]# reiserfsck /dev/md1 --rebuild-tree -q
reiserfsck 3.6.11 (2003 www.namesys.com)

*************************************************************
** Do not  run  the  program  with  --rebuild-tree  unless **
** something is broken and MAKE A BACKUP  before using it. **
** If you have bad sectors on a drive  it is usually a bad **
** idea to continue using it. Then you probably should get **
** a working hard drive, copy the file system from the bad **
** drive  to the good one -- dd_rescue is  a good tool for **
** that -- and only then run this program.                 **
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************
Will rebuild the filesystem (/dev/md1) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Tue Sep 23 22:49:42 2003
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 5764691 blocks marked used
Skipping 8791 blocks (super block, journal, bitmaps) 5755900 blocks will be
read
0%....20%....40%....60%....80%....100%
233059 directory entries were hashed with "r5" hash.
	"r5" hash is selected
Flushing..finished
	Read blocks (but not data blocks) 5755900
		Leaves among those 89192
		Objectids found 233081

Pass 1 (will try to insert 89192 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%
The problem has occurred looks like a hardware problem (perhaps memory).
Send us the bug report only if the second run dies at the same place with
the same block number.

build_the_tree: Nothing but leaves are expected. Block 59337 - broken leaf

Aborted (core dumped)
[root@castle /root]#

Copy of all the data from the /var/log/messages file which relates to this
timeframe:
Sep 23 23:03:26 castle kernel: reiserfs: checking transaction log (device
09:01) ...
Sep 23 23:03:26 castle kernel: is_tree_node: node level 0 does not match to
the expected one 65534
Sep 23 23:03:26 castle kernel: vs-5150: search_by_key: invalid format found
in block 0. Fsck?
Sep 23 23:03:26 castle kernel: vs-13070: reiserfs_read_inode2: i/o failure
occurred trying to find stat data of [1 2 0x0 SD]
Sep 23 23:03:26 castle kernel: Using r5 hash to sort names
Sep 23 23:03:26 castle kernel: is_tree_node: node level 0 does not match to
the expected one 65534
Sep 23 23:03:26 castle kernel: vs-5150: search_by_key: invalid format found
in block 0. Fsck?
Sep 23 23:03:26 castle kernel: vs-2140: finish_unfinished: search_by_key
returned -2
Sep 23 23:03:26 castle kernel: ReiserFS version 3.6.25
Sep 23 23:03:39 castle kernel: reiserfs: checking transaction log (device
09:01) ...
Sep 23 23:03:39 castle kernel: is_tree_node: node level 0 does not match to
the expected one 65534
Sep 23 23:03:39 castle kernel: vs-5150: search_by_key: invalid format found
in block 0. Fsck?
Sep 23 23:03:39 castle kernel: vs-13070: reiserfs_read_inode2: i/o failure
occurred trying to find stat data of [1 2 0x0 SD]
Sep 23 23:03:39 castle kernel: Using r5 hash to sort names
Sep 23 23:03:39 castle kernel: is_tree_node: node level 0 does not match to
the expected one 65534
Sep 23 23:03:39 castle kernel: vs-5150: search_by_key: invalid format found
in block 0. Fsck?
Sep 23 23:03:39 castle kernel: vs-2140: finish_unfinished: search_by_key
returned -2
Sep 23 23:03:39 castle kernel: ReiserFS version 3.6.25
Sep 23 23:03:59 castle kernel: reiserfs: checking transaction log (device
09:01) ...
Sep 23 23:03:59 castle kernel: is_tree_node: node level 0 does not match to
the expected one 65534
Sep 23 23:03:59 castle kernel: vs-5150: search_by_key: invalid format found
in block 0. Fsck?
Sep 23 23:03:59 castle kernel: vs-13070: reiserfs_read_inode2: i/o failure
occurred trying to find stat data of [1 2 0x0 SD]
Sep 23 23:03:59 castle kernel: Using r5 hash to sort names
Sep 23 23:03:59 castle kernel: is_tree_node: node level 0 does not match to
the expected one 65534
Sep 23 23:03:59 castle kernel: vs-5150: search_by_key: invalid format found
in block 0. Fsck?
Sep 23 23:03:59 castle kernel: vs-2140: finish_unfinished: search_by_key
returned -2
Sep 23 23:03:59 castle kernel: ReiserFS version 3.6.25

