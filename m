From: Domenico Andreoli <cavok@tiscali.it>
Subject: reiser4progs: FTBFS (amd64/gcc-4.0): static declaration of 'oid40_plug' follows non-static declaration
Date: Mon, 3 Jan 2005 18:29:44 +0100
Message-ID: <20050103172944.GA24729@raptus.dandreoli.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23040-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Resent-Message-ID: <20050105094123.GA12477@raptus.dandreoli.com>
Resent-To: reiserfs-list@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: 288414@bugs.debian.org

hi all,

  i've just received the following bug report for reiser4progs debian
package version 1.03-1.

is this a known problem? what about the proposed patch?

thanks
domenico

ps: happy new year :)


----- Forwarded message from Andreas Jochens <aj@andaco.de> -----

Date: Mon, 03 Jan 2005 17:55:02 +0100
From: Andreas Jochens <aj@andaco.de>
To: Debian Bug Tracking System <submit@bugs.debian.org>
Subject: Bug#288414: reiser4progs: FTBFS (amd64/gcc-4.0): static declaration of 'oid40_plug' follows non-static declaration

When building 'reiser4progs' on amd64 with gcc-4.0,
I get the following error:

 x86_64-linux-gcc -DHAVE_CONFIG_H -I. -I. -I../../.. -I../../../include -D_REENTRANT -D_FILE_OFFSET_BITS=no -DENABLE_SYMLINKS -DENABLE_SPECIAL -DENABLE_R5_HASH -DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH -DENABLE_DEG_HASH -DENABLE_LARGE_KEYS -DENABLE_SHORT_KEYS -DENABLE_DOT_O_FIBRE -DENABLE_EXT_1_FIBRE -DENABLE_EXT_3_FIBRE -DENABLE_LEXIC_FIBRE -O3 -Wall -g -O2 -W -Wall -Wuninitialized -Wno-unused-parameter -Wredundant-decls -MT liboid40_static_la-oid40.lo -MD -MP -MF .deps/liboid40_static_la-oid40.Tpo -c oid40.c -o liboid40_static_la-oid40.o
oid40.c:206: error: static declaration of 'oid40_plug' follows non-static declaration
oid40.c:11: error: previous declaration of 'oid40_plug' was here
make[5]: *** [liboid40_static_la-oid40.lo] Error 1
make[5]: Leaving directory `/reiser4progs-1.0.3/plugin/oid/oid40'

With the attached patch 'reiser4progs' can be compiled
on amd64 using gcc-4.0.

Regards
Andreas Jochens

diff -urN ../tmp-orig/reiser4progs-1.0.3/plugin/key/key_large/key_large.c ./plugin/key/key_large/key_large.c
--- ../tmp-orig/reiser4progs-1.0.3/plugin/key/key_large/key_large.c	2004-10-19 23:02:47.000000000 +0200
+++ ./plugin/key/key_large/key_large.c	2005-01-03 17:13:29.425846752 +0100
@@ -6,7 +6,7 @@
 #ifdef ENABLE_LARGE_KEYS
 #include "key_large.h"
 
-extern reiser4_plug_t key_large_plug;
+static reiser4_plug_t key_large_plug;
 
 /* Returns minimal key */
 static reiser4_key_t *key_large_minimal(void) {
diff -urN ../tmp-orig/reiser4progs-1.0.3/plugin/key/key_short/key_short.c ./plugin/key/key_short/key_short.c
--- ../tmp-orig/reiser4progs-1.0.3/plugin/key/key_short/key_short.c	2004-10-19 23:02:27.000000000 +0200
+++ ./plugin/key/key_short/key_short.c	2005-01-03 17:13:12.000000000 +0100
@@ -6,7 +6,7 @@
 #ifdef ENABLE_SHORT_KEYS
 #include "key_short.h"
 
-extern reiser4_plug_t key_short_plug;
+static reiser4_plug_t key_short_plug;
 
 /* Returns minimal key */
 static reiser4_key_t *key_short_minimal(void) {
diff -urN ../tmp-orig/reiser4progs-1.0.3/plugin/oid/oid40/oid40.c ./plugin/oid/oid40/oid40.c
--- ../tmp-orig/reiser4progs-1.0.3/plugin/oid/oid40/oid40.c	2004-12-02 17:13:27.000000000 +0100
+++ ./plugin/oid/oid40/oid40.c	2005-01-03 17:09:38.000000000 +0100
@@ -8,7 +8,7 @@
 #include "oid40.h"
 #include "oid40_repair.h"
 
-extern reiser4_plug_t oid40_plug;
+static reiser4_plug_t oid40_plug;
 
 static uint32_t oid40_get_state(generic_entity_t *entity) {
 	aal_assert("umka-2088", entity != NULL);


----- End forwarded message -----


-----[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
