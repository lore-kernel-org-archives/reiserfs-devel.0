From: Domenico Andreoli <cavok@debian.org>
Subject: Re: Bug#263348: linux-kernel-headers: asm/unaligned.h on powerpc is useless if __KERNEL__ is undefined
Date: Mon, 9 Aug 2004 19:50:27 +0200
Message-ID: <20040809175027.GB2072@raptus.homelinux.net>
References: <20040806220432.GA2291@raptus.homelinux.net> <20040806225006.GA2688@raptus.homelinux.net> <81r7qg6g3u.wl@omega.webmasters.gr.jp>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20095-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <81r7qg6g3u.wl@omega.webmasters.gr.jp>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: GOTO Masanori <gotom@debian.or.jp>
Cc: 263348@bugs.debian.org, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On Mon, Aug 09, 2004 at 02:21:57PM +0900, GOTO Masanori wrote:
> At Sat, 7 Aug 2004 00:50:06 +0200,
> Domenico Andreoli wrote:
> > i have attached a workaround for bug #263348 in case nobody wants to
> > fix it linux-kernel-headers.
> > 
> > it should work although being not that elegant. i know it is fragile
> > since relies on _PPC_ERRNO_H macro being defined by asm/errno.h on
> > powerpc and that could change in any moment.
> > 

the header file used is actually asm/byteroder.h and macro is
_PPC_BYTEORDER_H. 1:3.6.18-2 used asm/error.h but this broke things in
a manner i didn't understand.

> Looking through the kernel source, it seems lkh should be fixed.  I
> put the patch to lkh cvs.
> 

good :)

> However, now we're base-freeze period, and at least I don't decide to
> put new lkh package -18 into unstable and testing-proposed-updates
> yet, so it's good idea to put workaround fix for reiserfsprogs.
> 

already put, uploaded and successfully built :)

> BTW, I think reiserfsprogs is tightly coupled with the kernel version,
> so I wonder it's OK to use lkh package, instead of using kernel
> headers which are included from the latest kernel source to
> reiserfsprogs.
> 

don't know, Hans Reiser should be able to answer this question.

cheers
domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
