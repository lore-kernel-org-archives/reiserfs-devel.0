From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] [v3] reiserfs: change j_timestamp type to time64_t
Date: Fri, 22 Jun 2018 15:32:58 +0200
Message-ID: <20180622133315.221210-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: y2038@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>, Jan Kara <jack@suse.cz>, Jeff Mahoney <jeffm@suse.com>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

This uses the deprecated time_t type but is write-only, and could be
removed, but as Jeff explains, having a timestamp can be usefule for
post-mortem analysis in crash dumps.

In order to remove one of the last instances of time_t, this changes
the type to time64_t, same as j_trans_start_time.

Cc: Jan Kara <jack@suse.cz>
Cc: Jeff Mahoney <jeffm@suse.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This could replace "reiserfs: remove unused j_timestamp" if we decide
that we want to keep that variable.

Posting this patch as an alternative now, while waiting for Jeff to
reply on how important this really is.
---
 fs/reiserfs/reiserfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index 621b9a07080a..e5ca9ed79e54 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -271,7 +271,7 @@ struct reiserfs_journal_list {
 
 	struct mutex j_commit_mutex;
 	unsigned int j_trans_id;
-	time_t j_timestamp;
+	time64_t j_timestamp; /* write-only but useful for crash dump analysis */
 	struct reiserfs_list_bitmap *j_list_bitmap;
 	struct buffer_head *j_commit_bh;	/* commit buffer head */
 	struct reiserfs_journal_cnode *j_realblock;
-- 
2.9.0

