From: "Yury V. Umanets" <umka@namesys.com>
Subject: Re: libaal compile fails
Date: Thu, 20 Nov 2003 11:09:12 +0300
Message-ID: <1069315752.1687.26.camel@firefly>
References: <20031119193539.GE24852@BL4ST>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16130-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031119193539.GE24852@BL4ST>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Wong <eric@yhbt.net>
Cc: reiserfs-list@namesys.com

On Wed, 2003-11-19 at 22:35, Eric Wong wrote:
> Hi, I'm still having problems with compiling libaal on Debian
> sid/unstable after trying the proposed-fix here:
> 
> http://marc.theaimsgroup.com/?l=reiserfs&m=106841085428596&w=2
> 
> Here is the output I got after making the above changes to the BLKGETSIZE64
> macro:
> 
> gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../include -D_REENTRANT
> -D_FILE_OFFSET_BITS=64 -O0 -g -W -Wall -Wno-unused -Wredundant-decls
> -Werror -c file.c -Wp,-MD,.deps/libaal_la-file.TPlo  -fPIC -DPIC -o
> .libs/libaal_la-file.lo
> file.c: In function `file_len':
> file.c:213: warning: signed and unsigned type in conditional expression
> make[2]: *** [libaal_la-file.lo] Error 1
> 
> I'm using gcc 3.3.2 and the somewhat troublesome (yet standard fare in
> Debian unstable nowadays) linux-kernel-headers package that provides
> kernel headers for glibc.  I'm running 2.6.0-test9
> 
> This package compiles fine on my Debian stable/Woody system, however.
> 
> If you need any more info, let me know.  Thanks.
Hello,

Thanks for shooting the bug, will be fixed.

Use --disable-Werror option in configure as temporal workaround. Next
snapshot has it turned on by default. 
-- 
umka

