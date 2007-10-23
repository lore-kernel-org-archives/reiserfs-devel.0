From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH] replace wake_up() with wake_up_process()
Date: Tue, 23 Oct 2007 20:46:18 +0200
Message-ID: <1193165178.12551.3.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-hBe46oYUCEtJ7Htwgr/T"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-hBe46oYUCEtJ7Htwgr/T
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

As in point 6. in todo list (http://pub.namesys.com/Reiser4/ToDo ) try
to replace wake_up() with wake_up_process()

Patch is untested and against reiser4-for-2.6.22-2 patch

Good day

Dushan



--=-hBe46oYUCEtJ7Htwgr/T
Content-Disposition: attachment; filename=wakeup.patch
Content-Type: text/x-patch; name=wakeup.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- reiser4-for-2.6.22-2.patch.orig	2007-10-22 23:01:21.000000000 +0200
+++ reiser4-for-2.6.22-2-1.patch	2007-10-23 20:39:37.000000000 +0200
@@ -9313,7 +9313,7 @@ diff -urN linux-2.6.22.orig/fs/reiser4/e
 +#endif
 +	spin_unlock(&ent->guard);
 +	if (wake_up_ent)
-+		wake_up(&ent->wait);
++		wake_up_process(&ent->wait);
 +}
 +
 +#define ENTD_CAPTURE_APAGE_BURST SWAP_CLUSTER_MAX
@@ -9399,7 +9399,7 @@ diff -urN linux-2.6.22.orig/fs/reiser4/e
 +	ent->nr_todo_reqs++;
 +	list_add_tail(&rq.link, &ent->todo_list);
 +	if (ent->nr_todo_reqs == 1)
-+		wake_up(&ent->wait);
++		wake_up_process(&ent->wait);
 +
 +	spin_unlock(&ent->guard);
 +
@@ -14835,7 +14835,7 @@ diff -urN linux-2.6.22.orig/fs/reiser4/f
 +		/* If all write requests registered in this "fq" are done we up
 +		 * the waiter. */
 +		if (atomic_sub_and_test(bio->bi_vcnt, &fq->nr_submitted))
-+			wake_up(&fq->wait);
++			wake_up_process(&fq->wait);
 +	}
 +
 +	bio_put(bio);
@@ -22457,7 +22457,7 @@ diff -urN linux-2.6.22.orig/fs/reiser4/k
 +{
 +	assert("nikita-3234", mgr != NULL);
 +	assert("nikita-3235", mgr->daemon != NULL);
-+	wake_up(&mgr->daemon->wait);
++	wake_up_process(&mgr->daemon->wait);
 +}
 +
 +int is_current_ktxnmgrd(void)
@@ -23683,7 +23683,7 @@ diff -urN linux-2.6.22.orig/fs/reiser4/l
 +void __reiser4_wake_up(lock_stack * owner)
 +{
 +	atomic_set(&owner->wakeup, 1);
-+	wake_up(&owner->wait);
++	wake_up_process(&owner->wait);
 +}
 +
 +/* Puts a thread to sleep */

--=-hBe46oYUCEtJ7Htwgr/T--

