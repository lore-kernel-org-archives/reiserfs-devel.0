From: Jeff Mahoney <jeffm@suse.com>
Subject: reiserfsprogs patches
Date: Tue, 17 Aug 2004 11:59:43 -0400
Message-ID: <41222B6F.4090000@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030509010408090907090304"
Return-path: <reiserfs-list-return-20356-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--------------030509010408090907090304
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Hey all -

The SuSE copy of reiserfsprogs has a number of patches, mostly backports
of fixes. The attached patches are the ones that are fixes, as of
3.6.18, we still apply to our tree and that I feel should be considered
for inclusion in the official reiserfsprogs release.

Here's the rundown:
03-cleanly-unmounted
	- Just a cosmetic fix to change "cleanly umounted" to "clean"
	  in a few warnings

04-quota_sd_blocks-2
	- Fixes fsck incorrectly warning about block counts for
	  symlinks when quotas are enabled

07-auto_quiet.diff
	- Makes -a mode run quietly

10-blkgetsiz64.patch
	- The BLKGETSIZE64 ioctl was, in earlier kernels, incorrectly
	  prototyped with sizeof (__u64), which expanded to
	  sizeof(sizeof (__u64)) - making it a size_t

Please consider applying.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBIitvLPWxlyuTD7IRAjE7AJ9z2MJB7t8W0hTeIwrBs6+nB7XZSACfatiR
HpkOrjjiIUH8qp2g5r3ATCs=
=cn9h
-----END PGP SIGNATURE-----

--------------030509010408090907090304
Content-Type: text/plain;
 name="03-cleanly-unmounted.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="03-cleanly-unmounted.diff"

Index: reiserfsprogs-3.6.13/fsck/main.c
===================================================================
--- reiserfsprogs-3.6.13.orig/fsck/main.c	2004-02-17 07:06:23.000000000 -0500
+++ reiserfsprogs-3.6.13/fsck/main.c	2004-03-08 10:40:14.382396213 -0500
@@ -883,7 +883,7 @@ static void clean_attributes (reiserfs_f
     time (&t);
 
     if (get_sb_umount_state (fs->fs_ondisk_sb) != FS_CLEANLY_UMOUNTED) {
-        fsck_progress ("Filesystem does not look cleanly umounted\n"
+        fsck_progress ("Filesystem is not clean\n"
 	    "Check consistency of the partition first.\n");
         exit(EXIT_USER);
     }
Index: reiserfsprogs-3.6.13/reiserfscore/prints.c
===================================================================
--- reiserfsprogs-3.6.13.orig/reiserfscore/prints.c	2004-02-17 07:06:23.000000000 -0500
+++ reiserfsprogs-3.6.13/reiserfscore/prints.c	2004-03-08 10:41:23.648594772 -0500
@@ -646,7 +646,7 @@ int print_super_block (FILE * fp, reiser
 		      "bitmaps, data, reserved] blocks): %u\n", get_sb_free_blocks (sb));
 	reiserfs_warning (fp, "Root block: %u\n", get_sb_root_block (sb));
     }
-    reiserfs_warning (fp, "Filesystem marked as %scleanly umounted\n",
+    reiserfs_warning (fp, "Filesystem is %sclean\n",
 		      (get_sb_umount_state (sb) == FS_CLEANLY_UMOUNTED) ? "" : "NOT ");
 
     if (short_print)

--------------030509010408090907090304
Content-Type: text/plain;
 name="04-quota_sd_blocks-2.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="04-quota_sd_blocks-2.diff"

diff -ur reiserfsprogs-3.6.4/fsck/semantic_rebuild.c reiserfsprogs-3.6.4.suse/fsck/semantic_rebuild.c
--- reiserfsprogs-3.6.4/fsck/semantic_rebuild.c	2002-09-13 05:41:41.000000000 -0400
+++ reiserfsprogs-3.6.4.suse/fsck/semantic_rebuild.c	2003-02-11 10:36:49.000000000 -0500
@@ -169,7 +169,8 @@
     int ret = 0;
 
     if (S_ISREG (mode) || S_ISLNK (mode) || S_ISDIR (mode)) {
-	if (*blocks != sd_blocks) {
+	if ((!S_ISLNK(mode) && *blocks != sd_blocks) ||
+	    (S_ISLNK(mode) && *blocks != sd_blocks && (ROUND_UP(*blocks) != sd_blocks))) {
 	    fsck_log ("vpf-10680: The %s %K has the wrong block count in the StatData "
 		"(%u)%s(%u)\n", S_ISDIR (mode) ? "directory" : "file",  key, sd_blocks, 
 		fsck_mode(fs) == FSCK_CHECK ? ", should be " : " - corrected to ", *blocks);

--------------030509010408090907090304
Content-Type: text/plain;
 name="07-auto_quiet.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="07-auto_quiet.diff"

--- progs/fsck/main.c.1	2003-09-01 12:44:41.000000000 -0400
+++ progs/fsck/main.c	2003-09-01 12:44:46.000000000 -0400
@@ -230,6 +230,7 @@
 
 	case 'a':
 	case 'p':
+		data->options |= OPT_QUIET;
 		mode = FSCK_AUTO;
 		break;
 	

--------------030509010408090907090304
Content-Type: text/plain;
 name="10-blkgetsiz64.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="10-blkgetsiz64.patch"

--- reiserfsprogs-3.6.13/lib/misc.c.blkgetsiz64	2004-05-18 16:50:47.000000000 +0200
+++ reiserfsprogs-3.6.13/lib/misc.c	2004-05-18 16:53:19.000000000 +0200
@@ -463,7 +463,13 @@
 }
 
 #if defined(__linux__) && defined(_IOR) && !defined(BLKGETSIZE64)
-#   define BLKGETSIZE64 _IOR(0x12, 114, __u64)
+/* Note! Despite this call being called with *64, it must be encoded to
+ * return only sizeof(size_t), since in earlier kernel versions it was
+ * declared _IOR(0x12, 114, sizeof(u64)), making it use sizeof(sizeof(u64)).
+ *
+ * However, the call itself does always return 64bit!
+ */
+#   define BLKGETSIZE64 _IOR(0x12, 114, size_t)
 #endif
 
 /* To not have problem with last sectors on the block device when switching 

--------------030509010408090907090304--
