From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: http://www.namesys.com/snapshots/2004.08.09-internal.testing/
Date: Tue, 10 Aug 2004 01:21:40 +0400
Message-ID: <200408100121.40721.vitaly@namesys.com>
References: <200408092355.13380.vitaly@namesys.com> <e796392204080913384ac39553@mail.gmail.com> <e796392204080914014bf72d1f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20111-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e796392204080914014bf72d1f@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stefan Schweizer <sschweizer@gmail.com>, reiserfs-list@namesys.com

On Tuesday 10 August 2004 01:01, Stefan Schweizer wrote:
> On grub compile:
>
> In file included from /usr/include/aal/libaal.h:17,
>                 from /usr/include/reiser4/libreiser4.h:13,
>                 from fsys_reiser4.c:27:
> /usr/include/aal/types.h:62: error: conflicting types for `va_list'
> /usr/lib/gcc-lib/i686-pc-linux-gnu/3.3.4/include/stdarg.h:105: error:
> previous declaration of `va_list'

the test patch is sent.

> When I try debugfs.reiser4:
>
>  # debugfs.reiser4 -C /dev/hda1 -f
> debugfs.reiser4 1.0.0
> Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by
> reiser4progs/COPYING.
>
> Segmentation fault
>  #

hm, this segfault seems to happen on the initialization stage, before 
any convertion is started. looks more like some problem with building
the package itself. 
Do you have the core file? Would you send me the trace?

-- 
Thanks,
Vitaly Fertman

