From: Vance_Petree@dom.com
Subject: reiserfsck failure
Date: Tue, 24 Feb 2004 09:24:19 -0500
Message-ID: <16443.24211.859476.460170@gdmsdwk12.vancpower.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16906-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Brandon_Stites@dom.com, Bill_Irwin@dom.com, Mark_L_Pruett@dom.com, Martha_Matthews@dom.com, John_Thornton@dom.com, jlt@vancpower.com


Hardware: Microway Alpha EV68AL (Tsunami DP264)
	  2gb memory

Kernel:	  Linux 2.4.18 
	  ReiserFS version 3.6.25
	  Using r5 hash to sort names

Partitions:

Filesystem            Size  Used Avail Use% Mounted on
/dev/sda2            1008M  613M  343M  64% /
/dev/sda5              31G  6.9G   22G  24% /usr
/dev/sdc1            1011G  1.9G 1009G   0% /mnt/sdc1
/dev/sdb1            1014G  421G  593G  42% /mnt/sdb1

The suspect partition is /dev/sdb1 (I  remounted it just to get the df
output;  it  was  unmounted  when performing  the  reiserfsck).   This
partition  is on  an external  Raidzone raid  5 array  which  shows no
errors.  The motivation for performing  the reiserfsck was a series of
syslog messages  (formatted slightly  to fit in  this email;  many are
similar, but I've included the entire set):

======================================================================
Feb 17 13:26:07 gdmsfm00 kernel: is_leaf: nr_item seems wrong:
		level=1, nr_items=32775, free_space=0 rdkey  
Feb 17 13:26:07 gdmsfm00 kernel: vs-5150: search_by_key: invalid
		format found in block 265341142. Fsck? 
Feb 17 13:26:07 gdmsfm00 kernel: is_leaf: nr_item seems wrong:
		level=1, nr_items=32775, free_space=0 rdkey  
Feb 17 13:26:07 gdmsfm00 kernel: vs-5150: search_by_key: invalid
		format found in block 265341142. Fsck? 
Feb 17 13:26:07 gdmsfm00 kernel: vs-13070: reiserfs_read_inode2: i/o 
		failure occurred trying to find stat data of 
		[133179756 133216322 0x0 SD] 
Feb 17 13:26:07 gdmsfm00 kernel: is_leaf: nr_item seems wrong:
		level=1, nr_items=32775, free_space=0 rdkey  
Feb 17 13:26:07 gdmsfm00 kernel: vs-5150: search_by_key: invalid
		format found in block 265341142. Fsck? 
Feb 17 13:26:07 gdmsfm00 kernel: vs-13070: reiserfs_read_inode2: i/o 
		failure occurred trying to find stat data of 
		[133179756 133216323 0x0 SD] 
Feb 17 13:26:07 gdmsfm00 kernel: is_leaf: nr_item seems wrong:
		level=1, nr_items=32775, free_space=0 rdkey  
Feb 17 13:26:07 gdmsfm00 kernel: vs-5150: search_by_key: invalid
		format found in block 265341142. Fsck? 
Feb 17 13:26:07 gdmsfm00 kernel: vs-13070: reiserfs_read_inode2: i/o 
		failure occurred trying to find stat data of 
		[133179756 133216333 0x0 SD] 
Feb 17 13:26:07 gdmsfm00 kernel: is_leaf: nr_item seems wrong:
		level=1, nr_items=32775, free_space=4 rdkey  
Feb 17 13:26:07 gdmsfm00 kernel: vs-5150: search_by_key: invalid
		format found in block 265341145. Fsck? 
Feb 17 13:26:07 gdmsfm00 kernel: vs-13070: reiserfs_read_inode2: i/o 
		failure occurred trying to find stat data of 
		[133179756 133216334 0x0 SD] 
Feb 17 13:26:07 gdmsfm00 kernel: is_leaf: nr_item seems wrong:
		level=1, nr_items=32775, free_space=4 rdkey  
Feb 17 13:26:07 gdmsfm00 kernel: vs-5150: search_by_key: invalid
		format found in block 265341145. Fsck? 
Feb 17 13:26:07 gdmsfm00 kernel: vs-13070: reiserfs_read_inode2: i/o 
		failure occurred trying to find stat data of 
		[133179756 133216335 0x0 SD] 
Feb 17 13:26:07 gdmsfm00 kernel: is_leaf: nr_item seems wrong: 
		level=1, nr_items=32775, free_space=4 rdkey  
Feb 17 13:26:07 gdmsfm00 kernel: vs-5150: search_by_key: invalid 
		format found in block 265341145. Fsck? 
Feb 17 13:26:07 gdmsfm00 kernel: vs-13070: reiserfs_read_inode2: i/o 
		failure occurred trying to find stat data of 
		[133179756 133216336 0x0 SD] 
======================================================================

Here is the reiserfsck output,  also formatted slightly to fit in this
email:

======================================================================
[root@gdmsfm00 sw]# reiserfsck --fix-fixable -q -y  /dev/sdb1
reiserfsck 3.6.12 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will check consistency of the filesystem on /dev/sdb1
and will fix what can be fixed without --rebuild-tree
Will put log info to 'stdout'
###########
reiserfsck --fix-fixable started at Mon Feb 23 10:41:12 2004
###########
Replaying journal..
0 transactions replayed
Checking internal tree..block 245180252: The number of items (32813) 
 is incorrect, should be (45)
 the problem in the internal node occured (245180252), whole subtree is skipped
block 245177629: The number of items (32825) is incorrect, should be (58)
 the problem in the internal node occured (245177629), whole subtree is skipped
block 245675168: The number of items (32801) is incorrect, should be (33)
 the problem in the internal node occured (245675168), whole subtree is skipped
block 265341142: The number of items (32775) is incorrect, should be (0)
 the problem in the internal node occured (265341142), whole subtree is skipped
finished
Comparing bitmaps..vpf-10630: The on-disk and the correct bitmaps
differs. Will be fixed later.
File size limit exceeded (core dumped)
======================================================================

There were no additional messages via syslog or dmesg. I have retained
the  core file  of you  would like  it (or  would like  me to  look up
anything in it).

Please let me know if you require additional information. Thanks!

-- 
======================================================================
Vance W. Petree                vwp@acm.org                804-273-3276
