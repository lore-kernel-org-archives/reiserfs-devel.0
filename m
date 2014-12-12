From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 5/6] reiser4: blocknrlist: add operations blocknr_list_del() and blocknr_list_update_extent().
Date: Sat, 13 Dec 2014 00:10:31 +0300
Message-ID: <1418418632-18396-6-git-send-email-intelfx100@gmail.com>
References: <1418418632-18396-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KDCSQMMlG2H/duTSl+nJ+P0uBts+ITfk0bhcYHLFFss=;
        b=axrcptkPFWhYxV7Ro07wdqusTFiHsN7SdHAkQAGm9eQo55REf51SnxQ6TXv+H/gWNK
         /gNsTkEYjBIUvP4p+Poubn4xFyusGbNAWQWPSY/f+HwtO3sItvUcuP3NF38C1Wfv+Tkq
         Ewa3kGbLm5Ai/UB9SwbU2ehgE1NtECQeFWhMRXbrSiYmfzJNIO8gyDu64dctY7gI3UrV
         dM/kMBDwlPwk8rdJUEh2f/ifSs8Ub5IoVchHhUkigARE9R9x1sYfSu9UcDTSNYgLv+5s
         ATPpdJfhzEqq607NCkkC15TNzYAzXg69RBUVghWxhJdumNqjN167lu5A9eCHOgtq8TOp
         WWCw==
In-Reply-To: <1418418632-18396-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/blocknrlist.c | 28 ++++++++++++++++++++++++++++
 fs/reiser4/txnmgr.h      |  4 ++++
 2 files changed, 32 insertions(+)

diff --git a/fs/reiser4/blocknrlist.c b/fs/reiser4/blocknrlist.c
index 806c59d..4f80a53 100644
--- a/fs/reiser4/blocknrlist.c
+++ b/fs/reiser4/blocknrlist.c
@@ -243,6 +243,17 @@ void blocknr_list_sort_and_join(struct list_head *blist)
 	}
 }
 
+void blocknr_list_del(struct list_head *blist)
+{
+	struct blocknr_list_entry *entry;
+
+	assert("intelfx-72", blist != NULL);
+
+	entry = blocknr_list_entry(blist);
+	list_del_init (blist);
+	blocknr_list_entry_free(entry);
+}
+
 int blocknr_list_add_extent(txn_atom *atom,
                             struct list_head *blist,
                             blocknr_list_entry **new_entry,
@@ -287,6 +298,23 @@ int blocknr_list_add_extent(txn_atom *atom,
 	return 0;
 }
 
+void blocknr_list_update_extent(struct list_head *blist,
+                                const reiser4_block_nr *start,
+                                const reiser4_block_nr *len)
+{
+	blocknr_list_entry *entry;
+
+	assert("intelfx-73", blist != NULL);
+
+	entry = blocknr_list_entry(blist);
+	if (start != NULL) {
+		entry->start = *start;
+	}
+	if (len != NULL) {
+		entry->len = *len;
+	}
+}
+
 int blocknr_list_iterator(txn_atom *atom,
                           struct list_head *blist,
                           blocknr_set_actor_f actor,
diff --git a/fs/reiser4/txnmgr.h b/fs/reiser4/txnmgr.h
index 0350e8f..d2b8e95 100644
--- a/fs/reiser4/txnmgr.h
+++ b/fs/reiser4/txnmgr.h
@@ -509,6 +509,7 @@ extern void blocknr_list_init(struct list_head *blist);
 extern void blocknr_list_destroy(struct list_head *blist);
 extern void blocknr_list_merge(struct list_head *from, struct list_head *to);
 extern void blocknr_list_sort_and_join(struct list_head *blist);
+extern void blocknr_list_del(struct list_head *blist);
 extern reiser4_block_nr blocknr_list_entry_start(struct list_head *blist);
 extern reiser4_block_nr blocknr_list_entry_len(struct list_head *blist);
 /**
@@ -519,6 +520,9 @@ extern int blocknr_list_add_extent(txn_atom *atom,
                                    blocknr_list_entry **new_entry,
                                    const reiser4_block_nr *start,
                                    const reiser4_block_nr *len);
+extern void blocknr_list_update_extent(struct list_head *blist,
+                                       const reiser4_block_nr *start,
+                                       const reiser4_block_nr *len);
 extern int blocknr_list_iterator(txn_atom *atom,
                                  struct list_head *blist,
                                  blocknr_set_actor_f actor,
-- 
2.1.3

