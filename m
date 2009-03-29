From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: [PATCH] reiserfs: fix blkdev_issue_flush() failure handling
Date: Sun, 29 Mar 2009 19:29:40 +0200
Message-ID: <200903291929.40523.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:mime-version:content-type:content-transfer-encoding
         :content-disposition:message-id;
        bh=tIqYwU+QG6Lak6gYahaHHgFvba9W3LekxXI96pfKDYU=;
        b=TAIMvIg44eyoJaEjlJhhvsHqwLfR7YCIe4Ldn4hNkLxsXj48JgN9qD2P/7aqx1srmY
         YFGcpfrrWMDGYeTAUAPQrpuHu/bYExu8UkoYl2qjVbxE7+PQtlYTAeqgYnFbq6TOVJv3
         eLXZU6wUr5EleiBgR9aTafdfctMmmjL89Y++I=
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

blkdev_issue_flush() may fail (i.e. due to media error on FLUSH CACHE
command execution) so its users should check for the return value.

Signed-off-by: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
---
 fs/reiserfs/file.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

Index: b/fs/reiserfs/file.c
===================================================================
--- a/fs/reiserfs/file.c
+++ b/fs/reiserfs/file.c
@@ -140,14 +140,18 @@ static int reiserfs_sync_file(struct fil
 	struct inode *p_s_inode = p_s_dentry->d_inode;
 	int n_err;
 	int barrier_done;
+	int tmp_ret;
 
 	BUG_ON(!S_ISREG(p_s_inode->i_mode));
 	n_err = sync_mapping_buffers(p_s_inode->i_mapping);
 	reiserfs_write_lock(p_s_inode->i_sb);
 	barrier_done = reiserfs_commit_for_inode(p_s_inode);
 	reiserfs_write_unlock(p_s_inode->i_sb);
-	if (barrier_done != 1 && reiserfs_barrier_flush(p_s_inode->i_sb))
-		blkdev_issue_flush(p_s_inode->i_sb->s_bdev, NULL);
+	if (barrier_done != 1 && reiserfs_barrier_flush(p_s_inode->i_sb)) {
+		tmp_ret = blkdev_issue_flush(p_s_inode->i_sb->s_bdev, NULL);
+		if (n_err == 0 && tmp_ret < 0 && tmp_ret != -EOPNOTSUPP)
+			n_err = tmp_ret;
+	}
 	if (barrier_done < 0)
 		return barrier_done;
 	return (n_err < 0) ? -EIO : 0;
