From: Marc Rotzow <marcer@friendfinderinc.com>
Subject: reiserfsck will take 28 years
Date: Fri, 28 Feb 2003 20:09:38 -0800
Message-ID: <3E603282.4000001@friendfinderinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13034-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Our backup started to kernel panic when it hit certain files in certain 
directories.
We moved them aside, and proposed to fix them by trying a rebuild-tree 
after the other stuff had failed.
What we discovered is that based on the rate it was doing files, after a 
couple of hours (it starts off at a decent rate and quickly trails to 
slow), it would take an estimated 28 years, (1 every 5 seconds).

What can we do to revive it and not force it to try to do a 
rebuild-tree?  We don't have 28 years.

Thanks,

Marc


Pertinent info for my installation below:
reiserfsprog 3.6.4-2
kernel:  2.4.20-1
Debian linux
Raid 5, ICP Vortex.
16 drives x 72GB 10k SCSI drives.
945 GB Usable space
1 partition.
Approximately 125 million files.

debug info and other possibly interesting bits below:


Skipping 15883 blocks (super block, journal, bitmaps) 125811385 blocks will be read
0%                                                      left 125807299,

debugreiserfs -d /dev/sda1
<--------debugreiserfs 3.6.4, 2002-------->


Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x801 of format 3.6 with standard journal
Count of blocks on the device: 251413225
Number of bitmaps: 7673
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] blocks): 251413225
Root block: 4294967295
Filesystem is cleanly umounted
Tree height: 65535
Hash function used to sort names: "r5"
Objectid map size 570, max 972
Journal parameters:
        Device [0x0]
        Magic [0x0]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x1
sb_version: 2
inode generation number: 41340655
UUID: 57c6cdcf-364b-4d51-8e97-ae2ac60f0672
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN

The problem has occurred looks like a hardware problem.
Check your hard drive for badblocks.

bread: Cannot read the block (4294967295).

Aborted


