From: Alex Veber <vibir@012.net.il>
Subject: Re: ld.so error with mkfs.reiser4
Date: Wed, 23 Apr 2003 01:48:11 +0300
Message-ID: <200304230148.11610.vibir@012.net.il>
References: <200304221054.28028.vibir@012.net.il> <3EA5446F.8070309@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13764-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EA5446F.8070309@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 22 April 2003 16:32, you wrote:
> Alex Veber wrote:
> >Hi,
>
> Hello Alex,
>
> >Trying to run a fresh BK pulled mkfs.reiser4 I get
> >
> >Inconsistency detected by ld.so: ../sysdeps/i386/dl-machine.h: 611:
> >elf_machine_rel_relative: Assertion `((reloc->r_info) & 0xff) == 8'
> > failed!
> >
> >my system is a athlon tbird 1200, GLIBC 2.3.2 with NPTL support, GCC
> > 3.2.2, binutils 2.13.90.0.20 and kernel 2.5.67. This is the first time
> > this sort of thing happens to me.
> >
> >Thanks,
> >	Alex Veber
> >
> >btw: Please CC me.
>
> We have fixed this bug in the last commit of reiser4progs and now it
> works fine on gcc -3.x too. Can you try it one more time?

Yes. it works fine now.

	Alex Veber.

