From: jeffm@suse.com
Subject: [patch 5/9] reiserfsprogs: remove fsck_sleep
Date: Thu, 24 Jan 2008 15:02:31 -0500
Message-ID: <20080124200337.526288000@suse.com>
References: <20080124200226.606635000@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfsprogs-remove-stupid-fsck_sleep.diff
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

 fsck_sleep causes the file descriptors to be kept open during mount.
 Multipath/kpartx doesn't like that.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fsck/main.c |   17 -----------------
 1 file changed, 17 deletions(-)

--- a/fsck/main.c	2004-10-07 10:04:08.000000000 -0400
+++ b/fsck/main.c	2008-01-24 13:39:04.000000000 -0500
@@ -924,21 +924,6 @@ static void clean_attributes (reiserfs_f
 
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
@@ -1005,8 +990,6 @@ static int auto_check (reiserfs_filsys_t
     
     clean_after_dma_check(fs->fs_dev, &dma_info);
     
-    fsck_sleep();
-    
     reiserfs_close (fs);
     /* do not do anything else. */    
     exit (EXIT_OK);


