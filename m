From: Filipe Almeida <filipe@rnl.ist.utl.pt>
Subject: Re: reiser4 and swsusp2 (patch)
Date: Wed, 11 Feb 2004 22:50:07 +0000
Message-ID: <200402112249.26658.filipe@rnl.ist.utl.pt>
References: <200402101738.22694.filipe@rnl.ist.utl.pt> <16425.8230.691511.488155@laputa.namesys.com> <200402101841.09132.filipe@rnl.ist.utl.pt>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_fGrKAiw+84kRz9I"
Return-path: <reiserfs-list-return-16767-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402101841.09132.filipe@rnl.ist.utl.pt>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com, swsusp-devel@lists.sourceforge.net

--Boundary-00=_fGrKAiw+84kRz9I
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
Here are the revised patches following Nikita's sugestions.

Don't forget that nyou have to use:
reiser4-2004.02.06-swsusp1.diff	- for current 2.6 pmdisk or swsusp kernels
reiser4-2004.02.06-swsusp2.diff	- for the swsusp2 version

Regards,
Filipe Almeida



--Boundary-00=_fGrKAiw+84kRz9I
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="reiser4-2004.02.06-swsusp1.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiser4-2004.02.06-swsusp1.diff"

Add swsusp/pmdisk software suspend support to reiser4

Filipe Almeida <filipe@rnl.ist.utl.pt>

--- linux-2.6.2-reiser4/fs/reiser4/ktxnmgrd.c	2004-02-11 01:58:50.000000000 +0000
+++ linux-2.6.2-reiser4-pmdisk/fs/reiser4/ktxnmgrd.c	2004-02-11 20:22:30.000000000 +0000
@@ -79,10 +79,12 @@
 		int result;
 		txn_mgr *mgr;
 
-		/* software suspend support. Doesn't work currently
-		   (kcond_timedwait), also refrigerator() may schedule */
-		if (0 && (me->flags & PF_FREEZE))
+		/* software suspend support. */
+		if (me->flags & PF_FREEZE) {
+			spin_unlock(&ctx->guard);
 			refrigerator(PF_IOTHREAD);
+			spin_lock(&ctx->guard);
+		}
 
 		set_comm("wait");
 		/* wait for @ctx -> timeout or explicit wake up.
@@ -98,7 +100,7 @@
 		/* wake up all threads doing umount. See ktxnmgrd_detach(). */
 		kcond_broadcast(&ctx->loop);
 
-		if (result != -ETIMEDOUT && result != 0) {
+		if (result != -ETIMEDOUT && result != -EINTR && result != 0) {
 			/* some other error */
 			warning("nikita-2443", "Error: %i", result);
 			continue;
--- linux-2.6.2-reiser4/fs/reiser4/entd.c	2004-02-11 01:58:50.000000000 +0000
+++ linux-2.6.2-reiser4-pmdisk/fs/reiser4/entd.c	2004-02-11 18:33:42.000000000 +0000
@@ -90,7 +90,7 @@
 		entd_set_comm("!");
 		if (result == 0)
 			entd_flush(super);
-		else
+		else if(result != -EINTR)
 			/* some other error */
 			warning("nikita-3099", "Error: %i", result);
 	}

--Boundary-00=_fGrKAiw+84kRz9I
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="reiser4-2004.02.06-swsusp2.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiser4-2004.02.06-swsusp2.diff"

Add swsusp2 software suspend support to reiser4

Filipe Almeida <filipe@rnl.ist.utl.pt>

--- linux-2.6.2-reiser4-swsusp2/fs/reiser4/ktxnmgrd.c	2004-02-11 18:41:40.000000000 +0000
+++ linux-2.6.2-reiser4-swsusp2-lk/fs/reiser4/ktxnmgrd.c	2004-02-11 18:47:26.000000000 +0000
@@ -53,11 +53,17 @@
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
+
 
 	/* block all signals */
 	spin_lock_irq(&me->sighand->siglock);
@@ -79,11 +85,6 @@
 		int result;
 		txn_mgr *mgr;
 
-		/* software suspend support. Doesn't work currently
-		   (kcond_timedwait), also refrigerator() may schedule */
-		if (0 && (me->flags & PF_FREEZE))
-			refrigerator(PF_IOTHREAD);
-
 		set_comm("wait");
 		/* wait for @ctx -> timeout or explicit wake up.
 
@@ -92,13 +93,15 @@
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
+		if (result != -ETIMEDOUT && result != -EINTR && result != 0) {
 			/* some other error */
 			warning("nikita-2443", "Error: %i", result);
 			continue;
@@ -132,6 +135,7 @@
 
 	spin_unlock(&ctx->guard);
 
+	SWSUSP_ACTIVITY_END;
 	complete_and_exit(&ctx->finish, 0);
 	/* not reached. */
 	return 0;
--- linux-2.6.2-reiser4-swsusp2/fs/reiser4/entd.c	2004-02-11 18:41:40.000000000 +0000
+++ linux-2.6.2-reiser4-swsusp2-lk/fs/reiser4/entd.c	2004-02-11 19:04:15.000000000 +0000
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
+	current->flags |= PF_SYNCTHREAD;
+
+	SWSUSP_THREAD_FLAGS_RESET;
+	SWSUSP_ACTIVITY_START(PF_SYNCTHREAD);
+
 
 	/* block all signals */
 	spin_lock_irq(&me->sighand->siglock);
@@ -72,13 +78,13 @@
 	while (1) {
 		int result;
 
-		if (me->flags & PF_FREEZE)
-			refrigerator(PF_IOTHREAD);
-
 		entd_set_comm(".");
 		spin_lock(&ctx->guard);
 		ctx->kicks_pending = 0;
+
+		SWSUSP_ACTIVITY_SYNCTHREAD_PAUSING;
 		result = kcond_wait(&ctx->wait, &ctx->guard, 1);
+		SWSUSP_ACTIVITY_RESTARTING(PF_SYNCTHREAD);
 
 		/* we are asked to exit */
 		if (ctx->done) {
@@ -90,11 +96,12 @@
 		entd_set_comm("!");
 		if (result == 0)
 			entd_flush(super);
-		else
+		else if(result != -EINTR)
 			/* some other error */
 			warning("nikita-3099", "Error: %i", result);
 	}
 
+	SWSUSP_ACTIVITY_END;
 	complete_and_exit(&ctx->finish, 0);
 	/* not reached. */
 	return 0;

--Boundary-00=_fGrKAiw+84kRz9I--
