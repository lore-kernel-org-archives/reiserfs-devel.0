From: Oleg Drokin <green@namesys.com>
Subject: Re: Problem with ReiserFS + NFS + Convolo
Date: Sat, 14 Jun 2003 16:34:52 +0400
Message-ID: <20030614123452.GA32756@namesys.com>
References: <003001c33270$967bd650$1501a8c0@int.atlassolutions.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Nq2Wo0NMKNjxTN9z"
Return-path: <reiserfs-list-return-14540-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <003001c33270$967bd650$1501a8c0@int.atlassolutions.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oscar Garc?a <ogarcia@atlasit.com>
Cc: reiserfs-list@namesys.com, eramos@atlasit.com

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

He;;p!

On Sat, Jun 14, 2003 at 02:29:21PM +0200, Oscar Garc?a wrote:

> I'm running  a linux cluster with convolo and two nodes. One of the services I offer from this cluster is nfs to a bunch of solaris machines. Now every so often I get an error like this:
> Jun 13 13:29:44 cluster1 kernel: 0: reiserfs_unlink
> Jun 13 13:29:44 cluster1 kernel: reiserfs[3736]: assertion !( !truncate && ( inode -> u.reiserfs_i.i_flags & i_link_saved_un
> link_mask ) ) failed at super.c:238:add_save_link: saved link already exists for unlinked inode c16f7
> And the uptime of the machine begins to go up, and up, and up... As soon as this happens processes begin to get blocked in the wait queue of the kernel, and the machine is still up but gives no service.
> 2x Compaq DL360G2, 2xPIII 14.Ghz, 2Gb RAM, 2x18Gb HDD, 1 QL2000 FC Adapter
> 1x External Storage of 1.4 Tb
> Running RedHat 7.2, kernel 2.4.18 #12 SMP with patches for Convolo 2.0 (www.missioncrtiticallinux.com)

Hm. Sounds like you was bitten by iget4() race bug.
You need to upgrade to 2.4.21 or to apply the patch I am attaching here.

Bye,
    Oleg

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="2420-race-fix.diff"

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

--Nq2Wo0NMKNjxTN9z--
