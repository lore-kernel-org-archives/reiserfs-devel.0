From: Tom Rix <trix@redhat.com>
Subject: [PATCH] reiserfs: remove unused sched_count variable
Date: Sun, 26 Mar 2023 16:44:59 -0400
Message-ID: <20230326204459.1358553-1-trix@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679863509;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=7IOcXTh9I7uiQA9WNwWCeWSt6lyYLrODB3Q4jVF7TuE=;
        b=Q3K1uMNS/U7BrfffwNBnP7S0vPGqBrv3fiy8W0zhayYQidTsBGFndMY1SC3OE01JtZytIF
        PFbypRn4fTppU5l4cJpDLg8Z/QXR+G4Rxl4Lt29a9gJas7hWC5Zj/ETj8Uq9MCAerFsFGE
        3Xrwoj3Of2mTpdGY7mcQ7OwSxoTqjcg=
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: nathan@kernel.org, ndesaulniers@google.com, willy@infradead.org, akpm@linux-foundation.org, jack@suse.cz, jlayton@kernel.org, song@kernel.org, yi.zhang@huawei.com, bvanassche@acm.org
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Tom Rix <trix@redhat.com>

clang with W=1 reports
fs/reiserfs/journal.c:3034:6: error: variable
  'sched_count' set but not used [-Werror,-Wunused-but-set-variable]
        int sched_count = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/reiserfs/journal.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 9ce4ec296b74..4d11d60f493c 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -3031,7 +3031,6 @@ static int do_journal_begin_r(struct reiserfs_transaction_handle *th,
 	unsigned int old_trans_id;
 	struct reiserfs_journal *journal = SB_JOURNAL(sb);
 	struct reiserfs_transaction_handle myth;
-	int sched_count = 0;
 	int retval;
 	int depth;
 
@@ -3088,7 +3087,6 @@ static int do_journal_begin_r(struct reiserfs_transaction_handle *th,
 		    ((journal->j_len + nblocks + 2) * 100) <
 		    (journal->j_len_alloc * 75)) {
 			if (atomic_read(&journal->j_wcount) > 10) {
-				sched_count++;
 				queue_log_writer(sb);
 				goto relock;
 			}
-- 
2.27.0

