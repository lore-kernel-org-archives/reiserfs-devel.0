From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Reiser4progs-1.0.4-1 issues with gcc-4.0.1
Date: Fri, 05 Aug 2005 21:27:09 +0400
Message-ID: <42F3A16D.6090306@namesys.com>
References: <42F3A08A.30102@planet.nl>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090702040009070205000809"
Return-path: <reiserfs-list-return-25306-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F3A08A.30102@planet.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Stef van der Made <svdmade@planet.nl>
Cc: reiserfs-list@namesys.com

--------------090702040009070205000809
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello

Stef van der Made wrote:
> 
> Dear Sir / Madam,
> 
> I'm having an issue when compiling reiser4progs-1.0.4-1 using gcc-4.0.1. 
> The compiler spits out the following error but I'm afraid that I'm not 
> famaliar with C code or compilers.
> 
> I hope you can fix this issue.
> 
> gcc -DHAVE_CONFIG_H -I. -I. -I../../.. -I../../../include -D_REENTRANT 
> -D_FILE_OFFSET_BITS=64 -DENABLE_SYMLINKS -DENABLE_SPECIAL 
> -DENABLE_R5_HASH -DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH 
> -DENABLE_TEA_HASH -DENABLE_DEG_HASH -DENABLE_LARGE_KEYS 
> -DENABLE_SHORT_KEYS -DENABLE_DOT_O_FIBRE -DENABLE_EXT_1_FIBRE 
> -DENABLE_EXT_3_FIBRE -DENABLE_LEXIC_FIBRE -O3 -W -Wall -Wuninitialized 
> -Wno-unused-parameter -Wredundant-decls -MT liboid40_static_la-oid40.lo 
> -MD -MP -MF .deps/liboid40_static_la-oid40.Tpo -c oid40.c  -fPIC -DPIC 
> -o .libs/liboid40_static_la-oid40.o
> oid40.c:204: error: static declaration of 'oid40_plug' follows 
> non-static declaration
> oid40.h:33: error: previous declaration of 'oid40_plug' was here
> make[4]: *** [liboid40_static_la-oid40.lo] Error 1
> 
> 

pleas try the attached patch

> Best regards,
> 
> Stef
> 
> 


--------------090702040009070205000809
Content-Type: text/plain;
 name="reiser4progs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4progs.patch"

Id: 9cd3adfda4ed00816d05545fa28ddd45a636289a
tree a331c2ddc4cc0dbc376c4f1f055e0c82dd87a6ae
parent 4d6752ee8165ea27b03059c70f1ce16ecb9797cb
author namesys.com!vitaly <namesys.com!vitaly> 1119552435 +0000
committer namesys.com!vitaly <namesys.com!vitaly> 1119552435 +0000

(Logical change 1.4306)


======== diff against 4d6752ee8165ea27b03059c70f1ce16ecb9797cb ========
diff --git a/plugin/key/key_large/key_large.c b/plugin/key/key_large/key_large.c
--- a/plugin/key/key_large/key_large.c
+++ b/plugin/key/key_large/key_large.c
@@ -6,6 +6,8 @@
 #ifdef ENABLE_LARGE_KEYS
 #include "key_large.h"
 
+extern reiser4_plug_t key_large_plug;
+
 /* Returns minimal key */
 static reiser4_key_t *key_large_minimal(void) {
 	return key_common_minimal(&key_large_plug);
@@ -382,7 +384,7 @@ static reiser4_key_ops_t key_large_ops =
 	.get_name	= key_large_get_name
 };
 
-static reiser4_plug_t key_large_plug = {
+reiser4_plug_t key_large_plug = {
 	.cl    = class_init,
 	.id    = {KEY_LARGE_ID, 0, KEY_PLUG_TYPE},
 #ifndef ENABLE_MINIMAL
diff --git a/plugin/key/key_large/key_large.h b/plugin/key/key_large/key_large.h
--- a/plugin/key/key_large/key_large.h
+++ b/plugin/key/key_large/key_large.h
@@ -43,8 +43,6 @@ union key_large {
 
 typedef union key_large key_large_t;
 
-extern reiser4_plug_t key_large_plug;
-
 typedef enum {
 	/* Major locality occupies higher 60 bits of the first element */
 	KEY_LARGE_LOCALITY_MASK		= 0xfffffffffffffff0ull,
diff --git a/plugin/key/key_short/key_short.c b/plugin/key/key_short/key_short.c
--- a/plugin/key/key_short/key_short.c
+++ b/plugin/key/key_short/key_short.c
@@ -6,6 +6,8 @@
 #ifdef ENABLE_SHORT_KEYS
 #include "key_short.h"
 
+extern reiser4_plug_t key_short_plug;
+
 /* Returns minimal key */
 static reiser4_key_t *key_short_minimal(void) {
 	return key_common_minimal(&key_short_plug);
@@ -367,7 +369,7 @@ static reiser4_key_ops_t key_short_ops =
 	.get_name       = key_short_get_name
 };
 
-static reiser4_plug_t key_short_plug = {
+reiser4_plug_t key_short_plug = {
 	.cl    = class_init,
 	.id    = {KEY_SHORT_ID, 0, KEY_PLUG_TYPE},
 #ifndef ENABLE_MINIMAL
diff --git a/plugin/key/key_short/key_short.h b/plugin/key/key_short/key_short.h
--- a/plugin/key/key_short/key_short.h
+++ b/plugin/key/key_short/key_short.h
@@ -42,8 +42,6 @@ union key_short {
 
 typedef union key_short key_short_t;
 
-extern reiser4_plug_t key_short_plug;
-
 typedef enum {
 	/* Major locality occupies higher 60 bits of the first element */
 	KEY_SHORT_LOCALITY_MASK    = 0xfffffffffffffff0ull,
diff --git a/plugin/oid/oid40/oid40.c b/plugin/oid/oid40/oid40.c
--- a/plugin/oid/oid40/oid40.c
+++ b/plugin/oid/oid40/oid40.c
@@ -8,6 +8,8 @@
 #include "oid40.h"
 #include "oid40_repair.h"
 
+extern reiser4_plug_t oid40_plug;
+
 static uint32_t oid40_get_state(generic_entity_t *entity) {
 	aal_assert("umka-2088", entity != NULL);
 	return ((oid40_t *)entity)->state;
@@ -201,7 +203,7 @@ reiser4_oid_ops_t oid40_ops = {
 	.slink_locality = oid40_slink_locality
 };
 
-static reiser4_plug_t oid40_plug = {
+reiser4_plug_t oid40_plug = {
 	.cl    = class_init,
 	.id    = {OID_REISER40_ID, 0, OID_PLUG_TYPE},
 	.label = "oid40",
diff --git a/plugin/oid/oid40/oid40.h b/plugin/oid/oid40/oid40.h
--- a/plugin/oid/oid40/oid40.h
+++ b/plugin/oid/oid40/oid40.h
@@ -30,8 +30,6 @@ struct oid40 {
 
 typedef struct oid40 oid40_t;
 
-extern reiser4_plug_t oid40_plug;
-
 #define oid40_get_next(area)            LE64_TO_CPU(*((d64_t *)area))
 #define oid40_set_next(area, val)       (*((d64_t *)area) = CPU_TO_LE64(val))
 
======== end ========

Id: 65146bcee1fa04cf3976db38e2cf19c53ccfcac4
tree a331c2ddc4cc0dbc376c4f1f055e0c82dd87a6ae
parent 9cd3adfda4ed00816d05545fa28ddd45a636289a
author namesys.com!vitaly <namesys.com!vitaly> 1119552435 +0000
committer namesys.com!vitaly <namesys.com!vitaly> 1119552435 +0000

Merge vitaly@Thebsh:/home/bk/reiser4progs
into digger.namesys.com:/home/vitaly/stuff/work/bk/reiser4progs

2005/05/27 19:20:18+04:00 namesys.com!vitaly
variable declaration cleaups

BKrev: 42bb03b3fy7na4E3psnnaw48s2JAhA


======== diff against 9cd3adfda4ed00816d05545fa28ddd45a636289a ========
======== end ========


--------------090702040009070205000809--
