From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfsprogs: fix use after free with fsck_progress
Date: Thu, 15 Apr 2010 17:48:50 -0400
Message-ID: <4BC789C2.4030207@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward.shishkin@gmail.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

 fsck_progress uses fs to get the log file handle but fs is freed before
 fsck_progress is caleld when it's about to print the "finished" message.

 When glibc is run with:
 MALLOC_CHECK_=3
 MALLOC_PERTURB_=69

 as is the default on newer versions of openSUSE, it poisons freed memory
 to detect conditions like this. As a result, reiserfsck segfaults on these
 systems.

 This patch fixes fsck to close the file system after printing the completion
 message.

 Edward, I'm working on adding support to check extended attributes, so please
 hold off on an update until I post those patches early next week.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
- ---
 fsck/main.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

- --- a/fsck/main.c
+++ b/fsck/main.c
@@ -782,8 +782,8 @@ static int the_end (reiserfs_filsys_t *
     fsck_progress ("Syncing..");
     fs->fs_dirt = 1;
     clean_after_dma_check(fs->fs_dev, &dma_info);
- -    reiserfs_close (fs);
     fsck_progress ("finished\n");
+    reiserfs_close (fs);
 
     return ret;
 }
@@ -935,12 +935,12 @@ static void clean_attributes (reiserfs_f
     do_clean_attributes (fs);
 
     clean_after_dma_check(fs->fs_dev, &dma_info);
- -    reiserfs_close (fs);
- -    close_rollback_file ();
 
     fsck_progress ("###########\n"
 		   "reiserfsck finished at %s"
 		   "###########\n", ctime (&t));
+    reiserfs_close (fs);
+    close_rollback_file ();
 
     exit (EXIT_FIXED);
 
@@ -1171,8 +1171,6 @@ static void check_fs (reiserfs_filsys_t
         
     id_map_free(proper_id_map (fs));
     clean_after_dma_check(fs->fs_dev, &dma_info);
- -    reiserfs_close (fs);
- -    close_rollback_file ();
     
     //clear_relocated_list();    
     
@@ -1181,6 +1179,8 @@ static void check_fs (reiserfs_filsys_t
 		   "reiserfsck finished at %s"
 		   "###########\n", ctime (&t));
 
+    reiserfs_close (fs);
+    close_rollback_file ();
     exit(retval);
 }
 
- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAkvHicIACgkQLPWxlyuTD7JeKQCffKg7XjQMpddTtn9okQj1rntH
OOEAnjRn3heRzXPgckhl7g219rFNoFXp
=J7WL
-----END PGP SIGNATURE-----
