From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Bug#263348: linux-kernel-headers: asm/unaligned.h on powerpc is useless if __KERNEL__ is undefined
Date: Wed, 18 Aug 2004 13:25:00 +0400
Message-ID: <200408181325.00561.vitaly@namesys.com>
References: <20040806220432.GA2291@raptus.homelinux.net> <200408101539.10117.vitaly@namesys.com> <81acwsj4ms.wl@omega.webmasters.gr.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20371-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <81acwsj4ms.wl@omega.webmasters.gr.jp>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: GOTO Masanori <gotom@debian.or.jp>, 263348@bugs.debian.org
Cc: Domenico Andreoli <cavok@debian.org>, reiserfs-list@namesys.com

On Wednesday 18 August 2004 11:18, GOTO Masanori wrote:
> Hi,
>
> At Tue, 10 Aug 2004 15:39:10 +0400,
>
> Vitaly Fertman wrote:
> > > the header file used is actually asm/byteroder.h and macro is
> > > _PPC_BYTEORDER_H. 1:3.6.18-2 used asm/error.h but this broke things in
> > > a manner i didn't understand.
> > >
> > > > Looking through the kernel source, it seems lkh should be fixed.  I
> > > > put the patch to lkh cvs.
> > >
> > > good :)
> > >
> > > > However, now we're base-freeze period, and at least I don't decide to
> > > > put new lkh package -18 into unstable and testing-proposed-updates
> > > > yet, so it's good idea to put workaround fix for reiserfsprogs.
> > >
> > > already put, uploaded and successfully built :)
> > >
> > > > BTW, I think reiserfsprogs is tightly coupled with the kernel
> > > > version, so I wonder it's OK to use lkh package, instead of using
> > > > kernel headers which are included from the latest kernel source to
> > > > reiserfsprogs.
> > >
> > > don't know, Hans Reiser should be able to answer this question.
> >
> > kernel has all its includes in the kernel source tree and does not
> > use standard ones, reiserfsprogs do not take anything from
> > any kernel source tree and use their own or standard includes.
> > asm/unaligned.h is included from glibc-devel on my computer.
>
> I guess "glibc-devel" in Fedora Core is RedHat .rpm package, and I
> confirmed that it does not have any header files.  If reiserfsprogs
> uses asm/unaligned.h in FC, then it's included in "glibc-kernheaders"
> package and this file is actually derived from linux kernel.  In
> Debian, we use "linux-kernel-headers" package that role is equivalent
> to FC's glibc-kernheaders package.
>
> I sent the patch to ppc guys to fix this problem.  If they apply my
> patch, the problem should be gone away.
>
> However, I think the question is still remained: should reiserfsprogs
> include some kernel version headers for each reiserfs modification
> versions, instead of using system headers directly?

what headers are you talking about? if about reiserfs headers, progs do 
not include reiserfs kernel headers, they have their own.

-- 
Thanks,
Vitaly Fertman

