From: Chris Black <cblack@eragen.com>
Subject: recovery from lost journal?
Date: Thu, 11 Jul 2002 13:21:09 -0500
Message-ID: <1026411669.11555.16.camel@getafix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-10982-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

When I try to mount my reiserfs filesystem I get:
mount: wrong fs type, bad option, bad superblock on /dev/sda1,
       or too many mounted file systems

And dmesg reports:
journal-1393: current JOURNAL_BLOCK_COUNT (8192) is too big.  This FS
was created with a journal size of 0 blocks
reiserfs_read_super: unable to initialize journal space

I have a machine connected to an external scsi raid (~.5TB) which was
partitioned as one large partition and then formatted as reiserfs. I
halted the machine and powered down the external raid and then did a
bunch of rackmount work and reconnected it and powered both units on.
This filesystem had been working fine before thru reboots and another
reiserfs filesystem on this system on a different disk mounts fine.

Actions I have taken and their results:
I shut down the machine and had the external scsi raid run a check on
the raid and no errors surfaced.
I verified that the partition is still there by looking at fdisk
/dev/sda
I ran debugreiserfs /dev/sda1 and got:
<-------------debugreiserfs, 2001------------->
reiserfsprogs 3.x.0k-pre9

104857k will be used
Loading on-disk bitmap .. 107965453 bits set - done

Standart journal not opened
Filesystem state: consistency is not checked after last mounting

Block 16 (0x801) contains super block of format 3.6 with standard
journal
Block count: 125602186
Bitmap number: 3834
Blocksize: 4096
Free blocks: 17636730
Root block: 22409
Tree height: 5
Hash function used to sort names: "r5"
Objectid map size 10, max 972
Journal parameters:
        Device [0x0]
        Magic [0x1f6b7e95]
        Size 1 (including journal header) (first block 18)
        Max transaction length 1024
        Max batch size 900
        Max commit age 30
Space reserved by journal: 0
Correctness checked after mount 1
Fsck field 0x0

I ran it debugreiserfs with the -s flag and gave it a directory and
object to search for and it found nodes:
block 13511 is reiserfs leaf node                  left 107951942, 13511
/sec
block 13512 is reiserfs leaf node                  left 107951941, 13512
/sec
block 13513 is reiserfs leaf node                  left 107951940, 13513
/sec
block 13514 is reiserfs internal node              left 107951939, 13514
/sec
block 13515 is reiserfs leaf node                  left 107951938, 13515
/sec
block 13516 is reiserfs leaf node                  left 107951937, 13516
/sec
block 13517 is reiserfs leaf node                  left 107951936, 13517
/sec
block 13518 is reiserfs leaf node                  left 107951935, 13518
/sec

I have not run reiserfsck yet due to the many warnings accompanying the
documentation.

Please let me know if there are any actions I should take next or any
more information I can provide. It seems that the data is on the disk
(because of the debugreiserfs -s output) but the system will not mount
it because of the journal. Please help!

Thanks in advance,
Chris


