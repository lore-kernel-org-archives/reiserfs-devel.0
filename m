From: Stephen Buckmelter <stephen.buckmelter@sun.com>
Subject: reiserfsck
Date: Fri, 07 Mar 2003 12:20:49 -0700
Sender: stephen.buckmelter@sun.com
Message-ID: <1047064848.2129.65.camel@bucklinux.buckmelter.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-13142-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Getting the following error when running reiserfsck.  Submitting per the
man page.

Thanks!

--Steve


bucklinux:/ # reiserfsck --rebuild-tree --logfile rebuild.log /dev/sda1
reiserfsck 3.6.2 (2002)
  **********************************************************
  ** This  is  an  experimental  version  of  reiserfsck, **
  **              !! MAKE A BACKUP FIRST !!               **
  ** Don't run this program unless something  is  broken. **
  ** Some types of random FS damage can be recovered from **
  ** by  this  program,   which  basically   throws  away **
  ** the internal nodes of the tree and then reconstructs **
  ** them. This program is for use only by the desperate, **
  ** and is  of only beta quality.  If you are using  the **
  ** latest  reiserfsprogs  and  it  fails  please  email **
  ** bug reports to reiserfs-list@namesys.com.            **
  **********************************************************

Will rebuild the filesystem (/dev/sda1) tree
Will put log info to 'rebuild.log'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
Replaying journal..
No transactions found
###########
reiserfsck --rebuild-tree started at Fri Mar  7 10:27:28 2003
###########

Pass 0:
Loading on-disk bitmap .. ok, 802632 blocks marked used
Skipping 8345 blocks (super block, journal, bitmaps) 794287 blocks will
be read
0%.                                                      left 752867,
3765 /sec
bread: Cannot read a block # 449052.



Aborted
bucklinux:/ #


-- 
Stephen Buckmelter <stephen.buckmelter@sun.com>

