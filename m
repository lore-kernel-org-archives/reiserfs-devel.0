From: KAA <kaa@viva-solutions.com>
Subject: Mount fails after reiserfsck --rebuild-tree failure
Date: Wed, 17 Mar 2004 19:43:53 +0200
Message-ID: <40588E59.8080002@viva-solutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17281-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

hi there!
I'm running into a real big problem with one of my servers.
Very important data contained on its /dev/md0 which is RAID1
consisting of /dev/hda & /dev/hdc - both 120GB Seagate Barrackuda IV
Yesterday I had one of drive replaced with exactly the same one because 
of it's failure. After that mdadm with no complaints synced array and I 
mounted it without any problems. Later that day I've noticed several 
errors like following one in syslog:
  vs-5150: search_by_key: invalid format found in block 6377300. Fsck?
Mar 17 13:23:44 gate kernel: vs-13070: reiserfs_read_locked_inode: i/o 
failure occurred trying to find stat data of [13247 14
Mar 17 13:23:44 gate kernel: is_tree_node: node level 0 does not match 
to the expected one 1

so I've unmounted array fsck'ed it (unfortunately didn't save output of 
first fsck but it failed and recommended to do --rebuild-tree)
since that time fsck --rebuild-tree /dev/md0 fails with the same error 
all the time:


reiserfsck 3.6.13 (2003 www.namesys.com)

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

Will rebuild the filesystem (/dev/md0) tree
Will put log info to 'rebuild-tree.log'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Wed Mar 17 18:53:53 2004
###########

Pass 0:
Loading on-disk bitmap .. ok, 18587359 blocks marked used
Skipping 9105 blocks (super block, journal, bitmaps) 18578254 blocks 
will be read
0%....20%....40%....60%....80%....100%                        left 0, 
8914 /sec
         "r5" hash is selected
Flushing..finished
         Read blocks (but not data blocks) 18578254
                 Leaves among those 16268
                 Objectids found 55407

Pass 1 (will try to insert 16268 leaves):
Looking for allocable blocks ..
0%                                                         left 15846, 
422 /sec
The problem has occurred looks like a hardware problem (perhaps
memory). Send us the bug report only if the second run dies at
the same place with the same block number.

build_the_tree: Nothing but leaves are expected. Block 292951 - unknown

Aborted

rebuild-tree.log contains three lines:
####### Pass 0 #######
39673 directory entries were hashed with "r5" hash.
####### Pass 1 #######

is there any way to get my data back?
thanks in advance!
