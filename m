From: Francesco Biscani <frbiscani@jumpy.it>
Subject: Re: reiser4 disk formats (was http://www.namesys.com/snapshots/2004.08.09-internal.testing/)
Date: Mon, 16 Aug 2004 01:13:38 +0200
Message-ID: <200408160113.38791.frbiscani@jumpy.it>
References: <20040813171827.GA15303@raptus.homelinux.net> <200408151524.34396.vitaly@namesys.com> <20040815225501.GA8679@raptus.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20310-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040815225501.GA8679@raptus.homelinux.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Domenico Andreoli <cavok@tiscali.it>

Hi,

On Monday 16 August 2004 00:55, Domenico Andreoli wrote:
> so the most safe catch-all command sequence should be simply
>
>   1. fsck.reiser4 device
>      - do also whatever fsck says is required to bring the fs
>        consistent. most probably it will say to use --build-sb and
>        then --fix.
>   2. debugfs.reiser4 -C device
>   3. fsck.reiser4 device
>      - do again whatever fsck says, most probably --fix is required.
>
> this should bring the fs from whatever disk format it is in to the
> latest one and this *should* happen without data loss. am i right?

I may be wrong here, but as far as I remember reiser4progs 1.x give errors if 
used on old disk formats. If you try to --fix these errors _before_ changing 
format you may lose data. So the best sequence would be:

1. fsck.reiser4 --fix device 
     (with reiser4progs < 1.x)
2. upgrade to reiser4progs 1.x
3. debugfs.reiser4 -C device
4. fsck.reiser4 --fix device

This way you fix all real errors (possibly) present _before_ converting the 
layout, and you avoid the (false) errors reported by reiser4progs 1.x on old 
disk layouts. Can someone confirm?

Regards,

  Francesco
