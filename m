From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: New reiser4 snapshot (2003.09.12) is out
Date: Sun, 14 Sep 2003 14:30:25 +0400
Message-ID: <200309141430.25120.vitaly@namesys.com>
References: <20030913063124.GJ2123@backtop.namesys.com> <200309140004.57447.vitaly@namesys.com> <20030914045103.GK2123@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15667-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030914045103.GK2123@backtop.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, Hans Reiser <reiser@namesys.com>, "Robert P. J. Day" <rpjday@mindspring.com>, Mike Benoit <mikeb@netnation.com>, reiserfs-list@namesys.com

On Sunday 14 September 2003 08:51, Alex Zarochentsev wrote:
> On Sun, Sep 14, 2003 at 12:04:57AM +0400, Vitaly Fertman wrote:
> > Hi,
> >
> > I hope this patch for configure.in will solve the problem.
> > Try it please and tell us about your results.
>
> What about making --disable-werror working?

it depends on if progs can be compiled without it.

> Or, which is better, I think, remove -Werror from CFLAGS ?

yes, I think it needs to be done.

> It is second time when small warning breaks reiser4progs compilation.

there was another problem actually, readline lib detection had a bug, 
the patch fixes it.

-- 
Thanks,
Vitaly Fertman
