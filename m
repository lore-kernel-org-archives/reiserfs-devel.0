From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Copy time comparison 2.4.20-pre6 <-> 2.4.19+data-logging
 (was:Compatibility of  current 2.4.19.pending ...)
Date: Thu, 12 Sep 2002 23:30:22 +0200
Message-ID: <3D81076E.6090408@mb.tu-ilmenau.de>
References: <3D7FDEA5.7040806@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11436-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>

On 09/12/2002 02:24 AM, Manuel Krause wrote:
> Hi!
> 
> Originally I wanted to prepare a new kernel based on 2.4.20-pre6. That 
> didn't work due to a gcc compiler failure I have to investigate on here 
[...]
Solved by upgrading from gcc-2.95.2 to the recommended version 2.95.3
[...]
> Now I'm completely confused with my private file-naming-convention, the 
> newest reiserfs 2.4.19.pending directory and the following question:
> 
>  Is the current 2.4.19.pending compatible with data-logging any more???
> 
> When I see the discussion about the new block-allocator, the testing 
> directory etc. I assume a definite "No." (Please, please, correct me, if 
> I'm wrong...)

;-) You really didn't correct me so far. Mmh. :-(

> 
> So, for the overnight change to pre-kernel 7, where are the new 
> data-logging patches Hans even announced to lkml?

So I really got a 2.4.20-pre6 compiled with the 
preempt-kernel-rml-2.4.20-pre5-1.patch and Olegs fix he sent to the list 
yesterday. BTW, have the testing patches from -pre5 gone into -pre6? It 
isn't clear to me.

You see the timing values of my backup session (cp -a A/. B/) from this 
afternoon as follows:


partition 1: /dev/hdd7       2722896   2043700    679196  76% /mnt/beta
  (is my / filesystem)

used FS:  noatime,notail
  real  11m2.265s    user  0m1.480s    sys  0m47.550s  ~3,014MB/s    32%
fresh FS: noatime,notail
  real   5m19.686s   user  0m1.210s    sys  0m46.980s  ~6,243MB/s    66%
fresh FS: noatime,notail,data=ordered -- kernel
2.4.19+rml-preempt+reiserfs+data-logging-patches
  (real  3m19.895s   user  0m1.400s   sys  0m49.890s)  ~9,409MB/s  =100%


partition 2: /dev/hdd11      5550248   3801504   1748744  69% /mnt/beta
  (my software "repository", accessed not really often)

used FS:  noatime,notail
  real 12m30.172s   user  0m1.360s   sys  1m10.350s    ~4,949MB/s    61%
fresh FS: noatime,notail
  real 10m11.303s   user  0m1.240s   sys  1m10.400s    ~6,073MB/s    74%
fresh FS: noatime,notail,data=ordered -- kernel
2.4.19+rml-preempt+reiserfs+data-logging-patches
  (real  8m56.040s  user  0m1.410s  sys  1m27.920s)    ~8,180MB/s  =100%


(...) = timings with slightly different disk content one month ago


Application startup timings of NS-7.0 and OOo-1.0.1 didn't increase. :-))

I hope I don't need to comment on the values...


Thanks,

Manuel

