From: Chris Mason <mason@suse.com>
Subject: [PATCH] 1/1 reiserfs: ignore prepared and locked buffers
Date: Fri, 23 Apr 2004 15:57:43 -0400
Message-ID: <1082750262.12989.204.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18182-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, akpm@osdl.org

mason@suse.com

block_write_full_page might see and lock clean metadata buffers, which leads
to bogus vs-12339 messages.  Change the message to ignore bh locked.

Index: linux.mm/fs/reiserfs/do_balan.c
===================================================================
--- linux.mm.orig/fs/reiserfs/do_balan.c	2004-04-23 14:08:22.436537699 -0400
+++ linux.mm/fs/reiserfs/do_balan.c	2004-04-23 14:09:05.089418397 -0400
@@ -1343,7 +1343,8 @@ static void check_internal_node (struct 
 
 static int locked_or_not_in_tree (struct buffer_head * bh, char * which)
 {
-  if ( buffer_locked (bh) || !B_IS_IN_TREE (bh) ) {
+  if ( (!reiserfs_buffer_prepared(bh) && buffer_locked (bh)) || 
+        !B_IS_IN_TREE (bh) ) {
     reiserfs_warning ("vs-12339: locked_or_not_in_tree: %s (%b)\n", which, bh);
     return 1;
   } 


