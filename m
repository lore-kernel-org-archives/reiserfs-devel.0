From: Oleg Drokin <green@namesys.com>
Subject: Re: Copy time comparison 2.4.20-pre6 <-> 2.4.19+data-logging (was:Compatibility of  current 2.4.19.pending ...)
Date: Wed, 18 Sep 2002 09:20:12 +0400
Message-ID: <20020918092012.A20063@namesys.com>
References: <3D7FDEA5.7040806@mb.tu-ilmenau.de> <3D81076E.6090408@mb.tu-ilmenau.de> <20020913113735.A6022@namesys.com> <3D826FB9.7030909@mb.tu-ilmenau.de> <20020914130239.D26664@namesys.com> <3D867C14.5060404@mb.tu-ilmenau.de> <20020917103321.C25766@namesys.com> <3D87347D.8030504@mb.tu-ilmenau.de> <20020917180035.A15755@namesys.com> <3D8768DB.1030102@mb.tu-ilmenau.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11504-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D8768DB.1030102@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Tue, Sep 17, 2002 at 07:39:39PM +0200, Manuel Krause wrote:

> >Copy same amount of data from RAM/nowhere to FS.
> >E.g. make a file with file names and sizes and write a script that
> >writes this amount of data from /dev/zero with these same names and needed 
> >sizes
> >into FS. (or just use RAMFS as your source if you have not much data and 
> >huge
> >RAM)
> To be honest, this already exceeds my linux knowledge...

I meant something to this extent:
You run a script that runs over your filesystem and creates shell script
that first creates whole dir structure of source dir and then for each file
creates necessary command to recreate file of the same size:
e.g for this directory contents:
green@angband:~/z> ls -lR
.:
total 1
drwxr-xr-x    2 green    green         114 Sep 18 09:08 t

./t:
total 148
-rw-rw-r--    1 green    green       69570 Aug 10 16:34 inode.c
-rw-rw-r--    1 green    green       66478 Aug 10 16:33 stree.c
-rw-rw-r--    1 green    green       10256 Aug 10 16:32 tail_conversion.c

Result of the work of the script would be:
mkdir t
mkdir t/z
dd if=/dev/zero of=t/z/inode.c bs=69570 count=1
dd if=/dev/zero of=t/z/stree.c bs=66478 count=1
dd if=/dev/zero of=t/z/tail_conversion.c bs=10256 count=1

And you can run resulting script in target dir.

> I was fiddling with some test directories containing 195.8MB I copied to 
> and from /dev/shm with swap turned off.
> 
> # time cp -a /dev/shm/. /mnt/beta/z.Backup.3/
> kernel 2.4.20-pre7  | kernel 2.4.20-pre6
> real    0m9.006s    | real    0m6.740s
> user    0m0.190s    | user    0m0.230s
> sys     0m5.250s    | sys     0m4.780s
> # rm -r /dev/shm/*
> # time cp -a /mnt/beta/z.Backup.3/. /dev/shm/
> kernel 2.4.20-pre7  | kernel 2.4.20-pre6
> real    0m6.349s    | real    0m6.180s
> user    0m0.210s    | user    0m0.220s
> sys     0m2.450s    | sys     0m2.510s

This dataset is way too small and entirely fits into your RAM I presume.
So to avoid any distortion or results you'd better have all periodic stuff
disabled. (though kupdated is still there) so it's better to run it several
times.
Also since it its into RAM, it must be flushed out, so I usually do this
using such command:
time sh -c "cp -a /testfs0/linux-2.4.18 /mnt/ ; umount /mnt"

> # time dd if=/dev/zero bs=1M count=1000 of=/mnt/beta/testfile.zero
> kernel 2.4.20-pre7  | kernel 2.4.20-pre6
> real    1m11.390s   | real    1m42.011s
> sys     0m11.230s   | sys     0m5.620s

Hm. While system time is less as expected, real time increased, that's strange.

> # time dd of=/dev/null bs=1M if=/mnt/beta/testfile.zero
> kernel 2.4.20-pre7  | kernel 2.4.20-pre6
> real    1m16.738s   | real    1m39.094s
> sys     0m5.460s    | sys     0m5.930s

And real time is bigger for reads too, so it seems data layout is different.

That's really strange. If you can reproduce this behaviour, I am interested
in getting debugreiserfs -d output for each case after you umount this volume
(I assume that /mnt/beta/ filesystems contains nothing but this testfile.zero
file).

> >Compare 2.4.20-pre[67] if you see any difference.
> >Ah, also copy your data from original disk location to /dev/null and 
> >measure
> >time of that operation to know how much of total time is occupied by reads.
> >Also you can calculate read and write throughput separately this way.
> >And if reads are slower than writes - ...
> I'm definitely not sure if my lines above are something you meant.

Yes, kind of, though you have omitted timings of copying original data to
/dev/shm/ that will give us read speed from original media.

In fact instead of turning of swap you can do
mount none /mnt/ramfs -t ramfs
command (if you have ramfs compiled in of course) and /mnt/ramfs is now
kind of ram filesystem with very low overhead. It also cannot be swapped out
so if you fill all of your RAM, your box will OOM ;)
Byt the test itself is very small.
Probably you need to run something like
time find /source/that/needs/to/be/backed/up -type f -exec cat {} >/dev/null \;

to get read performance and implement a script like I mentioned in the beginning
to measure writes.
This way you do not need tons of RAM.

Bye,
    Oleg
