From: Chris Mason <mason@suse.com>
Subject: Re: large files
Date: Tue, 18 May 2004 11:40:20 -0400
Message-ID: <1084894820.20437.1599.camel@watt.suse.com>
References: <200405172148.33162.bernd-schubert@web.de>
	 <200405181544.36152.bernd-schubert@web.de>
	 <1084888676.20437.1477.camel@watt.suse.com>
	 <200405181649.22909.bernd-schubert@web.de>
	 <1084892869.20437.1551.camel@watt.suse.com>  <40AA2966.7080207@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-n3c2YvZ/7UMtG5TK6PGE"
Return-path: <reiserfs-list-return-18752-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40AA2966.7080207@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Bernd Schubert <bernd-schubert@web.de>, Reiserfs mail-list <Reiserfs-List@namesys.com>

--=-n3c2YvZ/7UMtG5TK6PGE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2004-05-18 at 11:19, Hans Reiser wrote:

> >I'd suggest contacting namesys.  Really all the patch needs is some
> >reject / fuzz resolution and testing.
> >
> Patch?  Tell me more please.;-)
> 
> 
;-)  I believe the slow down during rm comes from
prepare_for_delete_or_cut reading in one btree leaf at a time.  I
changed the (previously disabled) btree readahead code to automatically
do readahead for directory reads and unlinks.  I think I've got this
solved in 2.6.x reiserv3, Bernd needs it against 2.4.x + data logging.

In the directory read case, it does forward looking readahead, meaning
that when you read offset N in the object, it assumes you're going to
next read offset N+1. 

For unlinks, it does backwards looking readahead.  If you read offset N
in the object, it assumes you're going to next read offset N-1.  This is
because we delete bytes in a file starting from the last byte and keep
decrementing until the file is empty.  You should be able to increase
performance further by doing readahead in 32 or 64 block chunks instead
of 16.

The patch is attached.  This one was in 2.6.6-mm3, but the 2.4.x data
logging code is fairly close to 2.6.6, especially code outside
fs/reiserfs/journal.c

-chris


--=-n3c2YvZ/7UMtG5TK6PGE
Content-Disposition: attachment; filename=reiserfs-search_reada-5.patch
Content-Type: text/x-patch; name=reiserfs-search_reada-5.patch; charset=iso-8859-1
Content-Transfer-Encoding: 7bit


From: Chris Mason <mason@suse.com>

Walking the btree can trigger a number of single block synchronous reads. 
This patch does btree readahead during operations that are likely to be long
and sequential.  So far, that only includes directory reads and truncates, but
it can make both much faster.


---

 25-akpm/fs/reiserfs/dir.c           |    1 
 25-akpm/fs/reiserfs/stree.c         |   93 ++++++++++++++++++++++++++----------
 25-akpm/include/linux/reiserfs_fs.h |    6 +-
 3 files changed, 74 insertions(+), 26 deletions(-)

diff -puN fs/reiserfs/dir.c~reiserfs-search_reada-5 fs/reiserfs/dir.c
--- 25/fs/reiserfs/dir.c~reiserfs-search_reada-5	Fri Apr 23 14:38:39 2004
+++ 25-akpm/fs/reiserfs/dir.c	Fri Apr 23 14:38:39 2004
@@ -64,6 +64,7 @@ static int reiserfs_readdir (struct file
 
     /*  reiserfs_warning (inode->i_sb, "reiserfs_readdir 1: f_pos = %Ld", filp->f_pos);*/
 
+    path_to_entry.reada = PATH_READA;
     while (1) {
     research:
 	/* search the directory item, containing entry with specified key */
diff -puN fs/reiserfs/stree.c~reiserfs-search_reada-5 fs/reiserfs/stree.c
--- 25/fs/reiserfs/stree.c~reiserfs-search_reada-5	Fri Apr 23 14:38:39 2004
+++ 25-akpm/fs/reiserfs/stree.c	Fri Apr 23 14:38:39 2004
@@ -596,26 +596,29 @@ static int is_tree_node (struct buffer_h
 
 
 
-#ifdef SEARCH_BY_KEY_READA
+#define SEARCH_BY_KEY_READA 16
 
 /* The function is NOT SCHEDULE-SAFE! */
-static void search_by_key_reada (struct super_block * s, int blocknr)
+static void search_by_key_reada (struct super_block * s,
+                                 struct buffer_head **bh,
+				 unsigned long *b, int num)
 {
-    struct buffer_head * bh;
+    int i,j;
   
-    if (blocknr == 0)
-	return;
-
-    bh = sb_getblk (s, blocknr);
-  
-    if (!buffer_uptodate (bh)) {
-	ll_rw_block (READA, 1, &bh);
+    for (i = 0 ; i < num ; i++) {
+	bh[i] = sb_getblk (s, b[i]);
+    }
+    for (j = 0 ; j < i ; j++) {
+	/*
+	 * note, this needs attention if we are getting rid of the BKL
+	 * you have to make sure the prepared bit isn't set on this buffer
+	 */
+	if (!buffer_uptodate(bh[j]))
+	    ll_rw_block(READA, 1, bh + j);
+    	brelse(bh[j]);
     }
-    bh->b_count --;
 }
 
-#endif
-
 /**************************************************************************
  * Algorithm   SearchByKey                                                *
  *             look for item in the Disk S+Tree by its key                *
@@ -657,6 +660,9 @@ int search_by_key (struct super_block * 
     int				n_node_level, n_retval;
     int 			right_neighbor_of_leaf_node;
     int				fs_gen;
+    struct buffer_head *reada_bh[SEARCH_BY_KEY_READA];
+    unsigned long      reada_blocks[SEARCH_BY_KEY_READA];
+    int reada_count = 0;
 
 #ifdef CONFIG_REISERFS_CHECK
     int n_repeat_counter = 0;
@@ -691,19 +697,25 @@ int search_by_key (struct super_block * 
 	p_s_last_element = PATH_OFFSET_PELEMENT(p_s_search_path, ++p_s_search_path->path_length);
 	fs_gen = get_generation (p_s_sb);
 
-#ifdef SEARCH_BY_KEY_READA
-	/* schedule read of right neighbor */
-	search_by_key_reada (p_s_sb, right_neighbor_of_leaf_node);
-#endif
-
 	/* Read the next tree node, and set the last element in the path to
            have a pointer to it. */
-	if ( ! (p_s_bh = p_s_last_element->pe_buffer =
-		sb_bread(p_s_sb, n_block_number)) ) {
+	if ((p_s_bh = p_s_last_element->pe_buffer =
+	     sb_getblk(p_s_sb, n_block_number)) ) {
+	    if (!buffer_uptodate(p_s_bh) && reada_count > 1) {
+		search_by_key_reada (p_s_sb, reada_bh,
+		                     reada_blocks, reada_count);
+	    }
+	    ll_rw_block(READ, 1, &p_s_bh);
+	    wait_on_buffer(p_s_bh);
+	    if (!buffer_uptodate(p_s_bh))
+	        goto io_error;
+	} else {
+io_error:
 	    p_s_search_path->path_length --;
 	    pathrelse(p_s_search_path);
 	    return IO_ERROR;
 	}
+	reada_count = 0;
 	if (expected_level == -1)
 		expected_level = SB_TREE_HEIGHT (p_s_sb);
 	expected_level --;
@@ -784,11 +796,36 @@ int search_by_key (struct super_block * 
 	   position in the node. */
 	n_block_number = B_N_CHILD_NUM(p_s_bh, p_s_last_element->pe_position);
 
-#ifdef SEARCH_BY_KEY_READA
-	/* if we are going to read leaf node, then calculate its right neighbor if possible */
-	if (n_node_level == DISK_LEAF_NODE_LEVEL + 1 && p_s_last_element->pe_position < B_NR_ITEMS (p_s_bh))
-	    right_neighbor_of_leaf_node = B_N_CHILD_NUM(p_s_bh, p_s_last_element->pe_position + 1);
-#endif
+	/* if we are going to read leaf nodes, try for read ahead as well */
+	if ((p_s_search_path->reada & PATH_READA) &&
+	    n_node_level == DISK_LEAF_NODE_LEVEL + 1)
+	{
+	    int pos = p_s_last_element->pe_position;
+	    int limit = B_NR_ITEMS(p_s_bh);
+	    struct key *le_key;
+
+	    if (p_s_search_path->reada & PATH_READA_BACK)
+		limit = 0;
+	    while(reada_count < SEARCH_BY_KEY_READA) {
+		if (pos == limit)
+		    break;
+	        reada_blocks[reada_count++] = B_N_CHILD_NUM(p_s_bh, pos);
+		if (p_s_search_path->reada & PATH_READA_BACK)
+		    pos--;
+		else
+		    pos++;
+
+		/*
+		 * check to make sure we're in the same object
+		 */
+		le_key = B_N_PDELIM_KEY(p_s_bh, pos);
+		if (le32_to_cpu(le_key->k_objectid) !=
+		    p_s_key->on_disk_key.k_objectid)
+		{
+		    break;
+		}
+	    }
+        }
     }
 }
 
@@ -1778,6 +1815,12 @@ void reiserfs_do_truncate (struct reiser
            space, this file would have this file size */
 	n_file_size = offset + bytes - 1;
     }
+    /*
+     * are we doing a full truncate or delete, if so
+     * kick in the reada code
+     */
+    if (n_new_file_size == 0)
+        s_search_path.reada = PATH_READA | PATH_READA_BACK;
 
     if ( n_file_size == 0 || n_file_size < n_new_file_size ) {
 	goto update_and_out ;
diff -puN include/linux/reiserfs_fs.h~reiserfs-search_reada-5 include/linux/reiserfs_fs.h
--- 25/include/linux/reiserfs_fs.h~reiserfs-search_reada-5	Fri Apr 23 14:38:39 2004
+++ 25-akpm/include/linux/reiserfs_fs.h	Fri Apr 23 14:38:39 2004
@@ -1238,8 +1238,12 @@ excessive effort to avoid disturbing the
 gods only know how we are going to SMP the code that uses them.
 znodes are the way! */
 
+#define PATH_READA	0x1 /* do read ahead */
+#define PATH_READA_BACK 0x2 /* read backwards */
+
 struct  path {
   int                   path_length;                      	/* Length of the array above.   */
+  int			reada;
   struct  path_element  path_elements[EXTENDED_MAX_HEIGHT];	/* Array of the path elements.  */
   int			pos_in_item;
 };
@@ -1247,7 +1251,7 @@ struct  path {
 #define pos_in_item(path) ((path)->pos_in_item)
 
 #define INITIALIZE_PATH(var) \
-struct path var = {.path_length = ILLEGAL_PATH_ELEMENT_OFFSET,}
+struct path var = {.path_length = ILLEGAL_PATH_ELEMENT_OFFSET, .reada = 0,}
 
 /* Get path element by path and path position. */
 #define PATH_OFFSET_PELEMENT(p_s_path,n_offset)  ((p_s_path)->path_elements +(n_offset))

_

--=-n3c2YvZ/7UMtG5TK6PGE--

