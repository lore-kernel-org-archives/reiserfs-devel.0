From: Chris Mason <mason@suse.com>
Subject: Re: v3 experimental data=ordered and logging speedups for 2.6.1
Date: Thu, 12 Feb 2004 09:18:13 -0500
Message-ID: <1076595493.4296.41.camel@watt.suse.com>
References: <1074530725.29546.178.camel@tiny.suse.com>
	 <20040211114912.GC3042@linuxhacker.ru>
	 <1076508034.15498.5.camel@watt.suse.com>
	 <20040211142651.GD3042@linuxhacker.ru>
	 <1076511571.15499.32.camel@watt.suse.com>
	 <20040211150943.GE3042@linuxhacker.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16777-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040211150943.GE3042@linuxhacker.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@linuxhacker.ru>
Cc: reiserfs-list@namesys.com

On Wed, 2004-02-11 at 10:09, Oleg Drokin wrote:
> Hello!
> 
> On Wed, Feb 11, 2004 at 09:59:31AM -0500, Chris Mason wrote:
> > > > thousands (hundreds of thousands) of times per day.  It wasn't an easy
> > > > bug to hit.
> > > What are the symptoms?
> > The rpm database is corrupted, rpm --rebuild-db is required.
> 
> Hm, that's really strange. But on ia64 default io size is 64k, do they have
> same problems there?

No, ia64 works fine.  It really is strange.

> 
> > > > other tricky parts when the data=journal code is added.  We've already
> > > > made our own file_write call, it doesn't make sense to warp it just to
> > > > avoid our own __block_commit_write ;-)
> > > Well, code duplication is not very good thing.
> > It depends on how much you have to twist things to use the generic
> > code.  If we used __block_commit_write, buffers would be marked dirty
> > when it completes.  This won't work for data=journal at all, we don't
> > want them marked dirty.
> 
> Well, if you do not want them marked dirty, you just do not need to call
> commit_write at all since the only thing it does is marking buffers dirty ;)
> And you can have a list of buffers at the allocation time anyway,
> so no need to do extra checks about partial page writes and so on since
> all these checks were already done.

Interesting.  I'll look harder at that.

-chris


