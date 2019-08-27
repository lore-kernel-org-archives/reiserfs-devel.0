From: Jason Yan <yanaijie@huawei.com>
Subject: [PATCH 1/2] reiserfs: remove set but not used variable in journal.c
Date: Tue, 27 Aug 2019 11:29:31 +0800
Message-ID: <20190827032932.46622-1-yanaijie@huawei.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, sfr@canb.auug.org.au, jack@suse.cz, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Yan <yanaijie@huawei.com>

Fix the following gcc warning:

fs/reiserfs/journal.c: In function flush_used_journal_lists:
fs/reiserfs/journal.c:1791:6: warning: variable ret set but not used
[-Wunused-but-set-variable]

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 fs/reiserfs/journal.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 75d9d52d489f..4b3e3e73b512 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -1788,7 +1788,6 @@ static int flush_used_journal_lists(struct super_block *s,
 {
 	unsigned long len = 0;
 	unsigned long cur_len;
-	int ret;
 	int i;
 	int limit = 256;
 	struct reiserfs_journal_list *tjl;
@@ -1825,9 +1824,9 @@ static int flush_used_journal_lists(struct super_block *s,
 	 * transactions, but only bother if we've actually spanned
 	 * across multiple lists
 	 */
-	if (flush_jl != jl) {
-		ret = kupdate_transactions(s, jl, &tjl, &trans_id, len, i);
-	}
+	if (flush_jl != jl)
+		kupdate_transactions(s, jl, &tjl, &trans_id, len, i);
+
 	flush_journal_list(s, flush_jl, 1);
 	put_journal_list(s, flush_jl);
 	put_journal_list(s, jl);
-- 
2.17.2

