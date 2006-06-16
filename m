From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH 05/05] reiserfs: use reiserfs_error()
Date: Thu, 15 Jun 2006 22:01:44 -0700
Message-ID: <44923B38.4030802@namesys.com>
References: <20060616041901.GA5420@locomotive.unixthugs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28795-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060616041901.GA5420@locomotive.unixthugs.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Jeff Mahoney wrote:

> This patch makes many paths that are currently using warnings to handle
> the error.
>
>Signed-off-by: Jeff Mahoney <jeffm@suse.com>
>
>--
> fs/reiserfs/bitmap.c          |   52 +++++++++++++++----------------
> fs/reiserfs/file.c            |   12 +++----
> fs/reiserfs/inode.c           |   43 ++++++++++++-------------
> fs/reiserfs/lbalance.c        |   20 ++++++------
> fs/reiserfs/namei.c           |   24 +++++++-------
> fs/reiserfs/objectid.c        |    4 +-
> fs/reiserfs/stree.c           |   70 +++++++++++++++++++++---------------------
> fs/reiserfs/super.c           |   15 ++++-----
> fs/reiserfs/tail_conversion.c |    6 +--
> fs/reiserfs/xattr.c           |   19 +++++------
> 10 files changed, 130 insertions(+), 135 deletions(-)
>
>diff -ruNpX ../dontdiff linux-2.6.17-rc6-staging1/fs/reiserfs/bitmap.c linux-2.6.17-rc6-staging2/fs/reiserfs/bitmap.c
>--- linux-2.6.17-rc6-staging1/fs/reiserfs/bitmap.c	2006-06-15 20:59:45.000000000 -0400
>+++ linux-2.6.17-rc6-staging2/fs/reiserfs/bitmap.c	2006-06-15 20:59:46.000000000 -0400
>@@ -63,27 +63,27 @@ int is_reusable(struct super_block *s, b
> 	int i, j;
> 
> 	if (block == 0 || block >= SB_BLOCK_COUNT(s)) {
>-		reiserfs_warning(s, "vs-4010",
>-		                 "block number is out of range %lu (%u)",
>-				 block, SB_BLOCK_COUNT(s));
>+		reiserfs_error(s, "vs-4010",
>+		               "block number is out of range %lu (%u)",
>+		               block, SB_BLOCK_COUNT(s));
> 		return 0;
> 	}
> 
> 	/* it can't be one of the bitmap blocks */
> 	for (i = 0; i < SB_BMAP_NR(s); i++)
> 		if (block == SB_AP_BITMAP(s)[i].bh->b_blocknr) {
>-			reiserfs_warning(s, "vs-4020", "bitmap block "
>-			                 "%lu(%u) can't be freed or reused",
>-					 block, SB_BMAP_NR(s));
>+			reiserfs_error(s, "vs-4020", "bitmap block "
>+			               "%lu(%u) can't be freed or reused",
>+			               block, SB_BMAP_NR(s));
> 			return 0;
> 		}
> 
> 	get_bit_address(s, block, &i, &j);
> 
> 	if (i >= SB_BMAP_NR(s)) {
>-		reiserfs_warning(s, "vs-4030", "there is no so many "
>  
>
Jeff, as a native english speaker, can you review the english and
informativeness of these?

>-		                 "bitmap blocks: block=%lu, bitmap_nr=%d",
>-				 block, i);
>+		reiserfs_error(s, "vs-4030", "there is no so many "
>+		               "bitmap blocks: block=%lu, bitmap_nr=%d",
>+		               block, i);
> 		return 0;
> 	}
> 
>@@ -91,10 +91,10 @@ int is_reusable(struct super_block *s, b
> 	     reiserfs_test_le_bit(j, SB_AP_BITMAP(s)[i].bh->b_data)) ||
> 	    (bit_value == 1 &&
> 	     reiserfs_test_le_bit(j, SB_AP_BITMAP(s)[i].bh->b_data) == 0)) {
>-		reiserfs_warning(s, "vs-4040", "corresponding bit of "
>-		                 "block %lu does not match required value "
>-				 "(i==%d, j==%d) test_bit==%d",
>-				 block, i, j, reiserfs_test_le_bit(j,
>+		reiserfs_error(s, "vs-4040", "corresponding bit of "
>+		               "block %lu does not match required value "
>+		               "(i==%d, j==%d) test_bit==%d",
>+		               block, i, j, reiserfs_test_le_bit(j,
> 								   SB_AP_BITMAP
> 								   (s)[i].bh->
> 								   b_data));
>@@ -103,8 +103,8 @@ int is_reusable(struct super_block *s, b
> 	}
> 
> 	if (bit_value == 0 && block == SB_ROOT_BLOCK(s)) {
>-		reiserfs_warning(s, "vs-4050", "this is root block (%u), "
>-				 "it must be busy", SB_ROOT_BLOCK(s));
>+		reiserfs_error(s, "vs-4050", "this is root block (%u), "
>+		               "it must be busy", SB_ROOT_BLOCK(s));
> 		return 0;
> 	}
> 
>@@ -155,8 +155,8 @@ static int scan_bitmap_block(struct reis
> /* - I mean `a window of zero bits' as in description of this function - Zam. */
> 
> 	if (!bi) {
>-		reiserfs_warning(s, "jdm-4055", "NULL bitmap info pointer "
>-		                 "for bitmap %d", bmap_n);
>+		reiserfs_error(s, "jdm-4055", "NULL bitmap info pointer "
>+		               "for bitmap %d", bmap_n);
> 		return 0;
> 	}
> 	if (buffer_locked(bi->bh)) {
>@@ -388,8 +388,8 @@ static void _reiserfs_free_block(struct 
> 	get_bit_address(s, block, &nr, &offset);
> 
> 	if (nr >= sb_bmap_nr(rs)) {
>- 		reiserfs_warning(s, "vs-4075",
>-				 "block %lu is out of range", block);
>+		reiserfs_error(s, "vs-4075",
>+		               "block %lu is out of range", block);
> 		return;
> 	}
> 
>@@ -397,8 +397,8 @@ static void _reiserfs_free_block(struct 
> 
> 	/* clear bit for the given block in bit map */
> 	if (!reiserfs_test_and_clear_le_bit(offset, apbi[nr].bh->b_data)) {
>-		reiserfs_warning(s, "vs-4080",
>-		                 "block %lu: bit already cleared", block);
>+		reiserfs_error(s, "vs-4080",
>+		               "block %lu: bit already cleared", block);
> 	}
> 	apbi[nr].free_count++;
> 	journal_mark_dirty(th, s, apbi[nr].bh);
>@@ -449,8 +449,8 @@ static void __discard_prealloc(struct re
> 	BUG_ON(!th->t_trans_id);
> #ifdef CONFIG_REISERFS_CHECK
> 	if (ei->i_prealloc_count < 0)
>-		reiserfs_warning(th->t_super, "zam-4001",
>-		                 "inode has negative prealloc blocks count.");
>+		reiserfs_error(th->t_super, "zam-4001",
>+		               "inode has negative prealloc blocks count.");
> #endif
> 	while (ei->i_prealloc_count > 0) {
> 		reiserfs_free_prealloc_block(th, inode, ei->i_prealloc_block);
>@@ -486,9 +486,9 @@ void reiserfs_discard_all_prealloc(struc
> 				i_prealloc_list);
> #ifdef CONFIG_REISERFS_CHECK
> 		if (!ei->i_prealloc_count) {
>-			reiserfs_warning(th->t_super, "zam-4001",
>-			                 "inode is in prealloc list but has "
>-					 "no preallocated blocks.");
>+			reiserfs_error(th->t_super, "zam-4001",
>+			               "inode is in prealloc list but has "
>+			               "no preallocated blocks.");
> 		}
> #endif
> 		__discard_prealloc(th, ei);
>diff -ruNpX ../dontdiff linux-2.6.17-rc6-staging1/fs/reiserfs/file.c linux-2.6.17-rc6-staging2/fs/reiserfs/file.c
>--- linux-2.6.17-rc6-staging1/fs/reiserfs/file.c	2006-06-15 20:59:45.000000000 -0400
>+++ linux-2.6.17-rc6-staging2/fs/reiserfs/file.c	2006-06-15 20:59:46.000000000 -0400
>@@ -380,7 +380,7 @@ static int reiserfs_allocate_blocks_for_
> 					if (res != ITEM_NOT_FOUND) {
> 						/* item should not exist, otherwise we have error */
> 						if (res != -ENOSPC) {
>-							reiserfs_warning(inode->
>+							reiserfs_error(inode->
> 									 i_sb,
> 									 "green-9008",
> 									 "search_by_key (%K) returned %d",
>@@ -582,11 +582,11 @@ static int reiserfs_allocate_blocks_for_
> 				/* Well, if we have found such item already, or some error
> 				   occured, we need to warn user and return error */
> 				if (res != -ENOSPC) {
>-					reiserfs_warning(inode->i_sb,
>-							 "green-9009",
>-							 "search_by_key (%K) "
>-							 "returned %d", &key,
>-							 res);
>+					reiserfs_error(inode->i_sb,
>+					               "green-9009",
>+					               "search_by_key (%K) "
>+					               "returned %d", &key,
>+					               res);
> 				}
> 				res = -EIO;
> 				goto error_exit_free_blocks;
>diff -ruNpX ../dontdiff linux-2.6.17-rc6-staging1/fs/reiserfs/inode.c linux-2.6.17-rc6-staging2/fs/reiserfs/inode.c
>--- linux-2.6.17-rc6-staging1/fs/reiserfs/inode.c	2006-06-15 20:59:45.000000000 -0400
>+++ linux-2.6.17-rc6-staging2/fs/reiserfs/inode.c	2006-06-15 20:59:46.000000000 -0400
>@@ -847,11 +847,11 @@ int reiserfs_get_block(struct inode *ino
> 							  tail_offset);
> 				if (retval) {
> 					if (retval != -ENOSPC)
>-						reiserfs_warning(inode->i_sb,
>-								 "clm-6004",
>-								 "convert tail failed inode %lu, error %d",
>-								 inode->i_ino,
>-								 retval);
>+						reiserfs_error(inode->i_sb,
>+						               "clm-6004",
>+						               "convert tail failed inode %lu, error %d",
>+						               inode->i_ino,
>+						               retval);
> 					if (allocated_block_nr) {
> 						/* the bitmap, the super, and the stat data == 3 */
> 						if (!th)
>@@ -1341,10 +1341,9 @@ void reiserfs_update_sd_size(struct reis
> 		/* look for the object's stat data */
> 		retval = search_item(inode->i_sb, &key, &path);
> 		if (retval == IO_ERROR) {
>-			reiserfs_warning(inode->i_sb, "vs-13050",
>-					 "i/o failure occurred trying to "
>-					 "update %K stat data",
>-					 &key);
>+			reiserfs_error(inode->i_sb, "vs-13050",
>+			               "i/o failure occurred trying to "
>+			               "update %K stat data", &key);
> 			return;
> 		}
> 		if (retval == ITEM_NOT_FOUND) {
>@@ -1433,9 +1432,9 @@ void reiserfs_read_locked_inode(struct i
> 	/* look for the object's stat data */
> 	retval = search_item(inode->i_sb, &key, &path_to_sd);
> 	if (retval == IO_ERROR) {
>-		reiserfs_warning(inode->i_sb, "vs-13070",
>-				 "i/o failure occurred trying to find "
>-				 "stat data of %K", &key);
>+		reiserfs_error(inode->i_sb, "vs-13070",
>+		               "i/o failure occurred trying to find "
>+		               "stat data of %K", &key);
> 		reiserfs_make_bad_inode(inode);
> 		return;
> 	}
>@@ -1704,8 +1703,8 @@ static int reiserfs_new_directory(struct
> 	/* look for place in the tree for new item */
> 	retval = search_item(sb, &key, path);
> 	if (retval == IO_ERROR) {
>-		reiserfs_warning(sb, "vs-13080",
>-				 "i/o failure occurred creating new directory");
>+		reiserfs_error(sb, "vs-13080",
>+		               "i/o failure occurred creating new directory");
> 		return -EIO;
> 	}
> 	if (retval == ITEM_FOUND) {
>@@ -1744,8 +1743,8 @@ static int reiserfs_new_symlink(struct r
> 	/* look for place in the tree for new item */
> 	retval = search_item(sb, &key, path);
> 	if (retval == IO_ERROR) {
>-		reiserfs_warning(sb, "vs-13080",
>-				 "i/o failure occurred creating new symlink");
>+		reiserfs_error(sb, "vs-13080",
>+		               "i/o failure occurred creating new symlink");
> 		return -EIO;
> 	}
> 	if (retval == ITEM_FOUND) {
>@@ -2063,10 +2062,8 @@ static int grab_tail_page(struct inode *
> 		 ** I've screwed up the code to find the buffer, or the code to
> 		 ** call prepare_write
> 		 */
>-		reiserfs_warning(p_s_inode->i_sb, "clm-6000",
>-		                 "error reading block %lu on dev %s",
>-				 bh->b_blocknr,
>-				 reiserfs_bdevname(p_s_inode->i_sb));
>+		reiserfs_error(p_s_inode->i_sb, "clm-6000",
>+		               "error reading block %lu", bh->b_blocknr);
> 		error = -EIO;
> 		goto unlock;
> 	}
>@@ -2108,9 +2105,9 @@ int reiserfs_truncate_file(struct inode 
> 			// and get_block_create_0 could not find a block to read in,
> 			// which is ok.
> 			if (error != -ENOENT)
>-				reiserfs_warning(p_s_inode->i_sb, "clm-6001",
>-				                 "grab_tail_page failed %d",
>-						 error);
>+				reiserfs_error(p_s_inode->i_sb, "clm-6001",
>+				               "grab_tail_page failed %d",
>+				               error);
> 			page = NULL;
> 			bh = NULL;
> 		}
>diff -ruNpX ../dontdiff linux-2.6.17-rc6-staging1/fs/reiserfs/lbalance.c linux-2.6.17-rc6-staging2/fs/reiserfs/lbalance.c
>--- linux-2.6.17-rc6-staging1/fs/reiserfs/lbalance.c	2006-06-15 20:59:45.000000000 -0400
>+++ linux-2.6.17-rc6-staging2/fs/reiserfs/lbalance.c	2006-06-15 20:59:46.000000000 -0400
>@@ -1288,17 +1288,17 @@ void leaf_paste_entries(struct buffer_he
> 			prev = (i != 0) ? deh_location(&(deh[i - 1])) : 0;
> 
> 			if (prev && prev <= deh_location(&(deh[i])))
>-				reiserfs_warning(NULL, "vs-10240",
>-				                 "directory item (%h) "
>-						 "corrupted (prev %a, "
>-						 "cur(%d) %a)",
>-						 ih, deh + i - 1, i, deh + i);
>+				reiserfs_error(NULL, "vs-10240",
>+				               "directory item (%h) "
>+				               "corrupted (prev %a, "
>+				               "cur(%d) %a)",
>+				               ih, deh + i - 1, i, deh + i);
> 			if (next && next >= deh_location(&(deh[i])))
>-				reiserfs_warning(NULL, "vs-10250",
>-				                 "directory item (%h) "
>-						 "corrupted (cur(%d) %a, "
>-						 "next %a)",
>-						 ih, i, deh + i, deh + i + 1);
>+				reiserfs_error(NULL, "vs-10250",
>+				               "directory item (%h) "
>+				               "corrupted (cur(%d) %a, "
>+				               "next %a)",
>+				               ih, i, deh + i, deh + i + 1);
> 		}
> 	}
> #endif
>diff -ruNpX ../dontdiff linux-2.6.17-rc6-staging1/fs/reiserfs/namei.c linux-2.6.17-rc6-staging2/fs/reiserfs/namei.c
>--- linux-2.6.17-rc6-staging1/fs/reiserfs/namei.c	2006-06-15 20:59:45.000000000 -0400
>+++ linux-2.6.17-rc6-staging2/fs/reiserfs/namei.c	2006-06-15 20:59:46.000000000 -0400
>@@ -125,8 +125,8 @@ int search_by_entry_key(struct super_blo
> 	switch (retval) {
> 	case ITEM_NOT_FOUND:
> 		if (!PATH_LAST_POSITION(path)) {
>-			reiserfs_warning(sb, "vs-7000", "search_by_key "
>-			                 "returned item position == 0");
>+			reiserfs_error(sb, "vs-7000", "search_by_key "
>+			               "returned item position == 0");
> 			pathrelse(path);
> 			return IO_ERROR;
> 		}
>@@ -140,7 +140,7 @@ int search_by_entry_key(struct super_blo
> 
> 	default:
> 		pathrelse(path);
>-		reiserfs_warning(sb, "vs-7002", "no path to here");
>+		reiserfs_error(sb, "vs-7002", "no path to here");
> 		return IO_ERROR;
> 	}
> 
>@@ -304,7 +304,7 @@ static int reiserfs_find_entry(struct in
> 		    search_by_entry_key(dir->i_sb, &key_to_search,
> 					path_to_entry, de);
> 		if (retval == IO_ERROR) {
>-			reiserfs_warning(dir->i_sb, "zam-7001", "io error");
>+			reiserfs_error(dir->i_sb, "zam-7001", "io error");
> 			return IO_ERROR;
> 		}
> 
>@@ -496,9 +496,9 @@ static int reiserfs_add_entry(struct rei
> 		}
> 
> 		if (retval != NAME_FOUND) {
>-			reiserfs_warning(dir->i_sb, "zam-7002",
>-			                 "reiserfs_find_entry() returned "
>-					 "unexpected value (%d)", retval);
>+			reiserfs_error(dir->i_sb, "zam-7002",
>+			               "reiserfs_find_entry() returned "
>+			               "unexpected value (%d)", retval);
> 		}
> 
> 		return -EEXIST;
>@@ -908,9 +908,9 @@ static int reiserfs_rmdir(struct inode *
> 		goto end_rmdir;
> 
> 	if (inode->i_nlink != 2 && inode->i_nlink != 1)
>-		reiserfs_warning(inode->i_sb, "reiserfs-7040",
>-		                 "empty directory has nlink != 2 (%d)",
>-				 inode->i_nlink);
>+		reiserfs_error(inode->i_sb, "reiserfs-7040",
>+		               "empty directory has nlink != 2 (%d)",
>+		               inode->i_nlink);
> 
> 	inode->i_nlink = 0;
> 	inode->i_ctime = dir->i_ctime = dir->i_mtime = CURRENT_TIME_SEC;
>@@ -1502,8 +1502,8 @@ static int reiserfs_rename(struct inode 
> 	if (reiserfs_cut_from_item
> 	    (&th, &old_entry_path, &(old_de.de_entry_key), old_dir, NULL,
> 	     0) < 0)
>-		reiserfs_warning(old_dir->i_sb, "vs-7060",
>-		                 "couldn't not cut old name. Fsck later?");
>+		reiserfs_error(old_dir->i_sb, "vs-7060",
>+		               "couldn't not cut old name. Fsck later?");
> 
> 	old_dir->i_size -= DEH_SIZE + old_de.de_entrylen;
> 
>diff -ruNpX ../dontdiff linux-2.6.17-rc6-staging1/fs/reiserfs/objectid.c linux-2.6.17-rc6-staging2/fs/reiserfs/objectid.c
>--- linux-2.6.17-rc6-staging1/fs/reiserfs/objectid.c	2006-06-15 20:59:45.000000000 -0400
>+++ linux-2.6.17-rc6-staging2/fs/reiserfs/objectid.c	2006-06-15 20:59:46.000000000 -0400
>@@ -162,8 +162,8 @@ void reiserfs_release_objectid(struct re
> 		i += 2;
> 	}
> 
>-	reiserfs_warning(s, "vs-15011", "tried to free free object id (%lu)",
>-			 (long unsigned)objectid_to_release);
>+	reiserfs_error(s, "vs-15011", "tried to free free object id (%lu)",
>+	               (long unsigned)objectid_to_release);
> }
> 
> int reiserfs_convert_objectid_map_v1(struct super_block *s)
>diff -ruNpX ../dontdiff linux-2.6.17-rc6-staging1/fs/reiserfs/stree.c linux-2.6.17-rc6-staging2/fs/reiserfs/stree.c
>--- linux-2.6.17-rc6-staging1/fs/reiserfs/stree.c	2006-06-15 20:59:45.000000000 -0400
>+++ linux-2.6.17-rc6-staging2/fs/reiserfs/stree.c	2006-06-15 20:59:46.000000000 -0400
>@@ -446,24 +446,24 @@ static int is_leaf(char *buf, int blocks
> 
> 	blkh = (struct block_head *)buf;
> 	if (blkh_level(blkh) != DISK_LEAF_NODE_LEVEL) {
>-		reiserfs_warning(NULL, "reiserfs-5080",
>-		                 "this should be caught earlier");
>+		reiserfs_error(NULL, "reiserfs-5080",
>+		               "this should be caught earlier");
> 		return 0;
> 	}
> 
> 	nr = blkh_nr_item(blkh);
> 	if (nr < 1 || nr > ((blocksize - BLKH_SIZE) / (IH_SIZE + MIN_ITEM_LEN))) {
> 		/* item number is too big or too small */
>-		reiserfs_warning(NULL, "reiserfs-5081",
>-		                 "nr_item seems wrong: %z", bh);
>+		reiserfs_error(NULL, "reiserfs-5081",
>+		               "nr_item seems wrong: %z", bh);
> 		return 0;
> 	}
> 	ih = (struct item_head *)(buf + BLKH_SIZE) + nr - 1;
> 	used_space = BLKH_SIZE + IH_SIZE * nr + (blocksize - ih_location(ih));
> 	if (used_space != blocksize - blkh_free_space(blkh)) {
> 		/* free space does not match to calculated amount of use space */
>-		reiserfs_warning(NULL, "reiserfs-5082",
>-		                 "free space seems wrong: %z", bh);
>+		reiserfs_error(NULL, "reiserfs-5082",
>+		               "free space seems wrong: %z", bh);
> 		return 0;
> 	}
> 	// FIXME: it is_leaf will hit performance too much - we may have
>@@ -474,28 +474,28 @@ static int is_leaf(char *buf, int blocks
> 	prev_location = blocksize;
> 	for (i = 0; i < nr; i++, ih++) {
> 		if (le_ih_k_type(ih) == TYPE_ANY) {
>-			reiserfs_warning(NULL, "reiserfs-5083",
>-					 "wrong item type for item %h",
>+			reiserfs_error(NULL, "reiserfs-5083",
>+			               "wrong item type for item %h",
> 					 ih);
> 			return 0;
> 		}
> 		if (ih_location(ih) >= blocksize
> 		    || ih_location(ih) < IH_SIZE * nr) {
>-			reiserfs_warning(NULL, "reiserfs-5084",
>-					 "item location seems wrong: %h",
>+			reiserfs_error(NULL, "reiserfs-5084",
>+			               "item location seems wrong: %h",
> 					 ih);
> 			return 0;
> 		}
> 		if (ih_item_len(ih) < 1
> 		    || ih_item_len(ih) > MAX_ITEM_LEN(blocksize)) {
>-			reiserfs_warning(NULL, "reiserfs-5085",
>-					 "item length seems wrong: %h",
>+			reiserfs_error(NULL, "reiserfs-5085",
>+			               "item length seems wrong: %h",
> 					 ih);
> 			return 0;
> 		}
> 		if (prev_location - ih_location(ih) != ih_item_len(ih)) {
>-			reiserfs_warning(NULL, "reiserfs-5086",
>-					 "item location seems wrong "
>+			reiserfs_error(NULL, "reiserfs-5086",
>+			               "item location seems wrong "
> 					 "(second one): %h", ih);
> 			return 0;
> 		}
>@@ -517,23 +517,23 @@ static int is_internal(char *buf, int bl
> 	nr = blkh_level(blkh);
> 	if (nr <= DISK_LEAF_NODE_LEVEL || nr > MAX_HEIGHT) {
> 		/* this level is not possible for internal nodes */
>-		reiserfs_warning(NULL, "reiserfs-5087",
>-				 "this should be caught earlier");
>+		reiserfs_error(NULL, "reiserfs-5087",
>+		               "this should be caught earlier");
> 		return 0;
> 	}
> 
> 	nr = blkh_nr_item(blkh);
> 	if (nr > (blocksize - BLKH_SIZE - DC_SIZE) / (KEY_SIZE + DC_SIZE)) {
> 		/* for internal which is not root we might check min number of keys */
>-		reiserfs_warning(NULL, "reiserfs-5088",
>-				 "number of key seems wrong: %z", bh);
>+		reiserfs_error(NULL, "reiserfs-5088",
>+		               "number of key seems wrong: %z", bh);
> 		return 0;
> 	}
> 
> 	used_space = BLKH_SIZE + KEY_SIZE * nr + DC_SIZE * (nr + 1);
> 	if (used_space != blocksize - blkh_free_space(blkh)) {
>-		reiserfs_warning(NULL, "reiserfs-5089",
>-				 "free space seems wrong: %z", bh);
>+		reiserfs_error(NULL, "reiserfs-5089",
>+		               "free space seems wrong: %z", bh);
> 		return 0;
> 	}
> 	// one may imagine much more checks
>@@ -545,8 +545,8 @@ static int is_internal(char *buf, int bl
> static int is_tree_node(struct buffer_head *bh, int level)
> {
> 	if (B_LEVEL(bh) != level) {
>-		reiserfs_warning(NULL, "reiserfs-5090", "node level %d does "
>-		                 "not match to the expected one %d",
>+		reiserfs_error(NULL, "reiserfs-5090", "node level %d does "
>+		               "not match to the expected one %d",
> 				 B_LEVEL(bh), level);
> 		return 0;
> 	}
>@@ -723,9 +723,9 @@ int search_by_key(struct super_block *p_
> 		// make sure, that the node contents look like a node of
> 		// certain level
> 		if (!is_tree_node(p_s_bh, expected_level)) {
>-			reiserfs_warning(p_s_sb, "vs-5150",
>-					 "invalid format found in block %ld. "
>-					 "Fsck?", p_s_bh->b_blocknr);
>+			reiserfs_error(p_s_sb, "vs-5150",
>+			               "invalid format found in block %ld. "
>+			               "Fsck?", p_s_bh->b_blocknr);
> 			pathrelse(p_s_search_path);
> 			return IO_ERROR;
> 		}
>@@ -1338,9 +1338,9 @@ void reiserfs_delete_solid_item(struct r
> 	while (1) {
> 		retval = search_item(th->t_super, &cpu_key, &path);
> 		if (retval == IO_ERROR) {
>-			reiserfs_warning(th->t_super, "vs-5350",
>-					 "i/o failure occurred trying "
>-					 "to delete %K", &cpu_key);
>+			reiserfs_error(th->t_super, "vs-5350",
>+			               "i/o failure occurred trying "
>+			               "to delete %K", &cpu_key);
> 			break;
> 		}
> 		if (retval != ITEM_FOUND) {
>@@ -1747,7 +1747,7 @@ static void truncate_directory(struct re
> {
> 	BUG_ON(!th->t_trans_id);
> 	if (inode->i_nlink)
>-		reiserfs_warning(inode->i_sb, "vs-5655", "link count != 0");
>+		reiserfs_error(inode->i_sb, "vs-5655", "link count != 0");
> 
> 	set_le_key_k_offset(KEY_FORMAT_3_5, INODE_PKEY(inode), DOT_OFFSET);
> 	set_le_key_k_type(KEY_FORMAT_3_5, INODE_PKEY(inode), TYPE_DIRENTRY);
>@@ -1800,16 +1800,16 @@ int reiserfs_do_truncate(struct reiserfs
> 	    search_for_position_by_key(p_s_inode->i_sb, &s_item_key,
> 				       &s_search_path);
> 	if (retval == IO_ERROR) {
>-		reiserfs_warning(p_s_inode->i_sb, "vs-5657",
>-				 "i/o failure occurred trying to truncate %K",
>-				 &s_item_key);
>+		reiserfs_error(p_s_inode->i_sb, "vs-5657",
>+		               "i/o failure occurred trying to truncate %K",
>+		               &s_item_key);
> 		err = -EIO;
> 		goto out;
> 	}
> 	if (retval == POSITION_FOUND || retval == FILE_NOT_FOUND) {
>-		reiserfs_warning(p_s_inode->i_sb, "PAP-5660",
>-				 "wrong result %d of search for %K", retval,
>-				 &s_item_key);
>+		reiserfs_error(p_s_inode->i_sb, "PAP-5660",
>+		               "wrong result %d of search for %K", retval,
>+		               &s_item_key);
> 
> 		err = -EIO;
> 		goto out;
>diff -ruNpX ../dontdiff linux-2.6.17-rc6-staging1/fs/reiserfs/super.c linux-2.6.17-rc6-staging2/fs/reiserfs/super.c
>--- linux-2.6.17-rc6-staging1/fs/reiserfs/super.c	2006-06-15 20:59:45.000000000 -0400
>+++ linux-2.6.17-rc6-staging2/fs/reiserfs/super.c	2006-06-15 20:59:46.000000000 -0400
>@@ -192,9 +192,8 @@ static int finish_unfinished(struct supe
> 	while (!retval) {
> 		retval = search_item(s, &max_cpu_key, &path);
> 		if (retval != ITEM_NOT_FOUND) {
>-			reiserfs_warning(s, "vs-2140",
>-			                 "search_by_key returned %d",
>-					 retval);
>+			reiserfs_error(s, "vs-2140",
>+			               "search_by_key returned %d", retval);
> 			break;
> 		}
> 
>@@ -364,9 +363,9 @@ void add_save_link(struct reiserfs_trans
> 	retval = search_item(inode->i_sb, &key, &path);
> 	if (retval != ITEM_NOT_FOUND) {
> 		if (retval != -ENOSPC)
>-			reiserfs_warning(inode->i_sb, "vs-2100",
>-					 "search_by_key (%K) returned %d", &key,
>-					 retval);
>+			reiserfs_error(inode->i_sb, "vs-2100",
>+			               "search_by_key (%K) returned %d", &key,
>+			               retval);
> 		pathrelse(&path);
> 		return;
> 	}
>@@ -379,8 +378,8 @@ void add_save_link(struct reiserfs_trans
> 	    reiserfs_insert_item(th, &path, &key, &ih, NULL, (char *)&link);
> 	if (retval) {
> 		if (retval != -ENOSPC)
>-			reiserfs_warning(inode->i_sb, "vs-2120",
>-			                 "insert_item returned %d", retval);
>+			reiserfs_error(inode->i_sb, "vs-2120",
>+			               "insert_item returned %d", retval);
> 	} else {
> 		if (truncate)
> 			REISERFS_I(inode)->i_flags |=
>diff -ruNpX ../dontdiff linux-2.6.17-rc6-staging1/fs/reiserfs/tail_conversion.c linux-2.6.17-rc6-staging2/fs/reiserfs/tail_conversion.c
>--- linux-2.6.17-rc6-staging1/fs/reiserfs/tail_conversion.c	2006-06-15 20:59:45.000000000 -0400
>+++ linux-2.6.17-rc6-staging2/fs/reiserfs/tail_conversion.c	2006-06-15 20:59:46.000000000 -0400
>@@ -49,9 +49,9 @@ int direct2indirect(struct reiserfs_tran
> 
> 	// FIXME: we could avoid this 
> 	if (search_for_position_by_key(sb, &end_key, path) == POSITION_FOUND) {
>-		reiserfs_warning(sb, "PAP-14030",
>-				 "pasted or inserted byte exists in "
>-				 "the tree %K. Use fsck to repair.", &end_key);
>+		reiserfs_error(sb, "PAP-14030",
>+		               "pasted or inserted byte exists in "
>+		               "the tree %K. Use fsck to repair.", &end_key);
> 		pathrelse(path);
> 		return -EIO;
> 	}
>diff -ruNpX ../dontdiff linux-2.6.17-rc6-staging1/fs/reiserfs/xattr.c linux-2.6.17-rc6-staging2/fs/reiserfs/xattr.c
>--- linux-2.6.17-rc6-staging1/fs/reiserfs/xattr.c	2006-06-15 20:59:45.000000000 -0400
>+++ linux-2.6.17-rc6-staging2/fs/reiserfs/xattr.c	2006-06-15 20:59:46.000000000 -0400
>@@ -322,8 +322,8 @@ static int __xattr_readdir(struct file *
> 		ih = de.de_ih;
> 
> 		if (!is_direntry_le_ih(ih)) {
>-			reiserfs_warning(inode->i_sb, "jdm-20000",
>-			                 "not direntry %h", ih);
>+			reiserfs_error(inode->i_sb, "jdm-20000",
>+			               "not direntry %h", ih);
> 			break;
> 		}
> 		copy_item_head(&tmp_ih, ih);
>@@ -723,15 +723,14 @@ __reiserfs_xattr_del(struct dentry *xadi
> 		goto out_file;
> 
> 	if (!is_reiserfs_priv_object(dentry->d_inode)) {
>-		reiserfs_warning(dir->i_sb, "jdm-20003",
>-		                 "OID %08x [%.*s/%.*s] doesn't have "
>-				 "priv flag set [parent is %sset].",
>-				 le32_to_cpu(INODE_PKEY(dentry->d_inode)->
>+		reiserfs_error(dir->i_sb, "jdm-20003",
>+		               "OID %08x [%.*s/%.*s] doesn't have "
>+		               "priv flag set [parent is %sset].",
>+		               le32_to_cpu(INODE_PKEY(dentry->d_inode)->
> 					     k_objectid), xadir->d_name.len,
>-				 xadir->d_name.name, namelen, name,
>-				 is_reiserfs_priv_object(xadir->
>-							 d_inode) ? "" :
>-				 "not ");
>+		               xadir->d_name.name, namelen, name,
>+		               is_reiserfs_priv_object(xadir-> d_inode) ? "" :
>+		               "not ");
> 		dput(dentry);
> 		return -EIO;
> 	}
>
>
>  
>

