From: Henning Westerholt <henning@skalatan.de>
Subject: Re: reiser4 snapshot
Date: Tue, 12 Aug 2003 11:18:10 +0200
Message-ID: <200308121118.10605.henning@skalatan.de>
References: <16183.48363.884605.564937@laputa.namesys.com> <200308121028.11231.henning@skalatan.de> <16184.43978.417325.745351@laputa.namesys.com>
Reply-To: henning@skalatan.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15296-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16184.43978.417325.745351@laputa.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Am Dienstag, 12. August 2003 10:56 schrieb Nikita Danilov
>  > [know issues]
>  > 3)
>  > I'm also unable to build reiser4 as module:
>  > [...]
>  > include/linux/irq.h:69: warning: size of `irq_desc' is 28672 bytes
>  >   LD [M]  fs/reiser4/reiser4.o
>  >   LD      fs/built-in.o
>  >   GEN     .version
>  >   CHK     include/linux/compile.h
>  >   UPD     include/linux/compile.h
>  >   CC      init/version.o
>  >   LD      init/built-in.o
>  >   LD      .tmp_vmlinux1
>  >
>  > arch/i386/kernel/built-in.o(.data+0x7c0): In function `sys_call_table':
>  > : undefined reference to `sys_reiser4'
>  >
>  > make: *** [.tmp_vmlinux1] Error 1
>  >
>  >
>  > Are this know issues?
>
> Yes. Does it build as module with CONFIG_REISER4_FS_SYSCALL off?
>
> Nikita.

No, it doesn't build with the following options:

CONFIG_REISER4_FS=m
# CONFIG_REISER4_FS_SYSCALL is not set
CONFIG_REISER4_LARGE_KEY=y
# CONFIG_REISER4_CHECK is not set
# CONFIG_REISER4_USE_EFLUSH is not set
# CONFIG_REISER4_BADBLOCKS is not set

**
uname -rvmpio
2.6.0-test3-reiserfs4 #4 Tue Aug 12 02:59:22 CEST 2003 i686 AMD Athlon(tm) XP 
1900+ AuthenticAMD GNU/Linux
**
gcc version 3.2.3 20030422 (Gentoo Linux 1.4 3.2.3-r1, propolice)
**
Gentoo 1.4 Stable


Henning

