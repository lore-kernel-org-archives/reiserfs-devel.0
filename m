From: Oleg Drokin <green@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Fri, 23 Aug 2002 14:56:24 +0400
Message-ID: <20020823145624.A871@namesys.com>
References: <m3k7mpreij.fsf@merlin.emma.line.org> <3D63BD2D.1070602@web.de> <3D63CA89.3050002@namesys.com> <200208221500.24544.vitaly@namesys.com> <1030020938.7820.4.camel@tiny> <20020822170058.A6550@namesys.com> <3D651475.5030900@namesys.com> <20020823085636.A1029@namesys.com> <3D661413.5080409@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11306-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D661413.5080409@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Mason <mason@suse.com>, Vitaly Fertman <vitaly@namesys.com>, degerrit@web.de, reiserfs-list@namesys.com

Hello!

On Fri, Aug 23, 2002 at 02:53:07PM +0400, Hans Reiser wrote:

> >>What is the fixit plan?
> >You demanded that no badblocks info should be stored in the tree, so we 
> >will
> >drop that bit of code completely, it seems.
> Since the code already exists, maybe you should just change the reserved 
> key for it.

That was my original plan. We still can get back to it, if you want.

Bye,
    Oleg
