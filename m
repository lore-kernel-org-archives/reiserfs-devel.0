From: "Russell Sears" <sears@eecs.berkeley.edu>
Subject: Resierfs Resize -> Corrupt bitmap.
Date: Wed, 04 Feb 2004 20:11:16 +0000
Message-ID: <402151E4.1060100@cs.berkeley.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16703-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I used parted to resize my reiserfs partion from 20Gig to 29Gig, and ran 
reiserfsck afterwards, just in case.  I got the messages that I pasted 
into the bottom.  (Basicly, resize corrupted the bitmap, and reiserfsck 
--fix-fixable fixed it.)

I'm using the following versions of software, on Debian testing (Really 
on a verison of Morphix):
parted       1.6.6-3.1
reiserfsprog 3.6.11-1.1
libreiserfs0 0.3.0.4-1

I have a patched 2.4.24 kernel:
supermount-1.2.11
bootsplash-3.0.7
xattr-0.8.65
acl-0.8.65
nfsacl-0.8.65
Kernel-Win4Lin3-2.4.24 / mki-adapter
knoppix-kernel
linux-2.4.24-ntfs-2.1.6a

And the following third party modules:
cloop
loop-aes
translucency
madwifi

My hardware is:
IBM Thinkpad R40.  The drive is an 80Gig Maxtor in a firewire case. 
parted sees it as 80Gig, but fdisk / cfdisk sees it as 60 gig. 
Apparently, I'm only using the first 60 gig of the drive.  The drive 
must have been incorrectly detected as a 60Gig drive years ago, on a 
normal IDE controller.

Parted said this after the resize:

Using /dev/sdb
Information: The operating system thinks the geometry on /dev/sdb is 
7473/255/63.  Therefore, cylinder 1024 ends at 8032.499M.
(parted) print
Disk geometry for /dev/sdb: 0.000-58623.468 megabytes
Disk label type: msdos
Minor    Start       End     Type      Filesystem  Flags
1          0.031   8001.123  primary   reiserfs    boot
2       8001.123   8024.655  primary   ext3
3       8024.656  58619.992  extended
5       8024.687  37166.000  logical   reiserfs
6      37166.032  58619.992  logical   ext3


If there's any more information you would like, please CC to me, as I'm 
not on this list.


Thanks,
Rusty




sh-2.05b# reiserfsck /dev/sdb5
reiserfsck 3.6.11 (2003 www.namesys.com)

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

Will read-only check consistency of the filesystem on /dev/sdb5
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
###########
reiserfsck --check started at Wed Feb  4 19:31:46 2004
###########
Replaying journal..
0 transactions replayed
Zero bit found in on-disk bitmap after the last valid bit.
Checking internal tree..finished
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps differs.
Checking Semantic tree:
finished
2 found corruptions can be fixed when running with --fix-fixable
###########
reiserfsck finished at Wed Feb  4 19:32:15 2004
###########
sh-2.05b#
sh-2.05b$ sudo reiserfsck /dev/sdb5 --fix-fixable
reiserfsck 3.6.11 (2003 www.namesys.com)

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

Will check consistency of the filesystem on /dev/sdb5
and will fix what can be fixed without --rebuild-tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
###########
reiserfsck --fix-fixable started at Wed Feb  4 19:52:41 2004
###########
Replaying journal..
0 transactions replayed
Zero bit found in on-disk bitmap after the last valid bit. Fixed.
Checking internal tree..finished
Comparing bitmaps..vpf-10630: The on-disk and the correct bitmaps 
differs. Will be fixed later.
Checking Semantic tree:
finished
No corruptions found
There are on the filesystem:
         Leaves 4817
         Internal nodes 34
         Directories 13
         Other files 180
         Data block pointers 4822473 (27051 of them are zero)
         Safe links 0
###########
reiserfsck finished at Wed Feb  4 19:53:17 2004
###########
sh-2.05b$ sudo reiserfsck /dev/sdb5
reiserfsck 3.6.11 (2003 www.namesys.com)

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

Will read-only check consistency of the filesystem on /dev/sdb5
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
###########
reiserfsck --check started at Wed Feb  4 19:53:57 2004
###########
Replaying journal..
0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..finished
Checking Semantic tree:
finished
No corruptions found
There are on the filesystem:
         Leaves 4817
         Internal nodes 34
         Directories 13
         Other files 180
         Data block pointers 4822473 (27051 of them are zero)
         Safe links 0
###########
reiserfsck finished at Wed Feb  4 19:54:23 2004
###########



