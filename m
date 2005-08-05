From: Stef van der Made <svdmade@planet.nl>
Subject: Reiser4progs-1.0.4-1 issues with gcc-4.0.1
Date: Fri, 05 Aug 2005 19:23:22 +0200
Message-ID: <42F3A08A.30102@planet.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-25305-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com


Dear Sir / Madam,

I'm having an issue when compiling reiser4progs-1.0.4-1 using gcc-4.0.1. 
The compiler spits out the following error but I'm afraid that I'm not 
famaliar with C code or compilers.

I hope you can fix this issue.

 gcc -DHAVE_CONFIG_H -I. -I. -I../../.. -I../../../include -D_REENTRANT 
-D_FILE_OFFSET_BITS=64 -DENABLE_SYMLINKS -DENABLE_SPECIAL 
-DENABLE_R5_HASH -DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH 
-DENABLE_TEA_HASH -DENABLE_DEG_HASH -DENABLE_LARGE_KEYS 
-DENABLE_SHORT_KEYS -DENABLE_DOT_O_FIBRE -DENABLE_EXT_1_FIBRE 
-DENABLE_EXT_3_FIBRE -DENABLE_LEXIC_FIBRE -O3 -W -Wall -Wuninitialized 
-Wno-unused-parameter -Wredundant-decls -MT liboid40_static_la-oid40.lo 
-MD -MP -MF .deps/liboid40_static_la-oid40.Tpo -c oid40.c  -fPIC -DPIC 
-o .libs/liboid40_static_la-oid40.o
oid40.c:204: error: static declaration of 'oid40_plug' follows 
non-static declaration
oid40.h:33: error: previous declaration of 'oid40_plug' was here
make[4]: *** [liboid40_static_la-oid40.lo] Error 1


Best regards,

Stef
