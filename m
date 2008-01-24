From: jeffm@suse.com
Subject: [patch 6/9] reiserfsprogs: mkfs should use O_EXCL
Date: Thu, 24 Jan 2008 15:02:32 -0500
Message-ID: <20080124200337.628552000@suse.com>
References: <20080124200226.606635000@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfsprogs-mkfs-use-o_excl.diff
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

 This patch forces reiserfs_create to open the device exclusively.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 reiserfscore/reiserfslib.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/reiserfscore/reiserfslib.c	2008-01-24 13:39:03.000000000 -0500
+++ b/reiserfscore/reiserfslib.c	2008-01-24 13:39:04.000000000 -0500
@@ -206,7 +206,7 @@ reiserfs_filsys_t * reiserfs_create (cha
 	return 0;
     }
 
-    fs->fs_dev = open (filename, O_RDWR 
+    fs->fs_dev = open (filename, O_RDWR | O_EXCL
 #if defined(O_LARGEFILE)
 		       | O_LARGEFILE
 #endif


