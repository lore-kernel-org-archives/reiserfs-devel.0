From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv5 1/4] reiser4: make space_allocator's check_blocks() reusable.
Date: Sat, 21 Jun 2014 00:39:55 +0400
Message-ID: <1403296798-11742-2-git-send-email-intelfx100@gmail.com>
References: <1403296798-11742-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QpQYjtDQ0VpGCXk8ATdXZjBtJso5IFMAQijVsepIdbM=;
        b=gW2i41WH7AFP8B+sEmmw1GgmdGc9/UybylhSNEpJhyJqNuyliDaoaKY3jaNj5aQdSc
         FC+P6lY2aiUf62pQw2Cw514tW0JN204IqlhRqipI/jbG/OGBDtc8nXRU/BBAEKqaTK3d
         /yd8SKx42FbmxYinimGqpQVJ11eIi6Sm9k4uwKRzk1crJ2n2viuWZMNSMR5YJGV15+WU
         +TmCYtyeA06SE6nYTKawDFcJUMVeZgsFcaqzor1iy4vjsUBXAEK3mY8zCP5Z0Lzsomgb
         ytqg1FtxG+jPh9IxeL2jHd3FIUdAPuZkXlbZK+LEP8yi/0p2Qh3Dh/YJkM4+PCCHCrDS
         Hlug==
In-Reply-To: <1403296798-11742-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

Make check_blocks() return a boolean value (whether did the extent's
state match our expectations) instead of asserting success and crashing
system otherwise.
Also make it possible to check extents spanning multiple bitmap blocks.

The only user of reiser4_check_block() in its previous form has been updated
to assert on true return value.

Thus check_blocks() can now be reused by various parts of reiser4, e. g.
by the discard subsystem which will be added in next commits.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/block_alloc.c                  | 16 +------
 fs/reiser4/block_alloc.h                  | 14 +++---
 fs/reiser4/plugin/space/bitmap.c          | 77 ++++++++++++++++++++-----------
 fs/reiser4/plugin/space/bitmap.h          |  2 +-
 fs/reiser4/plugin/space/space_allocator.h |  4 +-
 fs/reiser4/znode.c                        |  9 ++--
 6 files changed, 68 insertions(+), 54 deletions(-)

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 81ed96f..57b0836 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -962,26 +962,14 @@ static void used2free(reiser4_super_info_data * sbinfo, __u64 count)
 	spin_unlock_reiser4_super(sbinfo);
 }
 
-#if REISER4_DEBUG
-
 /* check "allocated" state of given block range */
-static void
+int
 reiser4_check_blocks(const reiser4_block_nr * start,
 		     const reiser4_block_nr * len, int desired)
 {
-	sa_check_blocks(start, len, desired);
+	return sa_check_blocks(start, len, desired);
 }
 
-/* check "allocated" state of given block */
-void reiser4_check_block(const reiser4_block_nr * block, int desired)
-{
-	const reiser4_block_nr one = 1;
-
-	reiser4_check_blocks(block, &one, desired);
-}
-
-#endif
-
 /* Blocks deallocation function may do an actual deallocation through space
    plugin allocation or store deleted block numbers in atom's delete_set data
    structure depend on @defer parameter. */
diff --git a/fs/reiser4/block_alloc.h b/fs/reiser4/block_alloc.h
index 689efc1..a4e98af 100644
--- a/fs/reiser4/block_alloc.h
+++ b/fs/reiser4/block_alloc.h
@@ -150,15 +150,15 @@ extern void cluster_reserved2free(int count);
 
 extern int reiser4_check_block_counters(const struct super_block *);
 
-#if REISER4_DEBUG
 
-extern void reiser4_check_block(const reiser4_block_nr *, int);
+extern int reiser4_check_blocks(const reiser4_block_nr *start,
+                                const reiser4_block_nr *len, int desired);
 
-#else
-
-#  define reiser4_check_block(beg, val)        noop
-
-#endif
+static inline int reiser4_check_block(const reiser4_block_nr *start,
+                                      int desired)
+{
+	return reiser4_check_blocks(start, NULL, desired);
+}
 
 extern int reiser4_pre_commit_hook(void);
 extern void reiser4_post_commit_hook(void);
diff --git a/fs/reiser4/plugin/space/bitmap.c b/fs/reiser4/plugin/space/bitmap.c
index 1d0fabf..5bfa71b 100644
--- a/fs/reiser4/plugin/space/bitmap.c
+++ b/fs/reiser4/plugin/space/bitmap.c
@@ -1222,29 +1222,13 @@ void reiser4_dealloc_blocks_bitmap(reiser4_space_allocator * allocator,
 	release_and_unlock_bnode(bnode);
 }
 
-/* plugin->u.space_allocator.check_blocks(). */
-void reiser4_check_blocks_bitmap(const reiser4_block_nr * start,
-				 const reiser4_block_nr * len, int desired)
+static int check_blocks_one_bitmap(bmap_nr_t bmap, bmap_off_t start_offset,
+                                    bmap_off_t end_offset, int desired)
 {
-#if REISER4_DEBUG
 	struct super_block *super = reiser4_get_current_sb();
-
-	bmap_nr_t bmap;
-	bmap_off_t start_offset;
-	bmap_off_t end_offset;
-
-	struct bitmap_node *bnode;
+	struct bitmap_node *bnode = get_bnode(super, bmap);
 	int ret;
 
-	assert("zam-622", len != NULL);
-	check_block_range(start, len);
-	parse_blocknr(start, &bmap, &start_offset);
-
-	end_offset = start_offset + *len;
-	assert("nikita-2214", end_offset <= bmap_bit_count(super->s_blocksize));
-
-	bnode = get_bnode(super, bmap);
-
 	assert("nikita-2215", bnode != NULL);
 
 	ret = load_and_lock_bnode(bnode);
@@ -1253,19 +1237,60 @@ void reiser4_check_blocks_bitmap(const reiser4_block_nr * start,
 	assert("nikita-2216", jnode_is_loaded(bnode->wjnode));
 
 	if (desired) {
-		assert("zam-623",
-		       reiser4_find_next_zero_bit(bnode_working_data(bnode),
+		ret = reiser4_find_next_zero_bit(bnode_working_data(bnode),
 						  end_offset, start_offset)
-		       >= end_offset);
+		      >= end_offset;
 	} else {
-		assert("zam-624",
-		       reiser4_find_next_set_bit(bnode_working_data(bnode),
+		ret = reiser4_find_next_set_bit(bnode_working_data(bnode),
 						 end_offset, start_offset)
-		       >= end_offset);
+		      >= end_offset;
 	}
 
 	release_and_unlock_bnode(bnode);
-#endif
+
+	return ret;
+}
+
+/* plugin->u.space_allocator.check_blocks(). */
+int reiser4_check_blocks_bitmap(const reiser4_block_nr * start,
+				 const reiser4_block_nr * len, int desired)
+{
+	struct super_block *super = reiser4_get_current_sb();
+
+	reiser4_block_nr end;
+	bmap_nr_t bmap, end_bmap;
+	bmap_off_t offset;
+	bmap_off_t end_offset;
+	const bmap_off_t max_offset = bmap_bit_count(super->s_blocksize);
+
+	if (len != NULL) {
+		check_block_range(start, len);
+		end = *start + *len - 1;
+	} else {
+		/* end is used as temporary len here */
+		check_block_range(start, &(end = 1));
+		end = *start;
+	}
+
+	parse_blocknr(start, &bmap, &offset);
+
+	if (end == *start) {
+		end_bmap = bmap;
+		end_offset = offset;
+	} else {
+		parse_blocknr(&end, &end_bmap, &end_offset);
+	}
+	++end_offset;
+
+	assert("intelfx-4", end_bmap >= bmap);
+	assert("intelfx-5", ergo(end_bmap == bmap, end_offset > offset));
+
+	for (; bmap < end_bmap; bmap++, offset = 0) {
+		if (!check_blocks_one_bitmap(bmap, offset, max_offset, desired)) {
+			return 0;
+		}
+	}
+	return check_blocks_one_bitmap(bmap, offset, end_offset, desired);
 }
 
 /* conditional insertion of @node into atom's overwrite set  if it was not there */
diff --git a/fs/reiser4/plugin/space/bitmap.h b/fs/reiser4/plugin/space/bitmap.h
index be867f1..4590498 100644
--- a/fs/reiser4/plugin/space/bitmap.h
+++ b/fs/reiser4/plugin/space/bitmap.h
@@ -19,7 +19,7 @@ extern int reiser4_alloc_blocks_bitmap(reiser4_space_allocator *,
 				       reiser4_blocknr_hint *, int needed,
 				       reiser4_block_nr * start,
 				       reiser4_block_nr * len);
-extern void reiser4_check_blocks_bitmap(const reiser4_block_nr *,
+extern int reiser4_check_blocks_bitmap(const reiser4_block_nr *,
 					const reiser4_block_nr *, int);
 extern void reiser4_dealloc_blocks_bitmap(reiser4_space_allocator *,
 					  reiser4_block_nr,
diff --git a/fs/reiser4/plugin/space/space_allocator.h b/fs/reiser4/plugin/space/space_allocator.h
index 5bfa9a3..71bfd11 100644
--- a/fs/reiser4/plugin/space/space_allocator.h
+++ b/fs/reiser4/plugin/space/space_allocator.h
@@ -29,9 +29,9 @@ static inline void sa_dealloc_blocks (reiser4_space_allocator * al, reiser4_bloc
 	reiser4_dealloc_blocks_##allocator (al, start, len);								\
 }															\
 															\
-static inline void sa_check_blocks (const reiser4_block_nr * start, const reiser4_block_nr * end, int desired) 		\
+static inline int sa_check_blocks (const reiser4_block_nr * start, const reiser4_block_nr * end, int desired) 		\
 {															\
-	reiser4_check_blocks_##allocator (start, end, desired);							        \
+	return reiser4_check_blocks_##allocator (start, end, desired);							        \
 }															\
 															\
 static inline void sa_pre_commit_hook (void)										\
diff --git a/fs/reiser4/znode.c b/fs/reiser4/znode.c
index 4ff9714..08eab3d 100644
--- a/fs/reiser4/znode.c
+++ b/fs/reiser4/znode.c
@@ -534,10 +534,11 @@ znode *zget(reiser4_tree * tree,
 
 		write_unlock_tree(tree);
 	}
-#if REISER4_DEBUG
-	if (!reiser4_blocknr_is_fake(blocknr) && *blocknr != 0)
-		reiser4_check_block(blocknr, 1);
-#endif
+
+	assert("intelfx-6",
+	       ergo(!reiser4_blocknr_is_fake(blocknr) && *blocknr != 0,
+	            reiser4_check_block(blocknr, 1)));
+
 	/* Check for invalid tree level, return -EIO */
 	if (unlikely(znode_get_level(result) != level)) {
 		warning("jmacd-504",
-- 
2.0.0

