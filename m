From: Steven Cole <elenstev@mesatop.com>
Subject: Re: reiser4 snapshot for August 26th.
Date: 26 Aug 2003 12:20:38 -0600
Message-ID: <1061922037.1670.3.camel@spc9.esa.lanl.gov>
References: <20030826102233.GA14647@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15423-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030826102233.GA14647@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On Tue, 2003-08-26 at 04:22, Oleg Drokin wrote:
> Hello!
> 
>    I have just released another reiser4 snapshot that I hope all interested
>    parties will try. It is released against 2.6.0-test4.
>    You can find it at http://namesys.com/snapshots/2003.08.26
>    I include release notes below.
> 
> Reiser4 snapshot for 2003.08.26
> 

I got this error while attempting to compile with reiser4.
Snippet from .config follows.

Steven

  CC      fs/reiser4/plugin/file/tail_conversion.o
  CC      fs/reiser4/sys_reiser4.o
fs/reiser4/sys_reiser4.c:54:32: parser/parser.code.c: No such file or directory
fs/reiser4/sys_reiser4.c: In function `sys_reiser4':
fs/reiser4/sys_reiser4.c:75: warning: implicit declaration of function `reiser4_pars_init'
fs/reiser4/sys_reiser4.c:75: warning: assignment makes pointer from integer without a cast
fs/reiser4/sys_reiser4.c:80: error: dereferencing pointer to incomplete type
fs/reiser4/sys_reiser4.c:82: warning: implicit declaration of function `yyparse'
fs/reiser4/sys_reiser4.c:83: warning: implicit declaration of function `reiser4_pars_free'
fs/reiser4/sys_reiser4.c:66: warning: unused variable `Gencode'
fs/reiser4/sys_reiser4.c: At top level:
fs/reiser4/parser/parser.h:333: warning: `Fistmsg' defined but not used
fs/reiser4/parser/parser.h:342: warning: `typesOfCommand' defined but not used
fs/reiser4/parser/parser.h:354: warning: `Code' defined but not used
make[2]: *** [fs/reiser4/sys_reiser4.o] Error 1
make[1]: *** [fs/reiser4] Error 2
make: *** [fs] Error 2
[steven@spc1 linux-2.6.0-test4-r4]$ grep REISER4 .config
CONFIG_REISER4_FS=y
CONFIG_REISER4_FS_SYSCALL=y
CONFIG_REISER4_LARGE_KEY=y
# CONFIG_REISER4_CHECK is not set
CONFIG_REISER4_USE_EFLUSH=y
# CONFIG_REISER4_BADBLOCKS is not set


