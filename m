From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4: don't capture superblock at sync_fs()
Date: Mon, 08 Aug 2016 21:34:45 +0200
Message-ID: <57A8DED5.90509@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020405030500070901040101"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject;
        bh=6KQxKJKJipsfyyuQylKXXzMh3+Sqga7j+QllZC96l08=;
        b=bi0i3HykpuU9Udfk33FgKIQeXShyA/gq5iCUJ8pvjAlBhhlu6/Id3u6QsXsyDlYCIT
         +nBwiZ6t3M6FUujFuVwnX7T9N+ggw0DtvTiu4TIQv7mavZtzOzK0fKS9XnYxChCI/agE
         BpvFbQVM5qNbZpx/hnOAlD7tf6cVyVIB1PUftt9762SZByRxIeDNvwOZ5TTqJLxWu9uz
         s4uhE8YqOFtH79bfiQLMeiANuCag8LMHcqFaC39YhmqFDrWQPKGJQ3UytM+e28Ft/zkr
         DCbby8MqqktnhYlJQhnla2yjxy6augUtpi30QxreW8TyKT03C/QraSLJ6XkEDO+Tymqy
         xEaw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------020405030500070901040101
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------020405030500070901040101
Content-Type: text/x-patch;
 name="reiser4-dont-capture-superblock.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-dont-capture-superblock.patch"

Don't capture superblock at ->sync_fs().

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/super_ops.c |   15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -401,7 +401,6 @@ static long reiser4_writeback_inodes(str
 /* ->sync_fs() of super operations */
 static int reiser4_sync_fs(struct super_block *super, int wait)
 {
-	int ret;
 	reiser4_context *ctx;
 	struct bdi_writeback *wb;
 	struct wb_writeback_work work = {
@@ -424,14 +423,14 @@ static int reiser4_sync_fs(struct super_
 		return PTR_ERR(ctx);
 	}
 	/*
-	 * Capture znode associated with super block
+	 * We don't capture superblock here.
+	 * Superblock is captured only by operations, which change
+	 * its fields different from free_blocks, nr_files, next_oid.
+	 * After system crash the mentioned fields are recovered from
+	 * journal records, see reiser4_journal_recover_sb_data().
+	 * Also superblock is captured at final commit when releasing
+	 * disk format.
 	 */
-	ret = reiser4_capture_super_block(super);
-	if (ret != 0)
-		warning("vs-1701",
-			"reiser4_capture_super_block failed in write_super: %d",
-			ret);
-
 	wb = &inode_to_bdi(reiser4_get_super_fake(super))->wb;
 	spin_lock(&wb->list_lock);
 	generic_writeback_sb_inodes(super, wb, &wbc, &work, true);

--------------020405030500070901040101--
