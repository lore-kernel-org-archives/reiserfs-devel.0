From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser4 disk formats (was http://www.namesys.com/snapshots/2004.08.09-internal.testing/)
Date: Mon, 16 Aug 2004 13:18:37 +0400
Message-ID: <200408161318.37810.vitaly@namesys.com>
References: <20040813171827.GA15303@raptus.homelinux.net> <20040815225501.GA8679@raptus.homelinux.net> <200408160113.38791.frbiscani@jumpy.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20320-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408160113.38791.frbiscani@jumpy.it>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Francesco Biscani <frbiscani@jumpy.it>, reiserfs-list@namesys.com
Cc: Domenico Andreoli <cavok@tiscali.it>

On Monday 16 August 2004 03:13, Francesco Biscani wrote:
> Hi,
>
> On Monday 16 August 2004 00:55, Domenico Andreoli wrote:
> > so the most safe catch-all command sequence should be simply
> >
> >   1. fsck.reiser4 device
> >      - do also whatever fsck says is required to bring the fs
> >        consistent. most probably it will say to use --build-sb and
> >        then --fix.
> >   2. debugfs.reiser4 -C device
> >   3. fsck.reiser4 device
> >      - do again whatever fsck says, most probably --fix is required.
> >
> > this should bring the fs from whatever disk format it is in to the
> > latest one and this *should* happen without data loss. am i right?
>
> I may be wrong here, but as far as I remember reiser4progs 1.x give errors
> if used on old disk formats. If you try to --fix these errors _before_
> changing format you may lose data. So the best sequence would be:

right. If you want the convertion to be done without data loss you should not 
run fsck.reiser4-1.0.0 --fix/--build-fs on NOT converted partition.

> 1. fsck.reiser4 --fix device
>      (with reiser4progs < 1.x)
> 2. upgrade to reiser4progs 1.x
> 3. debugfs.reiser4 -C device
> 4. fsck.reiser4 --fix device
>
> This way you fix all real errors (possibly) present _before_ converting the
> layout, and you avoid the (false) errors reported by reiser4progs 1.x on
> old disk layouts. Can someone confirm?

1. ensure the fs is consistent with the current reiser4progs.
Actually only severe corruptions of the reiser4 storage tree are important here,
others will be fixed later in (5).
2. update reiser4progs to 1.0.0
3. fsck.reiser4 --build-sb <device>
Needed if you move from < 0.5.5. Fixes the formatting policy id in the super 
block. Needed to be run before (4) to allow fs to be openned. 
This may tell you to run fsck with some other options (--fix/--build-fs) due 
to the format change, do not run it -- do (4) instead.
4. debugfs.reiser4 -C <device>
5. fsck.reiser4 --fix <device>
Needed if you move from < 0.5.5. Adds missed pset to the root directory.
In any case check the result is a good idea.

-- 
Thanks,
Vitaly Fertman

