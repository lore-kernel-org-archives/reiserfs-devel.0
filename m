From: Hans Reiser <reiser@namesys.com>
Subject: Re: Unaligned Accesses in reiserfsck
Date: Fri, 21 May 2004 19:41:19 -0700
Message-ID: <40AEBDCF.1010408@namesys.com>
References: <40AD57A5.8000705@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18803-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40AD57A5.8000705@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>, flx@thebsh.namesys.com, vitaly@thebsh.namesys.com

Thanks Jeff.

Hans

Jeff Mahoney wrote:

>
> Hey all -
>
> I caught a bug report that users were seeing unaligned accesses using
> reiserfsck on ia64. As expected, the cause of these was directly
> accessing the unformatted node block pointers. These were cleaned up in
> the kernel ages ago, so I took the time to fix reiserfsprogs as well.
>
> I also noticed a couple of places where CPU-ordered block numbers were
> being copied into disk-order buffers and fixed those when I saw them. I
> have not done an endian safeness audit on the reiserfsprogs code in
> quite some time.
>
> debugreiserfs/{un,}pack.c may also need a look.
>
> Attached is the patch.
>
> -Jeff
>
>------------------------------------------------------------------------
>
>diff -ruNp reiserfsprogs-3.6.17/debugreiserfs/debugreiserfs.c reiserfsprogs-3.6.17.fix/debugreiserfs/debugreiserfs.c
>--- reiserfsprogs-3.6.17/debugreiserfs/debugreiserfs.c	2004-03-22 10:18:57.000000000 -0500
>+++ reiserfsprogs-3.6.17.fix/debugreiserfs/debugreiserfs.c	2004-05-20 17:23:25.000000000 -0400
>@@ -4,6 +4,7 @@
>  */
> 
> #include "debugreiserfs.h"
>+#include <asm/unaligned.h>
> 
> reiserfs_filsys_t * fs;
> 
>@@ -108,7 +109,7 @@ static void print_disk_tree (reiserfs_fi
> 				__u32 unfm_ptr;
> 				
> 				for (j =  0; j < (int)I_UNFM_NUM (ih); j ++) {
>-					unfm_ptr = le32_to_cpu (ind_item [j]);
>+					unfm_ptr = get_block_num (ind_item, j);
> 					if (unfm_ptr) {
> 						g_stat_info.nr_unformatted += 1;
> 					}
>@@ -541,8 +542,8 @@ static void callback_badblock_print(reis
> 	tmp_ih = get_ih(badblock_path);
> 	ind_item = (__u32 *)get_item(badblock_path);
> 	
>-	for (i = 0; i < I_UNFM_NUM(tmp_ih); i++, ind_item++)
>-		fprintf (fd, "%u\n", le32_to_cpu (*ind_item));
>+	for (i = 0; i < I_UNFM_NUM(tmp_ih); i++)
>+		fprintf (fd, "%u\n", get_block_num (ind_item, i));
> 
> 	pathrelse (badblock_path);
> }
>diff -ruNp reiserfsprogs-3.6.17/fsck/check_tree.c reiserfsprogs-3.6.17.fix/fsck/check_tree.c
>--- reiserfsprogs-3.6.17/fsck/check_tree.c	2004-05-13 11:03:28.000000000 -0400
>+++ reiserfsprogs-3.6.17.fix/fsck/check_tree.c	2004-05-20 17:23:25.000000000 -0400
>@@ -4,6 +4,7 @@
>  */
> 
> #include "fsck.h"
>+#include <asm/unaligned.h>
> 
> #if 0
> struct check_relocated {
>@@ -394,11 +395,11 @@ static int bad_direct_item (reiserfs_fil
> 
> inline void handle_one_pointer (reiserfs_filsys_t * fs, 
> 				struct buffer_head * bh,
>-				__u32 * ptr) 
>+				__u32 * item, int offset)
> {
>     if (fsck_mode (fs) == FSCK_FIX_FIXABLE) {
> 	fsck_log (" - zeroed");
>-	*ptr = 0;
>+	put_block_num (item, offset, 0);
> 	mark_buffer_dirty (bh);
>     } else {
> 	one_more_corruption (fs, FIXABLE);
>@@ -423,7 +424,7 @@ static int bad_badblocks_item (reiserfs_
> 	    return 0;
>     
>     for (i = 0; i < I_UNFM_NUM (ih); i ++) {
>-	if (!le32_to_cpu (ind [i])) {
>+	if (!get_block_num (ind, i)) {
> /*	    fsck_log ("%s: block %lu: badblocks item (%H) has zero pointer.",
> 		      __FUNCTION__, bh->b_blocknr, ih);
> 	    
>@@ -437,14 +438,14 @@ static int bad_badblocks_item (reiserfs_
> 	}
> 
> 	/* check list of badblocks pointers */
>-	if (le32_to_cpu (ind [i]) >= get_sb_block_count (fs->fs_ondisk_sb)) {
>+	if (get_block_num (ind, i) >= get_sb_block_count (fs->fs_ondisk_sb)) {
> 	    fsck_log ("%s: badblock pointer (block %lu) points out of disk spase (%lu)",
>-			__FUNCTION__, bh->b_blocknr, le32_to_cpu (ind [i]));
>-	    handle_one_pointer (fs, bh, &ind[i]);
>+			__FUNCTION__, bh->b_blocknr, get_block_num (ind, i));
>+	    handle_one_pointer (fs, bh, ind, i);
> 	    fsck_log ("\n");
> 	}
> 
>-	if (did_we_meet_it (le32_to_cpu (ind [i]))) {
>+	if (did_we_meet_it (get_block_num (ind, i))) {
> 	    /* it can be
> 	       1. not_data_block
> 	       		delete pointer
>@@ -452,23 +453,23 @@ static int bad_badblocks_item (reiserfs_
> 	          advice to run fix-fixable if there is no fatal errors
> 	          with list of badblocks, say that it could fix it. */
> 	
>-	    if (not_data_block (fs, le32_to_cpu (ind [i]))) {
>+	    if (not_data_block (fs, get_block_num (ind, i))) {
> 		fsck_log ("%s: badblock pointer (block %lu) points on fs metadata (%lu)",
>-			  __FUNCTION__, bh->b_blocknr, le32_to_cpu (ind [i]));
>-		handle_one_pointer (fs, bh, &ind[i]);
>+			  __FUNCTION__, bh->b_blocknr, get_block_num (ind, i));
>+		handle_one_pointer (fs, bh, ind, i);
> 		fsck_log ("\n");
> 	    } else {
> 		one_more_corruption(fs, FIXABLE);
> 	        fsck_log ("%s: badblock pointer (block %lu) points to a block (%lu) "
> 			  "which is in the tree already. Use badblock option (-B) to"
> 			  " fix the problem\n", __FUNCTION__, bh->b_blocknr, 
>-			  le32_to_cpu(ind[i]));
>+			  get_block_num (ind, i));
> 	    }
> 
> 	    continue;
> 	}
> 	
>-	we_met_it(le32_to_cpu(ind[i]));
>+	we_met_it(get_block_num(ind, i));
>     }
> 
>     return 0;
>@@ -490,33 +491,31 @@ static int bad_indirect_item (reiserfs_f
>     }
> 
>     for (i = 0; i < I_UNFM_NUM (ih); i ++) {
>-//	__u32 unfm_ptr;
> 
> 	fsck_check_stat (fs)->unfm_pointers ++;
>-//	unfm_ptr = le32_to_cpu (ind [i]);
>-	if (!le32_to_cpu (ind [i])) {
>+	if (!get_block_num (ind, i)) {
> 	    fsck_check_stat (fs)->zero_unfm_pointers ++;
> 	    continue;
> 	}
> 
> 	/* check unformatted node pointer and mark it used in the
>            control bitmap */
>-	if (bad_block_number (fs, le32_to_cpu (ind [i]))) {
>+	if (bad_block_number (fs, get_block_num (ind, i))) {
> 	    fsck_log ("%s: block %lu: The item %k has the bad pointer (%d) to "
> 		      "the block (%lu)", __FUNCTION__, bh->b_blocknr, 
>-		      &ih->ih_key, i, le32_to_cpu (ind [i]));
>+		      &ih->ih_key, i, get_block_num (ind, i));
> 	    
>-	    handle_one_pointer (fs, bh, &ind[i]);
>+	    handle_one_pointer (fs, bh, ind, i);
> 	    fsck_log ("\n");
> 	    continue;
> 	}
> 
>-        if (got_already (fs, le32_to_cpu (ind [i]))) {
>+        if (got_already (fs, get_block_num (ind, i))) {
> 	    fsck_log ("%s: block %lu: The item (%H) has the bad pointer (%d) "
> 		      "to the block (%lu), which is in tree already", 
>-		      __FUNCTION__, bh->b_blocknr, ih, i, le32_to_cpu(ind[i]));
>+		      __FUNCTION__, bh->b_blocknr, ih, i, get_block_num (ind, i));
> 	    
>-	    handle_one_pointer (fs, bh, &ind [i]);
>+	    handle_one_pointer (fs, bh, ind, i);
> 	    fsck_log ("\n");
>             continue;
> 	}
>diff -ruNp reiserfsprogs-3.6.17/fsck/pass0.c reiserfsprogs-3.6.17.fix/fsck/pass0.c
>--- reiserfsprogs-3.6.17/fsck/pass0.c	2004-04-19 15:57:16.000000000 -0400
>+++ reiserfsprogs-3.6.17.fix/fsck/pass0.c	2004-05-20 20:15:19.000000000 -0400
>@@ -4,6 +4,7 @@
>  */
> 
> #include "fsck.h"
>+#include <asm/unaligned.h>
> 
> 
> 
>@@ -1288,7 +1289,7 @@ static void pass0_correct_leaf (reiserfs
> */
> 	ind_item = (__u32 *)B_I_PITEM (bh, ih);
> 	for (j = 0; j < (int)I_UNFM_NUM (ih); j ++) {
>-	    unfm_ptr = le32_to_cpu (ind_item [j]);
>+	    unfm_ptr = get_block_num (ind_item, j);
> 	    if (!unfm_ptr)
> 		continue;
> #if 0
>@@ -1439,10 +1440,10 @@ static int is_bad_indirect (struct item_
>     for (i = 0; i < I_UNFM_NUM (ih); i ++) {
> 	__u32 * ind = (__u32 *)item;
> 
>-	if (le32_to_cpu (ind[i]) >= blocks) {
>+	if (get_block_num (ind, i) >= blocks) {
> 	    bad ++;
> 	    fsck_log ("is_bad_indirect: %d-th pointer of item %H looks bad (%lu)\n",
>-		      i, ih, le32_to_cpu (ind [i]));
>+		      i, ih, get_block_num (ind, i));
> 	    continue;
> 	}
>     }
>diff -ruNp reiserfsprogs-3.6.17/fsck/pass1.c reiserfsprogs-3.6.17.fix/fsck/pass1.c
>--- reiserfsprogs-3.6.17/fsck/pass1.c	2004-02-17 07:20:40.000000000 -0500
>+++ reiserfsprogs-3.6.17.fix/fsck/pass1.c	2004-05-20 17:23:39.000000000 -0400
>@@ -4,6 +4,7 @@
>  */
> 
> #include "fsck.h"
>+#include <asm/unaligned.h>
> 
> reiserfs_bitmap_t * bad_unfm_in_tree_once_bitmap;
> 
>@@ -105,7 +106,7 @@ static void indirect_in_tree (struct buf
>     unp = (__u32 *)B_I_PITEM (bh, ih);
>     
>     for (i = 0; i < I_UNFM_NUM (ih); i ++) {
>-	unfm_ptr = le32_to_cpu (unp[i]);
>+	unfm_ptr = get_block_num (unp, i);
> 	if (unfm_ptr == 0)
> 	    continue;
> 	if ((ret = still_bad_unfm_ptr_1 (unfm_ptr)))
>@@ -394,8 +395,8 @@ static void pass1_correct_leaf (reiserfs
> 	/* correct indirect items */
> 	ind_item = (__u32 *)B_I_PITEM (bh, ih);
> 
>-	for (j = 0; j < I_UNFM_NUM (ih); j ++, ind_item ++) {
>-	    unfm_ptr = le32_to_cpu (*ind_item);
>+	for (j = 0; j < I_UNFM_NUM (ih); j ++) {
>+	    unfm_ptr = get_block_num (ind_item, j);
> 
> 	    if (!unfm_ptr)
> 		continue;
>@@ -409,7 +410,7 @@ static void pass1_correct_leaf (reiserfs
> 	    /* 1. zero slots pointing to a leaf */
> 	    if (is_used_leaf (unfm_ptr)) {
> 		dirty ++;
>-		*ind_item = 0;
>+		put_block_num (ind_item, j, 0);
> 		pass_1_stat (fs)->pointed_leaves ++;
> 		continue;
> 	    }
>@@ -424,7 +425,7 @@ static void pass1_correct_leaf (reiserfs
> 		else {
> 		    /* Yes, we have seen this pointer already, zero other pointers to it. */
> 		    dirty ++;
>-		    *ind_item = 0;
>+		    put_block_num (ind_item, j, 0);
> 		    pass_1_stat (fs)->non_unique_pointers ++;
> 		    continue;
> 		}
>diff -ruNp reiserfsprogs-3.6.17/fsck/semantic_rebuild.c reiserfsprogs-3.6.17.fix/fsck/semantic_rebuild.c
>--- reiserfsprogs-3.6.17/fsck/semantic_rebuild.c	2004-02-17 06:35:12.000000000 -0500
>+++ reiserfsprogs-3.6.17.fix/fsck/semantic_rebuild.c	2004-05-20 19:56:42.000000000 -0400
>@@ -174,7 +174,7 @@ int wrong_st_blocks (struct key * key, _
>     if (S_ISREG (mode) || S_ISLNK (mode) || S_ISDIR (mode)) {
> 	if (*blocks != sd_blocks) {
> 	    fsck_log ("vpf-10680: The %s %K has the wrong block count in the StatData "
>-		"(%u)%s(%u)\n", S_ISDIR (mode) ? "directory" : "file",  key, sd_blocks, 
>+		"(%u)%s(%u)\n", S_ISDIR (mode) ? "directory" : S_ISREG (mode) ? "file" : "link",  key, sd_blocks, 
> 		fsck_mode(fs) == FSCK_CHECK ? ", should be " : " - corrected to ", *blocks);
> 	    ret = 1;
> 	}
>diff -ruNp reiserfsprogs-3.6.17/fsck/ufile.c reiserfsprogs-3.6.17.fix/fsck/ufile.c
>--- reiserfsprogs-3.6.17/fsck/ufile.c	2004-05-13 10:51:49.000000000 -0400
>+++ reiserfsprogs-3.6.17.fix/fsck/ufile.c	2004-05-20 17:23:25.000000000 -0400
>@@ -4,6 +4,7 @@
>  */
> 
> #include "fsck.h"
>+#include <asm/unaligned.h>
> 
> static int do_items_have_the_same_type (struct item_head * ih, struct key * key)
> {
>@@ -54,7 +55,7 @@ static unsigned long indirect_to_direct 
> 
>     // we do not know what length this item should be
>     indirect = get_item (path);
>-    unfm_ptr = le32_to_cpu (indirect [I_UNFM_NUM (ih) - 1]);
>+    unfm_ptr = get_block_num (indirect, I_UNFM_NUM (ih) - 1);
>     if (unfm_ptr && (unfm_bh = bread (bh->b_dev, unfm_ptr, bh->b_size))) {
>         /* we can read the block */
> 	buf = unfm_bh->b_data;
>@@ -569,10 +570,10 @@ static int create_first_item_of_file (st
> 
> 	    if (!was_in_tree) {
> 		for (i = 0; i < I_UNFM_NUM (ih); i++) {
>-		    if (still_bad_unfm_ptr_2 (le32_to_cpu (ni[i])))
>+		    if (still_bad_unfm_ptr_2 (get_block_num (ni, i)))
> 			reiserfs_panic ("create_first_item_of_file: The file %K has a pointer to the bad block (%u)", 
> 			    &ih->ih_key, le32_to_cpu (unfm_ptr));
>-		    mark_block_used (le32_to_cpu (ni[i]), 0);
>+		    mark_block_used (get_block_num (ni, i), 0);
> 		}
> 	    }
> 
>@@ -611,7 +612,7 @@ static unsigned long block_to_start (str
>     return bh->b_blocknr;
> 
>   ih --;
>-  return (B_I_POS_UNFM_POINTER (bh, ih, I_UNFM_NUM (ih) - 1)) ?: bh->b_blocknr;
>+  return (get_block_num ((__u32 *)B_I_PITEM(bh, ih), I_UNFM_NUM (ih) - 1)) ?: bh->b_blocknr;
> }
> 
> 
>@@ -637,7 +638,7 @@ static void direct2indirect2 (unsigned l
> 	    die ("direct2indirect: can not find first part of tail");
>     }
> 
>-    unbh = reiserfsck_get_new_buffer (le32_to_cpu (unfm) ? le32_to_cpu (unfm) : block_to_start (path));
>+    unbh = reiserfsck_get_new_buffer (unfm ? unfm : block_to_start (path));
>     memset (unbh->b_data, 0, unbh->b_size);
> 
>     /* delete parts of tail coping their contents to new buffer */
>@@ -717,7 +718,7 @@ static int append_to_unformatted_node (s
>     int zero_number;
>     
>     bh = PATH_PLAST_BUFFER (path);
>-    unfm_ptr = le32_to_cpu (B_I_POS_UNFM_POINTER (bh, ih, I_UNFM_NUM (ih) - 1));
>+    unfm_ptr = get_block_num ((__u32 *)B_I_PITEM(bh, ih), I_UNFM_NUM (ih) - 1);
> 
>     /* append to free space of the last unformatted node of indirect item ih */
>     free_space = get_offset (&ih->ih_key) + fs->fs_blocksize * I_UNFM_NUM (ih) - get_offset (&comingih->ih_key);
>@@ -749,7 +750,7 @@ static int append_to_unformatted_node (s
> 	/*if (unfm_ptr == 0 || unfm_ptr >= SB_BLOCK_COUNT (fs)) {*/
> 	unbh = reiserfsck_get_new_buffer (bh->b_blocknr);
> 	memset (unbh->b_data, 0, unbh->b_size);
>-	B_I_POS_UNFM_POINTER (bh, ih, I_UNFM_NUM (ih) - 1) = unbh->b_blocknr;
>+	put_block_num ((__u32 *)B_I_PITEM(bh, ih), I_UNFM_NUM (ih) - 1, unbh->b_blocknr);
> 	/*mark_block_unformatted (unbh->b_blocknr);*/
> 	mark_buffer_dirty (bh);
>     }
>@@ -802,7 +803,7 @@ int reiserfsck_append_file (struct item_
> 	mark_buffer_uptodate (unbh, 1);
> 
> 	ni = getmem (UNFM_P_SIZE);
>-	*ni = cpu_to_le32 (unbh->b_blocknr);
>+	put_block_num (ni, 0, unbh->b_blocknr);
> 	count = 1;
> 	
> 	brelse (unbh);
>@@ -823,9 +824,9 @@ int reiserfsck_append_file (struct item_
> 	
> 	if (!was_in_tree) {
> 	    for (i = 0; i < count; i++ ) {
>-		if (still_bad_unfm_ptr_2 (le32_to_cpu (ni[i])))
>-		    die ("reiserfsck_append_file: Trying to insert a pointer to illegal block (%u)", le32_to_cpu (ni[i]));
>-		mark_block_used (le32_to_cpu (ni[i]), 0);
>+		if (still_bad_unfm_ptr_2 (get_block_num (ni, i)))
>+		    die ("reiserfsck_append_file: Trying to insert a pointer to illegal block (%u)", get_block_num (ni, i));
>+		mark_block_used (get_block_num (ni, i), 0);
> 	    }
> 	}
> 
>@@ -894,7 +895,7 @@ static int overwrite_by_direct_item (str
>     bh = PATH_PLAST_BUFFER (path);
>     ih = PATH_PITEM_HEAD (path);
> 
>-    unfm_ptr = le32_to_cpu (B_I_POS_UNFM_POINTER (bh, ih, path->pos_in_item));
>+    unfm_ptr = get_block_num ((__u32 *)B_I_PITEM(bh, ih), path->pos_in_item);
>     unbh = 0;
> 
>     if (unfm_ptr != 0 && unfm_ptr < get_sb_block_count (fs->fs_ondisk_sb)) {
>@@ -910,7 +911,7 @@ static int overwrite_by_direct_item (str
>     if (unfm_ptr == 0 || unfm_ptr >= get_sb_block_count (fs->fs_ondisk_sb)) {
> 	if ((unbh = reiserfsck_get_new_buffer (bh->b_blocknr)) != NULL) {
> 	    memset (unbh->b_data, 0, unbh->b_size);
>-	    B_I_POS_UNFM_POINTER (bh, ih, path->pos_in_item) = cpu_to_le32 (unbh->b_blocknr);
>+	    put_block_num ((__u32 *)B_I_PITEM(bh, ih), path->pos_in_item,  unbh->b_blocknr);
> 	    mark_buffer_dirty (bh);
> 	} else {
> 	    die ("overwrite_by_direct_item: Could not allocate a new block for new data");
>@@ -1017,11 +1018,11 @@ static int overwrite_by_indirect_item (s
>     }
>   
>     for (i = 0; i < to_copy; i ++) {
>-	if (coming_item[i] != 0 && item_in_tree[i] == 0) {
>+	if (get_block_num (coming_item, i) != 0 && get_block_num (item_in_tree, i) == 0) {
> 	    /* overwrite holes only by correct a pointer in the coming item
>                which must be correct */
>-	    item_in_tree[i] = coming_item[i];
>-	    mark_block_used (le32_to_cpu (coming_item[i]), 0);
>+	    put_block_num (item_in_tree, i, get_block_num (coming_item, i));
>+	    mark_block_used (get_block_num (coming_item, i), 0);
> 	    dirty ++;
> 	}
>     }
>@@ -1051,7 +1052,7 @@ static int reiserfsck_overwrite_file (st
> 		reiserfs_panic ("reiserfsck_overwrite_file: The second part of the tail %k can not"
> 		    " be overwritten by indirect item %k", &ih->ih_key, &comingih->ih_key);
> 	    /* use pointer from coming indirect item */
>-	    unfm_ptr = le32_to_cpu (*(__u32 *)(item + *pos_in_coming_item * UNFM_P_SIZE));
>+	    unfm_ptr = get_block_num ((__u32 *)item, *pos_in_coming_item);
> 	    if (!was_in_tree) {
> 		if (still_bad_unfm_ptr_2 (unfm_ptr))
> 		    die ("reiserfsck_overwrite_file: The pointer to the unformatted block (%u)"
>diff -ruNp reiserfsprogs-3.6.17/fsck/ustree.c reiserfsprogs-3.6.17.fix/fsck/ustree.c
>--- reiserfsprogs-3.6.17/fsck/ustree.c	2004-02-17 06:35:12.000000000 -0500
>+++ reiserfsprogs-3.6.17.fix/fsck/ustree.c	2004-05-20 17:23:25.000000000 -0400
>@@ -4,6 +4,7 @@
>  */
> 
> #include "fsck.h"
>+#include <asm/unaligned.h>
> 
> 
> /* key1 and key2 are pointer to deh_offset of the struct reiserfs_de_head */
>@@ -54,19 +55,21 @@ static void free_unformatted_nodes (stru
>     __u32 * punfm = (__u32 *)B_I_PITEM (bh, ih);
>     unsigned int i;
> 
>-    for (i = 0; i < I_UNFM_NUM (ih); i ++, punfm ++)
>-	if (*punfm != 0) {
>+    for (i = 0; i < I_UNFM_NUM (ih); i ++) {
>+        __u32 unfm = get_block_num (punfm, i);
>+	if (unfm != 0) {
> 	    struct buffer_head * to_be_forgotten;
> 
>-	    to_be_forgotten = find_buffer (fs->fs_dev, le32_to_cpu (*punfm), fs->fs_blocksize);
>+	    to_be_forgotten = find_buffer (fs->fs_dev, unfm, fs->fs_blocksize);
> 	    if (to_be_forgotten) {
> 		//atomic_inc(&to_be_forgotten->b_count);
> 		to_be_forgotten->b_count ++;
> 		bforget (to_be_forgotten);
> 	    }
> 
>-	    reiserfs_free_block (fs, le32_to_cpu (*punfm));
>+	    reiserfs_free_block (fs, unfm);
> 	}
>+    }
> }
> 
> void reiserfsck_delete_item (struct path * path, int temporary)
>@@ -95,17 +98,18 @@ void reiserfsck_cut_from_item (struct pa
> 	die ("reiserfsck_cut_from_item: cut size == %d", cut_size);
> 
>     if (is_indirect_ih (ih = PATH_PITEM_HEAD (path))) {
>-	__u32 unfm_ptr = B_I_POS_UNFM_POINTER (PATH_PLAST_BUFFER (path), ih, I_UNFM_NUM (ih) - 1);
>+	struct buffer_head *bh = PATH_PLAST_BUFFER (path);
>+	__u32 unfm_ptr = get_block_num ((__u32 *)B_I_PITEM(bh, ih), I_UNFM_NUM (ih) - 1);
> 	if (unfm_ptr != 0) {
> 	    struct buffer_head * to_be_forgotten;
> 
>-	    to_be_forgotten = find_buffer (fs->fs_dev, le32_to_cpu (unfm_ptr), fs->fs_blocksize);
>+	    to_be_forgotten = find_buffer (fs->fs_dev, unfm_ptr, fs->fs_blocksize);
> 	    if (to_be_forgotten) {
> 		//atomic_inc(&to_be_forgotten->b_count);
> 		to_be_forgotten->b_count ++;
> 		bforget (to_be_forgotten);
> 	    }
>-	    reiserfs_free_block (fs, le32_to_cpu (unfm_ptr));
>+	    reiserfs_free_block (fs, unfm_ptr);
> 	}
>     }
> 
>diff -ruNp reiserfsprogs-3.6.17/include/reiserfs_fs.h reiserfsprogs-3.6.17.fix/include/reiserfs_fs.h
>--- reiserfsprogs-3.6.17/include/reiserfs_fs.h	2004-03-03 16:40:01.000000000 -0500
>+++ reiserfsprogs-3.6.17.fix/include/reiserfs_fs.h	2004-05-20 17:23:25.000000000 -0400
>@@ -1423,6 +1423,16 @@ struct buffer_info {
>                   ( get_offset(&(p_s_ih)->ih_key) <= (n_offset) && \
>                     get_offset(&(p_s_ih)->ih_key) + get_bytes_number(p_s_ih,n_blocksize) > (n_offset) )
> 
>+/* these operate on indirect items, where you've got an array of ints
>+** at a possibly unaligned location.  These are a noop on ia32
>+**
>+** p is the array of __u32, i is the index into the array, v is the value
>+** to store there.
>+*/
>+#define get_block_num(p, i) le32_to_cpu(get_unaligned((p) + (i)))
>+#define put_block_num(p, i, v) put_unaligned(cpu_to_le32(v), (p) + (i))
>+
>+
> /* get the item header */ 
> #define B_N_PITEM_HEAD(bh,item_num) ( (struct item_head * )((bh)->b_data + BLKH_SIZE) + (item_num) )
> 
>@@ -1449,13 +1459,6 @@ struct buffer_info {
> #define MAX_DIRECT_ITEM_LEN(size) ((size) - BLKH_SIZE - 2*IH_SIZE - SD_SIZE - UNFM_P_SIZE)
> #define MAX_INDIRECT_ITEM_LEN(size) MAX_ITEM_LEN(size)
> 
>-/* indirect items consist of entries which contain blocknrs, pos
>-   indicates which entry, and B_I_POS_UNFM_POINTER resolves to the
>-   blocknr contained by the entry pos points to */
>-#define B_I_POS_UNFM_POINTER(bh,ih,pos) (*(((__u32 *)B_I_PITEM(bh,ih)) + (pos)))
>-
>-
>-
> /***************************************************************************/
> /*                    FUNCTION DECLARATIONS                                */
> /***************************************************************************/
>diff -ruNp reiserfsprogs-3.6.17/reiserfscore/node_formats.c reiserfsprogs-3.6.17.fix/reiserfscore/node_formats.c
>--- reiserfsprogs-3.6.17/reiserfscore/node_formats.c	2004-02-17 06:35:12.000000000 -0500
>+++ reiserfsprogs-3.6.17.fix/reiserfscore/node_formats.c	2004-05-20 17:23:25.000000000 -0400
>@@ -4,6 +4,7 @@
>  */
> 
> #include "includes.h"
>+#include <asm/unaligned.h>
> 
> int leaf_count_ih(char * buf, int blocksize) {
>     struct item_head * ih;
>@@ -202,9 +203,10 @@ int is_tree_node (struct buffer_head * b
> 
> static int is_desc_block (char * buf, unsigned long buf_size)
> {
>+    struct reiserfs_journal_desc *desc = (struct reiserfs_journal_desc *)buf;
>     if (!memcmp(buf + buf_size - 12, JOURNAL_DESC_MAGIC, 8) &&
> 	//get_jdesc_len (desc) > 0)
>-	le32_to_cpu(*((__u32*)(buf + 4))) > 0)
>+	le32_to_cpu (desc->j2_len) > 0)
> 	return 1;
>     return 0;
> }
>@@ -495,7 +497,7 @@ static int is_bad_indirect (reiserfs_fil
>     for (i = 0; i < I_UNFM_NUM (ih); i ++) {
> 	if (!ind [i])
> 	    continue;
>-	if (check_unfm_func && check_unfm_func (fs, le32_to_cpu(ind [i])))
>+	if (check_unfm_func && check_unfm_func (fs, get_block_num (ind, i)))
> 	    return 1;
>     }
> 
>diff -ruNp reiserfsprogs-3.6.17/reiserfscore/reiserfslib.c reiserfsprogs-3.6.17.fix/reiserfscore/reiserfslib.c
>--- reiserfsprogs-3.6.17/reiserfscore/reiserfslib.c	2004-02-17 07:20:40.000000000 -0500
>+++ reiserfsprogs-3.6.17.fix/reiserfscore/reiserfslib.c	2004-05-20 17:23:25.000000000 -0400
>@@ -7,6 +7,7 @@
> 
> #include "includes.h"
> #include <linux/kdev_t.h>
>+#include <asm/unaligned.h>
> 
> struct key root_dir_key = {0, 0, {{0, 0},}};
> struct key parent_root_dir_key = {0, 0, {{0, 0},}};
>@@ -1353,9 +1354,9 @@ void mark_badblock(reiserfs_filsys_t *fs
> 	tmp_ih = get_ih(badblock_path);
> 	ind_item = (__u32 *)get_item(badblock_path);
> 
>-	for (i = 0; i < I_UNFM_NUM(tmp_ih); i++, ind_item++) {
>+	for (i = 0; i < I_UNFM_NUM(tmp_ih); i++) {
> 		reiserfs_bitmap_set_bit(fs->fs_badblocks_bm, 
>-					le32_to_cpu(*ind_item));
>+					get_block_num(ind_item, i));
> 	}
> 	
> 	pathrelse (badblock_path);
>diff -ruNp reiserfsprogs-3.6.17/resize_reiserfs/do_shrink.c reiserfsprogs-3.6.17.fix/resize_reiserfs/do_shrink.c
>--- reiserfsprogs-3.6.17/resize_reiserfs/do_shrink.c	2004-02-17 06:35:12.000000000 -0500
>+++ reiserfsprogs-3.6.17.fix/resize_reiserfs/do_shrink.c	2004-05-20 17:23:25.000000000 -0400
>@@ -5,6 +5,7 @@
> 
> #include "resize.h"
> #include <time.h>
>+#include <asm/unaligned.h>
> 
> static unsigned long int_node_cnt   = 0, int_moved_cnt   = 0;
> static unsigned long leaf_node_cnt  = 0, leaf_moved_cnt  = 0;
>@@ -124,11 +125,11 @@ static unsigned long move_formatted_bloc
> 				for (j = 0; j < I_UNFM_NUM(ih); j++) {
> 					unsigned long  unfm_block;
> 
>-					if (indirect [j] == 0) /* hole */
>+					if (get_block_num (indirect, j) == 0) /* hole */
> 						continue;
>-					unfm_block = move_unformatted_block(fs, le32_to_cpu (indirect [j]), bnd, h + 1);
>+					unfm_block = move_unformatted_block(fs, get_block_num (indirect, j), bnd, h + 1);
> 					if (unfm_block) {
>-						indirect [j] = cpu_to_le32 (unfm_block);
>+						put_block_num (indirect, j, unfm_block);
> 						mark_buffer_dirty(bh);
> 					}
> 				}
>diff -ruNp reiserfsprogs-3.6.17/tune/tune.c reiserfsprogs-3.6.17.fix/tune/tune.c
>--- reiserfsprogs-3.6.17/tune/tune.c	2004-02-17 07:20:40.000000000 -0500
>+++ reiserfsprogs-3.6.17.fix/tune/tune.c	2004-05-20 17:23:25.000000000 -0400
>@@ -6,6 +6,7 @@
> #define _GNU_SOURCE
> 
> #include "tune.h"
>+#include <asm/unaligned.h>
> 
> #include <getopt.h>
> #include <stdarg.h>
>@@ -229,15 +230,15 @@ static void callback_new_badblocks(reise
> 	tmp_ih = get_ih(badblock_path);
> 	ind_item = (__u32 *)get_item(badblock_path);
> 
>-	for (i = 0; i < I_UNFM_NUM(tmp_ih); i++, ind_item++) {
>+	for (i = 0; i < I_UNFM_NUM(tmp_ih); i++) {
> 		if (reiserfs_bitmap_test_bit(fs->fs_badblocks_bm, 
>-					     le32_to_cpu(*ind_item)))
>+					     get_block_num (ind_item, i)))
> 		{
> 			message("Block %u is marked as bad already.", 
>-				le32_to_cpu(*ind_item));
>+				get_block_num (ind_item, i));
> 			
> 			reiserfs_bitmap_clear_bit(fs->fs_badblocks_bm, 
>-						  le32_to_cpu(*ind_item));
>+						  get_block_num (ind_item, i));
> 		}
> 	}
> 	
>@@ -254,9 +255,9 @@ static void callback_clear_badblocks(rei
> 	tmp_ih = get_ih(badblock_path);
> 	ind_item = (__u32 *)get_item(badblock_path);
> 
>-	for (i = 0; i < I_UNFM_NUM(tmp_ih); i++, ind_item++) {
>+	for (i = 0; i < I_UNFM_NUM(tmp_ih); i++) {
> 		reiserfs_bitmap_clear_bit(fs->fs_bitmap2, 
>-					  le32_to_cpu(*ind_item));
>+					  get_block_num(ind_item, i));
> 	}
> 	
> 	pathrelse (badblock_path);
>  
>


-- 
Hans


