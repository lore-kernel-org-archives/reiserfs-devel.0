From: jeffm@suse.com
Subject: [PATCH 4/4] reiserfs: perform tree block sanity checks at read/write
Date: Tue,  9 May 2017 16:50:13 -0400
Message-ID: <20170509205013.568-5-jeffm@suse.com>
References: <20170509205013.568-1-jeffm@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20170509205013.568-1-jeffm@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Jeff Mahoney <jeffm@suse.com>

From: Jeff Mahoney <jeffm@suse.com>

This patch adds tree block sanity checks at read/write time.  The read
portion is performed as part of the endio for the readers, for which there
are now several helpers.  The write portion is performed immediately before
writing to the journal.  The tree blocks are annotated with a new
journal_mark_tree_block_dirty helper that sets a bit in the cnode to track
what journaled blocks are tree blocks.  The checker does some basic
checks regarding key ordering, item size, directory entry parameters, and
block numbers in indirect items.  The idea is that we'll get an EIO when
the buffer is read so we don't hit most kinds of fuzzer issues.  On the
write path, we'll go read-only before the buffer is committed to disk.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/do_balan.c |   7 +-
 fs/reiserfs/fix_node.c |   4 +-
 fs/reiserfs/inode.c    |   6 +-
 fs/reiserfs/journal.c  |  42 +++++-
 fs/reiserfs/namei.c    |   6 +-
 fs/reiserfs/prints.c   |  12 ++
 fs/reiserfs/reiserfs.h |  14 +-
 fs/reiserfs/stree.c    | 372 ++++++++++++++++++++++++++++++++++++++++++++++++-
 8 files changed, 447 insertions(+), 16 deletions(-)

diff --git a/fs/reiserfs/do_balan.c b/fs/reiserfs/do_balan.c
index 9c02d96d3a42..456f41b857f4 100644
--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -56,11 +56,16 @@ static inline void buffer_info_init_bh(struct tree_balance *tb,
 inline void do_balance_mark_leaf_dirty(struct tree_balance *tb,
 				       struct buffer_head *bh, int flag)
 {
+	journal_mark_tree_block_dirty(tb->transaction_handle, bh);
+}
+
+inline void do_balance_mark_sb_dirty(struct tree_balance *tb,
+				       struct buffer_head *bh, int flag)
+{
 	journal_mark_dirty(tb->transaction_handle, bh);
 }
 
 #define do_balance_mark_internal_dirty do_balance_mark_leaf_dirty
-#define do_balance_mark_sb_dirty do_balance_mark_leaf_dirty
 
 /*
  * summary:
diff --git a/fs/reiserfs/fix_node.c b/fs/reiserfs/fix_node.c
index 6b0ddb2a9091..fc6a3b5eb22e 100644
--- a/fs/reiserfs/fix_node.c
+++ b/fs/reiserfs/fix_node.c
@@ -2178,7 +2178,7 @@ static int get_neighbors(struct tree_balance *tb, int h)
 								       FL[h]);
 		son_number = B_N_CHILD_NUM(tb->FL[h], child_position);
 		depth = reiserfs_write_unlock_nested(tb->tb_sb);
-		bh = sb_bread(sb, son_number);
+		bh = reiserfs_bread_tree_block(sb, son_number);
 		reiserfs_write_lock_nested(tb->tb_sb, depth);
 		if (!bh)
 			return IO_ERROR;
@@ -2218,7 +2218,7 @@ static int get_neighbors(struct tree_balance *tb, int h)
 		    (bh == tb->FR[h]) ? tb->rkey[h] + 1 : 0;
 		son_number = B_N_CHILD_NUM(tb->FR[h], child_position);
 		depth = reiserfs_write_unlock_nested(tb->tb_sb);
-		bh = sb_bread(sb, son_number);
+		bh = reiserfs_bread_tree_block(sb, son_number);
 		reiserfs_write_lock_nested(tb->tb_sb, depth);
 		if (!bh)
 			return IO_ERROR;
diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 873fc04e9403..9e0369ee1ca0 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -817,7 +817,7 @@ int reiserfs_get_block(struct inode *inode, sector_t block,
 				reiserfs_add_ordered_list(inode, bh_result);
 			put_block_num(item, pos_in_item, allocated_block_nr);
 			unfm_ptr = allocated_block_nr;
-			journal_mark_dirty(th, bh);
+			journal_mark_tree_block_dirty(th, bh);
 			reiserfs_update_sd(th, inode);
 		}
 		set_block_dev_mapped(bh_result, unfm_ptr, inode);
@@ -1504,7 +1504,7 @@ void reiserfs_update_sd_size(struct reiserfs_transaction_handle *th,
 		break;
 	}
 	update_stat_data(&path, inode, size);
-	journal_mark_dirty(th, bh);
+	journal_mark_tree_block_dirty(th, bh);
 	pathrelse(&path);
 	return;
 }
@@ -2452,7 +2452,7 @@ static int map_block_for_writepage(struct inode *inode,
 		memcpy(ih_item_body(bh, ih) + pos_in_item, p + bytes_copied,
 		       copy_size);
 
-		journal_mark_dirty(&th, bh);
+		journal_mark_tree_block_dirty(&th, bh);
 		bytes_copied += copy_size;
 		set_block_dev_mapped(bh_result, 0, inode);
 
diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index da01f497180a..0a1ce223b2fb 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -73,6 +73,9 @@
 #define BLOCK_NEEDS_FLUSH 4
 #define BLOCK_DIRTIED 5
 
+/* used to handle validation */
+#define BLOCK_IS_TREE_BLOCK 6
+
 /* journal list state bits */
 #define LIST_TOUCHED 1
 #define LIST_DIRTY   2
@@ -2348,6 +2351,16 @@ static struct buffer_head *reiserfs_breada(struct block_device *dev,
 		} else
 			bhlist[j++] = bh;
 	}
+
+	/*
+	 * We can't actually do validation here.  We can validate when we
+	 * write to the journal -- we know whether a block is a tree block.
+	 * When we read from the tree, the block is obviously a tree block.
+	 * Here, it could be file data or a tree block -- we won't actually
+	 * know until we re-read it in context.  The good news is that
+	 * we perform the validation before writing to the journal, so we
+	 * will catch logic errors but not media errors.
+	 */
 	ll_rw_block(REQ_OP_READ, 0, j, bhlist);
 	for (i = 1; i < j; i++)
 		brelse(bhlist[i]);
@@ -3269,8 +3282,8 @@ int journal_begin(struct reiserfs_transaction_handle *th,
  *
  * if j_len, is bigger than j_len_alloc, it pushes j_len_alloc to 10 + j_len.
  */
-int journal_mark_dirty(struct reiserfs_transaction_handle *th,
-		       struct buffer_head *bh)
+static int __journal_mark_dirty(struct reiserfs_transaction_handle *th,
+				struct buffer_head *bh, bool is_tree_block)
 {
 	struct super_block *sb = th->t_super;
 	struct reiserfs_journal *journal = SB_JOURNAL(sb);
@@ -3362,6 +3375,8 @@ int journal_mark_dirty(struct reiserfs_transaction_handle *th,
 			get_bh(bh);
 		}
 	}
+	if (is_tree_block)
+		set_bit(BLOCK_IS_TREE_BLOCK, &cn->state);
 	cn->next = NULL;
 	cn->prev = journal->j_last;
 	cn->bh = bh;
@@ -3376,6 +3391,18 @@ int journal_mark_dirty(struct reiserfs_transaction_handle *th,
 	return 0;
 }
 
+int journal_mark_tree_block_dirty(struct reiserfs_transaction_handle *th,
+				  struct buffer_head *bh)
+{
+	return __journal_mark_dirty(th, bh, true);
+}
+
+int journal_mark_dirty(struct reiserfs_transaction_handle *th,
+		       struct buffer_head *bh)
+{
+	return __journal_mark_dirty(th, bh, false);
+}
+
 int journal_end(struct reiserfs_transaction_handle *th)
 {
 	struct super_block *sb = th->t_super;
@@ -4196,6 +4223,17 @@ static int do_journal_end(struct reiserfs_transaction_handle *th, int flags)
 			struct buffer_head *tmp_bh;
 			char *addr;
 			struct page *page;
+			int error = 0;
+
+			if (test_bit(BLOCK_IS_TREE_BLOCK, &cn->state))
+				error = reiserfs_validate_tree_block(sb,
+								     cn->bh);
+
+			/* FS will go read only - commit block won't land. */
+			if (error)
+				reiserfs_error(sb, "validation-2b0630fa",
+				       "validation failure during commit.");
+
 			tmp_bh =
 			    journal_getblk(sb,
 					   SB_ONDISK_JOURNAL_1st_BLOCK(sb) +
diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index bd39a998843d..a46221a38b46 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -1567,10 +1567,10 @@ static int reiserfs_rename(struct inode *old_dir, struct dentry *old_dentry,
 
 	mark_de_visible(new_de.de_deh + new_de.de_entry_num);
 	set_ino_in_dir_entry(&new_de, INODE_PKEY(old_inode));
-	journal_mark_dirty(&th, new_de.de_bh);
+	journal_mark_tree_block_dirty(&th, new_de.de_bh);
 
 	mark_de_hidden(old_de.de_deh + old_de.de_entry_num);
-	journal_mark_dirty(&th, old_de.de_bh);
+	journal_mark_tree_block_dirty(&th, old_de.de_bh);
 	ctime = current_time(old_dir);
 	old_dir->i_ctime = old_dir->i_mtime = ctime;
 	new_dir->i_ctime = new_dir->i_mtime = ctime;
@@ -1594,7 +1594,7 @@ static int reiserfs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	if (S_ISDIR(old_inode_mode)) {
 		/* adjust ".." of renamed directory */
 		set_ino_in_dir_entry(&dot_dot_de, INODE_PKEY(new_dir));
-		journal_mark_dirty(&th, dot_dot_de.de_bh);
+		journal_mark_tree_block_dirty(&th, dot_dot_de.de_bh);
 
 		/*
 		 * there (in new_dir) was no directory, so it got new link
diff --git a/fs/reiserfs/prints.c b/fs/reiserfs/prints.c
index db7b02b06fcc..86346e868ad4 100644
--- a/fs/reiserfs/prints.c
+++ b/fs/reiserfs/prints.c
@@ -337,6 +337,18 @@ void __reiserfs_warning(const struct super_block *sb, const char *id,
 	mutex_unlock(&error_lock);
 }
 
+void reiserfs_corrupt(const struct super_block *sb,
+		      const struct buffer_head *bh,
+		      const char *id, const char *fmt, ...)
+{
+	mutex_lock(&error_lock);
+	do_reiserfs_warning(fmt);
+	pr_err("REISERFS corruption detected (device %s, block %llu): %s %s",
+	       sb->s_id, (unsigned long long)bh->b_blocknr, id,
+	       error_buf);
+	mutex_unlock(&error_lock);
+}
+
 /* No newline.. reiserfs_info calls can be followed by printk's */
 void reiserfs_info(struct super_block *sb, const char *fmt, ...)
 {
diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index 15078039367a..75e4284c7c8f 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -902,6 +902,9 @@ void __reiserfs_warning(const struct super_block *s, const char *id,
 			 const char *func, const char *fmt, ...);
 #define reiserfs_warning(s, id, fmt, args...) \
 	 __reiserfs_warning(s, id, __func__, fmt, ##args)
+void reiserfs_corrupt(const struct super_block *sb,
+		      const struct buffer_head *bh,
+		      const char *id, const char *fmt, ...);
 /* assertions handling */
 
 /* always check a condition and panic if it's false. */
@@ -2885,6 +2888,8 @@ int reiserfs_add_tail_list(struct inode *inode, struct buffer_head *bh);
 int reiserfs_add_ordered_list(struct inode *inode, struct buffer_head *bh);
 int journal_mark_dirty(struct reiserfs_transaction_handle *,
 		       struct buffer_head *bh);
+int journal_mark_tree_block_dirty(struct reiserfs_transaction_handle *,
+				  struct buffer_head *bh);
 
 static inline int reiserfs_file_data_log(const struct inode *inode)
 {
@@ -2966,6 +2971,12 @@ int reiserfs_convert_objectid_map_v1(struct super_block *);
 int B_IS_IN_TREE(const struct buffer_head *);
 extern void copy_item_head(struct item_head *to,
 			   const struct item_head *from);
+int reiserfs_validate_tree_block(const struct super_block *sb,
+				 const struct buffer_head *bh);
+void reiserfs_read_tree_block(struct super_block *sb, struct buffer_head *bh);
+void reiserfs_reada_tree_block(struct super_block *sb, struct buffer_head *bh);
+struct buffer_head *reiserfs_bread_tree_block(struct super_block *sb,
+					      u32 blocknr);
 
 /* first key is in cpu form, second - le */
 extern int comp_short_keys(const struct reiserfs_key *le_key,
@@ -3242,8 +3253,9 @@ int balance_internal(struct tree_balance *, int, int, struct item_head *,
 /* do_balance.c */
 void do_balance_mark_leaf_dirty(struct tree_balance *tb,
 				struct buffer_head *bh, int flag);
+void do_balance_mark_sb_dirty(struct tree_balance *tb,
+			      struct buffer_head *bh, int flag);
 #define do_balance_mark_internal_dirty do_balance_mark_leaf_dirty
-#define do_balance_mark_sb_dirty do_balance_mark_leaf_dirty
 
 void do_balance(struct tree_balance *tb, struct item_head *ih,
 		const char *body, int flag);
diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index 0037aea97d39..672171d32f93 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -552,7 +552,7 @@ static int search_by_key_reada(struct super_block *s,
 		if (!buffer_uptodate(bh[j])) {
 			if (depth == -1)
 				depth = reiserfs_write_unlock_nested(s);
-			ll_rw_block(REQ_OP_READ, REQ_RAHEAD, 1, bh + j);
+			reiserfs_reada_tree_block(s, bh[j]);
 		}
 		brelse(bh[j]);
 	}
@@ -661,8 +661,7 @@ int search_by_key(struct super_block *sb, const struct cpu_key *key,
 			if (!buffer_uptodate(bh) && depth == -1)
 				depth = reiserfs_write_unlock_nested(sb);
 
-			ll_rw_block(REQ_OP_READ, 0, 1, &bh);
-			wait_on_buffer(bh);
+			reiserfs_read_tree_block(sb, bh);
 
 			if (depth != -1)
 				reiserfs_write_lock_nested(sb, depth);
@@ -1101,7 +1100,7 @@ static char prepare_for_delete_or_cut(struct reiserfs_transaction_handle *th,
 		    if (block != 0) {
 			reiserfs_prepare_for_journal(sb, bh, 1);
 			put_block_num(unfm, 0, 0);
-			journal_mark_dirty(th, bh);
+			journal_mark_tree_block_dirty(th, bh);
 			reiserfs_free_block(th, inode, block, 1);
 		    }
 
@@ -2261,3 +2260,368 @@ int reiserfs_insert_item(struct reiserfs_transaction_handle *th,
 	}
 	return retval;
 }
+
+static int validate_directory_item(const struct super_block *sb,
+				   const struct buffer_head *bh, int index)
+{
+	const struct item_head *ih = item_head(bh, index);
+	const struct reiserfs_de_head *deh = item_body(bh, index);
+	int count = ih_entry_count(ih);
+	int i;
+
+	for (i = 0; i < count; i++, deh++) {
+		unsigned int location = deh_location(deh);
+		if (location < DEH_SIZE * count) {
+			reiserfs_corrupt(sb, bh, "validation-f7118795",
+				"item %d (%k) contains directory entry with name offset within entry itself (%u < %u)",
+				index, &ih->ih_key, location, DEH_SIZE * count);
+			return -EIO;
+		}
+
+		if (location >= ih_item_len(ih)) {
+			reiserfs_corrupt(sb, bh, "validation-179949de",
+				"item %d (%k) contains directory entry with name offset beyond end of item (%u <= %u)",
+				index, &ih->ih_key, location, ih_item_len(ih));
+			return -EIO;
+		}
+
+		if (i && (location >= deh_location(deh - 1))) {
+			reiserfs_corrupt(sb, bh, "validation-6270942b",
+				"item %d (%k) contains directory entry with name offset before previous entry (%u <= %u)",
+				index, &ih->ih_key, location,
+				deh_location(deh - 1));
+			return -EIO;
+		}
+	}
+
+	return 0;
+}
+
+static int validate_indirect_item(const struct super_block *sb,
+				  const struct buffer_head *bh, int index)
+{
+	const struct item_head *ih = item_head(bh, index);
+	const __le32 *body = item_body(bh, index);
+	int count = ih_item_len(ih) / UNFM_P_SIZE;
+	int i;
+
+	for (i = 0; i < count; i++) {
+		u32 block = get_block_num(body, i);
+		if (block < SB_BLOCK_COUNT(sb))
+			continue;
+		reiserfs_corrupt(sb, bh, "validation-2a4aab10",
+				 "item %d (%k) refers to block beyond end of file system, entry %d (%u >= %u)",
+				 index, &ih->ih_key, i,
+				 block, SB_BLOCK_COUNT(sb));
+		return -EIO;
+	}
+	return 0;
+}
+
+static int validate_item_head(const struct super_block *sb,
+			      const struct buffer_head *bh, int index)
+{
+	struct item_head *ih = item_head(bh, index);
+	int item_type;
+
+	if (index > 0) {
+		struct item_head *prev = item_head(bh, index - 1);
+		if (ih_location(ih) + ih_item_len(ih) != ih_location(prev)) {
+			reiserfs_corrupt(sb, bh, "validation-d1857214",
+				"item %d has bad location %u (should be %u)",
+				index, ih_location(ih),
+				ih_location(prev) + ih_item_len(ih));
+			return -EIO;
+		}
+	}
+
+	if (ih_location(ih) > bh->b_size) {
+		reiserfs_corrupt(sb, bh, "validation-832769b5",
+				 "item %d starts past end of block (%u > %zu)",
+				 index, ih_location(ih), bh->b_size);
+		return -EIO;
+	}
+
+	if (ih_location(ih) + ih_item_len(ih) > bh->b_size) {
+		reiserfs_corrupt(sb, bh, "validation-a74fd033",
+				 "item %d extends past end of block (%d > %zu)",
+				 index, ih_location(ih) + ih_item_len(ih),
+				 bh->b_size);
+		return -EIO;
+	}
+
+	if (ih_item_len(ih) > MAX_ITEM_LEN(bh->b_size)) {
+		reiserfs_corrupt(sb, bh, "validation-01a2def7",
+				 "item %d is too large (%d > %zu)",
+				 index, ih_item_len(ih),
+				 MAX_ITEM_LEN(bh->b_size));
+		return -EIO;
+	}
+
+	if (ih_version(ih) > 1) {
+		reiserfs_corrupt(sb, bh, "validation-c5a8a84d",
+				 "item %d has invalid version %d",
+				 index, ih_version(ih));
+		return -EIO;
+	}
+
+	if (index) {
+		struct item_head *last_ih = item_head(bh, index - 1);
+		struct cpu_key cpu_key;
+		int ret;
+
+		le_key2cpu_key(&cpu_key, &last_ih->ih_key);
+		ret = comp_keys(&ih->ih_key, &cpu_key);
+
+		if (ret == 0) {
+			reiserfs_corrupt(sb, bh, "validation-ad55a04c",
+				"item %d has same key as previous item: %k",
+				index, &ih->ih_key);
+			return -EIO;
+		} else if (ret < 0) {
+			reiserfs_corrupt(sb, bh, "validation-c1a0c245",
+				"item %d has out-of-order keys (%k < %K)",
+				index, &ih->ih_key, &cpu_key);
+			return -EIO;
+		}
+	}
+
+	item_type = le_key_k_type(ih_version(ih), &ih->ih_key);
+
+	switch (item_type) {
+	case TYPE_STAT_DATA:
+		/* Nothing to check */
+		break;
+	case TYPE_INDIRECT:
+		return validate_indirect_item(sb, bh, index);
+	case TYPE_DIRECT:
+		/* Nothing to check */
+		break;
+	case TYPE_DIRENTRY:
+		return validate_directory_item(sb, bh, index);
+	default:
+		reiserfs_corrupt(sb, bh, "validation-9b1a0781",
+			"item %d (%k) has invalid key type (%u)",
+			index, &ih->ih_key, item_type);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static inline int max_items_for_leaf(const struct super_block *sb)
+{
+	return (sb->s_blocksize - BLKH_SIZE) / (IH_SIZE + MIN_ITEM_LEN);
+}
+
+static int validate_leaf_block(const struct super_block *sb,
+			       const struct buffer_head *bh)
+{
+	struct block_head *blkh = (struct block_head *)bh->b_data;
+	int nr = blkh_nr_item(blkh);
+	struct item_head *ih;
+	unsigned used;
+	int ret = 0;
+	int i;
+
+	if (nr == 0) {
+		reiserfs_corrupt(sb, bh, "validation-68b05b7c",
+				 "leaf has incorrect number of items (0)");
+		return -EIO;
+	}
+
+	if (nr > max_items_for_leaf(sb)) {
+		reiserfs_corrupt(sb, bh, "validation-40ff01cf",
+				 "leaf has incorrect number of items (%d), max is %d",
+				 nr, max_items_for_leaf(sb));
+		return -EIO;
+	}
+	ih = item_head(bh, nr - 1);
+	used = BLKH_SIZE + IH_SIZE * nr + (sb->s_blocksize - ih_location(ih));
+	if (blkh_free_space(blkh) + used != sb->s_blocksize) {
+		reiserfs_corrupt(sb, bh, "validation-c0a01b68",
+				 "leaf has incorrect free space (%d), should be %d",
+				 blkh_free_space(blkh), sb->s_blocksize - used);
+		return -EIO;
+	}
+
+	for (i = 0; i < B_NR_ITEMS(bh); i++) {
+		ret = validate_item_head(sb, bh, i);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+static int validate_disk_child(const struct super_block *sb,
+			       const struct buffer_head *bh, int index)
+{
+	struct reiserfs_key *key = internal_key(bh, index);
+	struct disk_child *dc = B_N_CHILD(bh, index);
+	if (index) {
+		struct reiserfs_key *last_key = internal_key(bh, index - 1);
+		struct cpu_key cpu_key;
+		int ret;
+
+		le_key2cpu_key(&cpu_key, last_key);
+		ret = comp_keys(key, &cpu_key);
+
+		if (ret == 0) {
+			reiserfs_corrupt(sb, bh, "validation-90666d99",
+				"child %d has same key as previous child: %k",
+				index, key);
+			return -EIO;
+		} else if (ret < 0) {
+			reiserfs_corrupt(sb, bh, "validation-3173553b",
+				"child %d has out-of-order keys (%k < %K)",
+				index, key, &cpu_key);
+			return -EIO;
+		}
+	}
+
+	if (dc_block_number(dc) > SB_BLOCK_COUNT(sb)) {
+		reiserfs_corrupt(sb, bh, "validation-d9d72e87",
+			 "child %d (%y) refers to block beyond end of file system (%u > %u)",
+			 index, dc, dc_block_number(dc),
+			 SB_BLOCK_COUNT(sb));
+		return -EIO;
+	}
+
+	if (dc_size(dc) > bh->b_size) {
+		reiserfs_corrupt(sb, bh, "validation-14db5d0a",
+			"child %d (%y) claims more used space than size of block (%u > %u)",
+			index, dc, dc_size(dc), bh->b_size);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int validate_internal_block(const struct super_block *sb,
+				   const struct buffer_head *bh)
+{
+	int i;
+	int ret = 0;
+
+	for (i = 0; i < B_NR_ITEMS(bh); i++) {
+		ret = validate_disk_child(sb, bh, i);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+static inline bool reiserfs_is_old_format(const struct super_block *sb)
+{
+	return test_bit(REISERFS_OLD_FORMAT, &REISERFS_SB(sb)->s_properties);
+}
+
+static bool is_tree_block(const struct super_block *sb,
+			  const struct buffer_head *bh)
+{
+	struct reiserfs_sb_info *rs = REISERFS_SB(sb);
+	u32 bno = bh->b_blocknr;
+	u32 super_bno = rs->s_sbh->b_blocknr;
+	unsigned int bmap_count = reiserfs_bmap_count(sb);
+
+	if (unlikely(reiserfs_is_old_format(sb)))
+		return bno > super_bno + 1 + bmap_count;
+
+	if (bno == super_bno || bno == super_bno + 1)
+		return false;
+
+	/* external journal */
+	if (sb->s_bdev != bh->b_bdev)
+		return false;
+
+	/* internal journal */
+	if (bno >= SB_ONDISK_JOURNAL_1st_BLOCK(sb) &&
+	    bno < SB_ONDISK_JOURNAL_1st_BLOCK(sb) + SB_ONDISK_JOURNAL_SIZE(sb))
+		return false;
+
+	/* new-style distributed bitmaps; bitmap 0 is super_bno + 1 */
+	if ((bno & ((sb->s_blocksize << 3) - 1)) == 0)
+		return false;
+
+	return true;
+}
+
+int reiserfs_validate_tree_block(const struct super_block *sb,
+				 const struct buffer_head *bh)
+{
+	if (WARN_ON(!is_tree_block(sb, bh))) {
+		reiserfs_warning(sb, "validation-3b08f7f5",
+				 "odd: block %u is not tree block, skipping",
+				 (unsigned)bh->b_blocknr);
+		return 0;
+	}
+
+	if (B_LEVEL(bh) > MAX_HEIGHT) {
+		reiserfs_corrupt(sb, bh, "validation-6a14521e",
+			 "block (%llu) has invalid height (%hd), max=%hd",
+			 bh->b_blocknr, B_LEVEL(bh), MAX_HEIGHT);
+		return -EIO;
+	}
+
+	if (B_LEVEL(bh) == DISK_LEAF_NODE_LEVEL)
+		return validate_leaf_block(sb, bh);
+	return validate_internal_block(sb, bh);
+}
+
+static void reiserfs_read_tree_block_endio(struct buffer_head *bh, int uptodate)
+{
+	/* We can't use bd_super since it's not set during mount. */
+	struct super_block *sb = bh->b_private;
+
+	if (uptodate && reiserfs_validate_tree_block(sb, bh) != 0)
+		uptodate = 0;
+
+	bh->b_private = NULL;
+	end_buffer_read_sync(bh, uptodate);
+}
+
+static void reiserfs_read_tree_block_flags(struct super_block *sb,
+					   struct buffer_head *bh, int op_flags)
+{
+	lock_buffer(bh);
+
+	WARN_ON(bh->b_private);
+
+	if (buffer_uptodate(bh)) {
+		unlock_buffer(bh);
+		return;
+	}
+
+	bh->b_private = sb;
+	bh->b_end_io = reiserfs_read_tree_block_endio;
+	get_bh(bh);
+	submit_bh(REQ_OP_READ, REQ_META | op_flags, bh);
+}
+
+void reiserfs_read_tree_block(struct super_block *sb, struct buffer_head *bh)
+{
+	reiserfs_read_tree_block_flags(sb, bh, REQ_META);
+	wait_on_buffer(bh);
+}
+
+struct buffer_head *reiserfs_bread_tree_block(struct super_block *sb,
+					      u32 blocknr)
+{
+	struct buffer_head *bh = sb_getblk(sb, blocknr);
+	if (likely(bh) && !buffer_uptodate(bh)) {
+		reiserfs_read_tree_block_flags(sb, bh, 0);
+		wait_on_buffer(bh);
+		if (!buffer_uptodate(bh)) {
+			brelse(bh);
+			return NULL;
+		}
+	}
+	return bh;
+}
+
+void reiserfs_reada_tree_block(struct super_block *sb, struct buffer_head *bh)
+{
+	reiserfs_read_tree_block_flags(sb, bh, REQ_RAHEAD);
+}
-- 
2.11.0

