From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: Fix corruption during shrinking of xattrs
Date: Tue, 13 Apr 2010 15:39:52 -0400
Message-ID: <4BC4C888.9040104@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward.sh>

 Commit 48b32a3553a54740d236b79a90f20147a25875e3 introduced a problem
 that causes corruption when extended attributes are replaced with a
 smaller value.

 The issue is that the reiserfs_setattr to shrink the xattr file was
 moved from before the write to after the write.

 The root issue has always been in the reiserfs xattr code, but was
 papered over by the fact that in the shrink case, the file would just
 be expanded again while the xattr was written.

 The end result is that the last 8 bytes of xattr data are lost.

 This patch fixes it to use new_size.

 This issue was reported at: https://bugzilla.kernel.org/show_bug.cgi?id=14826

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
Cc: stable@kernel.org
---

 fs/reiserfs/xattr.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -553,7 +560,7 @@ reiserfs_xattr_set_handle(struct reiserf
 	if (!err && new_size < i_size_read(dentry->d_inode)) {
 		struct iattr newattrs = {
 			.ia_ctime = current_fs_time(inode->i_sb),
-			.ia_size = buffer_size,
+			.ia_size = new_size,
 			.ia_valid = ATTR_SIZE | ATTR_CTIME,
 		};
 
-- 
Jeff Mahoney
SUSE Labs
