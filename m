From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 36/8] ktxnmgrd.c cleanup
Date: Thu, 25 Oct 2007 11:43:52 +0200
Message-ID: <1193305432.15901.3.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-BB/K/W1FFhp2HjV4L7x9"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-BB/K/W1FFhp2HjV4L7x9
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 8 errors, 2 warnings, 215 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.


--=-BB/K/W1FFhp2HjV4L7x9
Content-Disposition: attachment; filename=ktxnmgrd.c.patch
Content-Type: text/x-patch; name=ktxnmgrd.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- ktxnmgrd.c.orig	2007-10-25 11:38:48.000000000 +0200
+++ ktxnmgrd.c	2007-10-25 11:41:53.000000000 +0200
@@ -44,9 +44,9 @@ static int scan_mgr(struct super_block *
  * state. This serves no useful purpose whatsoever, but also costs nothing. May
  * be it will make lonely system administrator feeling less alone at 3 A.M.
  */
-#define set_comm( state ) 						\
-	snprintf( current -> comm, sizeof( current -> comm ),	\
-		  "%s:%s:%s", __FUNCTION__, (super)->s_id, ( state ) )
+#define set_comm(state) 						\
+	snprintf(current->comm, sizeof(current->comm),	\
+		  "%s:%s:%s", __FUNCTION__, (super)->s_id, (state))
 
 /**
  * ktxnmgrd - kernel txnmgr daemon
@@ -78,10 +78,11 @@ static int ktxnmgrd(void *arg)
 		{
 			DEFINE_WAIT(__wait);
 
-			prepare_to_wait(&ctx->wait, &__wait, TASK_INTERRUPTIBLE);
-			if (kthread_should_stop()) {
+			prepare_to_wait(&ctx->wait, &__wait,
+					TASK_INTERRUPTIBLE);
+			if (kthread_should_stop())
 				done = 1;
-			} else
+			else
 				schedule_timeout(ctx->timeout);
 			finish_wait(&ctx->wait, &__wait);
 		}

--=-BB/K/W1FFhp2HjV4L7x9--

