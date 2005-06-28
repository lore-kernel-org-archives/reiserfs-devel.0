From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reiser4 merging action list
Date: Tue, 28 Jun 2005 12:37:11 +0400
Message-ID: <1119947829.3495.25.camel@tribesman.namesys.com>
References: <42BB7B32.4010100@slaphack.com.suse.lists.linux.kernel>
	 <200506240334.j5O3YowB008100@laptop11.inf.utfsm.cl.suse.lists.linux.kernel>
	 <20050627092138.GD11013@nysv.org.suse.lists.linux.kernel>
	 <20050627124255.GB6280@thunk.org.suse.lists.linux.kernel>
	 <42C0578F.7030608@namesys.com.suse.lists.linux.kernel>
	 <20050627212628.GB27805@thunk.org.suse.lists.linux.kernel>
	 <42C084F1.70607@namesys.com.suse.lists.linux.kernel>
	 <p73vf3zuqzq.fsf@verdi.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24747-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <p73vf3zuqzq.fsf@verdi.suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andi Kleen <ak@suse.de>
Cc: Hans Reiser <reiser@namesys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com, Andrew Morton <akpm@osdl.org>, Christoph Hellwig <hch@infradead.org>

Hello

On Tue, 2005-06-28 at 06:58, Andi Kleen wrote:
> Hans Reiser <reiser@namesys.com> writes:
> 
> >    * metafiles should be disabled until we can present code that works
> > right.  Half the list thinks we cannot solve the cycles problem ever. 
> > Disable metafiles and postpone problem until working code, or the
> > failure to produce it, makes it possible to do more than rant at each
> > other.  This is currently already done in the -mm patches, but is
> > mentioned lest someone think it forgotten.
> > 
> >    * update the locking documentation
> > 
> > Probably I forget something.
> 
> These are all big picture issues, but I think some low level attention to
> the individual code is still needed.
> 
> Some stuff that stood out from a very quick look:
> 
> I would like for the custom spin lock debugging (spin_macros.h) and
> profiling code to be removed (prof.[ch], spinprof.[ch]). Such code shouldn't 
> be in specific subsystems. 
> 
sorry, Andi, I guess you are looking at something old. Reiser4 does not
have neither prof.[ch], nor spinprof.[ch] and we removed already some
debugging code from spin_macros.h.

> The division functions in lib.h are useless IMHO, both callers seem
> to use divide by a power of two. And gcc supports shift in 64bit
> fine in the kernel. Can you remove that please? 
> 
ok

> statcnt.h: This is completely useless because you don't align
> the individual fields for cache lines - so you will still
> have false sharing everywhere. Also using NR_CPUS is nasty
> because it can be very big - num_possible_cpus() is better. 
> It should use the new dynamic per cpu allocator.
> 
statcnt.h is already removed.

> Best you just remove it for now and use atomic_t and readd properly
> when you do real SMP tuning with measurements.
> 
> debug.[ch]: A lot of these functions like "schedulable" are name space
> space polluting. 
> reiser4_kmalloc() such wrappers are deprecated. Please remove.
ok
> xmemset et.al should be replaced with the normal functions everywhere
> 
done.

> Best would be probably to remove most of these files for submission.
> 
> What is reiser4_internal? Can't you just use static like
> everybody else?

ok

> status_flags.c: Please remove that CONFIG_FRAME_POINTER code.
> In general i think it would be better if you removed that 
> "private mini crashdumping".

ok

> 
> Is there any reason you can't just use wait queues like everybody
> else instead of these reimplemented condition variables in kcond.[ch]?
> 
I will investigate that

> In general it would be good if someone experienced not from the reiser team
> would read the whole source and looks for obvious problems
> (I didn't, just mentioning stuff I from a quick look at some support
> files) 
> 
> -Andi
> 
> 

