From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Bug#263348: linux-kernel-headers: asm/unaligned.h on powerpc is useless if __KERNEL__ is undefined
Date: Wed, 18 Aug 2004 15:36:33 +0400
Message-ID: <200408181536.33350.vitaly@namesys.com>
References: <20040806220432.GA2291@raptus.homelinux.net> <20040812135730.GA2949@raptus.homelinux.net> <20040818110342.GA5212@raptus.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20375-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040818110342.GA5212@raptus.homelinux.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Domenico Andreoli <cavok@tiscali.it>
Cc: reiserfs-list@namesys.com

On Wednesday 18 August 2004 15:03, Domenico Andreoli wrote:
> hi Vitaly,
>
> On Thu, Aug 12, 2004 at 03:57:30PM +0200, Domenico Andreoli wrote:
> > On Thu, Aug 12, 2004 at 05:20:54PM +0400, Vitaly Fertman wrote:
> > > I do not have hardware to test building. if you have, try it please and
> > > tell me what you think about it.
> >
> > my powerpc hardware is actually that of debian, which is currently
> > a little busy (wild and massive rebuild of packages) due to imminent
> > release of the distribution. as soon as i'm able to check i will report
> > you (in this moment i not even able to login).
>
> i can now confirm that you patch to fix broken powerpc linux kernel
> headers does it work, the build succeeded.

Thank You

