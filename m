From: kenny gorman <kgorman@panix.com>
Subject: corruption?  how do I fix?
Date: Tue, 12 Nov 2002 21:11:11 -0800
Message-ID: <3DD1DEEF.6030903@panix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11977-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I am running a semi-large oracle database on reiserfs and lvm.  I 
started receiving block corruption messages in oracle.  So I started 
checking out the filesystem.  I ran debugreiserfs and I get the 
following.  Is this bad?  I can't seem to find docs on 
repair/restoration of reiserfs filesystems around.. am I just missing 
em?  We are down so any help would be really great.  Thx!

See output of debugreiserfs:

# debugreiserfs /dev/datagrp/datavol

<-------------debugreiserfs, 2001------------->
reiserfsprogs 3.x.0j
reiserfs_open: bitmap 45 was marked free
<repeated until>
reiserfs_open: bitmap 69 was marked free
Super block of format 3.5 found on the 0x3 in block 16
Block count 7752704
Blocksize 4096
Free blocks 2361789
Busy blocks (skipped 16, bitmaps - 237, journal blocks - 8193
1 super blocks, 5382468 data blocks
Root block 8384
Journal block (first) 18
Journal dev 0
Journal orig size 8192
Filesystem state ERROR
Tree height 4
Hash function used to sort names: "r5"
Objectid map size 2, max 1004
Version 0



