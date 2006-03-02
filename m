From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: reiserfs_file_write will lose error code when a 0-length write occurs w/ O_SYNC
Date: Thu, 2 Mar 2006 16:09:49 -0500
Message-ID: <20060302210947.GA16696@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932542AbWCBVJv@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: ReiserFS List <reiserfs-list@namesys.com>

 When an error occurs in reiserfs_file_write before any data is written, and
 O_SYNC is set, the return code of generic_osync_write will overwrite the
 error code, losing it.

 This patch ensures that generic_osync_inode() doesn't run under an error
 condition, losing the error. This duplicates the logic from
 generic_file_buffered_write().

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX dontdiff linux-2.6.15/fs/reiserfs/file.c linux-2.6.15.reiserfs/fs/reiserfs/file.c
--- linux-2.6.15/fs/reiserfs/file.c	2006-03-02 12:10:04.000000000 -0500
+++ linux-2.6.15.reiserfs/fs/reiserfs/file.c	2006-03-02 16:08:49.000000000 -0500
@@ -1563,10 +1563,10 @@ static ssize_t reiserfs_file_write(struc
 		}
 	}
 
-	if ((file->f_flags & O_SYNC) || IS_SYNC(inode))
-		res =
-		    generic_osync_inode(inode, file->f_mapping,
-					OSYNC_METADATA | OSYNC_DATA);
+	if (likely(res >= 0) &&
+	    (unlikely((file->f_flags & O_SYNC) || IS_SYNC(inode))))
+		res = generic_osync_inode(inode, file->f_mapping,
+		                          OSYNC_METADATA | OSYNC_DATA);
 
 	mutex_unlock(&inode->i_mutex);
 	reiserfs_async_progress_wait(inode->i_sb);
-- 
Jeff Mahoney
SuSE Labs
