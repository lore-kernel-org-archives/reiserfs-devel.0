From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: what do you do that stresses your filesystem?
Date: 11 Jan 2003 10:25:54 -0500
Message-ID: <avpd22$o41$1@satsuki.furryterror.org>
References: <3E06F360.7000708@namesys.com>
Return-path: <reiserfs-list-return-12317-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <3E06F360.7000708@namesys.com>,
Hans Reiser  <reiser@namesys.com> wrote:
>We were discussing how to optimize reiser4 best, and came to realize 
>that us developers did not have a good enough intuition for what users 
>do that stresses their filesystem enough that they care about its 
>performance.

>Booting the machine seems like one activity that many users end up 
>waiting on the FS for.  Yes?

>Starting up complex and big applications like xemacs and mozilla would 
>be another.  Yes?

Not for me.  I reboot only for upgrades, crashes, power failures, and
dead hardware replacement.  I try to avoid complex and big applications
for many reasons including startup time, but startup time is relatively
unimportant.

>Others?

Lots of rsync's, cp -al's, rm -rf's, sometimes involving millions of ~12K
files at a time.  apt-get dist-upgrade on Debian.  Big C/C++ compiles.
Often a number of these at the same time on the same machine.

I store multi-gigabyte collections of files about 12K in size each.
This isn't usually a performance issue as the files are normally accessed
at the rate of a few hundred per hour; however, relatively infrequently
I need to copy one of these collections to another machine, or process
all of the files at once, or transfer the collection to or from tape.

Often I want to _avoid_ putting stress on my filesystem.  I want to do
full system backups, but I don't really care how long they take, and I
don't want any other users of the machine to be inconvenienced by them.
Obviously if the machine is otherwise idle, I want the backups to be fast.

My favorite toy benchmark application involves creating a bootable CD-ROM
from a chroot Debian system.  This involves four phases:

	1.  Build a compressed initrd (mostly CPU bound)

	2.  Scan the chroot filesystem for identical files and
	hardlinking them together (mostly FS bound)

	3.  mkzftree --parallelism 16 (CPU and FS bound)

	4.  mkisofs (mostly FS bound)

All input and output is on the same filesystem.

Phase 2 is interesting because the other filesystems (xfs, ext[23], tmpfs)
are all more than twice as slow as Reiser.  This phase represents about 
one third of the total time.  It's a perl script that runs 'find', sorts
the results by size, then reads all files of identical size sequentially
to generate sha1sums, then replaces files with identical sha1sums with
hardlinks to one of the files.

Phase 3 is interesting because the distribution of system and real time
varies wildly depending on filesystem (and not, as one might expect, on
things like whether the machine has one or two CPU's or whether a disk
array is used or a single disk).  reiser finished in 30% less real time
than the other filesystems despite being rather heavy in CPU system time.

Reiser is the fastest filesystem at each of these phases individually,
and overall reiser is about 40% faster than xfs or ext[23] over a wide
variety of system configurations.  tmpfs was so slow that I didn't bother
letting it finish (I killed it after 90 minutes on a machine that runs
the benchmark on reiser in 22 minutes).

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
