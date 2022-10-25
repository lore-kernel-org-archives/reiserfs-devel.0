From: Li zeming <zeming@nfschina.com>
Subject: [PATCH] reiserfs: journal: Increase jl pointer check
Date: Tue, 25 Oct 2022 16:47:04 +0800
Message-ID: <20221025084704.3922-1-zeming@nfschina.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: willy@infradead.org, jlayton@kernel.org, song@kernel.org, bvanassche@acm.org, neilb@suse.de
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Li zeming <zeming@nfschina.com>

If kzalloc fails to allocate the jl pointer, NULL is returned directly.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 fs/reiserfs/journal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 94addfcefede..d64e9de126c1 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2569,6 +2569,9 @@ static struct reiserfs_journal_list *alloc_journal_list(struct super_block *s)
 	struct reiserfs_journal_list *jl;
 	jl = kzalloc(sizeof(struct reiserfs_journal_list),
 		     GFP_NOFS | __GFP_NOFAIL);
+	if (!jl)
+		return NULL;
+
 	INIT_LIST_HEAD(&jl->j_list);
 	INIT_LIST_HEAD(&jl->j_working_list);
 	INIT_LIST_HEAD(&jl->j_tail_bh_list);
-- 
2.18.2

