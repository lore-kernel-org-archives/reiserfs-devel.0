From: Oleg Drokin <green@namesys.com>
Subject: Re: Problem with ReiserFS + NFS + Convolo
Date: Tue, 17 Jun 2003 14:59:55 +0400
Message-ID: <20030617105955.GB1003@namesys.com>
References: <9985D86E48B29B40BABD3B4A177F69261DD167@atlassrv.int.atlassolutions.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14577-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <9985D86E48B29B40BABD3B4A177F69261DD167@atlassrv.int.atlassolutions.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Enric Ramos <eramos@atlasit.com>
Cc: Oscar Garc?a <ogarcia@atlasit.com>, reiserfs-list@namesys.com

Hello!

On Mon, Jun 16, 2003 at 07:36:25PM +0200, Enric Ramos wrote:

> In this way... is it possible to make a patch for the 2.4.18 release in order to solve the "iget() race bug" ? Do you know if this patch exists for this release ?

Ok, here is the backport.

Bye,
    Oleg
diff -u fs/reiserfs/inode.c.orig fs/reiserfs/inode.c
--- fs/reiserfs/inode.c.orig	2003-06-17 14:47:57.000000000 +0400
+++ fs/reiserfs/inode.c	2003-06-17 14:54:23.000000000 +0400
@@ -19,6 +19,10 @@
 
 static int reiserfs_get_block (struct inode * inode, long block,
 			       struct buffer_head * bh_result, int create);
+/* This spinlock guards inode pkey in private part of inode
+   against race between find_actor() vs reiserfs_read_inode2 */
+static spinlock_t keycopy_lock = SPIN_LOCK_UNLOCKED;
+
 //
 // initially this function was derived from minix or ext2's analog and
 // evolved as the prototype did
@@ -890,8 +894,9 @@
     bh = PATH_PLAST_BUFFER (path);
     ih = PATH_PITEM_HEAD (path);
 
-
+    spin_lock(&keycopy_lock);
     copy_key (INODE_PKEY (inode), &(ih->ih_key));
+    spin_unlock(&keycopy_lock);
     inode->i_blksize = PAGE_SIZE;
 
     INIT_LIST_HEAD(&inode->u.reiserfs_i.i_prealloc_list) ;
@@ -1204,10 +1209,27 @@
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
