From: Domenico Andreoli <cavok@tiscali.it>
Subject: Re: Bug#263348: linux-kernel-headers: asm/unaligned.h on powerpc is useless if __KERNEL__ is undefined
Date: Wed, 18 Aug 2004 13:03:42 +0200
Message-ID: <20040818110342.GA5212@raptus.homelinux.net>
References: <20040806220432.GA2291@raptus.homelinux.net> <20040809175027.GB2072@raptus.homelinux.net> <200408101539.10117.vitaly@namesys.com> <200408121720.54226.vitaly@namesys.com> <20040812135730.GA2949@raptus.homelinux.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20373-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040812135730.GA2949@raptus.homelinux.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

hi Vitaly,

On Thu, Aug 12, 2004 at 03:57:30PM +0200, Domenico Andreoli wrote:
> On Thu, Aug 12, 2004 at 05:20:54PM +0400, Vitaly Fertman wrote:
> >
> > I do not have hardware to test building. if you have, try it please and
> > tell me what you think about it.
> 
> my powerpc hardware is actually that of debian, which is currently
> a little busy (wild and massive rebuild of packages) due to imminent
> release of the distribution. as soon as i'm able to check i will report
> you (in this moment i not even able to login).
> 

i can now confirm that you patch to fix broken powerpc linux kernel
headers does it work, the build succeeded.

cheers
domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
