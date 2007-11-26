From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfsprogs: remove fsck_sleep
Date: Mon, 26 Nov 2007 17:49:53 -0500
Message-ID: <474B4D91.9020005@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward@namesys.com>

 fsck_sleep causes the file descriptors to be kept open during mount.
 Multipath/kpartx doesn't like that.

 Realistically, this optimization has always been suspect. It's useless now
 that we don't load all the bitmaps on mount.

 The previous patch for better fsck -a behavior depends on this one for context.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 utils/fsck/main.c |   17 -----------------
 1 file changed, 17 deletions(-)

--- a/utils/fsck/main.c	2007-11-26 17:47:22.000000000 -0500
+++ b/utils/fsck/main.c	2007-11-26 17:47:44.000000000 -0500
@@ -953,21 +953,6 @@ static void clean_attributes (reiserfs_f
 
 }
 
-/* Do not allow buffers to be flushed after finishing to avoid another bitmap 
- * reading on mounting. */
-static void fsck_sleep() {
-    int res;
-    
-    res = fork();
-    
-    if (res == -1) {
-	reiserfs_panic ("reiserfsck: Fork failed: %s", strerror(errno));
-    } else if (res == 0) {
-	/* Make the child process to sleep for 5 secs. */
-	sleep(5);
-    }
-}
-
 static int auto_check (reiserfs_filsys_t *fs) {
     __u16 state;
     int retval = 0;
@@ -1034,8 +1019,6 @@ static int auto_check (reiserfs_filsys_t
     
     util_device_dma_fini(fs->fs_dev, &dma_info);
     
-    fsck_sleep();
-    
     reiserfs_fs_close (fs);
     /* do not do anything else. */    
     exit (EXIT_OK);

-- 
Jeff Mahoney
SUSE Labs
