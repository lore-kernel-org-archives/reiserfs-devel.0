From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCH 4/7] reiser4: txnmgr: add reiser4_create_atom() which creates an empty atom without capturing any nodes.
Date: Sun, 17 Aug 2014 19:43:23 +0400
Message-ID: <1408290206-7427-5-git-send-email-intelfx100@gmail.com>
References: <1408290206-7427-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YWkigmguDdItB1jzpjZA3jaI6clMZohG0jkAFn0X2zs=;
        b=rHZ+CmRA2NDS5BQF3g6Qsdxi/5NmjzujAPak2rmQ7af60GQxXdc15tzFOQPNiMAwJ4
         35Z6+u9iEjts1B41sgXE9Lq1hWEGLubMToSIoFYoFWeK8UWJ+pJTYCe0SpdkkT5XjyRD
         bb4u/8yRLbBsN/I6CK31au4kbQpkCMlL0bLjrYqW4eVva68V+lFgjxoGziOmbRWn0+Vc
         b+jfcvlMZ1YDu4IIZ0/3TgsCw1Bwa5xs8KOowbttm9KeAQXO0OU0xgFQ4RmZx+QKSbyd
         3RhDurM03aSJCU/AjH0eB5ucbqOhurnYore2eXDBC7mB4ii2e98KUS5aHmvhWEykvGuo
         nP7w==
In-Reply-To: <1408290206-7427-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/txnmgr.c | 24 ++++++++++++++++++++++++
 fs/reiser4/txnmgr.h |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/fs/reiser4/txnmgr.c b/fs/reiser4/txnmgr.c
index 68070a9..2862940 100644
--- a/fs/reiser4/txnmgr.c
+++ b/fs/reiser4/txnmgr.c
@@ -2050,6 +2050,30 @@ int reiser4_try_capture(jnode *node, znode_lock_mode lock_mode,
 	return ret;
 }
 
+/* This function ensures that the current transcrash has an atom without
+ * capturing anything. If needed, an empty atom is created and assigned.
+ */
+int reiser4_create_atom(void)
+{
+	txn_atom *atom_alloc = NULL;
+	txn_handle *txnh = get_current_context()->trans;
+	int ret;
+
+	do {
+		spin_lock_txnh(txnh);
+		if (txnh->atom == NULL) {
+			spin_unlock_txnh(txnh);
+			/* assign empty atom to the txnh and repeat */
+			ret = atom_begin_and_assign_to_txnh(&atom_alloc, txnh);
+		} else {
+			spin_unlock_txnh(txnh);
+			ret = 0;
+		}
+	} while (ret == -E_REPEAT);
+
+	return ret;
+}
+
 static void release_two_atoms(txn_atom *one, txn_atom *two)
 {
 	spin_unlock_atom(one);
diff --git a/fs/reiser4/txnmgr.h b/fs/reiser4/txnmgr.h
index 72b84a2..50a1f54 100644
--- a/fs/reiser4/txnmgr.h
+++ b/fs/reiser4/txnmgr.h
@@ -437,6 +437,8 @@ extern void reiser4_uncapture_jnode(jnode *);
 extern int reiser4_capture_inode(struct inode *);
 extern int reiser4_uncapture_inode(struct inode *);
 
+extern int reiser4_create_atom(void);
+
 extern txn_atom *get_current_atom_locked_nocheck(void);
 
 #if REISER4_DEBUG
-- 
2.0.4

