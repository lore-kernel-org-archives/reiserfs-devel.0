From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: 2.4.20, reiserfs, md linear, and "Permission denied"...
Date: 11 Jan 2003 14:30:36 -0500
Message-ID: <avprcs$bfi$1@satsuki.furryterror.org>
Return-path: <reiserfs-list-return-12320-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I think I'm seeing a pattern of failure.  I'm wondering if there is a
problem with MD linear personality (aka JBOD) and reiserfs.

Here's the recipe for disaster:

Ingredients:

	reiserfs, of course ;-)
	2.4.18 and 2.4.20 kernels (compiled for SMP but running on UP)
	Arrays of disks in MD linear mode (aka raidtools2)
	lots of metadata I/O (cp -al & rm -rf)

Directions:

Start with a large collection of files (e.g. the contents of /etc, /var,
and /usr).  Put this on a reiserfs filesystem under '(mountpoint)/foo'.

In one thread, do 'cp -al foo bar/`date +%Y%m%d%H%M%S`'.  Create a new
directory for each copy.  The thread should check for free disk space
after each 'cp' command and throttle itself as the filesystem gets too
full (i.e. when there is less space free than the size of 'foo').

In a second and third thread, do 'rm -rf `ls -d bar/* | head -1`'.
The third thread should sleep for one hour between rm commands, while the
second thread will not sleep.  Both threads should check for free disk
space and throttle themselves when the filesystem gets too empty
(e.g. when there is more space free than the size of 'foo').  Note that
there will sometimes be two 'rm -rf's processing the same directories
at the same time.

In a fourth thread, run 'find -ls >/dev/null' over the entire filesystem
continuously.

In a fifth thread, replace a few of the files in 'foo'.  In my case these
files are actually rsync-ed from a live Linux system that provided the
original contents of 'foo'.

If I run this for about two weeks, one day the 'find' and 'rm' threads
will start to emit lots of "Permission denied" messages when trying to
access random files under 'bar'.  This is especially apparent in the 'rm'
threads, because they'll stop being useful if they're unable to completely
remove the oldest directory.

reiserfsck --fix-fixable runs for 24.5 hours, then says:

[several megabytes deleted]
k_semantic_pass: name "gtk" in directory 5015381 5015470 points to nowhere - removed
dir 5015381 5015470 has wrong sd_size 72, has to be 48                                                                       check_semantic_pass: name "Yell-O" in directory 5009649 5015381 points to nowhere - removed
dir 5009649 5015381 has wrong sd_size 72, has to be 48                                                                       check_semantic_pass: name "themes" in directory 5005514 5009649 points to nowhere - removed
dir 5005514 5009649 has wrong sd_size 200, has to be 48                                                                       check_semantic_pass: name "share" in directory 5004046 5005514 points to nowhere - removed
dir 5004046 5005514 has wrong sd_size 120, has to be 48                                                                         check_semantic_pass: name "usr" in directory 5004045 5004046 points to nowhere - removed
dir 5004045 5004046 has wrong sd_size 96, has to be 48                              
No corruptions found
There are on the filesystem:
        Leaves 723046
        Internal nodes 5073
        Directories 1226338
        Other files 15857491
        Data block pointers 35351178 (zero of them 169766)
        Safe links 0
###########
reiserfsck finished at Sat Jan 11 10:17:45 2003
###########

Observations:

I've seen this phenomenon occur ten times in the last two months.
I thought that upgrading from 2.4.18 to 2.4.20 might fix the problem,
but it has occurred three times on 2.4.20 machines.

There do not appear to be any disk errors in the kernel logs.  I have
no reason to believe that there are CPU, RAM, or cooling problems.
All of those tend to manifest themselves in other ways that I have not
also observed.

There does not appear to be any data corruption or loss in the filesystem
other than the names pointing to nowhere.  The affected files would be
newly created hardlinks or recently deleted hardlinks--neither of which is
"data loss" per se.  Other hardlinks to these files seem to be unaffected
(I've never seen any part of 'foo' damaged, only 'bar').

Both reiserfs and linear (JBOD) arrays of disks seem to be a requirement
to reproduce the problem.  I have several machines running very similar
workload and software--they're actually mirrored servers with automated
failover, so whatever filesystem activity one machine does, another
machine does soon after.  Machines using reiserfs on RAID0, RAID1, or
single disks do not have these problems, nor are there problems with
machines using ext3 on linear arrays.  All machines are running the
same kernels and they're all in the same building (so they have the same
power failures and resulting unclean shutdowns).  There's a wide variety
of hardware involved ranging from P133 to P4 and several different disk
vendors.

If there is an unclean shutdown, there will definitely be names pointing
to nowhere; however, this problem has recently occurred once on a machine
that was not shut down at all, cleanly or otherwise, since mkreiserfs.

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
