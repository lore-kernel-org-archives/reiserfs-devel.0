From: Chris Mason <mason@suse.com>
Subject: Re: Reiserfs concurrent write problems
Date: Thu, 29 Apr 2004 15:19:25 -0400
Message-ID: <1083266365.30344.309.camel@watt.suse.com>
References: <20040426172648.GA22918@em.ca>
	 <1083000970.30344.50.camel@watt.suse.com> <20040427161544.GA27873@em.ca>
	 <1083088841.30344.131.camel@watt.suse.com> <20040427201559.GA17186@em.ca>
	 <1083196101.30344.222.camel@watt.suse.com>  <20040429190403.GA4015@em.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18294-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040429190403.GA4015@em.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Cc: reiserfs-list@namesys.com

On Thu, 2004-04-29 at 15:04, Bruce Guenter wrote:
> On Wed, Apr 28, 2004 at 07:48:22PM -0400, Chris Mason wrote:
> > reiserfs doesn't need as large a log as ext3 in order to get good
> > numbers for fsync heavy workloads.  This is good because reiserfs also
> > pins the logged buffers more then ext3 does, so a 132mb log on reiserfs
> > is likely to tie up that much ram in pinned metadata.  You might want to
> > experiment a little with the log size.
> 
> Noted.  Having extra RAM tied up is likely to only show up in the read
> performance.
> 
> > I'm a little confused about how an external log slows things down,
> > please let me know if you see those results with the new patches.
> 
> With 2.6.6-rc2-mm2, having an external log makes it considerably faster, up
> to 16-concurrency level, where it is somewhat slower.

Strange stuff, it should always be faster.  I'll have to try and
reproduce.

> 
> I'd post the new results, but ext3 is behaving very weird under this
> kernel -- doing a single transaction takes up to 950ms to complete,
> which is more than an order of magnitude too big.
> 
Ouch, Andrew will want to know about that.  

> > Your sequence is this:
> > 
> > write(tmp file)
> > fsync(tmp file)
> > rename(tmp file, somedir/new file)
> > fsync(somedir)
> > 
> > That last fsync holds the directory semaphore during the log commit,
> > which hurts concurrency on that directory badly.
> 
> Fortunately, there is relatively little concurrency on a per-directory
> level.  There are so many directories in play that there is little
> chance that two processes (either reading or writing) will be in
> contention for the same directory.
> 
> > Both reiserfs and ext3
> > can get away with:
> > rename(tmp file, somedir/new file)
> > fsync(tmp file fd)
> > 
> > It should be much faster.
> 
> I'll add a deferred-fsync mode to test this.
> 
> > In reiserfs data=journal mode, you get strict ordering of all the
> > transactions.
> 
> What about in data=ordered mode?
> 
It won't work in the face of io errors.

> > This means you can safely do this:
> > write(temp file)
> > rename(temp file, somedir/new file)
> > fsync(temp file fd)
> 
> How is that different from the above?
> 
There's no fsync after the first write.  Just to be explicit:

data=writeback|ordered			data=journal
write(temp file)			write(temp file)
fsync(temp file fd)
rename(tempfile, somedir/newfile)	rename(tempfile, somedir/newfile)
fsync(temp file fd)			fsync(temp file fd)

-chris


