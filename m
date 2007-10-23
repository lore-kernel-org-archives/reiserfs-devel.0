From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 14/8] debug.h cleanup
Date: Tue, 23 Oct 2007 16:03:15 +0200
Message-ID: <1193148195.6236.69.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- debug.h.orig	2007-10-23 15:52:33.000000000 +0200
+++ debug.h	2007-10-23 16:01:40.000000000 +0200
@@ -1,8 +1,9 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 /* Declarations of debug macros. */
 
-#if !defined( __FS_REISER4_DEBUG_H__ )
+#if !defined(__FS_REISER4_DEBUG_H__)
 #define __FS_REISER4_DEBUG_H__
 
 #include "forward.h"
@@ -37,9 +38,9 @@
     in 3.x journal.c. If cassertion fails you get compiler error,
     so no "maintainer-id".
 */
-#define cassert(cond) ({ switch(-1) { case (cond): case 0: break; } })
+#define cassert(cond) ({ switch (-1) { case (cond): case 0: break; } })
 
-#define noop   do {;} while(0)
+#define noop   do {; } while (0)
 
 #if REISER4_DEBUG
 /* version of info that only actually prints anything when _d_ebugging
@@ -48,38 +49,38 @@
 /* macro to catch logical errors. Put it into `default' clause of
     switch() statement. */
 #define impossible(label, format, ...) 			\
-         reiser4_panic(label, "impossible: " format , ## __VA_ARGS__)
+	reiser4_panic(label, "impossible: " format , ## __VA_ARGS__)
 /* assert assures that @cond is true. If it is not, reiser4_panic() is
    called. Use this for checking logical consistency and _never_ call
    this to check correctness of external data: disk blocks and
user-input . */
-#define assert(label, cond)							\
-({										\
-	/* call_on_each_assert(); */						\
-	if (cond) {								\
-		/* put negated check to avoid using !(cond) that would lose	\
-		 * warnings for things like assert(a = b); */			\
-		;								\
-	} else {								\
-		DEBUGON(1);							\
-		reiser4_panic(label, "assertion failed: %s", #cond);		\
-	}									\
+#define assert(label, cond)						\
+({									\
+	/* call_on_each_assert(); */					\
+	if (cond) {							\
+		/* put negated check to avoid using !(cond) that would lose \
+		 * warnings for things like assert(a = b); */		\
+		;							\
+	} else {							\
+		DEBUGON(1);						\
+		reiser4_panic(label, "assertion failed: %s", #cond);	\
+	}								\
 })
 
 /* like assertion, but @expr is evaluated even if REISER4_DEBUG is off.
*/
-#define check_me( label, expr )	assert( label, ( expr ) )
+#define check_me(label, expr)	assert(label, (expr))
 
-#define ON_DEBUG( exp ) exp
+#define ON_DEBUG(exp) exp
 
 extern int reiser4_schedulable(void);
 extern void call_on_each_assert(void);
 
 #else
 
-#define dinfo( format, args... ) noop
-#define impossible( label, format, args... ) noop
-#define assert( label, cond ) noop
-#define check_me( label, expr )	( ( void ) ( expr ) )
-#define ON_DEBUG( exp )
+#define dinfo(format, args...) noop
+#define impossible(label, format, args...) noop
+#define assert(label, cond) noop
+#define check_me(label, expr)	((void) (expr))
+#define ON_DEBUG(exp)
 #define reiser4_schedulable() might_sleep()
 
 /* REISER4_DEBUG */
@@ -157,7 +158,7 @@ typedef struct reiser4_lock_cnt_info {
 #define LOCK_CNT_DEC(counter) noop
 #define LOCK_CNT_NIL(counter) (1)
 #define LOCK_CNT_GTZ(counter) (1)
-#define LOCK_CNT_LT(counter,n) (1)
+#define LOCK_CNT_LT(counter, n) (1)
 
 #endif				/* REISER4_DEBUG */
 
@@ -190,35 +191,35 @@ extern int is_in_reiser4_context(void);
  * evaluate expression @e only if with reiser4 context
  */
 #define ON_CONTEXT(e)	do {			\
-	if(is_in_reiser4_context()) {		\
+	if (is_in_reiser4_context()) {		\
 		e;				\
-	} } while(0)
+	} } while (0)
 
 /*
  * evaluate expression @e only when within reiser4_context and
debugging is
  * on.
  */
-#define ON_DEBUG_CONTEXT( e ) ON_DEBUG( ON_CONTEXT( e ) )
+#define ON_DEBUG_CONTEXT(e) ON_DEBUG(ON_CONTEXT(e))
 
 /*
  * complain about unexpected function result and crash. Used in
"default"
  * branches of switch statements and alike to assert that invalid
results are
  * not silently ignored.
  */
-#define wrong_return_value( label, function )				\
-	impossible( label, "wrong return value from " function )
+#define wrong_return_value(label, function)				\
+	impossible(label, "wrong return value from " function)
 
 /* Issue different types of reiser4 messages to the console */
-#define warning( label, format, ... )					\
-	DCALL( KERN_WARNING, 						\
-	       printk, 1, label, "WARNING: " format , ## __VA_ARGS__ )
-#define notice( label, format, ... )					\
-	DCALL( KERN_NOTICE, 						\
-	       printk, 1, label, "NOTICE: " format , ## __VA_ARGS__ )
+#define warning(label, format, ...)					\
+	DCALL(KERN_WARNING, 						\
+	       printk, 1, label, "WARNING: " format , ## __VA_ARGS__)
+#define notice(label, format, ...)					\
+	DCALL(KERN_NOTICE, 						\
+	       printk, 1, label, "NOTICE: " format , ## __VA_ARGS__)
 
 /* mark not yet implemented functionality */
-#define not_yet( label, format, ... )				\
-	reiser4_panic( label, "NOT YET IMPLEMENTED: " format , ##
__VA_ARGS__ )
+#define not_yet(label, format, ...)				\
+	reiser4_panic(label, "NOT YET IMPLEMENTED: " format , ## __VA_ARGS__)
 
 extern void reiser4_do_panic(const char *format, ...)
     __attribute__ ((noreturn, format(printf, 1, 2)));

