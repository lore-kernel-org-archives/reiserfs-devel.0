From: rwhron@earthlink.net
Subject: Re: best reiserfs mount options for generic benchmarking
Date: Sat, 14 Sep 2002 18:34:39 -0400
Message-ID: <20020914223439.GA12719@rushmore>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11450-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: russell@coker.com.au
Cc: reiserfs-list@namesys.com

> Good benchmarking takes serious amounts of time.  

Yes.  I appreciate the work you've put into bonnie++ to
make it better.

> You don't just run a benchmark once and store the results.  You have to 
> run benchmarks several times to measure the divergance of the results.  

I run bonnie++ and tiobench 3 times each and average the results.
dbench is run 5 times with the high/low/average noted.

> Also you have to have them come from a known state for best results, 
> EG you might reboot, mkfs the file system, then run the benchmark.  

That is basically how i do it.  On my web page of results I
try to make it clear that although i'm careful with the
benchmarks, they may not represent realistic loads.  My 
audience for the page is somewhere between the technical
user and the kernel developer.  Most of the kernel hackers
have a good feel for what the common benchmarks do.  The
fs developers probably understand the i/o benchmarks well
too.  I generally only post when there is a large divergence.
Not to say the divergence is important, but just to raise
the level of awareness.  

EG the only performance related posting i recall posting
to reiserfs-list is the one that noted tiobench sequential
reads with a lot of threads had a 70% regression in 
2.4.20-pre2.  That regression wasn't in ext2/ext3.
Oleg mentioned the prealloc mount option.  

I could have just started the thread with, "is prealloc the 
default in 2.4.20-pre7?", because the mount option is obscure 
enough that most people don't know it exists (and therefore
won't use it).

> Benchmarks that represent real things or interesting corner 
> cases are useful to the developers.  

Yes, the benchmarks that people come up with to scratch
an itch are probably the best for getting a problem fixed.
EG someone notices that mp3's skip when they burn a CD.
Those tests truly are time consuming because a human has
to monitor the audio, etc.  I did some tests like that
about a year ago when I noticed a certain memory load
caused mp3's to skip, and the kernel hackers came up
with a fix.  

Also on my page 
http://home.earthlink.net/~rwhron/kernel/bigbox.html
i say something like "this isn't meant to compare filesystems, 
only kernels, because the system state when ext2 is benched
is different from ext3, which is different from reiserfs.
However from kernel to kernel, reiserfs should be in a
very similar starting state compared to previous runs."

Thanks for your comments and making me think more.
-- 
Randy Hron

