From: Chris Mason <mason@suse.com>
Subject: Re: question about a possible deadlock
Date: 26 Apr 2002 09:14:12 -0400
Message-ID: <1019826852.1734.95.camel@tiny>
References: <20020426150726.A25444@castle.nmd.msu.ru>
	<1019822456.6770.59.camel@tiny>  <20020426170129.A26325@castle.nmd.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10186-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020426170129.A26325@castle.nmd.msu.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrey Savochkin <saw@saw.sw.com.sg>
Cc: reiserfs-list@namesys.com

On Fri, 2002-04-26 at 09:01, Andrey Savochkin wrote:

> > Nope, you are exactly right.  We've got a patch in testing that should
> > fix this, let me know if you are interested in trying it out.
> 
> Yes, I'm interested :-)
> 

This was against 2.4.19-pre6, but should work against pre7 as well.  It
is a little larger than it needs to be because it incorporates some of
the stuff from the quota code (where it was fixed first).

bk receivable at the end of the message.

-chris

ChangeSet@1.389, 2002-04-15 20:49:03-04:00, mason@suse.com
  make sure iput is called outside the transaction by changing
  around reiserfs_new_inode.

diff -Nru a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
--- a/fs/reiserfs/inode.c	Mon Apr 15 20:50:54 2002
+++ b/fs/reiserfs/inode.c	Mon Apr 15 20:50:55 2002
@@ -1502,13 +1502,22 @@
 /* inserts the stat data into the tree, and then calls
    reiserfs_new_directory (to insert ".", ".." item if new object is
    directory) or reiserfs_new_symlink (to insert symlink body if new
-   object is symlink) or nothing (if new object is regular file) */
-struct inode * reiserfs_new_inode (struct reiserfs_transaction_handle *th,
+   object is symlink) or nothing (if new object is regular file) 
+
+   NOTE! uid and gid must already be set in the inode.  If we return
+   non-zero due to an error, we have to drop the quota previously allocated
+   for the fresh inode.  This can only be done outside a transaction, so
+   if we return non-zero, we also end the transaction.
+   
+   */
+int reiserfs_new_inode (struct reiserfs_transaction_handle *th,
 				   const struct inode * dir, int mode, 
 				   const char * symname, 
-				   int i_size, /* 0 for regular, EMTRY_DIR_SIZE for dirs,
-						  strlen (symname) for symlinks)*/
-				   struct dentry *dentry, struct inode *inode, int * err)
+				   /* 0 for regular, EMTRY_DIR_SIZE for dirs,
+				      strlen (symname) for symlinks) */
+				   loff_t i_size, 
+				   struct dentry *dentry, 
+				   struct inode *inode) 
 {
     struct super_block * sb;
     INITIALIZE_PATH (path_to_key);
@@ -1516,11 +1525,11 @@
     struct item_head ih;
     struct stat_data sd;
     int retval;
+    int err ;
   
     if (!dir || !dir->i_nlink) {
-	*err = -EPERM;
-	iput(inode) ;
-	return NULL;
+	err = -EPERM ;
+	goto out_bad_inode ;
     }
 
     sb = dir->i_sb;
@@ -1528,13 +1537,16 @@
 	    dir -> u.reiserfs_i.i_attrs & REISERFS_INHERIT_MASK;
     sd_attrs_to_i_attrs( inode -> u.reiserfs_i.i_attrs, inode );
 
+    /* symlink cannot be immutable or append only, right? */
+    if( S_ISLNK( inode -> i_mode ) )
+	    inode -> i_flags &= ~ ( S_IMMUTABLE | S_APPEND );
+
     /* item head of new item */
     ih.ih_key.k_dir_id = INODE_PKEY (dir)->k_objectid;
     ih.ih_key.k_objectid = cpu_to_le32 (reiserfs_get_unused_objectid (th));
     if (!ih.ih_key.k_objectid) {
-	iput(inode) ;
-	*err = -ENOMEM;
-	return NULL;
+	err = -ENOMEM ;
+	goto out_bad_inode ;
     }
     if (old_format_only (sb))
       /* not a perfect generation count, as object ids can be reused, but this
@@ -1550,12 +1562,24 @@
 #else
       inode->i_generation = ++event;
 #endif
+    /* fill stat data */
+    inode->i_nlink = (S_ISDIR (mode) ? 2 : 1);
+
+    /* uid and gid must already be set by the caller for quota init */
+
+    inode->i_mtime = inode->i_atime = inode->i_ctime = CURRENT_TIME;
+    inode->i_size = i_size;
+    inode->i_blocks = (i_size + 511) >> 9;
+    inode->u.reiserfs_i.i_first_direct_byte = S_ISLNK(mode) ? 1 : 
+      U32_MAX/*NO_BYTES_IN_DIRECT_ITEM*/;
+
+    INIT_LIST_HEAD(&inode->u.reiserfs_i.i_prealloc_list) ;
+
     if (old_format_only (sb))
 	make_le_item_head (&ih, 0, KEY_FORMAT_3_5, SD_OFFSET, TYPE_STAT_DATA, SD_V1_SIZE, MAX_US_INT);
     else
 	make_le_item_head (&ih, 0, KEY_FORMAT_3_6, SD_OFFSET, TYPE_STAT_DATA, SD_SIZE, MAX_US_INT);
 
-
     /* key to search for correct place for new stat data */
     _make_cpu_key (&key, KEY_FORMAT_3_6, le32_to_cpu (ih.ih_key.k_dir_id),
 		   le32_to_cpu (ih.ih_key.k_objectid), SD_OFFSET, TYPE_STAT_DATA, 3/*key length*/);
@@ -1563,47 +1587,21 @@
     /* find proper place for inserting of stat data */
     retval = search_item (sb, &key, &path_to_key);
     if (retval == IO_ERROR) {
-	iput (inode);
-	*err = -EIO;
-	return NULL;
+	err = -EIO;
+	goto out_bad_inode;
     }
     if (retval == ITEM_FOUND) {
 	pathrelse (&path_to_key);
-	iput (inode);
-	*err = -EEXIST;
-	return NULL;
+	err = -EEXIST;
+	goto out_bad_inode;
     }
 
-    /* fill stat data */
-    inode->i_mode = mode;
-    inode->i_nlink = (S_ISDIR (mode) ? 2 : 1);
-    inode->i_uid = current->fsuid;
-    if (dir->i_mode & S_ISGID) {
-	inode->i_gid = dir->i_gid;
-	if (S_ISDIR(mode))
-	    inode->i_mode |= S_ISGID;
-    } else
-	inode->i_gid = current->fsgid;
-
-    /* symlink cannot be immutable or append only, right? */
-    if( S_ISLNK( inode -> i_mode ) )
-	    inode -> i_flags &= ~ ( S_IMMUTABLE | S_APPEND );
-
-    inode->i_mtime = inode->i_atime = inode->i_ctime = CURRENT_TIME;
-    inode->i_size = i_size;
-    inode->i_blocks = (inode->i_size + 511) >> 9;
-    inode->u.reiserfs_i.i_first_direct_byte = S_ISLNK(mode) ? 1 : 
-      U32_MAX/*NO_BYTES_IN_DIRECT_ITEM*/;
-
-    INIT_LIST_HEAD(&inode->u.reiserfs_i.i_prealloc_list) ;
-
     if (old_format_only (sb)) {
 	if (inode->i_uid & ~0xffff || inode->i_gid & ~0xffff) {
 	    pathrelse (&path_to_key);
 	    /* i_uid or i_gid is too big to be stored in stat data v3.5 */
-	    iput (inode);
-	    *err = -EINVAL;
-	    return NULL;
+	    err = -EINVAL;
+	    goto out_bad_inode;
 	}
 	inode2sd_v1 (&sd, inode);
     } else
@@ -1630,10 +1628,9 @@
     /* insert the stat data into the tree */
     retval = reiserfs_insert_item (th, &path_to_key, &key, &ih, (char *)(&sd));
     if (retval) {
-	iput (inode);
-	*err = retval;
 	reiserfs_check_path(&path_to_key) ;
-	return NULL;
+	err = retval;
+	goto out_bad_inode;
     }
 
     if (S_ISDIR(mode)) {
@@ -1648,19 +1645,31 @@
 	retval = reiserfs_new_symlink (th, &ih, &path_to_key, symname, i_size);
     }
     if (retval) {
-      inode->i_nlink = 0;
-	iput (inode);
-	*err = retval;
+	err = retval; 
 	reiserfs_check_path(&path_to_key) ;
-	return NULL;
+	journal_end(th, th->t_super, th->t_blocks_allocated) ;
+	goto out_inserted_sd; 
     }
 
     insert_inode_hash (inode);
-    // we do not mark inode dirty: on disk content matches to the
-    // in-core one
+    reiserfs_update_sd(th, inode) ;
     reiserfs_check_path(&path_to_key) ;
 
-    return inode;
+    return 0 ;
+
+out_bad_inode:
+    /* Invalidate the object, nothing was inserted yet */
+    INODE_PKEY(inode)->k_objectid = 0;	
+
+    /* dquot_drop must be done outside a transaction */
+    journal_end(th, th->t_super, th->t_blocks_allocated) ;
+    make_bad_inode(inode);	
+
+out_inserted_sd:
+    inode->i_nlink = 0;
+    th->t_trans_id = 0 ; /* so the caller can't use this handle later */
+    iput(inode) ;
+    return err;
 }
 
 /*
diff -Nru a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
--- a/fs/reiserfs/namei.c	Mon Apr 15 20:50:54 2002
+++ b/fs/reiserfs/namei.c	Mon Apr 15 20:50:54 2002
@@ -506,6 +506,40 @@
     return 0;
 }
 
+/* quota utility function, call if you've had to abort after calling
+** new_inode_init, and have not called reiserfs_new_inode yet.
+** This should only be called on inodes that do not hav stat data
+** inserted into the tree yet.
+*/
+static int drop_new_inode(struct inode *inode) {
+    make_bad_inode(inode) ;
+    iput(inode) ;
+    return 0 ;
+}
+
+/* utility function that does setup for reiserfs_new_inode.  
+** DQUOT_ALLOC_INODE cannot be called inside a transaction, so we had
+** to pull some bits of reiserfs_new_inode out into this func.
+** Yes, the actual quota calls are missing, they are part of the quota
+** patch.
+*/
+static int new_inode_init(struct inode *inode, struct inode *dir, int mode) {
+
+    /* the quota init calls have to know who to charge the quota to, so
+    ** we have to set uid and gid here
+    */
+    inode->i_uid = current->fsuid;
+    inode->i_mode = mode;
+
+    if (dir->i_mode & S_ISGID) {
+        inode->i_gid = dir->i_gid;
+        if (S_ISDIR(mode))
+            inode->i_mode |= S_ISGID;
+    } else
+        inode->i_gid = current->fsgid;
+
+    return 0 ;
+}
 
 //
 // a portion of this function, particularly the VFS interface portion,
@@ -518,23 +552,22 @@
 {
     int retval;
     struct inode * inode;
-    int windex ;
     int jbegin_count = JOURNAL_PER_BALANCE_CNT * 2 ;
     struct reiserfs_transaction_handle th ;
 
-
     inode = new_inode(dir->i_sb) ;
     if (!inode) {
 	return -ENOMEM ;
     }
+    retval = new_inode_init(inode, dir, mode);
+    if (retval)
+        return retval;
+
     journal_begin(&th, dir->i_sb, jbegin_count) ;
     th.t_caller = "create" ;
-    windex = push_journal_writer("reiserfs_create") ;
-    inode = reiserfs_new_inode (&th, dir, mode, 0, 0/*i_size*/, dentry, inode, &retval);
-    if (!inode) {
-	pop_journal_writer(windex) ;
-	journal_end(&th, dir->i_sb, jbegin_count) ;
-	return retval;
+    retval = reiserfs_new_inode (&th, dir, mode, 0, 0/*i_size*/, dentry, inode);
+    if (retval) {
+        goto out_failed;
     }
 	
     inode->i_op = &reiserfs_file_inode_operations;
@@ -546,20 +579,19 @@
     if (retval) {
 	inode->i_nlink--;
 	reiserfs_update_sd (&th, inode);
-	pop_journal_writer(windex) ;
-	// FIXME: should we put iput here and have stat data deleted
-	// in the same transactioin
 	journal_end(&th, dir->i_sb, jbegin_count) ;
-	iput (inode);
-	return retval;
+	iput(inode) ;
+	goto out_failed ;
     }
     reiserfs_update_inode_transaction(inode) ;
     reiserfs_update_inode_transaction(dir) ;
 
     d_instantiate(dentry, inode);
-    pop_journal_writer(windex) ;
     journal_end(&th, dir->i_sb, jbegin_count) ;
     return 0;
+
+out_failed:
+    return retval ;
 }
 

@@ -574,7 +606,6 @@
 {
     int retval;
     struct inode * inode;
-    int windex ;
     struct reiserfs_transaction_handle th ;
     int jbegin_count = JOURNAL_PER_BALANCE_CNT * 3; 
 
@@ -582,14 +613,15 @@
     if (!inode) {
 	return -ENOMEM ;
     }
+    retval = new_inode_init(inode, dir, mode) ;
+    if (retval)
+        return retval ;
+
     journal_begin(&th, dir->i_sb, jbegin_count) ;
-    windex = push_journal_writer("reiserfs_mknod") ;
 
-    inode = reiserfs_new_inode (&th, dir, mode, 0, 0/*i_size*/, dentry, inode, &retval);
-    if (!inode) {
-	pop_journal_writer(windex) ;
-	journal_end(&th, dir->i_sb, jbegin_count) ;
-	return retval;
+    retval = reiserfs_new_inode(&th, dir, mode, 0, 0/*i_size*/, dentry, inode);
+    if (retval) {
+	goto out_failed; 
     }
 
     init_special_inode(inode, mode, rdev) ;
@@ -605,16 +637,17 @@
     if (retval) {
 	inode->i_nlink--;
 	reiserfs_update_sd (&th, inode);
-	pop_journal_writer(windex) ;
 	journal_end(&th, dir->i_sb, jbegin_count) ;
-	iput (inode);
-	return retval;
+	iput(inode) ;
+        goto out_failed; 
     }
 
     d_instantiate(dentry, inode);
-    pop_journal_writer(windex) ;
     journal_end(&th, dir->i_sb, jbegin_count) ;
     return 0;
+
+out_failed:
+    return retval ;
 }
 

@@ -629,31 +662,32 @@
 {
     int retval;
     struct inode * inode;
-    int windex ;
     struct reiserfs_transaction_handle th ;
     int jbegin_count = JOURNAL_PER_BALANCE_CNT * 3; 
 
+    mode = S_IFDIR | mode;
     inode = new_inode(dir->i_sb) ;
     if (!inode) {
 	return -ENOMEM ;
     }
+    retval = new_inode_init(inode, dir, mode) ;
+    if (retval)
+        return retval ;
+    
     journal_begin(&th, dir->i_sb, jbegin_count) ;
-    windex = push_journal_writer("reiserfs_mkdir") ;
 
     /* inc the link count now, so another writer doesn't overflow it while
     ** we sleep later on.
     */
     INC_DIR_INODE_NLINK(dir)
 
-    mode = S_IFDIR | mode;
-    inode = reiserfs_new_inode (&th, dir, mode, 0/*symlink*/,
-				old_format_only (dir->i_sb) ? EMPTY_DIR_SIZE_V1 : EMPTY_DIR_SIZE,
-				dentry, inode, &retval);
-    if (!inode) {
-	pop_journal_writer(windex) ;
+    retval = reiserfs_new_inode(&th, dir, mode, 0/*symlink*/,
+				old_format_only (dir->i_sb) ? 
+				EMPTY_DIR_SIZE_V1 : EMPTY_DIR_SIZE,
+				dentry, inode) ;
+    if (retval) {
 	dir->i_nlink-- ;
-	journal_end(&th, dir->i_sb, jbegin_count) ;
-	return retval;
+	goto out_failed ;
     }
     reiserfs_update_inode_transaction(inode) ;
     reiserfs_update_inode_transaction(dir) ;
@@ -668,19 +702,20 @@
 	inode->i_nlink = 0;
 	DEC_DIR_INODE_NLINK(dir);
 	reiserfs_update_sd (&th, inode);
-	pop_journal_writer(windex) ;
 	journal_end(&th, dir->i_sb, jbegin_count) ;
-	iput (inode);
-	return retval;
+	iput(inode) ;
+	goto out_failed ;
     }
 
     // the above add_entry did not update dir's stat data
     reiserfs_update_sd (&th, dir);
 
     d_instantiate(dentry, inode);
-    pop_journal_writer(windex) ;
     journal_end(&th, dir->i_sb, jbegin_count) ;
     return 0;
+
+out_failed:
+    return retval ;
 }
 
 static inline int reiserfs_empty_dir(struct inode *inode) {
@@ -879,40 +914,42 @@
     struct inode * inode;
     char * name;
     int item_len;
-    int windex ;
+    int mode = S_IFLNK | S_IRWXUGO ;
     struct reiserfs_transaction_handle th ;
     int jbegin_count = JOURNAL_PER_BALANCE_CNT * 3; 
 
-
     inode = new_inode(dir->i_sb) ;
     if (!inode) {
 	return -ENOMEM ;
     }
+    retval = new_inode_init(inode, dir, mode) ;
+    if (retval) {
+        return retval ;
+    }
 
     item_len = ROUND_UP (strlen (symname));
     if (item_len > MAX_DIRECT_ITEM_LEN (dir->i_sb->s_blocksize)) {
-	iput(inode) ;
-	return -ENAMETOOLONG;
+	retval = -ENAMETOOLONG;
+	drop_new_inode(inode) ;
+	goto out_failed ;
     }
   
     name = reiserfs_kmalloc (item_len, GFP_NOFS, dir->i_sb);
     if (!name) {
-	iput(inode) ;
-	return -ENOMEM;
+	retval = -ENOMEM;
+	drop_new_inode(inode) ;
+	goto out_failed ;
     }
     memcpy (name, symname, strlen (symname));
     padd_item (name, item_len, strlen (symname));
 
     journal_begin(&th, dir->i_sb, jbegin_count) ;
-    windex = push_journal_writer("reiserfs_symlink") ;
 
-    inode = reiserfs_new_inode (&th, dir, S_IFLNK | S_IRWXUGO, name, strlen (symname), dentry,
-				inode, &retval);
+    retval = reiserfs_new_inode(&th, dir, mode, name, 
+                               strlen(symname), dentry, inode) ;
     reiserfs_kfree (name, item_len, dir->i_sb);
-    if (inode == 0) { /* reiserfs_new_inode iputs for us */
-	pop_journal_writer(windex) ;
-	journal_end(&th, dir->i_sb, jbegin_count) ;
-	return retval;
+    if (retval) { 
+	goto out_failed ;
     }
 
     reiserfs_update_inode_transaction(inode) ;
@@ -930,16 +967,17 @@
     if (retval) {
 	inode->i_nlink--;
 	reiserfs_update_sd (&th, inode);
-	pop_journal_writer(windex) ;
 	journal_end(&th, dir->i_sb, jbegin_count) ;
-	iput (inode);
-	return retval;
+	iput(inode) ;
+	goto out_failed ;
     }
 
     d_instantiate(dentry, inode);
-    pop_journal_writer(windex) ;
     journal_end(&th, dir->i_sb, jbegin_count) ;
     return 0;
+
+out_failed:
+    return retval ;
 }
 

diff -Nru a/include/linux/reiserfs_fs.h b/include/linux/reiserfs_fs.h
--- a/include/linux/reiserfs_fs.h	Mon Apr 15 20:50:55 2002
+++ b/include/linux/reiserfs_fs.h	Mon Apr 15 20:50:55 2002
@@ -1725,10 +1725,10 @@
 			      const struct cpu_key * key);
 

-struct inode * reiserfs_new_inode (struct reiserfs_transaction_handle *th, 
+int reiserfs_new_inode (struct reiserfs_transaction_handle *th, 
 				   const struct inode * dir, int mode, 
-				   const char * symname, int item_len,
-				   struct dentry *dentry, struct inode *inode, int * err);
+				   const char * symname, loff_t i_size,
+				   struct dentry *dentry, struct inode *inode);
 int reiserfs_sync_inode (struct reiserfs_transaction_handle *th, struct inode * inode);
 void reiserfs_update_sd (struct reiserfs_transaction_handle *th, struct inode * inode);
 

================================================================


This BitKeeper patch contains the following changesets:
1.389
## Wrapped with gzip_uu ##


begin 664 bkpatch1281
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
%0,T>````
`
end

