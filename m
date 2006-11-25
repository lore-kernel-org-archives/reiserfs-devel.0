From: "Clemens Eisserer" <linuxhippy@gmail.com>
Subject: Re: Possible interference between reiser4 and usb-storage?
Date: Sat, 25 Nov 2006 12:43:24 +0100
Message-ID: <194f62550611250343t5d5693a5q1db39c22d618b6fc@mail.gmail.com>
References: <194f62550611191252l612ac827tc2f0e581d01be46a@mail.gmail.com>
	 <Pine.LNX.4.64.0611250538370.16392@sheep.housecafe.de>
	 <194f62550611250117j30835681o8d824812f60f5dca@mail.gmail.com>
	 <45681726.3050809@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30218-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45681726.3050809@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi again,

Sorry but I wonder why you worry about my setup...

> The kernel is also something that should arguably take up less RAM. For
> one thing, it can't be swapped out...
Well I am completly happy with my kernel build - the executable is
about 1.5mb which I don't care at all. The ~0.2mb I would save with O2
don't matter at all.
Another more dramatic effect which needs to be analyzed are L1/L2
cache misses which are more likely to occur with larger code - but
since the LZO-code of Reiser4 is very small it fits into L1 anyway.

> biggest optimization you do when compiling your own kernel is selecting
> a CPU.
Well but at least for kernel 2.6.19 it does not make any difference if
you select p-pro, p2, p3 or p4 - the emitted code will alway be i686
compatible, only instruction sceduling is tuned for the given CPU.
Thats why I altered my Makefile.cpu to : cflags-$(CONFIG_MPENTIUM4)	+=
-march=pentium4 -mno-sse -mno-sse2 -mtune=pentium4

lg Clemens
