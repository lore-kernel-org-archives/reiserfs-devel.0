From: jeffm@suse.com
Subject: [patch 1/9] [PATCH] reiserfsprogs: QUIET_MODE should silence credits too
Date: Thu, 24 Jan 2008 15:02:27 -0500
Message-ID: <20080124200337.130834000@suse.com>
References: <20080124200226.606635000@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=02-mkreiserfs-quiet.diff
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

 This patch allows -q to silence the output of the credits information.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 mkreiserfs/mkreiserfs.c |   13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

--- a/mkreiserfs/mkreiserfs.c	2004-09-30 17:04:21.000000000 -0400
+++ b/mkreiserfs/mkreiserfs.c	2008-01-24 13:38:26.000000000 -0500
@@ -656,8 +656,10 @@ int main (int argc, char **argv)
 
     print_banner (program_name);
 
-    misc_print_credit(stdout);
-    printf("\n");
+    if (!(mode & QUIET_MODE)) {
+	misc_print_credit(stdout);
+	printf("\n");
+    }
     
     if (mode & QUIET_MODE)
 	fclose(stdout);
@@ -740,7 +742,6 @@ int main (int argc, char **argv)
 
 
     invalidate_other_formats (fs->fs_dev);
-
     zero_journal (fs);
 
     reiserfs_close (fs);
@@ -751,11 +752,7 @@ int main (int argc, char **argv)
  
     if (mode & DEBUG_MODE)
 	return 0;
-    
-    printf("\nTell your friends to use a kernel based on 2.4.18 or "
-	"later, and especially not a\nkernel based on 2.4.9, "
-	"when you use reiserFS. Have fun.\n\n");
-        
+
     printf("ReiserFS is successfully created on %s.\n", device_name);
 
     return 0;


