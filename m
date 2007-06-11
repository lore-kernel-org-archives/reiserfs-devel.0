From: jeffm@suse.com
Subject: [patch 02/40] reiserfs: dont use BUG when panicking
Date: Mon, 11 Jun 2007 15:03:11 -0400
Message-ID: <20070611190629.457662968@suse.com>
References: <20070611190309.532091171@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs-no-bug-on-panic.diff
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

 This patch changes reiserfs_panic() to use panic() initially instead of
 BUG(). Using BUG() ignores the configurable panic behavior, so systems
 that should be failing and rebooting are left hanging. This causes problems
 in active/standby HA scenarios.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/prints.c |    7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

--- a/fs/reiserfs/prints.c	2007-06-11 14:49:05.000000000 -0400
+++ b/fs/reiserfs/prints.c	2007-06-11 14:50:11.000000000 -0400
@@ -356,13 +356,8 @@ extern struct tree_balance *cur_tb;
 void reiserfs_panic(struct super_block *sb, const char *fmt, ...)
 {
 	do_reiserfs_warning(fmt);
-	printk(KERN_EMERG "REISERFS: panic (device %s): %s\n",
+	panic(KERN_EMERG "REISERFS: panic (device %s): %s\n",
 	       reiserfs_bdevname(sb), error_buf);
-	BUG();
-
-	/* this is not actually called, but makes reiserfs_panic() "noreturn" */
-	panic("REISERFS: panic (device %s): %s\n",
-	      reiserfs_bdevname(sb), error_buf);
 }
 
 void reiserfs_abort(struct super_block *sb, int errno, const char *fmt, ...)

-- 
Jeff Mahoney
SUSE Labs

