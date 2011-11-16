From: Davidlohr Bueso <dave@gnu.org>
Subject: [PATCH] reiserfs: delete comments refering to the BKL
Date: Wed, 16 Nov 2011 18:02:22 +0100
Message-ID: <1321462942.11902.2.camel@offworld>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: akpm@linux-foundation.org
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

From: Davidlohr Bueso <dave@gnu.org>

Signed-off-by: Davidlohr Bueso <dave@gnu.org>
---
 fs/reiserfs/journal.c |   11 ++++-------
 1 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index eb71106..cce8e87 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2896,14 +2896,13 @@ int journal_transaction_should_end(struct reiserfs_transaction_handle *th,
 	    journal->j_cnode_free < (journal->j_trans_max * 3)) {
 		return 1;
 	}
-	/* protected by the BKL here */
+
 	journal->j_len_alloc += new_alloc;
 	th->t_blocks_allocated += new_alloc ;
 	return 0;
 }
 
-/* this must be called inside a transaction, and requires the
-** kernel_lock to be held
+/* this must be called inside a transaction
 */
 void reiserfs_block_writes(struct reiserfs_transaction_handle *th)
 {
@@ -2914,8 +2913,7 @@ void reiserfs_block_writes(struct reiserfs_transaction_handle *th)
 	return;
 }
 
-/* this must be called without a transaction started, and does not
-** require BKL
+/* this must be called without a transaction started
 */
 void reiserfs_allow_writes(struct super_block *s)
 {
@@ -2924,8 +2922,7 @@ void reiserfs_allow_writes(struct super_block *s)
 	wake_up(&journal->j_join_wait);
 }
 
-/* this must be called without a transaction started, and does not
-** require BKL
+/* this must be called without a transaction started
 */
 void reiserfs_wait_on_write_block(struct super_block *s)
 {
-- 
1.7.7.2


