From: Oleg Drokin <green@namesys.com>
Subject: Re: Data-logging and md as / fs bug
Date: Tue, 13 May 2003 18:25:01 +0400
Message-ID: <20030513142501.GI12963@namesys.com>
References: <3EB30852.6090402@netscape.net> <200305062134.42520.christian.mayrhuber@gmx.net> <1052250298.14612.235.camel@tiny.suse.com> <200305062156.27595.Dieter.Nuetzel@hamburg.de> <1052400685.14617.489.camel@tiny.suse.com> <20030512072943.GA21604@namesys.com> <3EC0FE02.9030007@netscape.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14090-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EC0FE02.9030007@netscape.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuelkrause@netscape.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Tue, May 13, 2003 at 04:15:30PM +0200, Manuel Krause wrote:

> Do you have something new to try? Does this original patch affect disk 
> i/o perfomance (positive/negative)?

No. I have old patch instead that applies to 2.4.20 and basically every other kernel
and that I am pushing to Marchelo as this iget5_locked is too intrusive at current 2.4
development stage.
This old patch is attached.

> Always appreciated are less intrusive ones regarding i/o speed ;-))

I/O speed should be the same with all the aproaches.
The patch below is a bit more cpu hungry as it introduces one more spinlock.

Bye,
    Oleg
# This is a BitKeeper generated patch for the following project:
# Project Name: Linux kernel tree
# This patch format is intended for GNU patch command version 2.5 or higher.
# This patch includes the following deltas:
#	           ChangeSet	1.1209  -> 1.1210 
#	 fs/reiserfs/inode.c	1.42    -> 1.43   
#
# The following is the BitKeeper ChangeSet Log
# --------------------------------------------
# 03/05/12	green@angband.namesys.com	1.1210
# reiserfs: iget4() race fix
# --------------------------------------------
#
diff -Nru a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
--- a/fs/reiserfs/inode.c	Tue May 13 18:24:37 2003
+++ b/fs/reiserfs/inode.c	Tue May 13 18:24:37 2003
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
