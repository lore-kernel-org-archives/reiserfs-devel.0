From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Subject: [PATCH] fs: reiserfs: journal: Change return type of
 dirty_one_transaction
Date: Tue, 2 Jul 2019 23:24:30 +0530
Message-ID: <20190702175430.GA5882@hari-Inspiron-1545>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=x2oGE8L2LkldVAnMsmVZNsFIWU5LSlRITuHEbOuWo/Y=;
        b=tJOWbJuLS4Fzr61+fLex6Q30q38/FOeqGM3/ApyK4/nlZpbA4oKGgQI61RokImsF8G
         rWK3/wxaV3eRQnK8ZvLHL1w86i70B8jTfXlShlSwu0Jkhd59S9oUJ7va58GyPHcSKl+J
         2t28wJFsAVAOJ5utTmmDWk4zDww2ifVxNCd9xFgDRcoxv+vyZuJpVRzjC4sIO/QgZ+FI
         21QaF0TeNHCskjM20Kkd5Zi5oYCLzNRH4kPdVvhfDWUkh2T4Hi+XDX92OcE18CcC953X
         MF1VGkVa7qUe35dIrhZLRplmBN2XkQweVEk3UNQ8wK/eqjvfimErBRVjwflT7srmtLyN
         blhw==
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Bharath Vedartham <linux.bhar@gmail.com>, Hariprasad Kelam <hariprasad.kelam@gmail.com>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Change return type of dirty_one_transaction from int to void. As this
function always return success.

Fixes below issue reported by coccicheck
fs/reiserfs/journal.c:1690:5-8: Unneeded variable: "ret". Return "0" on
line 1719

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 fs/reiserfs/journal.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 36346dc..4517a13 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -94,7 +94,7 @@ static int journal_join(struct reiserfs_transaction_handle *th,
 			struct super_block *sb);
 static void release_journal_dev(struct super_block *super,
 			       struct reiserfs_journal *journal);
-static int dirty_one_transaction(struct super_block *s,
+static void dirty_one_transaction(struct super_block *s,
 				 struct reiserfs_journal_list *jl);
 static void flush_async_commits(struct work_struct *work);
 static void queue_log_writer(struct super_block *s);
@@ -1682,12 +1682,11 @@ static int write_one_transaction(struct super_block *s,
 }
 
 /* used by flush_commit_list */
-static int dirty_one_transaction(struct super_block *s,
+static void dirty_one_transaction(struct super_block *s,
 				 struct reiserfs_journal_list *jl)
 {
 	struct reiserfs_journal_cnode *cn;
 	struct reiserfs_journal_list *pjl;
-	int ret = 0;
 
 	jl->j_state |= LIST_DIRTY;
 	cn = jl->j_realblock;
@@ -1716,7 +1715,6 @@ static int dirty_one_transaction(struct super_block *s,
 		}
 		cn = cn->next;
 	}
-	return ret;
 }
 
 static int kupdate_transactions(struct super_block *s,
-- 
2.7.4

