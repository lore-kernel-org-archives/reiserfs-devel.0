From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH v2] reiserfs: fix race in readdir
Date: Wed, 02 Apr 2014 14:40:26 -0400
Message-ID: <533C599A.9010503@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>

jdm-20004 reiserfs_delete_xattrs: Couldn't delete all xattrs (-2)

The -ENOENT is due to readdir calling dir_emit on the same entry twice.

If the dir_emit callback sleeps and the tree is changed underneath us,
we won't be able to trust deh_offset(deh) anymore. We need to save
next_pos before we might sleep so we can find the next entry.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/dir.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- a/fs/reiserfs/dir.c
+++ b/fs/reiserfs/dir.c
@@ -125,6 +125,7 @@ int reiserfs_readdir_inode(struct inode
 				int d_reclen;
 				char *d_name;
 				ino_t d_ino;
+				loff_t cur_pos = deh_offset(deh);
 
 				if (!de_visible(deh))
 					/* it is hidden entry */
@@ -196,8 +197,9 @@ int reiserfs_readdir_inode(struct inode
 				if (local_buf != small_buf) {
 					kfree(local_buf);
 				}
-				// next entry should be looked for with such offset
-				next_pos = deh_offset(deh) + 1;
+
+				/* deh_offset(deh) may be invalid now. */
+				next_pos = cur_pos + 1;
 
 				if (item_moved(&tmp_ih, &path_to_entry)) {
 					set_cpu_key_k_offset(&pos_key,

-- 
Jeff Mahoney
SUSE Labs
