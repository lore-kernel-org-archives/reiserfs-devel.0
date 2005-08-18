From: Bill Wilken <bill.wilken@comcast.net>
Subject: Apparent fsck failure ...
Date: Thu, 18 Aug 2005 15:07:40 -0400
Message-ID: <1124392060.12959.5.camel@linux.site>
Reply-To: Bill.Wilken@comcast.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25559-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I am running Suse 9.3, 32-bit, on an Athlon-64 CPU (my 2800-series cpu
won't support the 64-bit product) with 1GB RAM, a 40GB hard drive
(dev/hda2), and a DVD/RW.  Suse tells me that I must run fsck manually
because dev/hda2 is mounted with write permissions (See below) Why
wouldn't you mount a hard drive partition with write permissions?

linux:/home/wilkenw # fsck -CV
fsck 1.36 (05-Feb-2005)
Checking all file systems.
[/sbin/fsck.reiserfs (1) -- /] fsck.reiserfs /dev/hda2
reiserfsck 3.6.18 (2003 www.namesys.com)

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

Will read-only check consistency of the filesystem on /dev/hda2
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
###########
reiserfsck --check started at Thu Aug 18 15:00:39 2005
###########
Partition /dev/hda2 is mounted with write permissions, cannot check it
fsck.reiserfs /dev/hda2 failed (status 0x10). Run manually!






