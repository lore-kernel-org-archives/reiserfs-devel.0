From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 2/6] vfs: change ->writeback_inodes() signature
Date: Wed, 07 Jul 2010 02:21:07 +0200
Message-ID: <4C33C873.1030801@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010804090500090908050209"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------010804090500090908050209
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------010804090500090908050209
Content-Type: text/plain;
 name="writeback_inodes-change-signature.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="writeback_inodes-change-signature.patch"

Change signature of ->writeback_inodes() of super_operations
in accordance with the signature of writeback_sb_inodes().

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/fs-writeback.c  |    2 +-
 include/linux/fs.h |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

--- mmotm.orig/fs/fs-writeback.c
+++ mmotm/fs/fs-writeback.c
@@ -556,7 +556,7 @@ static int do_writeback_sb_inodes(struct
 				bool only_this_sb)
 {
 	if (sb->s_op->writeback_inodes)
-		return sb->s_op->writeback_inodes(sb, wb, wbc);
+		return sb->s_op->writeback_inodes(sb, wb, wbc, only_this_sb);
 	return generic_writeback_sb_inodes(sb, wb, wbc, only_this_sb);
 }
 
--- mmotm.orig/include/linux/fs.h
+++ mmotm/include/linux/fs.h
@@ -1577,8 +1577,8 @@ struct super_operations {
 	void (*umount_begin) (struct super_block *);
 	int (*writeback_inodes)(struct super_block *sb,
 				struct bdi_writeback *wb,
-				struct writeback_control *wbc);
-
+				struct writeback_control *wbc,
+				bool only_this_sb);
 	int (*show_options)(struct seq_file *, struct vfsmount *);
 	int (*show_stats)(struct seq_file *, struct vfsmount *);
 #ifdef CONFIG_QUOTA

--------------010804090500090908050209--
