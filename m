From: Oleg Drokin <green@namesys.com>
Subject: Re: 2.5.x patched kernel compile failed...
Date: Mon, 18 Aug 2003 10:04:44 +0400
Message-ID: <20030818060444.GA16183@namesys.com>
References: <53602.203.186.23.91.1060953968.squirrel@sml.dyndns.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15353-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <53602.203.186.23.91.1060953968.squirrel@sml.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Graham <lkthomas@sml.dyndns.org>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Aug 15, 2003 at 09:26:08PM +0800, Thomas Graham wrote:
> In file included from include/linux/unistd.h:9,
>                  from init/main.c:18:
> include/asm/unistd.h: In function `reiser4':
> include/asm/unistd.h:393: `__NR_reiser4' undeclared (first use in this
> function)
> include/asm/unistd.h:393: (Each undeclared identifier is reported only once
> include/asm/unistd.h:393: for each function it appears in.)
> make[1]: *** [init/main.o] Error 1
> make: *** [init] Error 2
> that file is failed to patch on 2.5.75 and 2.5.70, anyone have idea why ?

Thisis because the patch is against 2.6.0-test3. So you have part of the patch where __NR_reiser4
is defined rejected.

Bye,
    Oleg
