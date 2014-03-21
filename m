From: Fabian Frederick <fabf@skynet.be>
Subject: [RFC 1/1] fs/reiserfs/journal.c: Remove obsolete  __GFP_NOFAIL
Date: Fri, 21 Mar 2014 17:18:30 +0100
Message-ID: <20140321171830.ef47fdea1a3a2f2921c8fe86@skynet.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: reiserfs-devel@vger.kernel.org, akpm <akpm@linux-foundation.org>

Loop around congestion_wait on allocation failure/alloc_journal_list
like already fixed in other FS.

(Does it need returning -ENOMEM after some retries ?)

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/reiserfs/journal.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index fd77703..e8c56a9 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2487,8 +2487,13 @@ static int journal_read(struct super_block *sb)
 static struct reiserfs_journal_list *alloc_journal_list(struct super_block *s)
 {
 	struct reiserfs_journal_list *jl;
-	jl = kzalloc(sizeof(struct reiserfs_journal_list),
-		     GFP_NOFS | __GFP_NOFAIL);
+
+	do {
+		jl = kzalloc(sizeof(struct reiserfs_journal_list), GFP_NOFS);
+		if (unlikely(!jl))
+			congestion_wait(BLK_RW_ASYNC, HZ/50);
+	} while (!jl)
+
 	INIT_LIST_HEAD(&jl->j_list);
 	INIT_LIST_HEAD(&jl->j_working_list);
 	INIT_LIST_HEAD(&jl->j_tail_bh_list);
-- 
1.8.4.5

