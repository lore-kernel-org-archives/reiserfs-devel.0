From: michael stone <mike@hpc.me.utexas.edu>
Subject: --fix-fixable being ignored
Date: Sun, 9 Mar 2003 00:02:17 +0000 (UTC)
Message-ID: <Pine.LNX.4.33.0303082353370.16310-100000@hpc.me.utexas.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13147-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I have an ide raid server with a 610GB /home directory with errors. Running
reiserfsck --check says it has found 6 errors which can be fixed with
--fix-fixable.  But when I run it with --fix-fixable, the option is ignored and
and a check is simply run again.  Any advice?  The filesystem errors are really
screwing up quota services, so I need to get them fixed.  Thanks!

The server is running Raidzone Linux (Modified version of RedHat 7.1).


[root@ein /root]# reiserfsck --fix-fixable --logfile fix.log /dev/rze1

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1b

Will check consistency of the filesystem on /dev/rze1
Will fix what can be fixed w/o --rebuild-tree
Will put log info to 'fix.log'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --fix-fixable started at Sat Mar  8 17:44:49 2003
###########
Filesystem seems mounted read-only. Skipping journal replay..
--fix-fixable ignored
Checking S+tree..ok
Comparing bitmaps..on-disk bitmap does not match to the correct one.
Checking Semantic tree...
/ok
There were found 6 corruptions which can be fixed with --fix-fixable
check_and_free_buffer_mem: dirty buffer (4 16) found
###########
reiserfsck finished at Sat Mar  8 17:52:41 2003
###########



--
Michael Stone
Linux / High Performance Computing Administrator

The University of Texas at Austin
Mechanical Engineering Department
ETC 3.130     ph: 471.5951
mike@hpc.me.utexas.edu

http://hpc.me.utexas.edu

