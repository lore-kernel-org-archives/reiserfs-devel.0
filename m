From: Bernd Niederberger <Bernd.Niederberger@gmx.net>
Subject: out of disk space
Date: Tue, 28 Oct 2003 02:16:43 +0100
Message-ID: <200310280216.43709.Bernd.Niederberger@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15909-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello,

I have a big problem. I can't access my data on /dev/hda4. 
First I got an error out of disk space therefore I deleted some big mpg files 
to get space. But after reboot I got the same error but I knew there should 
be some gig free space. Reiserfsck --fix-fixable /dev/hdb4 didn't help. Then 
I tried reiserfsck --rebuild-tree --scan-whole-partition /dev/hdb4 with the 
following problem:

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

Will rebuild the filesystem (/dev/hdb4) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Tue Oct 28 01:58:37 2003
###########

Pass 0:
####### Pass 0 #######
The whole partition (3221032 blocks) is to be scanned
Skipping 8309 blocks (super block, journal, bitmaps) 3212723 blocks will be 
read
0%....20%block 767160: The number of items (33807) is incorrect, should be (1) 
- corrected
block 767160: The free space (2936) is incorrect, should be (3792) - corrected
pass0: vpf-10110: block 767160, item (0): Unknown item type found [65538 
189891599 0x1000014d9e90000 ??? (8)] - deleted
....40%....60%....80%....100%                       left 0, 10744 /sec
77539 directory entries were hashed with "r5" hash.
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 3212723
                Leaves among those 23512
                        - leaves all contents of which could not be saved and 
deleted 1
                Objectids found 77540

Pass 1 (will try to insert 23511 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....100%                        left 0, 1119 
/sec
Flushing..finished
        23511 leaves read
                23498 inserted
                13 not inserted
####### Pass 2 #######

Pass 2:
0%....20%....40%....60%.Not enough allocable blocks, checking bitmap...there 
are 0 allocable blocks, btw

out of disk space
Aborted

Please help

regards

Bernd
