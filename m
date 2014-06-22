From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv6 2/5] reiser4: add an implementation of "block lists", splitted off the discard code.
Date: Sun, 22 Jun 2014 14:48:43 +0400
Message-ID: <1403434126-6390-3-git-send-email-intelfx100@gmail.com>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qL1vqJb80iCgpkJh/qlhPv1eCjvse8lsf+EAhDKpUpg=;
        b=vocjcA/Ba+sSK8bCxcRKc8gvTFFAwNTmsx3CkinmnfVUxhGXnl3BWmCt8ALERoLfOA
         0JMFqpoETZ9Blnmb7jMXydpDd8EAXhOZR/SqRG12Pm/LKTH+2+2drANQPaXUgxrEzdKS
         bUSZEzqX+MRXZ+AirgdeQ5mujcXmsrRKjnPLq7UYgqZdBQCoemtBSSfb26WlAshhcSjC
         KhIQ2U/zxuINPjlzNnbl0FtgTUnOdAMv3KuB3eJyhtiVo1DNRQ5H/g+5rIimc3vSXza9
         gYBjd2v3iSz9jkDr9lByu0C0oMyDmnGhKpFlD+qlM//cKrtws28vABrzDP8gQSbNKP41
         HjEg==
In-Reply-To: <1403434126-6390-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

The block list is a less memory efficient, but ordered (and thus sortable)
implementation of the same concept as the blocknr_set.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/Makefile      |   1 +
 fs/reiser4/blocknrlist.c | 311 +++++++++++++++++++++++++++++++++++++++++++++++
 fs/reiser4/forward.h     |   1 +
 fs/reiser4/txnmgr.h      |  19 +++
 4 files changed, 332 insertions(+)
 create mode 100644 fs/reiser4/blocknrlist.c

diff --git a/fs/reiser4/Makefile b/fs/reiser4/Makefile
index ff73d43..9f07194 100644
--- a/fs/reiser4/Makefile
+++ b/fs/reiser4/Makefile
@@ -46,6 +46,7 @@ reiser4-y := \
 		   status_flags.o \
 		   init_super.o \
 		   safe_link.o \
+		   blocknrlist.o \
            \
 		   plugin/plugin.o \
 		   plugin/plugin_set.o \
diff --git a/fs/reiser4/blocknrlist.c b/fs/reiser4/blocknrlist.c
new file mode 100644
index 0000000..2868771
--- /dev/null
+++ b/fs/reiser4/blocknrlist.c
@@ -0,0 +1,311 @@
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+ * reiser4/README */
+
+/* This is a block list implementation, used to create ordered block sets
+   (at the cost of being less memory efficient than blocknr_set).
+   It is used by discard code. */
+
+#include "debug.h"
+#include "dformat.h"
+#include "txnmgr.h"
+#include "context.h"
+
+#include <linux/slab.h>
+#include <linux/list_sort.h>
+
+/**
+ * Represents an extent range [@start; @end).
+ */
+struct blocknr_list_entry {
+	reiser4_block_nr start, len;
+	struct list_head link;
+};
+
+#define blocknr_list_entry(ptr) list_entry(ptr, blocknr_list_entry, link)
+
+static void blocknr_list_entry_init(blocknr_list_entry *entry)
+{
+	assert("intelfx-11", entry != NULL);
+
+	entry->start = 0;
+	entry->len = 0;
+	INIT_LIST_HEAD(&entry->link);
+}
+
+static blocknr_list_entry *blocknr_list_entry_alloc(void)
+{
+	blocknr_list_entry *entry;
+
+	entry = (blocknr_list_entry *)kmalloc(sizeof(blocknr_list_entry),
+	                                      reiser4_ctx_gfp_mask_get());
+	if (entry == NULL) {
+		return NULL;
+	}
+
+	blocknr_list_entry_init(entry);
+
+	return entry;
+}
+
+static void blocknr_list_entry_free(blocknr_list_entry *entry)
+{
+	assert("intelfx-12", entry != NULL);
+
+	kfree(entry);
+}
+
+/**
+ * Given ranges @to and [@start; @end), if they overlap, their union
+ * is calculated and saved in @to.
+ */
+static int blocknr_list_entry_merge(blocknr_list_entry *to,
+                                    reiser4_block_nr start,
+                                    reiser4_block_nr len)
+{
+	reiser4_block_nr end, to_end;
+
+	assert("intelfx-13", to != NULL);
+
+	assert("intelfx-16", to->len > 0);
+	assert("intelfx-17", len > 0);
+
+	end = start + len;
+	to_end = to->start + to->len;
+
+	if ((to->start <= end) && (start <= to_end)) {
+		if (start < to->start) {
+			to->start = start;
+		}
+
+		if (end > to_end) {
+			to_end = end;
+		}
+
+		to->len = to_end - to->start;
+
+		return 0;
+	}
+
+	return -1;
+}
+
+static int blocknr_list_entry_merge_entry(blocknr_list_entry *to,
+                                          blocknr_list_entry *from)
+{
+	assert("intelfx-18", from != NULL);
+
+	return blocknr_list_entry_merge(to, from->start, from->len);
+}
+
+/**
+ * A comparison function for list_sort().
+ *
+ * "The comparison function @cmp must return a negative value if @a
+ * should sort before @b, and a positive value if @a should sort after
+ * @b. If @a and @b are equivalent, and their original relative
+ * ordering is to be preserved, @cmp must return 0."
+ */
+static int blocknr_list_entry_compare(void* priv UNUSED_ARG,
+                                      struct list_head *a, struct list_head *b)
+{
+	blocknr_list_entry *entry_a, *entry_b;
+	reiser4_block_nr entry_a_end, entry_b_end;
+
+	assert("intelfx-19", a != NULL);
+	assert("intelfx-20", b != NULL);
+
+	entry_a = blocknr_list_entry(a);
+	entry_b = blocknr_list_entry(b);
+
+	entry_a_end = entry_a->start + entry_a->len;
+	entry_b_end = entry_b->start + entry_b->len;
+
+	/* First sort by starting block numbers... */
+	if (entry_a->start < entry_b->start) {
+		return -1;
+	}
+
+	if (entry_a->start > entry_b->start) {
+		return 1;
+	}
+
+	/** Then by ending block numbers.
+	 * If @a contains @b, it will be sorted before. */
+	if (entry_a_end > entry_b_end) {
+		return -1;
+	}
+
+	if (entry_a_end < entry_b_end) {
+		return 1;
+	}
+
+	return 0;
+}
+
+void blocknr_list_init(struct list_head* blist)
+{
+	assert("intelfx-24", blist != NULL);
+
+	INIT_LIST_HEAD(blist);
+}
+
+void blocknr_list_destroy(struct list_head* blist)
+{
+	struct list_head *pos, *tmp;
+	blocknr_list_entry *entry;
+
+	assert("intelfx-25", blist != NULL);
+
+	list_for_each_safe(pos, tmp, blist) {
+		entry = blocknr_list_entry(pos);
+		list_del_init(pos);
+		blocknr_list_entry_free(entry);
+	}
+
+	assert("intelfx-48", list_empty(blist));
+}
+
+void blocknr_list_merge(struct list_head *from, struct list_head *to)
+{
+	assert("intelfx-26", from != NULL);
+	assert("intelfx-27", to != NULL);
+
+	list_splice_tail_init(from, to);
+
+	assert("intelfx-49", list_empty(from));
+}
+
+void blocknr_list_sort_and_join(struct list_head *blist)
+{
+	struct list_head *pos, *next;
+	struct blocknr_list_entry *entry, *next_entry;
+
+	assert("intelfx-50", blist != NULL);
+
+	/* Step 1. Sort the extent list. */
+	list_sort(NULL, blist, blocknr_list_entry_compare);
+
+	/* Step 2. Join adjacent extents in the list. */
+	pos = blist->next;
+	next = pos->next;
+	entry = blocknr_list_entry(pos);
+
+	for (; next != blist; next = pos->next) {
+		/** @next is a valid node at this point */
+		next_entry = blocknr_list_entry(next);
+
+		/** try to merge @next into @pos */
+		if (!blocknr_list_entry_merge_entry(entry, next_entry)) {
+			/** successful; delete the @next node.
+			 * next merge will be attempted into the same node. */
+			list_del_init(next);
+			blocknr_list_entry_free(next_entry);
+		} else {
+			/** otherwise advance @pos. */
+			pos = next;
+			entry = next_entry;
+		}
+	}
+}
+
+int blocknr_list_add_extent(txn_atom *atom,
+                            struct list_head *blist,
+                            blocknr_list_entry **new_entry,
+                            const reiser4_block_nr *start,
+                            const reiser4_block_nr *len)
+{
+	assert("intelfx-29", atom != NULL);
+	assert("intelfx-42", atom_is_protected(atom));
+	assert("intelfx-43", blist != NULL);
+	assert("intelfx-30", new_entry != NULL);
+	assert("intelfx-31", start != NULL);
+	assert("intelfx-32", len != NULL && *len > 0);
+
+	if (*new_entry == NULL) {
+		/*
+		 * Optimization: try to merge new extent into the last one.
+		 */
+		if (!list_empty(blist)) {
+			blocknr_list_entry *last_entry;
+			last_entry = blocknr_list_entry(blist->prev);
+			if (!blocknr_list_entry_merge(last_entry, *start, *len)) {
+				return 0;
+			}
+		}
+
+		/*
+		 * Otherwise, allocate a new entry and tell -E_REPEAT.
+		 * Next time we'll take the branch below.
+		 */
+		spin_unlock_atom(atom);
+		*new_entry = blocknr_list_entry_alloc();
+		return (*new_entry != NULL) ? -E_REPEAT : RETERR(-ENOMEM);
+	}
+
+	/*
+	 * The entry has been allocated beforehand, fill it and link to the list.
+	 */
+	(*new_entry)->start = *start;
+	(*new_entry)->len = *len;
+	list_add_tail(&(*new_entry)->link, blist);
+
+	return 0;
+}
+
+int blocknr_list_iterator(txn_atom *atom,
+                          struct list_head *blist,
+                          blocknr_set_actor_f actor,
+                          void *data,
+                          int delete)
+{
+	struct list_head *pos;
+	blocknr_list_entry *entry;
+	int ret = 0;
+
+	assert("intelfx-46", blist != NULL);
+	assert("intelfx-47", actor != NULL);
+
+	if (delete) {
+		struct list_head *tmp;
+
+		list_for_each_safe(pos, tmp, blist) {
+			entry = blocknr_list_entry(pos);
+
+			/*
+			 * Do not exit, delete flag is set. Instead, on the first error we
+			 * downgrade from iterating to just deleting.
+			 */
+			if (ret == 0) {
+				ret = actor(atom, &entry->start, &entry->len, data);
+			}
+
+			list_del_init(pos);
+			blocknr_list_entry_free(entry);
+		}
+
+		assert("intelfx-44", list_empty(blist));
+	} else {
+		list_for_each(pos, blist) {
+			entry = blocknr_list_entry(pos);
+
+			ret = actor(atom, &entry->start, &entry->len, data);
+
+			if (ret != 0) {
+				return ret;
+			}
+		}
+	}
+
+	return ret;
+}
+
+/* Make Linus happy.
+   Local variables:
+   c-indentation-style: "K&R"
+   mode-name: "LC"
+   c-basic-offset: 8
+   tab-width: 8
+   fill-column: 120
+   scroll-step: 1
+   End:
+*/
diff --git a/fs/reiser4/forward.h b/fs/reiser4/forward.h
index 15dbfdc..9170c2b 100644
--- a/fs/reiser4/forward.h
+++ b/fs/reiser4/forward.h
@@ -38,6 +38,7 @@ typedef struct reiser4_dir_entry_desc reiser4_dir_entry_desc;
 typedef struct reiser4_context reiser4_context;
 typedef struct carry_level carry_level;
 typedef struct blocknr_set_entry blocknr_set_entry;
+typedef struct blocknr_list_entry blocknr_list_entry;
 /* super_block->s_fs_info points to this */
 typedef struct reiser4_super_info_data reiser4_super_info_data;
 /* next two objects are fields of reiser4_super_info_data */
diff --git a/fs/reiser4/txnmgr.h b/fs/reiser4/txnmgr.h
index 034a3fe..18ca23d 100644
--- a/fs/reiser4/txnmgr.h
+++ b/fs/reiser4/txnmgr.h
@@ -485,6 +485,25 @@ extern int blocknr_set_iterator(txn_atom * atom, struct list_head * bset,
 				blocknr_set_actor_f actor, void *data,
 				int delete);
 
+/* This is the block list interface (see blocknrlist.c) */
+extern void blocknr_list_init(struct list_head *blist);
+extern void blocknr_list_destroy(struct list_head *blist);
+extern void blocknr_list_merge(struct list_head *from, struct list_head *to);
+extern void blocknr_list_sort_and_join(struct list_head *blist);
+/**
+ * The @atom should be locked.
+ */
+extern int blocknr_list_add_extent(txn_atom *atom,
+                                   struct list_head *blist,
+                                   blocknr_list_entry **new_entry,
+                                   const reiser4_block_nr *start,
+                                   const reiser4_block_nr *len);
+extern int blocknr_list_iterator(txn_atom *atom,
+                                 struct list_head *blist,
+                                 blocknr_set_actor_f actor,
+                                 void *data,
+                                 int delete);
+
 /* flush code takes care about how to fuse flush queues */
 extern void flush_init_atom(txn_atom * atom);
 extern void flush_fuse_queues(txn_atom * large, txn_atom * small);
-- 
2.0.0

