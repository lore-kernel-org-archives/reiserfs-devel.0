From: Filipe Almeida <filipe@rnl.ist.utl.pt>
Subject: reiser4 and swsusp
Date: Sun, 8 Feb 2004 19:06:39 +0000
Message-ID: <20040208190639.GB31760@rnl.ist.utl.pt>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="C7zPtVaVf+AK4Oqc"
Return-path: <reiserfs-list-return-16727-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
First of all let me say I am not familiar with reiser4 or swsusp internals
but I needed a way to make reiser4 work with software suspend.

Below is the patch I came up with. I did a couple of suspend/resume loops on
a system with reser4 root and everything seems to be working ok. The patch
doesn't affect operation without swsusp.

Please check if everything is ok.

PS: repacker is broken on the last two snapshots. It just oops and crashes the
machine.

Regards,
Filipe Almeida

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="reiser4-swsusp.patch"

--- fs/reiser4/ktxnmgrd.c.ok	2004-02-08 03:01:49.000000000 +0000
+++ fs/reiser4/ktxnmgrd.c	2004-02-08 03:25:51.000000000 +0000
@@ -79,11 +79,6 @@
 		int result;
 		txn_mgr *mgr;
 
-		/* software suspend support. Doesn't work currently
-		   (kcond_timedwait), also refrigerator() may schedule */
-		if (0 && (me->flags & PF_FREEZE))
-			refrigerator(PF_IOTHREAD);
-
 		set_comm("wait");
 		/* wait for @ctx -> timeout or explicit wake up.
 
@@ -95,6 +90,17 @@
 		result = kcond_timedwait(&ctx->wait,
 					 &ctx->guard, ctx->timeout, 1);
 
+		/* software suspend support. */
+		if (result != -ETIMEDOUT && result != 0
+			&& me->flags & PF_FREEZE) {
+			
+			spin_unlock(&ctx->guard);
+			refrigerator(PF_IOTHREAD);
+			spin_lock(&ctx->guard);
+			continue;
+		}
+
+
 		/* wake up all threads doing umount. See ktxnmgrd_detach(). */
 		kcond_broadcast(&ctx->loop);
 
--- fs/reiser4/entd.c.ok	2004-02-08 03:22:46.000000000 +0000
+++ fs/reiser4/entd.c	2004-02-08 03:50:40.567901168 +0000
@@ -72,8 +72,6 @@
 	while (1) {
 		int result;
 
-		if (me->flags & PF_FREEZE)
-			refrigerator(PF_IOTHREAD);
 
 		entd_set_comm(".");
 		spin_lock(&ctx->guard);
@@ -90,6 +88,8 @@
 		entd_set_comm("!");
 		if (result == 0)
 			entd_flush(super);
+		else if (me->flags & PF_FREEZE)
+			refrigerator(PF_IOTHREAD);
 		else
 			/* some other error */
 			warning("nikita-3099", "Error: %i", result);

--C7zPtVaVf+AK4Oqc--
