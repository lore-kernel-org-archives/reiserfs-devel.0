From: Russell Coker <russell@coker.com.au>
Subject: Re: kernel go-slow
Date: Thu, 6 Feb 2003 17:41:46 +0100
Message-ID: <200302061741.46153.russell@coker.com.au>
References: <200302030027.40936.russell@coker.com.au> <20030206142649.A27228@t-raenon.nmd.msu.ru> <20030206193247.A29026@t-raenon.nmd.msu.ru>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12663-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030206193247.A29026@t-raenon.nmd.msu.ru>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: flx@msu.ru
Cc: ReiserFS <reiserfs-list@namesys.com>

On Thu, 6 Feb 2003 17:32, Alexander Lyamin wrote:
> > > One problem that has started occuring is that periodically some of the
> > > machines will go really slow for a while.  It's as if the CPU speed has
> > > just dropped to 1% of it's regular speed.  Then after 10 minutes or so
> > > it will continue as normal.
> >
> > when its slows down, please check with vmstat for IO or with your
>
> i think i wasnt clear enough.
> so - first , if you "go-slow" on a disk activity, chances are good
> that it caused by FS or VM or their misunderstandings.

vmstat doesn't work properly.  CPU time is 99% system which suggests that one 
CPU is spending all it's time in kernel space (for both threads of a 
hyper-threaded CPU) or that both CPUs have each got one thread locked in 
kernel space.

It's not disk related, those machines don't have a huge disk access.  The 
machines with the serious disk activity don't have any problems.

> but there is possible situations that will not generate disk activity,
> but may cause your system to "go-slow", if there you have some
> unussual IO numbers while disk activity is moderate to low -
> most likely same sweet pair.

The problem is that sar etc product jumbled results.  Profiling the kernel may 
help, but may also hide the error, and it's not something I can easily do.

The servers are locked in a managed server room on the other side of the city 
so seeing the blinken lights is not an option.

I've put the aa1 kernel on half the machines and now I'll wait to see what 
happens.  If the aa1 machines don't have the problem but the others do then 
I'll go all aa1.

> > > Interestingly the machines that have the problems are not the most
> > > active in the file system (mail store), but the mail spool machines. 
> > > The mail spool machines do a good amount of file access (but well below
> > > the limits of the hardware) and also use more memory and have large
> > > load spikes on occasion (virus and spam scanning).
>
> talking about  virus/spam scanning - what do you use and how its integrated
> in your SMTP MTA ?

RAV.  I'm not sure of the details, I think it runs as a daemon that qmail 
talks to.  I try to avoid the anti-virus stuff.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

