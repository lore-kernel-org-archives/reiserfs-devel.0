From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: reiser4 snapshot
Date: Tue, 12 Aug 2003 12:56:42 +0400
Message-ID: <16184.43978.417325.745351@laputa.namesys.com>
References: <16183.48363.884605.564937@laputa.namesys.com>
	<200308121028.11231.henning@skalatan.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15295-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200308121028.11231.henning@skalatan.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: henning@skalatan.de
Cc: reiserfs-list@namesys.com

Henning Westerholt writes:
 > Am Montag, 11. August 2003 17:57 schrieb Nikita Danilov:
 > > Hello,
 > >
 > > new reiser4 snapshot is available at
 > >
 > > http://thebsh.namesys.com/snapshots/2003.08.11/
 > >
 > 
 > Hi,
 > 
 > thank you for the snapshot.
 > 
 > I've tested the reiser4.diff patch, it apply cleanly on my system. 
 > 
 > 1)
 > The option "CONFIG_REISER4_FS_SYSCALL" breaks the build on my system.

Disable it. We should disable it by default, it seems.

 > 
 > [...]
 >   CC      fs/reiser4/sys_reiser4.o
 > In file included from include/asm/hardirq.h:6,
 >                  from include/linux/interrupt.h:10,
 >                  from include/asm/highmem.h:24,
 >                  from include/linux/highmem.h:14,
 >                  from include/linux/pagemap.h:10,
 >                  from fs/reiser4/sys_reiser4.c:15:
 > include/linux/irq.h:69: warning: size of `irq_desc' is 28672 bytes
 > fs/reiser4/sys_reiser4.c:45:27: parser/parser.h: file not found
 > fs/reiser4/sys_reiser4.c:54:32: parser/parser.code.c: file not found
 > fs/reiser4/sys_reiser4.c: In function `sys_reiser4':
 > fs/reiser4/sys_reiser4.c:75: warning: implicit declaration of function 
 > `reiser4_pars_init'
 > fs/reiser4/sys_reiser4.c:75: warning: assignment makes pointer from integer 
 > without a cast
 > fs/reiser4/sys_reiser4.c:80: dereferencing pointer to incomplete type
 > fs/reiser4/sys_reiser4.c:81: warning: implicit declaration of function 
 > `PTRACE'
 > fs/reiser4/sys_reiser4.c:82: warning: implicit declaration of function 
 > `yyparse'
 > fs/reiser4/sys_reiser4.c:83: warning: implicit declaration of function 
 > `reiser4_pars_free'
 > fs/reiser4/sys_reiser4.c:66: warning: unused variable `Gencode'
 > make[2]: *** [fs/reiser4/sys_reiser4.o] Error 1
 > make[1]: *** [fs/reiser4] Error 2
 > make: *** [fs] Error 2
 > 
 > 
 > 2)
 > Without this option the build finish, but it gave also many warnings about a 
 > include from include/asm/hardirq.h

Something about structure being XXXXX bytes? Ignore them.

 > 
 > 
 > 3)
 > I'm also unable to build reiser4 as module:
 > [...]
 > include/linux/irq.h:69: warning: size of `irq_desc' is 28672 bytes
 >   LD [M]  fs/reiser4/reiser4.o
 >   LD      fs/built-in.o
 >   GEN     .version
 >   CHK     include/linux/compile.h
 >   UPD     include/linux/compile.h
 >   CC      init/version.o
 >   LD      init/built-in.o
 >   LD      .tmp_vmlinux1
 > arch/i386/kernel/built-in.o(.data+0x7c0): In function `sys_call_table':
 > : undefined reference to `sys_reiser4'
 > make: *** [.tmp_vmlinux1] Error 1
 > 
 > 
 > Are this know issues?

Yes. Does it build as module with CONFIG_REISER4_FS_SYSCALL off?

 > 
 > 
 > Henning
 > 

Nikita.
