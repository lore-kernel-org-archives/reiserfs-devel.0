From: "Hayes, Greg" <Greg.Hayes@usi.net>
Subject: Having trouble, "Bad root block" with my reiserfs filesystem
Date: Fri, 2 Apr 2004 09:57:18 -0500
Message-ID: <3AE0C397BE18AC44B262A25922EDEDDE095D89E7@mstaex1i.usi.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17665-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I was having a normal day when I noticed I could no longer
see the root of my mounted filesystem. ls -al /data gave me=20
nothing. I could still see most of the filesystem outside of=20
root of the filesystem ( which is /data ).

I first tried to umount the filesystem with no luck. Then
I rebooted (mistake) now I could not mount the filesystem.

I the tried the reiserfsck that came with RH73 and it segfaulted.
I then installed the latest reiserfsprogs, and this is the result.

Any help is appreciated,

Thank you

Greg

PS: would it be worth a try to dd the filesystem to another disk
and run reiserfsck again ?

--------------------------

[root@soda sbin] ./reiserfsck --check /dev/hdb2
reiserfsck 3.6.14 (2003 www.namesys.com)
=20
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
=20
Will read-only check consistency of the filesystem on /dev/hdb2
Will put log info to 'stdout'
=20
Do you want to run this program?[N/Yes] (note need to type Yes if you =
do):
[root@soda sbin] ./reiserfsck --check --logfile fsck.log /dev/hdb2
reiserfsck 3.6.14 (2003 www.namesys.com)
=20
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
=20
Will read-only check consistency of the filesystem on /dev/hdb2
Will put log info to 'fsck.log'
=20
Do you want to run this program?[N/Yes] (note need to type Yes if you =
do):Yes
###########
reiserfsck --check started at Thu Apr  1 16:29:54 2004
###########
=20
reiserfs_open_journal: journal parameters from the superblock does not =
match
to the journal headers ones. It looks like that you created your fs with =
old
reiserfsprogs. Journal header is fixed.
=20
Replaying journal..
Reiserfs journal '/dev/hdb2' in blocks [18..8211]: 0 transactions =
replayed
Checking internal tree..finished
Comparing bitmaps..Bad nodes were found, Semantic pass skipped
1 found corruptions can be fixed only when running with --rebuild-tree
###########
reiserfsck finished at Thu Apr  1 16:31:43 2004
###########
[root@soda sbin] ./reiserfsck --check --rebuild-tree --logfile fsck2.log =
/dev/hdb2
reiserfsck 3.6.14 (2003 www.namesys.com)
=20
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
=20
Will rebuild the filesystem (/dev/hdb2) tree
Will put log info to 'fsck2.log'
=20
Do you want to run this program?[N/Yes] (note need to type Yes if you =
do):Yes
Replaying journal..
Reiserfs journal '/dev/hdb2' in blocks [18..8211]: 0 transactions =
replayed
###########
reiserfsck --rebuild-tree started at Thu Apr  1 17:14:17 2004
###########
=20
Pass 0:
Loading on-disk bitmap .. ok, 37676155 blocks marked used
Skipping 9402 blocks (super block, journal, bitmaps) 37683119 blocks =
will be read
0%....20%....40%....60%....80%....100%                       left 0, =
12144 /sec
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 37683119
                Leaves among those 193606
                        - leaves all contents of which could not be =
saved and deleted 6
                Objectids found 493400
=20
Pass 1 (will try to insert 193600 leaves):
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....100%                        left 0, =
1119 /sec
Flushing..finished
        193600 leaves read
                138856 inserted
                        - pointers in indirect items pointing to =
metadata 348 (zeroed)
                54744 not inserted
        non-unique pointers in indirect items (zeroed) 7851054
=20
Pass 2:
0%....20%....40%....60%....80%....100%                         left 0, =
771 /sec
Flushing..finished
        Leaves inserted item by item 54744
Pass 3 (semantic):
Flushing..finished
        Files found: 0
        Directories found: 2
Pass 3a (looking for lost dir/files):
Looking for lost directories:
/17986_24074/ii/dbSegmentation fault
[root@soda sbin] mount /data
mount: Not a directory
You have new mail in /var/spool/mail/root
[root@soda sbin] ./reiserfsck --check --rebuild-tree --logfile fsck3.log =
/dev/hdb2
reiserfsck 3.6.14 (2003 www.namesys.com)
=20
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
=20
Will rebuild the filesystem (/dev/hdb2) tree
Will put log info to 'fsck3.log'
=20
Do you want to run this program?[N/Yes] (note need to type Yes if you =
do):Yes
[root@soda sbin] ./reiserfsck --check --logfile fsck3.log /dev/hdb2 =
reiserfsck 3.6.14 (2003 www.namesys.com)
=20
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
=20
Will read-only check consistency of the filesystem on /dev/hdb2
Will put log info to 'fsck3.log'
=20
Do you want to run this program?[N/Yes] (note need to type Yes if you =
do):Yes
###########
reiserfsck --check started at Fri Apr  2 09:02:21 2004
###########
Replaying journal..
Reiserfs journal '/dev/hdb2' in blocks [18..8211]: 0 transactions =
replayed
Checking internal tree..
=20
Bad root block 0. (--rebuild-tree did not complete)
=20
Aborted
[root@soda sbin]
