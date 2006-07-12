From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Wed, 12 Jul 2006 01:18:25 -0700
Message-ID: <44B4B051.90809@namesys.com>
References: <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com>	 <1152059846.30139.11.camel@ipso.snappymail.ca>	 <44AB25EE.8030702@namesys.com>	 <20060706125856.fdac1d16.pegasus@nerv.eu.org>	 <1152200638.30139.45.camel@ipso.snappymail.ca> <44AD5020.6050803@suse.com>	 <1152210439.30139.59.camel@ipso.snappymail.ca> <44AD58D1.9040806@suse.com>	 <1152257397.13211.43.camel@ipso.snappymail.ca>	 <20060707174935.GB13606@atrey.karlin.mff.cuni.cz> <1152306272.13211.62.camel@ipso.snappymail.ca> <44AED01C.60601@namesys.com> <44AFFD50.8070905@suse.com> <44B44856.5070409@suse.com> <44B48BC0.2000608@namesys.com> <44B48E32.5080307@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28971-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44B48E32.5080307@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeffrey Mahoney <jeffm@suse.com>
Cc: Mike Benoit <ipso@snappymail.ca>, Jan Kara <jack@suse.cz>, =?UTF-8?B?SnVyZSBQZcSNYXI=?= <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

Jeffrey Mahoney wrote:

> Hans Reiser wrote:
>
> >You make this way too complicated because you are trying to be way too
> >perfect.  If you scan 3 bitmap blocks and find nothing, stop trying to
> >size match.
>
>
> Agreed on the trying too hard..

What about the actual algorithm suggested?

> I think we can find a better, less
> "perfect" solution. I wrote that email on Friday on my notebook and it
> couldn't connect. It managed to do so this evening. I spent the weekend
> experimenting with the idea, and while I came up with something that
> worked, it wasn't really usable. The memory footprint was much too large
> to be worthwhile. For some fragmentation patterns, it would work. The
> worst case scenario was totally intolerable.
>
> -Jeff
>
> --
> Jeff Mahoney
> SUSE Labs
>
