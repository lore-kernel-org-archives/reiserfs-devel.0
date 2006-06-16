From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 01/05] reiserfs: use more consistent printk formatting
Date: Fri, 16 Jun 2006 00:19:00 -0400
Message-ID: <20060616041900.GA5370@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28790-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>


 The output format between a warning/error/panic/info/etc changes with
 which one is used.

 The following patch makes the messages more internally consistent, but also
 more consistent with other Linux filesystems.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

--
 fs/reiserfs/prints.c |   28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff -ruNpX ../dontdiff linux-2.6.17-rc6-staging1/fs/reiserfs/prints.c linux-2.6.17-rc6-staging2/fs/reiserfs/prints.c
--- linux-2.6.17-rc6-staging1/fs/reiserfs/prints.c	2006-06-15 20:58:48.000000000 -0400
+++ linux-2.6.17-rc6-staging2/fs/reiserfs/prints.c	2006-06-15 20:59:41.000000000 -0400
@@ -269,10 +269,10 @@ void reiserfs_warning(struct super_block
 {
 	do_reiserfs_warning(fmt);
 	if (sb)
-		printk(KERN_WARNING "ReiserFS: %s: warning: %s\n",
-		       reiserfs_bdevname(sb), error_buf);
+		printk(KERN_WARNING "REISERFS warning (device %s): %s\n",
+		       sb->s_id, error_buf);
 	else
-		printk(KERN_WARNING "ReiserFS: warning: %s\n", error_buf);
+		printk(KERN_WARNING "REISERFS warning: %s\n", error_buf);
 }
 
 /* No newline.. reiserfs_info calls can be followed by printk's */
@@ -280,10 +280,10 @@ void reiserfs_info(struct super_block *s
 {
 	do_reiserfs_warning(fmt);
 	if (sb)
-		printk(KERN_NOTICE "ReiserFS: %s: %s",
-		       reiserfs_bdevname(sb), error_buf);
+		printk(KERN_NOTICE "REISERFS (device %s): %s",
+		       sb->s_id, error_buf);
 	else
-		printk(KERN_NOTICE "ReiserFS: %s", error_buf);
+		printk(KERN_NOTICE "REISERFS %s:", error_buf);
 }
 
 /* No newline.. reiserfs_printk calls can be followed by printk's */
@@ -298,10 +298,10 @@ void reiserfs_debug(struct super_block *
 #ifdef CONFIG_REISERFS_CHECK
 	do_reiserfs_warning(fmt);
 	if (s)
-		printk(KERN_DEBUG "ReiserFS: %s: %s\n",
-		       reiserfs_bdevname(s), error_buf);
+		printk(KERN_DEBUG "REISERFS debug (device %s): %s\n",
+		       s->s_id, error_buf);
 	else
-		printk(KERN_DEBUG "ReiserFS: %s\n", error_buf);
+		printk(KERN_DEBUG "REISERFS debug: %s\n", error_buf);
 #endif
 }
 
@@ -371,15 +371,15 @@ void reiserfs_abort(struct super_block *
 	do_reiserfs_warning(fmt);
 
 	if (reiserfs_error_panic(sb)) {
-		panic(KERN_CRIT "REISERFS: panic (device %s): %s\n",
-		      reiserfs_bdevname(sb), error_buf);
+		panic(KERN_CRIT "REISERFS panic (device %s): %s\n", sb->s_id,
+		      error_buf);
 	}
 
-	if (sb->s_flags & MS_RDONLY)
+	if (reiserfs_is_journal_aborted(SB_JOURNAL(sb))) 
 		return;
 
-	printk(KERN_CRIT "REISERFS: abort (device %s): %s\n",
-	       reiserfs_bdevname(sb), error_buf);
+	printk(KERN_CRIT "REISERFS abort (device %s): %s\n", sb->s_id,
+	       error_buf);
 
 	sb->s_flags |= MS_RDONLY;
 	reiserfs_journal_abort(sb, errno);
