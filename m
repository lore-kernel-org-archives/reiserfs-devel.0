From: Jan Kara <jack@suse.cz>
Subject: [PATCH 5/7] reiserfs: Make flush bios explicitely sync
Date: Tue,  2 May 2017 17:03:49 +0200
Message-ID: <20170502150351.29452-6-jack@suse.cz>
References: <20170502150351.29452-1-jack@suse.cz>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20170502150351.29452-1-jack@suse.cz>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org
Cc: Christoph Hellwig <hch@infradead.org>, Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org

Commit b685d3d65ac7 "block: treat REQ_FUA and REQ_PREFLUSH as
synchronous" removed REQ_SYNC flag from WRITE_{FUA|PREFLUSH|...}
definitions.  generic_make_request_checks() however strips REQ_FUA and
REQ_PREFLUSH flags from a bio when the storage doesn't report volatile
write cache and thus write effectively becomes asynchronous which can
lead to performance regressions

Fix the problem by making sure all bios which are synchronous are
properly marked with REQ_SYNC.

Fixes: b685d3d65ac791406e0dfd8779cc9b3707fea5a3
CC: reiserfs-devel@vger.kernel.org
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/journal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index aa40c242f1db..64a4d3c82125 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -1112,7 +1112,7 @@ static int flush_commit_list(struct super_block *s,
 		depth = reiserfs_write_unlock_nested(s);
 		if (reiserfs_barrier_flush(s))
 			__sync_dirty_buffer(jl->j_commit_bh,
-					REQ_PREFLUSH | REQ_FUA);
+					REQ_SYNC | REQ_PREFLUSH | REQ_FUA);
 		else
 			sync_dirty_buffer(jl->j_commit_bh);
 		reiserfs_write_lock_nested(s, depth);
@@ -1271,7 +1271,7 @@ static int _update_journal_header_block(struct super_block *sb,
 
 		if (reiserfs_barrier_flush(sb))
 			__sync_dirty_buffer(journal->j_header_bh,
-					REQ_PREFLUSH | REQ_FUA);
+					REQ_SYNC | REQ_PREFLUSH | REQ_FUA);
 		else
 			sync_dirty_buffer(journal->j_header_bh);
 
-- 
2.12.0

