From: Yan Burman <burman.yan@gmail.com>
Subject: [PATCH 2.6.19-rc6] reiser: replace kmalloc+memset with kzalloc
Date: Fri, 24 Nov 2006 14:05:50 +0200
Message-ID: <4566E01E.2020201@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30213-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-kernel@vger.kernel.org
Cc: reiserfs-list@namesys.com, trivial@kernel.org

Replace kmalloc+memset with kzalloc

Signed-off-by: Yan Burman <burman.yan@gmail.com>

diff -rubp linux-2.6.19-rc5_orig/fs/reiserfs/file.c linux-2.6.19-rc5_kzalloc/fs/reiserfs/file.c
--- linux-2.6.19-rc5_orig/fs/reiserfs/file.c	2006-11-09 12:16:20.000000000 +0200
+++ linux-2.6.19-rc5_kzalloc/fs/reiserfs/file.c	2006-11-11 22:44:04.000000000 +0200
@@ -316,12 +316,11 @@ static int reiserfs_allocate_blocks_for_
 			/* area filled with zeroes, to supply as list of zero blocknumbers
 			   We allocate it outside of loop just in case loop would spin for
 			   several iterations. */
-			char *zeros = kmalloc(to_paste * UNFM_P_SIZE, GFP_ATOMIC);	// We cannot insert more than MAX_ITEM_LEN bytes anyway.
+			char *zeros = kzalloc(to_paste * UNFM_P_SIZE, GFP_ATOMIC);	// We cannot insert more than MAX_ITEM_LEN bytes anyway.
 			if (!zeros) {
 				res = -ENOMEM;
 				goto error_exit_free_blocks;
 			}
-			memset(zeros, 0, to_paste * UNFM_P_SIZE);
 			do {
 				to_paste =
 				    min_t(__u64, hole_size,
diff -rubp linux-2.6.19-rc5_orig/fs/reiserfs/inode.c linux-2.6.19-rc5_kzalloc/fs/reiserfs/inode.c
--- linux-2.6.19-rc5_orig/fs/reiserfs/inode.c	2006-11-09 12:16:20.000000000 +0200
+++ linux-2.6.19-rc5_kzalloc/fs/reiserfs/inode.c	2006-11-11 22:44:04.000000000 +0200
@@ -928,15 +928,12 @@ int reiserfs_get_block(struct inode *ino
 			if (blocks_needed == 1) {
 				un = &unf_single;
 			} else {
-				un = kmalloc(min(blocks_needed, max_to_insert) * UNFM_P_SIZE, GFP_ATOMIC);	// We need to avoid scheduling.
+				un = kzalloc(min(blocks_needed, max_to_insert) * UNFM_P_SIZE, GFP_ATOMIC);	// We need to avoid scheduling.
 				if (!un) {
 					un = &unf_single;
 					blocks_needed = 1;
 					max_to_insert = 0;
-				} else
-					memset(un, 0,
-					       UNFM_P_SIZE * min(blocks_needed,
-								 max_to_insert));
+				}
 			}
 			if (blocks_needed <= max_to_insert) {
 				/* we are going to add target block to the file. Use allocated
diff -rubp linux-2.6.19-rc5_orig/fs/reiserfs/super.c linux-2.6.19-rc5_kzalloc/fs/reiserfs/super.c
--- linux-2.6.19-rc5_orig/fs/reiserfs/super.c	2006-11-09 12:16:20.000000000 +0200
+++ linux-2.6.19-rc5_kzalloc/fs/reiserfs/super.c	2006-11-11 22:44:04.000000000 +0200
@@ -1549,13 +1549,12 @@ static int reiserfs_fill_super(struct su
 	struct reiserfs_sb_info *sbi;
 	int errval = -EINVAL;
 
-	sbi = kmalloc(sizeof(struct reiserfs_sb_info), GFP_KERNEL);
+	sbi = kzalloc(sizeof(struct reiserfs_sb_info), GFP_KERNEL);
 	if (!sbi) {
 		errval = -ENOMEM;
 		goto error;
 	}
 	s->s_fs_info = sbi;
-	memset(sbi, 0, sizeof(struct reiserfs_sb_info));
 	/* Set default values for options: non-aggressive tails, RO on errors */
 	REISERFS_SB(s)->s_mount_opt |= (1 << REISERFS_SMALLTAIL);
 	REISERFS_SB(s)->s_mount_opt |= (1 << REISERFS_ERROR_RO);


Regards
Yan Burman
