From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Is it a bug or not?
Date: Tue, 30 Sep 2003 18:35:59 +0400
Message-ID: <200309301835.59782.vitaly@namesys.com>
References: <20030930135949.F318D3984@sitemail.everyone.net>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_PTZe/T4jTO/Bf1I"
Return-path: <reiserfs-list-return-15750-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030930135949.F318D3984@sitemail.everyone.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs@postdienst.net, reiserfs-list@namesys.com, bastian@postdienst.net

--Boundary-00=_PTZe/T4jTO/Bf1I
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 30 September 2003 17:59, Bastian Kruse wrote:
> Hello,
> I have tried:
> dd if=3D/dev/hda bs=3D6400k | gzip -v1 > /windows/bak/hda.img
> After it the reiserfs is broken on /dev/hda3 which is root and I can not
> repair it using reiserfsck --rebuild-tree or --fix-fixable System is as
> follows:

hi,=20

reiserfsck does not allow to fix a mounted filesystem, so you can only=20
check it. to be able to fix such a partition you will need this reiserfspro=
gs=20
patch -- obtain the latest reiserfsprogs please (3.6.11) from our ftp site
and apply the patch.=20
this patch is going to be included into the coming reiserfsprogs pre-releas=
e,
but for now it is not well tested yet.

=2D-=20
Thanks,
Vitaly Fertman

> /dev/hda1 : ntfs
> /dev/hda2 : ntfs
> /dev/hda3 : reiserfs (/)
> /dev/hda4 : swap
> /dev/hdb1 : reiserfs (mounted at /windows/bak/)
> I don=C2=B4t think that I=C2=B4m using the latest reiserfsprogs, as Suse =
8.1 is
> installed. I would like to accent that the problems arise when I reboot
> after I have copied an image to /windows/bak and that no data is written
> back from the image to /dev/hda sofar. Bastian
> P.S. dd if=3D/dev/hda of=3D/dev/hdb bs=3D6400 works great without any pro=
blems.
> Both harddisk can be used as wished containing the same data.
>
> _____________________________________________________________
> Registrieren auch Sie Ihre kostenlose Email-Adresse bei <a
> href=3D"http://www.postdienst.net"
> target=3D"_top">postdienst.net</a><br>Internet-Services by Herbert Krems<=
p><a
> href=3D"http://www.schadenbearbeitung.de"
> target=3D"_top">schadenbearbeitung.de</a><br><a
> href=3D"http://www.praxisleitfaden.de" target=3D"_top">Praxisleitfaden bei
> Versicherungsschaden</a><br><a href=3D"http://www.hilfsprojekte.de"
> target=3D"_top">Private Hilfsprojekte</a><br>

--Boundary-00=_PTZe/T4jTO/Bf1I
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

--Boundary-00=_PTZe/T4jTO/Bf1I--

