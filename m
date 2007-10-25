From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 58/8] plugin/cluster.c cleanup
Date: Thu, 25 Oct 2007 20:51:03 +0200
Message-ID: <1193338263.15901.99.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-pDW/aYgd2Oi6+rkmStAa"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-pDW/aYgd2Oi6+rkmStAa
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 0 errors, 2 warnings, 71 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.


--=-pDW/aYgd2Oi6+rkmStAa
Content-Disposition: attachment; filename=cluster.c.patch
Content-Type: text/x-patch; name=cluster.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- cluster.c.orig	2007-10-25 20:45:34.000000000 +0200
+++ cluster.c	2007-10-25 20:46:57.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+ * reiser4/README */
 
 /* Contains reiser4 cluster plugins (see
    http://www.namesys.com/cryptcompress_design.html
@@ -17,7 +18,7 @@ static int change_cluster(struct inode *
 	assert("edward-1326", is_reiser4_inode(inode));
 	assert("edward-1327", plugin->h.type_id == REISER4_CLUSTER_PLUGIN_TYPE);
 
-	/* Can't change the cluster plugin for already existent regular files. */
+	/* Can't change the cluster plugin for already existent regular files */
 	if (!plugin_of_group(inode_file_plugin(inode), REISER4_DIRECTORY_FILE))
 		return RETERR(-EINVAL);
 

--=-pDW/aYgd2Oi6+rkmStAa--

