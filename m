From: "mailinglists@d-g-c.de" <mailinglists@d-g-c.de>
Subject: Re: Reiser4fs and SPARC64?
Date: Mon, 21 Feb 2005 13:34:40 +0100
Message-ID: <4219D560.9090904@d-g-c.de>
References: <421347FD.6000204@d-g-c.de> <20050216140944.GZ7482@backtop.namesys.com> <200502161724.16258.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502161724.16258.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Vitaly Fertman wrote:

>On Wednesday 16 February 2005 17:09, Alex Zarochentsev wrote:
>  
>
>>On Wed, Feb 16, 2005 at 02:17:49PM +0100, mailinglists@d-g-c.de wrote:
>>    
>>
>>>Hi,
>>>
>>>i just wondered about reiser4fs working on SPARC64? I use Gentoo Sparc64
>>>and it is working fine with kernel 2.4.28. But is the Reiser4 code
>>>SPARC64 ready?
>>>      
>>>
>>It would be nice if you try it :) we have no reiser4/sparc64 reports yet.
>>
>>Reiser4 code is included into AKPM's -mm kernels.  mkfs and other utils are
>>in the ftp://ftp.namesys.com/pub/reiser4progs/
>>
>>At least 3 additional patches are needed for running reiser4 on sparc64.
>>They not yet included into -mm kernels.  I am attaching them to this
>>e-mail.
>>    
>>
>
>and at least these 2 patches needs to applied also.
>
>  
>
>------------------------------------------------------------------------
>
>diff -rup libaal-1.0.3/include/aal/Makefile.am libaal-1.0.3-1/include/aal/Makefile.am
>--- libaal-1.0.3/include/aal/Makefile.am	2004-01-08 15:49:40.000000000 +0100
>+++ libaal-1.0.3-1/include/aal/Makefile.am	2005-01-16 22:18:51.000000000 +0100
>@@ -2,4 +2,4 @@ aalincludedir		= $(includedir)/aal
> 
> aalinclude_HEADERS   	= libaal.h device.h file.h exception.h list.h malloc.h \
> 			  print.h string.h math.h endian.h debug.h bitops.h \
>-                          gauge.h block.h ui.h stream.h hash.h types.h
>+                          gauge.h block.h ui.h stream.h hash.h types.h unaligned.h
>diff -rup libaal-1.0.3/include/aal/Makefile.in libaal-1.0.3-1/include/aal/Makefile.in
>--- libaal-1.0.3/include/aal/Makefile.in	2004-12-06 19:04:14.000000000 +0100
>+++ libaal-1.0.3-1/include/aal/Makefile.in	2005-01-16 15:24:49.000000000 +0100
>@@ -146,7 +146,7 @@ aalincludedir = $(includedir)/aal
> 
> aalinclude_HEADERS = libaal.h device.h file.h exception.h list.h malloc.h \
> 			  print.h string.h math.h endian.h debug.h bitops.h \
>-                          gauge.h block.h ui.h stream.h hash.h types.h
>+                          gauge.h block.h ui.h stream.h hash.h types.h unaligned.h
> 
> subdir = include/aal
> ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
>diff -rup libaal-1.0.3/include/aal/endian.h libaal-1.0.3-1/include/aal/endian.h
>--- libaal-1.0.3/include/aal/endian.h	2003-07-27 10:55:29.000000000 +0200
>+++ libaal-1.0.3-1/include/aal/endian.h	2005-01-16 22:29:19.000000000 +0100
>@@ -75,8 +75,8 @@
> 
> #endif
> 
>-#define aal_get_leXX(xx, p, field)	(LE##xx##_TO_CPU ((p)->field))
>-#define aal_set_leXX(xx, p, field, val)	((p)->field = CPU_TO_LE##xx(val))
>+#define aal_get_leXX(xx, p, field)	(LE##xx##_TO_CPU (get_unaligned(&(p)->field)))
>+#define aal_set_leXX(xx, p, field, val)	put_unaligned(&(p)->field, CPU_TO_LE##xx(val))
> 
> #define aal_get_le16(p, field) 		aal_get_leXX(16, p, field)
> #define aal_set_le16(p, field, val) 	aal_set_leXX(16, p, field, val)
>diff -rup libaal-1.0.3/include/aal/libaal.h libaal-1.0.3-1/include/aal/libaal.h
>--- libaal-1.0.3/include/aal/libaal.h	2004-09-22 14:27:23.000000000 +0200
>+++ libaal-1.0.3-1/include/aal/libaal.h	2005-01-16 22:18:51.000000000 +0100
>@@ -26,6 +26,7 @@ extern "C" {
> #include "math.h"
> #include "bitops.h"
> #include "endian.h"
>+#include "unaligned.h"
> #include "debug.h"
> #include "gauge.h"
> #include "block.h"
>diff -rup libaal-1.0.3/include/aal/unaligned.h libaal-1.0.3-1/include/aal/unaligned.h
>--- libaal-1.0.3/include/aal/unaligned.h	2005-01-16 23:09:05.000000000 +0100
>+++ libaal-1.0.3-1/include/aal/unaligned.h	2005-01-16 22:18:51.000000000 +0100
>@@ -0,0 +1,26 @@
>+/* Copyright (C) 2001-2005 by Hans Reiser, licensing governed by libaal/COPYING.
>+         
>+   unaligned.h -- libaal unalignment declaration. */
>+
>+#ifdef HAVE_CONFIG_H
>+#  include <config.h>
>+#endif
>+
>+#ifndef AAL_UNALIGNED_H
>+#define AAL_UNALIGNED_H
>+
>+#define get_unaligned(ptr)				\
>+({							\
>+	__typeof__(*(ptr)) __tmp;			\
>+	aal_memcpy(&__tmp, (ptr), sizeof(*(ptr)));	\
>+	__tmp;						\
>+})
>+
>+#define put_unaligned(ptr, val)				\
>+({							\
>+	__typeof__(*(ptr)) __tmp = (val);		\
>+	aal_memcpy((ptr), &__tmp, sizeof(*(ptr)));	\
>+	(void)0;					\
>+})
>+
>+#endif
>  
>
>------------------------------------------------------------------------
>
>diff -rup reiser4progs-1.0.3/plugin/item/cde40/cde40.h reiser4progs-1.0.3-1/plugin/item/cde40/cde40.h
>--- reiser4progs-1.0.3/plugin/item/cde40/cde40.h	2004-06-30 01:42:33.000000000 +0200
>+++ reiser4progs-1.0.3-1/plugin/item/cde40/cde40.h	2005-01-16 22:57:58.000000000 +0100
>@@ -33,6 +33,7 @@ struct objid3 {
> 
> typedef struct objid3 objid3_t;
> 
>+
> struct hash3 {
> 	d8_t objectid[8];
> 	d8_t offset[8];
>@@ -130,71 +131,76 @@ extern uint32_t cde40_cut(reiser4_place_
> extern uint16_t cde40_overhead();
> 
> #if defined(ENABLE_SHORT_KEYS) && defined(ENABLE_LARGE_KEYS)
>+
>+/* objidN_t macroses. */
>+#define ob_loc(ob, pol)							\
>+	((pol == 3) ?							\
>+	 ((objid3_t *)(ob))->locality :					\
>+	 ((objid4_t *)(ob))->locality)
>+ 
> #define ob_get_locality(ob, pol)					\
>-        ((pol == 3) ?							\
>-	 LE64_TO_CPU(*((d64_t *)((objid3_t *)(ob))->locality)) :	\
>-	 LE64_TO_CPU(*((d64_t *)((objid4_t *)(ob))->locality)))
>+	LE64_TO_CPU(get_unaligned((d64_t *)ob_loc(ob, pol)))
> 
> #define ob_set_locality(ob, val, pol)					\
>-        ((pol == 3) ?							\
>-	 (*(d64_t *)((objid3_t *)(ob))->locality) = CPU_TO_LE64(val) :	\
>-	 (*(d64_t *)((objid4_t *)(ob))->locality) = CPU_TO_LE64(val))
>+	put_unaligned((d64_t *)ob_loc(ob, pol), CPU_TO_LE64(val))
>+
>+#define ob_oid(ob, pol)							\
>+	((pol == 3) ?							\
>+	 ((objid3_t *)(ob))->objectid :					\
>+	 ((objid4_t *)(ob))->objectid)
> 
> #define ob_get_objectid(ob, pol)					\
>-        ((pol == 3) ?							\
>-	 LE64_TO_CPU(*((d64_t *)((objid3_t *)(ob))->objectid)) :	\
>-	 LE64_TO_CPU(*((d64_t *)((objid4_t *)(ob))->objectid)))
>+	LE64_TO_CPU(get_unaligned((d64_t *)ob_oid(ob, pol)))
> 
> #define ob_set_objectid(ob, val, pol)					\
>-        ({if (pol == 3)							\
>-	 (*(d64_t *)((objid3_t *)(ob))->objectid) = CPU_TO_LE64(val);	\
>-         else								\
>-	 (*(d64_t *)((objid4_t *)(ob))->objectid) = CPU_TO_LE64(val);})
>+	put_unaligned((d64_t *)ob_oid(ob, pol), CPU_TO_LE64(val))
>+
>+#define ob_ord(ob, pol) ((pol == 3) ? 0 : ((objid4_t *)(ob))->ordering)
> 
> #define ob_get_ordering(ob, pol)					\
>-        ((pol == 3) ? 0 :						\
>-	 LE64_TO_CPU(*((d64_t *)((objid4_t *)(ob))->ordering)))
>+	LE64_TO_CPU(get_unaligned((d64_t *)ob_ord(ob, pol)))
> 
> #define ob_set_ordering(ob, val, pol)					\
>-        ({if (pol == 3) do {} while(0); else				\
>-	 (*(d64_t *)((objid4_t *)(ob))->ordering) = CPU_TO_LE64(val);})
>+	({if (pol == 3) do {} while(0); else				\
>+	 put_unaligned((d64_t *)ob_ord(ob, pol), CPU_TO_LE64(val));})
> 
>-#define ob_size(pol)							\
>-        ((pol == 3) ? sizeof(objid3_t) : sizeof(objid4_t))
>+#define ob_size(pol) ((pol == 3) ? sizeof(objid3_t) : sizeof(objid4_t))
>+
>+/* hashN_t macroses.  */
>+#define ha_oid(ha, pol)							\
>+	((pol == 3) ?							\
>+	 ((hash3_t *)(ha))->objectid :					\
>+	 ((hash4_t *)(ha))->objectid)
> 
> #define ha_get_objectid(ha, pol)					\
>-        ((pol == 3) ?							\
>-	 LE64_TO_CPU(*((d64_t *)((hash3_t *)(ha))->objectid)) :		\
>-	 LE64_TO_CPU(*((d64_t *)((hash4_t *)(ha))->objectid)))
>+	LE64_TO_CPU(get_unaligned((d64_t *)ha_oid(ha, pol)))
> 
> #define ha_set_objectid(ha, val, pol)					\
>-        ({if (pol == 3)							\
>-         (*(d64_t *)((hash3_t *)(ha))->objectid) = CPU_TO_LE64(val);	\
>-	 else								\
>-	 (*(d64_t *)((hash4_t *)(ha))->objectid) = CPU_TO_LE64(val);})
>+	put_unaligned((d64_t *)ha_oid(ha, pol),  CPU_TO_LE64(val))
>+
>+#define ha_off(ha, pol)							\
>+	((pol == 3) ?							\
>+	 ((hash3_t *)(ha))->offset :					\
>+	 ((hash4_t *)(ha))->offset)
> 
> #define ha_get_offset(ha, pol)						\
>-        ((pol == 3) ?							\
>-         LE64_TO_CPU(*((d64_t *)((hash3_t *)(ha))->offset)) :		\
>-	 LE64_TO_CPU(*((d64_t *)((hash4_t *)(ha))->offset)))
>-	 
>+	LE64_TO_CPU(get_unaligned((d64_t *)ha_off(ha, pol)))
>+
> #define ha_set_offset(ha, val, pol)					\
>-        ({if (pol == 3)							\
>-        (*(d64_t *)((hash3_t *)(ha))->offset) = CPU_TO_LE64(val);	\
>-        else								\
>-        (*(d64_t *)((hash4_t *)(ha))->offset) = CPU_TO_LE64(val);})
>+	put_unaligned((d64_t *)ha_off(ha, pol), CPU_TO_LE64(val))
>+
>+#define ha_ord(ha, pol) ((pol == 3) ? 0 : ((hash4_t *)(ha))->ordering)
> 
> #define ha_get_ordering(ha, pol)					\
>-        ((pol == 3) ? 0 :						\
>-	 LE64_TO_CPU(*((d64_t *)((hash4_t *)(ha))->ordering)))
>-	 
>+	LE64_TO_CPU(get_unaligned((d64_t *)ha_ord(ha, pol)))
>+
> #define ha_set_ordering(ha, val, pol)					\
>-        ({if (pol == 3) do {} while(0); else				\
>-        (*(d64_t *)((hash4_t *)(ha))->ordering) = CPU_TO_LE64(val);})
>+	({if (pol == 3) do {} while(0); else				\
>+	 put_unaligned((d64_t *)ha_ord(ha, pol), CPU_TO_LE64(val));})
> 
>-#define ha_size(pol)							\
>-        ((pol == 3) ? sizeof(hash3_t) : sizeof(hash4_t))
>+#define ha_size(pol) ((pol == 3) ? sizeof(hash3_t) : sizeof(hash4_t))
> 
>+/* entryN_t macroses */
> #define en_get_offset(en, pol)						\
>         ((pol == 3) ?							\
> 	 aal_get_le16(((entry3_t *)(en)), offset) :			\
>@@ -214,97 +220,108 @@ extern uint16_t cde40_overhead();
> 	 (void *)(&((cde403_t *)(pl)->body)->entry[pos]) :		\
> 	 (void *)(&((cde404_t *)(pl)->body)->entry[pos]))
> 
>-#else
>-#if defined(ENABLE_SHORT_KEYS)
>+#elif defined(ENABLE_SHORT_KEYS)
>+
>+/* objidN_t macroses.  */
> #define ob_get_locality(ob, pol)					\
>-	 LE64_TO_CPU(*((d64_t *)((objid3_t *)(ob))->locality))
>+	LE64_TO_CPU(get_unaligned((d64_t *)((objid3_t *)(ob))->locality))
> 
> #define ob_set_locality(ob, val, pol)					\
>-	 (*(d64_t *)((objid3_t *)(ob))->locality) = CPU_TO_LE64(val)
>+	put_unaligned((d64_t *)((objid3_t *)(ob))->locality,		\
>+		      CPU_TO_LE64(val))
> 
> #define ob_get_objectid(ob, pol)					\
>-	 LE64_TO_CPU(*((d64_t *)((objid3_t *)(ob))->objectid))
>+	LE64_TO_CPU(get_unaligned((d64_t *)((objid3_t *)(ob))->objectid))
> 
> #define ob_set_objectid(ob, val, pol)					\
>-	 (*(d64_t *)((objid3_t *)(ob))->objectid) = CPU_TO_LE64(val)
>+	put_unaligned((d64_t *)((objid3_t *)(ob))->objectid,		\
>+		      CPU_TO_LE64(val))
> 
> #define ob_get_ordering(ob, pol) (0)
> #define ob_set_ordering(ob, val, pol) do {} while(0)
> 
>-#define ob_size(pol)							\
>-        (sizeof(objid3_t))
>+#define ob_size(pol) (sizeof(objid3_t))
> 
>+/* hashN_t macroses.  */
> #define ha_get_objectid(ha, pol)					\
>-	 LE64_TO_CPU(*((d64_t *)((hash3_t *)(ha))->objectid))
>+	LE64_TO_CPU(get_unaligned((d64_t *)((hash3_t *)(ha))->objectid))
> 
> #define ha_set_objectid(ha, val, pol)					\
>-         (*(d64_t *)((hash3_t *)(ha))->objectid) = CPU_TO_LE64(val)
>+	put_unaligned((d64_t *)((hash3_t *)(ha))->objectid,		\
>+		      CPU_TO_LE64(val))
> 
> #define ha_get_offset(ha, pol)						\
>-         LE64_TO_CPU(*((d64_t *)((hash3_t *)(ha))->offset))
>-	 
>+	LE64_TO_CPU(get_unaligned((d64_t *)((hash3_t *)(ha))->offset))
>+
> #define ha_set_offset(ha, val, pol)					\
>-        (*(d64_t *)((hash3_t *)(ha))->offset) = CPU_TO_LE64(val)
>+	put_unaligned((d64_t *)((hash3_t *)(ha))->offset,		\
>+		      CPU_TO_LE64(val))
> 
> #define ha_get_ordering(ha, pol) (0)
> #define ha_set_ordering(ha, val, pol) do {} while (0)
> 
>-#define ha_size(pol)							\
>-        (sizeof(hash3_t))
>+#define ha_size(pol) (sizeof(hash3_t))
> 
>+/* entryN_t macroses */
> #define en_get_offset(en, pol)						\
> 	 aal_get_le16(((entry3_t *)(en)), offset)
> 
> #define en_set_offset(en, val, pol)					\
>          aal_set_le16(((entry3_t *)(en)), offset, val)
> 
>-#define en_size(pol)							\
>-        (sizeof(entry3_t))
>+#define en_size(pol) (sizeof(entry3_t))
> 
> #define cde_get_entry(pl, pos, pol)					\
> 	 ((void *)(&((cde403_t *)pl->body)->entry[pos]))
>-#else
>+
>+#elif defined(ENABLE_LARGE_KEYS)
>+/* objidN_t macroses. */
> #define ob_get_locality(ob, pol)					\
>-	 LE64_TO_CPU(*((d64_t *)((objid4_t *)(ob))->locality))
>+	LE64_TO_CPU(get_unaligned((d64_t *)((objid4_t *)(ob))->locality))
> 
> #define ob_set_locality(ob, val, pol)					\
>-	 (*(d64_t *)((objid4_t *)(ob))->locality) = CPU_TO_LE64(val)
>+	put_unaligned((d64_t *)((objid4_t *)(ob))->locality,		\
>+		      CPU_TO_LE64(val))
> 
> #define ob_get_objectid(ob, pol)					\
>-	 LE64_TO_CPU(*((d64_t *)((objid4_t *)(ob))->objectid))
>+	LE64_TO_CPU(get_unaligned((d64_t *)((objid4_t *)(ob))->objectid))
> 
> #define ob_set_objectid(ob, val, pol)					\
>-	 (*(d64_t *)((objid4_t *)(ob))->objectid) = CPU_TO_LE64(val)
>+	put_unaligned((d64_t *)((objid4_t *)(ob))->objectid,		\
>+		      CPU_TO_LE64(val))
> 
> #define ob_get_ordering(ob, pol)					\
>-	 LE64_TO_CPU(*((d64_t *)((objid4_t *)(ob))->ordering))
>+	LE64_TO_CPU(get_unaligned((d64_t *)((objid4_t *)(ob))->ordering))
> 
> #define ob_set_ordering(ob, val, pol)					\
>-	 (*(d64_t *)((objid4_t *)(ob))->ordering) = CPU_TO_LE64(val)
>+	put_unaligned((d64_t *)((objid4_t *)(ob))->ordering,		\
>+		      CPU_TO_LE64(val))
> 
>-#define ob_size(pol)							\
>-        (sizeof(objid4_t))
>+#define ob_size(pol) (sizeof(objid4_t))
> 
>+/* hashN_t macroses.  */
> #define ha_get_objectid(ha, pol)					\
>-	 LE64_TO_CPU(*((d64_t *)((hash4_t *)(ha))->objectid))
>+	LE64_TO_CPU(get_unaligned((d64_t *)((hash4_t *)(ha))->objectid))
> 
> #define ha_set_objectid(ha, val, pol)					\
>-         (*(d64_t *)((hash4_t *)(ha))->objectid) = CPU_TO_LE64(val)
>+	put_unaligned((d64_t *)((hash4_t *)(ha))->objectid,		\
>+		      CPU_TO_LE64(val))
> 
> #define ha_get_offset(ha, pol)						\
>-         LE64_TO_CPU(*((d64_t *)((hash4_t *)(ha))->offset))
>+	LE64_TO_CPU(get_unaligned((d64_t *)((hash4_t *)(ha))->offset))
> 	 
> #define ha_set_offset(ha, val, pol)					\
>-        (*(d64_t *)((hash4_t *)(ha))->offset) = CPU_TO_LE64(val)
>+	put_unaligned((d64_t *)((hash4_t *)(ha))->offset,		\
>+		      CPU_TO_LE64(val))
> 
> #define ha_get_ordering(ha, pol)					\
>-         LE64_TO_CPU(*((d64_t *)((hash4_t *)(ha))->ordering))
>+	LE64_TO_CPU(get_unaligned((d64_t *)((hash4_t *)(ha))->ordering))
> 
> #define ha_set_ordering(ha, val, pol)					\
>-        (*(d64_t *)((hash4_t *)(ha))->ordering) = CPU_TO_LE64(val)
>+	put_unaligned((d64_t *)((hash4_t *)(ha))->ordering,		\
>+		      CPU_TO_LE64(val))
> 
>-#define ha_size(pol)							\
>-        (sizeof(hash4_t))
>+#define ha_size(pol) (sizeof(hash4_t))
> 
> #define en_get_offset(en, pol)						\
> 	 aal_get_le16(((entry4_t *)(en)), offset)
>@@ -312,13 +329,11 @@ extern uint16_t cde40_overhead();
> #define en_set_offset(en, val, pol)					\
>          aal_set_le16(((entry4_t *)(en)), offset, val)
> 
>-#define en_size(pol)							\
>-        (sizeof(entry4_t))
>+#define en_size(pol) (sizeof(entry4_t))
> 
> #define cde_get_entry(pl, pos, pol)					\
> 	 ((void *)(&((cde404_t *)pl->body)->entry[pos]))
> #endif
>-#endif
> 
> #define cde_get_units(pl)						\
>         aal_get_le16(((cde40_t *)pl->body), units)
>diff -rup reiser4progs-1.0.3/plugin/key/key_large/key_large.h reiser4progs-1.0.3-1/plugin/key/key_large/key_large.h
>--- reiser4progs-1.0.3/plugin/key/key_large/key_large.h	2004-09-22 14:35:47.000000000 +0200
>+++ reiser4progs-1.0.3-1/plugin/key/key_large/key_large.h	2005-01-16 22:57:58.000000000 +0100
>@@ -120,14 +120,14 @@ extern uint64_t key_large_get_fobjectid(
> static inline uint64_t kl_get_el(const key_large_t *key,
> 				 key_large_field_t off)
> {
>-	return LE64_TO_CPU(key->el[off]);
>+	return LE64_TO_CPU(get_unaligned(key->el + off));
> }
> 
> static inline void kl_set_el(key_large_t *key,
> 			     key_large_field_t off,
> 			     uint64_t value)
> {
>-	key->el[off] = CPU_TO_LE64(value);
>+	put_unaligned(key->el + off, CPU_TO_LE64(value));
> }
> 
> static inline int kl_comp_el(void *k1, void *k2, int off) {
>diff -rup reiser4progs-1.0.3/plugin/key/key_short/key_short.h reiser4progs-1.0.3-1/plugin/key/key_short/key_short.h
>--- reiser4progs-1.0.3/plugin/key/key_short/key_short.h	2004-09-22 14:35:54.000000000 +0200
>+++ reiser4progs-1.0.3-1/plugin/key/key_short/key_short.h	2005-01-16 22:57:58.000000000 +0100
>@@ -108,14 +108,14 @@ extern uint64_t key_short_get_fobjectid(
> static inline uint64_t ks_get_el(const key_short_t *key,
> 				 key_short_field_t off)
> {
>-	return LE64_TO_CPU(key->el[off]);
>+	return LE64_TO_CPU(get_unaligned(key->el + off));
> }
> 
> static inline void ks_set_el(key_short_t *key,
> 			     key_short_field_t off,
> 			     uint64_t value)
> {
>-	key->el[off] = CPU_TO_LE64(value);
>+	put_unaligned(key->el + off, CPU_TO_LE64(value));
> }
> 
> static inline int ks_comp_el(void *k1, void *k2, int off) {
>diff -rup reiser4progs-1.0.3/plugin/sdext/sdext_plug/sdext_plug.h reiser4progs-1.0.3-1/plugin/sdext/sdext_plug/sdext_plug.h
>--- reiser4progs-1.0.3/plugin/sdext/sdext_plug/sdext_plug.h	2004-06-03 22:00:12.000000000 +0200
>+++ reiser4progs-1.0.3-1/plugin/sdext/sdext_plug/sdext_plug.h	2005-01-16 22:57:58.000000000 +0100
>@@ -27,14 +27,14 @@ typedef struct sdext_plug sdext_plug_t;
> 
> extern reiser4_core_t *sdext_plug_core;
> 
>-#define sdext_plug_get_count(ext)		aal_get_le16(ext, count)
>-#define sdext_plug_set_count(ext, val)		aal_set_le16(ext, count, val)
>+#define sdext_plug_get_count(ext)		aal_get_le16((ext), count)
>+#define sdext_plug_set_count(ext, val)		aal_set_le16((ext), count, (val))
> 
>-#define sdext_plug_get_member(ext, n)		aal_get_le16(&(ext->slot[n]), member)
>-#define sdext_plug_set_member(ext, n, val)	aal_set_le16(&(ext->slot[n]), member, val)
>+#define sdext_plug_get_member(ext, n)		aal_get_le16(&((ext)->slot[n]), member)
>+#define sdext_plug_set_member(ext, n, val)	aal_set_le16(&((ext)->slot[n]), member, (val))
> 
>-#define sdext_plug_get_pid(ext, n)		aal_get_le16(&(ext->slot[n]), plug)
>-#define sdext_plug_set_pid(ext, n, val)		aal_set_le16(&(ext->slot[n]), plug, val)
>+#define sdext_plug_get_pid(ext, n)		aal_get_le16(&((ext)->slot[n]), plug)
>+#define sdext_plug_set_pid(ext, n, val)		aal_set_le16(&((ext)->slot[n]), plug, (val))
> 
> extern uint32_t sdext_plug_length(stat_entity_t *stat, void *hint);
> 
>  
>
libaal-1.0.4.tar.gz compiled fine without any patches.
but reiser4progs-1.0.4 did not (also no patches!):

creating libaux-minimal.la
(cd .libs && rm -f libaux-minimal.la && ln -s ../libaux-minimal.la 
libaux-minimal.la)
make[2]: Leaving directory `/usr/src/reiser4progs-1.0.4/libaux'
Making all in plugin
make[2]: Entering directory `/usr/src/reiser4progs-1.0.4/plugin'
Making all in format
make[3]: Entering directory `/usr/src/reiser4progs-1.0.4/plugin/format'
Making all in format40
make[4]: Entering directory 
`/usr/src/reiser4progs-1.0.4/plugin/format/format40'
if /bin/sh ../../../libtool --mode=compile gcc -DHAVE_CONFIG_H -I. -I. 
-I../../.. -I../../../include   -D_REENTRANT -D_FILE_OFFSET_BITS=64 
-DENABLE_SYMLINKS -DENABLE_SPECIAL -DENABLE_R5_HASH -DENABLE_FNV1_HASH 
-DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH -DENABLE_DEG_HASH 
-DENABLE_LARGE_KEYS -DENABLE_SHORT_KEYS -DENABLE_DOT_O_FIBRE 
-DENABLE_EXT_1_FIBRE -DENABLE_EXT_3_FIBRE -DENABLE_LEXIC_FIBRE -O3 -W 
-Wall -Wuninitialized -Wno-unused-parameter -Wredundant-decls -MT 
libformat40_static_la-format40.lo -MD -MP -MF 
".deps/libformat40_static_la-format40.Tpo" \
  -c -o libformat40_static_la-format40.lo `test -f 'format40.c' || echo 
'./'`format40.c; \
then mv -f ".deps/libformat40_static_la-format40.Tpo" 
".deps/libformat40_static_la-format40.Plo"; \
else rm -f ".deps/libformat40_static_la-format40.Tpo"; exit 1; \
fi
mkdir .libs
 gcc -DHAVE_CONFIG_H -I. -I. -I../../.. -I../../../include -D_REENTRANT 
-D_FILE_OFFSET_BITS=64 -DENABLE_SYMLINKS -DENABLE_SPECIAL 
-DENABLE_R5_HASH -DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH 
-DENABLE_TEA_HASH -DENABLE_DEG_HASH -DENABLE_LARGE_KEYS 
-DENABLE_SHORT_KEYS -DENABLE_DOT_O_FIBRE -DENABLE_EXT_1_FIBRE 
-DENABLE_EXT_3_FIBRE -DENABLE_LEXIC_FIBRE -O3 -W -Wall -Wuninitialized 
-Wno-unused-parameter -Wredundant-decls -MT 
libformat40_static_la-format40.lo -MD -MP -MF 
.deps/libformat40_static_la-format40.Tpo -c format40.c  -fPIC -DPIC -o 
.libs/libformat40_static_la-format40.o
format40.c: In function `format40_create':
format40.c:255: error: invalid type argument of `unary *'
format40.c:255: warning: type defaults to `int' in declaration of `__tmp'
format40.c:255: warning: initialization makes integer from pointer 
without a cast
format40.c:255: error: invalid type argument of `unary *'
format40.c:260: error: invalid type argument of `unary *'
format40.c:260: warning: type defaults to `int' in declaration of `__tmp'
format40.c:260: warning: initialization makes integer from pointer 
without a cast
format40.c:260: error: invalid type argument of `unary *'
format40.c:260: warning: passing arg 1 of `aal_memcpy' makes pointer 
from integer without a cast
format40.c:263: error: invalid type argument of `unary *'
format40.c:263: warning: type defaults to `int' in declaration of `__tmp'
format40.c:263: warning: initialization makes integer from pointer 
without a cast
format40.c:263: error: invalid type argument of `unary *'
format40.c:263: warning: passing arg 1 of `aal_memcpy' makes pointer 
from integer without a cast
format40.c:268: error: invalid type argument of `unary *'
format40.c:268: warning: type defaults to `int' in declaration of `__tmp'
format40.c:268: warning: initialization makes integer from pointer 
without a cast
format40.c:268: error: invalid type argument of `unary *'
format40.c:268: warning: passing arg 1 of `aal_memcpy' makes pointer 
from integer without a cast
format40.c:271: error: invalid type argument of `unary *'
format40.c:271: warning: type defaults to `int' in declaration of `__tmp'
format40.c:271: warning: initialization makes integer from pointer 
without a cast
format40.c:271: error: invalid type argument of `unary *'
format40.c:271: warning: passing arg 1 of `aal_memcpy' makes pointer 
from integer without a cast
format40.c:276: error: invalid type argument of `unary *'
format40.c:276: warning: type defaults to `int' in declaration of `__tmp'
format40.c:276: warning: initialization makes integer from pointer 
without a cast
format40.c:276: error: invalid type argument of `unary *'
format40.c:276: warning: passing arg 1 of `aal_memcpy' makes pointer 
from integer without a cast
format40.c:280: error: invalid type argument of `unary *'
format40.c:280: warning: type defaults to `int' in declaration of `__tmp'
format40.c:280: warning: initialization makes integer from pointer 
without a cast
format40.c:280: error: invalid type argument of `unary *'
format40.c:280: warning: passing arg 1 of `aal_memcpy' makes pointer 
from integer without a cast
format40.c: In function `format40_set_root':
format40.c:380: error: invalid type argument of `unary *'
format40.c:380: warning: type defaults to `int' in declaration of `__tmp'
format40.c:380: warning: initialization makes integer from pointer 
without a cast
format40.c:380: error: invalid type argument of `unary *'
format40.c:380: warning: passing arg 1 of `aal_memcpy' makes pointer 
from integer without a cast
format40.c: In function `format40_set_len':
format40.c:387: error: invalid type argument of `unary *'
format40.c:387: warning: type defaults to `int' in declaration of `__tmp'
format40.c:387: warning: initialization makes integer from pointer 
without a cast
format40.c:387: error: invalid type argument of `unary *'
format40.c:387: warning: passing arg 1 of `aal_memcpy' makes pointer 
from integer without a cast
format40.c: In function `format40_set_free':
format40.c:397: error: invalid type argument of `unary *'
format40.c:397: warning: type defaults to `int' in declaration of `__tmp'
format40.c:397: warning: initialization makes integer from pointer 
without a cast
format40.c:397: error: invalid type argument of `unary *'
format40.c:397: warning: passing arg 1 of `aal_memcpy' makes pointer 
from integer without a cast
format40.c: In function `format40_set_height':
format40.c:404: error: invalid type argument of `unary *'
format40.c:404: warning: type defaults to `int' in declaration of `__tmp'
format40.c:404: warning: initialization makes integer from pointer 
without a cast
format40.c:404: error: invalid type argument of `unary *'
format40.c:404: warning: passing arg 1 of `aal_memcpy' makes pointer 
from integer without a cast
format40.c: In function `format40_set_stamp':
format40.c:411: error: invalid type argument of `unary *'
format40.c:411: warning: type defaults to `int' in declaration of `__tmp'
format40.c:411: warning: initialization makes integer from pointer 
without a cast
format40.c:411: error: invalid type argument of `unary *'
format40.c:411: warning: passing arg 1 of `aal_memcpy' makes pointer 
from integer without a cast
format40.c: In function `format40_set_policy':
format40.c:418: error: invalid type argument of `unary *'
format40.c:418: warning: type defaults to `int' in declaration of `__tmp'
format40.c:418: warning: initialization makes integer from pointer 
without a cast
format40.c:418: error: invalid type argument of `unary *'
format40.c:418: warning: passing arg 1 of `aal_memcpy' makes pointer 
from integer without a cast
format40.c: In function `format40_set_key':
format40.c:430: error: invalid type argument of `unary *'
format40.c:430: warning: type defaults to `int' in declaration of `__tmp'
format40.c:430: warning: initialization makes integer from pointer 
without a cast
format40.c:430: error: invalid type argument of `unary *'
format40.c:430: warning: passing arg 1 of `aal_memcpy' makes pointer 
from integer without a cast
make[4]: *** [libformat40_static_la-format40.lo] Error 1
make[4]: Leaving directory 
`/usr/src/reiser4progs-1.0.4/plugin/format/format40'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory `/usr/src/reiser4progs-1.0.4/plugin/format'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/usr/src/reiser4progs-1.0.4/plugin'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/usr/src/reiser4progs-1.0.4'
make: *** [all] Error 2

