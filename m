From: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Subject: Re: ReiserFS problems
Date: Thu, 7 Aug 2003 15:41:08 +0200
Message-ID: <20030807154107.B7165@bitwizard.nl>
References: <20030806182055.A28562@bitwizard.nl> <20030806164852.GA14719@namesys.com> <20030806191806.A31496@bitwizard.nl> <3F324E06.2080805@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15230-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F324E06.2080805@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

On Thu, Aug 07, 2003 at 05:03:02PM +0400, Hans Reiser wrote:
> Rogier Wolff wrote:
> 
> >>In fact this is not exactly true, it only switches to other "block
> >>group" if you are creating new file. Why do you think this is a
> >>problem?  (of course I am speaking of 2.4.20+ kernels).
> >>   
> >>
> >
> >Well we were recovering data into 1G files, but performance of adding
> >a new block was horrible. It was doing this for every block. Either it
> >was doing a fruitless search on every block-add or it was actually
> >adding the block to another block group. Anyway, performance dropped
> >-=*A LOT*=- when this happened.
> >
> >I think you're describing the way it should be, or "is now", but there
> >was a bug that caused it to behave differently.

> Can you help Oleg investigate this more closely by providing an exact 
> account of what to do to replicate it?  Oleg, replicate this and observe 
> what happens.

What part of: "we reported it a while back, and you told us it was
fixed" don't you understand?

			Roger. 

-- 
+-- Rogier Wolff -- www.harddisk-recovery.nl -- 0800 220 20 20 --
| Files foetsie, bestanden kwijt, alle data weg?!
| Blijf kalm en neem contact op met Harddisk-recovery.nl!
