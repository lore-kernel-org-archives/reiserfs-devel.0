From: Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>
Subject: Re: reiser4 snapshot for August 26th.
Date: Tue, 26 Aug 2003 21:36:07 +0200
Message-ID: <1061926566.1076.2.camel@teapot.felipe-alfaro.com>
References: <20030826102233.GA14647@namesys.com>
	 <1061922037.1670.3.camel@spc9.esa.lanl.gov>
	 <20030826182609.GO5448@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15432-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030826182609.GO5448@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>
Cc: Steven Cole <elenstev@mesatop.com>, Oleg Drokin <green@namesys.com>, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, LKML <linux-kernel@vger.kernel.org>

On Tue, 2003-08-26 at 20:26, Alex Zarochentsev wrote:

> Disable "reiser4 system call" (CONFIG_REISER4_FS_SYSCALL) support, it is 
> not ready.

[...]
  CC      lib/string.o
lib/string.c:435: warning: conflicting types for built-in function
`bcopy'
  CC      lib/vsprintf.o
  AR      lib/lib.a
  LD      arch/i386/lib/built-in.o
  AS      arch/i386/lib/checksum.o
  CC      arch/i386/lib/dec_and_lock.o
  CC      arch/i386/lib/delay.o
  AS      arch/i386/lib/getuser.o
  CC      arch/i386/lib/memcpy.o
  CC      arch/i386/lib/strstr.o
  CC      arch/i386/lib/usercopy.o
  AR      arch/i386/lib/lib.a
  GEN     .version
  CHK     include/linux/compile.h
  UPD     include/linux/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
arch/i386/kernel/built-in.o(.data+0x7c4): In function `sys_call_table':
: undefined reference to `sys_reiser4'
make[2]: *** [.tmp_vmlinux1] Error 1
make[1]: *** [vmlinux] Error 2

[...]
CONFIG_REISER4_FS=m
# CONFIG_REISER4_FS_SYSCALL is not set
# CONFIG_REISER4_LARGE_KEY is not set
# CONFIG_REISER4_CHECK is not set
# CONFIG_REISER4_USE_EFLUSH is not set
# CONFIG_REISER4_BADBLOCKS is not set
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
[...]


