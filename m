From: Farkas =?ISO-8859-1?Q?Barnab=E1s?= <kinca@freemail.hu>
Subject: resize reiserfs
Date: 04 Feb 2004 19:27:58 +0100
Message-ID: <1075919278.1901.14.camel@linux.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16697-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello World,

I would like to resize my reiserfs partition. When its finished, I
couldn't mount the partition. I've got error messages
I tried --rebuild-tree

linux:~ # /usr/local/sbin/reiserfsck --rebuild-tree /dev/hda1
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

Will rebuild the filesystem (/dev/hda1) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Wed Feb  4 19:20:21 2004
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 8434 blocks marked used
Skipping 8434 blocks (super block, journal, bitmaps) 0 blocks will be
read

Could not find a hash in use. Using "r5"
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 0
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

Aborted

and --check

linux:~ # /usr/local/sbin/reiserfsck --check /dev/hda1
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

Will read-only check consistency of the filesystem on /dev/hda1
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
###########
reiserfsck --check started at Wed Feb  4 19:21:50 2004
###########
Replaying journal..
0 transactions replayed
Checking internal tree..

Bad root block 0. (--rebuild-tree did not complete)

Aborted

debugreiserfs /dev/hda1

inux:~ # /usr/local/sbin/debugreiserfs /dev/hda1
debugreiserfs 3.6.11 (2003 www.namesys.com)


Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x301 of format 3.6 with standard
journal
Count of blocks on the device: 7327648
Number of bitmaps: 224
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 7327648
Root block: 0
Filesystem is cleanly umounted
Tree height: 65535
Hash function used to sort names: "r5"
Objectid map size 2, max 972
Journal parameters:
        Device [0x0]
        Magic [0x0]
        Size 8193 blocks (including 1 for journal header) (first block
18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0xfa02:
        FATAL corruptions exist.
sb_version: 2
inode generation number: 0
UUID: 4e4889c5-8054-4d5a-b050-754856b0d279
LABEL:
Set flags in SB:

mount

linux:~ # mount /dev/hda1 /data
mount: Not a directory


dmesg 

reiserfs: found format "3.6" with standard journal
reiserfs: checking transaction log (device ide0(3,1)) ...
for (ide0(3,1))
is_tree_node: node level 0 does not match to the expected one 65534
ide0(3,1):vs-5150: search_by_key: invalid format found in block 0. Fsck?
ide0(3,1):vs-13070: reiserfs_read_inode2: i/o failure occurred trying to
find stat data of [1 2 0x0 SD]
ide0(3,1):Using r5 hash to sort names
is_tree_node: node level 0 does not match to the expected one 65534
ide0(3,1):vs-5150: search_by_key: invalid format found in block 0. Fsck?
ide0(3,1):vs-2140: finish_unfinished: search_by_key returned -2

Could anyone help me?



