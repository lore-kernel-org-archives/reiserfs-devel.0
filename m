From: Filipe Almeida <filipe@rnl.ist.utl.pt>
Subject: [PATCH] small typo
Date: Wed, 24 Mar 2004 20:22:17 +0000
Message-ID: <200403242022.17761.filipe@rnl.ist.utl.pt>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_53eYAdQmfrD0Gil"
Return-path: <reiserfs-list-return-17441-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-00=_53eYAdQmfrD0Gil
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Here's the fix for a small typo in entd.c...

Regards,
Filipe Almeida

--Boundary-00=_53eYAdQmfrD0Gil
Content-Type: text/x-diff;
  charset="us-ascii";
  name="reiser4-entd.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiser4-entd.patch"

--- reiser4/entd.c.old	2004-03-24 20:19:09.161973952 +0000
+++ reiser4/entd.c	2004-03-24 20:19:15.790966192 +0000
@@ -117,7 +117,7 @@
 		entd_set_comm("!");
 		if (result == 0)
 			entd_flush(super);
-		else if (result != EINTR)
+		else if (result != -EINTR)
 			/* some other error */
 			warning("nikita-3099", "Error: %i", result);
 	}

--Boundary-00=_53eYAdQmfrD0Gil--
