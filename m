From: Boris Tschirschwitz <boris@math.ubc.ca>
Subject: Re: reiser4 snapshot
Date: Wed, 13 Aug 2003 09:34:18 -0700
Sender: news <news@sea.gmane.org>
Message-ID: <pan.2003.08.13.16.34.15.398355@math.ubc.ca>
References: <16183.48363.884605.564937@laputa.namesys.com> <pan.2003.08.12.00.32.11.185228@math.ubc.ca> <20030812060542.GA5363@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-15304-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Today I tried applying the patch to 2.6.0-test3-mm2, and, yes, some
patches failed. I'll just append the output for the failed hunks.
I guess it gets less surprising the more we get away from 'mm0'.

Boris.

bobele linux # patch -p 1 < ../reiser4.diff
patching file arch/i386/kernel/entry.S
Hunk #1 FAILED at 878.
1 out of 1 hunk FAILED -- saving rejects to file arch/i386/kernel/entry.S.rej
patching file fs/Kconfig
patching file fs/Makefile
Hunk #1 FAILED at 86.
1 out of 1 hunk FAILED -- saving rejects to file fs/Makefile.rej
patching file fs/buffer.c
Hunk #1 succeeded at 262 (offset 37 lines).
patching file fs/fs-writeback.c
patching file fs/inode.c
Hunk #1 succeeded at 990 (offset 2 lines).
Hunk #2 succeeded at 1017 (offset 2 lines).
patching file fs/jbd/transaction.c
patching file fs/sysfs/inode.c
patching file include/asm-i386/unistd.h
Hunk #1 FAILED at 277.
Hunk #2 succeeded at 398 (offset 3 lines).
1 out of 2 hunks FAILED -- saving rejects to file include/asm-i386/unistd.h.rej
patching file include/linux/fs.h
Hunk #2 succeeded at 861 (offset 6 lines).
Hunk #3 succeeded at 1233 (offset 6 lines).
patching file include/linux/init_task.h
Hunk #1 FAILED at 107.
1 out of 1 hunk FAILED -- saving rejects to file include/linux/init_task.h.rej


On Tue, 12 Aug 2003 10:05:42 +0400, Oleg Drokin wrote:

> Hello!
> 
> On Mon, Aug 11, 2003 at 05:32:25PM -0700, Boris Tschirschwitz wrote:
> 
>> I thought I'd give it a try on 2.6.0-test3-mm1. Even with 'make
>> mrproper' before compiling, I get the following error message:
>> (Is there any interest in such error reports?)
> 
> Yes, there is.
> 
>> bobele linux # make bzImage
>>   CHK     include/linux/version.h
>>   UPD     include/linux/version.h
>>   Making asm->asm-i386 symlink
>>   CC      scripts/empty.o
>>   MKELF   scripts/elfconfig.h
>>   HOSTCC  scripts/file2alias.o
>>   HOSTCC  scripts/modpost.o
>>   HOSTLD  scripts/modpost
>>   SPLIT   include/linux/autoconf.h -> include/config/* CC     
>>   arch/i386/kernel/asm-offsets.s CHK     include/asm-i386/asm_offsets.h
>>   UPD     include/asm-i386/asm_offsets.h CC      init/main.o
>> In file included from include/linux/unistd.h:9,
>>                  from init/main.c:18:
>> include/asm/unistd.h: In function `reiser4': include/asm/unistd.h:400:
>> error: `__NR_reiser4' undeclared (first use in this function)
>> include/asm/unistd.h:400: error: (Each undeclared identifier is reported
>> only once include/asm/unistd.h:400: error: for each function it appears
>> in.) make[1]: *** [init/main.o] Error 1
>> make: *** [init] Error 2
> 
> Hm, this is strange.
> __NR_reiser4 is clearly defined in include/asm-i386/unistd.h
> 
> Probably you had that part of the patch rejected? Can you please verify?
> 
> Bye,
>     Oleg


