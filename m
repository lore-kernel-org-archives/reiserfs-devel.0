From: Domenico Andreoli <cavok@tiscali.it>
Subject: Re: Bug#263348: linux-kernel-headers: asm/unaligned.h on powerpc is useless if __KERNEL__ is undefined
Date: Thu, 12 Aug 2004 15:57:30 +0200
Message-ID: <20040812135730.GA2949@raptus.homelinux.net>
References: <20040806220432.GA2291@raptus.homelinux.net> <20040809175027.GB2072@raptus.homelinux.net> <200408101539.10117.vitaly@namesys.com> <200408121720.54226.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20227-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408121720.54226.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

On Thu, Aug 12, 2004 at 05:20:54PM +0400, Vitaly Fertman wrote:
> Hi Domenico, 

hi Vitaly,

> seems that the problem will be solved in the linux-libc-headers finally,
> as reiserfsprogs need a fix anyway, I am going to include the attached

i did not understand you had the bug also out of debian, i would have
replied earlier :)

> one, it looks better than _PPC_ERRNO_H, doesn't it? unfortunately

yes, it does a lot. of course.

> I do not have hardware to test building. if you have, try it please and
> tell me what you think about it.

my powerpc hardware is actually that of debian, which is currently
a little busy (wild and massive rebuild of packages) due to imminent
release of the distribution. as soon as i'm able to check i will report
you (in this moment i not even able to login).

regards
domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
