From: "Maciejewski, Jake" <maciejej@msoe.edu>
Subject: Re: Fwd: Error in fs/reiser4/page_cache.c : PG_active not declared
Date: Sun, 25 Jul 2004 01:32:02 -0500
Message-ID: <1090737122.12341.22.camel@localhost>
References: <158e298904072418267b1c40d7@mail.gmail.com>
	 <158e29890407242016c70b3f2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19793-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <158e29890407242016c70b3f2@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs-List@namesys.com

This sounds more like a love-sources problem than a reiser4 problem.
Post something at http://forums.gentoo.org/viewtopic.php?t=201053 or if
you still want help here, try to reproduce the problem with the latest
auto-snapshot patched on the -mm version it was diffed against, ideally
with no other patches.

I looked at fs/reiser4/page_cache.c and you should be able to avoid the
problematic code by disabling resier4 debug output, although I'm not
sure how or why it would be enabled.

On Sat, 2004-07-24 at 22:16, Ashay Humane wrote:
> Hi,
> I got the vanilla 2.6.7 kernel .. patched it to 2.6.8-rc2 then patched
> it to 2.6.8-rc2-love2.
> 
> After the love patch, I get an error when compiling the kernel:
> 
> Undeclared variable PG_active in fs/reiser4/page_cache.c  Line 891
> 
> There are variables named PG_active_mapped and PG_active_unmapped in other .c
> and .h files. But no PG_active .
> 
> Dosent look too bad .. but what should be done ?
> 
> Thanks
> Ashay
> 
> --
> <HAND>
-- 
Jake Maciejewski <maciejej@msoe.edu>
