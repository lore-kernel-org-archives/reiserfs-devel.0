From: Chris Mason <mason@suse.com>
Subject: Re: v3 experimental data=ordered and logging speedups for 2.6.1
Date: Wed, 11 Feb 2004 09:59:31 -0500
Message-ID: <1076511571.15499.32.camel@watt.suse.com>
References: <1074530725.29546.178.camel@tiny.suse.com>
	 <20040211114912.GC3042@linuxhacker.ru>
	 <1076508034.15498.5.camel@watt.suse.com>
	 <20040211142651.GD3042@linuxhacker.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16756-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040211142651.GD3042@linuxhacker.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@linuxhacker.ru>
Cc: reiserfs-list@namesys.com

On Wed, 2004-02-11 at 09:26, Oleg Drokin wrote:
> Hello!
> 
> On Wed, Feb 11, 2004 at 09:00:34AM -0500, Chris Mason wrote:
> 
> > > Anyway there should be absolutely zero problems with bdb, I looked in their code
> > > and they have sanity checks that do not allow write size to be bigger than
> > > some values that they think are safe (16K I think).
> > Well, it was easiest to trigger with older rpm versions, but you'll get
> > hit by eventually.  Keep in mind the suse autobuild system runs rpm
> > thousands (hundreds of thousands) of times per day.  It wasn't an easy
> > bug to hit.
> 
> What are the symptoms?

The rpm database is corrupted, rpm --rebuild-db is required.

> 
> > > > 06-reiserfs-jh-2
> > > > Adds data=ordered support, along with a journal header attached to
> > > > the buffer head.  This allows for more efficient data=ordered support
> > > > than I had in 2.4.x.
> > > I have some comments on this one, too.
> > > Replicating __block_commit_write just to make sure you add buffer to ordered
> > > list seems to be overkill. You can easily put buffers to some temp list at
> > > buffer allocation time and then just add entire temp list to ordered
> > > buffers list, I think. 
> > If you use the generic __block_commit_write, you've got to update i_size
> > first to make sure the generic code doesn't do it.  There are a few
> 
> No.
> The auto i_size update happens only if you use generic_commit_write(),
> but I used block_commit_write() which does not do this.
> 
Hmmm, I need more coffee ;-)

> > other tricky parts when the data=journal code is added.  We've already
> > made our own file_write call, it doesn't make sense to warp it just to
> > avoid our own __block_commit_write ;-)
> 
> Well, code duplication is not very good thing.

It depends on how much you have to twist things to use the generic
code.  If we used __block_commit_write, buffers would be marked dirty
when it completes.  This won't work for data=journal at all, we don't
want them marked dirty.

> > > Also this will make handling of mmap write in the middle
> > > of write a little bit more correct, I think. BTW, I do not see where do you
> > > specially handle mmap writes so that they are written in correct order wrt
> > > inode updates.
> > Those changes are still only in my local tree.  I wanted to get the
> > basic functionality out there for testing.
> 
> Well, I need the quota part too, before I can put that on my university's file
> server to get more testing ;)))

getting there ;)

-chris


