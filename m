From: Marcus Better <marcus@better.se>
Subject: Partition full after deleting a large file
Date: Thu, 01 Feb 2007 21:47:34 +0100
Message-ID: <eptjl6$dd5$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-list-return-30511-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

a buggy mail client (kmail) filled up my 4 Gb /home partition by filling
the .xsession-errors with several gigabytes of the same error message. I
removed the file, which was well over 2 Gb. But "df" still shows zero free
space, and I cannot create new files.

The /home partition is on a dmcrypt volume on LVM. The system is a Thinkpad
R60 (Core 2 Duo) running Debian unstable with custom kernel 2.6.20-rc6
(from the wireless-dev tree).

Here is some debug info:
~# df /home/
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/mapper/home       4193596   4193596         0 100% /home

~# debugreiserfs /dev/mapper/home
debugreiserfs 3.6.19 (2003 www.namesys.com)


Filesystem state: consistency is not checked after last mounting

home: Reiserfs super block in block 16 on 0xfe09 of format 3.6 with standard
journal
Count of blocks on the device: 1048432
Number of bitmaps: 32
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 0
Root block: 32941
Filesystem is NOT clean
Tree height: 4
Hash function used to sort names: "r5"
Objectid map size 2, max 972
Journal parameters:
        Device [0x0]
        Magic [0x725b2966]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0:
sb_version: 2
inode generation number: 1128605
UUID: 549f4bc1-6db1-44f6-9c69-1df7d5c440b5
LABEL: home
Set flags in SB:
        ATTRIBUTES CLEAN


Regards,

Marcus


