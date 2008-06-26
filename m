From: Jan Kara <jack@suse.cz>
Subject: [PATCH] reiserfs: Add missing unlock to an error path in reiserfs_quota_write()
Date: Thu, 26 Jun 2008 13:24:00 +0200
Message-ID: <1214479440759-git-send-email-jack@suse.cz>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: n
References: n
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>

When write in reiserfs_quota_write() fails, we have to properly release
i_mutex. One error path has been missing the unlock...

Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/super.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index ed424d7..1d40f2b 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -2165,8 +2165,10 @@ static ssize_t reiserfs_quota_write(struct super_block *sb, int type,
 		blk++;
 	}
 out:
-	if (len == towrite)
+	if (len == towrite) {
+		mutex_unlock(&inode->i_mutex);
 		return err;
+	}
 	if (inode->i_size < off + len - towrite)
 		i_size_write(inode, off + len - towrite);
 	inode->i_version++;
-- 
1.5.2.4

