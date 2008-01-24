From: jeffm@suse.com
Subject: [patch 7/9] [PATCH] reiserfsprogs: enforce 2^32-1 block limit
Date: Thu, 24 Jan 2008 15:02:33 -0500
Message-ID: <20080124200337.726114000@suse.com>
References: <20080124200226.606635000@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfsprogs-enforce-block-limit.diff
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

 Currently, mkreiserfs on a block device >= 16 TiB will fail with this error:
 reiserfs_create_journal: cannot create a journal of 8193 blocks with
 18 offset on 0 blocks

 The message doesn't adequately describe that the problem is that reiserfs
 supports file system sizes up to 2^32-1 blocks, and it silently overflows.

 This patch treats the block device size, as well as the <blocks> command
 line parameter as __u64's, so that they can be safely compared to UINT_MAX.

 If the block device is too large, we warn the user, offer to truncate the
 file system to 2^32-1 blocks, and confirm. This is overridable by the -f
 option, which will elect to truncate automatically.

 If the user has specified a block count that is too large, we fail always
 since the user has provided invalid input.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 mkreiserfs/mkreiserfs.c |   41 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

--- a/mkreiserfs/mkreiserfs.c	2008-01-24 13:39:04.000000000 -0500
+++ b/mkreiserfs/mkreiserfs.c	2008-01-24 13:39:05.000000000 -0500
@@ -27,6 +27,7 @@
 #include <stdarg.h>
 #include <string.h>
 #include <errno.h>
+#include <limits.h>
 #include <sys/utsname.h>
 
 #if defined(HAVE_LIBUUID) && defined(HAVE_UUID_UUID_H)
@@ -434,6 +435,21 @@ static int str2int (char * str)
     return val;
 }
 
+static __u64 str2u64 (char *str)
+{
+    __u64 val;
+    char *tmp;
+
+    val = (__u64)strtoll(str, &tmp, 0);
+
+    if (*tmp) {
+	reiserfs_exit (1, "%s: strtoll is unable to make an integer of %s\n",
+		       program_name, str);
+    }
+
+    return val;
+}
+
 
 static void set_block_size (char * str, int *b_size)
 {
@@ -537,7 +553,7 @@ int main (int argc, char **argv)
     int force = 0;
     char * device_name = NULL;
     char * jdevice_name = NULL;
-    unsigned long fs_size = 0;
+    __u64 fs_size = 0;
     int c;
     static int flag;
 
@@ -672,7 +688,7 @@ int main (int argc, char **argv)
     
     if (optind == argc - 2) {
         /* number of blocks for filesystem is specified */
-        fs_size = str2int (argv[optind + 1]);
+        fs_size = str2u64 (argv[optind + 1]);
     } else if (optind == argc - 1) {
         /* number of blocks is not specified */
         if (!(fs_size = count_blocks (device_name, Block_size)))
@@ -681,6 +697,27 @@ int main (int argc, char **argv)
         print_usage_and_exit ();
     }
 
+    if (fs_size >= UINT_MAX) {
+	fprintf(stderr, ">>> ReiserFS supports file systems of up to %u "
+	        "blocks.\n>>> The maximum size with a block size of %u bytes "
+		"is about %Lu MiB.\n>>> This file system would occupy %Lu "
+		"blocks. ", UINT_MAX, Block_size,
+		((__u64)UINT_MAX * Block_size) / (1024 * 1024), fs_size);
+
+	if (optind == argc - 1) {
+	    if (!force &&
+		!user_confirmed (stderr, "Truncate? (y/N): ", "y\n")) {
+		fprintf(stderr, "\nExiting.\n\n");
+		exit(1);
+	    }
+	    fprintf(stderr, "Truncating.\n\n");
+	    fs_size = UINT_MAX;
+	} else {
+	    fprintf(stderr, "Exiting.\n\n");
+	    exit(1);
+	}
+    }
+
     if (is_journal_default (device_name, jdevice_name, Block_size))
         Create_default_journal = 1;
     


