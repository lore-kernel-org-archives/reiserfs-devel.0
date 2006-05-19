From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: rebuild-tree failed twice. any hope ?
Date: Sat, 20 May 2006 01:35:54 +0400
Message-ID: <1148074554.6390.43.camel@tribesman.namesys.com>
References: <28583.1148057764@www021.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28654-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <28583.1148057764@www021.gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gerald Leier <precitool05@gmx.net>
Cc: reiserfs-list@namesys.com

On Fri, 2006-05-19 at 18:56 +0200, Gerald Leier wrote:
> hello listmembers,
> 
> it happend that i killed my filesystem, at least its not mountable
> anymore and "reiserfsck --rebuild-tree" was not able to finish
> and stoped during Phase 1 two times on different computers alltough
> the blocks where it finished where not identical it seems to me
> the same problem. the filesystem is about 500GB in size.
> 
> the following things happened. i had setup a raid6(software) and
> put it on 5 disks. one of them had hardware errors and shortly
> afterwards anotherone had some problems too. should be no big deal,
> as with my setup 2 disks should be able to fail without loss of data.
> 
> i had problems reading certain files (not enterable directorys)
> what i first did, and thats probably the worst i could do,
> is that i reiserfsck't -rebuild-tree on that filesystem. it didnt get very
> far (for the defective disks where causing severall hangs) and reiserfsck
> exited.
> 
> i then removed the faulty disks and added new ones. i run a
> rebuild on the raid and after a few hours i thought thats it.
> at least mdadm tells me that everything is allright now.
> reiserfsck could do its job i thought. the hardware is ok now.
> the raid6 works as it should...
> 
> has anyone an idea on how i can continue from here ?
> 

if it is reiserfsck error - I should be able to reproduce and debug it
if you will provide metadata of the filesystem:
debugreiserfs -p /dev/loop0 | bzip2 -c > metadata.bz2

If (more likely) it is hardware problem - you should find spare
partition (it would be better if that were plain harddrive, or linear
raid, because most of recent reports similar to your one were either on
raid[56] or lvm over such a raid), dd_rescue data to it and run
reiserfsck  there.

> some version information: linux kernel 2.6.6, reiserfsck 3.6.19, mount-2.12p
> 
> regarding the possibility of hardwareproblems. smart is enabled on all
> drives
> and there has been no error logged on any of the participating disks.
> also syslog doesnt show anything during a run of reiserfsck --rebuild-tree.
> 
> thanks for any hints
>  gerald
> 
> ----------------------------------------------------------
> below is a screenshot of reierfsck's output, the output of mount and the
> syslogsnipplet.
> 
> reiserfsck --rebuild-tree /dev/loop0
> 
> Will rebuild the filesystem (/dev/loop0) tree
> Will put log info to 'stdout'
> 
> Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes
> Replaying journal..
> Reiserfs journal '/dev/loop0' in blocks [18..8211]: 0 transactions replayed
> ###########
> reiserfsck --rebuild-tree started at Wed May 17 01:55:58 2006
> ###########
> 
> Pass 0:
> ####### Pass 0 #######
> Loading on-disk bitmap .. ok, 46713568 blocks marked used
> Skipping 12352 blocks (super block, journal, bitmaps) 46701216 blocks will
> be read
> 0%....20%...pass0: block 17857763, item 2: The file [11695 11698] has the
> wrong mode (?r--rw-rwx), corrected to (-r--rw-rwx)
> .40%pass0: block 21361945, item 2: Not the directory [14062 14070] has the
> wrong mode (drwxr----x), corrected to (-rwxr----x)
> .pass0: block 22410979, item 1: The directory [11344 22027] has the wrong
> mode (?-w---x--x), corrected to (d-w---x--x)
> verify_directory_item: block 22410979, item 11344 22027 0x1 DIR (3), len 80,
> location 3972 entry count 3, fsck need 0, format old: All entries were
> deleted from the directory
> pass0: block 22410979, item 2: The directory [11344 22043] has the wrong
> mode (?rwx---r--), corrected to (drwx---r--)
> pass0: block 22410979, item 11344 22043 0x1 DIR (3), len 448, location 3560
> entry count 10, fsck need 0, format old: 8 entries were deleted
> pass0: block 22410979, item 4: The directory [11344 22052] has the wrong
> mode (brw--wx---), corrected to (drw--wx---)
> verify_directory_item: block 22410979, item 11344 22052 0x1 DIR (3), len
> 104, location 3772 entry count 4, fsck need 0, format old: All entries were
> deleted from the directory
> pass0: vpf-10160: block 22410979: item 2: No "." entry found in the first
> item of a directory
> verify_directory_item: block 22410979, item 11344 22225 0x1 DIR (3), len
> 168, location 2968 entry count 5, fsck need 0, format old: All entries were
> deleted from the directory
> pass0: vpf-10160: block 22410979: item 2: No "." entry found in the first
> item of a directory
> pass0: block 22410979, item 14: The directory [11344 22254] has the wrong
> mode (?r-xr-x-w-), corrected to (dr-xr-x-w-)
> verify_directory_item: block 22410979, item 11344 22254 0x1 DIR (3), len
> 128, location 2964 entry count 4, fsck need 0, format old: All entries were
> deleted from the directory
> pass0: vpf-10160: block 22410979: item 2: No "." entry found in the first
> item of a directory
> pass0: block 22410979, item 17: The directory [11344 22289] has the wrong
> mode (?r-xr-x---), corrected to (dr-xr-x---)
> verify_directory_item: block 22410979, item 11344 22289 0x1 DIR (3), len
> 208, location 2652 entry count 6, fsck need 0, format old: All entries were
> deleted from the directory
> pass0: vpf-10160: block 22410979: item 2: No "." entry found in the first
> item of a directory
> pass0: block 22410979, item 18: The directory [11344 22329] has the wrong
> mode (br-x--x-wx), corrected to (dr-x--x-wx)
> verify_directory_item: block 22410979, item 11344 22329 0x1 DIR (3), len
> 120, location 2696 entry count 4, fsck need 0, format old: All entries were
> deleted from the directory
> pass0: vpf-10160: block 22410979: item 2: No "." entry found in the first
> item of a directory
> verify_directory_item: block 22410979, item 11344 22359 0x1 DIR (3), len
> 184, location 2588 entry count 5, fsck need 0, format old: All entries were
> deleted from the directory
> pass0: vpf-10160: block 22410979: item 2: No "." entry found in the first
> item of a directory
> pass0: block 22410979, item 20: The directory [11344 22363] has the wrong
> mode (?r--r---wx), corrected to (dr--r---wx)
> verify_directory_item: block 22410979, item 11344 22363 0x1 DIR (3), len
> 232, location 2496 entry count 6, fsck need 0, format old: All entries were
> deleted from the directory
> pass0: vpf-10160: block 22410979: item 2: No "." entry found in the first
> item of a directory
> pass0: block 22410979, item 21: The directory [11344 22429] has the wrong
> mode (?--xrw--w-), corrected to (d--xrw--w-)
> verify_directory_item: block 22410979, item 11344 22429 0x1 DIR (3), len
> 112, location 2572 entry count 4, fsck need 0, format old: All entries were
> deleted from the directory
> pass0: vpf-10160: block 22410979: item 2: No "." entry found in the first
> item of a directory
> .pass0: block 24737603, item 2: The file [16363 16366] has the wrong mode
> (srw--w-rwx), corrected to (-rw--w-rwx)
> ..pass0: block 29030667, item 2: The file [19942 19947] has the wrong mode
> (p-w-r--rw-), corrected to (--w-r--rw-)
> 60%....pass0: block 40007479, item 2: The file [27655 27666] has the wrong
> mode (lr-xr----x), corrected to (-r-xr----x)
> pass0: block 40007548, item 2: The file [27731 27746] has the wrong mode
> (?r--rwx-w-), corrected to (-r--rwx-w-)
> 80%.pass0: block 42596250, item 2: The file [30021 30032] has the wrong mode
> (?rw-r-x-w-), corrected to (-rw-r-x-w-)
> .                                                          left 0, 1447
> /seccc
> 3 directory entries were hashed with not set hash.
> 189348 directory entries were hashed with "r5" hash.
>         "r5" hash is selected
> 	Flushing..finished
> 	        Read blocks (but not data blocks) 46701216
> 		                Leaves among those 58798
> 				                        - corrected leaves 113
> pointers in indirect items to wrong area 10700 (zeroed)
> Objectids found 185702
> 
> Pass 1 (will try to insert 58798 leaves):
> ####### Pass 1 #######
> Looking for allocable blocks .. finished
> 0%....20%..                                                left 41642, 295
> /sec
> The problem has occurred looks like a hardware problem (perhaps
> memory). Send us the bug report only if the second run dies at
> the same place with the same block number.
> 
> build_the_tree: Nothing but leaves are expected. Block 17857434 - unknown
> 
> Abgebrochen
> 
> root@jokes:/# mkdir /jojo
> root@jokes:/# mount -t reiserfs /dev/loop0  /jojo
> mount: Not a directory
> 
> #### second try almost same logoutput... but on a different machine with
> tested cables and
> #### functional ram... also a 4 times faster ;)
> 
> root@jokes:/# reiserfsck /dev/loop0 --rebuild-tree
> reiserfsck 3.6.19 (2003 www.namesys.com)
> 
> *************************************************************
> ** Do not  run  the  program  with  --rebuild-tree  unless **
> ** something is broken and MAKE A BACKUP  before using it. **
> ** If you have bad sectors on a drive  it is usually a bad **
> ** idea to continue using it. Then you probably should get **
> ** a working hard drive, copy the file system from the bad **
> ** drive  to the good one -- dd_rescue is  a good tool for **
> ** that -- and only then run this program.                 **
> ** If you are using the latest reiserfsprogs and  it fails **
> ** please  email bug reports to reiserfs-list@namesys.com, **
> ** providing  as  much  information  as  possible --  your **
> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
> ** messages  (including version),  the reiserfsck logfile, **
> ** check  the  syslog file  for  any  related information. **
> ** If you would like advice on using this program, support **
> ** is available  for $25 at  www.namesys.com/support.html. **
> *************************************************************
> 
> Will rebuild the filesystem (/dev/loop0) tree
> Will put log info to 'stdout'
> 
> Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes
> Replaying journal..
> Reiserfs journal '/dev/loop0' in blocks [18..8211]: 0 transactions replayed
> ###########
> reiserfsck --rebuild-tree started at Fri May 19 09:59:50 2006
> ###########
> 
> Pass 0:
> ####### Pass 0 #######
> Loading on-disk bitmap .. ok, 46491531 blocks marked used
> Skipping 12352 blocks (super block, journal, bitmaps) 46479179 blocks will
> be read
> 0%....20%....40%.pass0: vpf-10540: block 22410977, item 0: Wrong order of
> items - change the obj
> ect_id of the key [11344 21018 0x0 SD (0)] to 21399
> pass0: vpf-10160: block 22410977: item 1: No "." entry found in the first
> item of a directory
> pass0: vpf-10160: block 22410979: item 12: No "." entry found in the first
> item of a directory
> pass0: vpf-10560: block 22410979, item 31: Wrong order of items - change the
> object_id of the key [11344 22449 0x1 DIR (3)] to 22429
> ... 60%....80%...                                                          
> left 0, 3197 /secc
> 188177 directory entries were hashed with "r5" hash.
> "r5" hash is selected
> Flushing..finished
> Read blocks (but not data blocks) 46479179
> Leaves among those 58532
> - corrected leaves 3
> pointers in indirect items to wrong area 1 (zeroed)
> Objectids found 185613
> 
> Pass 1 (will try to insert 58532 leaves):
> ####### Pass 1 #######
> Looking for allocable blocks .. finished
> 0%....20%..                                                left 42021, 917
> /sec
> The problem has occurred looks like a hardware problem (perhaps
> memory). Send us the bug report only if the second run dies at
> the same place with the same block number.
> 
> build_the_tree: Nothing but leaves are expected. Block 17857436 - unknown
> 
> 

