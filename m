From: altaa@t-online.de (J. Paul Grube)
Subject: reiserfs--panik
Date: Mon, 27 Oct 2003 16:41:42 +0100
Message-ID: <3F9D3CB6.3030104@t-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15897-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

this is what i get...
Linux version 2.4.20-4GB-athlon (root@Athlon.suse.de) (gcc version 3.3 
20030226 (prerelease) (SuSE Linux)) #1 Wed Aug 6 18:27:52 UTC 2003

linux:/ # reiserfsck --rebuild-tree --scan-whole-partition /dev/md0
reiserfsck 3.6.4 (2002 www.namesys.com)
  *************************************************************
  ** Do not run rebuild-tree unless something is broken  and **
  ** MAKE A BACKUP before using it.  If you have bad sectors **
  ** on a drive  it is usually a bad idea  to continue using **
  ** it.  Then you probably should get a working hard drive, **
  ** copy the file system from the bad drive to the good one **
  ** -- dd_rescue is  a good tool for  that -- and only then **
  ** run this program.                                       **
  ** Additional ReiserFS support can be obtained from SuSE   **
  ** or at www.namesys.com                                   **
  *************************************************************

Will rebuild the filesystem (/dev/md0) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Mon Oct 27 12:04:22 2003
###########

Pass 0:
####### Pass 0 #######
The whole partition (78144128 blocks) is to be scanned
Skipping 10595 blocks (super block, journal, bitmaps) 78133533 blocks 
will be read
0%....20%....40%...                                            left 0, 
11312 /seccsecccccseccccc
23132 directory entries were hashed with "r5" hash.
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 78133533
                Leaves among those 51093
                        - corrected leaves 3
                pointers in indirect items to wrong area 585 (zeroed)
                Objectids found 25964

Pass 1 (will try to insert 51093 leaves):
####### Pass 1 #######
Looking for allocable blocks .. fininshed
0%....20%....40%....60%....80%....pass1.c 405 pass1_correct_leaf 1516, 
258 /sec
pass1_correct_leaf: block 75467236, item 0, pointer 88: The wrong 
pointer (3128855093) in the file [211 215]. Must be fixed on pass0.
Aborted
linux:/ #


