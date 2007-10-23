From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 1/8] as_ops.c cleanup
Date: Tue, 23 Oct 2007 14:08:03 +0200
Message-ID: <1193141283.6236.27.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-vx9z/1/LMyBoWEEP9l6Q"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org


--=-vx9z/1/LMyBoWEEP9l6Q
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- as_ops.c.orig	2007-10-23 11:50:14.000000000 +0200
+++ as_ops.c	2007-10-23 11:52:21.000000000 +0200
@@ -169,7 +169,7 @@ void reiser4_invalidatepage(struct page 
 
 	node = jprivate(page);
 	spin_lock_jnode(node);
-	if (!(node->state & ((1 << JNODE_DIRTY) | (1<< JNODE_FLUSH_QUEUED) |
+	if (!(node->state & ((1 << JNODE_DIRTY) | (1 << JNODE_FLUSH_QUEUED) |
 			  (1 << JNODE_WRITEBACK) | (1 << JNODE_OVRWR)))) {
 		/* there is not need to capture */
 		jref(node);
@@ -211,7 +211,7 @@ void reiser4_invalidatepage(struct page 
 
 /* help function called from reiser4_releasepage(). It returns true if
jnode
  * can be detached from its page and page released. */
-int jnode_is_releasable(jnode * node /* node to check */ )
+int jnode_is_releasable(jnode * node/* node to check */)
 {
 	assert("nikita-2781", node != NULL);
 	assert_spin_locked(&(node->guard));
@@ -219,9 +219,8 @@ int jnode_is_releasable(jnode * node /* 
 
 	/* is some thread is currently using jnode page, later cannot be
 	 * detached */
-	if (atomic_read(&node->d_count) != 0) {
+	if (atomic_read(&node->d_count) != 0)
 		return 0;
-	}
 
 	assert("vs-1214", !jnode_is_loaded(node));
 

--=-vx9z/1/LMyBoWEEP9l6Q
Content-Disposition: attachment; filename=as_ops.c.patch
Content-Type: text/x-patch; name=as_ops.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- as_ops.c.orig	2007-10-23 11:50:14.000000000 +0200
+++ as_ops.c	2007-10-23 11:52:21.000000000 +0200
@@ -169,7 +169,7 @@ void reiser4_invalidatepage(struct page 
 
 	node = jprivate(page);
 	spin_lock_jnode(node);
-	if (!(node->state & ((1 << JNODE_DIRTY) | (1<< JNODE_FLUSH_QUEUED) |
+	if (!(node->state & ((1 << JNODE_DIRTY) | (1 << JNODE_FLUSH_QUEUED) |
 			  (1 << JNODE_WRITEBACK) | (1 << JNODE_OVRWR)))) {
 		/* there is not need to capture */
 		jref(node);
@@ -211,7 +211,7 @@ void reiser4_invalidatepage(struct page 
 
 /* help function called from reiser4_releasepage(). It returns true if jnode
  * can be detached from its page and page released. */
-int jnode_is_releasable(jnode * node /* node to check */ )
+int jnode_is_releasable(jnode * node/* node to check */)
 {
 	assert("nikita-2781", node != NULL);
 	assert_spin_locked(&(node->guard));
@@ -219,9 +219,8 @@ int jnode_is_releasable(jnode * node /* 
 
 	/* is some thread is currently using jnode page, later cannot be
 	 * detached */
-	if (atomic_read(&node->d_count) != 0) {
+	if (atomic_read(&node->d_count) != 0)
 		return 0;
-	}
 
 	assert("vs-1214", !jnode_is_loaded(node));
 

--=-vx9z/1/LMyBoWEEP9l6Q--

