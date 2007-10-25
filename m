From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 47/8] safe_link.c cleanup
Date: Thu, 25 Oct 2007 16:23:58 +0200
Message-ID: <1193322238.15901.46.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-rNgDc8R3Rc2gYFGP+qJP"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-rNgDc8R3Rc2gYFGP+qJP
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 4 errors, 3 warnings, 352 lines checked
patched:total: 0 errors, 1 warnings, 354 lines checked
leftovers:

WARNING: do not add new typedefs
#60: FILE: safe_link.c:60:
+typedef struct safelink {




--=-rNgDc8R3Rc2gYFGP+qJP
Content-Disposition: attachment; filename=safe_link.c.patch
Content-Type: text/x-patch; name=safe_link.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- safe_link.c.orig	2007-10-25 16:20:00.000000000 +0200
+++ safe_link.c	2007-10-25 16:22:21.000000000 +0200
@@ -207,7 +207,7 @@ struct safe_link_context {
  * start iterating over all safe-links.
  */
 static void safe_link_iter_begin(reiser4_tree * tree,
-				 struct safe_link_context * ctx)
+				 struct safe_link_context *ctx)
 {
 	ctx->tree = tree;
 	reiser4_key_init(&ctx->key);
@@ -219,7 +219,7 @@ static void safe_link_iter_begin(reiser4
 /*
  * return next safe-link.
  */
-static int safe_link_iter_next(struct safe_link_context * ctx)
+static int safe_link_iter_next(struct safe_link_context *ctx)
 {
 	int result;
 	safelink_t sl;
@@ -238,7 +238,7 @@ static int safe_link_iter_next(struct sa
 /*
  * check are there any more safe-links left in the tree.
  */
-static int safe_link_iter_finished(struct safe_link_context * ctx)
+static int safe_link_iter_finished(struct safe_link_context *ctx)
 {
 	return get_key_locality(&ctx->key) != safe_link_locality(ctx->tree);
 }
@@ -246,7 +246,7 @@ static int safe_link_iter_finished(struc
 /*
  * finish safe-link iteration.
  */
-static void safe_link_iter_end(struct safe_link_context * ctx)
+static void safe_link_iter_end(struct safe_link_context *ctx)
 {
 	/* nothing special */
 }
@@ -294,10 +294,12 @@ static int process_safelink(struct super
 		reiser4_iget_complete(inode);
 		iput(inode);
 		if (result == 0) {
-			result = safe_link_grab(reiser4_get_tree(super), BA_CAN_COMMIT);
+			result = safe_link_grab(reiser4_get_tree(super),
+						BA_CAN_COMMIT);
 			if (result == 0)
 				result =
-				    safe_link_del(reiser4_get_tree(super), oid, link);
+				    safe_link_del(reiser4_get_tree(super), oid,
+						  link);
 			safe_link_release(reiser4_get_tree(super));
 			/*
 			 * restart transaction: if there was large number of

--=-rNgDc8R3Rc2gYFGP+qJP--

