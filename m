From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: BUG REPORT
Date: Wed, 14 Jan 2004 13:17:04 +0300
Message-ID: <200401141312.24549.vitaly@namesys.com>
References: <200401132008.09438.luca-t@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16495-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200401132008.09438.luca-t@libero.it>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Luca T." <luca-t@libero.it>, reiserfs-list@namesys.com

Hello Luca,

would you tell me details about what happened before rebuilding?
why did you decided that fs is corrupted?

would you also run 
	debugreiserfs -d /dev/hdg1 | bzip2 -c > hdg1.bz2
and provide it somehow for downloading. 

we have not got out of disk at fscking for a long time but the 
2nd time recently, I would like to find the source of the problem.

would you also update the reiserfsprogs, 3.6.6 is out-of-date version.

-- 
Thanks,
Vitaly Fertman

On Tuesday 13 January 2004 22:09, Luca T. wrote:
> Hello,
> reiserfsck failed to rebuild the tree of my root partition (thank god it
> was not the home partition).
> I send you the log of the operation.
>
> Thank you,
>    Luca
>
>
>
> root@ttyp0[knoppix]# reiserfsck --rebuild-tree --logfile log.txt /dev/hdg1
> <--------reiserfsck 3.6.6, 2003-------->
>
>   *************************************************************
>   ** Do not run rebuild-tree unless something is broken  and **
>   ** MAKE A BACKUP before using it.  If you have bad sectors **
>   ** on a drive  it is usually a bad idea  to continue using **
>   ** it.  Then you probably should get a working hard drive, **
>   ** copy the file system from the bad drive to the good one **
>   ** -- dd_rescue is  a good tool for  that -- and only then **
>   ** run this program.                                       **
>   ** If you are using the latest reiserfsprogs and  it fails **
>   ** please  email bug reports to reiserfs-list@namesys.com, **
>   ** providing  as  much  information  as  possible --  your **
>   ** hardware,  kernel,  patches,  settings,  all reiserfsck **
>   ** messages  (including version),  the reiserfsck logfile, **
>   ** check  the  syslog file  for  any  related information. **
>   ** If you would like advice on using this program, support **
>   ** is available  for $25 at  www.namesys.com/support.html. **
>   *************************************************************
>
> Will rebuild the filesystem (/dev/hdg1) tree
> Will put log info to 'log.txt'
>
> Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes Replaying journal..
> 0 transactions replayed
> ###########
> reiserfsck --rebuild-tree started at Tue Jan 13 19:36:10 2004
> ###########
>
> Pass 0:
> Loading on-disk bitmap .. ok, 2615500 blocks marked used
> Skipping 8290 blocks (super block, journal, bitmaps) 2607210 blocks will be
> read
> 0%....20%....40%....60%....80%....100%                       left 0, 14404
> / sec
>         "r5" hash is selected
> Flushing..finished
>         Read blocks (but not data blocks) 2607210
>                 Leaves among those 10901
>                 Objectids found 1109
>
> Pass 1 (will try to insert 10901 leaves):
> Looking for allocable blocks .. finished
> 0%....20%....40%....60%....80%....Not enough allocable blocks, checking
> bitmap...there are 1 allocable blocks, btw
>
> out of disk space
> Abortito
> root@ttyp0[knoppix]#

