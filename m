From: malcolm.agnew@t-online.de (Malcolm Agnew)
Subject: journal-712; buffer write failed
Date: Wed, 31 Jul 2002 13:38:57 +0200
Message-ID: <200207311338.57312.malcolm.agnew@t-online.de>
Reply-To: malcolm.agnew@t-online.de
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11104-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

System SuSE 8.0 - 2.4.18

Over several months I have not encounterd any problems with my resiserfs
partitions - until today.

On running a program which creates a file (circa 70 MB) by appending 4096
 byte blocks to the files (but makes frequent random 4096 byte reads to the 
file as it grows), I get the report :
	"journal-712; buffer write failed"
But not every time I run the program (circa 1 in 3). i.e. 5 crashes this
morning.

I ran
% /sbin/badblocks -b 4096 /dev/hdb5
which didn't find any.

So I tried

% reiserfsck --rebuild-tree --logfile check.log /dev/hdb5

... and up to now my problem has disappeared.

Is this a bug?
==========================================================
% debugreiserfs /dev/hdb5
debugreiserfs 3.x.1b (2002)

Filesystem state: consistent

Reiserfs super block in block 16 on 0x345 of format 3.6 with standard journal
Count of blocks on the device: 2622595
Number of bitmaps: 81
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 2308474
Root block: 8386
Filesystem is cleanly umounted
Tree height: 4
Hash function used to sort names: "r5"
Objectid map size 8, max 972
Journal parameters:
        Device [0x0]
        Magic [0x2be5cb56]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0
sb_version: 2
inode generation number: 13948
UUID: 825e5cb3-e991-43b4-b0a1-d9f43c8ad045
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN

-------------------------------------------------------
