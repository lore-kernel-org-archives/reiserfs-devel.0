From: Oleg Drokin <green@namesys.com>
Subject: Re: anyone port data-logging patches to -rc3?
Date: Fri, 23 May 2003 16:36:01 +0400
Message-ID: <20030523123601.GB7109@namesys.com>
References: <20030523003033.GC6586@zero> <20030523094633.GA1005@namesys.com> <1053692899.5455.44.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14222-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1053692899.5455.44.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Tom Vier <tmv@comcast.net>, reiserfs-list@namesys.com

Hello!

On Fri, May 23, 2003 at 08:28:19AM -0400, Chris Mason wrote:

> > And BTW, I think this "do O_DIRECT stuff on ordered/datalogging fs, receive error from write(2)" is counter-intuitive.
> > what do you think about just only setting reiserfs_address_space_operations->direct_IO to non-NULL
> > in case of writeback mount?
> They'd get the same error, just sooner.  I'm more inclined to fix things

Yes, they'd get it at open() time which is much better, I think.

> so that data=ordered works with O_DIRECT, lets see what I can come up
> with.

Still there is no chance for that to work in data=journal mode.

> > Also probably we do not want to allow remounting with different data-logging mode,
> > may be we should even add a check in reiserfs_remount() and spit out an error in such a case?
> Jeff Mahoney managed to trigger a race by switching between data=journal
> and the other modes.  All we really need to do is be able to switch data
> mode when remounting from readonly to rw (as in for the root FS), so
> I'll limit the remounting code to that.

Any chance you would also rework journaling code a bit, so that it does not occupy
ram for various tables/lists when the fs is in R/O mode?

Bye,
    Oleg
