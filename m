From: Oleg Drokin <green@namesys.com>
Subject: Re: anyone port data-logging patches to -rc3?
Date: Fri, 23 May 2003 16:54:11 +0400
Message-ID: <20030523125411.GA7274@namesys.com>
References: <20030523003033.GC6586@zero> <20030523094633.GA1005@namesys.com> <1053692899.5455.44.camel@tiny.suse.com> <20030523123601.GB7109@namesys.com> <1053693891.5455.51.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14224-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1053693891.5455.51.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Tom Vier <tmv@comcast.net>, reiserfs-list@namesys.com

Hello!

On Fri, May 23, 2003 at 08:44:51AM -0400, Chris Mason wrote:
> > > > Also probably we do not want to allow remounting with different data-logging mode,
> > > > may be we should even add a check in reiserfs_remount() and spit out an error in such a case?
> > > Jeff Mahoney managed to trigger a race by switching between data=journal
> > > and the other modes.  All we really need to do is be able to switch data
> > > mode when remounting from readonly to rw (as in for the root FS), so
> > > I'll limit the remounting code to that.
> > Any chance you would also rework journaling code a bit, so that it does not occupy
> > ram for various tables/lists when the fs is in R/O mode?
> I think I would rather do that in 2.5.x first, perhaps along with some
> changes to more dynamic tables/lists for the journal memory structures. 
> The data logging code started that process, but I'd like to keep the
> 2.4.x data logging changes smallish right now so we can get it all
> submitted.

This is ok with me.

> Aside from that raid remount bug, do you see major problems with keeping
> the memory around in readonly mode?

Not major, but it allocates
(bmap_nr * sizeof(struct reiserfs_bitmap_node *) + SB_ONDISK_JOURNAL_SIZE(p_s_sb) * 2 * sizeof(struct reiserfs_journal_cnode)) bytes
of ram that is never used.
This is kind of pity, esp. on small-ram boxes.

Bye,
    Oleg
