From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: fix journal list handling
Date: Mon, 06 May 2013 14:50:33 -0400
Message-ID: <5187FB79.4000206@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>
Cc: Chris Mason <clmason@fusionio.com>

reiserfs has open coded linked lists to handle its cnode infrastructure.

While converting them to list_heads, I found that while the patch looked
perfectly straightforward based on what the code should have been doing,
it caused crashes nearly immediately. The issue can be reproduced
without the conversion by clearing the hprev/hnext pointers in
remove_journal_hash() when the cnode is removed from the hash list.

It turns out that the code has been working by happy accident for over
a decade, though I suspect some very rare BUG()s from the can_dirty
check in flush_journal_list can be traced to this issue.

The gist is that remove_journal_hash is removing a cnode from the
hash list but not from the journal_list that the cnode is also associated
with. It's been working because the can_dirty() check traverses the
hash lists starting with the cnode as a reference point, which still
has pointers into the hash list that it can use (however invalid they
may be). When the list pointers are cleared from the cnode, can_dirty
always returns 1, triggering the BUG(). The issue isn't the buffer state.
It's that the cnode shouldn't be on any of the journal lists anymore.

When flush_journal_list goes to flush older transactions to disk, it
encounters the journal list that contains the cnode removed from the
hash list, uses the old pointers, and then frees the node. The nodes
are freed while still technically on the journal list, but since the
journal list structure itself is also being freed, it hasn't caused
problems.

The correct handling is to remove the cnode from the journal list
as well as the hash list and free it immediately.

This patch:
1) converts the open coded lists to standard kernel list_heads
2) removes the cnode from the assocated journal lists in
   remove_journal_hash
3) ensures nodes are removed from lists before being freed

Cc: Chris Mason <clmason@fusionio.com>
Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/journal.c  |  324 +++++++++++++++++++++----------------------------
 fs/reiserfs/reiserfs.h |   41 ++++--
 2 files changed, 173 insertions(+), 192 deletions(-)

--- a/fs/reiserfs/journal.c	2013-05-06 12:30:21.466081461 -0400
+++ b/fs/reiserfs/journal.c	2013-05-06 12:37:56.859298622 -0400
@@ -117,9 +117,28 @@ static int do_journal_begin_r(struct rei
 
 static void init_journal_hash(struct super_block *sb)
 {
+	int i;
+	struct reiserfs_journal *journal = SB_JOURNAL(sb);
+	for (i = 0; i < JOURNAL_HASH_SIZE; i++) {
+		INIT_LIST_HEAD(&journal->j_list_hash_table[i]);
+		INIT_LIST_HEAD(&journal->j_hash_table[i]);
+	}
+}
+
+static void check_journal_hash_tables(struct super_block *sb)
+{
+	int i;
+	struct reiserfs_journal *journal = SB_JOURNAL(sb);
+	for (i = 0; i < JOURNAL_HASH_SIZE; i++)
+		WARN_ON(!list_empty(&journal->j_hash_table[i]));
+}
+
+static void check_journal_list_hash_tables(struct super_block *sb)
+{
+	int i;
 	struct reiserfs_journal *journal = SB_JOURNAL(sb);
-	memset(journal->j_hash_table, 0,
-	       JOURNAL_HASH_SIZE * sizeof(struct reiserfs_journal_cnode *));
+	for (i = 0; i < JOURNAL_HASH_SIZE; i++)
+		WARN_ON(!list_empty(&journal->j_list_hash_table[i]));
 }
 
 /*
@@ -341,27 +360,24 @@ static struct reiserfs_list_bitmap *get_
 
 /*
 ** allocates a new chunk of X nodes, and links them all together as a list.
-** Uses the cnode->next and cnode->prev pointers
 ** returns NULL on failure
 */
-static struct reiserfs_journal_cnode *allocate_cnodes(int num_cnodes)
+static struct reiserfs_journal_cnode *
+allocate_cnodes(struct reiserfs_journal *journal, int num_cnodes)
 {
 	struct reiserfs_journal_cnode *head;
 	int i;
 	if (num_cnodes <= 0) {
 		return NULL;
 	}
+
 	head = vzalloc(num_cnodes * sizeof(struct reiserfs_journal_cnode));
-	if (!head) {
+	if (!head)
 		return NULL;
-	}
-	head[0].prev = NULL;
-	head[0].next = head + 1;
-	for (i = 1; i < num_cnodes; i++) {
-		head[i].prev = head + (i - 1);
-		head[i].next = head + (i + 1);	/* if last one, overwrite it after the if */
-	}
-	head[num_cnodes - 1].next = NULL;
+
+	for (i = 0; i < num_cnodes; i++)
+		list_add(&head[i].trans_list, &journal->j_cnode_free_list);
+
 	return head;
 }
 
@@ -378,17 +394,22 @@ static struct reiserfs_journal_cnode *ge
 	if (journal->j_cnode_free <= 0) {
 		return NULL;
 	}
+
 	journal->j_cnode_used++;
 	journal->j_cnode_free--;
-	cn = journal->j_cnode_free_list;
-	if (!cn) {
-		return cn;
-	}
-	if (cn->next) {
-		cn->next->prev = NULL;
-	}
-	journal->j_cnode_free_list = cn->next;
-	memset(cn, 0, sizeof(struct reiserfs_journal_cnode));
+
+	cn = list_first_entry(&journal->j_cnode_free_list,
+			      struct reiserfs_journal_cnode, trans_list);
+	list_del_init(&cn->trans_list);
+
+	/* Reinitialize it */
+	cn->sb = sb;
+	cn->bh = NULL;
+	cn->blocknr = 0;
+	cn->state = 0;
+	cn->jlist = NULL;
+	INIT_LIST_HEAD(&cn->hash_list);
+
 	return cn;
 }
 
@@ -404,13 +425,13 @@ static void free_cnode(struct super_bloc
 
 	journal->j_cnode_used--;
 	journal->j_cnode_free++;
-	/* memset(cn, 0, sizeof(struct reiserfs_journal_cnode)) ; */
-	cn->next = journal->j_cnode_free_list;
-	if (journal->j_cnode_free_list) {
-		journal->j_cnode_free_list->prev = cn;
-	}
-	cn->prev = NULL;	/* not needed with the memset, but I might kill the memset, and forget to do this */
-	journal->j_cnode_free_list = cn;
+
+	WARN_ON(!list_empty(&cn->hash_list));
+	WARN_ON(!list_empty(&cn->trans_list));
+	list_del_init(&cn->hash_list);
+	list_del_init(&cn->trans_list);
+
+	list_add_tail(&cn->trans_list, &journal->j_cnode_free_list);
 }
 
 static void clear_prepared_bits(struct buffer_head *bh)
@@ -420,22 +441,17 @@ static void clear_prepared_bits(struct b
 }
 
 /* return a cnode with same dev, block number and size in table, or null if not found */
-static inline struct reiserfs_journal_cnode *get_journal_hash_dev(struct
-								  super_block
-								  *sb,
-								  struct
-								  reiserfs_journal_cnode
-								  **table,
-								  long bl)
+static inline struct reiserfs_journal_cnode *
+get_journal_hash_dev(struct super_block *sb, struct list_head *table, long bl)
 {
 	struct reiserfs_journal_cnode *cn;
-	cn = journal_hash(table, sb, bl);
-	while (cn) {
+	struct list_head *head = journal_hash(table, sb, bl);
+
+	list_for_each_entry(cn, head, hash_list) {
 		if (cn->blocknr == bl && cn->sb == sb)
 			return cn;
-		cn = cn->hnext;
 	}
-	return (struct reiserfs_journal_cnode *)0;
+	return NULL;
 }
 
 /*
@@ -513,18 +529,11 @@ int reiserfs_in_journal(struct super_blo
 
 /* insert cn into table
 */
-static inline void insert_journal_hash(struct reiserfs_journal_cnode **table,
+static inline void insert_journal_hash(struct list_head *table,
 				       struct reiserfs_journal_cnode *cn)
 {
-	struct reiserfs_journal_cnode *cn_orig;
-
-	cn_orig = journal_hash(table, cn->sb, cn->blocknr);
-	cn->hnext = cn_orig;
-	cn->hprev = NULL;
-	if (cn_orig) {
-		cn_orig->hprev = cn;
-	}
-	journal_hash(table, cn->sb, cn->blocknr) = cn;
+	struct list_head *head = journal_hash(table, cn->sb, cn->blocknr);
+	list_add(&cn->hash_list, head);
 }
 
 /* lock the current transaction */
@@ -1143,19 +1152,19 @@ static int flush_commit_list(struct supe
 ** flush_journal_list frequently needs to find a newer transaction for a given block.  This does that, or
 ** returns NULL if it can't find anything
 */
-static struct reiserfs_journal_list *find_newer_jl_for_cn(struct
-							  reiserfs_journal_cnode
-							  *cn)
+static struct reiserfs_journal_list *
+find_newer_jl_for_cn(struct reiserfs_journal_cnode *cn)
 {
 	struct super_block *sb = cn->sb;
 	b_blocknr_t blocknr = cn->blocknr;
+	struct list_head *head = journal_hash_cn(cn);
 
-	cn = cn->hprev;
-	while (cn) {
+	WARN_ON(list_empty(&cn->hash_list));
+	list_for_each_entry_continue_reverse(cn, head, hash_list) {
 		if (cn->sb == sb && cn->blocknr == blocknr && cn->jlist) {
+			BUG_ON(!cn->jlist);
 			return cn->jlist;
 		}
-		cn = cn->hprev;
 	}
 	return NULL;
 }
@@ -1164,19 +1173,21 @@ static int newer_jl_done(struct reiserfs
 {
 	struct super_block *sb = cn->sb;
 	b_blocknr_t blocknr = cn->blocknr;
+	int done = 1;
+	struct list_head *head = journal_hash_cn(cn);
 
-	cn = cn->hprev;
-	while (cn) {
+	list_for_each_entry_continue_reverse(cn, head, hash_list) {
 		if (cn->sb == sb && cn->blocknr == blocknr && cn->jlist &&
-		    atomic_read(&cn->jlist->j_commit_left) != 0)
-				    return 0;
-		cn = cn->hprev;
+		    atomic_read(&cn->jlist->j_commit_left) != 0) {
+			done = 0;
+			break;
+		}
 	}
-	return 1;
+	return done;
 }
 
 static void remove_journal_hash(struct super_block *,
-				struct reiserfs_journal_cnode **,
+				struct list_head *,
 				struct reiserfs_journal_list *, unsigned long,
 				int);
 
@@ -1190,13 +1201,12 @@ static void remove_all_from_journal_list
 					 int debug)
 {
 	struct reiserfs_journal *journal = SB_JOURNAL(sb);
-	struct reiserfs_journal_cnode *cn, *last;
-	cn = jl->j_realblock;
+	struct reiserfs_journal_cnode *cn, *tmp;
 
 	/* which is better, to lock once around the whole loop, or
 	 ** to lock for each call to remove_journal_hash?
 	 */
-	while (cn) {
+	list_for_each_entry_safe(cn, tmp, &jl->j_realblock, trans_list) {
 		if (cn->blocknr != 0) {
 			if (debug) {
 				reiserfs_warning(sb, "reiserfs-2201",
@@ -1208,11 +1218,10 @@ static void remove_all_from_journal_list
 			remove_journal_hash(sb, journal->j_list_hash_table,
 					    jl, cn->blocknr, 1);
 		}
-		last = cn;
-		cn = cn->next;
-		free_cnode(sb, last);
+		list_del_init(&cn->trans_list);
+		free_cnode(sb, cn);
 	}
-	jl->j_realblock = NULL;
+	WARN_ON(!list_empty(&jl->j_realblock));
 }
 
 /*
@@ -1333,7 +1342,7 @@ static int flush_journal_list(struct sup
 			      struct reiserfs_journal_list *jl, int flushall)
 {
 	struct reiserfs_journal_list *pjl;
-	struct reiserfs_journal_cnode *cn, *last;
+	struct reiserfs_journal_cnode *cn;
 	int count;
 	int was_jwait = 0;
 	int was_dirty = 0;
@@ -1392,8 +1401,7 @@ static int flush_journal_list(struct sup
 		reiserfs_panic(s, "journal-844", "journal list is flushing, "
 			       "wcount is not 0");
 	}
-	cn = jl->j_realblock;
-	while (cn) {
+	list_for_each_entry(cn, &jl->j_realblock, trans_list) {
 		was_jwait = 0;
 		was_dirty = 0;
 		saved_bh = NULL;
@@ -1475,8 +1483,6 @@ static int flush_journal_list(struct sup
 					 b_blocknr, __func__);
 		}
 	      free_cnode:
-		last = cn;
-		cn = cn->next;
 		if (saved_bh) {
 			/* we incremented this to keep others from taking the buffer head away */
 			put_bh(saved_bh);
@@ -1487,8 +1493,7 @@ static int flush_journal_list(struct sup
 		}
 	}
 	if (count > 0) {
-		cn = jl->j_realblock;
-		while (cn) {
+		list_for_each_entry(cn, &jl->j_realblock, trans_list) {
 			if (test_bit(BLOCK_NEEDS_FLUSH, &cn->state)) {
 				if (!cn->bh) {
 					reiserfs_panic(s, "journal-1011",
@@ -1521,7 +1526,6 @@ static int flush_journal_list(struct sup
 				/* drop one ref for journal_mark_dirty */
 				release_buffer_page(cn->bh);
 			}
-			cn = cn->next;
 		}
 	}
 
@@ -1578,7 +1582,6 @@ static int flush_journal_list(struct sup
 	jl->j_len = 0;
 	atomic_set(&(jl->j_nonzerolen), 0);
 	jl->j_start = 0;
-	jl->j_realblock = NULL;
 	jl->j_commit_bh = NULL;
 	jl->j_trans_id = 0;
 	jl->j_state = 0;
@@ -1596,8 +1599,7 @@ static int test_transaction(struct super
 	if (jl->j_len == 0 || atomic_read(&jl->j_nonzerolen) == 0)
 		return 1;
 
-	cn = jl->j_realblock;
-	while (cn) {
+	list_for_each_entry(cn, &jl->j_realblock, trans_list) {
 		/* if the blocknr == 0, this has been cleared from the hash,
 		 ** skip it
 		 */
@@ -1607,7 +1609,6 @@ static int test_transaction(struct super
 		if (cn->bh && !newer_jl_done(cn))
 			return 0;
 	      next:
-		cn = cn->next;
 		cond_resched();
 	}
 	return 0;
@@ -1626,8 +1627,7 @@ static int write_one_transaction(struct
 		return 0;
 	}
 
-	cn = jl->j_realblock;
-	while (cn) {
+	list_for_each_entry(cn, &jl->j_realblock, trans_list) {
 		/* if the blocknr == 0, this has been cleared from the hash,
 		 ** skip it
 		 */
@@ -1656,7 +1656,6 @@ static int write_one_transaction(struct
 			put_bh(tmp_bh);
 		}
 	      next:
-		cn = cn->next;
 		cond_resched();
 	}
 	return ret;
@@ -1671,8 +1670,7 @@ static int dirty_one_transaction(struct
 	int ret = 0;
 
 	jl->j_state |= LIST_DIRTY;
-	cn = jl->j_realblock;
-	while (cn) {
+	list_for_each_entry(cn, &jl->j_realblock, trans_list) {
 		/* look for a more recent transaction that logged this
 		 ** buffer.  Only the most recent transaction with a buffer in
 		 ** it is allowed to send that buffer to disk
@@ -1693,7 +1691,6 @@ static int dirty_one_transaction(struct
 				mark_buffer_dirty(cn->bh);
 			}
 		}
-		cn = cn->next;
 	}
 	return ret;
 }
@@ -1813,33 +1810,21 @@ static int flush_used_journal_lists(stru
 
 /*
 ** removes any nodes in table with name block and dev as bh.
-** only touchs the hnext and hprev pointers.
 */
 void remove_journal_hash(struct super_block *sb,
-			 struct reiserfs_journal_cnode **table,
+			 struct list_head *table,
 			 struct reiserfs_journal_list *jl,
 			 unsigned long block, int remove_freed)
 {
-	struct reiserfs_journal_cnode *cur;
-	struct reiserfs_journal_cnode **head;
+	struct reiserfs_journal_cnode *cur, *tmp;
+	struct list_head *head = journal_hash(table, sb, block);
 
-	head = &(journal_hash(table, sb, block));
-	if (!head) {
-		return;
-	}
-	cur = *head;
-	while (cur) {
+	list_for_each_entry_safe(cur, tmp, head, hash_list) {
 		if (cur->blocknr == block && cur->sb == sb
 		    && (jl == NULL || jl == cur->jlist)
 		    && (!test_bit(BLOCK_FREED, &cur->state) || remove_freed)) {
-			if (cur->hnext) {
-				cur->hnext->hprev = cur->hprev;
-			}
-			if (cur->hprev) {
-				cur->hprev->hnext = cur->hnext;
-			} else {
-				*head = cur->hnext;
-			}
+			list_del_init(&cur->hash_list);
+			list_del_init(&cur->trans_list);
 			cur->blocknr = 0;
 			cur->sb = NULL;
 			cur->state = 0;
@@ -1847,8 +1832,8 @@ void remove_journal_hash(struct super_bl
 				atomic_dec(&(cur->jlist->j_nonzerolen));
 			cur->bh = NULL;
 			cur->jlist = NULL;
+			free_cnode(sb, cur);
 		}
-		cur = cur->hnext;
 	}
 }
 
@@ -1932,6 +1917,8 @@ static int do_journal_release(struct rei
 		commit_wq = NULL;
 	}
 
+	check_journal_list_hash_tables(sb);
+
 	free_journal_ram(sb);
 
 	reiserfs_write_lock(sb);
@@ -2783,9 +2770,8 @@ int journal_init(struct super_block *sb,
 	journal->j_list_bitmap_index = 0;
 	journal_list_init(sb);
 
-	memset(journal->j_list_hash_table, 0,
-	       JOURNAL_HASH_SIZE * sizeof(struct reiserfs_journal_cnode *));
-
+	INIT_LIST_HEAD(&journal->j_cnode_free_list);
+	INIT_LIST_HEAD(&journal->j_blocks);
 	INIT_LIST_HEAD(&journal->j_dirty_buffers);
 	spin_lock_init(&journal->j_dirty_buffers_lock);
 
@@ -2796,8 +2782,6 @@ int journal_init(struct super_block *sb,
 	atomic_set(&(journal->j_async_throttle), 0);
 	journal->j_bcount = 0;
 	journal->j_trans_start_time = 0;
-	journal->j_last = NULL;
-	journal->j_first = NULL;
 	init_waitqueue_head(&(journal->j_join_wait));
 	mutex_init(&journal->j_mutex);
 	mutex_init(&journal->j_flush_mutex);
@@ -2806,9 +2790,8 @@ int journal_init(struct super_block *sb,
 	journal->j_mount_id = 10;
 	journal->j_state = 0;
 	atomic_set(&(journal->j_jlock), 0);
-	journal->j_cnode_free_list = allocate_cnodes(num_cnodes);
-	journal->j_cnode_free_orig = journal->j_cnode_free_list;
-	journal->j_cnode_free = journal->j_cnode_free_list ? num_cnodes : 0;
+	journal->j_cnode_free_orig = allocate_cnodes(journal, num_cnodes);
+	journal->j_cnode_free = journal->j_cnode_free_orig ? num_cnodes : 0;
 	journal->j_cnode_used = 0;
 	journal->j_must_wait = 0;
 
@@ -3306,16 +3289,8 @@ int journal_mark_dirty(struct reiserfs_t
 			get_bh(bh);
 		}
 	}
-	cn->next = NULL;
-	cn->prev = journal->j_last;
+	list_add_tail(&cn->trans_list, &journal->j_blocks);
 	cn->bh = bh;
-	if (journal->j_last) {
-		journal->j_last->next = cn;
-		journal->j_last = cn;
-	} else {
-		journal->j_first = cn;
-		journal->j_last = cn;
-	}
 	reiserfs_schedule_old_flush(sb);
 	return 0;
 }
@@ -3371,19 +3346,9 @@ static int remove_from_transaction(struc
 	if (!cn || !cn->bh) {
 		return ret;
 	}
+
 	bh = cn->bh;
-	if (cn->prev) {
-		cn->prev->next = cn->next;
-	}
-	if (cn->next) {
-		cn->next->prev = cn->prev;
-	}
-	if (cn == journal->j_first) {
-		journal->j_first = cn->next;
-	}
-	if (cn == journal->j_last) {
-		journal->j_last = cn->prev;
-	}
+
 	if (bh)
 		remove_journal_hash(sb, journal->j_hash_table, NULL,
 				    bh->b_blocknr, 0);
@@ -3400,6 +3365,7 @@ static int remove_from_transaction(struc
 		}
 		ret = 1;
 	}
+	list_del_init(&cn->trans_list);
 	journal->j_len--;
 	journal->j_len_alloc--;
 	free_cnode(sb, cn);
@@ -3420,33 +3386,35 @@ static int can_dirty(struct reiserfs_jou
 {
 	struct super_block *sb = cn->sb;
 	b_blocknr_t blocknr = cn->blocknr;
-	struct reiserfs_journal_cnode *cur = cn->hprev;
-	int can_dirty = 1;
+	struct reiserfs_journal_cnode *cur;
+	struct list_head *head = journal_hash_cn(cn);
 
-	/* first test hprev.  These are all newer than cn, so any node here
-	 ** with the same block number and dev means this node can't be sent
-	 ** to disk right now.
+	/*
+	 * These are all newer than cn, so any node here with the same
+	 * block number and dev means this node can't be sent to disk
+	 * right now.
 	 */
-	while (cur && can_dirty) {
+	cur = cn;
+	list_for_each_entry_continue_reverse(cur, head, hash_list) {
 		if (cur->jlist && cur->bh && cur->blocknr && cur->sb == sb &&
 		    cur->blocknr == blocknr) {
-			can_dirty = 0;
+			return 0;
 		}
-		cur = cur->hprev;
 	}
-	/* then test hnext.  These are all older than cn.  As long as they
-	 ** are committed to the log, it is safe to write cn to disk
+
+	/*
+	 * These are all older than cn.  As long as they are committed
+	 * to the log, it is safe to write cn to disk.
 	 */
-	cur = cn->hnext;
-	while (cur && can_dirty) {
-		if (cur->jlist && cur->jlist->j_len > 0 &&
-		    atomic_read(&(cur->jlist->j_commit_left)) > 0 && cur->bh &&
-		    cur->blocknr && cur->sb == sb && cur->blocknr == blocknr) {
-			can_dirty = 0;
+	list_for_each_entry_continue(cn, head, hash_list) {
+		if (cn->jlist && cn->jlist->j_len > 0 &&
+		    atomic_read(&cn->jlist->j_commit_left) > 0 && cn->bh &&
+		    cn->blocknr && cn->sb == sb && cn->blocknr == blocknr) {
+			return 0;
 		}
-		cur = cur->hnext;
 	}
-	return can_dirty;
+
+	return 1;
 }
 
 /* syncs the commit blocks, but does not force the real buffers to disk
@@ -3659,7 +3627,8 @@ int journal_mark_freed(struct reiserfs_t
 		       struct super_block *sb, b_blocknr_t blocknr)
 {
 	struct reiserfs_journal *journal = SB_JOURNAL(sb);
-	struct reiserfs_journal_cnode *cn = NULL;
+	struct list_head *head;
+	struct reiserfs_journal_cnode *cn;
 	struct buffer_head *bh = NULL;
 	struct reiserfs_list_bitmap *jb = NULL;
 	int cleaned = 0;
@@ -3685,7 +3654,7 @@ int journal_mark_freed(struct reiserfs_t
 		}
 		set_bit_in_list_bitmap(sb, blocknr, jb);
 
-		/* Note, the entire while loop is not allowed to schedule.  */
+		/* Note, the entire loop is not allowed to schedule.  */
 
 		if (bh) {
 			clear_prepared_bits(bh);
@@ -3694,9 +3663,8 @@ int journal_mark_freed(struct reiserfs_t
 		cleaned = remove_from_transaction(sb, blocknr, cleaned);
 
 		/* find all older transactions with this block, make sure they don't try to write it out */
-		cn = get_journal_hash_dev(sb, journal->j_list_hash_table,
-					  blocknr);
-		while (cn) {
+		head = journal_hash(journal->j_list_hash_table, sb, blocknr);
+		list_for_each_entry(cn, head, hash_list) {
 			if (sb == cn->sb && blocknr == cn->blocknr) {
 				set_bit(BLOCK_FREED, &cn->state);
 				if (cn->bh) {
@@ -3726,7 +3694,6 @@ int journal_mark_freed(struct reiserfs_t
 					cn->bh = NULL;
 				}
 			}
-			cn = cn->hnext;
 		}
 	}
 
@@ -3905,8 +3872,7 @@ static int do_journal_end(struct reiserf
 			  int flags)
 {
 	struct reiserfs_journal *journal = SB_JOURNAL(sb);
-	struct reiserfs_journal_cnode *cn, *next, *jl_cn;
-	struct reiserfs_journal_cnode *last_cn = NULL;
+	struct reiserfs_journal_cnode *cn, *tmp;
 	struct reiserfs_journal_desc *desc;
 	struct reiserfs_journal_commit *commit;
 	struct buffer_head *c_bh;	/* commit bh */
@@ -4024,29 +3990,26 @@ static int do_journal_end(struct reiserf
 	jl->j_len = journal->j_len;
 	atomic_set(&jl->j_nonzerolen, journal->j_len);
 	atomic_set(&jl->j_commit_left, journal->j_len + 2);
-	jl->j_realblock = NULL;
+	INIT_LIST_HEAD(&jl->j_realblock);
 
 	/* The ENTIRE FOR LOOP MUST not cause schedule to occur.
 	 **  for each real block, add it to the journal list hash,
 	 ** copy into real block index array in the commit or desc block
 	 */
 	trans_half = journal_trans_half(sb->s_blocksize);
-	for (i = 0, cn = journal->j_first; cn; cn = cn->next, i++) {
+	i = 0;
+	list_for_each_entry(cn, &journal->j_blocks, trans_list) {
+		struct reiserfs_journal_cnode *jl_cn;
+
 		if (buffer_journaled(cn->bh)) {
 			jl_cn = get_cnode(sb);
 			if (!jl_cn) {
 				reiserfs_panic(sb, "journal-1676",
 					       "get_cnode returned NULL");
 			}
-			if (i == 0) {
-				jl->j_realblock = jl_cn;
-			}
-			jl_cn->prev = last_cn;
-			jl_cn->next = NULL;
-			if (last_cn) {
-				last_cn->next = jl_cn;
-			}
-			last_cn = jl_cn;
+
+			list_add_tail(&jl_cn->trans_list, &jl->j_realblock);
+
 			/* make sure the block we are trying to log is not a block
 			   of journal or reserved area */
 
@@ -4090,10 +4053,10 @@ static int do_journal_end(struct reiserf
 
 	/* first data block is j_start + 1, so add one to cur_write_start wherever you use it */
 	cur_write_start = journal->j_start;
-	cn = journal->j_first;
 	jindex = 1;		/* start at one so we don't get the desc again */
-	while (cn) {
+	list_for_each_entry_safe(cn, tmp, &journal->j_blocks, trans_list) {
 		clear_buffer_journal_new(cn->bh);
+
 		/* copy all the real blocks into log area.  dirty log blocks */
 		if (buffer_journaled(cn->bh)) {
 			struct buffer_head *tmp_bh;
@@ -4123,9 +4086,11 @@ static int do_journal_end(struct reiserf
 					 "but not JDirty!");
 			brelse(cn->bh);
 		}
-		next = cn->next;
+
+		list_del_init(&cn->trans_list);
+		list_del_init(&cn->hash_list);
 		free_cnode(sb, cn);
-		cn = next;
+
 		reiserfs_write_unlock(sb);
 		cond_resched();
 		reiserfs_write_lock(sb);
@@ -4150,8 +4115,7 @@ static int do_journal_end(struct reiserf
 	     2) % SB_ONDISK_JOURNAL_SIZE(sb);
 	atomic_set(&(journal->j_wcount), 0);
 	journal->j_bcount = 0;
-	journal->j_last = NULL;
-	journal->j_first = NULL;
+	WARN_ON(!list_empty(&journal->j_blocks));
 	journal->j_len = 0;
 	journal->j_trans_start_time = 0;
 	/* check for trans_id overflow */
@@ -4162,7 +4126,7 @@ static int do_journal_end(struct reiserf
 	journal->j_len_alloc = 0;
 	journal->j_next_full_flush = 0;
 	journal->j_next_async_flush = 0;
-	init_journal_hash(sb);
+	check_journal_hash_tables(sb);
 
 	// make sure reiserfs_add_jh sees the new current_jl before we
 	// write out the tails
--- a/fs/reiserfs/reiserfs.h	2013-05-06 12:30:21.466081461 -0400
+++ b/fs/reiserfs/reiserfs.h	2013-05-06 12:30:37.838125220 -0400
@@ -194,10 +194,8 @@ struct reiserfs_journal_cnode {
 	__u32 blocknr;		/* block number of real buffer head, == 0 when buffer on disk */
 	unsigned long state;
 	struct reiserfs_journal_list *jlist;	/* journal list this cnode lives in */
-	struct reiserfs_journal_cnode *next;	/* next in transaction list */
-	struct reiserfs_journal_cnode *prev;	/* prev in transaction list */
-	struct reiserfs_journal_cnode *hprev;	/* prev in hash list */
-	struct reiserfs_journal_cnode *hnext;	/* next in hash list */
+	struct list_head trans_list;
+	struct list_head hash_list;
 };
 
 struct reiserfs_bitmap_node {
@@ -229,7 +227,7 @@ struct reiserfs_journal_list {
 	time_t j_timestamp;
 	struct reiserfs_list_bitmap *j_list_bitmap;
 	struct buffer_head *j_commit_bh;	/* commit buffer head */
-	struct reiserfs_journal_cnode *j_realblock;
+	struct list_head j_realblock;
 	struct reiserfs_journal_cnode *j_freedlist;	/* list of buffers that were freed during this trans.  free each of these on flush */
 	/* time ordered list of all active transactions */
 	struct list_head j_list;
@@ -246,8 +244,7 @@ struct reiserfs_journal_list {
 
 struct reiserfs_journal {
 	struct buffer_head **j_ap_blocks;	/* journal blocks on disk */
-	struct reiserfs_journal_cnode *j_last;	/* newest journal block */
-	struct reiserfs_journal_cnode *j_first;	/*  oldest journal block.  start here for traverse */
+	struct list_head j_blocks;		/* journal block cnodes */
 
 	struct block_device *j_dev_bd;
 	fmode_t j_dev_mode;
@@ -284,7 +281,7 @@ struct reiserfs_journal {
 	unsigned int j_max_trans_age;	/* in seconds, how old can a transaction be */
 	unsigned int j_default_max_commit_age;	/* the default for the max commit age */
 
-	struct reiserfs_journal_cnode *j_cnode_free_list;
+	struct list_head j_cnode_free_list;
 	struct reiserfs_journal_cnode *j_cnode_free_orig;	/* orig pointer returned from vmalloc */
 
 	struct reiserfs_journal_list *j_current_jl;
@@ -310,9 +307,13 @@ struct reiserfs_journal {
 	struct list_head j_working_list;
 
 	struct reiserfs_list_bitmap j_list_bitmap[JOURNAL_NUM_BITMAPS];	/* array of bitmaps to record the deleted blocks */
-	struct reiserfs_journal_cnode *j_hash_table[JOURNAL_HASH_SIZE];	/* hash table for real buffer heads in current trans */
-	struct reiserfs_journal_cnode *j_list_hash_table[JOURNAL_HASH_SIZE];	/* hash table for all the real buffer heads in all
-										   the transactions */
+
+	/* hash table for real buffer heads in current trans */
+	struct list_head j_hash_table[JOURNAL_HASH_SIZE];
+
+	/* hash table for all the real buffer heads in all the transactions */
+	struct list_head j_list_hash_table[JOURNAL_HASH_SIZE];
+
 	struct list_head j_prealloc_list;	/* list of inodes which have preallocated blocks */
 	int j_persistent_trans;
 	unsigned long j_max_trans_size;
@@ -2361,7 +2362,23 @@ struct reiserfs_journal_header {
 #define _jhashfn(sb,block)	\
 	(((unsigned long)sb>>L1_CACHE_SHIFT) ^ \
 	 (((block)<<(JBH_HASH_SHIFT - 6)) ^ ((block) >> 13) ^ ((block) << (JBH_HASH_SHIFT - 12))))
-#define journal_hash(t,sb,block) ((t)[_jhashfn((sb),(block)) & JBH_HASH_MASK])
+
+static inline struct list_head *
+journal_hash(struct list_head *table, struct super_block *sb, b_blocknr_t block)
+{
+	return &table[_jhashfn(sb, block) & JBH_HASH_MASK];
+}
+
+static inline struct list_head *
+journal_hash_cn(struct reiserfs_journal_cnode *cn)
+{
+	struct list_head *table;
+	if (cn->jlist)
+		table = SB_JOURNAL(cn->sb)->j_list_hash_table;
+	else
+		table = SB_JOURNAL(cn->sb)->j_hash_table;
+	return journal_hash(table, cn->sb, cn->blocknr);
+}
 
 // We need these to make journal.c code more readable
 #define journal_find_get_block(s, block) __find_get_block(SB_JOURNAL(s)->j_dev_bd, block, s->s_blocksize)

-- 
Jeff Mahoney
SUSE Labs
