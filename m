From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH] reiserfs: remove unneeded i_version bump
Date: Mon, 30 Oct 2017 11:20:15 -0400
Message-ID: <20171030152015.9444-1-jlayton@kernel.org>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

From: Jeff Layton <jlayton@redhat.com>

The i_version field in reiserfs is not initialized and is only ever
updated here. Nothing ever views it, so just remove it.

Signed-off-by: Jeff Layton <jlayton@redhat.com>
---
 fs/reiserfs/super.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 5464ec517702..4885c7b6e44f 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -2591,7 +2591,6 @@ static ssize_t reiserfs_quota_write(struct super_block *sb, int type,
 		return err;
 	if (inode->i_size < off + len - towrite)
 		i_size_write(inode, off + len - towrite);
-	inode->i_version++;
 	inode->i_mtime = inode->i_ctime = current_time(inode);
 	mark_inode_dirty(inode);
 	return len - towrite;
-- 
2.13.6

