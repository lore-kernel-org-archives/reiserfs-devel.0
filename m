From: David Khoury <dave@hal.flex.com.au>
Subject: Permission Denied errors in ReiserFS
Date: Mon, 22 Apr 2002 18:42:57 +1000
Message-ID: <20020422084257.GC25655@flex.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10106-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

 The subject says it all.  I've checked the mail archive on the website, and
 I can't see any solutions so far, so I've decided to mail in.

 Here's the problem:

 My /var/log/messages file is behaving extremely strangely.

 I try to do a "ls /var/log/messages", I get the following error message:
 ls: /var/log/messages: Permission denied

 I tried a "rm /var/log/messages", same message.
 "touch /var/log/messages", same message.
 "rm /var/log/messages", same message.
 "chmod 644 /var/log/messages", same message.

 Even "lsof /var/log/messages" gives a permission denied!

 My kernel version is 2.4.19-pre5-ac3, custom compiled. The problem still
 happens with 2.4.17, which is another version I have on this system. ReiserFS
 filesystem is format 3.5, and it is the root partition.

 I thought there might be filesystem specific attributes, like the 'i'
 attribute with "chattr" and ext2/3.  But I can't seem to find any program
 that sets ReiserFS filesystem attributes.

 I tried doing a "reiserfsck" on my root partition. Dropped into single user
 mode, remounted the root partition as read only, and then ran the command.
 The program exited with an assertion error! Here's the output from the check:

 ----------------
 thedell:~# reiserfsck /dev/hda2

 <-------------reiserfsck, 2002------------->
 reiserfsprogs 3.x.1b

 Will read-only check consistency of the filesystem on /dev/hda2
 Will put log info to 'stdout'

 Do you want to run this program?[N/Yes] (note need to type Yes):Yes
 ###########
 reiserfsck --check started at Sun Apr 21 11:41:10 2002
 ###########
 Filesystem seems mounted read-only. Skipping journal replay..
 Checking S+tree../ 15 (of 134)/130 (of 162)bit 807415840, bitsize 1026151
 reiserfsck: bitmap.c:160: reiserfs_bitmap_test_bit: Assertion `bit_number <
 bm->bm_bit_size' failed.
 Aborted
 ----------------

 I've tried 3.x.1a as well, and it does the same thing.

 Here's the output from debugreiserfs, just in case it may be helpful:
 ----------------
 thedell:~# debugreiserfs /dev/hda2

 <-------------debugreiserfs, 2002------------->
 reiserfsprogs 3.x.1b


 Filesystem state: consistency is not checked after last mounting

 Reiserfs super block in block 16 on 0x302 of format 3.5 with standard
 journal
 Count of blocks on the device: 1026151
 Number of bitmaps: 32
 Blocksize: 4096
 Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
		 blocks): 600648
 Root block: 83791
 Filesystem is NOT cleanly umounted
 Tree height: 4
 Hash function used to sort names: "r5"
 Objectid map size 458, max 1004
 Journal parameters:
 Device [0x0]
	Magic [0x0]
	Size 8193 blocks (including 1 for journal header) (first block 18)
	Max transaction length 1024 blocks
	Max batch size 900 blocks
	Max commit age 30
 Blocks reserved by journal:
 0
 Fs state field: 0x1
 sb_version: 0
 ----------------

 If any developer wants to check out my metadata file (saved via the usual
 debugreiserfs command), I've got it at:

 http://hal.flex.com.au/~dave/mymetadata.gz

 Phew, I hope I've got enough information in this email :).

 That's it for me.  I've just subscribed to the reiserfs-list, so I'll be
 able to see all replies.

 dave
