From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Copy time comparison 2.4.20-pre6 <-> 2.4.19+data-logging
 (was:Compatibility of  current 2.4.19.pending ...)
Date: Thu, 19 Sep 2002 03:14:56 +0200
Message-ID: <3D892510.2000602@mb.tu-ilmenau.de>
References: <3D7FDEA5.7040806@mb.tu-ilmenau.de> <3D81076E.6090408@mb.tu-ilmenau.de> <20020913113735.A6022@namesys.com> <3D826FB9.7030909@mb.tu-ilmenau.de> <20020914130239.D26664@namesys.com> <3D867C14.5060404@mb.tu-ilmenau.de> <20020917103321.C25766@namesys.com> <3D87347D.8030504@mb.tu-ilmenau.de> <20020917180035.A15755@namesys.com> <3D8768DB.1030102@mb.tu-ilmenau.de> <20020918092012.A20063@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11507-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hi!

Even facing the problem to make this mail unreadable I want to answer 
all inline. Please, don't complain.

I feel the urgent need to correct at least my last testing results as 
your last mail revealed heavy errors of my timing tests and kind-of 
opened my eyes.

On 09/18/2002 07:20 AM, Oleg Drokin wrote:
> Hello!
> 
> On Tue, Sep 17, 2002 at 07:39:39PM +0200, Manuel Krause wrote:
> 
>>>Copy same amount of data from RAM/nowhere to FS.
>>>E.g. make a file with file names and sizes and write a script that
>>>writes this amount of data from /dev/zero with these same names and needed 
>>>sizes into FS. (or just use RAMFS as your source if you have not much data 
>>>and huge RAM)
>>
>>To be honest, this already exceeds my linux knowledge...
> 
> I meant something to this extent:
> You run a script that runs over your filesystem and creates shell script
> that first creates whole dir structure of source dir and then for each file
> creates necessary command to recreate file of the same size:
> e.g for this directory contents:
> green@angband:~/z> ls -lR 
[...]
> Result of the work of the script would be:
> mkdir t
> mkdir t/z
> dd if=/dev/zero of=t/z/inode.c bs=69570 count=1
> dd if=/dev/zero of=t/z/stree.c bs=66478 count=1
> dd if=/dev/zero of=t/z/tail_conversion.c bs=10256 count=1
> 
> And you can run resulting script in target dir.

Yes, I saw this work in a nightmare last night. Scheduled for some dark 
moonless cold snow flurry winter night, sorry. Except for someone 
experienced likes to provide me with a basic script for that... ;-))

>>I was fiddling with some test directories containing 195.8MB I copied to 
>>and from /dev/shm with swap turned off.
>>
>># time cp -a /dev/shm/. /mnt/beta/z.Backup.3/
>>kernel 2.4.20-pre7  | kernel 2.4.20-pre6
>>real    0m9.006s    | real    0m6.740s
>>user    0m0.190s    | user    0m0.230s
>>sys     0m5.250s    | sys     0m4.780s
>># rm -r /dev/shm/*
>># time cp -a /mnt/beta/z.Backup.3/. /dev/shm/
>>kernel 2.4.20-pre7  | kernel 2.4.20-pre6
>>real    0m6.349s    | real    0m6.180s
>>user    0m0.210s    | user    0m0.220s
>>sys     0m2.450s    | sys     0m2.510s
> 
> This dataset is way too small and entirely fits into your RAM I presume.

Yes, it fits. I know that problem with this RAM based test. Though I may 
increase the testing directory a bit closer to the OOM limit, having 
512MB available.

> So to avoid any distortion or results you'd better have all periodic stuff
> disabled. (though kupdated is still there) so it's better to run it several
> times.
> Also since it its into RAM, it must be flushed out, so I usually do this
> using such command:
> time sh -c "cp -a /testfs0/linux-2.4.18 /mnt/ ; umount /mnt"

Couldn't you have written these words to me some years earlier?! The 
effect is measurable and on almost any so far discussed fs interaction 
huge or at least relevant. So, after reviewing my 
partition-backup-scripts, forget _all_ results I posted to the list. 
They're all lacking the umount=flush component.

Now, you caught me as the "fool of reiserfs-list"... Quite embarrassing. 
Mmmh. Painful.

>># time dd if=/dev/zero bs=1M count=1000 of=/mnt/beta/testfile.zero
>>kernel 2.4.20-pre7  | kernel 2.4.20-pre6
>>real    1m11.390s   | real    1m42.011s
>>sys     0m11.230s   | sys     0m5.620s
> 
> Hm. While system time is less as expected, real time increased, that's strange.
> 
>># time dd of=/dev/null bs=1M if=/mnt/beta/testfile.zero
>>kernel 2.4.20-pre7  | kernel 2.4.20-pre6
>>real    1m16.738s   | real    1m39.094s
>>sys     0m5.460s    | sys     0m5.930s
> 
> And real time is bigger for reads too, so it seems data layout is different.
> 
> That's really strange. If you can reproduce this behaviour, I am interested
> in getting debugreiserfs -d output for each case after you umount this volume
> (I assume that2 /mnt/beta/ filesystems contains nothing but this testfile.zero
> file).

No. /mnt/beta/ is my software storage partition and contains this:
  /dev/hda11   5550248   4089088   1461160  74% /mnt/beta .

I have no means to provide this complete "debugreiserfs -d /dev/hda11" 
output set, 42MB one of four, if I read your wording correctly (-pre6 
without 1G file, -pre6 with 1GB file, -pre7 without 1GB file, -pre7 with 
1GB file) on my web-space. As .tar.gz it's 4MB one of four, and even 
that set doesn't fit on my private t-online  website. Maybe, it would 
work if sent sequentially by mail.
Oh. O.k. you get a definite "No" on this, sorry. I just reviewed the 
debugreiserfs' output file content and I would not send or publish this 
in any way. It is simply too sensitive as it contains direct file and 
directory names.
Is it possible to provide the needed info without clear directory or 
file names in future?! (These names replaced by sequentionally taken 
numbers?)

////

O.k., too many words about unneeded things. I've remade the testing I 
posted and kept to umount the interacting related partition inbetween in 
order to force the needed flush and captured that time, too, now. My 
previously posted values have not been reproducible, if I review the new 
values correctly. But, you need to read and interprete it yourself!

I took 3 timings each test and calculated the mean value.

Comparison of "dd" actions:
---------------------------
reading command: time sh -c "dd if=/mnt/beta/testfile.zero bs=1M
  count=1000 of=/dev/null ; umount /mnt/beta"
writing command: time sh -c "dd if=/dev/zero bs=1M count=1000
  of=/mnt/beta/testfile.zero ; umount /mnt/beta"

mean-pre7 writing dd 1G | mean-pre6 writing dd 1G
real   1m32.288s        | real   1m30.531s
user   0m0.013s         | user   0m0.016s
sys    0m11.207s        | sys    0m5.036s

mean-pre7 reading dd 1G | mean-pre6 reading dd 1G
real    1m24.002s       | real   1m22.039s
user    0m0.010s        | user   0m0.013s
sys     0m6.470s        | sys    0m6.083s

related df values:
/dev/hda11   5550248   4089088   1461160  74% /mnt/beta
/dev/hda11   5550248   5114104    436144  93% /mnt/beta

Yes, that's going over the "senfseful" filesystem content value.

////

Comparison of "cp -a" actions:
------------------------------
reading command: time sh -c "cp -a /mnt/beta/z.Backup.3/. /mnt/ramfs/ ;
  umount /mnt/beta ; umount /mnt/ramfs"
writing command: time sh -c "cp -a /mnt/ramfs/. /mnt/beta/z.Backup.3/ ;
  umount /mnt/beta ; umount /mnt/ramfs"

mean-pre7 reading files | mean-pre6 reading files
real    0m38.641s       | real    0m39.110s
user    0m0.200s        | user    0m0.220s
sys     0m3.400s        | sys     0m3.200s

mean-pre7 writing files | mean-pre6 writing files
real    0m25.128s       | real    0m27.689s
user    0m0.200s        | user    0m0.160s
sys     0m4.860s        | sys     0m5.217s

directory content: 171.3MB

////

>>>Compare 2.4.20-pre[67] if you see any difference.
>>>Ah, also copy your data from original disk location to /dev/null and 
>>>measure
>>>time of that operation to know how much of total time is occupied by reads.
>>>Also you can calculate read and write throughput separately this way.
>>>And if reads are slower than writes - ...
>>
>>I'm definitely not sure if my lines above are something you meant.
> 
> Yes, kind of, though you have omitted timings of copying original data to
> /dev/shm/ that will give us read speed from original media.

I thought my posted set "# time cp -a /mnt/beta/z.Backup.3/. /dev/shm/" 
represented copying the original data from reiserfs partition /mnt/beta 
to /dev/shm ?!

> In fact instead of turning of swap you can do
> mount none /mnt/ramfs -t ramfs
> command (if you have ramfs compiled in of course) and /mnt/ramfs is now
> kind of ram filesystem with very low overhead. It also cannot be swapped out
> so if you fill all of your RAM, your box will OOM ;)

Even more, after finding that RAMFS was now internally set enabled in 
the related Config.in but searching it over and over before (Me: Am I 
really blind, now?!) I saw huge throughput diffs between shm and RAMFS.

> Byt the test itself is very small.
> Probably you need to run something like
> time find /source/that/needs/to/be/backed/up -type f -exec cat {} >/dev/null \;
> 
> to get read performance and implement a script like I mentioned in the beginning
> to measure writes.
> This way you do not need tons of RAM.

I see. :-)
Hope that mail brings some clarification and I haven't forgotten too 
much for now.


Thanks, good night,

Manuel

