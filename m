From: "Domenico Andreoli" <cavok@libero.it>
Subject: reiser4progs: FTBFS (amd64/gcc-4.0): static declaration of 
	'oid40_plug' follows non-static declaration
Date: Mon,  3 Jan 2005 18:37:54 +0100
Message-ID: <I9R4Z6$9E09BAC9AD360C55DAC7A553E8E88CA2@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23030-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list <reiserfs-list@namesys.com>

hi all,

  i've just received the following bug report for reiser4progs=
 debian
package version 1.03-1.

is this a known problem? what about t=
he proposed patch?

thanks
domenico

ps: happy new year :)


----=
- Forwarded message from Andreas Jochens <aj@andaco.de> -----

Date: Mo=
n, 03 Jan 2005 17:55:02 +0100
From: Andreas Jochens <aj@andaco.de>
To: =
Debian Bug Tracking System <submit@bugs.debian.org>
Subject: Bug#288414:=
 reiser4progs: FTBFS (amd64/gcc-4.0): static declaration of
'oid40_plug'=
 follows non-static declaration

When building 'reiser4progs' on amd64 =
with gcc-4.0,
I get the following error:

 x86_64-linux-gcc -DHAVE_CON=
FIG_H -I. -I. -I../../.. -I../../../include
-D_REENTRANT -D_FILE_OFFSET_=
BITS=3Dno -DENABLE_SYMLINKS -DENABLE_SPECIAL
-DENABLE_R5_HASH -DENABLE_F=
NV1_HASH -DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH
-DENABLE_DEG_HASH -DENA=
BLE_LARGE_KEYS -DENABLE_SHORT_KEYS -DENABLE_DOT_O_FIBRE
-DENABLE_EXT_1_F=
IBRE -DENABLE_EXT_3_FIBRE -DENABLE_LEXIC_FIBRE -O3 -Wall -g -O2
-W -Wall=
 -Wuninitialized -Wno-unused-parameter -Wredundant-decls -MT
liboid40_st=
atic_la-oid40.lo -MD -MP -MF .deps/liboid40_static_la-oid40.Tpo -c
oid40=
.c -o liboid40_static_la-oid40.o
oid40.c:206: error: static declaration =
of 'oid40_plug' follows non-static
declaration
oid40.c:11: error: previ=
ous declaration of 'oid40_plug' was here
make[5]: *** [liboid40_static_l=
a-oid40.lo] Error 1
make[5]: Leaving directory `/reiser4progs-1.0.3/plug=
in/oid/oid40'

With the attached patch 'reiser4progs' can be compiled=0D
=
on amd64 using gcc-4.0.

Regards
Andreas Jochens

diff -urN ../tmp-o=
rig/reiser4progs-1.0.3/plugin/key/key_large/key_large.c
./plugin/key/key=
_large/key_large.c
--- ../tmp-orig/reiser4progs-1.0.3/plugin/key/key_lar=
ge/key_large.c    
2004-10-19 23:02:47.000000000 +0200
+++ ./plugin/key=
/key_large/key_large.c  2005-01-03 17:13:29.425846752 +0100
@@ -6,7 +6,7=
 @@
 #ifdef ENABLE_LARGE_KEYS
 #include "key_large.h"

-extern reiser=
4_plug_t key_large_plug;
+static reiser4_plug_t key_large_plug;

 /* R=
eturns minimal key */
 static reiser4_key_t *key_large_minimal(void) {=0D
=
diff -urN ../tmp-orig/reiser4progs-1.0.3/plugin/key/key_short/key_short.c=

./plugin/key/key_short/key_short.c
--- ../tmp-orig/reiser4progs-1.0.3/=
plugin/key/key_short/key_short.c    
2004-10-19 23:02:27.000000000 +0200=

+++ ./plugin/key/key_short/key_short.c  2005-01-03 17:13:12.000000000 +=
0100
@@ -6,7 +6,7 @@
 #ifdef ENABLE_SHORT_KEYS
 #include "key_short.h"=


-extern reiser4_plug_t key_short_plug;
+static reiser4_plug_t key_sh=
ort_plug;

 /* Returns minimal key */
 static reiser4_key_t *key_short=
_minimal(void) {
diff -urN ../tmp-orig/reiser4progs-1.0.3/plugin/oid/oid=
40/oid40.c
./plugin/oid/oid40/oid40.c
--- ../tmp-orig/reiser4progs-1.0.=
3/plugin/oid/oid40/oid40.c     2004-12-02
17:13:27.000000000 +0100
+++ =
./plugin/oid/oid40/oid40.c  2005-01-03 17:09:38.000000000 +0100
@@ -8,7 =
+8,7 @@
 #include "oid40.h"
 #include "oid40_repair.h"

-extern reise=
r4_plug_t oid40_plug;
+static reiser4_plug_t oid40_plug;

 static uint=
32_t oid40_get_state(generic_entity_t *entity) {
        aal_assert("umk=
a-2088", entity !=3D NULL);

----- End forwarded message -----

-----=
[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgk=
ey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
=0A=0A=
=0A=0A____________________________________________________________=0ALibe=
ro ADSL: 3 mesi gratis e navighi a 1.2 Mega. E poi hai l'Adsl senza limit=
i a meno di 1 euro al giorno. =0AAbbonati subito senza costi di attivazio=
ne su http://www.libero.it=0A=0A

