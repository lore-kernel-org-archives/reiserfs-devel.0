From: Chris Mason <mason@suse.com>
Subject: Re: Reiserfs concurrent write problems
Date: Wed, 28 Apr 2004 19:48:22 -0400
Message-ID: <1083196101.30344.222.camel@watt.suse.com>
References: <20040426172648.GA22918@em.ca>
	 <1083000970.30344.50.camel@watt.suse.com> <20040427161544.GA27873@em.ca>
	 <1083088841.30344.131.camel@watt.suse.com>  <20040427201559.GA17186@em.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18276-reiserfs=m.gmane.org@namesys.com>
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

Ok, after a quick read of the rest of your page, here are a few ideas:

reiserfs doesn't need as large a log as ext3 in order to get good
numbers for fsync heavy workloads.  This is good because reiserfs also
pins the logged buffers more then ext3 does, so a 132mb log on reiserfs
is likely to tie up that much ram in pinned metadata.  You might want to
experiment a little with the log size.

I'm a little confused about how an external log slows things down,
please let me know if you see those results with the new patches.

Your sequence is this:

write(tmp file)
fsync(tmp file)
rename(tmp file, somedir/new file)
fsync(somedir)

That last fsync holds the directory semaphore during the log commit,
which hurts concurrency on that directory badly.  Both reiserfs and ext3
can get away with:
rename(tmp file, somedir/new file)
fsync(tmp file fd)

(where tmp file fd has been kept open from the initial write to tmp
file)

It should be much faster.

In reiserfs data=journal mode, you get strict ordering of all the
transactions.  This means you can safely do this:

write(temp file)
rename(temp file, somedir/new file)
fsync(temp file fd)

In data=journal mode and still be safe, as long as the same process does
all three steps above.  This is because you know the rename will either
be in the same atomic unit as the last data block in the file, or it
will be in a later atomic unit then the last data block in the file. 
Either way, the rename can't happen first.

This should hold true for ext3 as well, but you should check with the
ext3 developers before basing any products on it.

-chris



