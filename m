From: dhuffman@storix.com
Subject: Possible bug in fsck.reiserfs
Date: Thu, 21 Apr 2005 14:21:17 +0000
Message-ID: <200504211421.18126.dhuffman@storix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23907-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: ajohnson@storix.com

I hope this is enough information to make a determination was to whether this 
is a bug or I am doing something wrong. The goal is to have a reiserFS with 
an external log device. Upon reboot, fsck.reiserfs fails and drops the boot 
process to a shell. Here are the details.


Error message:
reiserfs_open_journal: journal parameters from the super block does not match
to journal parameters from the journal. You should run  reiserfsck with 
--rebuild-sb to check your superblock consistency.

Step to create the error message:
1) Create reiserfs on logical volume with external log (also on a logical 
volume).

# mkfs.reiserfs -b 512 -l test1 -j /dev/suse92/reiserloglv /dev/suse92/test1lv

Guessing about desired format.. Kernel 2.6.8-24.11-default is running.
NOTE: journal new size 24576 is greater than default size 3966:
this may slow down initializing and mounting of the journal. Hope it is ok.

Format 3.6 with non-standard journal
Count of blocks on the device: 73728
Number of blocks consumed by mkreiserfs formatting process: 148
Blocksize: 512
Hash function used to sort names: "r5"
Journal Device [0xfdfd]
Journal Size 24576 blocks (first block 0)
Journal Max transaction length 128
Space on this device reserved by journal: 0
inode generation number: 0
UUID: ae5c3012-34d4-4887-a3ba-cd4d5beb113e
LABEL: test1
ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
        ALL DATA WILL BE LOST ON '/dev/suse92/test1lv' AND ON JOURNAL DEVICE 
'/dev/suse92/reiserloglv'!
Continue (y/n):y
Initializing journal - 0%....20%....40%....60%....80%....100%
Syncing..ok
ReiserFS is successfully created on /dev/suse92/test1lv.

# fsck.reiserfs /dev/suse92/test1lv

reiserfs_open_journal: journal parameters from the super block does not match
to journal parameters from the journal. You should run  reiserfsck with 
--rebuild-sb to check your superblock consistency.

# reiserfsck --rebuild-sb -j /dev/suse92/reiserloglv /dev/suse92/test1lv

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

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Reiserfs super block in block 128 on 0xfdfa of format 3.6 with non-standard 
journal
Count of blocks on the device: 73728
Number of bitmaps: 18
Blocksize: 512
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] 
blocks): 73580
Root block: 130
Filesystem is clean
Tree height: 2
Hash function used to sort names: "r5"
Objectid map size 2, max 76
Journal parameters:
        Device [0xfdfd]
        Magic [0x407ae418]
        Size 24576 blocks (including 1 for journal header) (first block 0)
        Max transaction length 128 blocks
        Max batch size 112 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0:
sb_version: 2
inode generation number: 0
UUID: ae5c3012-34d4-4887-a3ba-cd4d5beb113e
LABEL: test1
Set flags in SB:
        ATTRIBUTES CLEAN

Super block seems to be correct

# fsck.reiserfs /dev/suse92/test1lv

reiserfs_open_journal: journal parameters from the super block does not match
to journal parameters from the journal. You should run  reiserfsck with 
--rebuild-sb to check your superblock consistency.


###################################################
To test the consistancy between the journal parameters
###################################################

# debugreiserfs -J /dev/suse92/test1lv -j /dev/suse92/reiserloglv

debugreiserfs 3.6.18 (2003 www.namesys.com)


Filesystem state: consistent

Reiserfs super block in block 128 on 0xfdfa of format 3.6 with non-standard 
journal
Count of blocks on the device: 73728
Number of bitmaps: 18
Blocksize: 512
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] 
blocks): 73580
Root block: 130
Filesystem is clean
Tree height: 2
Hash function used to sort names: "r5"
Objectid map size 2, max 76
Journal parameters:
        Device [0xfdfd]
        Magic [0x407ae418]
        Size 24576 blocks (including 1 for journal header) (first block 0)
        Max transaction length 128 blocks
        Max batch size 112 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0:
sb_version: 2
inode generation number: 0
UUID: ae5c3012-34d4-4887-a3ba-cd4d5beb113e
LABEL: test1
Set flags in SB:
        ATTRIBUTES CLEAN
Journal header (block #24575 of /dev/suse92/reiserloglv):
        j_last_flush_trans_id 0
        j_first_unflushed_offset 0
        j_mount_id 180388626432
        Device [0xfdfd]
        Magic [0x407ae418]
        Size 24576 blocks (including 1 for journal header) (first block 0)
        Max transaction length 128 blocks
        Max batch size 112 blocks
        Max commit age 30
Journal header (block #24575 of /dev/suse92/reiserloglv):
        j_last_flush_trans_id 0
        j_first_unflushed_offset 0
        j_mount_id 180388626432
        Device [0xfdfd]
        Magic [0x407ae418]
        Size 24576 blocks (including 1 for journal header) (first block 0)
        Max transaction length 128 blocks
        Max batch size 112 blocks
        Max commit age 30

------------------------------------------------------------------------------

David Huffman
Storix, Inc.
619-543-0220
