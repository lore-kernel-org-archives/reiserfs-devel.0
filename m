From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: New reiser4 snapshot (2003.09.12) is out
Date: Sat, 13 Sep 2003 04:38:01 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0309130437320.30756-100000@localhost.localdomain>
References: <20030913063124.GJ2123@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15642-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030913063124.GJ2123@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Zarochentsev <zam@namesys.com>
Cc: Mike Benoit <mikeb@netnation.com>, Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

On Sat, 13 Sep 2003, Alex Zarochentsev wrote:

> On Fri, Sep 12, 2003 at 01:20:59PM -0700, Mike Benoit wrote:
> > Any ideas why I would get this error while trying to compile
> > reiser4progs-0.4.14? The previous version of reiser4progs seemed to
> > compile fine for me, as did compiling reiser4 in to the test5 kernel. 
> > 
> > gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../include -DENABLE_MONOLITHIC 
> > -D_REENTRANT -D_FILE_OFFSET_BITS=64 -DENABLE_COLLISIONS
> > -DENABLE_PLUGINS_CHECK -DENABLE_SYMLINKS -DENABLE_R5_HASH
> > -DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH
> > -DENABLE_DEG_HASH -DENABLE_LARGE_KEYS -DENABLE_SHORT_KEYS -O0 -g -W
> > -Wall -Wno-unused-parameter -Wredundant-decls -Werror -MT
> > libmisc_la-exception.lo -MD -MP -MF .deps/libmisc_la-exception.Tpo -c
> > exception.c  -fPIC -DPIC -o .libs/libmisc_la-exception.lo
> > exception.c: In function `misc_exception_handler':
> > exception.c:133: warning: unused variable `i'
> > exception.c:135: warning: unused variable `variant'
> > make[2]: *** [libmisc_la-exception.lo] Error 1
> > make[2]: Leaving directory
> > `/home/ipso/downloads/reiser4progs-0.4.14/libmisc'
> > make[1]: *** [all-recursive] Error 1
> > make[1]: Leaving directory `/home/ipso/downloads/reiser4progs-0.4.14'
> > make: *** [all] Error 2
> 
> It is because of paranoid -Werror flag.  
> ./configure --disable-werror will help you.
> 
> However, if your system will have readline (as on systems which are used by
> reiser4progs developers :-) headers that warning disappear.

my system definitely has readline installed, and i get the same error.

rday

