From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 37/8] lock.c cleanup
Date: Thu, 25 Oct 2007 11:56:37 +0200
Message-ID: <1193306197.15901.6.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-xPSuPcOtW/UII0LUivz2"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-xPSuPcOtW/UII0LUivz2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 7 errors, 20 warnings, 1232 lines checked
patched:total: 1 errors, 0 warnings, 1237 lines checked
leftover:

#624: FILE: lock.c:624:
+       rdelta = (readers > 0) ? -1 : +1;
                                      ^



--=-xPSuPcOtW/UII0LUivz2
Content-Disposition: attachment; filename=lock.c.patch
Content-Type: text/x-patch; name=lock.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- lock.c.orig	2007-10-25 11:44:23.000000000 +0200
+++ lock.c	2007-10-25 11:54:32.000000000 +0200
@@ -228,7 +228,7 @@
 #include <linux/spinlock.h>
 
 #if REISER4_DEBUG
-static int request_is_deadlock_safe(znode *, znode_lock_mode,
+static int request_is_deadlock_safe(znode * , znode_lock_mode,
 				    znode_lock_request);
 #endif
 
@@ -331,9 +331,8 @@ static void lock_object(lock_stack * own
 
 	link_object(request->handle, owner, node);
 
-	if (owner->curpri) {
+	if (owner->curpri)
 		node->lock.nr_hipri_owners++;
-	}
 }
 
 /* Check for recursive write locking */
@@ -369,9 +368,8 @@ int znode_is_any_locked(const znode * no
 	lock_stack *stack;
 	int ret;
 
-	if (!znode_is_locked(node)) {
+	if (!znode_is_locked(node))
 		return 0;
-	}
 
 	stack = get_current_lock_stack();
 
@@ -401,9 +399,8 @@ int znode_is_write_locked(const znode * 
 
 	assert("jmacd-8765", node != NULL);
 
-	if (!znode_is_wlocked(node)) {
+	if (!znode_is_wlocked(node))
 		return 0;
-	}
 
 	stack = get_current_lock_stack();
 
@@ -440,7 +437,7 @@ static int check_livelock_condition(znod
 	zlock * lock = &node->lock;
 
 	return mode == ZNODE_READ_LOCK &&
-		lock -> nr_readers >= 0 && lock->nr_hipri_write_requests > 0;
+		lock->nr_readers >= 0 && lock->nr_hipri_write_requests > 0;
 }
 
 /* checks lock/request compatibility */
@@ -459,7 +456,8 @@ static int can_lock_object(lock_stack * 
 	   priority owners. */
 	if (unlikely(!owner->curpri && check_deadlock_condition(node)))
 		return RETERR(-E_REPEAT);
-	if (unlikely(owner->curpri && check_livelock_condition(node, owner->request.mode)))
+	if (unlikely(owner->curpri &&
+		     check_livelock_condition(node, owner->request.mode)))
 		return RETERR(-E_REPEAT);
 	if (unlikely(!is_lock_compatible(node, owner->request.mode)))
 		return RETERR(-E_REPEAT);
@@ -481,7 +479,8 @@ static void set_high_priority(lock_stack
 		 *
 		 * (Interrupts also are not involved.)
 		 */
-		lock_handle *item = list_entry(owner->locks.next, lock_handle, locks_link);
+		lock_handle *item = list_entry(owner->locks.next, lock_handle,
+					       locks_link);
 		while (&owner->locks != &item->locks_link) {
 			znode *node = item->node;
 
@@ -495,7 +494,8 @@ static void set_high_priority(lock_stack
 			item->signaled = 0;
 			spin_unlock_zlock(&node->lock);
 
-			item = list_entry(item->locks_link.next, lock_handle, locks_link);
+			item = list_entry(item->locks_link.next, lock_handle,
+					  locks_link);
 		}
 		owner->curpri = 1;
 		atomic_set(&owner->nr_signaled, 0);
@@ -512,7 +512,8 @@ static void set_low_priority(lock_stack 
 		   actually current thread, and check whether we are reaching
 		   deadlock possibility anywhere.
 		 */
-		lock_handle *handle = list_entry(owner->locks.next, lock_handle, locks_link);
+		lock_handle *handle = list_entry(owner->locks.next, lock_handle,
+						 locks_link);
 		while (&owner->locks != &handle->locks_link) {
 			znode *node = handle->node;
 			spin_lock_zlock(&node->lock);
@@ -532,7 +533,8 @@ static void set_low_priority(lock_stack 
 				atomic_inc(&owner->nr_signaled);
 			}
 			spin_unlock_zlock(&node->lock);
-			handle = list_entry(handle->locks_link.next, lock_handle, locks_link);
+			handle = list_entry(handle->locks_link.next,
+					    lock_handle, locks_link);
 		}
 		owner->curpri = 0;
 	}
@@ -546,7 +548,7 @@ static void remove_lock_request(lock_sta
 		assert("nikita-1838", lock->nr_hipri_requests > 0);
 		lock->nr_hipri_requests--;
 		if (requestor->request.mode == ZNODE_WRITE_LOCK)
-			lock->nr_hipri_write_requests --;
+			lock->nr_hipri_write_requests--;
 	}
 	list_del(&requestor->requestors_link);
 }
@@ -557,7 +559,8 @@ static void invalidate_all_lock_requests
 
 	assert_spin_locked(&(node->lock.guard));
 
-	list_for_each_entry_safe(requestor, tmp, &node->lock.requestors, requestors_link) {
+	list_for_each_entry_safe(requestor, tmp, &node->lock.requestors,
+				 requestors_link) {
 		remove_lock_request(requestor);
 		requestor->request.ret_code = -EINVAL;
 		reiser4_wake_up(requestor);
@@ -571,7 +574,8 @@ static void dispatch_lock_requests(znode
 
 	assert_spin_locked(&(node->lock.guard));
 
-	list_for_each_entry_safe(requestor, tmp, &node->lock.requestors, requestors_link) {
+	list_for_each_entry_safe(requestor, tmp, &node->lock.requestors,
+				 requestors_link) {
 		if (znode_is_write_locked(node))
 			break;
 		if (!can_lock_object(requestor)) {
@@ -745,14 +749,15 @@ static int longterm_lock_tryfast(lock_st
 
 /* locks given lock object */
 int longterm_lock_znode(
-			       /* local link object (allocated by lock owner thread, usually on its own
-			        * stack) */
+			       /* local link object (allocated by lock owner
+				* thread, usually on its own stack) */
 			       lock_handle * handle,
 			       /* znode we want to lock. */
 			       znode * node,
 			       /* {ZNODE_READ_LOCK, ZNODE_WRITE_LOCK}; */
 			       znode_lock_mode mode,
-			       /* {0, -EINVAL, -E_DEADLOCK}, see return codes description. */
+			       /* {0, -EINVAL, -E_DEADLOCK}, see return codes
+				  description. */
 			       znode_lock_request request) {
 	int ret;
 	int hipri = (request & ZNODE_LOCK_HIPRI) != 0;
@@ -779,7 +784,7 @@ int longterm_lock_znode(
 	 * bug caused by d_splice_alias() only working for directories.
 	 */
 	assert("nikita-3547", 1 || ((current->flags & PF_MEMALLOC) == 0));
-	assert ("zam-1055", mode != ZNODE_NO_LOCK);
+	assert("zam-1055", mode != ZNODE_NO_LOCK);
 
 	cap_flags = 0;
 	if (request & ZNODE_LOCK_NONBLOCK) {
@@ -911,7 +916,8 @@ int longterm_lock_znode(
 			 */
 			spin_unlock_zlock(lock);
 			spin_lock_znode(node);
-			ret = reiser4_try_capture(ZJNODE(node), mode, cap_flags);
+			ret = reiser4_try_capture(ZJNODE(node), mode,
+						  cap_flags);
 			spin_unlock_znode(node);
 			spin_lock_zlock(lock);
 			if (unlikely(ret != 0)) {
@@ -947,7 +953,7 @@ int longterm_lock_znode(
 			   node */
 			lock->nr_hipri_requests++;
 			if (mode == ZNODE_WRITE_LOCK)
-				lock->nr_hipri_write_requests ++;
+				lock->nr_hipri_write_requests++;
 			/* If there are no high priority owners for a node,
 			   then immediately wake up low priority owners, so
 			   they can detect possible deadlock */
@@ -966,7 +972,7 @@ int longterm_lock_znode(
 		spin_lock_zlock(lock);
 		if (owner->request.mode == ZNODE_NO_LOCK) {
 			spin_unlock_zlock(lock);
-		request_is_done:
+request_is_done:
 			if (owner->request.ret_code == 0) {
 				LOCK_CNT_INC(long_term_locked_znode);
 				zref(node);
@@ -1031,8 +1037,8 @@ void reiser4_init_lock(zlock * lock	/* p
 	INIT_LIST_HEAD(&lock->owners);
 }
 
-/* Transfer a lock handle (presumably so that variables can be moved between stack and
-   heap locations). */
+/* Transfer a lock handle (presumably so that variables can be moved between
+   stack and heap locations). */
 static void
 move_lh_internal(lock_handle * new, lock_handle * old, int unlink_old)
 {
@@ -1058,12 +1064,10 @@ move_lh_internal(lock_handle * new, lock
 		} else {
 			node->lock.nr_readers -= 1;
 		}
-		if (signaled) {
+		if (signaled)
 			atomic_inc(&owner->nr_signaled);
-		}
-		if (owner->curpri) {
+		if (owner->curpri)
 			node->lock.nr_hipri_owners += 1;
-		}
 		LOCK_CNT_INC(long_term_locked_znode);
 
 		zref(node);
@@ -1084,15 +1088,16 @@ void copy_lh(lock_handle * new, lock_han
 	move_lh_internal(new, old, /*unlink_old */ 0);
 }
 
-/* after getting -E_DEADLOCK we unlock znodes until this function returns false */
+/* after getting -E_DEADLOCK we unlock znodes until this function returns false
+ */
 int reiser4_check_deadlock(void)
 {
 	lock_stack *owner = get_current_lock_stack();
 	return atomic_read(&owner->nr_signaled) != 0;
 }
 
-/* Before going to sleep we re-check "release lock" requests which might come from threads with hi-pri lock
-   priorities. */
+/* Before going to sleep we re-check "release lock" requests which might come
+   from threads with hi-pri lock priorities. */
 int reiser4_prepare_to_sleep(lock_stack * owner)
 {
 	assert("nikita-1847", owner == get_current_lock_stack());
@@ -1207,7 +1212,7 @@ request_is_deadlock_safe(znode * node, z
 
 /* return pointer to static storage with name of lock_mode. For
     debugging */
-const char *lock_mode_name(znode_lock_mode lock /* lock mode to get name of */ )
+const char *lock_mode_name(znode_lock_mode lock/* lock mode to get name of */)
 {
 	if (lock == ZNODE_READ_LOCK)
 		return "read";

--=-xPSuPcOtW/UII0LUivz2--

