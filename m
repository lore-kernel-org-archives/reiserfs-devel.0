From: Alexander Lyamin <flx@msu.ru>
Subject: Re:  kernel go-slow
Date: Thu, 6 Feb 2003 19:32:47 +0300
Message-ID: <20030206193247.A29026@t-raenon.nmd.msu.ru>
References: <200302030027.40936.russell@coker.com.au> <20030206142649.A27228@t-raenon.nmd.msu.ru>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12662-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030206142649.A27228@t-raenon.nmd.msu.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Lyamin <flx@msu.ru>
Cc: Russell Coker <russell@coker.com.au>, ReiserFS <reiserfs-list@namesys.com>

Thu, Feb 06, 2003 at 02:26:49PM +0300, Alexander Lyamin wrote:
> Mon, Feb 03, 2003 at 12:27:40AM +0100, Russell Coker wrote:
> > I'm running a number of machines with 2.4.20 and the ReiserFS journal patches.
> > 
> > One problem that has started occuring is that periodically some of the 
> > machines will go really slow for a while.  It's as if the CPU speed has just 
> > dropped to 1% of it's regular speed.  Then after 10 minutes or so it will 
> > continue as normal.
> 
> when its slows down, please check with vmstat for IO or with your
i think i wasnt clear enough.
so - first , if you "go-slow" on a disk activity, chances are good
that it caused by FS or VM or their misunderstandings.

but there is possible situations that will not generate disk activity,
but may cause your system to "go-slow", if there you have some 
unussual IO numbers while disk activity is moderate to low -
most likely same sweet pair.

but Oleg Drokin pointed at situations when even IO will not indicate
whats going on :)

so advice is still the same - if you having slowdowns profiling might help
you much better then  withchy methods described above.

> led for disk activity. thats a simply and stupid.
> 
> but theres no really good way to understand whats goining on in kernel
> if you are userland yourself. so go in kernel with profiling and see
> where does it spend it precisious time. slightly more complicated then
> method above, but much more effective.
> 
> > 
> > Has anyone heard of such things before?
> > 
> > I am asking here first because the ReiserFS patch is the most significant 
> > kernel patch I've applied on what is otherwise a stock 2.4.20 kernel.
> > 
> > Interestingly the machines that have the problems are not the most active in 
> > the file system (mail store), but the mail spool machines.  The mail spool 
> > machines do a good amount of file access (but well below the limits of the 
> > hardware) and also use more memory and have large load spikes on occasion 
> > (virus and spam scanning).
talking about  virus/spam scanning - what do you use and how its integrated in
your SMTP MTA ?

-- 
"Cache remedies via multi-variable logic shorts will leave you crying."(cl)
Lex Lyamin
