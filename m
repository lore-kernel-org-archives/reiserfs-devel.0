From: Oleg Drokin <green@namesys.com>
Subject: Re: is_tree_inode: node level X does not match to the expected one Y
Date: Mon, 15 Sep 2003 16:02:10 +0400
Message-ID: <20030915120210.GA7291@namesys.com>
References: <1063626200.12910.347.camel@biker.psw.pdb.fsc.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15669-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1063626200.12910.347.camel@biker.psw.pdb.fsc.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Wilck <Martin.Wilck@Fujitsu-Siemens.com>
Cc: Reiser FS Mailing List <reiserfs-list@namesys.com>

Hello!

On Mon, Sep 15, 2003 at 01:43:19PM +0200, Martin Wilck wrote:
> We are currently trying to debug an error that occurs only with
> ReiserFS. The error occurs during a high-IO-load stress test
> (copy/compare test).
> Sep  8 19:20:55 rx203 kernel: vs-13050: reiserfs_update_sd: \
>    i/o failure occurred trying to update [12 56 0x0 SD] stat data\
>    is_tree_node: node level 2 does not match to the expected one 3
> Sep  8 19:20:55 rx203 kernel: vs-5150: search_by_key: \
>    invalid format found in block 13924. Fsck?

I *think* I remember Chris described something looking exactly like what you are
describing some time ago (related to SuSE-speciufic datalogging patches), which is in fact
a rare race, as I remember.
I also remember there were some proposed patches, but probably they
were not included into that release?
I CC Chris because he certainly should know more info on the topic.
Chris: corresponding discussion happened on reiserfs-dev on April 3, 2002 with subject "check_internal_node Q"
And even more related discussion happened on March 03, 2003 with subject
  "is_tree_node: node level 1 does not match to the expected one 2"

> Interestingly, when I stop test, unmount the volumes and do a
> reiserfsck, no errors are reported, the file systems seem to be intact.

And this seems to confirm my theory, too.

> - is it possible that this is _not_ a hardware error, but a reiser
>   problem?

Yes, it is possible.

> - can anybody give me a simple explanation what is actually going wrong
>   in the situation at hand?

As I remember, there was a race where we first remember the node level, then
some fs change occurs possibly changing node level, then we check nopde level
and it is wrong.

I attach a patch that was proposed by Chris at the time and you might want to try it,
or Chris may have better patch already.

Bye,
    Oleg

> I haven't been able to trigger this on ia32, but I have triggered it on
> my x86_64 box just by running 4 copies of fsx-linux at once.  I thought
> the key_in_buffer checks were supposed to find this kind of thing
> though.

This patch adds a few additional checks to make sure each buffer in the
path is in the tree and the path is rooted correctly.  It also changes
search_by_key to drop the path and research when the tree height
changes.

Perhaps someone can find a better check for key_in_buffer that provides
these checks as well.  I actually wanted to just drop the key_in_buffer
checks completely, and have search_by_key research any time the tree
changed, but that lead to vs-3050 deadlocks under load.

-chris

--- linux.ul.1/fs/reiserfs/stree.c	2003-03-06 09:16:36.000000000 -0500
+++ linux.ul/fs/reiserfs/stree.c	2003-03-06 09:15:44.000000000 -0500
@@ -338,7 +338,27 @@
   return  &MAX_KEY;
 }
 
+/* check each buffer in the path to make sure it is still in the tree */
+int path_in_tree (const struct path *path,
+		  const struct super_block  * s) 
+{
+    int n_path_offset = path->path_length;
+    struct buffer_head *bh;
+
+    if (PATH_OFFSET_PBUFFER(path, FIRST_PATH_ELEMENT_OFFSET)->b_blocknr !=
+         SB_ROOT_BLOCK(s)) 
+    {
+        return 0;
+    }	 
+    while (n_path_offset-- > FIRST_PATH_ELEMENT_OFFSET) {
+        bh = PATH_OFFSET_PBUFFER(path, n_path_offset);
+	if (!B_IS_IN_TREE(bh)) {
+	    return 0;
+	}
+    }
+    return 1;
 
+}
 /* Get delimiting key of the buffer at the path and its right neighbor. */
 inline	const struct  key * get_rkey  (
 	                const struct path         * p_s_chk_path,
@@ -403,7 +423,7 @@
   if ( COMP_KEYS(get_rkey(p_s_chk_path, p_s_sb), p_s_key) != 1 )
     /* p_s_key must be less than right delimitiing key */
     return 0;
-  return 1;
+  return path_in_tree(p_s_chk_path, p_s_sb);
 }
 
 
@@ -664,6 +684,7 @@
     int				n_node_level, n_retval;
     int 			right_neighbor_of_leaf_node;
     int				fs_gen;
+    int				tree_height;
     struct buffer_head *reada_bh[SEARCH_BY_KEY_READA];
     unsigned long      reada_blocks[SEARCH_BY_KEY_READA];
     int reada_count = 0;
@@ -699,6 +720,7 @@
 	/* prep path to have another element added to it. */
 	p_s_last_element = PATH_OFFSET_PELEMENT(p_s_search_path, ++p_s_search_path->path_length);
 	fs_gen = get_generation (p_s_sb);
+	tree_height = SB_TREE_HEIGHT(p_s_sb);
 	expected_level --;
 
 	/* schedule read of right neighbors */
@@ -724,7 +746,8 @@
 	   to search is still in the tree rooted from the current buffer. If
 	   not then repeat search from the root. */
 	if ( fs_changed (fs_gen, p_s_sb) && 
-	     (!B_IS_IN_TREE (p_s_bh) || !key_in_buffer(p_s_search_path, p_s_key, p_s_sb)) ) {
+	     (tree_height != SB_TREE_HEIGHT(p_s_sb) ||
+	     !B_IS_IN_TREE (p_s_bh) || !key_in_buffer(p_s_search_path, p_s_key, p_s_sb)) ) {
  	    PROC_INFO_INC( p_s_sb, search_by_key_restarted );
 	    PROC_INFO_INC( p_s_sb, sbk_restarted[ expected_level - 1 ] );
 	    decrement_counters_in_path(p_s_search_path);






