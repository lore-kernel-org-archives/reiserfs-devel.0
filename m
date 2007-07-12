From: jeffm@suse.com
Subject: [patch 05/11] reiserfs: use more consistent printk formatting
Date: Thu, 12 Jul 2007 15:37:43 -0400
Message-ID: <20070712193757.005781608@mail.jeffreymahoney.com>
References: <20070712193738.112875514@mail.jeffreymahoney.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs-consistent-messages.diff
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development Mailing List <reiserfs-devel@vger.namesys.com>, Vladimir Saveliev <vs@namesys.com>

 The output format between a warning/error/panic/info/etc changes with
 which one is used.

 The following patch makes the messages more internally consistent, but also
 more consistent with other Linux filesystems.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

--
 fs/reiserfs/prints.c |   28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

--- a/fs/reiserfs/prints.c	2007-06-11 14:49:31.000000000 -0400
+++ b/fs/reiserfs/prints.c	2007-06-11 14:50:10.000000000 -0400
@@ -268,10 +268,10 @@ void reiserfs_warning(struct super_block
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
@@ -279,10 +279,10 @@ void reiserfs_info(struct super_block *s
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
@@ -297,10 +297,10 @@ void reiserfs_debug(struct super_block *
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
 
@@ -365,15 +365,15 @@ void reiserfs_abort(struct super_block *
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

-- 
Jeff Mahoney
SUSE Labs

