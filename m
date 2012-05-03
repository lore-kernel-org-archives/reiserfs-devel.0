From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH] fs/reiserfs/journal.c: add missing brelse
Date: Thu,  3 May 2012 16:12:53 +0200
Message-ID: <1336054373-13293-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Brelse is called to put bhjh on every way out of the function except this one.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/reiserfs/journal.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index b1a0857..1ef9cbc 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2757,8 +2757,10 @@ int journal_init(struct super_block *sb, const char *j_dev_name,
 	    le32_to_cpu(jh->jh_journal.jp_journal_max_commit_age);
 	journal->j_max_trans_age = JOURNAL_MAX_TRANS_AGE;
 
-	if (check_advise_trans_params(sb, journal) != 0)
+	if (check_advise_trans_params(sb, journal) != 0) {
+		brelse(bhjh);
 	        goto free_and_return;
+	}
 	journal->j_default_max_commit_age = journal->j_max_commit_age;
 
 	if (commit_max_age != 0) {
