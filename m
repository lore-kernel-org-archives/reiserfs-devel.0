From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfsprogs: changes for better external journal defaults
Date: Wed, 23 Nov 2005 19:16:49 -0500
Message-ID: <20051124001649.GA4310@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27122-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>

 Currently, when presented with an external journal device, reiserfsprogs will
 use the entire device. This is fine when the external device is, say, a
 128 MB NVRAM "disk", but when it is another external partition it can
 cause problems on 32-bit machines and 64-bit machines with limited memory
 capacity.

 This patch does a few things, all related:
 * It changes the default external journal size to be journal_default_size,
   just like the internal size.
 * If an external journal device is larger than the used space, it warns
   the user that they are wasting space.
 * Changes the warning re: journal sizes > default size to be more descriptive.
 * Checks to see if the journal size is larger than the max size. If it is
   an error is issued with a description why and instructions to use -f if
   the action is truly desired.
 * Adds a "force" mode to reiserfs_create_journal()

 This may all sound theoretical, but it actually causes machines to crash. We
 recenly saw a bug report where the user chose an external journal device
 of ~ 8 GB. When journal_init() tried to allocate cnodes, it failed silently
 and then panicked the node when it needed to actually use a cnode. A patch
 to address that issue follows.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpx '*~' reiserfsprogs-3.6.19/include/reiserfs_lib.h reiserfsprogs-3.6.19-jeffm/include/reiserfs_lib.h
--- reiserfsprogs-3.6.19/include/reiserfs_lib.h	2004-10-01 12:19:34.000000000 -0400
+++ reiserfsprogs-3.6.19-jeffm/include/reiserfs_lib.h	2005-11-23 18:31:33.000000000 -0500
@@ -346,7 +346,7 @@ int reiserfs_open_journal (reiserfs_fils
 int reiserfs_journal_params_check(reiserfs_filsys_t *fs);
 int reiserfs_create_journal (reiserfs_filsys_t * fs, char * j_filename,
 			     unsigned long offset, unsigned long len, 
-			     int transaction_max_size);
+			     int transaction_max_size, int force);
 int reiserfs_journal_opened (reiserfs_filsys_t *);
 void reiserfs_flush_journal (reiserfs_filsys_t * fs);
 void reiserfs_free_journal (reiserfs_filsys_t * fs);
diff -ruNpx '*~' reiserfsprogs-3.6.19/mkreiserfs/mkreiserfs.c reiserfsprogs-3.6.19-jeffm/mkreiserfs/mkreiserfs.c
--- reiserfsprogs-3.6.19/mkreiserfs/mkreiserfs.c	2004-09-30 17:04:21.000000000 -0400
+++ reiserfsprogs-3.6.19-jeffm/mkreiserfs/mkreiserfs.c	2005-11-23 17:55:08.000000000 -0500
@@ -697,7 +697,7 @@ int main (int argc, char **argv)
     }
 		
     if (!reiserfs_create_journal (fs, jdevice_name, Offset, Journal_size, 
-	Max_trans_size)) 
+	Max_trans_size, force)) 
     {
         return 1;
     }
diff -ruNpx '*~' reiserfsprogs-3.6.19/reiserfscore/journal.c reiserfsprogs-3.6.19-jeffm/reiserfscore/journal.c
--- reiserfsprogs-3.6.19/reiserfscore/journal.c	2004-10-13 09:05:15.000000000 -0400
+++ reiserfsprogs-3.6.19-jeffm/reiserfscore/journal.c	2005-11-23 18:53:25.000000000 -0500
@@ -545,7 +545,8 @@ int reiserfs_create_journal(
     char * j_device,		/* journal device name */
     unsigned long offset,	/* journal offset on the j_device */
     unsigned long len,		/* including journal header */
-    int transaction_max_size)
+    int transaction_max_size,
+    int force)
 {
     struct stat st;
     struct buffer_head * bh;
@@ -596,21 +597,46 @@ int reiserfs_create_journal(
 		    "%lu, blocks on device %lu\n", offset, blocks);
 		return 0;
 	    }
-	    len = blocks - offset;
+	    /* XXX jdm: This can end up being huge and could result
+	     * in an unmountable file system:
+	     * len = blocks - offset; */
+	    len = journal_default_size(fs->fs_super_bh->b_blocknr, 
+	                               fs->fs_blocksize) + 1;
+
 	}
 
-	if (len > journal_default_size (fs->fs_super_bh->b_blocknr, 
+	if (!force && len > journal_default_size (fs->fs_super_bh->b_blocknr, 
 	    fs->fs_blocksize) + 1) 
 	{
+	    unsigned long journal_max = journal_max_size (fs->fs_super_bh->b_blocknr, fs->fs_blocksize);
 	    fflush(stderr);
 	    
-	    reiserfs_warning (stdout, "NOTE: journal new size %lu is greater "
-		"than default size %lu:\nthis may slow down initializing and "
-		"mounting of the journal. Hope it is ok.\n\n", len, 
-		journal_default_size(fs->fs_super_bh->b_blocknr, 
-		fs->fs_blocksize) + 1);
+	    reiserfs_warning (stdout, "\n*** You've specified a journal "
+	                      "size larger than the default size of "
+	                      "%lu\n*** blocks. This may slow down "
+	                      "journal initialization and mounting "
+	                      "of\n*** the file system.%s",
+	                      journal_default_size(fs->fs_super_bh->b_blocknr, fs->fs_blocksize) + 1,
+	                      len > journal_max ? " " : "\n");
+	    if (len > journal_max)
+		reiserfs_warning (stdout, "On 32-bit systems, and on "
+		                  "64-bit systems with\n*** limited "
+		                  "memory, this may also cause the file "
+		                  "system to be unmountable.\n*** Please "
+		                  "consider using a journal size "
+		                  "<= %lu blocks.\n\nFile system creation "
+				  "failed. You may override this behavior "
+				  "with the -f option.\n", journal_max);
+		    return 0;
 	}
 
+	if (len < blocks)
+		reiserfs_warning (stdout, "\n\n*** Your journal device is %lu "
+		                  "blocks, but your journal is only %lu "
+				  "blocks.\n*** You may want to consider "
+				  "resizing the journal device to avoid "
+				  "wasting space.\n\n", blocks, len);
+
 	if (blocks < offset + len) {
 	    reiserfs_warning (stderr, "reiserfs_create_journal: no enough "
 		"blocks on device %lu, needed %lu\n", blocks, offset + len);
diff -ruNpx '*~' reiserfsprogs-3.6.19/tune/tune.c reiserfsprogs-3.6.19-jeffm/tune/tune.c
--- reiserfsprogs-3.6.19/tune/tune.c	2004-08-19 07:23:57.000000000 -0400
+++ reiserfsprogs-3.6.19-jeffm/tune/tune.c	2005-11-23 18:33:09.000000000 -0500
@@ -710,7 +710,7 @@ int main (int argc, char **argv)
     reiserfs_close_journal (fs);
 
     if (!reiserfs_create_journal (fs, j_new_device_name, Offset,
-				  Journal_size, Max_trans_size)) {
+				  Journal_size, Max_trans_size, Force)) {
 	message ("Could not create new journal");
 	reiserfs_close (fs);
         return 1;
-- 
Jeff Mahoney
SuSE Labs
