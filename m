From: jeffm@suse.com
Subject: [patch 2/9] [PATCH] reiserfsprogs: Warn on block sizes > 4k
Date: Thu, 24 Jan 2008 15:02:28 -0500
Message-ID: <20080124200337.229383000@suse.com>
References: <20080124200226.606635000@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs-large-block-warning.diff
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

 Filesystems created with block size > page size will not work until that
 support is added to the kernel. Filesystems with block size > 4k (lowest
 page size supported in Linux) will not work on all systems. This patch
 adds a check and a warning in those conditions, informing the user of the
 caveats of using a larger block size. It can be overridden with -f.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 mkreiserfs/mkreiserfs.c    |    3 +++
 reiserfscore/reiserfslib.c |   18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

--- a/mkreiserfs/mkreiserfs.c	2008-01-24 13:38:26.000000000 -0500
+++ b/mkreiserfs/mkreiserfs.c	2008-01-24 13:39:03.000000000 -0500
@@ -686,6 +686,9 @@ int main (int argc, char **argv)
     
     if (!(mode & QUIET_MODE) && !can_we_format_it (device_name, force))
         return 1;
+
+    if (!(mode & QUIET_MODE) && !block_size_ok (Block_size, force))
+        return 1;
 	
     if (jdevice_name)
         if (!(mode & QUIET_MODE) && !can_we_format_it (jdevice_name, force))
--- a/reiserfscore/reiserfslib.c	2004-10-04 16:39:35.000000000 -0400
+++ b/reiserfscore/reiserfslib.c	2008-01-24 13:39:03.000000000 -0500
@@ -1175,6 +1175,24 @@ void make_sure_root_dir_exists (reiserfs
     		&parent_root_dir_key, ih_flags);
 }
 
+int block_size_ok (int blocksize, int force)
+{
+    int pagesize = getpagesize();
+    if (blocksize > 4096) {
+        reiserfs_warning (stderr, "Block sizes larger than 4k are not "
+                          "supported on all architectures.\n");
+        if (blocksize > pagesize)
+            reiserfs_warning (stderr, "The newly created filesystem will not "
+                              "be mountable on this system.\n");
+        else
+            reiserfs_warning (stderr, "The newly created filesystem may not "
+                              "be mountable on other systems.\n");
+        check_forcing_ask_confirmation (force);
+    }
+
+    return 1;
+}
+
 
 /* we only can use a file for filesystem or journal if it is either not
    mounted block device or regular file and we are forced to use it */


