From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: fix deadlock in inode creation failure path w/ default ACL
Date: Mon, 18 Jul 2005 13:31:04 -0400
Message-ID: <20050718173104.GA23135@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25179-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

 reiserfs_new_inode() can call iput() with the xattr lock held. This will
 cause a deadlock to occur when reiserfs_delete_xattrs() is called to
 clean up.

 The following patch releases the lock and reacquires it after the iput. This
 is safe because interaction with xattrs is complete, and the relock is just
 to balance out the release in the caller.

 The locking needs some reworking to be more sane, but that's more intrusive
 and I was just looking to fix this bug.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX dontdiff linux-2.6.13-rc3/fs/reiserfs/inode.c linux-2.6.13-rc3.errors/fs/reiserfs/inode.c
--- linux-2.6.13-rc3.1/fs/reiserfs/inode.c	2005-07-14 19:43:14.000000000 -0400
+++ linux-2.6.13-rc3.2/fs/reiserfs/inode.c	2005-07-18 15:21:32.000000000 -0400
@@ -1980,7 +1978,17 @@ int reiserfs_new_inode(struct reiserfs_t
       out_inserted_sd:
 	inode->i_nlink = 0;
 	th->t_trans_id = 0;	/* so the caller can't use this handle later */
-	iput(inode);
+	
+	/* If we were inheriting an ACL, we need to release the lock so that
+	 * iput doesn't deadlock in reiserfs_delete_xattrs. The locking
+	 * code really needs to be reworked, but this will take care of it 
+	 * for now. -jeffm */
+	if (REISERFS_I(dir)->i_acl_default) {
+		reiserfs_write_unlock_xattrs(dir->i_sb);
+		iput(inode);
+		reiserfs_write_lock_xattrs(dir->i_sb);
+	} else
+		iput(inode);
 	return err;
 }
 
-- 
Jeff Mahoney
SuSE Labs
