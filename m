From: Chris Mason <mason@suse.com>
Subject: [PATCH] corruption bugs in 2.6 v3
Date: Wed, 03 Mar 2004 15:34:41 -0500
Message-ID: <1078346080.3933.160.camel@watt.suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-3SwTUDfc2THThX/sjMAC"
Return-path: <reiserfs-list-return-17051-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com, green@linuxhacker.ru

--=-3SwTUDfc2THThX/sjMAC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello everyone,

These two patches fix corruption problems I've been hitting on 2.6. 
Both bugs are present in the vanilla and suse kernels.

reiserfs-search-restart:
This was originally from vs@namesys.com, I recently made a small
addition to make sure the expected height was checked after reading in
blocks in search_by_key (this depends on reiserfs-lock-lat from my data
logging directory).

reiserfs-write-sched-bug:
Fixes two schedule related bugs during reiserfs_file_write.  One place
in the code assumes that after a schedule, path.pos_in_item will still
be valid even if the item has moved.  Since items can split during a
schedule this is incorrect.

The second bug took a little longer to figure out,
reiserfs_prepare_file_region_for_write needs to make sure a stale item
pointer isn't used if search_for_position_by_key doesn't return
POSITION_FOUND.

The most common symptoms of the two bugs is attempts to read beyond the
end of the device, file data corruption and errors like this:

is_tree_node: node level X does not match to the expected one Y

Where X and Y are both valid tree heights (between 1 and 5) and usually
one away from each other.

These reproduced reliably for me by running dbench 20 in a loop for
about 20 minutes on an amd64 box.

Hans, I'd like to submit these along with the other fixes I ported from
2.4 and sent to reiserfs-dev.  Any objections?

-chris


--=-3SwTUDfc2THThX/sjMAC
Content-Disposition: attachment; filename=reiserfs-search-restart
Content-Type: text/plain; name=reiserfs-search-restart; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

fix a bug in reiserfs search_by_key call, where it might not properly detect
a change in tree height during a schedule.  Originally from vs@namesys.com

Index: linux.t/fs/reiserfs/stree.c
===================================================================
--- linux.t.orig/fs/reiserfs/stree.c	2004-03-03 14:11:40.984705584 -0500
+++ linux.t/fs/reiserfs/stree.c	2004-03-03 14:12:59.466460675 -0500
@@ -678,7 +678,7 @@
        current node, and calculate the next current node(next path element)
        for the next iteration of this loop.. */
     n_block_number = SB_ROOT_BLOCK (p_s_sb);
-    expected_level = SB_TREE_HEIGHT (p_s_sb);
+    expected_level = -1;
     while ( 1 ) {
 
 #ifdef CONFIG_REISERFS_CHECK
@@ -692,7 +692,6 @@
 	/* prep path to have another element added to it. */
 	p_s_last_element = PATH_OFFSET_PELEMENT(p_s_search_path, ++p_s_search_path->path_length);
 	fs_gen = get_generation (p_s_sb);
-	expected_level --;
 
 #ifdef SEARCH_BY_KEY_READA
 	/* schedule read of right neighbor */
@@ -707,21 +706,26 @@
 	    pathrelse(p_s_search_path);
 	    return IO_ERROR;
 	}
+	if (expected_level == -1)
+		expected_level = SB_TREE_HEIGHT (p_s_sb);
+	expected_level --;
 
 	/* It is possible that schedule occurred. We must check whether the key
 	   to search is still in the tree rooted from the current buffer. If
 	   not then repeat search from the root. */
 	if ( fs_changed (fs_gen, p_s_sb) && 
-	     (!B_IS_IN_TREE (p_s_bh) || !key_in_buffer(p_s_search_path, p_s_key, p_s_sb)) ) {
+	    (!B_IS_IN_TREE (p_s_bh) || 
+	     B_LEVEL(p_s_bh) != expected_level || 
+	     !key_in_buffer(p_s_search_path, p_s_key, p_s_sb))) {
 	    PROC_INFO_INC( p_s_sb, search_by_key_fs_changed );
- 	    PROC_INFO_INC( p_s_sb, search_by_key_restarted );
+	    PROC_INFO_INC( p_s_sb, search_by_key_restarted );
 	    PROC_INFO_INC( p_s_sb, sbk_restarted[ expected_level - 1 ] );
 	    decrement_counters_in_path(p_s_search_path);
 	    
 	    /* Get the root block number so that we can repeat the search
-               starting from the root. */
+	       starting from the root. */
 	    n_block_number = SB_ROOT_BLOCK (p_s_sb);
-	    expected_level = SB_TREE_HEIGHT (p_s_sb);
+	    expected_level = -1;
 	    right_neighbor_of_leaf_node = 0;
 	    
 	    /* repeat search from the root */

--=-3SwTUDfc2THThX/sjMAC
Content-Disposition: attachment; filename=reiserfs-write-sched-bug
Content-Type: text/x-patch; name=reiserfs-write-sched-bug; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Index: linux.t/fs/reiserfs/file.c
===================================================================
--- linux.t.orig/fs/reiserfs/file.c	2004-03-03 14:16:44.762750907 -0500
+++ linux.t/fs/reiserfs/file.c	2004-03-03 14:16:57.361012562 -0500
@@ -365,7 +365,7 @@
     // it means there are no existing in-tree representation for file area
     // we are going to overwrite, so there is nothing to scan through for holes.
     for ( curr_block = 0, itempos = path.pos_in_item ; curr_block < blocks_to_allocate && res == POSITION_FOUND ; ) {
-
+retry:
 	if ( itempos >= ih_item_len(ih)/UNFM_P_SIZE ) {
 	    /* We run out of data in this indirect item, let's look for another
 	       one. */
@@ -422,8 +422,8 @@
 		    bh=get_last_bh(&path);
 		    ih=get_ih(&path);
 		    item = get_item(&path);
-		    // Itempos is still the same
-		    continue;
+		    itempos = path.pos_in_item;
+		    goto retry;
 		}
 		modifying_this_item = 1;
 	    }
@@ -856,8 +856,12 @@
 			/* Try to find next item */
 			res = search_for_position_by_key(inode->i_sb, &key, &path);
 			/* Abort if no more items */
-			if ( res != POSITION_FOUND )
+			if ( res != POSITION_FOUND ) {
+			    /* make sure later loops don't use this item */
+			    itembuf = NULL;
+			    item = NULL;
 			    break;
+			}
 
 			/* Update information about current indirect item */
 			itembuf = get_last_bh( &path );

--=-3SwTUDfc2THThX/sjMAC--

