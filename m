From: Stuart McRobert <sm@doc.ic.ac.uk>
Subject: Recovering from bad-blocks problem, rebuild failure
Date: Sun, 28 Dec 2003 00:30:53 +0000
Message-ID: <E1AaOpZ-0002GQ-00@duck.doc.ic.ac.uk>
Return-path: <reiserfs-list-return-16410-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: reiserfs-list@namesys.com

Hi,

Problem Overview

	Data recovery from failed disk, reiserfs recovery problem.
	What to do next.

Problem Caused by...

	Disk suddenly developed bad blocks, especially at the start
	of the partition, ouch.  Problem confirmed with IBM DFT tool,
	but couldn't fix.

Action Taken

	All readable data transferred to a new disk partition and an
	online backup taken, so I can retry rebuilding.  Nearly all the
	data could be read, except for key blocks at the start and a few
	scattered around the rest of the partition.

	reiserfsck --check couldn't find superblock (known to be lost)

	resierfsck --rebuild-sb

	Worked, and tried both 3.5.9 and 3.6.x options for the superblock
	since, although fairly recent, not sure exactly which version was
	in use.

Problem Encountered

	reiserfsck (version 3.6.11) --rebuild-tree

	fails after Pass 2 with No reiserfs metadata found....

	Details below.

Question

	Is there any way to recover the data files?  Seems so close
	but so far, suggestions welcome.

More Information

	I was just about to backup this drive when it started to fail,
	it had linux root/boot partition and main data partition.

	Although I've recovered most of the blocks to a new drive using
	dd conv=3Dnoerror,sync and obtained the correct amount of data
	(now including some null blocks), I'm chiefly missing the
	superblock and, I guess, some metadata.

	Because the failed drive contained the root area, I've
	re-installed linux, probably slightly newer release, and used the latest
	reiserfs tools and fsck from the namesys web site.

	I believe the lost system was using SuSE Pro 8.2.

	The recovered data has been placed onto a new partition, just
	slightly larger than the previous one, so /dev/hdb3 recovered
	to /dev/sda6.

	Ideas welcome on how to move ahead with the recovery.

	Thanks.

Best wishes

	Stuart

Script started on Sat Dec 27 23:06:27 2003
# ./reiserfsck --check /dev/sda6
reiserfsck 3.6.11 (2003 www.namesys.com)

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

Will read-only check consistency of the filesystem on /dev/sda6
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Y=
es

reiserfs_open: the reiserfs superblock cannot be found on /dev/sda6.

Failed to open the filesystem.

If the partition table has not been changed, and the partition is
valid  and  it really  contains  a reiserfs  partition,  then the
superblock  is corrupted and you need to run this utility with
--rebuild-sb.

Aborted
# od -c /dev/sda6 | more
0000000  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
*
0010000 004  \0  \0  \0 005  \0  \0  \0 006  \0  \0  \0  \0  \0   =B6   9
0010020   =ED 002  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0010040 004 200  \0  \0 005 200  \0  \0 006 200  \0  \0   =F1 020 033   5
0010060   %  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0010100  \0  \0 001  \0 001  \0 001  \0 006  \0 001  \0   =E1   J   s   9
0010120   =E1 001  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0010140 004 200 001  \0 005 200 001  \0 006 200 001  \0   g   ]   =E1   9
0010160   $ 001  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0010200  \0  \0 002  \0 001  \0 002  \0 006  \0 002  \0  \0  \0   =A8   9
0010220   N 002  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0010240 004 200 002  \0 005 200 002  \0 006 200 002  \0  \0  \0   K   9
0010260   i 002  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0010300  \0  \0 003  \0 001  \0 003  \0 006  \0 003  \0  \0  \0   G   9
0010320  \n 003  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0010340 004 200 003  \0 005 200 003  \0 006 200 003  \0  \0  \0 213   9
0010360   q 003  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0010400  \0  \0 004  \0 001  \0 004  \0 006  \0 004  \0  \0  \0 036   9
0010420   =F9 002  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0010440 004 200 004  \0 005 200 004  \0 006 200 004  \0  \0  \0   +   9
0010460   =CC 002  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0010500  \0  \0 005  \0 001  \0 005  \0 006  \0 005  \0  \0  \0   =AC   9
0010520 223 003  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0010540  \0 200 005  \0 001 200 005  \0 006 200 005  \0  \0  \0   =C0   9
0010560   B 003  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0010600  \0  \0 006  \0 001  \0 006  \0 006  \0 006  \0  \0  \0   =B2   9
0010620   =AA 003  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0010640  \0 200 006  \0 001 200 006  \0 006 200 006  \0  \0  \0   =A4   9
0010660   =C9 003  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0010700  \0  \0  \a  \0 001  \0  \a  \0 006  \0  \a  \0  \0  \0 177   9
0010720   e 003  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0010740  \0 200  \a  \0 001 200  \a  \0 006 200  \a  \0  \0  \0   ~   9
0010760 221 002  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0011000  \0  \0  \b  \0 001  \0  \b  \0 006  \0  \b  \0  \0  \0   =D0   9
0011020   =AE 002  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0011040  \0 200  \b  \0 001 200  \b  \0 006 200  \b  \0  \0  \0 232   8
0011060   =A9 001  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0011100  \0  \0  \t  \0 001  \0  \t  \0 006  \0  \t  \0  \0  \0   =B3   9
0011120   x 002  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0011140  \0 200  \t  \0 001 200  \t  \0 006 200  \t  \0  \0  \0   =C1   9
0011160   S 002  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0011200  \0  \0  \n  \0 001  \0  \n  \0 006  \0  \n  \0  \0  \0 027   :
0011220   =BB 002  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0011240  \0 200  \n  \0 001 200  \n  \0 006 200  \n  \0  \0  \0   .   :
0011260   =C5 001  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0011300  \0  \0  \v  \0 001  \0  \v  \0 006  \0  \v  \0  \0  \0 217   ;
0011320   v 001  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0011340  \0 200  \v  \0 001 200  \v  \0 006 200  \v  \0  \0  \0   \   :
0011360   + 001  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0011400  \0  \0  \f  \0 001  \0  \f  \0 006  \0  \f  \0   =AE 001   =C0   9
0011420   N 002  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0011440 004 200  \f  \0 005 200  \f  \0 006 200  \f  \0  \0  \0   =F1   9

# ./reiserfsck --rebuild-sb /dev/sda6
reiserfsck 3.6.11 (2003 www.namesys.com)

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

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Y=
es

reiserfs_open: the reiserfs superblock cannot be found on /dev/sda6.

what the version of ReiserFS do you use[1-4]
	(1)   3.6.x
	(2) >=3D3.5.9 (introduced in the middle of 1999) (if you use linux 2.2, ch=
oose this one)
	(3) < 3.5.9 converted to new format (don't choose if unsure)
	(4) < 3.5.9 (this is very old format, don't choose if unsure)
	(X)   exit
1

Enter block size [4096]:=20


No journal device was specified. (If journal is not available, re-run with =
--no-journal-available option specified).
Is journal default? (y/n)[y]:=20

Did you use resizer(y/n)[n]:=20
rebuild-sb: no uuid found, a new uuid generated (2a864eee-d021-443b-b243-19=
9bb9d47f13)

rebuild-sb: You either have a corrupted journal or have just changed
the start of the partition with some partition table editor. If you are
sure that the start of the partition is ok, rebuild the journal header.
Do you want to rebuild the journal header? (y/n)[n]: y
Reiserfs super block in block 16 on 0x806 of format 3.6 with standard journ=
al
Count of blocks on the device: 10998492
Number of bitmaps: 336
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] bloc=
ks): 0
Root block: 0
Filesystem is NOT cleanly umounted
Tree height: 0
Hash function used to sort names: not set
Objectid map size 0, max 972
Journal parameters:
	Device [0x0]
	Magic [0x0]
	Size 8193 blocks (including 1 for journal header) (first block 18)
	Max transaction length 1024 blocks
	Max batch size 900 blocks
	Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x1:
	 some corruptions exist.
sb_version: 2
inode generation number: 0
UUID: 2a864eee-d021-443b-b243-199bb9d47f13
LABEL:=20
Set flags in SB:
Is this ok ? (y/n)[n]: y
The fs may still be unconsistent. Run reiserfsck --check.

# ./reiserfsck --check /dev/sda6
reiserfsck 3.6.11 (2003 www.namesys.com)

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

Will read-only check consistency of the filesystem on /dev/sda6
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Y=
es
###########
reiserfsck --check started at Sat Dec 27 23:09:08 2003
###########
Replaying journal..
No transactions found
Checking internal tree..

Bad root block 0. (--rebuild-tree did not complete)

Aborted
# ./reiserfsck --rebuild-tree /dev/sda6
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

Will rebuild the filesystem (/dev/sda6) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Y=
es
Replaying journal..
No transactions found
###########
reiserfsck --rebuild-tree started at Sat Dec 27 23:10:03 2003
###########

Pass 0:
####### Pass 0 #######		[note: removed the progress entries for readability]
Loading on-disk bitmap .. ok, 7175546 blocks marked used
init_source_bitmap: Bitmap 0 (of 32768 bits) is wrong - mark all blocks [0 =
- 32768] as used
init_source_bitmap: Bitmap 1 (of 32768 bits) is wrong - mark all blocks [32=
768 - 65536] as used
init_source_bitmap: Bitmap 3 (of 32768 bits) is wrong - mark all blocks [98=
304 - 131072] as used
init_source_bitmap: Bitmap 5 (of 32768 bits) is wrong - mark all blocks [16=
3840 - 196608] as used
init_source_bitmap: Bitmap 7 (of 32768 bits) is wrong - mark all blocks [22=
9376 - 262144] as used
init_source_bitmap: Bitmap 9 (of 32768 bits) is wrong - mark all blocks [29=
4912 - 327680] as used
init_source_bitmap: Bitmap 25 (of 32768 bits) is wrong - mark all blocks [8=
19200 - 851968] as used
init_source_bitmap: Bitmap 27 (of 32768 bits) is wrong - mark all blocks [8=
84736 - 917504] as used
init_source_bitmap: Bitmap 49 (of 32768 bits) is wrong - mark all blocks [1=
605632 - 1638400] as used
init_source_bitmap: Bitmap 81 (of 32768 bits) is wrong - mark all blocks [2=
654208 - 2686976] as used
init_source_bitmap: Bitmap 125 (of 32768 bits) is wrong - mark all blocks [=
4096000 - 4128768] as used
init_source_bitmap: Bitmap 243 (of 32768 bits) is wrong - mark all blocks [=
7962624 - 7995392] as used
Skipping 8546 blocks (super block, journal, bitmaps) 7423263 blocks will be=
 read
pass0: vpf-10110: block 1567701, item (0): Unknown item type found [1200384=
5 45316 0x9000100 ??? (15)] - deleted
block 2794221: The free space (2048) is incorrect, should be (2000) - corre=
cted
pass0: vpf-10110: block 2794221, item (0): Unknown item type found [1342853=
13 65537 0x8010000 ??? (15)] - deleted
block 2794506: The free space (0) is incorrect, should be (4072) - corrected
block 2794545: The number of items (2048) is incorrect, should be (1) - cor=
rected
block 2794545: The free space (2048) is incorrect, should be (2000) - corre=
cted
pass0: block 2794545, item 0: StatData item of wrong length found 2049 1342=
83264 0x0 SD (0), len 2048, location 2048 entry count 1, fsck need 0, forma=
t new - deleted
block 2796717: The free space (2048) is incorrect, should be (2000) - corre=
cted
pass0: block 2796717, item 0: StatData item of wrong length found 134285313=
 134219776 0x0 SD (0), len 2048, location 2048 entry count 0, fsck need 0, =
format BAD - deleted
block 2797038: The number of items (2048) is incorrect, should be (1) - cor=
rected
block 2797038: The free space (2048) is incorrect, should be (2000) - corre=
cted
pass0: vpf-10200: block 2797038, item 0: The item [134219776 2048 0x1100100=
000000 IND (1)] with wrong offset is deleted
block 2797203: The number of items (2048) is incorrect, should be (1) - cor=
rected
block 2797203: The free space (2048) is incorrect, should be (2000) - corre=
cted
pass0: vpf-10110: block 2797203, item (0): Unknown item type found [0 13421=
9776 0x8000800 ??? (15)] - deleted
block 2799108: The free space (1) is incorrect, should be (2000) - corrected
pass0: vpf-10150: block 2799108: item 0: Wrong key [0 6291552 0x82118210001=
0001 IND (1)], deleted
block 7996633: The free space (0) is incorrect, should be (4048) - corrected
pass0: vpf-10110: block 7996633, item (0): Unknown item type found [0 16777=
231 0xf00000 ??? (15)] - deleted
Could not find a hash in use. Using "r5"
Selected hash ("r5") does not match to the hash set in the super block (not=
 set).
	"r5" hash is selected
Flushing..finished
	Read blocks (but not data blocks) 7423263
		Leaves among those 13
			- leaves all contents of which could not be saved and deleted 13
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
is likely to be the right super block version.                       =20
If this makes you nervous, try  www.namesys.com/support.html,  and for
$25 the author of fsck,  or a colleague  if he is out,  will  step you
through it all.

Aborted
# fdisk /dev/sda

The number of cylinders for this disk is set to 17849.
There is nothing wrong with that, but this is larger than 1024,
and could in certain setups cause problems with:
1) software that runs at boot time (e.g., old versions of LILO)
2) booting and partitioning software from other OSs
   (e.g., DOS FDISK, OS/2 FDISK)

Command (m for help): p

Disk /dev/sda: 146.8 GB, 146815737856 bytes
255 heads, 63 sectors/track, 17849 cylinders
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1   *         1       300   2409718+  83  Linux
/dev/sda2           301     17849 140962342+   5  Extended
/dev/sda5           301       400    803218+  82  Linux swap
/dev/sda6           401      5877  43993971   83  Linux
/dev/sda7          5878      7678  14466501   83  Linux
/dev/sda8          7679     17849  81698526   83  Linux

Command (m for help): quit

# fdisk /dev/hdb

The number of cylinders for this disk is set to 7476.
There is nothing wrong with that, but this is larger than 1024,
and could in certain setups cause problems with:
1) software that runs at boot time (e.g., old versions of LILO)
2) booting and partitioning software from other OSs
   (e.g., DOS FDISK, OS/2 FDISK)

Command (m for help): p

Disk /dev/hdb: 61.4 GB, 61492838400 bytes
255 heads, 63 sectors/track, 7476 cylinders
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hdb1             1      1800  14458468+  83  Linux
/dev/hdb2          1801      2000   1606500   82  Linux swap
/dev/hdb3          2001      7476  43985970   83  Linux

Command (m for help): quit

# uname -a
Linux localhost 2.4.21-0.13mdk #1 Fri Mar 14 15:08:06 EST 2003 i686 unknown=
 unknown GNU/Linux
