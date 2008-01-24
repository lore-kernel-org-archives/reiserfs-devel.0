From: jeffm@suse.com
Subject: [patch 4/9] [PATCH] reiserfsprogs: changes for better external journal defaults
Date: Thu, 24 Jan 2008 15:02:30 -0500
Message-ID: <20080124200337.426568000@suse.com>
References: <20080124200226.606635000@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfsprogs-external-journal-changes.diff
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

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
---
 include/reiserfs_lib.h  |    2 +-
 mkreiserfs/mkreiserfs.c |    2 +-
 reiserfscore/journal.c  |   42 ++++++++++++++++++++++++++++++++++--------
 tune/tune.c             |    2 +-
 4 files changed, 37 insertions(+), 11 deletions(-)

--- a/include/reiserfs_lib.h	2004-10-01 12:19:34.000000000 -0400
+++ b/include/reiserfs_lib.h	2008-01-24 13:39:04.000000000 -0500
@@ -346,7 +346,7 @@ int reiserfs_open_journal (reiserfs_fils
 int reiserfs_journal_params_check(reiserfs_filsys_t *fs);
 int reiserfs_create_journal (reiserfs_filsys_t * fs, char * j_filename,
 			     unsigned long offset, unsigned long len, 
-			     int transaction_max_size);
+			     int transaction_max_size, int force);
 int reiserfs_journal_opened (reiserfs_filsys_t *);
 void reiserfs_flush_journal (reiserfs_filsys_t * fs);
 void reiserfs_free_journal (reiserfs_filsys_t * fs);
--- a/mkreiserfs/mkreiserfs.c	2008-01-24 13:39:03.000000000 -0500
+++ b/mkreiserfs/mkreiserfs.c	2008-01-24 13:39:04.000000000 -0500
@@ -702,7 +702,7 @@ int main (int argc, char **argv)
     }
 		
     if (!reiserfs_create_journal (fs, jdevice_name, Offset, Journal_size, 
-	Max_trans_size)) 
+	Max_trans_size, force))
     {
         return 1;
     }
--- a/reiserfscore/journal.c	2004-10-13 09:05:15.000000000 -0400
+++ b/reiserfscore/journal.c	2008-01-24 13:39:04.000000000 -0500
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
--- a/tune/tune.c	2004-08-19 07:23:57.000000000 -0400
+++ b/tune/tune.c	2008-01-24 13:39:04.000000000 -0500
@@ -710,7 +710,7 @@ int main (int argc, char **argv)
     reiserfs_close_journal (fs);
 
     if (!reiserfs_create_journal (fs, j_new_device_name, Offset,
-				  Journal_size, Max_trans_size)) {
+				  Journal_size, Max_trans_size, Force)) {
 	message ("Could not create new journal");
 	reiserfs_close (fs);
         return 1;


