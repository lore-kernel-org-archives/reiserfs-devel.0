From: John McMonagle <johnm@advocap.org>
Subject: --rebuild-tree fails
Date: Tue, 25 Apr 2006 12:48:33 -0500
Message-ID: <444E60F1.5030602@advocap.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28522-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

This on debian sarge.
Partitiion in lvm2 on raid1.
kernel is 2.6.12.5

Ran "reiserfsck -q --rebuild-tree --logfile fix.log /dev/vg1/backups " 3
times
twice with sarge version and once with  reiserfsck 3.6.19
................................................................
Will rebuild the filesystem (/dev/vg1/backups) tree
Will put log info to 'fix3.log'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
Replaying journal..
Reiserfs journal '/dev/vg1/backups' in blocks [18..8211]: 0 transactions
replayed
###########
reiserfsck --rebuild-tree started at Tue Apr 25 10:50:10 2006
###########

Pass 0:
Loading on-disk bitmap .. ok, 22700428 blocks marked used
Skipping 9610 blocks (super block, journal, bitmaps) 22690818 blocks
will be read
0%....20%....40%....60%....80%....100%
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 22690818
                Leaves among those 691256
                Objectids found 4283061

Pass 1 (will try to insert 691256 leaves):
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....
The problem has occurred looks like a hardware problem (perhaps
memory). Send us the bug report only if the second run dies at
the same place with the same block number.

build_the_tree: Nothing but leaves are expected. Block 44499660 - unknown

Aborted
.................................................................
Always died at the same Block.

Log from last run has:

####### Pass 0 #######
20205564 directory entries were hashed with "r5" hash.
####### Pass 1 #######

This  is for our backuppc  backup files.
It would be OK if I lose some files as long as the data structures are
OK when done.
Otherwise I'll blow it all away and start over.

Thanks

John

-- 
John McMonagle
IT Manager
Advocap Inc.


