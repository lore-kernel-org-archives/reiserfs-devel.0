From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: reiserfsck --rebuild-tree on a big filesystem
Date: Thu, 19 Dec 2002 16:51:23 +0000 (UTC)
Message-ID: <atsteb$44s$1@genki.hungrycats.org>
References: <20021125143634.GC9006@mail.cekit.cz> <20021125143634.GC9006@mail.cekit.cz> <20021125174846.A31778@namesys.com>
Return-path: <reiserfs-list-return-12176-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

This thread is rather old, but I have basically the same problem...

In article <20021125174846.A31778@namesys.com>,
Oleg Drokin  <green@namesys.com> wrote:
>On Mon, Nov 25, 2002 at 03:36:34PM +0100, Mira Temp?r wrote:
>> my setup:
>> linux 2.4.18 SMP, HW RAID5, nearly full 240GB reiserfs of mostly small files,
>> reiserprogs 3.6.4.
>> With advice to run --rebuild-tree.

Mine:

Linux 2.4.18 UP (SMP kernel), SW RAID0 and linear, nearly full 160GB
reiserfs of mostly small files, reiserfsprogs 1:3.6.3-1 (Debian).  I had
two machines go through a power failure while doing lots of concurrent
hard links and deletes.  The linear system survived apparently intact,
while the RAID0 system had the usual "stat Permission denied"
problem.

This has happened a number of times before on a variety of systems
(it seems to be reiserfs's most common failure mode).  The events are
very similar each time.  AFAICT you just have to set up a reiserfs on
some kind of RAID system and let it run through a few power failures to
reproduce the problem.

>> But after 16 hours of running it, it is still on 0% and whole process 
>> would take about 1 month to complete (started at 2000 blocks/sec, 
>> but now running at 26b/s).

My reiserfsck --rebuild-tree has been running for a little over an hour
and has degraded to 49 blocks/sec (about 10 days).  r-fsck absorbs all
the CPU it can get.  The reiserfsck process's memory usage increases by
about 8 bytes per block read, and as far as I can tell all of the RAM
allocated after the first 24 megs or so is active (I determine this by
creating a large process to swap out all the inactive pages, then
counting what remains).  Nothing is physically wrong with the disks,
it was just another power failure.  

Based on past events, the read speed will probably degrade to zero in a
week or two, if the reiserfsck process doesn't run out of RAM+swap first.
It only takes 20 days to repopulate the disk, so in the past when this
happens I usually just mkreiserfs (or mke2fs -j!) and move on.  I've never
seen a reiserfsck --rebuild-tree run to completion.

If you feel that 'debugreiserfs -p ... | bzip2' output would be helpful,
I could generate it, but that's about 40GB of data.

-- 
Opinions expressed are my own, I don't speak for my employer, and all that.
Encrypted email preferred.  Go ahead, you know you want to.  ;-)
OpenPGP at work: 3528 A66A A62D 7ACE 7258 E561 E665 AA6F 263D 2C3D
