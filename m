From: Yury Umanets <umka@namesys.com>
Subject: Re: Autoconf error
Date: Tue, 29 Jul 2003 10:30:29 +0400
Message-ID: <1059460229.10291.0.camel@haron.namesys.com>
References: <3F255543.8010409@mrs.umn.edu>  <3F255920.3070804@mrs.umn.edu>
	 <1059455220.7235.13.camel@haron.namesys.com>
	 <1059459151.14479.5.camel@localhost>
	 <1059459291.27547.3.camel@haron.namesys.com>
	 <1059460212.1881.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15106-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1059460212.1881.1.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Miner <mine0057@mrs.umn.edu>
Cc: reiserfs <reiserfs-list@namesys.com>

On Tue, 2003-07-29 at 10:30, Grant Miner wrote:
> On Tue, 2003-07-29 at 01:14, Yury Umanets wrote:
> > On Tue, 2003-07-29 at 10:12, Grant Miner wrote:
> > > On Tue, 2003-07-29 at 00:07, Yury Umanets wrote:
> > > > On Mon, 2003-07-28 at 21:10, Grant Miner wrote:
> > > > > $ ./prepare
> > > > > 
> > > > > > Running aclocal...
> > > > > > Running autoheader...
> > > > > > Running autoconf...
> > > > > > configure.in:44: error: possibly undefined macro: dnl
> > > > > >      If this token and others are legitimate, please use 
> > > > > > m4_pattern_allow.
> > > > > >      See the Autoconf documentation.
> > > > > > configure.in:48: error: possibly undefined macro: AC_CHECK_LIB
> > > > > > configure.in:49: error: possibly undefined macro: AC_MSG_ERROR
> > > > > > configure.in:54: error: possibly undefined macro: AC_CHECK_HEADER
> > > > > > configure.in:58: error: possibly undefined macro: AC_MSG_CHECKING
> > > > > > configure.in:60: error: possibly undefined macro: AC_TRY_LINK_FUNC
> > > > > > configure.in:61: error: possibly undefined macro: AC_MSG_RESULT
> > > > > > configure.in:73: error: possibly undefined macro: AC_TRY_RUN
> > > > > >
> > > > > >
> > > > > This first happens with version 1.136 of configure.in
> > > > 
> > > > I have put reiser4progs and libaal to
> > > > http://www.namesys.com/snapshots/2003.07.29
> > > > 
> > > > Use it please.
> > > 
> > > Thank you.  I was trying to compile reiser4progs-0.4.10; i got this
> > > error below (but I was able to get reiser4progs-0.4.9 working).
> > > 
> > > Making all in librepair
> > > make[2]: Entering directory `/r4/reiser4progs-0.4.10/librepair'
> > > if /bin/sh ../libtool --mode=compile gcc -DHAVE_CONFIG_H -I. -I. -I..
> > > -I../include   -DENABLE_MONOLITHIC -D_REENTRANT -DENABLE_COLLISIONS
> > > -DENABLE_PLUGINS_CHECK -DENABLE_SYMLINKS -DENABLE_R5_HASH
> > > -DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH
> > > -DENABLE_LARGE_KEYS -DENABLE_SHORT_KEYS -O0 -g -W -Wall -Wno-unused
> > > -Werror -MT librepair_la-filesystem.lo -MD -MP -MF
> > > ".deps/librepair_la-filesystem.Tpo" \
> > >   -c -o librepair_la-filesystem.lo `test -f 'filesystem.c' || echo
> > > './'`filesystem.c; \
> > > then mv ".deps/librepair_la-filesystem.Tpo"
> > > ".deps/librepair_la-filesystem.Plo"; \
> > > else rm -f ".deps/librepair_la-filesystem.Tpo"; exit 1; \
> > > fi
> > > rm -f .libs/librepair_la-filesystem.lo
> > > gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../include -DENABLE_MONOLITHIC
> > > -D_REENTRANT -DENABLE_COLLISIONS -DENABLE_PLUGINS_CHECK
> > > -DENABLE_SYMLINKS -DENABLE_R5_HASH -DENABLE_FNV1_HASH
> > > -DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH -DENABLE_LARGE_KEYS
> > > -DENABLE_SHORT_KEYS -O0 -g -W -Wall -Wno-unused -Werror -MT
> > > librepair_la-filesystem.lo -MD -MP -MF .deps/librepair_la-filesystem.Tpo
> > > -c filesystem.c  -fPIC -DPIC -o .libs/librepair_la-filesystem.lo
> > > In file included from filesystem.c:7:
> > > ../include/repair/librepair.h:25:27: repair/object.h: No such file or
> > > directory
> > > make[2]: *** [librepair_la-filesystem.lo] Error 1
> > > make[2]: Leaving directory `/r4/reiser4progs-0.4.10/librepair'
> > > make[1]: *** [all-recursive] Error 1
> > > make[1]: Leaving directory `/r4/reiser4progs-0.4.10'
> > 
> > > make: *** [all] Error 2
> > 
> > Take reiser4progs from http://www.namesys.com/snapshots/2003.07.29 one
> > more time. Sorry for errors :)
> > > 
> Ok great, you fixed it :)

Thanks a lot for trying our software and for reports :)

-- 
We're flying high, we're watching the world passes by...

