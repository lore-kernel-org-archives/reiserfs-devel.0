From: Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH] fs/reiserfs/journal.c: delete useless variables
Date: Tue, 13 Apr 2021 09:43:16 +0800
Message-ID: <1618278196-17749-1-git-send-email-tiantao6@hisilicon.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jack@suse.cz, rdunlap@infradead.org
Cc: reiserfs-devel@vger.kernel.org, Tian Tao <tiantao6@hisilicon.com>

The value of 'cn' is not used, so just delete it.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 fs/reiserfs/journal.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index e98f993..9edc8e2 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -461,7 +461,6 @@ int reiserfs_in_journal(struct super_block *sb,
 			b_blocknr_t * next_zero_bit)
 {
 	struct reiserfs_journal *journal = SB_JOURNAL(sb);
-	struct reiserfs_journal_cnode *cn;
 	struct reiserfs_list_bitmap *jb;
 	int i;
 	unsigned long bl;
@@ -497,13 +496,12 @@ int reiserfs_in_journal(struct super_block *sb,
 	bl = bmap_nr * (sb->s_blocksize << 3) + bit_nr;
 	/* is it in any old transactions? */
 	if (search_all
-	    && (cn =
-		get_journal_hash_dev(sb, journal->j_list_hash_table, bl))) {
+	    && (get_journal_hash_dev(sb, journal->j_list_hash_table, bl))) {
 		return 1;
 	}
 
 	/* is it in the current transaction.  This should never happen */
-	if ((cn = get_journal_hash_dev(sb, journal->j_hash_table, bl))) {
+	if ((get_journal_hash_dev(sb, journal->j_hash_table, bl))) {
 		BUG();
 		return 1;
 	}
-- 
2.7.4

