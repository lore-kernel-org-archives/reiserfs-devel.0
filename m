From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: ReiserFS is not suitable for a root FS.
Date: Thu, 18 Sep 2003 18:05:33 +0400
Message-ID: <200309181805.33916.vitaly@namesys.com>
References: <200305172030.58775.russell@coker.com.au> <20030517121038.GA929@namesys.com> <3F699BE9.2090101@gmx.net>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_tuba/8kSAgsiPHs"
Return-path: <reiserfs-list-return-15679-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F699BE9.2090101@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, Oleg Drokin <green@linuxhacker.ru>
Cc: Russell Coker <russell@coker.com.au>, ReiserFS <reiserfs-list@namesys.com>

--Boundary-00=_tuba/8kSAgsiPHs
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi, 

On Thursday 18 September 2003 15:50, Carl-Daniel Hailfinger wrote:
> Oleg Drokin wrote:
> > Hello!
> >
> > On Sat, May 17, 2003 at 02:01:00PM +0200, Carl-Daniel Hailfinger wrote:
> >>>>>With a ReiserFS file system you can't FSCK a file system that is
> >>>>> mounted read-only.  This means that when a root file system needs to
> >>>>> be FSCK'd you need to boot from installation media (or convert the
> >>>>> swap space into a temporary root file system).
> >>>>
> >>>>I take this as a feature request. Right? It would certainly be nice to
> >>>>have.
> >>>
> >>>Yes.
> >>
> >>Oleg? Given a statically linked reiserfsck binary completely loaded into
> >>memory and an initrd below the reiserfs root filesystem, it should be
> >>possible to completely unmount the root fs because the initrd is still
> >>there and can serve as root fs.
> >>In this situation, reiserfsck sould have no problems anymore because the
> >>partition is not mounted at all.
> >
> > Initrd is not always present, you know. And sticking 300k (dynamic) or
> > 600k (static) reiserfsck in there is not all that fun probably.
> > Our current idea is to check if fsck is going to repair the
> > mounted partition and if this partition happens to contain the reiserfsck
> > itself, then mlockall() is done to page in all the pages of executable
> > (otherwise if we need to page something in in the middle of updating tree
> > root pointer, we won't be able to find anythig and die) and then proceed
> > as normal.
>
> Any progress on this?
>
> > This is still somewhat risky, though.
> > And if fsck will die in the middle of repairing rootfs (which still can
> > happen) (And say it was doing --rebuild-tree run), you won't be able to
> > mount this fs anymore.

This patch seems to solve the problem, although it is not well tested yet.

-- 
Thanks,
Vitaly Fertman
--Boundary-00=_tuba/8kSAgsiPHs
Content-Type: text/x-diff;
  charset="koi8-r";
  name="mounted_fs_check.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="mounted_fs_check.patch"

===== fsck/main.c 1.68 vs edited =====
--- 1.68/reiserfsprogs/fsck/main.c	Wed Jul 30 12:05:41 2003
+++ edited/fsck/main.c	Thu Sep 18 18:01:18 2003
@@ -9,6 +9,7 @@
 
 #include "../include/config.h"
 #include "../version.h"
+#include <sys/mman.h>
 
 extern int screen_width;
 extern int screen_savebuffer_len;
@@ -742,6 +743,11 @@
 
     mark_filesystem_consistent (fs);
     clear_buffer_do_not_flush (fs->fs_super_bh);
+    
+    if (is_mounted_read_only(fs->fs_file_name)) {
+	reiserfs_warning(stderr, "\nThe partition is mounted ro. It is better "
+			 "to umount and mount it again.\n\n");
+    }
 
     /* write all dirty blocks */
     fsck_progress ("Syncing..");
@@ -751,33 +757,17 @@
     fsck_progress ("finished\n");
 }
 
+extern void prepare_fs_for_check(reiserfs_filsys_t * fs);
 
-static void rebuild_tree (reiserfs_filsys_t * fs)
-{
+static void rebuild_tree (reiserfs_filsys_t * fs) {
     time_t t;
     int ret;
 
-    if (is_mounted (fs->fs_file_name)) {
-	fsck_progress ("rebuild_tree: Cannot rebuild tree of mounted filesystem\n");
-	exit(EXIT_USER);
-    }
-
     init_rollback_file (state_rollback_file(fs), &fs->fs_blocksize, 
 	fsck_data(fs)->log);
     
-    reiserfs_reopen (fs, O_RDWR);
-
-    if (!fsck_skip_journal (fs)) {
-       if (reiserfs_journal_params_check(fs)) {
-	    reiserfs_close(fs);
-	    exit(EXIT_FATAL);
-	}
-
-	/* rebuild starts with journal replaying */
-	if (!fsck_skip_journal (fs))
-	    reiserfsck_replay_journal (fs);
-    }
-
+    prepare_fs_for_check(fs);
+    
     ret = reiserfs_open_ondisk_bitmap (fs);
     if (ret < 0) {
         fsck_progress ("reiserfsck: Could not open bitmap\n");
@@ -821,7 +811,7 @@
     }
 
     close_rollback_file ();
-    
+       
     time (&t);
     fsck_progress ("###########\n"
 		   "reiserfsck finished at %s"
@@ -829,10 +819,8 @@
     exit (EXIT_OK);
 }
 
-
 /* check umounted or read-only mounted filesystems only */
-static void prepare_fs_for_check(reiserfs_filsys_t * fs) 
-{
+void prepare_fs_for_check(reiserfs_filsys_t * fs) {
     /* The method could be called from auto_check already. */
     if (fs->fs_flags == O_RDWR) 
 	return;
@@ -840,20 +828,23 @@
     reiserfs_reopen (fs, O_RDWR);
     
     if (is_mounted (fs->fs_file_name)) {
-	/* filesystem seems mounted. */
-        if (fsck_mode (fs) == FSCK_CLEAN_ATTRIBUTES) {
-	    fsck_progress ("Partition %s is mounted, cannot clean attributes "
-		"on mounted device\n", fs->fs_file_name);
-	    reiserfs_close (fs);
-	    exit(EXIT_USER);
-        }
-
 	if (!is_mounted_read_only (fs->fs_file_name)) {
 	    fsck_progress ("Partition %s is mounted with write permissions, "
 		"cannot check it\n", fs->fs_file_name);
 	    reiserfs_close (fs);
 	    exit(EXIT_USER);
 	}
+	
+	/* If not CHECK mode, lock the process in the memory. */
+	if (fsck_mode (fs) != FSCK_CHECK) {
+	    if (mlockall(MCL_CURRENT)) {
+		    reiserfs_warning (stderr, "Failed to lock the process to "
+				      "fsck the mounted ro partition. %s.\n", 
+				      strerror(errno));
+		    exit(EXIT_OPER);
+	    }
+	}
+	
 	if (!reiserfs_journal_opened (fs)) {
 	    /* just to make sure */
 	    reiserfs_panic ("Journal is not opened");

--Boundary-00=_tuba/8kSAgsiPHs--

