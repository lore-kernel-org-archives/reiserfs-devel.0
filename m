From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: reiser4 snapshot for August 26th.
Date: Tue, 26 Aug 2003 12:53:06 -0700
Message-ID: <20030826195306.GB1258@matchmail.com>
References: <20030826102233.GA14647@namesys.com> <1061922037.1670.3.camel@spc9.esa.lanl.gov> <20030826182609.GO5448@backtop.namesys.com> <1061926566.1076.2.camel@teapot.felipe-alfaro.com> <20030826194321.GA25730@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15434-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030826194321.GA25730@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>, Alex Zarochentsev <zam@namesys.com>, Steven Cole <elenstev@mesatop.com>, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, LKML <linux-kernel@vger.kernel.org>

On Tue, Aug 26, 2003 at 11:43:21PM +0400, Oleg Drokin wrote:
> Hello!
> 
> On Tue, Aug 26, 2003 at 09:36:07PM +0200, Felipe Alfaro Solana wrote:
> > > Disable "reiser4 system call" (CONFIG_REISER4_FS_SYSCALL) support, it is 
> > > not ready.
> > [...]
> > arch/i386/kernel/built-in.o(.data+0x7c4): In function `sys_call_table':
> > : undefined reference to `sys_reiser4'
> > make[2]: *** [.tmp_vmlinux1] Error 1
> > make[1]: *** [vmlinux] Error 2
> > [...]
> > CONFIG_REISER4_FS=m
> 
> Building as module is also not yet supported.
> 

To do:

remove all options in build system that don't compile.
 o module
 o syscall
 o etc...
