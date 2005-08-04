From: avl@email.glotur.kz
Subject: reiser4progs fedora core 4 GCC 4.0.1 error HELP
Date: Thu, 4 Aug 2005 18:50:36 +0600
Message-ID: <521486445.20050804185036@email.glotur.kz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25301-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

reiser4progs fedora core 4 GCC 4.0.1 error HELP





[root@sol10 reiser4progs-1.0.4-1]# make
make  all-recursive
make[1]: Entering directory `/avl/tmp/reiser4progs-1.0.4-1'
Making all in libaux
make[2]: Entering directory `/avl/tmp/reiser4progs-1.0.4-1/libaux'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/avl/tmp/reiser4progs-1.0.4-1/libaux'
Making all in plugin
make[2]: Entering directory `/avl/tmp/reiser4progs-1.0.4-1/plugin'
Making all in format
make[3]: Entering directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/format'
Making all in format40
make[4]: Entering directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/format/format40'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/format/format40'
make[4]: Entering directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/format'
make[4]: Nothing to be done for `all-am'.
make[4]: Leaving directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/format'
make[3]: Leaving directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/format'
Making all in journal
make[3]: Entering directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/journal'
Making all in journal40
make[4]: Entering directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/journal/journal40'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/journal/journal40'
make[4]: Entering directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/journal'
make[4]: Nothing to be done for `all-am'.
make[4]: Leaving directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/journal'
make[3]: Leaving directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/journal'
Making all in alloc
make[3]: Entering directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/alloc'
Making all in alloc40
make[4]: Entering directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/alloc/alloc40'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/alloc/alloc40'
make[4]: Entering directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/alloc'
make[4]: Nothing to be done for `all-am'.
make[4]: Leaving directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/alloc'
make[3]: Leaving directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/alloc'
Making all in oid
make[3]: Entering directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/oid'
Making all in oid40
make[4]: Entering directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/oid/oid40'
if /bin/sh ../../../libtool --mode=compile gcc -DHAVE_CONFIG_H -I. -I. -I../../.. -I../../../include   -D_REENTRANT -D_FILE_OFFSET_BITS=64 -DENABLE_SYMLINKS -DENABLE_SPECIAL -DENABLE_R5_HASH -DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH -DENABLE_DEG_HASH -DENABLE_LARGE_KEYS -DENABLE_SHORT_KEYS -DENABLE_DOT_O_FIBRE -DENABLE_EXT_1_FIBRE -DENABLE_EXT_3_FIBRE -DENABLE_LEXIC_FIBRE -O3 -W -Wall -Wuninitialized -Wno-unused-parameter -Wredundant-decls -MT liboid40_static_la-oid40.lo -MD -MP -MF ".deps/liboid40_static_la-oid40.Tpo" \
  -c -o liboid40_static_la-oid40.lo `test -f 'oid40.c' || echo './'`oid40.c; \
then mv -f ".deps/liboid40_static_la-oid40.Tpo" ".deps/liboid40_static_la-oid40.Plo"; \
else rm -f ".deps/liboid40_static_la-oid40.Tpo"; exit 1; \
fi
 gcc -DHAVE_CONFIG_H -I. -I. -I../../.. -I../../../include -D_REENTRANT -D_FILE_OFFSET_BITS=64 -DENABLE_SYMLINKS -DENABLE_SPECIAL -DENABLE_R5_HASH -DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH -DENABLE_DEG_HASH -DENABLE_LARGE_KEYS -DENABLE_SHORT_KEYS -DENABLE_DOT_O_FIBRE -DENABLE_EXT_1_FIBRE -DENABLE_EXT_3_FIBRE -DENABLE_LEXIC_FIBRE -O3 -W -Wall -Wuninitialized -Wno-unused-parameter -Wredundant-decls -MT liboid40_static_la-oid40.lo -MD -MP -MF .deps/liboid40_static_la-oid40.Tpo -c oid40.c  -fPIC -DPIC -o .libs/liboid40_static_la-oid40.o
oid40.c:204: error: static declaration of 'oid40_plug' follows non-static declaration
oid40.h:33: error: previous declaration of 'oid40_plug' was here
make[4]: *** [liboid40_static_la-oid40.lo] Error 1
make[4]: Leaving directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/oid/oid40'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory `/avl/tmp/reiser4progs-1.0.4-1/plugin/oid'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/avl/tmp/reiser4progs-1.0.4-1/plugin'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/avl/tmp/reiser4progs-1.0.4-1'
make: *** [all] Error 2







HELP



