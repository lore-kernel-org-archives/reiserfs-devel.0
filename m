From: Jan Kara <jack@suse.cz>
Subject: [PATCH] Fix reiserfs deadlock
Date: Fri, 21 Apr 2006 19:00:30 +0200
Message-ID: <20060421170030.GB8151@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28520-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@osdl.org
Cc: reiserfs-list@namesys.com

  Hello!

  the patch below fixes potential deadlock in reiserfs code. The problem
is we can sometimes return 1 even if we did not manage to find the
xattr. Later we take the xattr lock because the function returned 1.
But then the code in the error path of reiserfs_new_inode() checks
i_default_acl and because it is not set it assumes we have not taken
the lock and tries to retake it -> deadlock.
  Jeff has larger rewrite of the xattr locking but it will take some
time before it will be accepted so this could be used as a temporary
fix. Andrew, please apply.

								Honza

-- 
Jan Kara <jack@suse.cz>
SuSE CR Labs

reiserfs_cache_default_acl() should return whether we successfully found the
acl or not. We have to return correct value even if reiserfs_get_acl() returns
error code and not just 0. Otherwise callers such as reiserfs_mkdir() can
unnecessarily lock the xattrs and later functions such as reiserfs_new_inode()
fail to notice that we have already taken the lock and try to take it again
with obvious consequences.

Signed-off-by: Jan Kara <jack@suse.cz>

diff -rupX /home/jack/.kerndiffexclude linux-2.6.5-SLES9_SP3_BRANCH/fs/reiserfs/xattr_acl.c linux-2.6.5-SLES9_SP3_BRANCH-1-reiser_xattr_fix/fs/reiserfs/xattr_acl.c
--- linux-2.6.5-SLES9_SP3_BRANCH/fs/reiserfs/xattr_acl.c	2006-01-21 03:02:06.000000000 +0100
+++ linux-2.6.5-SLES9_SP3_BRANCH-1-reiser_xattr_fix/fs/reiserfs/xattr_acl.c	2006-01-21 09:09:04.000000000 +0100
@@ -410,8 +410,10 @@ reiserfs_cache_default_acl (struct inode
         acl = reiserfs_get_acl (inode, ACL_TYPE_DEFAULT);
         reiserfs_read_unlock_xattrs (inode->i_sb);
         reiserfs_read_unlock_xattr_i (inode);
-        ret = acl ? 1 : 0;
+	if (!acl || IS_ERR(acl))
+		return 0;
         posix_acl_release (acl);
+	ret = 1;
     }
 
     return ret;
