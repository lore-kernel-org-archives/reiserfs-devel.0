From: Oleg Drokin <green@namesys.com>
Subject: Re: Apparent race condition in do_journal_begin_r() with UL kernel
Date: Tue, 16 Sep 2003 19:36:21 +0400
Message-ID: <20030916153620.GA773@namesys.com>
References: <1063725179.12929.548.camel@biker.psw.pdb.fsc.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="zYM0uCDKw75PZbzx"
Return-path: <reiserfs-list-return-15674-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1063725179.12929.548.camel@biker.psw.pdb.fsc.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Martin Wilck <Martin.Wilck@Fujitsu-Siemens.com>
Cc: Reiser FS Mailing List <reiserfs-list@namesys.com>, mason@suse.com

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

On Tue, Sep 16, 2003 at 05:12:58PM +0200, Martin Wilck wrote:

> - 1 of the involved Reiser filesystems cannot be accessed anymore.
>   a number of processes in "D" state tries to access files on that file
>   system:

What if you press 'reset' and then boot and try to mount the fs?
Will you see ~ 2k uncommited transactions replayed?
If so, we recently saw similar thing. The fix is not ready yet, though.

> - My analysis of call traces of the offending processes shows that 
>   all 'cp' processes and one 'rm' seem to be stuck in the 
>   lock_journal() call in do_journal_begin_r().
>   The "cp" processes all end up in journal_begin() through
>   __mark_inode_dirty() (both in read() and write() system calls).
>   3 of the 'rm' processes are stuck in the down() call in sys_unlink().

Yes, this looks a lot like what we already saw.

> So, AFAICT, this look like a race of at least 3 processes for some
> ReiserFS locks / semaphores.

No, the problem is different. We have easier reproduction scenario for it.

> PS: A very similar observation was the actual reason that we started
> this debugging procedure in the first place. We happened to have the
> "is_tree_inode ..." messages, too, though, and I thought the apparent
> race was  a follow-up error of those. However, since the race also comes
> to pass with Oleg's patch, it seems to be an unrelated problem.

The patch is not mine, in fact, it was made by Chris Mason.

Below you can find the patch that may help you if I am right about roots of your second problem.
This is not proper fix but merely a quick plug. (I verified and it passes my testcase)
Chris promised to send proper patch yesterday, but seems he is busy right now.

Also find attached another fix for is_tree_node from Vladimir Saveliev that
Chris said is superiour to his.

Bye,
    Oleg

===== fs/reiserfs/journal.c 1.33 vs edited =====
--- 1.33/fs/reiserfs/journal.c	Thu Aug 28 18:28:11 2003
+++ edited/fs/reiserfs/journal.c	Tue Sep 16 19:23:33 2003
@@ -2839,6 +2839,10 @@
   }
   now = CURRENT_TIME;
 
+  if ( nblocks > SB_JOURNAL_MAX_BATCH(p_s_sb) - 5 ) {
+	nblocks = SB_JOURNAL_MAX_BATCH(p_s_sb) - 5;
+  } 
+
   /* if there is no room in the journal OR
   ** if this transaction is too old, and we weren't called joinable, wait for it to finish before beginning 
   ** we don't sleep if there aren't other writers

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=istreelevel_fix-2

Hello

Chris Mason wrote:

>On Mon, 2003-03-03 at 14:05, Chris Mason wrote:
>  
>
>>On Mon, 2003-03-03 at 13:42, Oleg Drokin wrote:
>>    
>>
>>>Hello!
>>>
>>>On Mon, Mar 03, 2003 at 01:06:54PM -0500, Chris Mason wrote:
>>>      
>>>
>>>>Ok, in search_by_key, what happens if a balance collapses one tree level
>>>>while we schedule, and the buffer we just found moves to a different
>>>>level?
>>>>B_IS_IN_TREE will return 1, and it is possible the key we searched for
>>>>is still in the buffer.
>>>>Won't that just lead to vs-5150 messages when we should have just
>>>>detected a tree change and started the search over?
>>>>        
>>>>
>>>For me it looks like there is definitely a problem.
>>>Unfortunatelly Vladimir is in Italy, so he cannot confirm
>>>or deny this yet.
>>>      
>>>
>>I haven't been able to trigger this on ia32, but I have triggered it on
>>my x86_64 box just by running 4 copies of fsx-linux at once.  I thought
>>the key_in_buffer checks were supposed to find this kind of thing
>>though.
>>    
>>
Yes. And it looks like it does it. Both get_rkey and get_lkey check 
whole path. However, it looks like the problem you describe can appear 
for root block.
Could you please try to reproduce the problem with the attached patch?

>This patch adds a few additional checks to make sure each buffer in the
>path is in the tree and the path is rooted correctly.  It also changes
>search_by_key to drop the path and research when the tree height
>changes.
>
>Perhaps someone can find a better check for key_in_buffer that provides
>these checks as well.  I actually wanted to just drop the key_in_buffer
>checks completely, and have search_by_key reserch any time the tree
>changed, but that lead to vs-3050 deadlocks under load.
>  
>
Dropping call to key_in_buffer must not lead to vs-3050. If it does - we 
probably have problems somewhere.

>-chris
>
>--- linux.ul.1/fs/reiserfs/stree.c	2003-03-06 09:16:36.000000000 -0500
>+++ linux.ul/fs/reiserfs/stree.c	2003-03-06 09:15:44.000000000 -0500
>@@ -338,7 +338,27 @@
>   return  &MAX_KEY;
> }
> 
>+/* check each buffer in the path to make sure it is still in the tree */
>+int path_in_tree (const struct path *path,
>+		  const struct super_block  * s) 
>+{
>+    int n_path_offset = path->path_length;
>+    struct buffer_head *bh;
>+
>+    if (PATH_OFFSET_PBUFFER(path, FIRST_PATH_ELEMENT_OFFSET)->b_blocknr !=
>+         SB_ROOT_BLOCK(s)) 
>+    {
>+        return 0;
>+    }	 
>+    while (n_path_offset-- > FIRST_PATH_ELEMENT_OFFSET) {
>+        bh = PATH_OFFSET_PBUFFER(path, n_path_offset);
>+	if (!B_IS_IN_TREE(bh)) {
>+	    return 0;
>+	}
>+    }
>+    return 1;
> 
>+}
> /* Get delimiting key of the buffer at the path and its right neighbor. */
> inline	const struct  key * get_rkey  (
> 	                const struct path         * p_s_chk_path,
>@@ -403,7 +423,7 @@
>   if ( COMP_KEYS(get_rkey(p_s_chk_path, p_s_sb), p_s_key) != 1 )
>     /* p_s_key must be less than right delimitiing key */
>     return 0;
>-  return 1;
>+  return path_in_tree(p_s_chk_path, p_s_sb);
> }
> 
> 
>@@ -664,6 +684,7 @@
>     int				n_node_level, n_retval;
>     int 			right_neighbor_of_leaf_node;
>     int				fs_gen;
>+    int				tree_height;
>     struct buffer_head *reada_bh[SEARCH_BY_KEY_READA];
>     unsigned long      reada_blocks[SEARCH_BY_KEY_READA];
>     int reada_count = 0;
>@@ -699,6 +720,7 @@
> 	/* prep path to have another element added to it. */
> 	p_s_last_element = PATH_OFFSET_PELEMENT(p_s_search_path, ++p_s_search_path->path_length);
> 	fs_gen = get_generation (p_s_sb);
>+	tree_height = SB_TREE_HEIGHT(p_s_sb);
> 	expected_level --;
> 
> 	/* schedule read of right neighbors */
>@@ -724,7 +746,8 @@
> 	   to search is still in the tree rooted from the current buffer. If
> 	   not then repeat search from the root. */
> 	if ( fs_changed (fs_gen, p_s_sb) && 
>-	     (!B_IS_IN_TREE (p_s_bh) || !key_in_buffer(p_s_search_path, p_s_key, p_s_sb)) ) {
>+	     (tree_height != SB_TREE_HEIGHT(p_s_sb) ||
>+	     !B_IS_IN_TREE (p_s_bh) || !key_in_buffer(p_s_search_path, p_s_key, p_s_sb)) ) {
>  	    PROC_INFO_INC( p_s_sb, search_by_key_restarted );
> 	    PROC_INFO_INC( p_s_sb, sbk_restarted[ expected_level - 1 ] );
> 	    decrement_counters_in_path(p_s_search_path);
>
>
>
>
>
>
>
>
>  
>

===== fs/reiserfs/stree.c 1.35 vs edited =====
--- 1.35/fs/reiserfs/stree.c	Mon Feb 24 21:10:17 2003
+++ edited/fs/reiserfs/stree.c	Mon Mar 10 13:36:47 2003
@@ -653,7 +653,7 @@
                                        DISK_LEAF_NODE_LEVEL */
     ) {
     int  n_block_number = SB_ROOT_BLOCK (p_s_sb),
-      expected_level = SB_TREE_HEIGHT (p_s_sb);
+      expected_level = -1;
     struct buffer_head  *       p_s_bh;
     struct path_element *       p_s_last_element;
     int				n_node_level, n_retval;
@@ -690,7 +690,6 @@
 	/* prep path to have another element added to it. */
 	p_s_last_element = PATH_OFFSET_PELEMENT(p_s_search_path, ++p_s_search_path->path_length);
 	fs_gen = get_generation (p_s_sb);
-	expected_level --;
 
 #ifdef SEARCH_BY_KEY_READA
 	/* schedule read of right neighbor */
@@ -706,6 +705,10 @@
 	    return IO_ERROR;
 	}
 
+	if (expected_level == -1)
+		expected_level = SB_TREE_HEIGHT (p_s_sb);
+	expected_level --;
+
  	if( fs_changed (fs_gen, p_s_sb) ) {
  		PROC_INFO_INC( p_s_sb, search_by_key_fs_changed );
  		PROC_INFO_INC( p_s_sb, sbk_fs_changed[ expected_level - 1 ] );
@@ -723,7 +726,7 @@
 	    /* Get the root block number so that we can repeat the search
                starting from the root. */
 	    n_block_number = SB_ROOT_BLOCK (p_s_sb);
-	    expected_level = SB_TREE_HEIGHT (p_s_sb);
+	    expected_level = -1;
 	    right_neighbor_of_leaf_node = 0;
 	    
 	    /* repeat search from the root */



Thanks,
vs





--zYM0uCDKw75PZbzx--
