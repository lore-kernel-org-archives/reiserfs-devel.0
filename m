From: Oleg Drokin <green@namesys.com>
Subject: Re: reiser4 snapshot
Date: Tue, 12 Aug 2003 10:05:42 +0400
Message-ID: <20030812060542.GA5363@namesys.com>
References: <16183.48363.884605.564937@laputa.namesys.com> <pan.2003.08.12.00.32.11.185228@math.ubc.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15286-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <pan.2003.08.12.00.32.11.185228@math.ubc.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Tschirschwitz <boris@math.ubc.ca>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Aug 11, 2003 at 05:32:25PM -0700, Boris Tschirschwitz wrote:

> I thought I'd give it a try on 2.6.0-test3-mm1.
> Even with 'make mrproper' before compiling, I get the following error
> message:
> (Is there any interest in such error reports?)

Yes, there is.

> bobele linux # make bzImage
>   CHK     include/linux/version.h
>   UPD     include/linux/version.h
>   Making asm->asm-i386 symlink
>   CC      scripts/empty.o
>   MKELF   scripts/elfconfig.h
>   HOSTCC  scripts/file2alias.o
>   HOSTCC  scripts/modpost.o
>   HOSTLD  scripts/modpost
>   SPLIT   include/linux/autoconf.h -> include/config/*
>   CC      arch/i386/kernel/asm-offsets.s
>   CHK     include/asm-i386/asm_offsets.h
>   UPD     include/asm-i386/asm_offsets.h
>   CC      init/main.o
> In file included from include/linux/unistd.h:9,
>                  from init/main.c:18:
> include/asm/unistd.h: In function `reiser4':
> include/asm/unistd.h:400: error: `__NR_reiser4' undeclared (first use in this function)
> include/asm/unistd.h:400: error: (Each undeclared identifier is reported only once
> include/asm/unistd.h:400: error: for each function it appears in.)
> make[1]: *** [init/main.o] Error 1
> make: *** [init] Error 2

Hm, this is strange.
__NR_reiser4 is clearly defined in include/asm-i386/unistd.h

Probably you had that part of the patch rejected? Can you please verify?

Bye,
    Oleg
