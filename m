From: Oleg Drokin <green@namesys.com>
Subject: Re: nfsd-fh: found a name that I didn't expect
Date: Mon, 31 Mar 2003 14:24:06 +0400
Message-ID: <20030331142406.Q25533@namesys.com>
References: <200303281828.55093.bernd-schubert@web.de> <200303291606.54910.bernd-schubert@web.de> <20030329203711.A16762@namesys.com> <200303301708.11703.bernd-schubert@web.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13472-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200303301708.11703.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Schubert <bernd-schubert@web.de>, reiserfs@nn7.de
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Mar 30, 2003 at 04:08:11PM +0100, Bernd Schubert wrote:

> Anyway I also tested the kernel-patch, but it causes problems with mounts from 
> another nfs-server. Well, mounting works fine, but e.g. running 'ls 

Ah, stupid me.
I have another patch that we created before iget5_locked backport.
It's a bit of hack to beat the race, but it works (fixes the race).
It does not touch any code outside of reiserfs.
So if you apply that to 2.4.20 and see if you still can see the NFS problem
over time...
Patch is below.

Bye,
    Oleg

===== fs/reiserfs/inode.c 1.42 vs edited =====
--- 1.42/fs/reiserfs/inode.c	Thu Feb 13 15:42:42 2003
+++ edited/fs/reiserfs/inode.c	Thu Feb 20 17:23:24 2003
@@ -20,6 +20,10 @@
 static int reiserfs_get_block (struct inode * inode, long block,
 			       struct buffer_head * bh_result, int create);
 
+/* This spinlock guards inode pkey in private part of inode
+   against race between find_actor() vs reiserfs_read_inode2 */
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
