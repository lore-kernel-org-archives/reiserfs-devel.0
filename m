From: Chris Mason <mason@suse.com>
Subject: Re: Reiserfs concurrent write problems
Date: Tue, 27 Apr 2004 19:48:27 -0400
Message-ID: <1083109707.30344.142.camel@watt.suse.com>
References: <20040426172648.GA22918@em.ca>
	 <1083000970.30344.50.camel@watt.suse.com> <20040427161544.GA27873@em.ca>
	 <1083088841.30344.131.camel@watt.suse.com>  <20040427201559.GA17186@em.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18259-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040427201559.GA17186@em.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Cc: reiserfs-list@namesys.com

On Tue, 2004-04-27 at 16:15, Bruce Guenter wrote:
> On Tue, Apr 27, 2004 at 02:00:41PM -0400, Chris Mason wrote:
> > Good to hear, could I trouble you to ping me (or better yet
> > reiserfs-list) when you have the graphs updated?
> 
> For sure.
> 
> > Other notes about 2.6.6-rc2-mm2, it has some ext3 optimizations as well,
> > you might want to rebenchmark there.
> 
> I am re-running all of the benchmarks, actually, as well as doing some
> tweaking to the XFS options.
> 
> > reiserfs defaults to -o
> > data=ordered in the 2.6.6-rc2 (and -mm), you should get slightly better
> > numbers with -o data=writeback.
> 
> I will try that, as well as data=journal (which I understand is one of
> the new features in the -mm patches).  The production system will not
> run data=writeback, but it is still a useful number.

-mm doesn't have data=journal for reiserfs, but I do have a patch
available.  I'll send you an update tomorrow morning.

-chris


