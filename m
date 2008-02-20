From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Lack of cached bitmap causing degraded performance and occasional
 hangs
Date: Wed, 20 Feb 2008 14:13:43 -0500
Message-ID: <47BC7BE7.9010400@suse.com>
References: <47BC6869.1020504@fatooh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47BC6869.1020504@fatooh.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Corey Hickey <bugfood-ml@fatooh.org>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Corey Hickey wrote:
> Hello,
> 
> Every once in a while one of the hard drives in my RAID-0 array starts
> buzzing: seeking rapidly and regularly such that it provides a
> continuous tone. The tone is continuous for 0.5-2 seconds before
> changing frequency; the sound goes through many such steps over the
> course of 5-30 seconds. Meanwhile, my computer is effectively unusable:
> programs are starved for I/O, terminals hang, and sometimes X becomes
> unresponsive--I can't even move the mouse pointer.
> 
> This drove me nuts for a while until I figured out the problem:
> reiserfs' bitmap data keeps falling out of the kernel's page cache, and
> re-reading the bitmap is very slow.
> 
> Dropping the page cache instantly triggers the same behavior.
> 
> # echo 1 > /proc/sys/vm/drop_caches
> # dd if=/dev/zero of=file bs=1M count=1024
> 
> It's quite common for writing a gigabyte to consist of 30 seconds of
> reading bitmap data followed by 7 seconds of writing. Sometimes writing
> a single byte takes 15 seconds of reading and 0 seconds of writing. :)
> 
> I did some tests this evening that appear to confirm my analysis. I
> compiled two kernels: one from git immediately before this commit, and
> one from after.
> 
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=5065227b46235ec0131b383cc2f537069b55c6b6
> 
> Before:
> - filesystem takes a long time to mount (of course)
> - no problems thereafter
> 
> After:
> - filesystem mounts pretty quickly
> - the usual buzzing and such
> 
> 
> I don't understand why this problem is biting me so badly--I have
> several other reiserfs filesystems (on the same computer and on others)
> and I can't make any trouble happen with them. Actually, I can always
> force the bitmap data to be forgotten by dropping the page cache, but
> re-reading it only takes an moment on every other reiserfs I have. For
> example, when writing a 1GB file, my 185 GB single-disk filesystem reads
> about 600 KB of bitmap data in 1 second; my 932 GB RAID-0 is likely to
> read 15 MB in 30 seconds.
> 
> 
> I tried gathering information about the bitmaps on the two filesystems
> and how quickly they can be read.
> 
> # echo 1 > /proc/sys/vm/drop_caches
> # time debugreiserfs -m /dev/md0 | wc -l
> (and the same thing for /dev/sda4)
> 
> Meanwhile, I captured disk read info with dstat to see how many
> kilobytes of data were read.
> 
>                time      lines     kilobytes
> /dev/md0     55.125s     14935       29496
> /dev/sda4     9.524s      2987        6680
> 
> The ratios of the above data are very close to each other and to the
> ratio of the filesystem sizes:
> 
> fs size:   932 / 185      = 5.038
> time:      55.126 / 9.524 = 5.788
> lines:     14935 / 2987   = 5.000
> kilobytes: 29496 / 6680   = 4.416

That makes sense. The number of bitmaps is a function of the size of the
file system. There is one bitmap per 128MB of disk, and they're spaced
as-needed, so every 128MB.

> So, then, why does the larger filesystem have to read so much more
> bitmap data before writing? As I mentioned before, /dev/md0 reads up to
> 15 MB before writing, and /dev/sda4 reads only 600 KB.

It will only read until it can find the space available. How full are
each of these file systems?

It's certainly strange behavior. I have a 1.2 TB reiserfs file system
that I can't duplicate this behavior with, even after dropping the
caches. It's about 67% full, so finding free space is relatively easy.

Does this happen repeatedly, or just the first time a write occurs? I'd
be surprised if it happened every time, since reiserfs caches how many
free blocks are in each bitmap group the first time the block is read.
The cache is updated when a block is used or freed. If an allocation
can't be met within that group, it's skipped.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFHvHvnLPWxlyuTD7IRAp0kAKCJqkCWNocayJ7So94RfPhPB6DVzwCePCK/
GOYifjzCgRRptQFs5e5YtD8=
=cLW3
-----END PGP SIGNATURE-----
