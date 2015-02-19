From: <doiggl@velocitynet.com.au>
Subject: help wanted add-node41.patch fails to apply to reiser4progs version 1.0.9
Date: Thu, 19 Feb 2015 23:02:53 +1100
Message-ID: <a6ad8c02cd6dcddc95b2d7e25d42f35c@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
- I tried a build of reiser4progs with add-node41.patch and it fails.
Help wanted to get it to compile.
--Glenn

spec shows:
==========

Patch0: add-node41.patch
.
.
%patch0 -p1

The build log shows:
===================

[   63s] checking for libaal-minimal version = 1.0.6... yes
.
.
[   73s] make[3]: Entering directory
`/home/abuild/rpmbuild/BUILD/reiser4progs-1.0.9/progs/mkfs'
[   73s] gcc -DHAVE_CONFIG_H -I. -I../.. -I../../include   -D_REENTRANT
-D_FILE_OFFSET_BITS=64 -DENABLE_SYMLINKS -DENABLE_SPECIAL -DENABLE_R5_HASH
-DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH
-DENABLE_DEG_HASH -DENABLE_LARGE_KEYS -DENABLE_SHORT_KEYS
-DENABLE_DOT_O_FIBRE -DENABLE_EXT_1_FIBRE -DENABLE_EXT_3_FIBRE
-DENABLE_LEXIC_FIBRE -O3 -fmessage-length=0 -grecord-gcc-switches
-fstack-protector -O2 -Wall -D_FORTIFY_SOURCE=2 -funwind-tables
-fasynchronous-unwind-tables -g -W -Wall -Wuninitialized
-Wno-unused-parameter -Wredundant-decls -c -o mkfs_reiser4-mkfs.o `test -f
'mkfs.c' || echo './'`mkfs.c
[   73s] mkfs.c: In function 'main':
[   73s] mkfs.c:210:5: warning: pointer targets in passing argument 2 of
'uuid_parse' differ in signedness [-Wpointer-sign]
[   73s]      if (uuid_parse(optarg, hint.uuid) < 0) {
[   73s]      ^
[   73s] In file included from mkfs.c:11:0:
[   73s] /usr/include/uuid/uuid.h:88:5: note: expected 'unsigned char *'
but argument is of type 'char *'
[   73s]  int uuid_parse(const char *in, uuid_t uu);
[   73s]      ^
[   73s] mkfs.c:409:3: warning: pointer targets in passing argument 1 of
'uuid_is_null' differ in signedness [-Wpointer-sign]
[   73s]    if (uuid_is_null(hint.uuid)) {
[   73s]    ^
[   73s] In file included from mkfs.c:11:0:
[   73s] /usr/include/uuid/uuid.h:85:5: note: expected 'const unsigned
char *' but argument is of type 'char *'
[   73s]  int uuid_is_null(const uuid_t uu);
[   73s]      ^
[   73s] mkfs.c:410:4: warning: pointer targets in passing argument 1 of
'uuid_generate' differ in signedness [-Wpointer-sign]
[   73s]     uuid_generate(hint.uuid);
[   73s]     ^
[   73s] In file included from mkfs.c:11:0:
[   73s] /usr/include/uuid/uuid.h:79:6: note: expected 'unsigned char *'
but argument is of type 'char *'
[   73s]  void uuid_generate(uuid_t out);
[   73s]       ^
[   73s] mkfs.c:416:4: warning: pointer targets in passing argument 1 of
'uuid_unparse' differ in signedness [-Wpointer-sign]
[   73s]     uuid_unparse(hint.uuid, uuid);
[   73s]     ^
[   73s] In file included from mkfs.c:11:0:
[   73s] /usr/include/uuid/uuid.h:91:6: note: expected 'const unsigned
char *' but argument is of type 'char *'
[   73s]  void uuid_unparse(const uuid_t uu, char *out);
[   73s]       ^
[   74s] /bin/sh ../../libtool  --tag=CC   --mode=link gcc -D_REENTRANT
-D_FILE_OFFSET_BITS=64 -DENABLE_SYMLINKS -DENABLE_SPECIAL -DENABLE_R5_HASH
-DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH
-DENABLE_DEG_HASH -DENABLE_LARGE_KEYS -DENABLE_SHORT_KEYS
-DENABLE_DOT_O_FIBRE -DENABLE_EXT_1_FIBRE -DENABLE_EXT_3_FIBRE
-DENABLE_LEXIC_FIBRE -O3 -fmessage-length=0 -grecord-gcc-switches
-fstack-protector -O2 -Wall -D_FORTIFY_SOURCE=2 -funwind-tables
-fasynchronous-unwind-tables -g -W -Wall -Wuninitialized
-Wno-unused-parameter -Wredundant-decls   -o mkfs.reiser4
mkfs_reiser4-mkfs.o ../../libreiser4/libreiser4.la ../../libmisc/libmisc.la
-lreadline  -lncurses  
[   74s] libtool: link: gcc -D_REENTRANT -D_FILE_OFFSET_BITS=64
-DENABLE_SYMLINKS -DENABLE_SPECIAL -DENABLE_R5_HASH -DENABLE_FNV1_HASH
-DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH -DENABLE_DEG_HASH
-DENABLE_LARGE_KEYS -DENABLE_SHORT_KEYS -DENABLE_DOT_O_FIBRE
-DENABLE_EXT_1_FIBRE -DENABLE_EXT_3_FIBRE -DENABLE_LEXIC_FIBRE -O3
-fmessage-length=0 -grecord-gcc-switches -fstack-protector -O2 -Wall
-D_FORTIFY_SOURCE=2 -funwind-tables -fasynchronous-unwind-tables -g -W
-Wall -Wuninitialized -Wno-unused-parameter -Wredundant-decls -o
.libs/mkfs.reiser4 mkfs_reiser4-mkfs.o 
../../libreiser4/.libs/libreiser4.so ../../libmisc/.libs/libmisc.a -laal
-luuid -lreadline -lncurses
[   74s] ../../libreiser4/.libs/libreiser4.so: undefined reference to
`node41_plug'
[   74s] collect2: error: ld returned 1 exit status
[   74s] make[3]: *** [mkfs.reiser4] Error 1
[   74s] make[3]: Leaving directory
`/home/abuild/rpmbuild/BUILD/reiser4progs-1.0.9/progs/mkfs'
[   74s] make[2]: *** [all-recursive] Error 1
[   74s] make[2]: Leaving directory
`/home/abuild/rpmbuild/BUILD/reiser4progs-1.0.9/progs'
[   74s] make[1]: *** [all-recursive] Error 1
[   74s] make[1]: Leaving directory
`/home/abuild/rpmbuild/BUILD/reiser4progs-1.0.9'
[   74s] make: *** [all] Error 2
[   74s] error: Bad exit status from /var/tmp/rpm-tmp.knziYl (%build)
[   74s] 


-The full [long] log is at:
https://build.opensuse.org/build/home:doiggl/openSUSE_13.1/x86_64/reiser4progs/_log

- spec file is at:
https://build.opensuse.org/package/view_file/home:doiggl/reiser4progs/reiser4progs.spec?expand=1

- project: 
https://build.opensuse.org/package/show/home:doiggl/reiser4progs

