From: Chris Mason <mason@suse.com>
Subject: Re: Reiserfs concurrent write problems
Date: Sat, 01 May 2004 08:16:41 -0400
Message-ID: <1083413801.30344.528.camel@watt.suse.com>
References: <20040426172648.GA22918@em.ca>
	 <1083000970.30344.50.camel@watt.suse.com> <20040427161544.GA27873@em.ca>
	 <1083088841.30344.131.camel@watt.suse.com> <20040430195405.GB23648@em.ca>
	 <A7BF88B4-9B51-11D8-B804-000A95CD704C@wagland.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18348-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <A7BF88B4-9B51-11D8-B804-000A95CD704C@wagland.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Wagland <paul@wagland.net>
Cc: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>, reiserfs-list@namesys.com

On Sat, 2004-05-01 at 05:26, Paul Wagland wrote:
> On Apr 30, 2004, at 21:54, Bruce Guenter wrote:
> 
> > On Tue, Apr 27, 2004 at 02:00:41PM -0400, Chris Mason wrote:
> >> Good to hear, could I trouble you to ping me (or better yet
> >> reiserfs-list) when you have the graphs updated?
> >
> > I've updated the benchmarking web page to include the new results from
> > the 2.6.6-rc2-mm2 kernel:
> > 	http://untroubled.org/benchmarking/2004-04/
> 
> One interesting thing that I noticed is that all of the other 
> filesystems have had major performance regressions on most of the tests 
> as compared to the gentoo kernel.
> 
It's a good point.  The jump between 2.6.5 and 2.6.6-rc2-mm2 is pretty
big.  There were fundamental changes in filesystem writeback, scheduler
changes and a few others.  The reiserfs logging changes and new block
allocator do make -mm2 the best for this kind of benchmark on reiserfs,
but maybe not for the other filesystems.

It might be good to get a benchmarks against 2.6.6-rc2, which has many
of the writeback changes from -mm.  If those are causing problems, we'll
want to know sooner rather then later.

There are also some latency fixes in -mm2, which might slow down the
delivery procs in order to give better latencies to concurrent readers. 
Notice the read times are much better in -mm.

Any time you've got a multiprocess benchmark like this, it helps to
gather some kind of information about latencies and fairness, especially
for the delivery rate graphs.

The XFS reading time vs 16 writers is a latency bug of some kind. 
Probably easily solvable, I'm sure they would appreciate a heads up on
it.

-chris


