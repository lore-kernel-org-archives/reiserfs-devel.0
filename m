From: Colin King <colin.king@canonical.com>
Subject: [PATCH] reiserfs: fix spelling mistake: "tranasction" -> "transaction"
Date: Wed, 16 Aug 2017 09:06:20 +0100
Message-ID: <20170816080620.8440-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@kernel.org>, Jens Axboe <axboe@fb.com>, reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in reiserfs_warning message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/reiserfs/journal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index a11d773e5ff3..0c882a0e2a6e 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -1481,7 +1481,7 @@ static int flush_journal_list(struct super_block *s,
 		if ((!was_jwait) && !buffer_locked(saved_bh)) {
 			reiserfs_warning(s, "journal-813",
 					 "BAD! buffer %llu %cdirty %cjwait, "
-					 "not in a newer tranasction",
+					 "not in a newer transaction",
 					 (unsigned long long)saved_bh->
 					 b_blocknr, was_dirty ? ' ' : '!',
 					 was_jwait ? ' ' : '!');
-- 
2.11.0

