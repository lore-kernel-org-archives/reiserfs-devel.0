From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 19/8] eottl.c cleanup
Date: Tue, 23 Oct 2007 16:48:52 +0200
Message-ID: <1193150932.6236.92.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-lznih5vfQLLbwtSdAI+z"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-lznih5vfQLLbwtSdAI+z
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



--=-lznih5vfQLLbwtSdAI+z
Content-Disposition: attachment; filename=eottl.c.patch
Content-Type: text/x-patch; name=eottl.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- eottl.c.orig	2007-10-23 16:42:51.000000000 +0200
+++ eottl.c	2007-10-23 16:44:36.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 #include "forward.h"
 #include "debug.h"
@@ -118,8 +119,8 @@
  * is returned if search restart has to be done.
  */
 static int
-is_next_item_internal(coord_t *coord, const reiser4_key *key,
-		      lock_handle *lh)
+is_next_item_internal(coord_t *coord, const reiser4_key * key,
+		      lock_handle * lh)
 {
 	coord_t next;
 	lock_handle rn;
@@ -377,8 +378,8 @@ add_empty_leaf(coord_t *insert_coord, lo
  *
  * Handles search on twig level. If this function completes search itself then
  * it returns 1. If search has to go one level down then 0 is returned. If
- * error happens then LOOKUP_DONE is returned via @outcome and error code is saved
- * in @h->result.
+ * error happens then LOOKUP_DONE is returned via @outcome and error code is
+ * saved in @h->result.
  */
 int handle_eottl(cbk_handle *h, int *outcome)
 {
@@ -399,7 +400,7 @@ int handle_eottl(cbk_handle *h, int *out
 	 * set to extent item or after extent item
 	 */
 	assert("vs-356", h->level == TWIG_LEVEL);
-	assert("vs-357", ( {
+	assert("vs-357", ({
 			  coord_t lcoord;
 			  coord_dup(&lcoord, coord);
 			  check_me("vs-733", coord_set_to_left(&lcoord) == 0);

--=-lznih5vfQLLbwtSdAI+z--

