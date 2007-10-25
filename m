From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 35/8] key.h cleanup
Date: Thu, 25 Oct 2007 02:03:02 +0200
Message-ID: <1193270582.24225.69.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-RbaxIDU2GDTjClKzA/wd"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-RbaxIDU2GDTjClKzA/wd
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 36 errors, 48 warnings, 384 lines checked
patched:total: 3 errors, 5 warnings, 392 lines checked
leftover:

WARNING: do not add new typedefs
#30: FILE: key.h:30:
+typedef enum {

WARNING: do not add new typedefs
#86: FILE: key.h:86:
+typedef enum {

This is false I think:

ERROR: need space after that ',' (ctx:VxB)
#91: FILE: key.h:91:
+       ON_LARGE_KEY(KEY_ORDERING_INDEX,)
                                       ^

WARNING: do not add new typedefs
#143: FILE: key.h:143:
+typedef enum {

ERROR: Macros with complex values should be enclosed in parenthesis
#171: FILE: key.h:171:
+static inline T get_key_ ## L(const reiser4_key *key)          \

WARNING: do not add new typedefs
#201: FILE: key.h:201:
+typedef __u64 oid_t;

WARNING: do not add new typedefs
#230: FILE: key.h:230:
+typedef enum { LESS_THAN = -1, /* if first key is less than second */

This is false I think:

ERROR: need consistent spacing around '+' (ctx:WxV)
#232: FILE: key.h:232:
+       GREATER_THAN = +1       /* if first key is greater than second
*/
                       ^



--=-RbaxIDU2GDTjClKzA/wd
Content-Disposition: attachment; filename=key.h.patch
Content-Type: text/x-patch; name=key.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- key.h.orig	2007-10-25 01:45:52.000000000 +0200
+++ key.h	2007-10-25 01:59:22.000000000 +0200
@@ -1,8 +1,9 @@
-/* Copyright 2000, 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2000, 2001, 2002, 2003 by Hans Reiser, licensing governed by
+ * reiser4/README */
 
 /* Declarations of key-related data-structures and operations on keys. */
 
-#if !defined( __REISER4_KEY_H__ )
+#if !defined(__REISER4_KEY_H__)
 #define __REISER4_KEY_H__
 
 #include "dformat.h"
@@ -15,13 +16,15 @@
 
 /* No access to any of these fields shall be done except via a
    wrapping macro/function, and that wrapping macro/function shall
-   convert to little endian order.  Compare keys will consider cpu byte order. */
+   convert to little endian order. Compare keys will consider cpu byte order. */
 
-/* A storage layer implementation difference between a regular unix file body and its attributes is in the typedef below
-   which causes all of the attributes of a file to be near in key to all of the other attributes for all of the files
-   within that directory, and not near to the file itself.  It is interesting to consider whether this is the wrong
-   approach, and whether there should be no difference at all. For current usage patterns this choice is probably the
-   right one.  */
+/* A storage layer implementation difference between a regular unix file body
+   and its attributes is in the typedef below which causes all of the attributes
+   of a file to be near in key to all of the other attributes for all of the
+   files within that directory, and not near to the file itself. It is
+   interesting to consider whether this is the wrong approach, and whether there
+   should be no difference at all. For current usage patterns this choice is
+   probably the right one.  */
 
 /* possible values for minor packing locality (4 bits required) */
 typedef enum {
@@ -37,16 +40,21 @@ typedef enum {
 	KEY_BODY_MINOR = 4,
 } key_minor_locality;
 
-/* everything stored in the tree has a unique key, which means that the tree is (logically) fully ordered by key.
-   Physical order is determined by dynamic heuristics that attempt to reflect key order when allocating available space,
-   and by the repacker.  It is stylistically better to put aggregation information into the key.  Thus, if you want to
-   segregate extents from tails, it is better to give them distinct minor packing localities rather than changing
-   block_alloc.c to check the node type when deciding where to allocate the node.
-
-   The need to randomly displace new directories and large files disturbs this symmetry unfortunately.  However, it
-   should be noted that this is a need that is not clearly established given the existence of a repacker.  Also, in our
-   current implementation tails have a different minor packing locality from extents, and no files have both extents and
-   tails, so maybe symmetry can be had without performance cost after all.  Symmetry is what we ship for now....
+/* Everything stored in the tree has a unique key, which means that the tree is
+   (logically) fully ordered by key. Physical order is determined by dynamic
+   heuristics that attempt to reflect key order when allocating available space,
+   and by the repacker. It is stylistically better to put aggregation
+   information into the key. Thus, if you want to segregate extents from tails,
+   it is better to give them distinct minor packing localities rather than
+   changing block_alloc.c to check the node type when deciding where to allocate
+   the node.
+
+   The need to randomly displace new directories and large files disturbs this
+   symmetry unfortunately. However, it should be noted that this is a need that
+   is not clearly established given the existence of a repacker. Also, in our
+   current implementation tails have a different minor packing locality from
+   extents, and no files have both extents and tails, so maybe symmetry can be
+   had without performance cost after all. Symmetry is what we ship for now....
 */
 
 /* Arbitrary major packing localities can be assigned to objects using
@@ -130,7 +138,8 @@ union reiser4_key {
 /* ordering is whole second element */
 #define KEY_ORDERING_MASK 0xffffffffffffffffull
 
-/* how many bits key element should be shifted to left to get particular field */
+/* how many bits key element should be shifted to left to get particular field
+ */
 typedef enum {
 	KEY_LOCALITY_SHIFT = 4,
 	KEY_TYPE_SHIFT = 0,
@@ -158,21 +167,21 @@ set_key_el(reiser4_key * key, reiser4_ke
 }
 
 /* macro to define getter and setter functions for field F with type T */
-#define DEFINE_KEY_FIELD( L, U, T )					\
-static inline T get_key_ ## L ( const reiser4_key *key )		\
+#define DEFINE_KEY_FIELD(L, U, T)					\
+static inline T get_key_ ## L(const reiser4_key *key)		\
 {									\
-	assert( "nikita-750", key != NULL );				\
-	return ( T ) ( get_key_el( key, KEY_ ## U ## _INDEX ) &		\
-		 KEY_ ## U ## _MASK ) >> KEY_ ## U ## _SHIFT;		\
+	assert("nikita-750", key != NULL);				\
+	return (T) (get_key_el(key, KEY_ ## U ## _INDEX) &		\
+		 KEY_ ## U ## _MASK) >> KEY_ ## U ## _SHIFT;		\
 }									\
 									\
-static inline void set_key_ ## L ( reiser4_key *key, T loc )		\
+static inline void set_key_ ## L(reiser4_key * key, T loc)		\
 {									\
 	__u64 el;							\
 									\
-	assert( "nikita-752", key != NULL );				\
+	assert("nikita-752", key != NULL);				\
 									\
-	el = get_key_el( key, KEY_ ## U ## _INDEX );			\
+	el = get_key_el(key, KEY_ ## U ## _INDEX);			\
 	/* clear field bits in the key */				\
 	el &= ~KEY_ ## U ## _MASK;					\
 	/* actually it should be					\
@@ -183,10 +192,10 @@ static inline void set_key_ ## L ( reise
 	   into field. Clearing extra bits is one operation, but this	\
 	   function is time-critical.					\
 	   But check this in assertion. */				\
-	assert( "nikita-759", ( ( loc << KEY_ ## U ## _SHIFT ) &	\
-		~KEY_ ## U ## _MASK ) == 0 );				\
-	el |= ( loc << KEY_ ## U ## _SHIFT );				\
-	set_key_el( key, KEY_ ## U ## _INDEX, el );			\
+	assert("nikita-759", ((loc << KEY_ ## U ## _SHIFT) &	\
+		~KEY_ ## U ## _MASK) == 0);				\
+	el |= (loc << KEY_ ## U ## _SHIFT);				\
+	set_key_el(key, KEY_ ## U ## _INDEX, el);			\
 }
 
 typedef __u64 oid_t;
@@ -230,34 +239,34 @@ extern const reiser4_key *reiser4_min_ke
 extern const reiser4_key *reiser4_max_key(void);
 
 /* helper macro for keycmp() */
-#define KEY_DIFF(k1, k2, field)							\
-({										\
-	typeof (get_key_ ## field (k1)) f1;                              	\
-	typeof (get_key_ ## field (k2)) f2;					\
-										\
-	f1 = get_key_ ## field (k1);						\
-	f2 = get_key_ ## field (k2);						\
-										\
-	(f1 < f2) ? LESS_THAN : ((f1 == f2) ? EQUAL_TO : GREATER_THAN);		\
+#define KEY_DIFF(k1, k2, field)						\
+({									\
+	typeof(get_key_ ## field(k1)) f1;                             \
+	typeof(get_key_ ## field(k2)) f2;				\
+									\
+	f1 = get_key_ ## field(k1);					\
+	f2 = get_key_ ## field(k2);					\
+									\
+	(f1 < f2) ? LESS_THAN : ((f1 == f2) ? EQUAL_TO : GREATER_THAN);	\
 })
 
 /* helper macro for keycmp() */
-#define KEY_DIFF_EL(k1, k2, off)						\
-({										\
-	__u64 e1;								\
-	__u64 e2;								\
-										\
-	e1 = get_key_el(k1, off);						\
-	e2 = get_key_el(k2, off);						\
-										\
-	(e1 < e2) ? LESS_THAN : ((e1 == e2) ? EQUAL_TO : GREATER_THAN);		\
+#define KEY_DIFF_EL(k1, k2, off)					\
+({									\
+	__u64 e1;							\
+	__u64 e2;							\
+									\
+	e1 = get_key_el(k1, off);					\
+	e2 = get_key_el(k2, off);					\
+									\
+	(e1 < e2) ? LESS_THAN : ((e1 == e2) ? EQUAL_TO : GREATER_THAN);	\
 })
 
 /* compare `k1' and `k2'.  This function is a heart of "key allocation
     policy". All you need to implement new policy is to add yet another
     clause here. */
 static inline cmp_t keycmp(const reiser4_key * k1 /* first key to compare */ ,
-			   const reiser4_key * k2 /* second key to compare */ )
+			   const reiser4_key * k2/* second key to compare */)
 {
 	cmp_t result;
 
@@ -287,9 +296,8 @@ static inline cmp_t keycmp(const reiser4
 			/* compare offset */
 			if (result == EQUAL_TO) {
 				result = KEY_DIFF_EL(k1, k2, 2);
-				if (REISER4_LARGE_KEY && result == EQUAL_TO) {
+				if (REISER4_LARGE_KEY && result == EQUAL_TO)
 					result = KEY_DIFF_EL(k1, k2, 3);
-				}
 			}
 		}
 	} else if (REISER4_3_5_KEY_ALLOCATION) {
@@ -309,7 +317,7 @@ static inline cmp_t keycmp(const reiser4
 
 /* true if @k1 equals @k2 */
 static inline int keyeq(const reiser4_key * k1 /* first key to compare */ ,
-			const reiser4_key * k2 /* second key to compare */ )
+			const reiser4_key * k2/* second key to compare */)
 {
 	assert("nikita-1879", k1 != NULL);
 	assert("nikita-1880", k2 != NULL);
@@ -318,7 +326,7 @@ static inline int keyeq(const reiser4_ke
 
 /* true if @k1 is less than @k2 */
 static inline int keylt(const reiser4_key * k1 /* first key to compare */ ,
-			const reiser4_key * k2 /* second key to compare */ )
+			const reiser4_key * k2/* second key to compare */)
 {
 	assert("nikita-1952", k1 != NULL);
 	assert("nikita-1953", k2 != NULL);
@@ -327,7 +335,7 @@ static inline int keylt(const reiser4_ke
 
 /* true if @k1 is less than or equal to @k2 */
 static inline int keyle(const reiser4_key * k1 /* first key to compare */ ,
-			const reiser4_key * k2 /* second key to compare */ )
+			const reiser4_key * k2/* second key to compare */)
 {
 	assert("nikita-1954", k1 != NULL);
 	assert("nikita-1955", k2 != NULL);
@@ -336,7 +344,7 @@ static inline int keyle(const reiser4_ke
 
 /* true if @k1 is greater than @k2 */
 static inline int keygt(const reiser4_key * k1 /* first key to compare */ ,
-			const reiser4_key * k2 /* second key to compare */ )
+			const reiser4_key * k2/* second key to compare */)
 {
 	assert("nikita-1959", k1 != NULL);
 	assert("nikita-1960", k2 != NULL);
@@ -345,7 +353,7 @@ static inline int keygt(const reiser4_ke
 
 /* true if @k1 is greater than or equal to @k2 */
 static inline int keyge(const reiser4_key * k1 /* first key to compare */ ,
-			const reiser4_key * k2 /* second key to compare */ )
+			const reiser4_key * k2/* second key to compare */)
 {
 	assert("nikita-1956", k1 != NULL);
 	assert("nikita-1957", k2 != NULL);	/* October  4: sputnik launched
@@ -360,14 +368,14 @@ static inline void prefetchkey(reiser4_k
 }
 
 /* (%Lx:%x:%Lx:%Lx:%Lx:%Lx) =
-           1 + 16 + 1 + 1 + 1 + 1 + 1 + 16 + 1 + 16 + 1 + 16 + 1 */
+	1 + 16 + 1 + 1 + 1 + 1 + 1 + 16 + 1 + 16 + 1 + 16 + 1 */
 /* size of a buffer suitable to hold human readable key representation */
 #define KEY_BUF_LEN (80)
 
 #if REISER4_DEBUG
 extern void reiser4_print_key(const char *prefix, const reiser4_key * key);
 #else
-#define reiser4_print_key(p,k) noop
+#define reiser4_print_key(p, k) noop
 #endif
 
 /* __FS_REISERFS_KEY_H__ */

--=-RbaxIDU2GDTjClKzA/wd--

