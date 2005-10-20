From: Detlef Grittner <detlef.grittner@t-online.de>
Subject: Re: reiserfs in cryptoloop file is corrupt: all data lost?
Date: Thu, 20 Oct 2005 23:24:34 +0200
Message-ID: <43580B12.9030406@t-online.de>
References: <43569E08.8000405@t-online.de> <4356ABCE.1010009@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26586-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4356ABCE.1010009@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

evilninja wrote:
> [...]
> you ran reiserfsck on what? on the losetup'ed /dev/loop0 i hope ;-)
> please provide the output of the reiserfsck run. please make sure that 
> you're running a current version of reiserfsprogs / current kernel.
>
>
Yes, I use it on the losetup'ed /dev/loop0. Well, it took me some while 
to copy the 10 GB file for another run, but finally here is the complete 
output.

linux:/home/detgri # debugreiserfs /dev/loop0
debugreiserfs 3.6.18 (2003 www.namesys.com)


Filesystem state: consistent

Reiserfs super block in block 16 on 0x700 of format 3.6 with standard 
journal
Count of blocks on the device: 2621568
Number of bitmaps: 80
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] 
blocks): 660079
Root block: 2195471
Filesystem is clean
Tree height: 4
Hash function used to sort names: "r5"
Objectid map size 2, max 972
Journal parameters:
        Device [0x0]
        Magic [0x563f2dc5]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0:
sb_version: 2
inode generation number: 1441
UUID: 5d2ea9cd-673d-469a-9cc9-50583421df1d
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN

==========================================


linux:/home/detgri # reiserfsck --check /dev/loop0
reiserfsck 3.6.18 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will read-only check consistency of the filesystem on /dev/loop0
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
bread: Cannot read the block (2621567): (Invalid argument).

reiserfs_open: Your partition is not big enough to contain the
filesystem of (2621567) blocks as was specified in the found super block.

Failed to open the filesystem.

If the partition table has not been changed, and the partition is
valid  and  it really  contains  a reiserfs  partition,  then the
superblock  is corrupted and you need to run this utility with
--rebuild-sb.

Abgebrochen

==========================================

linux:/home/detgri # reiserfsck --rebuild-sb /dev/loop0
reiserfsck 3.6.18 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will check superblock and rebuild it if needed
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes

Did you use resizer(y/n)[n]: n
rebuild-sb: wrong block count occured (2621568), fixed (2621440)
Reiserfs super block in block 16 on 0x700 of format 3.6 with standard 
journal
Count of blocks on the device: 2621440
Number of bitmaps: 80
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] 
blocks): 660079
Root block: 2195471
Filesystem is clean
Tree height: 4
Hash function used to sort names: "r5"
Objectid map size 2, max 972
Journal parameters:
        Device [0x0]
        Magic [0x563f2dc5]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x1:
         some corruptions exist.
sb_version: 2
inode generation number: 1441
UUID: 5d2ea9cd-673d-469a-9cc9-50583421df1d
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN
Is this ok ? (y/n)[n]: y
The fs may still be unconsistent. Run reiserfsck --check.

==========================================


linux:/home/detgri # reiserfsck --check /dev/loop0
reiserfsck 3.6.18 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will read-only check consistency of the filesystem on /dev/loop0
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
###########
reiserfsck --check started at Thu Oct 20 23:13:21 2005
###########
Replaying journal..
No transactions found
Checking internal tree..block 2195471: The level of the node (123) is 
not correct, (3) expected
 the problem in the internal node occured (2195471), whole subtree is 
skipped
finished
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps differs.
Bad nodes were found, Semantic pass skipped
1 found corruptions can be fixed only when running with --rebuild-tree
###########
reiserfsck finished at Thu Oct 20 23:13:25 2005
###########


==========================================


linux:/home/detgri # reiserfsck --rebuild-tree /dev/loop0
reiserfsck 3.6.18 (2003 www.namesys.com)

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

Will rebuild the filesystem (/dev/loop0) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
Replaying journal..
No transactions found
###########
reiserfsck --rebuild-tree started at Thu Oct 20 23:14:12 2005
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 1959871 blocks marked used
Skipping 8282 blocks (super block, journal, bitmaps) 1951589 blocks will 
be read
0%....20%....40%....60%....80%....100%                        left 0, 
6920 /sec
Could not find a hash in use. Using "r5"
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 1951589
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
is likely to be the right super block version.
If this makes you nervous, try  www.namesys.com/support.html,  and for
$25 the author of fsck,  or a colleague  if he is out,  will  step you
through it all.

Abgebrochen


==========================================

I'm absolutely sure that the file contained a reiserfs and I haven't 
changed any partitions. It's really only one cryptoloop file.

I'm using a SuSE 10.0 with the tools that are delivered with it.

linux:/home/detgri # uname -a
Linux linux 2.6.13-15-default #1 Tue Sep 13 14:56:15 UTC 2005 x86_64 
x86_64 x86_64 GNU/Linux


Any ideas, what I should do next?


Detlef
