From: Chris Mason <mason@suse.com>
Subject: Re: Odd Block allocation behavior on Reiser3
Date: Tue, 10 Aug 2004 08:53:31 -0400
Message-ID: <1092142411.10651.226.camel@watt.suse.com>
References: <20040809201939.GA55683@kevlar.burdell.org>
	 <1092083451.10651.218.camel@watt.suse.com>
	 <20040809220459.GA57121@kevlar.burdell.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20122-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040809220459.GA57121@kevlar.burdell.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sonny Rao <sonny@burdell.org>
Cc: reiserfs-list@namesys.com

On Mon, 2004-08-09 at 18:04, Sonny Rao wrote:
> On Mon, Aug 09, 2004 at 04:30:51PM -0400, Chris Mason wrote:
> > On Mon, 2004-08-09 at 16:19, Sonny Rao wrote:
> > > Hi, I'm investigating filesystem performance on sequential read
> > > patterns of large files, and I discovered an odd pattern of block
> > > allocation and subsequent re-allocation after overwrite under reiser3:
> > > 
> > Exactly which kernel is this?  The block allocator in v3 has changed
> > recently.
> 
> 2.6.7 stock
> 
Ok, the block allocator optimizations went in after 2.6.7.  I'd be
curious to see how 2.6.8-rc3 does in your tests.

> > > This was done on a newly created filesystem with plenty of available
> > > space and no other files.  I tried this test several times and saw the
> > > number of extents for the file vary from 5,6,7 and 134 extents, but it
> > > is always different after each over-write.
> > > 
> > You've hit a "feature" of the journal.  When you delete a file, the data
> > blocks aren't available for reuse until the transaction that allocated
> > them is committed to the log.  If you were to put a sync in between each
> > run of dd, you should get roughly the same blocks allocated each time. 
> > ext3 does the same things, although somewhat differently.  The
> > asynchronous commit is probably just finishing a little sooner on ext3.
> > 
> > > First, I expect that an extent-based filesystem like reiserfs
> > 
> > reiser4 is extent based, reiser3 is not.
> 
> 
> Ah, I didn't know that.  I'm still confused as to why on the first
> allocation/create we get such bad fragmentation, you can see that even
> though the file is fragmented into 134 blocks, the blocks are very
> close together.  Most of the extents are only 2 blocks apart.

This could be the metadata mixed in with the file data.  In general this
is a good
Still there were a number of cases the old allocator didn't do as well
with. thing, when you read the file sequentially, the metadata required
to find the next block will already be in the drive's cache.

Whenever you're doing fragmentation tests, it helps to also identify the
actual effect of the fragmentation on the time it takes to read a file
or set of files.  It's easy to create a directory where all the files
are 99.99% contiguous, but that takes 3x as much time to read in.

-chris

