From: Steven Cole <elenstev@mesatop.com>
Subject: Re: reiser4 snapshot for August 26th.
Date: 26 Aug 2003 12:38:22 -0600
Message-ID: <1061923101.1670.9.camel@spc9.esa.lanl.gov>
References: <20030826102233.GA14647@namesys.com>
	 <1061922037.1670.3.camel@spc9.esa.lanl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15428-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1061922037.1670.3.camel@spc9.esa.lanl.gov>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On Tue, 2003-08-26 at 12:20, Steven Cole wrote:
> On Tue, 2003-08-26 at 04:22, Oleg Drokin wrote:
> > Hello!
> > 
> >    I have just released another reiser4 snapshot that I hope all interested
> >    parties will try. It is released against 2.6.0-test4.
> >    You can find it at http://namesys.com/snapshots/2003.08.26
> >    I include release notes below.
> > 
> > Reiser4 snapshot for 2003.08.26
> > 
> 
> I got this error while attempting to compile with reiser4.
> Snippet from .config follows.
> 
> Steven
> 
>   CC      fs/reiser4/plugin/file/tail_conversion.o
>   CC      fs/reiser4/sys_reiser4.o
> fs/reiser4/sys_reiser4.c:54:32: parser/parser.code.c: No such file or directory
[snipped]
> [steven@spc1 linux-2.6.0-test4-r4]$ grep REISER4 .config
> CONFIG_REISER4_FS=y
> CONFIG_REISER4_FS_SYSCALL=y

I should have read this more carefully :(

config REISER4_FS_SYSCALL
        bool "Enable reiser4 system call"
        depends on REISER4_FS
        default n
        ---help---
      Adds sys_reiser4() syscall.
      This code is not in good shape yet and may not compile and stuff like that.

Without REISER4_FS_SYSCALL, -test4 with reiser4 compiles fine.  Sorry about the noise.

Steven


