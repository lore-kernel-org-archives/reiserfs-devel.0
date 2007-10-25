From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 38/8] lock.h cleanup
Date: Thu, 25 Oct 2007 12:02:34 +0200
Message-ID: <1193306554.15901.10.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-CJO6Oj7ZPrVoVtl96D6m"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-CJO6Oj7ZPrVoVtl96D6m
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 4 errors, 2 warnings, 249 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.


--=-CJO6Oj7ZPrVoVtl96D6m
Content-Disposition: attachment; filename=lock.h.patch
Content-Type: text/x-patch; name=lock.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- lock.h.orig	2007-10-25 11:57:25.000000000 +0200
+++ lock.h	2007-10-25 12:01:06.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+ * reiser4/README */
 
 /* Long term locking data structures. See lock.c for details. */
 
@@ -67,10 +68,10 @@ static inline void spin_unlock_zlock(zlo
 #define lock_is_rlocked(lock)         ((lock)->nr_readers > 0)
 #define lock_is_wlocked(lock)         ((lock)->nr_readers < 0)
 #define lock_is_wlocked_once(lock)    ((lock)->nr_readers == -1)
-#define lock_can_be_rlocked(lock)     ((lock)->nr_readers >=0)
+#define lock_can_be_rlocked(lock)     ((lock)->nr_readers >= 0)
 #define lock_mode_compatible(lock, mode)				\
-             (((mode) == ZNODE_WRITE_LOCK && !lock_is_locked(lock)) ||	\
-              ((mode) == ZNODE_READ_LOCK && lock_can_be_rlocked(lock)))
+	      (((mode) == ZNODE_WRITE_LOCK && !lock_is_locked(lock)) ||	\
+	      ((mode) == ZNODE_READ_LOCK && lock_can_be_rlocked(lock)))
 
 /* Since we have R/W znode locks we need additional bidirectional `link'
    objects to implement n<->m relationship between lock owners and lock
@@ -187,8 +188,8 @@ extern void __reiser4_wake_up(lock_stack
 
 extern int lock_stack_isclean(lock_stack * owner);
 
-/* zlock object state check macros: only used in assertions.  Both forms imply that the
-   lock is held by the current thread. */
+/* zlock object state check macros: only used in assertions. Both forms imply
+   that the lock is held by the current thread. */
 extern int znode_is_write_locked(const znode *);
 extern void reiser4_invalidate_lock(lock_handle *);
 
@@ -198,7 +199,7 @@ extern void reiser4_invalidate_lock(lock
 	 LOCK_CNT_NIL(spin_locked_txnmgr) &&		\
 	 LOCK_CNT_NIL(spin_locked_inode) &&		\
 	 LOCK_CNT_NIL(rw_locked_cbk_cache) &&		\
-	 LOCK_CNT_NIL(spin_locked_super_eflush) )
+	 LOCK_CNT_NIL(spin_locked_super_eflush))
 
 static inline void spin_lock_stack(lock_stack *stack)
 {

--=-CJO6Oj7ZPrVoVtl96D6m--

