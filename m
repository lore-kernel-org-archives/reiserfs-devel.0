From: Domenico Andreoli <cavok@libero.it>
Subject: Re: fsck.reiser4
Date: Mon, 22 Dec 2003 14:55:41 +0100
Message-ID: <3FE6F7DD.7000503@libero.it>
References: <200312212203.52775.janfengler@web.de> <200312221523.26888.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16379-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200312221523.26888.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

hi Vitaly,

Vitaly Fertman wrote:
> It seems this bug was already fixed, we have not released 
> another reiser4progs snapshot yet, so you can wait a bit for 
> the coming release or you can get the code from our bk 
> repositories:
> 
> bk clone bk://bk.namesys.com/bk/libaal
> bk clone bk://bk.namesys.com/bk/reiser4progs
> 

i just checked out reiser4progs but i had some problems building it :(

~/devel/bk/reiser4progs$ ./prepare
Running aclocal...
Running autoheader...
Running autoconf...
Running automake --add-missing...
~/devel/bk/reiser4progs$ ./configure
[ here apparently everything goes well ]
~/devel/bk/reiser4progs$ make
...
Making all in format40
make[4]: Entering directory `/home/cavok/devel/bk/reiser4progs/plugin/format/format40'
if /bin/sh ../../../libtool --mode=compile gcc -DHAVE_CONFIG_H -I. -I. -I../../.. -I../../../include   -DENABLE_MONOLITHIC -D_REENTRANT -D_FILE_OFFSET_BITS=64 -DENABLE_PLUGINS_CHECK -DENABLE_SYMLINKS -DENABLE_SPECIAL -DENABLE_R5_HASH -DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH -DENABLE_DEG_HASH -DENABLE_LARGE_KEYS -DENABLE_SHORT_KEYS -O0 -g -W -Wall -Wno-unused-parameter -Wredundant-decls -Werror -MT libformat40_static_la-format40.lo -MD -MP -MF ".deps/libformat40_static_la-format40.Tpo" -c -o libformat40_static_la-format40.lo `test -f 'format40.c' || echo './'`format40.c; \
then mv -f ".deps/libformat40_static_la-format40.Tpo" ".deps/libformat40_static_la-format40.Plo"; \
else rm -f ".deps/libformat40_static_la-format40.Tpo"; exit 1; \
fi
mkdir .libs
gcc -DHAVE_CONFIG_H -I. -I. -I../../.. -I../../../include -DENABLE_MONOLITHIC -D_REENTRANT -D_FILE_OFFSET_BITS=64 -DENABLE_PLUGINS_CHECK -DENABLE_SYMLINKS -DENABLE_SPECIAL -DENABLE_R5_HASH -DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH -DENABLE_DEG_HASH -DENABLE_LARGE_KEYS -DENABLE_SHORT_KEYS -O0 -g -W -Wall -Wno-unused-parameter -Wredundant-decls -Werror -MT libformat40_static_la-format40.lo -MD -MP -MF .deps/libformat40_static_la-format40.Tpo -c format40.c  -fPIC -DPIC -DPIC -o libformat40_static_la-format40.o
format40.c: In function `format40_check':
format40.c:116: warning: implicit declaration of function `aal_exception_error'
format40.c:126: warning: redundant redeclaration of `aal_exception_error' in same scope
format40.c:116: warning: previous declaration of `aal_exception_error'
make[4]: *** [libformat40_static_la-format40.lo] Error 1
make[4]: Leaving directory `/home/cavok/devel/bk/reiser4progs/plugin/format/format40'
...


any hint is appreciated

cheers
dom

PS: could be of interest adding the AM_MAINTAINER_MODE option to configure.in. in my prepare
    scripts then i put also a './configure --enable-maintainer-mode "$@"'.


===============
linux: 2.6.0 + linux-2.6.0-test9-reiser4.diff
gcc: 3.3.3 20031206 (prerelease) (Debian)
libtool: 1.5.0a
automake: 1.7.9
autoconf: 2.58


-----[ Domenico Andreoli, aka cavok
 --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50

