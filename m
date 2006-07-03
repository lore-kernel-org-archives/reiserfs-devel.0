From: Christopher Michael Neill <chris.neill@biz360.com>
Subject: any way to fix this?
Date: Mon, 3 Jul 2006 11:57:54 -0700
Message-ID: <20060703185754.GA8875@biz360.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28902-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: ops@biz360.com

[root@mars18 ~]# reiserfsck --check /dev/sdb1
reiserfsck 3.6.19 (2003 www.namesys.com)

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

Will read-only check consistency of the filesystem on /dev/sdb1
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
###########
reiserfsck --check started at Mon Jul  3 11:56:36 2006
###########
Replaying journal..
Reiserfs journal '/dev/sdb1' in blocks [18..8211]: 0 transactions
replayed
Zero bit found in on-disk bitmap after the last valid bit.
Checking internal tree..

Bad root block 0. (--rebuild-tree did not complete)

Aborted

