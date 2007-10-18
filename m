From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 2/7 (take 2)] reiserfs: dont use BUG when panicking
Date: Thu, 18 Oct 2007 14:24:04 -0400
Message-ID: <20071018182417.966844932@suse.com>
References: <20071018182402.819638928@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs-dont-use-BUG-when-panicking
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: ReiserFS Development Mailing List <reiserfs-devel@vger.kernel.org>

 This patch changes reiserfs_panic() to use panic() initially instead of
 BUG(). Using BUG() ignores the configurable panic behavior, so systems
 that should be failing and rebooting are left hanging. This causes problems
 in active/standby HA scenarios.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/prints.c |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

Index: b/fs/reiserfs/prints.c
===================================================================
--- a/fs/reiserfs/prints.c	2007-10-18 14:08:46.000000000 -0400
+++ b/fs/reiserfs/prints.c	2007-10-18 14:08:49.000000000 -0400
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
Jeff Mahoney
SUSE Labs

