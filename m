From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] new data logging and quota patches available
Date: 22 Feb 2003 11:12:32 -0500
Message-ID: <1045930351.16042.377.camel@tiny.suse.com>
References: <1045870331.16048.325.camel@tiny.suse.com>
	 <200302221341.23799.Dieter.Nuetzel@hamburg.de>
	 <1045926958.16042.366.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12868-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1045926958.16042.366.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

And here's one more patch for those of you that want to experiment a
little.  reiserfs_dirty_inode gets called to log the inode every time
the vfs layer does an atime/mtime/ctime update, which is one of hte
reasons mounting with -o noatime and -o nodiratime makes things faster. 
We had to do this because otherwise kswapd can end up trying to write
inodes, which can lead to deadlock as he tries to wait on the log.

One of the patches in my data logging directory is kinoded-8, which
changes things so a new kinoded does all inode writeback instead of
kswapd.

That means that if you apply up to 05-data-logging-36 and then apply
09-kinoded-8 (you won't need any of the other quota patches), you can
also apply this patch.  It changes reiserfs to leave inodes dirty, which
saves us lots of time on atime/mtime updates.

I'l upload this after it gets a little additional testing, but wanted to
include it here in case anyone else was interested in benchmarking.

--- linux.suse.1/fs/reiserfs/inode.c	2003-02-20 11:22:08.000000000 -0500
+++ linux.suse/fs/reiserfs/inode.c	2003-02-20 16:13:28.000000000 -0500
@@ -1492,12 +1498,19 @@
 ** does something when called for a synchronous update.
 */
 void reiserfs_write_inode (struct inode * inode, int do_sync) {
-
+    struct reiserfs_transaction_handle th;
     if (inode->i_sb->s_flags & MS_RDONLY) {
         reiserfs_warning("clm-6005: writing inode %lu on readonly FS\n", 
 	                  inode->i_ino) ;
         return ;
     }
+
+    lock_kernel() ;
+    journal_begin(&th, inode->i_sb, 1) ;
+    reiserfs_update_sd (&th, inode);
+    journal_end(&th, inode->i_sb, 1) ;
+    unlock_kernel() ;
+
     /* memory pressure can sometimes initiate write_inode calls with sync == 1,
     ** these cases are just when the system needs ram, not when the 
     ** inode needs to reach disk for safety, and they can safely be
--- linux.suse.1/fs/reiserfs/super.c	2003-02-20 11:22:08.000000000 -0500
+++ linux.suse/fs/reiserfs/super.c	2003-02-20 20:07:06.000000000 -0500
@@ -421,15 +422,18 @@
 	                  inode->i_ino) ;
         return ;
     }
-    lock_kernel() ;
-
-    /* this is really only used for atime updates, so they don't have
-    ** to be included in O_SYNC or fsync
+    /* this is used for atime updates, so they don't have
+    ** to be included in O_SYNC or fsync, but if we are nesting in to
+    ** a transaction, journal_begin/end is free, so we might as well
+    ** log the inode now (plus quota depends on it)
     */
-    journal_begin(&th, inode->i_sb, 1) ;
-    reiserfs_update_sd (&th, inode);
-    journal_end(&th, inode->i_sb, 1) ;
-    unlock_kernel() ;
+    if (reiserfs_transaction_running(inode->i_sb)) {
+	lock_kernel() ;
+	journal_begin(&th, inode->i_sb, 1) ;
+	reiserfs_update_sd (&th, inode);
+	journal_end(&th, inode->i_sb, 1) ;
+	unlock_kernel() ;
+    }
 }
 
 static void reiserfs_clear_inode (struct inode *inode)


 




