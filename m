From: Chris Mason <mason@suse.com>
Subject: Re: Reiserfs concurrent write problems
Date: Tue, 27 Apr 2004 14:00:41 -0400
Message-ID: <1083088841.30344.131.camel@watt.suse.com>
References: <20040426172648.GA22918@em.ca>
	 <1083000970.30344.50.camel@watt.suse.com>  <20040427161544.GA27873@em.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18253-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040427161544.GA27873@em.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Cc: reiserfs-list@namesys.com

On Tue, 2004-04-27 at 12:15, Bruce Guenter wrote:
> On Mon, Apr 26, 2004 at 01:36:11PM -0400, Chris Mason wrote:
> > Please try 2.6.6-rc2-mm2, which has new block allocator patches and
> > other speedups.
> > 
> > The default mount options should work best for you, but this might work
> > too:
> > 
> > mount -o alloc=skip_busy:dirid_groups /dev/xxx /mnt
> 
> Using the new kernel and the above mount options boosted the write
> performance of ReiserFS, almost to the level of XFS.  At the highest
> concurrency level, the reading performance dropped, but it's still much
> faster than the other FSs.
> 
> Thanks for your help.

Good to hear, could I trouble you to ping me (or better yet
reiserfs-list) when you have the graphs updated?

Other notes about 2.6.6-rc2-mm2, it has some ext3 optimizations as well,
you might want to rebenchmark there.  reiserfs defaults to -o
data=ordered in the 2.6.6-rc2 (and -mm), you should get slightly better
numbers with -o data=writeback.

-chris


