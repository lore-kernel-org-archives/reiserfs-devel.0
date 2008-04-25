From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch] reiser4: fix kill_hook_internal
Date: Fri, 25 Apr 2008 22:18:03 +0400
Message-ID: <4812205B.1050908@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020109060407080208040108"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vladimir Saveliev <Vladimir.Saveliev@sun.com>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------020109060407080208040108
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



--------------020109060407080208040108
Content-Type: text/x-patch;
 name="reiser4-fix-kill_hook_internal.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-fix-kill_hook_internal.patch"

Problem:
Failed assertion (nikita-2754): child znode is not loaded
when looking at its number of items in kill_hook_internal().
Nobody cares about its loading.

Fixup:
Added missed zload/zrelse of the child.
---
 linux-2.6.25-mm1/fs/reiser4/plugin/item/internal.c |   18 +++++++++++++-----
 1 files changed, 13 insertions(+), 5 deletions(-)

--- linux-2.6.25-mm1/fs/reiser4/plugin/item/internal.c.orig
+++ linux-2.6.25-mm1/fs/reiser4/plugin/item/internal.c
@@ -308,6 +308,7 @@
 		       struct carry_kill_data *p UNUSED_ARG)
 {
 	znode *child;
+	int result = 0;
 
 	assert("nikita-1222", item != NULL);
 	assert("nikita-1224", from == 0);
@@ -316,7 +317,14 @@
 	child = znode_at(item, item->node);
 	if (IS_ERR(child))
 		return PTR_ERR(child);
-	else if (node_is_empty(child)) {
+	assert("edward-1560", child != NULL);
+
+	result = zload(child);
+	if (result) {
+		zput(child);
+		return result;
+	}
+	if (node_is_empty(child)) {
 		reiser4_tree *tree;
 
 		assert("nikita-1397", znode_is_write_locked(child));
@@ -328,14 +336,14 @@
 		init_parent_coord(&child->in_parent, NULL);
 		--item->node->c_count;
 		write_unlock_tree(tree);
-		zput(child);
-		return 0;
 	} else {
 		warning("nikita-1223",
 			"Cowardly refuse to remove link to non-empty node");
-		zput(child);
-		return RETERR(-EIO);
+		result = RETERR(-EIO);
 	}
+	zrelse(child);
+	zput(child);
+	return result;
 }
 
 /* hook called by ->shift() node plugin method when iternal item was just

--------------020109060407080208040108--
