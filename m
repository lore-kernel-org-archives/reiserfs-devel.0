From: Christian Folini <christian.folini@netnea.com>
Subject: rebuild-tree hangs
Date: Fri, 11 Apr 2003 03:53:12 +0200
Message-ID: <20030411015312.GA20912@coloppl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13637-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello,

Doing a rebuild tree on a 50GB partition hanged
with a 2GB log-file of the same line.

These are my infos:
machine: AMD 1800+
drive:  IC35L120AVVA07-0, ATA DISK drive
 (It's an IBM 120GB Diskstar (?))
kernel: vanilla 2.4.20
distribution: debian testing/unstable

reiserfsprogs: debian 3.6.4-4

reiserfs log-file:
head: 

******************************************************
* Warning: The dma on your hard drive is turned off. *
* This may really slow down the fsck process.        *
******************************************************
####### Pass 0 #######
7545 directory entries were hashed with "r5" hash.
####### Pass 1 #######
####### Pass 2 #######
do_pass_2: The block (level=35848, nr_items=39427, free_space=30815
rdkey), marked as a leaf on the first two passes, is not a leaf! Will be
skipped.

tail:
do_pass_2: The block (level=35848, nr_items=39427, free_space=30815
rdkey), marked as a leaf on the first two passes, is not a leaf! Will be
skipped.
do_pass_2: The block (level=35848, nr_items=39427, free_space=30815
rdkey), marked as a leaf on the first two passes, is not a leaf! Will be
skipped.
do_pass_2: The block (level=35848, nr_items=39427, free_space=30815
rdkey), marked as a leaf on the first two passes, is not a leaf! Will be
skipped.
do_pass_2: The block (level=35848, nr_items=39427, free_space=30815
rdkey), marked as a leaf on the first two passes, is not a leaf! Will be
skipped.
do_pass_2: The block (level=35848, nr_items=39427, free_space=30815
rdkey), marked as a leaf on the first two passes, is not a leaf! Will be
skipped.
do_pass_2: The block (level=35848, nr_items=39427, free_space=30815
rdkey), marked as a leaf on the first two passes, is not a leaf! Will be
skipped.
do_pass_2: The block (level=35848, nr_items=39427, free_space=30815
rdkey), marked as a leaf on the first two passes, is not a leaf! Will be
skipped.
do_pass_2: The block (level=35848, nr_items=39427, free_space=30815
rdkey), marked as a leaf on the first two passes, is not a leaf! Will be
skipped.
do_pass_2: The block (level=35848, nr_items=39427, free_space=30815
rdkey), marked as a leaf on the first two passes, is not a leaf! Will be
skipped.
do_pass_2: The block (level=35848, nr_items=39427, free_s

                                                    ^^^^^^hang

root@coloppl:/home/dune73/data# l reiserfsck-hdb8-11042003.log 
-rw-r--r--    1 root     root     2147483648 2003-04-11 03:32
reiserfsck-hdb8-11042003.log


The fsck hanged litterally immediately after starting pass 2.
Screen:

Pass 2:
0%....20%....40%..                                             left 342,
0 /sec


afterwards i tried to rebuild my superblock. Did not help
anymore...

It says:

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
super.c 218 rebuild_sb
Reiserfs with standard journal found, but there was specified a journal
dev

No log-file returned.


I am not subscribed to this mailinglist, please get back via
private mail.

Any help would be appreciated.

Christian Folini - loosing a lot of radio-shows he had no
space to backup

-- 
Christian Folini - <christian.folini@netnea.com>
