From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 segfaults
Date: Thu, 15 Jul 2004 23:09:10 +0400
Message-ID: <200407152309.10968.vitaly@namesys.com>
References: <200407151559.41256.kos@supportwizard.com> <200407151621.44263.vitaly@namesys.com> <200407152245.57083.kos@supportwizard.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19641-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407152245.57083.kos@supportwizard.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kos@supportwizard.com, reiserfs-list@namesys.com

On Thursday 15 July 2004 22:45, Konstantin Sobolev wrote:
> On Thursday 15 July 2004 16:21, Vitaly Fertman wrote:
> > would you try the latest reiser4progs from
> > www.namesys.com/snapshots/2004.07.13-internal.testing/
>
> It worked OK but now I can't mount it :(

ahh, last internal releases of reiser4progs -- 0.5.5 you tried 
before and the current 0.5.6 -- should be used with the last 
autosnapshots only:
	http://www.namesys.com/auto-snapshots/
earlier reiser4 versions do not support plugin sets. After fscking
the root directory got such a pset and as a result the fs cannot be 
mounted with an old reiser4 code anymore.

> Unable to handle kernel NULL pointer dereference at virtual address
> 00000008 followed by registers dump and call trace
>
> I guess my laptop is dead until new LiveCD with fresh reiser4 snapshot that
> will be able to mount it..

-- 
Thanks,
Vitaly Fertman

