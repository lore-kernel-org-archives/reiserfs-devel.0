From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Read errors from r/o-mounted reiser4
Date: Wed, 28 Dec 2005 19:31:41 -0700
Message-ID: <1135823501.6469.63.camel@tribesman.namesys.com>
References: <43B221E3.3020201@feise.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27536-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43B221E3.3020201@feise.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jfeise@feise.com
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2005-12-27 at 21:25 -0800, Joe Feise wrote:
> Hi,
> 
> in one of my systems, I have /usr on a Reiser4 partition.
> When I have that partition mounted read-only, I get errors whenever
> I try to compile anything. Other programs that read from that partition also
> seem to fail, but I don't get such nice output like the stuff from gcc.
> I am currently using Slackware 10.2 with kernel 2.6.15-rc5-mm3, but I have
> experienced the same problem with earlier kernels as well.
> The output from a make menuconfig in the kernel source dir:

Thanks for the report. We will take a look

> $: make menuconfig
> 
>   HOSTCC  scripts/kconfig/conf.o
> In file included from /usr/include/bits/types.h:31,
> 
>                  from /usr/include/ctype.h:28,
>                  from scripts/kconfig/conf.c:6:
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: syntax
> error before '}' token
> 
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: stray
> '\24' in program
> 
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: syntax
> error at '@' token
> 
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: stray
> '\17' in program
> 
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: stray
> '\205' in program
> 
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: stray
> '\275' in program
> 
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: stray
> '\374' in program
> 
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: stray
> '\377' in program
> 
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: stray
> '\377' in program
> 
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: stray
> '\213' in program
> 
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: stray
> '\10' in program
> 
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: stray
> '\205' in program
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: stray
> '\300' in program
> 
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: stray
> '\265' in program
> 
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: stray
> '\211' in program
> 
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: stray
> '\24' in program
> 
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: stray
> '\211' in program
> 
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: stray
> '\4' in program
> 
> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: stray
> '\350' in program
> 
> make[1]: *** [scripts/kconfig/conf.o] Interrupt
> 
> make: *** [menuconfig] Interrupt
> 
> 
> I interrupted it here.
> Everything works fine if the partition is mounted r/w.
> 
> -Joe
> 
> 

