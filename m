From: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Subject: [PATCH] reiserfs: fix several reiserfs_warning calls
Date: Fri,  6 Mar 2015 18:41:13 +0800
Message-ID: <1425638473-31398-1-git-send-email-nicolas.iooss_linux@m4x.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nicolas Iooss <nicolas.iooss_linux@m4x.org>

Since commit 45b03d5e8e67 ("reiserfs: rework reiserfs_warning"),
reiserfs_warning takes an id and a format as arguments, not a single
format argument.  However 4 calls still follow the old interface.
Update them.

This bug was initially found by adding __printf(4, 5) attribute to
__reiserfs_warning and using "gcc -Wformat=2" when building the
kernel.

Fixes: 45b03d5e8e67 ("reiserfs: rework reiserfs_warning")
Signed-off-by: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
---
 fs/reiserfs/bitmap.c  | 4 ++--
 fs/reiserfs/journal.c | 4 ++--
 fs/reiserfs/procfs.c  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/reiserfs/bitmap.c b/fs/reiserfs/bitmap.c
index dc198bc64c61..1d02f184863d 100644
--- a/fs/reiserfs/bitmap.c
+++ b/fs/reiserfs/bitmap.c
@@ -1423,8 +1423,8 @@ struct buffer_head *reiserfs_read_bitmap_block(struct super_block *sb,
 
 	bh = sb_bread(sb, block);
 	if (bh == NULL)
-		reiserfs_warning(sb, "sh-2029: %s: bitmap block (#%u) "
-		                 "reading failed", __func__, block);
+		reiserfs_warning(sb, "sh-2029",
+				 "bitmap block (#%u) reading failed", block);
 	else {
 		if (buffer_locked(bh)) {
 			int depth;
diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 9d6486d416a3..bb08e81ef9ec 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2643,8 +2643,8 @@ static int journal_init_dev(struct super_block *super,
 	if (IS_ERR(journal->j_dev_bd)) {
 		result = PTR_ERR(journal->j_dev_bd);
 		journal->j_dev_bd = NULL;
-		reiserfs_warning(super,
-				 "journal_init_dev: Cannot open '%s': %i",
+		reiserfs_warning(super, NULL,
+				 "Cannot open '%s': %i",
 				 jdev_name, result);
 		return result;
 	}
diff --git a/fs/reiserfs/procfs.c b/fs/reiserfs/procfs.c
index 621b9f381fe1..e6a1b2c34ef6 100644
--- a/fs/reiserfs/procfs.c
+++ b/fs/reiserfs/procfs.c
@@ -436,7 +436,7 @@ int reiserfs_proc_info_init(struct super_block *sb)
 		add_file(sb, "journal", show_journal);
 		return 0;
 	}
-	reiserfs_warning(sb, "cannot create /proc/%s/%s",
+	reiserfs_warning(sb, NULL, "cannot create /proc/%s/%s",
 			 proc_info_root_name, b);
 	return 1;
 }
@@ -465,7 +465,7 @@ int reiserfs_proc_info_global_init(void)
 	if (proc_info_root == NULL) {
 		proc_info_root = proc_mkdir(proc_info_root_name, NULL);
 		if (!proc_info_root) {
-			reiserfs_warning(NULL, "cannot create /proc/%s",
+			reiserfs_warning(NULL, NULL, "cannot create /proc/%s",
 					 proc_info_root_name);
 			return 1;
 		}
-- 
2.3.1

