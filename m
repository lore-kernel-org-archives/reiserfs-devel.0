From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Tue, 11 Jul 2006 22:42:24 -0700
Message-ID: <44B48BC0.2000608@namesys.com>
References: <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com>	 <1152059846.30139.11.camel@ipso.snappymail.ca>	 <44AB25EE.8030702@namesys.com>	 <20060706125856.fdac1d16.pegasus@nerv.eu.org>	 <1152200638.30139.45.camel@ipso.snappymail.ca> <44AD5020.6050803@suse.com>	 <1152210439.30139.59.camel@ipso.snappymail.ca> <44AD58D1.9040806@suse.com>	 <1152257397.13211.43.camel@ipso.snappymail.ca>	 <20060707174935.GB13606@atrey.karlin.mff.cuni.cz> <1152306272.13211.62.camel@ipso.snappymail.ca> <44AED01C.60601@namesys.com> <44AFFD50.8070905@suse.com> <44B44856.5070409@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28966-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44B44856.5070409@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeffrey Mahoney <jeffm@suse.com>
Cc: Mike Benoit <ipso@snappymail.ca>, Jan Kara <jack@suse.cz>, =?UTF-8?B?SnVyZSBQZcSNYXI=?= <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

You make this way too complicated because you are trying to be way too
perfect.  If you scan 3 bitmap blocks and find nothing, stop trying to
size match.

Hans

Jeffrey Mahoney wrote:

> Jeff Mahoney wrote:
>
> >Hans Reiser wrote:
>
> >>>Guys, if you run the kernel under a debugger, and get it to where you
> >>>see the excessive CPU usage, and then start stepping through the bitmap
> >>>code, I am sure it will be very obvious what the error is.  Can anyone
> >>>do that for us?  Jeff?
>
> >Apologies to everyone CC'd who've already seen this message. It was
> >bounced from the namesys servers and I wanted to preserve the CC list.
>
> >***
>
> >Mike sent me a copy of the metadata and I am now able to reproduce
> >locally. My profiling looks like this:
>
> >samples  %      image name      app name        symbol name
> >148596  17.8573 reiserfs.ko     reiserfs        reiserfs_in_journal
> >58194   6.9934  reiserfs.ko     reiserfs        search_by_key
> >38937   4.6792  vmlinux         vmlinux         memmove
> >38783   4.6607  reiserfs.ko     reiserfs        scan_bitmap_block
> >38466   4.6226  jbd             jbd             (no symbols)
> >23249   2.7939  vmlinux         vmlinux         __find_get_block
> >18196   2.1867  vmlinux         vmlinux         tty_write
> >17734   2.1312  vmlinux         vmlinux         do_ioctl
> >17293   2.0782  loop            loop            (no symbols)
> >15400   1.8507  vmlinux         vmlinux         cond_resched_lock
> >14836   1.7829  vmlinux         vmlinux         copy_user_generic_c
> >14143   1.6996  reiserfs.ko     reiserfs        do_journal_end
> >13638   1.6389  vmlinux         vmlinux         find_next_zero_bit
> >13236   1.5906  vmlinux         vmlinux         default_llseek
> >12925   1.5532  vmlinux         vmlinux         bit_waitqueue
> >8921    1.0721  vmlinux         vmlinux         __delay
>
>
> >Hans -
>
> >My speculation about the bitmaps being fragmented was right on. I wrote
> >a quick little script to parse the output of debugreiserfs -m and report
> >on the frequency of different window sizes. Windows of 1-31 blocks are
> >extremely common, accounting for 99.8% of all free windows. The problem
> >is that in my testing, where I made the allocator report the size of
> >allocation requests, the most common request was for a window of 32
> blocks.
>
> >What's happening is that we keep finding windows that are too small,
> >which results in a lot of wasted effort. The cycle goes like this:
>
> >if (unfm && is_block_in_journal(s, bmap_n, *beg, beg))
> >        continue;
> >/* first zero bit found; we check next bits */
> >for (end = *beg + 1;; end++) {
> >        if (end >= *beg + max || end >= boundary
> >            || reiserfs_test_le_bit(end, bi->bh->b_data)) {
> >                next = end;
> >                break;
> >        }
> >        /* finding the other end of zero bit window requires
> >         * looking into journal structures (in
> >         * case of searching for free blocks for unformatted nodes) */
> >        if (unfm && is_block_in_journal(s, bmap_n, end, &next))
> >                break;
> >}
>
> >If the window is too small, we end up looping up to the top and try to
> >find another one. Since the overwhelming majority of the windows are too
> >small, we go through just about all the bitmaps without backing off the
> >window size.
>
>
> To be clear, eventually the allocations are honored, but only after
> *all* of the bitmaps are searched. On the third pass, we drop the window
> to a single block and restart the scan, eventually building a 32-block
> set that is probably quite fragmented. This occurs on every write, hence
> the huge performance hit.
>
> It appears as though ext3 doesn't have this problem because they don't
> batch writes the way reiserfs does. They'll start a search at a decent
> hint the same way we do, but the window is always one block.
>
> So, we're stuck between a rock and a hard place. We can have the better
> allocation performance at lower usage and sacrifice performance later or
> we can have stable allocation performance at an overall reduction in
> performance.
>
> I have an idea that may get around both problems, but I'm not sure how
> well it would be received. We currently do some very basic caching of
> bitmap metadata such as the first zero bit and how many free blocks
> there are. What if we constructed an extent map of the free windows in
> each bitmaps when we cache the metadata and adjust the map when we
>
> There's a third option, but I'm not sure how well it would be received
>
> Right now, the allocator keeps track of things like how full a bitmap is
> and where the first zero bit is. It would also be possible to cache a
> list of windows in each bitmap to accelerate performance. This would
> have to be a shrinkable cache, since the pathlogical case could mean
> occupying
>
> -Jeff
>
> --
> Jeff Mahoney
> SUSE Labs

