From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Problem with reiserfs
Date: Sat, 03 Jul 2004 13:57:44 +0400
Message-ID: <40E68318.1050402@namesys.com>
References: <200407021942.05459.Uwe.Beach@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19493-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407021942.05459.Uwe.Beach@gmx.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Uwe Wagner <Uwe.Beach@gmx.de>
Cc: reiserfs-list@namesys.com

Uwe Wagner wrote:
> Hi,
> 
> I've problems with a reiserfs filesystem.
> 
> reiserfs --check /dev/hda6 reports:
> 
> ###########
> reiserfsck --check started at Fri Jul  2 19:32:09 2004
> ###########
> Replaying journal..
> No transactions found
> Checking internal tree..
> 
> Bad root block 0. (--rebuild-tree did not complete)
> 
> Aborted
> 
> 
> I've tried the following :
> 
> echo "\n" | ./debugreiserfs -k -S -q /dev/hda6 | head -10000
> debugreiserfs 3.6.17 (2003 www.namesys.com)
> 
> Whole device (40035980 blocks) is to be scanned
> looking for ([0 0])
> 0%....20%....40%....60%....80%....100%
> Log file 'scan.log' is opened
> What key do you want to find: dirid?objectid?block 16 is reiserfs super block
> block 3823602 is reiserfs leaf node
> block 4253995 is reiserfs leaf node
> block 9145906 is reiserfs leaf node
> block 19806806 is reiserfs leaf node
> 
> 
> 
> 
> 
> reiserfsck --rebuild-tree -S --logfile /tmp/reiser.log /dev/hda6
> 
> Replaying journal..
> No transactions found
> ###########
> reiserfsck --rebuild-tree started at Fri Jul  2 17:52:15 2004
> ###########
> 
> Pass 0:
> The whole partition (40035980 blocks) is to be scanned
> Skipping 9432 blocks (super block, journal, bitmaps) 40026548 blocks will be 
> rea
> d
> 0%....20%....40%....60%....80%....100%                       left 0, 
> 10690 /sec
> Selected hash ("r5") does not match to the hash set in the super block (not 
> set)
> .
>         "r5" hash is selected
> Flushing..finished
>         Read blocks (but not data blocks) 40026548
>                 Leaves among those 4
>                         - leaves all contents of which could not be saved and 
> de
> leted 4
>                 Objectids found 2
> 
> Pass 1 (will try to insert 0 leaves):
> Looking for allocable blocks .. finished
> 
> Flushing..finished
>         0 leaves read
>                 0 inserted
> Flushing..finished
> 
> 
> No reiserfs metadata found.  If you are sure that you had the reiserfs
> on this partition,  then the start  of the partition  might be changed
> or all data were wiped out. The start of the partition may get changed
> by a partitioner  if you have used one.  Then you probably rebuilt the
> superblock as there was no one.  Zero the block at 64K offset from the
> start of the partition (a new super block you have just built) and try
> to move the start of the partition a few cylinders aside  and check if
> debugreiserfs /dev/xxx detects a reiserfs super block. If it does this
> is likely to be the right super block version.                        
> If this makes you nervous, try  www.namesys.com/support.html,  and for
> $25 the author of fsck,  or a colleague  if he is out,  will  step you
> through it all.
> 
> Aborted
> 
> 
> the contents of /tmp/reiser.log :
> 
> ####### Pass 0 #######
> block 3823602: The free space (4094) is incorrect, should be (4072) - 
> corrected
> block 4253995: The number of items (39428) is incorrect, should be (1) - 
> corrected
> block 4253995: The free space (1791) is incorrect, should be (720) - corrected
> pass0: vpf-10110: block 4253995, item (0): Unknown item type found [83860229 
> 2567307162 0x20006ff ??? (15)] - deleted
> block 9145906: The number of items (24) is incorrect, should be (1) - 
> corrected
> block 9145906: The free space (34063) is incorrect, should be (3792) - 
> corrected
> pass0: vpf-10110: block 9145906, item (0): Unknown item type found [4143972353 
> 33554626 0xb4850f00 ??? (15)] - deleted
> block 19806806: The number of items (1890) is incorrect, should be (1) - 
> corrected
> block 19806806: The free space (1) is incorrect, should be (3280) - corrected
> pass0: vpf-10210: block 19806806, item 0: The item with wrong offset or length 
> found [3574071296 16777405 0xf0802000018c008 DRCT (2)], len 768 - deleted
> Could not find a hash in use. Using "r5"
> ####### Pass 1 #######
> ####### Pass 2 #######
> 
> 
> Is there a chance to repair the filesystem ?
> 

Are you sure that there was reiserfs on /dev/hda6? What happened to it?
Unfortunately, I am afraid, that reiserfsck will not be able to help 
you, because /dev/hda6 does not contain data reiserfsck used to work with.

> regards
> uwe
> 
> 


