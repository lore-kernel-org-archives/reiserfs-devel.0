From: jeffm@suse.com
Subject: [PATCH 1/4] reiserfs: constify read-only helpers
Date: Tue,  9 May 2017 16:50:10 -0400
Message-ID: <20170509205013.568-2-jeffm@suse.com>
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

Basic cleanup - constifying some helper routines.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/prints.c   |  2 +-
 fs/reiserfs/reiserfs.h | 43 +++++++++++++++++++++++--------------------
 fs/reiserfs/super.c    |  8 ++++----
 3 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/fs/reiserfs/prints.c b/fs/reiserfs/prints.c
index 4f3f928076f3..2f6a7b42fa31 100644
--- a/fs/reiserfs/prints.c
+++ b/fs/reiserfs/prints.c
@@ -261,7 +261,7 @@ static void prepare_error_buf(const char *fmt, va_list args)
     va_end( args );\
 }
 
-void __reiserfs_warning(struct super_block *sb, const char *id,
+void __reiserfs_warning(const struct super_block *sb, const char *id,
 			 const char *function, const char *fmt, ...)
 {
 	do_reiserfs_warning(fmt);
diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index 1d34377fef97..15078039367a 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -898,7 +898,7 @@ struct fid;
  */
 #define REISERFS_DEBUG_CODE 5	/* extra messages to help find/debug errors */
 
-void __reiserfs_warning(struct super_block *s, const char *id,
+void __reiserfs_warning(const struct super_block *s, const char *id,
 			 const char *func, const char *fmt, ...);
 #define reiserfs_warning(s, id, fmt, args...) \
 	 __reiserfs_warning(s, id, __func__, fmt, ##args)
@@ -1100,9 +1100,9 @@ struct reiserfs_super_block {
          ((!is_reiserfs_jr(SB_DISK_SUPER_BLOCK(s)) ? \
          SB_ONDISK_JOURNAL_SIZE(s) + 1 : SB_ONDISK_RESERVED_FOR_JOURNAL(s)))
 
-int is_reiserfs_3_5(struct reiserfs_super_block *rs);
-int is_reiserfs_3_6(struct reiserfs_super_block *rs);
-int is_reiserfs_jr(struct reiserfs_super_block *rs);
+int is_reiserfs_3_5(const struct reiserfs_super_block *rs);
+int is_reiserfs_3_6(const struct reiserfs_super_block *rs);
+int is_reiserfs_jr(const struct reiserfs_super_block *rs);
 
 /*
  * ReiserFS leaves the first 64k unused, so that partition labels have
@@ -1157,7 +1157,7 @@ static inline struct reiserfs_sb_info *REISERFS_SB(const struct super_block *sb)
  * Don't trust REISERFS_SB(sb)->s_bmap_nr, it's a u16
  * which overflows on large file systems.
  */
-static inline __u32 reiserfs_bmap_count(struct super_block *sb)
+static inline __u32 reiserfs_bmap_count(const struct super_block *sb)
 {
 	return (SB_BLOCK_COUNT(sb) - 1) / (sb->s_blocksize * 8) + 1;
 }
@@ -1536,43 +1536,46 @@ static inline void set_le_ih_k_type(struct item_head *ih, int type)
 	set_le_key_k_type(ih_version(ih), &(ih->ih_key), type);
 }
 
-static inline int is_direntry_le_key(int version, struct reiserfs_key *key)
+static inline int is_direntry_le_key(int version,
+				     const struct reiserfs_key *key)
 {
 	return le_key_k_type(version, key) == TYPE_DIRENTRY;
 }
 
-static inline int is_direct_le_key(int version, struct reiserfs_key *key)
+static inline int is_direct_le_key(int version, const struct reiserfs_key *key)
 {
 	return le_key_k_type(version, key) == TYPE_DIRECT;
 }
 
-static inline int is_indirect_le_key(int version, struct reiserfs_key *key)
+static inline int is_indirect_le_key(int version,
+				     const struct reiserfs_key *key)
 {
 	return le_key_k_type(version, key) == TYPE_INDIRECT;
 }
 
-static inline int is_statdata_le_key(int version, struct reiserfs_key *key)
+static inline int is_statdata_le_key(int version,
+				     const struct reiserfs_key *key)
 {
 	return le_key_k_type(version, key) == TYPE_STAT_DATA;
 }
 
 /* item header has version.  */
-static inline int is_direntry_le_ih(struct item_head *ih)
+static inline int is_direntry_le_ih(const struct item_head *ih)
 {
 	return is_direntry_le_key(ih_version(ih), &ih->ih_key);
 }
 
-static inline int is_direct_le_ih(struct item_head *ih)
+static inline int is_direct_le_ih(const struct item_head *ih)
 {
 	return is_direct_le_key(ih_version(ih), &ih->ih_key);
 }
 
-static inline int is_indirect_le_ih(struct item_head *ih)
+static inline int is_indirect_le_ih(const struct item_head *ih)
 {
 	return is_indirect_le_key(ih_version(ih), &ih->ih_key);
 }
 
-static inline int is_statdata_le_ih(struct item_head *ih)
+static inline int is_statdata_le_ih(const struct item_head *ih)
 {
 	return is_statdata_le_key(ih_version(ih), &ih->ih_key);
 }
@@ -2184,7 +2187,7 @@ static inline void *reiserfs_node_data(const struct buffer_head *bh)
 }
 
 /* get key from internal node */
-static inline struct reiserfs_key *internal_key(struct buffer_head *bh,
+static inline struct reiserfs_key *internal_key(const struct buffer_head *bh,
 						int item_num)
 {
 	struct reiserfs_key *key = reiserfs_node_data(bh);
@@ -2275,7 +2278,7 @@ static inline int entry_length(const struct buffer_head *bh,
 #define MAX_US_INT 0xffff
 
 // reiserfs version 2 has max offset 60 bits. Version 1 - 32 bit offset
-static inline loff_t max_reiserfs_offset(struct inode *inode)
+static inline loff_t max_reiserfs_offset(const struct inode *inode)
 {
 	if (get_inode_item_key_version(inode) == KEY_FORMAT_3_5)
 		return (loff_t) U32_MAX;
@@ -2592,12 +2595,12 @@ struct buffer_info {
 	int bi_position;
 };
 
-static inline struct super_block *sb_from_tb(struct tree_balance *tb)
+static inline struct super_block *sb_from_tb(const struct tree_balance *tb)
 {
 	return tb ? tb->tb_sb : NULL;
 }
 
-static inline struct super_block *sb_from_bi(struct buffer_info *bi)
+static inline struct super_block *sb_from_bi(const struct buffer_info *bi)
 {
 	return bi ? sb_from_tb(bi->tb) : NULL;
 }
@@ -2883,7 +2886,7 @@ int reiserfs_add_ordered_list(struct inode *inode, struct buffer_head *bh);
 int journal_mark_dirty(struct reiserfs_transaction_handle *,
 		       struct buffer_head *bh);
 
-static inline int reiserfs_file_data_log(struct inode *inode)
+static inline int reiserfs_file_data_log(const struct inode *inode)
 {
 	if (reiserfs_data_log(inode->i_sb) ||
 	    (REISERFS_I(inode)->i_flags & i_data_log))
@@ -2891,7 +2894,7 @@ static inline int reiserfs_file_data_log(struct inode *inode)
 	return 0;
 }
 
-static inline int reiserfs_transaction_running(struct super_block *s)
+static inline int reiserfs_transaction_running(const struct super_block *s)
 {
 	struct reiserfs_transaction_handle *th = current->journal_info;
 	if (th && th->t_super == s)
@@ -2901,7 +2904,7 @@ static inline int reiserfs_transaction_running(struct super_block *s)
 	return 0;
 }
 
-static inline int reiserfs_transaction_free_space(struct reiserfs_transaction_handle *th)
+static inline int reiserfs_transaction_free_space(const struct reiserfs_transaction_handle *th)
 {
 	return th->t_blocks_allocated - th->t_blocks_logged;
 }
diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 685f1e056998..c1a252f175ad 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -37,25 +37,25 @@ static const char reiserfs_3_5_magic_string[] = REISERFS_SUPER_MAGIC_STRING;
 static const char reiserfs_3_6_magic_string[] = REISER2FS_SUPER_MAGIC_STRING;
 static const char reiserfs_jr_magic_string[] = REISER2FS_JR_SUPER_MAGIC_STRING;
 
-int is_reiserfs_3_5(struct reiserfs_super_block *rs)
+int is_reiserfs_3_5(const struct reiserfs_super_block *rs)
 {
 	return !strncmp(rs->s_v1.s_magic, reiserfs_3_5_magic_string,
 			strlen(reiserfs_3_5_magic_string));
 }
 
-int is_reiserfs_3_6(struct reiserfs_super_block *rs)
+int is_reiserfs_3_6(const struct reiserfs_super_block *rs)
 {
 	return !strncmp(rs->s_v1.s_magic, reiserfs_3_6_magic_string,
 			strlen(reiserfs_3_6_magic_string));
 }
 
-int is_reiserfs_jr(struct reiserfs_super_block *rs)
+int is_reiserfs_jr(const struct reiserfs_super_block *rs)
 {
 	return !strncmp(rs->s_v1.s_magic, reiserfs_jr_magic_string,
 			strlen(reiserfs_jr_magic_string));
 }
 
-static int is_any_reiserfs_magic_string(struct reiserfs_super_block *rs)
+static int is_any_reiserfs_magic_string(const struct reiserfs_super_block *rs)
 {
 	return (is_reiserfs_3_5(rs) || is_reiserfs_3_6(rs) ||
 		is_reiserfs_jr(rs));
-- 
2.11.0

