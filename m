From: Filipe Almeida <filipe@rnl.ist.utl.pt>
Subject: [PATCH] reiser4 and swsusp2 (for 2004.03.26)
Date: Tue, 30 Mar 2004 16:56:44 +0100
Message-ID: <200403301656.44998.filipe@rnl.ist.utl.pt>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_8iZaA6DXGfxw8UC"
Return-path: <reiserfs-list-return-17595-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com, swsusp-devel@lists.sourceforge.net

--Boundary-00=_8iZaA6DXGfxw8UC
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
This patch adds swsusp2 software suspend support to reiser4 for those that use 
swsusp2 and reiser4.

This has been tested with 2.6.4 with the following patches applied in order:
software-suspend-linux-2.6.4-test5-whole.bz2
software-suspend-core-2.0-whole.bz2
software-suspend-core-2.0.0.37-incremental.bz2
all.diif.gz  (from reiser4 2004.03.26 snapshot)

Regards,
Filipe Almeida

-- 
Filipe Almeida <filipe@rnl.ist.utl.pt>
http://mega.ist.utl.pt/~filipe/

--Boundary-00=_8iZaA6DXGfxw8UC
Content-Type: text/x-diff;
  charset="us-ascii";
  name="reiser4-2004.03.26-swsusp2.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiser4-2004.03.26-swsusp2.diff"

Add swsusp2 software suspend support to reiser4.
Suspending while the repacker is running it not supported yet, so don't try it.

Filipe Almeida <filipe@rnl.ist.utl.pt>

--- linux-2.6.4/fs/reiser4/ktxnmgrd.c.orig	2004-03-30 16:01:34.354552072 +0100
+++ linux-2.6.4/fs/reiser4/ktxnmgrd.c	2004-03-30 16:37:35.142062440 +0100
@@ -79,11 +79,16 @@
 	struct super_block * super;
 	ktxnmgrd_context *ctx;
 	txn_mgr * mgr;
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
@@ -106,13 +111,6 @@
 	while (1) {
 		int result;
 
-		/* software suspend support. */
-		if (me->flags & PF_FREEZE) {
-			spin_unlock(&ctx->guard);
-			refrigerator(PF_IOTHREAD);
-			spin_lock(&ctx->guard);
-		}
-
 		set_comm("wait");
 		/* wait for @ctx -> timeout or explicit wake up.
 
@@ -121,8 +119,10 @@
 		   load-average. This doesn't require any special handling,
 		   because all signals were blocked.
 		*/
+		SWSUSP_ACTIVITY_SYNCTHREAD_PAUSING;
 		result = kcond_timedwait(&ctx->wait,
 					 &ctx->guard, ctx->timeout, 1);
+		SWSUSP_ACTIVITY_RESTARTING(PF_SYNCTHREAD);
 
 		if (result != -ETIMEDOUT && result != -EINTR && result != 0) {
 			/* some other error */
@@ -156,6 +156,7 @@
 
 	spin_unlock(&ctx->guard);
 
+	SWSUSP_ACTIVITY_END;
 	complete_and_exit(&ctx->finish, 0);
 	/* not reached. */
 	return 0;
--- linux-2.6.4/fs/reiser4/entd.c.orig	2004-03-30 16:01:28.637421208 +0100
+++ linux-2.6.4/fs/reiser4/entd.c	2004-03-30 16:37:56.305845056 +0100
@@ -71,12 +71,17 @@
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
 
 	/* block all signals */
 	spin_lock_irq(&me->sighand->siglock);
@@ -99,13 +104,13 @@
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
@@ -122,6 +127,7 @@
 			warning("nikita-3099", "Error: %i", result);
 	}
 
+	SWSUSP_ACTIVITY_END;
 	complete_and_exit(&ctx->finish, 0);
 	/* not reached. */
 	return 0;
--- linux-2.6.4/fs/reiser4/repacker.c.orig	2004-03-30 16:42:51.094030440 +0100
+++ linux-2.6.4/fs/reiser4/repacker.c	2004-03-30 16:31:20.564006960 +0100
@@ -191,9 +191,6 @@
 	if (ret)
 		return ret;
 
-	if (current->flags & PF_FREEZE)
-		refrigerator(PF_IOTHREAD);
-
 	balance_dirty_pages_ratelimited(get_current_super_private()->fake->i_mapping);
 	begin_work();
 	cursor->count = get_current_super_private()->repacker->params.chunk_size;

--Boundary-00=_8iZaA6DXGfxw8UC--
