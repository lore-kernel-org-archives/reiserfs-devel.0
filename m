From: Konstantin Sobolev <kos@supportwizard.com>
Subject: Re: fsck.reiser4 segfaults
Date: Thu, 15 Jul 2004 23:22:22 +0400
Message-ID: <200407152322.22803.kos@supportwizard.com>
References: <200407151559.41256.kos@supportwizard.com> <200407152245.57083.kos@supportwizard.com> <200407152309.10968.vitaly@namesys.com>
Reply-To: kos@supportwizard.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19643-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407152309.10968.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Vitaly Fertman <vitaly@namesys.com>

On Thursday 15 July 2004 23:09, Vitaly Fertman wrote:
> On Thursday 15 July 2004 22:45, Konstantin Sobolev wrote:
> > On Thursday 15 July 2004 16:21, Vitaly Fertman wrote:
> > > would you try the latest reiser4progs from
> > > www.namesys.com/snapshots/2004.07.13-internal.testing/
> >
> > It worked OK but now I can't mount it :(
>
> ahh, last internal releases of reiser4progs -- 0.5.5 you tried
> before and the current 0.5.6 -- should be used with the last
> autosnapshots only:
> 	http://www.namesys.com/auto-snapshots/
> earlier reiser4 versions do not support plugin sets. After fscking
> the root directory got such a pset and as a result the fs cannot be
> mounted with an old reiser4 code anymore.

Yeah. Luckily I've found LiveCD with 2.6.7 sources patched with one of 
autosnapshots that successfully mounted my /usr, so now I'll be able to build 
new kernel. Can you recommend some more or less stable autosnapshot that I 
can use?

Thanks for your help :)
-- 
/KoS
* recursion n.: See Recursion
		-- The Jargon File
