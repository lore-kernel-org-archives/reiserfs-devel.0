From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Bug#263348: linux-kernel-headers: asm/unaligned.h on powerpc is useless if __KERNEL__ is undefined
Date: Tue, 10 Aug 2004 15:39:10 +0400
Message-ID: <200408101539.10117.vitaly@namesys.com>
References: <20040806220432.GA2291@raptus.homelinux.net> <81r7qg6g3u.wl@omega.webmasters.gr.jp> <20040809175027.GB2072@raptus.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20120-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040809175027.GB2072@raptus.homelinux.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Domenico Andreoli <cavok@debian.org>, GOTO Masanori <gotom@debian.or.jp>
Cc: 263348@bugs.debian.org, reiserfs-list@namesys.com

On Monday 09 August 2004 21:50, Domenico Andreoli wrote:
> On Mon, Aug 09, 2004 at 02:21:57PM +0900, GOTO Masanori wrote:
> > At Sat, 7 Aug 2004 00:50:06 +0200,
> >
> > Domenico Andreoli wrote:
> > > i have attached a workaround for bug #263348 in case nobody wants to
> > > fix it linux-kernel-headers.
> > >
> > > it should work although being not that elegant. i know it is fragile
> > > since relies on _PPC_ERRNO_H macro being defined by asm/errno.h on
> > > powerpc and that could change in any moment.

#if defined(__ppc__) || defined(ppc) || defined(__ppc) || \
  defined(__PPC) || defined(powerpc) || defined(__powerpc__)

?

> the header file used is actually asm/byteroder.h and macro is
> _PPC_BYTEORDER_H. 1:3.6.18-2 used asm/error.h but this broke things in
> a manner i didn't understand.
>
> > Looking through the kernel source, it seems lkh should be fixed.  I
> > put the patch to lkh cvs.
>
> good :)
>
> > However, now we're base-freeze period, and at least I don't decide to
> > put new lkh package -18 into unstable and testing-proposed-updates
> > yet, so it's good idea to put workaround fix for reiserfsprogs.
>
> already put, uploaded and successfully built :)
>
> > BTW, I think reiserfsprogs is tightly coupled with the kernel version,
> > so I wonder it's OK to use lkh package, instead of using kernel
> > headers which are included from the latest kernel source to
> > reiserfsprogs.
>
> don't know, Hans Reiser should be able to answer this question.

kernel has all its includes in the kernel source tree and does not 
use standard ones, reiserfsprogs do not take anything from
any kernel source tree and use their own or standard includes.
asm/unaligned.h is included from glibc-devel on my computer.
Could you check the above macros whether it works for you? 

-- 
Thanks,
Vitaly Fertman

