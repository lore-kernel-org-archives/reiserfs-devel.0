From: Boris Tschirschwitz <boris@math.ubc.ca>
Subject: Re: reiser4 snapshot
Date: Mon, 11 Aug 2003 17:32:25 -0700
Sender: news <news@sea.gmane.org>
Message-ID: <pan.2003.08.12.00.32.11.185228@math.ubc.ca>
References: <16183.48363.884605.564937@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-15285-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hey.

I thought I'd give it a try on 2.6.0-test3-mm1.

Even with 'make mrproper' before compiling, I get the following error
message:

(Is there any interest in such error reports?)

bobele linux # make bzImage
  CHK     include/linux/version.h
  UPD     include/linux/version.h
  Making asm->asm-i386 symlink
  CC      scripts/empty.o
  MKELF   scripts/elfconfig.h
  HOSTCC  scripts/file2alias.o
  HOSTCC  scripts/modpost.o
  HOSTLD  scripts/modpost
  SPLIT   include/linux/autoconf.h -> include/config/*
  CC      arch/i386/kernel/asm-offsets.s
  CHK     include/asm-i386/asm_offsets.h
  UPD     include/asm-i386/asm_offsets.h
  CC      init/main.o
In file included from include/linux/unistd.h:9,
                 from init/main.c:18:
include/asm/unistd.h: In function `reiser4':
include/asm/unistd.h:400: error: `__NR_reiser4' undeclared (first use in this function)
include/asm/unistd.h:400: error: (Each undeclared identifier is reported only once
include/asm/unistd.h:400: error: for each function it appears in.)
make[1]: *** [init/main.o] Error 1
make: *** [init] Error 2


On Mon, 11 Aug 2003 19:57:31 +0400, Nikita Danilov wrote:

> Hello,
> 
> new reiser4 snapshot is available at
> 
> http://thebsh.namesys.com/snapshots/2003.08.11/
> 
> **********************************************************************
>                               WARNING!!!
>                       This code is experimental!
>     WE ARE NOT KIDDING! DO NOT PUT ANY VALUABLE DATA ON REISER4 YET!
> **********************************************************************
> 
> Lots of changes in this snapshot compared to previous one that was release
> over half of year ago.  Everything should be better and more stable I
> hope.
> 
> Snapshot is released as a patch against linux-2.6.0-test3.
> 
> REISER4_NOOPT config option (Disable compiler optimizations for reiser4
> code.)  is known to not compile on x86.
> 
> The reiser4-kernelonly.diff file represents only required kernel
> modifications if you plan to use our reiser4 bk repository. It does not
> contains any reiser4 code
> 
> The reiser4.diff is full patch with everything included.
> 
> With this snapshot reiser4 supports different on-disk format by default,
> so you should recreate your reiser4 file systems.
> 
> Nikita.


