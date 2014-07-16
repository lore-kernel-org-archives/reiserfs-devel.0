From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [veryRFC] [PATCH 1/2] reiser4: discard support: perform discards and deallocations after writing logs.
Date: Wed, 16 Jul 2014 15:24:03 +0400
Message-ID: <1405509844-30070-2-git-send-email-intelfx100@gmail.com>
References: <53C652BE.4010203@gmail.com>
 <1405509844-30070-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=U6J2ebhSejxzPkdUGlkU4gvgsjJkMlS/udan7CUEPto=;
        b=uMxRqAWoVULl8DcPHr59A9Aj4Ef1c9cQ3ObpKXp8Ey7/m/BlE3pd0WpdiZKtmER82x
         Djtz93I8TU1bqSJ76Q3/c1ALh0tAHh/hCcvfZ6Y8d/+gf5esiyZ6diFNs066l/7+AeZF
         FqKp2fLEKWK/fBfdgXZJx4535rLF5+bm1vCGKdr8jsN24HiZHyNdTLgZ6mAXwEuvC74g
         zDpILbzHqWLR/NlgTIGeenU+UZXJor/UQfKK5ye4IQH8fEq3BlS8DVWUxEFJCmtyB8Yb
         tHepnXxrecAyqoMKEF/yl3aeGxAVoXI5BqpkWI8IS8GPkXmwkT1eI4e5jernLJN96t0A
         SujA==
In-Reply-To: <1405509844-30070-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: edward.shishkin@gmail.com
Cc: reiserfs-devel@vger.kernel.org, Ivan Shapovalov <intelfx100@gmail.com>

reiser4_post_write_back_hook() is now used for both of these things.
The call is moved after journalling code is done with deallocations.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/block_alloc.c | 24 +++++++++++++++++++-----
 fs/reiser4/txnmgr.c      | 11 -----------
 fs/reiser4/wander.c      |  3 ++-
 3 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 7b5000b..4ce2a16 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -1136,15 +1136,13 @@ apply_dset(txn_atom * atom UNUSED_ARG, const reiser4_block_nr * a,
 
 void reiser4_post_commit_hook(void)
 {
+#ifdef REISER4_DEBUG
 	txn_atom *atom;
 
 	atom = get_current_atom_locked();
 	assert("zam-452", atom->stage == ASTAGE_POST_COMMIT);
 	spin_unlock_atom(atom);
-
-	/* do the block deallocation which was deferred
-	   until commit is done */
-	atom_dset_deferred_apply(atom, apply_dset, NULL, 0);
+#endif
 
 	assert("zam-504", get_current_super_private() != NULL);
 	sa_post_commit_hook();
@@ -1152,8 +1150,24 @@ void reiser4_post_commit_hook(void)
 
 void reiser4_post_write_back_hook(void)
 {
-	assert("zam-504", get_current_super_private() != NULL);
+	txn_atom *atom;
+	int ret;
 
+	/* process and issue discard requests */
+	do {
+		atom = get_current_atom_locked();
+		ret = discard_atom(*atom);
+	} while (ret == -E_REPEAT);
+
+	if (ret) {
+		warning("intelfx-8", "discard atom failed (%ld)", ret);
+	}
+
+	/* do the block deallocation which was deferred
+	   until commit is done */
+	atom_dset_deferred_apply(atom, apply_dset, NULL, 0);
+
+	assert("zam-504", get_current_super_private() != NULL);
 	sa_post_write_back_hook();
 }
 
diff --git a/fs/reiser4/txnmgr.c b/fs/reiser4/txnmgr.c
index f27d1dc..317bc4f 100644
--- a/fs/reiser4/txnmgr.c
+++ b/fs/reiser4/txnmgr.c
@@ -1089,17 +1089,6 @@ static int commit_current_atom(long *nr_submitted, txn_atom ** atom)
 	if (ret < 0)
 		reiser4_panic("zam-597", "write log failed (%ld)\n", ret);
 
-	/* process and issue discard requests */
-	do {
-		spin_lock_atom(*atom);
-		ret = discard_atom(*atom);
-	} while (ret == -E_REPEAT);
-
-	if (ret) {
-		warning("intelfx-8", "discard atom failed (%ld)", ret);
-		ret = 0; /* the discard is optional, don't fail the commit */
-	}
-
 	/* The atom->ovrwr_nodes list is processed under commit mutex held
 	   because of bitmap nodes which are captured by special way in
 	   reiser4_pre_commit_hook_bitmap(), that way does not include
diff --git a/fs/reiser4/wander.c b/fs/reiser4/wander.c
index 4e29de8..04ddec6 100644
--- a/fs/reiser4/wander.c
+++ b/fs/reiser4/wander.c
@@ -1252,7 +1252,6 @@ int reiser4_write_logs(long *nr_submitted)
 	reiser4_post_commit_hook();
 
 	ret = write_tx_back(&ch);
-	reiser4_post_write_back_hook();
 
       up_and_ret:
 	if (ret) {
@@ -1265,6 +1264,8 @@ int reiser4_write_logs(long *nr_submitted)
 	dealloc_tx_list(&ch);
 	dealloc_wmap(&ch);
 
+	reiser4_post_write_back_hook();
+
 	put_overwrite_set(&ch);
 
 	done_commit_handle(&ch);
-- 
2.0.1

