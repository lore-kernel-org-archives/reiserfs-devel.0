From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Getting very interesting - Poor read performance
Date: Fri, 08 Nov 2002 01:48:34 +0100
Message-ID: <3DCB09E2.8040206@mb.tu-ilmenau.de>
References: <200211071809.gA7I90nd004446@turing-police.cc.vt.edu> <3DCB03E6.7040602@valuecommerce.ne.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11948-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Naoki <naoki@valuecommerce.ne.jp>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hi Naoki and all others!

I like your kind of testing very well!

But, mainly, kernel 2.4.2 (??? really ???) is very very outdated in 
terms of reiserfs bug fixing activities in the recent past. Maybe the 
earlier bugs made some speed advantages due to missing checks. ;-)

You may want to try stock kernel 2.4.19 that was basically really fast 
itself with reiserfs and safe! Apply the fixes from
   ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.19.pending !

When you want to try the additional reiserfs mount option "notail" you 
could get another speedup. Then you should rebuild your original disk 
content (copy to a spare partition and copy back, e.g.).

If you want to exaggerate speedups try the data-logging patches from 
Chris Mason for 2.4.19 to be found in the base directory
   ftp://ftp.suse.com/pub/people/mason/patches/data-logging
(Then some original reiserfs patches (namesys ones) won't apply 
afterwards - skip them by trial and error)

Best wishes,

Manuel


On 11/08/2002 01:23 AM, Naoki wrote:
> Aha, very good point.
> 
> Now strace'ing the 'wc' I see the same on both servers. Just a bunch of 
> 'read'
> sys calls.
> 
> So why would 'read' generate such a different user time on the two machines?
> 
> Trying some tests with larger files in where the problem becomes far 
> more evident:
> 
> 'New' box :
> 
> # wc -l bigfile
> 
>  290314 bigfile
> 
> real    0m23.047s
> user    0m16.072s
> sys     0m0.348s
> 
> # mount
> /dev/sda3 on / type reiserfs (rw,noatime,nodiratime,nolog)
> 
> # strace -c wc bigfile
> execve("/usr/bin/wc", ["wc", "bigfile"], [/* 23 vars */]) = 0
> 290314 3127604 40121984 bigfile
> % time     seconds  usecs/call     calls    errors syscall
> ------ ----------- ----------- --------- --------- ----------------
>  68.33    0.104694          43      2453           read
>  31.51    0.048270          76       637           write
>   0.07    0.000113           9        13         7 open
>   0.02    0.000029          10         3           munmap
>   0.02    0.000028           7         4           mmap2
>   0.02    0.000025           5         5           old_mmap
>   0.01    0.000020           3         6           fstat64
>   0.01    0.000013           2         6           close
>   0.01    0.000010           3         4           brk
>   0.00    0.000005           5         1           mprotect
>   0.00    0.000004           4         1           uname
> ------ ----------- ----------- --------- --------- ----------------
> 100.00    0.153211                  3133         7 total
> 
> 
> 
> Old box :
> 
> # time wc -l /root/bigfile
>  290314 /root/bigfile
> 0.68user 0.09system 0:00.86elapsed 88%CPU (0avgtext+0avgdata 0maxresident)k
> 0inputs+0outputs (114major+19minor)pagefaults 0swaps
> 
> And again :
> 
> [root@banner23 logs]# strace -c wc /root/bigfile
> execve("/usr/bin/wc", ["wc", "/root/bigfile"], [/* 20 vars */]) = 0
>  290314 3127604 40121984 /root/bigfile
> % time     seconds  usecs/call     calls    errors syscall
> ------ ----------- ----------- --------- --------- ----------------
>  99.59    0.100965          41      2453           read
>   0.16    0.000161          12        13         2 open
>   0.07    0.000075          15         5           brk
>   0.06    0.000062           5        13           old_mmap
>   0.03    0.000031           3        11           close
>   0.02    0.000023           3         9           fstat
>   0.02    0.000019           6         3           munmap
>   0.01    0.000015          15         1           write
>   0.01    0.000015           5         3           mprotect
>   0.01    0.000008           4         2           fstat64
>   0.00    0.000005           5         1           ioctl
>   0.00    0.000002           2         1           getpid
>   0.00    0.000002           2         1           personality
> ------ ----------- ----------- --------- --------- ----------------
> 100.00    0.101383                  2516         2 total
> 
> 
> # mount
> /dev/sda3 on / type reiserfs (rw,noatime,nodiratime)
> 
> 
> That's messed up! Why are they doing exactly the same # of 'read' calls
> but my newer system has decided to add 637 'write' calls ??????
> 
> What reiserfs / mount options should I try to get this at a more normal 
> level ?
> 
> 
> -n.
> 
> Valdis.Kletnieks@vt.edu wrote:
> 
>>On Thu, 07 Nov 2002 19:59:55 +0900, Naoki <naoki@valuecommerce.ne.jp>
>>said:
>>
>>  
>>
>>>real    0m3.059s
>>>user    0m2.543s <== say what???
>>>sys     0m0.064s
>>>    
>>>
>>>0.25user 0.04system 0:00.38elapsed 76%CPU (0avgtext+0avgdata
>>>    
>>>
>>0maxresident)k
>>  
>>
>>>0inputs+0outputs (115major+19minor)pagefaults 0swaps
>>>    
>>>
>>
>>I'd start by investigating why on the new box the 'user' time is 2.5+
>>seconds.
>>
>>Notice that the 'system' times on both boxes are comparable (0.06 versus
>>0.04 - low enough that timer resolution probably matters in any jitter
>>in
>>the measurements).
>>
>>Does 'which wc' show you running something other than /usr/bin/time on
>>the
>>new box?
>>  
>>

