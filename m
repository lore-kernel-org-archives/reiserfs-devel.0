From: Joshua Masiko <joshua@dsmagic.com>
Subject: can't mount repaired reiserfs partition
Date: Wed, 23 Apr 2003 15:23:55 +0300 (EAT)
Message-ID: <Pine.LNX.4.21.0304231506000.3962-100000@entandikwa.ds.co.ug>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13771-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

One of the partition on a harddisk that had SuSE 7.2 got corrupted. I
connected it as a secondary drive on a SuSE 8.1 machine and run reiserfsck
--check which found an error and said it was fixable by
--fix-fixable. Below is the output of --fix-fixable

reiserfsck --fix-fixable /dev/hdd6
reiserfsck 3.6.2 (2002)
Will check consistency of the filesystem on /dev/hdd6
Will fix what can be fixed w/o --rebuild-tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --fix-fixable started at Wed Apr 23 15:00:00 2003
###########
Replaying journal..
No transactions found
Checking S+tree..ok
Comparing bitmaps..ok
Checking Semantic tree...
/usr/lib/pgsql/server.logfile 220879 152051 has wrong sd_size 2147483648,
has to be 2147483648           /X11R6/share/icons/pnok
No corruptions found
There are on the filesystem:
        Leaves 43634
        Internal nodes 288
        Directories 39283
        Other files 126570
        Data block pointers 1955254 (26582 of them are zero)
        Safe links 0
###########
reiserfsck finished at Wed Apr 23 15:03:33 2003
###########

Now when I do a:

 mount -t reiser fs -o ro /dev/hdd6 /mnt/recover/

I get the following output
mount: wrong fs type, bad option, bad superblock on /dev/hdd6,
       or too many mounted file systems



