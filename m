From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Copy time comparison 2.4.20-pre6 <-> 2.4.19+data-logging
 (was:Compatibility of  current 2.4.19.pending ...)
Date: Tue, 17 Sep 2002 19:39:39 +0200
Message-ID: <3D8768DB.1030102@mb.tu-ilmenau.de>
References: <3D7FDEA5.7040806@mb.tu-ilmenau.de> <3D81076E.6090408@mb.tu-ilmenau.de> <20020913113735.A6022@namesys.com> <3D826FB9.7030909@mb.tu-ilmenau.de> <20020914130239.D26664@namesys.com> <3D867C14.5060404@mb.tu-ilmenau.de> <20020917103321.C25766@namesys.com> <3D87347D.8030504@mb.tu-ilmenau.de> <20020917180035.A15755@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11498-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 09/17/2002 04:00 PM, Oleg Drokin wrote:
> Hello!
> 
> On Tue, Sep 17, 2002 at 03:56:13PM +0200, Manuel Krause wrote:
> 
>>>>not?! I calculated these values manually based upon the timings & df 
>>>>values after copying. Yes, I want to show my personal engagement for the 
>>>>reiserfs community, too.
>>>
>>>Hm. Are you sure you are hitting write-speed limit?
>>>May be you are read-speed bounded? Can you please check that?
>>
>>How can I check this? E.g. with some dd process? I just don't know.
> 
> 
> Copy same amount of data from RAM/nowhere to FS.
> E.g. make a file with file names and sizes and write a script that
> writes this amount of data from /dev/zero with these same names and needed sizes
> into FS. (or just use RAMFS as your source if you have not much data and huge
> RAM)

To be honest, this already exceeds my linux knowledge...

I was fiddling with some test directories containing 195.8MB I copied to 
and from /dev/shm with swap turned off.

# time cp -a /dev/shm/. /mnt/beta/z.Backup.3/
kernel 2.4.20-pre7  | kernel 2.4.20-pre6
real    0m9.006s    | real    0m6.740s
user    0m0.190s    | user    0m0.230s
sys     0m5.250s    | sys     0m4.780s
# rm -r /dev/shm/*
# time cp -a /mnt/beta/z.Backup.3/. /dev/shm/
kernel 2.4.20-pre7  | kernel 2.4.20-pre6
real    0m6.349s    | real    0m6.180s
user    0m0.210s    | user    0m0.220s
sys     0m2.450s    | sys     0m2.510s

and

# time dd if=/dev/zero bs=1M count=1000 of=/mnt/beta/testfile.zero
kernel 2.4.20-pre7  | kernel 2.4.20-pre6
real    1m11.390s   | real    1m42.011s
user    0m0.010s    | user    0m0.000s
sys     0m11.230s   | sys     0m5.620s

# time dd of=/dev/null bs=1M if=/mnt/beta/testfile.zero
kernel 2.4.20-pre7  | kernel 2.4.20-pre6
real    1m16.738s   | real    1m39.094s
user    0m0.000s    | user    0m0.000s
sys     0m5.460s    | sys     0m5.930s


> Compare 2.4.20-pre[67] if you see any difference.
> Ah, also copy your data from original disk location to /dev/null and measure
> time of that operation to know how much of total time is occupied by reads.
> 
> Also you can calculate read and write throughput separately this way.
> And if reads are slower than writes - ...
> 

I'm definitely not sure if my lines above are something you meant.

Bye,

Manuel

