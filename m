From: Piotr Neuman <sikkh@wp.pl>
Subject: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Sat, 27 Mar 2004 15:37:52 +0100
Message-ID: <200403271537.52955.sikkh@wp.pl>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_AHZZAFg9rZ7UYdB"
Return-path: <reiserfs-list-return-17526-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs-List@namesys.com

--Boundary-00=_AHZZAFg9rZ7UYdB
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The new naming scheme for plugins ("metas" in snapshot 2004.03.26) may on 
certain occasions cause name clashes. This patch changes "metas" into 
"..metas" which should avoid this problem in most cases.

This is a very simple patch so changing "..metas" that to any other desired 
value is also easy.

Regards to reiser4 team.

diff -ruN /home/peter/linux/fs/reiser4/plugin/pseudo/pseudo.c 
linux/fs/reiser4/plugin/pseudo/pseudo.c
--- /home/peter/linux/fs/reiser4/plugin/pseudo/pseudo.c	2004-03-27 
14:50:58.000000000 +0100
+++ linux/fs/reiser4/plugin/pseudo/pseudo.c	2004-03-27 14:51:19.788181928 
+0100
@@ -1224,7 +1224,7 @@
 			.type_id = REISER4_PSEUDO_PLUGIN_TYPE,
 			.id = PSEUDO_METAS_ID,
 			.pops = NULL,
-			.label = "metas",
+			.label = "..metas",
 			.desc = "meta-files",
 			.linkage = TYPE_SAFE_LIST_LINK_ZERO
 		},

--Boundary-00=_AHZZAFg9rZ7UYdB
Content-Type: text/x-diff;
  charset="us-ascii";
  name="reiser4.metas.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiser4.metas.patch"

diff -ruN /home/peter/linux/fs/reiser4/plugin/pseudo/pseudo.c linux/fs/reiser4/plugin/pseudo/pseudo.c
--- /home/peter/linux/fs/reiser4/plugin/pseudo/pseudo.c	2004-03-27 14:50:58.000000000 +0100
+++ linux/fs/reiser4/plugin/pseudo/pseudo.c	2004-03-27 14:51:19.788181928 +0100
@@ -1224,7 +1224,7 @@
 			.type_id = REISER4_PSEUDO_PLUGIN_TYPE,
 			.id = PSEUDO_METAS_ID,
 			.pops = NULL,
-			.label = "metas",
+			.label = "..metas",
 			.desc = "meta-files",
 			.linkage = TYPE_SAFE_LIST_LINK_ZERO
 		},

--Boundary-00=_AHZZAFg9rZ7UYdB--
