From: Sonny Rao <sonny@burdell.org>
Subject: Re: Odd Block allocation behavior on Reiser3
Date: Tue, 10 Aug 2004 12:12:52 -0400
Message-ID: <20040810161252.GC67591@kevlar.burdell.org>
References: <20040809201939.GA55683@kevlar.burdell.org> <1092083451.10651.218.camel@watt.suse.com> <20040809220459.GA57121@kevlar.burdell.org> <1092142411.10651.226.camel@watt.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20128-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1092142411.10651.226.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Tue, Aug 10, 2004 at 08:53:31AM -0400, Chris Mason wrote:
<snip>
> Ok, the block allocator optimizations went in after 2.6.7.  I'd be
> curious to see how 2.6.8-rc3 does in your tests.

I'll try it.


> This could be the metadata mixed in with the file data.  In general this
> is a good
> Still there were a number of cases the old allocator didn't do as well
> with. thing, when you read the file sequentially, the metadata required
> to find the next block will already be in the drive's cache.
>
> Whenever you're doing fragmentation tests, it helps to also identify the
> actual effect of the fragmentation on the time it takes to read a file
> or set of files.  It's easy to create a directory where all the files
> are 99.99% contiguous, but that takes 3x as much time to read in.
>
> -chris

In this case, I began investigating fragmentation because I noticed
reiserfs is performing below the other filesystems I tested for some
reason, so I belive this allocation pattern is hurting performance
on sequential reads.

Sonny
