From: "Network Operations" <downtown@cwo.com>
Subject: error compiling reiserfsprogs
Date: Wed, 30 Apr 2003 13:53:36 -0700
Message-ID: <00e001c30f5a$91f71bf0$0f02a8c0@observer>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13908-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

When I try to compile reiserfsprogs-3.6.6 on Slackware linux 8.1 (kernel
2.4.20) I receive the errors below (second paragraph).

I usually don't have problems compiling stuff on that box... I guess I'm
missing some library, but I'm not sure which one... ;-(

Does anybody know why my ./make fails ?

Thanks for your help

Jorg B.


--------- Start of ./configure and ./make ---------

./configure
checking for a BSD-compatible install... /usr/bin/ginstall -c
checking whether build environment is sane... yes
/usr/src/reiserfsprogs-3.6.6/missing: Unknown `--run' option
Try `/usr/src/reiserfsprogs-3.6.6/missing --help' for more information
configure: WARNING: `missing' script is too old or missing
checking for gawk... gawk
checking whether make sets ${MAKE}... yes
checking for gcc... gcc
checking for C compiler default output... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for style of include used by make... GNU
checking dependency style of gcc... gcc
checking for ranlib... ranlib
checking how to run the C preprocessor... gcc -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking fcntl.h usability... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
checking limits.h usability... yes
checking limits.h presence... yes
checking for limits.h... yes
checking malloc.h usability... yes
checking malloc.h presence... yes
checking for malloc.h... yes
checking sys/ioctl.h usability... no
checking sys/ioctl.h presence... no
checking for sys/ioctl.h... no
checking for unistd.h... (cached) yes
checking for gcc option to accept ANSI C... none needed
checking for an ANSI C-conforming const... yes
checking for inline... inline
checking for size_t... yes
checking for struct stat.st_rdev... yes
checking whether gcc needs -traditional... no
checking for working memcmp... yes
checking for strftime... yes
checking for vprintf... yes
checking for _doprnt... no
checking for strerror... yes
checking for strstr... yes
checking for strtol... yes
configure: creating ./config.status
config.status: creating include/Makefile
config.status: creating mkreiserfs/Makefile
config.status: creating resize_reiserfs/Makefile
config.status: creating fsck/Makefile
config.status: creating lib/Makefile
config.status: creating Makefile
config.status: creating reiserfscore/Makefile
config.status: creating debugreiserfs/Makefile
config.status: creating tune/Makefile
config.status: creating include/config.h
config.status: include/config.h is unchanged
config.status: executing depfiles commands




./make
Making all in include
make[1]: Entering directory `/usr/src/reiserfsprogs-3.6.6/include'
make  all-am
make[2]: Entering directory `/usr/src/reiserfsprogs-3.6.6/include'
make[2]: Leaving directory `/usr/src/reiserfsprogs-3.6.6/include'
make[1]: Leaving directory `/usr/src/reiserfsprogs-3.6.6/include'
Making all in lib
make[1]: Entering directory `/usr/src/reiserfsprogs-3.6.6/lib'
source='io.c' object='io.o' libtool=no \
depfile='.deps/io.Po' tmpdepfile='.deps/io.TPo' \
depmode=gcc /bin/sh ../depcomp \
gcc -DHAVE_CONFIG_H -I. -I. -I../include     -g -O2 -Wall -c `test -f 'io.c'
|| echo './'`io.c
In file included from /usr/include/bits/errno.h:25,
                 from /usr/include/errno.h:36,
                 from io.c:9:
/usr/include/linux/errno.h:4: asm/errno.h: No such file or directory
io.c:11: asm/types.h: No such file or directory
In file included from /usr/include/signal.h:307,
                 from ../include/misc.h:13,
                 from io.c:18:
/usr/include/bits/sigcontext.h:28: asm/sigcontext.h: No such file or
directory
make[1]: *** [io.o] Error 1
make[1]: Leaving directory `/usr/src/reiserfsprogs-3.6.6/lib'
make: *** [all-recursive] Error 1

