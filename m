From: Bartlomiej Pater <noster@venture.org.pl>
Subject: bad sb - mounting problem
Date: Wed, 16 Apr 2003 18:41:46 +0200
Message-ID: <200304161841.46413.noster@venture.org.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13679-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

hello,

Today, after more than 2 happy years of reiserfs usage I've been 
attacked by some strange message:

-----------------------
Apr 16 18:24:03 monada kernel: Using r5 hash to sort names
Apr 16 18:24:03 monada kernel: ReiserFS version 3.6.25
Apr 16 18:24:03 monada kernel: reiserfs: checking transaction log 
(device 03:07) ...
Apr 16 18:24:03 monada kernel: journal-1204: REPLAY FAILURE fsck 
required! Trying to replay onto a log block
Apr 16 18:24:03 monada kernel: Replay Failure, unable to mount
Apr 16 18:24:03 monada kernel: reiserfs_read_super: unable to 
initialize journal space
------------------------

now one of my partitions is unavailable. I've tried fsck with 
--rebuild-sb and --rebuild-tree options but with no results [and no 
errors either]. I've googled through internet and searched this 
mailing list archives.
I couldn't find any tips that could help me. When the partition is 
scanned during tree rebuilding I can see the file names convincing me 
that maybe not everything is lost. debugreiserfs doesn't seem to find 
any trouble as well. Here is the journal header:

<-------------debugreiserfs, 2002------------->
reiserfsprogs 3.x.1b


Filesystem state: consistent

Reiserfs super block in block 16 on 0x307 of format 3.6 with standard 
journal
Count of blocks on the device: 656649
Number of bitmaps: 21
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] 
blocks): 222061
Root block: 8213
Filesystem is cleanly umounted
Tree height: 4
Hash function used to sort names: "r5"
Objectid map size 16, max 972
Journal parameters:
        Device [0x0]
        Magic [0x0]
        Size 8193 blocks (including 1 for journal header) (first block 
18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0
sb_version: 2
inode generation number: 45752
UUID: b28de100-a656-477d-8ac1-8459b3bb021c
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN
Journal header (block #8210 of /dev/hda7):
        j_last_flush_trans_id 3497
        j_first_unflushed_offset 2942
        j_mount_id 150
        Device [0x0]
        Magic [0x7b8b0f68]
        Size 8193 blocks (including 1 for journal header) (first block 
18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30

-----------------------
I've downloaded v3.6.5 [+patch] of reiserfsprogs and compiled kernel 
with debug on but with no changes. Is there something I can do to 
salvage the data?

regards,
n;

