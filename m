From: Filipe Almeida <filipe@rnl.ist.utl.pt>
Subject: reiser4 and swsusp2 (patch)
Date: Tue, 10 Feb 2004 17:38:22 +0000
Message-ID: <200402101738.22694.filipe@rnl.ist.utl.pt>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_OcRKAiZp/1RpdB/"
Return-path: <reiserfs-list-return-16745-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com, swsusp-devel@lists.sourceforge.net

--Boundary-00=_OcRKAiZp/1RpdB/
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
This is my attempt at a patch to make reiser4 work with swsusp2. I made half a 
dozen suspend/resume operations under heavy disk activity and everything 
seems to be working. These tests were made with reiser4 as root filesystem.

I am neither familiar with reiser4 or swsusp internals, so there may be some 
obvious errors in the attached diff that I am unaware of.

This and the original swsusp/pmdisk patch are available here:
http://mega.ist.utl.pt/~filipe/patches/

Regards,
Filipe Almeida
http://mega.ist.utl.pt/~filipe/

--Boundary-00=_OcRKAiZp/1RpdB/
Content-Type: text/x-diff;
  charset="us-ascii";
  name="reiser4-2004.02.06-swsusp2.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiser4-2004.02.06-swsusp2.diff"

--- old/linux-2.6.2/fs/reiser4/ktxnmgrd.c	2004-02-10 17:15:43.910461848 +0000
+++ linux-2.6.2/fs/reiser4/ktxnmgrd.c	2004-02-10 17:18:58.319907120 +0000
@@ -53,11 +53,16 @@
 {
 	struct task_struct *me;
 	ktxnmgrd_context *ctx;
+	DECLARE_SWSUSP_LOCAL_VAR;
 
 	/* standard kernel thread prologue */
 	me = current;
 	/* reparent_to_init() is done by daemonize() */
 	daemonize(__FUNCTION__);
+	current->flags |= PF_SYNCTHREAD;
+
+	SWSUSP_THREAD_FLAGS_RESET;
+	SWSUSP_ACTIVITY_START(PF_SYNCTHREAD);
 
 	/* block all signals */
 	spin_lock_irq(&me->sighand->siglock);
@@ -79,11 +84,6 @@
 		int result;
 		txn_mgr *mgr;
 
-		/* software suspend support. Doesn't work currently
-		   (kcond_timedwait), also refrigerator() may schedule */
-		if (0 && (me->flags & PF_FREEZE))
-			refrigerator(PF_IOTHREAD);
-
 		set_comm("wait");
 		/* wait for @ctx -> timeout or explicit wake up.
 
@@ -92,17 +92,16 @@
 		   load-average. This doesn't require any special handling,
 		   because all signals were blocked.
 		*/
+		SWSUSP_ACTIVITY_SYNCTHREAD_PAUSING;
 		result = kcond_timedwait(&ctx->wait,
 					 &ctx->guard, ctx->timeout, 1);
+		SWSUSP_ACTIVITY_RESTARTING(PF_SYNCTHREAD);
 
 		/* wake up all threads doing umount. See ktxnmgrd_detach(). */
 		kcond_broadcast(&ctx->loop);
 
-		if (result != -ETIMEDOUT && result != 0) {
-			/* some other error */
-			warning("nikita-2443", "Error: %i", result);
+		if (result != -ETIMEDOUT && result != 0)
 			continue;
-		}
 
 		/* we are asked to exit */
 		if (ctx->done)
@@ -132,6 +131,7 @@
 
 	spin_unlock(&ctx->guard);
 
+	SWSUSP_ACTIVITY_END;
 	complete_and_exit(&ctx->finish, 0);
 	/* not reached. */
 	return 0;
--- old/linux-2.6.2/fs/reiser4/entd.c	2004-02-10 17:15:43.829474160 +0000
+++ linux-2.6.2/fs/reiser4/entd.c	2004-02-10 17:10:11.658971752 +0000
@@ -44,12 +44,18 @@
 	struct super_block *super;
 	struct task_struct *me;
 	entd_context       *ctx;
+	DECLARE_SWSUSP_LOCAL_VAR;
 
 	super = arg;
 	/* standard kernel thread prologue */
 	me = current;
 	/* reparent_to_init() is done by daemonize() */
 	daemonize("ent:%s", super->s_id);
+        current->flags |= PF_SYNCTHREAD;
+
+	SWSUSP_THREAD_FLAGS_RESET;
+	SWSUSP_ACTIVITY_START(PF_SYNCTHREAD);
+			
 
 	/* block all signals */
 	spin_lock_irq(&me->sighand->siglock);
@@ -72,13 +78,14 @@
 	while (1) {
 		int result;
 
-		if (me->flags & PF_FREEZE)
-			refrigerator(PF_IOTHREAD);
+		/* Chance for ktxnmgrd to refrigerate */
 
 		entd_set_comm(".");
 		spin_lock(&ctx->guard);
 		ctx->kicks_pending = 0;
+		SWSUSP_ACTIVITY_SYNCTHREAD_PAUSING;
 		result = kcond_wait(&ctx->wait, &ctx->guard, 1);
+		SWSUSP_ACTIVITY_RESTARTING(PF_SYNCTHREAD);
 
 		/* we are asked to exit */
 		if (ctx->done) {
@@ -90,11 +97,9 @@
 		entd_set_comm("!");
 		if (result == 0)
 			entd_flush(super);
-		else
-			/* some other error */
-			warning("nikita-3099", "Error: %i", result);
 	}
-
+	
+	SWSUSP_ACTIVITY_END;
 	complete_and_exit(&ctx->finish, 0);
 	/* not reached. */
 	return 0;

--Boundary-00=_OcRKAiZp/1RpdB/--
