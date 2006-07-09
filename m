From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Sat, 08 Jul 2006 17:01:59 -0700
Message-ID: <44B04777.5010701@namesys.com>
References: <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com>	 <1152059846.30139.11.camel@ipso.snappymail.ca>	 <44AB25EE.8030702@namesys.com>	 <20060706125856.fdac1d16.pegasus@nerv.eu.org>	 <1152200638.30139.45.camel@ipso.snappymail.ca> <44AD5020.6050803@suse.com>	 <1152210439.30139.59.camel@ipso.snappymail.ca> <44AD58D1.9040806@suse.com>	 <1152257397.13211.43.camel@ipso.snappymail.ca>	 <20060707174935.GB13606@atrey.karlin.mff.cuni.cz> <1152306272.13211.62.camel@ipso.snappymail.ca> <44AED01C.60601@namesys.com> <44AFFD50.8070905@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28945-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44AFFD50.8070905@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Mike Benoit <ipso@snappymail.ca>, Jan Kara <jack@suse.cz>, =?UTF-8?B?SnVyZSBQZcSNYXI=?= <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

So limit the number of iterations of rejecting windows that are too
small.  Say, 8.

Hans

Jeff Mahoney wrote:

>
> What's happening is that we keep finding windows that are too small,
> which results in a lot of wasted effort. The cycle goes like this:
>
> if (unfm && is_block_in_journal(s, bmap_n, *beg, beg))
>         continue;
> /* first zero bit found; we check next bits */
> for (end = *beg + 1;; end++) {
>         if (end >= *beg + max || end >= boundary
>             || reiserfs_test_le_bit(end, bi->bh->b_data)) {
>                 next = end;
>                 break;
>         }
>         /* finding the other end of zero bit window requires
>          * looking into journal structures (in
>          * case of searching for free blocks for unformatted nodes) */
>         if (unfm && is_block_in_journal(s, bmap_n, end, &next))
>                 break;
> }
>
> If the window is too small, we end up looping up to the top and try to
> find another one. Since the overwhelming majority of the windows are too
> small, we go through just about all the bitmaps without backing off the
> window size.
>
> -Jeff
>
> --
> Jeff Mahoney
> SUSE Labs

