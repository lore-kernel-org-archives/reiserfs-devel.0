From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: fix up case where indent misreads the code
Date: Tue, 12 Jul 2005 19:19:30 -0400
Message-ID: <20050712231930.GA9495@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25111-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

 indent(1) doesn't know how to handle the "do not compile" error. It results
 in the item_ops array declaration being indented a tab stop in when it should
 not be. This patch replaces it with a #error that describes why it's failing.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX dontdiff linux-2.6.13-rc2/fs/reiserfs/item_ops.c linux-2.6.13-rc2.lindent/fs/reiserfs/item_ops.c
--- linux-2.6.13-rc2/fs/reiserfs/item_ops.c	2005-07-12 21:00:32.000000000 -0400
+++ linux-2.6.13-rc2.lindent/fs/reiserfs/item_ops.c	2005-07-12 21:04:01.000000000 -0400
@@ -772,7 +772,7 @@ static struct item_operations errcatch_o
 //
 //
 #if ! (TYPE_STAT_DATA == 0 && TYPE_INDIRECT == 1 && TYPE_DIRECT == 2 && TYPE_DIRENTRY == 3)
-  do not compile
+#error Item types must use disk-format assigned values.
 #endif
 
 struct item_operations * item_ops [TYPE_ANY + 1] = {
-- 
Jeff Mahoney
SuSE Labs
