From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.9 122/125] reiserfs: Dont clear SGID when inheriting ACLs
Date: Tue, 25 Jul 2017 12:20:37 -0700
Message-ID: <20170725192020.989072075@linuxfoundation.org>
References: <20170725192014.314851996@linuxfoundation.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170725192014.314851996@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>

4.9-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Jan Kara <jack@suse.cz>

commit 6883cd7f68245e43e91e5ee583b7550abf14523f upstream.

When new directory 'DIR1' is created in a directory 'DIR0' with SGID bit
set, DIR1 is expected to have SGID bit set (and owning group equal to
the owning group of 'DIR0'). However when 'DIR0' also has some default
ACLs that 'DIR1' inherits, setting these ACLs will result in SGID bit on
'DIR1' to get cleared if user is not member of the owning group.

Fix the problem by moving posix_acl_update_mode() out of
__reiserfs_set_acl() into reiserfs_set_acl(). That way the function will
not be called when inheriting ACLs which is what we want as it prevents
SGID bit clearing and the mode has been properly set by
posix_acl_create() anyway.

Fixes: 073931017b49d9458aa351605b43a7e34598caef
CC: reiserfs-devel@vger.kernel.org
Signed-off-by: Jan Kara <jack@suse.cz>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 fs/reiserfs/xattr_acl.c |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

--- a/fs/reiserfs/xattr_acl.c
+++ b/fs/reiserfs/xattr_acl.c
@@ -37,7 +37,14 @@ reiserfs_set_acl(struct inode *inode, st
 	error = journal_begin(&th, inode->i_sb, jcreate_blocks);
 	reiserfs_write_unlock(inode->i_sb);
 	if (error == 0) {
+		if (type == ACL_TYPE_ACCESS && acl) {
+			error = posix_acl_update_mode(inode, &inode->i_mode,
+						      &acl);
+			if (error)
+				goto unlock;
+		}
 		error = __reiserfs_set_acl(&th, inode, type, acl);
+unlock:
 		reiserfs_write_lock(inode->i_sb);
 		error2 = journal_end(&th);
 		reiserfs_write_unlock(inode->i_sb);
@@ -241,11 +248,6 @@ __reiserfs_set_acl(struct reiserfs_trans
 	switch (type) {
 	case ACL_TYPE_ACCESS:
 		name = XATTR_NAME_POSIX_ACL_ACCESS;
-		if (acl) {
-			error = posix_acl_update_mode(inode, &inode->i_mode, &acl);
-			if (error)
-				return error;
-		}
 		break;
 	case ACL_TYPE_DEFAULT:
 		name = XATTR_NAME_POSIX_ACL_DEFAULT;


