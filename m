From: Oleg Drokin <green@namesys.com>
Subject: About direntries pointing to nowhere on reiserfs problem in 2.4
Date: Thu, 20 Feb 2003 17:53:09 +0300
Message-ID: <20030220175309.A23616@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12848-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
Resent-To: reiserfs-list@namesys.com
Resent-Message-Id: <20030220145724.1BD52482413@angband.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mason@suse.com, alan@lxorguk.ukuu.org.uk, reiserfs-list@namesys.com, sam@vilain.net, akpm@digeo.com, vs@namesys.com, nikita@namesys.com

Hello!

    Vladimir have finally tracked the problem to a race between
    two iget4 running on same file whose inode is not in cache.
    The sequence of events is like this (UP case):
1st thread:
    take inode_lock
    search through inode cache, but found nothing.
    alloc new inode, mark it as locaked.
    release inode_lock
    call reiserfs_read_inode2().
         do some stuff.
         call search_by_key()
         schedule()

Now 2nd thread comes in:
    take inode_lock
    search through inode cache, found inode with same inode number.
    check that there is find_actor defined for reiserfs.
    call find_actor()
         check that inode's primary key's dir_id is equal to expected one.
               but at that time this part of inode is uninitialized yet!
               so we return 0;
    ... 
    And we create second inode for the same file.

   This scenario seems possible for any filesystem that stores some "cookie" 
   in private part of inode and whose read_inode2 can schedule. We checked and
   coda seems safe because they take a semaphore in iget().

   So we solved that with patch below (Zygo, others who think they have this problem,
   please check).

   But Vladimir is really unhappy with that comparison with zero and guessing (though
   he agrees it is correct, if FS is undamaged).

   Andrew, Alan: Is there a possibility to have iget5_locked() kind of interface
   in 2.4? We need some way to init parts inode under inode_lock to solve this problem
   in more elegant way. (and inode_lock is not even exported, so I invented another spinlock
   to guard atomicity of inode pkey update on SMP).

Bye,
    Oleg

===== fs/reiserfs/inode.c 1.42 vs edited =====
--- 1.42/fs/reiserfs/inode.c	Thu Feb 13 15:42:42 2003
+++ edited/fs/reiserfs/inode.c	Thu Feb 20 17:23:24 2003
@@ -20,6 +20,10 @@
 static int reiserfs_get_block (struct inode * inode, long block,
 			       struct buffer_head * bh_result, int create);
 
+/* This spinlock guards inode pkey in private part of inode
+   against rae between find_actor() vs reiserfs_read_inode2 */
+static spinlock_t keycopy_lock = SPIN_LOCK_UNLOCKED;
+
 void reiserfs_delete_inode (struct inode * inode)
 {
     int jbegin_count = JOURNAL_PER_BALANCE_CNT * 2; 
@@ -898,8 +902,9 @@
     bh = PATH_PLAST_BUFFER (path);
     ih = PATH_PITEM_HEAD (path);
 
-
+    spin_lock(&keycopy_lock);
     copy_key (INODE_PKEY (inode), &(ih->ih_key));
+    spin_unlock(&keycopy_lock);
     inode->i_blksize = PAGE_SIZE;
 
     INIT_LIST_HEAD(&inode->u.reiserfs_i.i_prealloc_list) ;
@@ -1220,10 +1225,27 @@
 				unsigned long inode_no, void *opaque )
 {
     struct reiserfs_iget4_args *args;
+    int retval;
 
     args = opaque;
+    /* We protect against possible parallel init_inode() on another CPU here. */
+    spin_lock(&keycopy_lock);
     /* args is already in CPU order */
-    return le32_to_cpu(INODE_PKEY(inode)->k_dir_id) == args -> objectid;
+    if (le32_to_cpu(INODE_PKEY(inode)->k_dir_id) == args -> objectid)
+	retval = 1;
+    else
+	/* If The key does not match, lets see if we are racing
+	   with another iget4, that already progressed so far
+	   to reiserfs_read_inode2() and was preempted in
+	   call to search_by_key(). The signs of that are:
+	     Inode is locked
+	     dirid and object id are zero (not yet initialized)*/
+	retval = (inode->i_state & I_LOCK) &&
+		 !INODE_PKEY(inode)->k_dir_id &&
+		 !INODE_PKEY(inode)->k_objectid;
+
+    spin_unlock(&keycopy_lock);
+    return retval;
 }
 
 struct inode * reiserfs_iget (struct super_block * s, const struct cpu_key * key)

