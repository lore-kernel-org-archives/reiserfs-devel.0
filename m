From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: discard prealloc in reiserfs_delete_inode
Date: Tue, 08 Jul 2008 14:37:06 -0400
Message-ID: <4873B3D2.1090101@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

 With the removal of struct file from the xattr code, reiserfs_file_release()
 isn't used anymore, so the prealloc isn't discarded. This causes hangs
 later down the line.

 This patch adds it to reiserfs_delete_inode. In most cases it will be
 a no-op due to it already having been called, but will avoid hangs with xattrs.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/inode.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -45,6 +45,8 @@ void reiserfs_delete_inode(struct inode
 			goto out;
 		reiserfs_update_inode_transaction(inode);
 
+		reiserfs_discard_prealloc(&th, inode);
+
 		err = reiserfs_delete_object(&th, inode);
 
 		/* Do quota update inside a transaction for journaled quotas. We must do that

-- 
Jeff Mahoney
SUSE Labs
