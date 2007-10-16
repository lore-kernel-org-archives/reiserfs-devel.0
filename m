From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 2/7] reiserfs: dont use BUG when panicking
Date: Tue, 16 Oct 2007 19:02:12 -0400
Message-ID: <20071016230258.609474000@suse.com>
References: <20071016230210.779927000@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=patches.suse/reiserfs-no-bug-on-panic.diff
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Linux Torvalds <torvalds@linux-foundation.org>
Cc: ReiserFS Development Mailing List <reiserfs-devel@vger.kernel.org>

 This patch changes reiserfs_panic() to use panic() initially instead of
 BUG(). Using BUG() ignores the configurable panic behavior, so systems
 that should be failing and rebooting are left hanging. This causes problems
 in active/standby HA scenarios.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/prints.c |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

--- a/fs/reiserfs/prints.c	2007-10-16 18:52:28.539842226 -0400
+++ b/fs/reiserfs/prints.c	2007-10-16 18:52:32.267570588 -0400
@@ -356,13 +356,11 @@ extern struct tree_balance *cur_tb;
 void reiserfs_panic(struct super_block *sb, const char *fmt, ...)
 {
 	do_reiserfs_warning(fmt);
-	printk(KERN_EMERG "REISERFS: panic (device %s): %s\n",
-	       reiserfs_bdevname(sb), error_buf);
-	BUG();
 
-	/* this is not actually called, but makes reiserfs_panic() "noreturn" */
-	panic("REISERFS: panic (device %s): %s\n",
-	      reiserfs_bdevname(sb), error_buf);
+	dump_stack();
+
+	panic(KERN_EMERG "REISERFS: panic (device %s): %s\n",
+	       reiserfs_bdevname(sb), error_buf);
 }
 
 void reiserfs_abort(struct super_block *sb, int errno, const char *fmt, ...)

-- 

