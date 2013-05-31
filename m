From: Jeff Mahoney <jeffm@jeffreymahoney.com>
Subject: [PATCH] reiserfs: fix spurious multiple-fill in reiserfs_readdir_dentry
Date: Fri, 31 May 2013 15:07:52 -0400
Message-ID: <51A8F508.30100@jeffreymahoney.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Jan Kara <jack@suse.cz>

After sleeping for filldir(), we check to see if the file system has
changed and research. The next_pos pointer is updated but its value
isn't pushed into the key used for the search itself. As a result,
the search returns the same item that the last cycle of the loop did
and filldir() is called multiple times with the same data.

The end result is that the buffer can contain the same name multiple
times. This can be returned to userspace or used internally in the
xattr code where it can manifest with the following warning:

jdm-20004 reiserfs_delete_xattrs: Couldn't delete all xattrs (-2)

reiserfs_for_each_xattr uses reiserfs_readdir_dentry to iterate over
the xattr names and ends up trying to unlink the same name twice. The
second attempt fails with -ENOENT and the error is returned. At some
point I'll need to add support into reiserfsck to remove the orphaned
directories left behind when this occurs.

The fix is to push the value into the key before researching.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/dir.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/fs/reiserfs/dir.c	2013-05-31 14:29:35.945840685 -0400
+++ b/fs/reiserfs/dir.c	2013-05-31 14:30:05.473952112 -0400
@@ -204,6 +204,8 @@ int reiserfs_readdir_dentry(struct dentr
 				next_pos = deh_offset(deh) + 1;
 
 				if (item_moved(&tmp_ih, &path_to_entry)) {
+					set_cpu_key_k_offset(&pos_key,
+							     next_pos);
 					goto research;
 				}
 			}	/* for */


-- 
Jeff Mahoney
