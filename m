From: "Stephan Reichel" <Stephan.Reichel@1net4you.de>
Subject: bug report
Date: Tue, 25 Nov 2003 01:44:19 +0100
Message-ID: <NHBBLMBAALMFLLANBMBIMECPCAAA.Stephan.Reichel@1net4you.de>
References: <200311231519.11431.vitaly@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0000_01C3B2F5.A4A03400"
Return-path: <reiserfs-list-return-16155-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200311231519.11431.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_0000_01C3B2F5.A4A03400
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: 7bit

Hello,
thanks to Vitaly for the hint.
And this is the next result:
-----------

proxy:/home/reichel# reiserfsck --rebuild-tree -l /home/reichel/rfsck.log
/dev/hdb6
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

Will rebuild the filesystem (/dev/hdb6) tree
Will put log info to '/home/reichel/rfsck.log'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes

******************************************************
* Warning: The dma on your hard drive is turned off. *
* This may really slow down the fsck process.        *
******************************************************
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Mon Nov 24 21:18:21 2003
###########

Pass 0:
Loading on-disk bitmap .. ok, 3472752 blocks marked used
Skipping 8459 blocks (super block, journal, bitmaps) 3464293 blocks will be
read
0%....20%....40%....60%....80%....100%                         left 0, 560
/sec
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 3464293
                Leaves among those 57850
                        - leaves all contents of which could not be saved
and deleted 1
                Objectids found 371712

Pass 1 (will try to insert 57849 leaves):
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....100%                         left 0, 191
/sec
Flushing..finished
        57849 leaves read
                57428 inserted
                        - pointers in indirect items pointing to metadata 10
(zeroed)
                421 not inserted
        non-unique pointers in indirect items (zeroed) 59

Pass 2:
0%....20%....40%....60%....80%....100%                          left 0, 13
/sec
Flushing..finished
        Leaves inserted item by item 421
Pass 3 (semantic):
/old_var/spool/wwwoffle/prevout6/OrQokTtODwNeuEEihdvrfHQlbalance.c 1019
leaf_delete_items_entirely
leaf_delete_items_entirely: bad leaf 55340: level=1, nr_items=22,
free_space=65484 rdkey
Aborted

---------

See also attached log file.

Thanks,
Stephan Reichel



------=_NextPart_000_0000_01C3B2F5.A4A03400--

