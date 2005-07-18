From: Lucas Clemente Vella <lvella@uai.com.br>
Subject: GCC 4.0.0
Date: Sun, 17 Jul 2005 22:06:27 -0300
Message-ID: <42DB0093.5000809@uai.com.br>
Reply-To: lvella@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25167-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I saw that the issue that reiser4progs-1.0.4 is not being compilled on 
Fedora 4 has already been discussed here.
I would like to know if any progress is being done about this, because 
it's not only a problem with Fedora 4, but a problem with GCC 4: I use 
GCC 4 on Slackware 10 (kernel 2.6.12.3) and I had a similar problem.

gcc -DHAVE_CONFIG_H -I. -I. -I../../.. -I../../../include -D_REENTRANT 
-D_FILE_OFFSET_BITS=64 -DENABLE_SYMLINKS -DENABLE_SPECIAL 
-DENABLE_R5_HASH -DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH 
-DENABLE_TEA_HASH -DENABLE_DEG_HASH -DENABLE_LARGE_KEYS 
-DENABLE_SHORT_KEYS -DENABLE_DOT_O_FIBRE -DENABLE_EXT_1_FIBRE 
-DENABLE_EXT_3_FIBRE -DENABLE_LEXIC_FIBRE -O3 -O3 -g0 -march=athlon-xp 
-mtune=athlon-xp -W -Wall -Wuninitialized -Wno-unused-parameter 
-Wredundant-decls -MT liboid40_static_la-oid40.lo -MD -MP -MF 
.deps/liboid40_static_la-oid40.Tpo -c oid40.c  -fPIC -DPIC -o 
.libs/liboid40_static_la-oid40.o
oid40.c:204: error: static declaration of 'oid40_plug' follows 
non-static declaration
oid40.h:33: error: previous declaration of 'oid40_plug' was here
make[4]: ** [liboid40_static_la-oid40.lo] Erro 1
make[4]: Leaving directory `/usr/src/reiser4progs-1.0.4/plugin/oid/oid40'
make[3]: ** [all-recursive] Erro 1
make[3]: Leaving directory `/usr/src/reiser4progs-1.0.4/plugin/oid'
make[2]: ** [all-recursive] Erro 1
make[2]: Leaving directory `/usr/src/reiser4progs-1.0.4/plugin'
make[1]: ** [all-recursive] Erro 1
make[1]: Leaving directory `/usr/src/reiser4progs-1.0.4'
make: ** [all] Erro 2

It will be necessary to install GCC 3 in order to compile 
reiser4progs-1.0.4?
-- 
Lucas Clemente Vella
lvella@gmail.com
