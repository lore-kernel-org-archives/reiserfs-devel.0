From: Oleg Drokin <green@namesys.com>
Subject: Re: reiser4 snapshot
Date: Tue, 12 Aug 2003 13:27:46 +0400
Message-ID: <20030812092746.GA7382@namesys.com>
References: <16183.48363.884605.564937@laputa.namesys.com> <200308121028.11231.henning@skalatan.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15297-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200308121028.11231.henning@skalatan.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henning Westerholt <henning@skalatan.de>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Aug 12, 2003 at 10:28:07AM +0200, Henning Westerholt wrote:
> > new reiser4 snapshot is available at
> > http://thebsh.namesys.com/snapshots/2003.08.11/
> thank you for the snapshot.
> I've tested the reiser4.diff patch, it apply cleanly on my system. 
> 1)
> The option "CONFIG_REISER4_FS_SYSCALL" breaks the build on my system.

It seems one necessary directory was not included in the patch and that broke build
with CONFIG_REISER4_FS_SYSCALL.
Also we have some 64bit problems reports, so I am going to investigate those and may be we will release
new snapshot with 64 bit fixes and parser directory inplace.

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

hm.
I will take a look.
Thank you.

Bye,
    Oleg
