From: Michael Savchenko <savchenk@students.uiuc.edu>
Subject: rebuild-tree segfault
Date: Tue, 2 Jul 2002 05:50:34 -0500 (CDT)
Message-ID: <Pine.GSO.4.31.0207020540170.1151-100000@ux5.cso.uiuc.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10896-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: savchenk@uiuc.edu

Hello,

I am using the latest reiserfsprogs and I get a segmentation fault when I
try to reiserfsck --rebuild-tree:

  Replaying journal..
  0 transactions replayed
  ###########
  reiserfsck --rebuild-tree started at Tue Jul  2 05:44:36 2002
  ###########

  Pass 0:
  ####### Pass 0 #######
  Loading on-disk bitmap .. ok, 12074910 blocks marked used
  Segmentation fault

Naturally, reiserfsck --check gives:

  ###########
  reiserfsck --check started at Tue Jul  2 05:42:40 2002
  ###########
  Replaying journal..
  0 transactions replayed
  Checking S+tree..

  Bad root block 4294967295. (--rebuild-tree did not complete)

  Aborted


A filesystem definitely exists, as shown by debugreiserfs:


<-------------debugreiserfs, 2002------------->
reiserfsprogs 3.x.1b


Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x340 of format 3.6 with standard
journal
Count of blocks on the device: 24421446
Number of bitmaps: 746
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 24421446
Root block: 4294967295
Filesystem is cleanly umounted
Tree height: 65535
Hash function used to sort names: "r5"
Objectid map size 2, max 972
Journal parameters:
	Device [0x0]
	Magic [0x0]
	Size 8193 blocks (including 1 for journal header) (first block 18)
	Max transaction length 0 blocks
	Max batch size 0 blocks
	Max commit age 0
Blocks reserved by journal: 0
Fs state field: 0x1
sb_version: 2
inode generation number: 0
UUID: 50c0e5d6-8a65-47c0-ad43-22e1bb4caaae
LABEL:
Set flags in SB:


Please help! I can extract metadata with debugreiserfs -p, but I have
close to 100G of data on the drive.

