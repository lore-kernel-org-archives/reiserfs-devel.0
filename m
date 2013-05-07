From: Jiri Slaby <jslaby@suse.cz>
Subject: [PATCH 08/15] reiserfs: fix deadlock with nfs racing on create/lookup
Date: Tue,  7 May 2013 16:18:16 +0200
Message-ID: <1367936303-13386-8-git-send-email-jslaby@suse.cz>
References: <1367936303-13386-1-git-send-email-jslaby@suse.cz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1367936303-13386-1-git-send-email-jslaby@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jirislaby@gmail.com
Cc: linux-kernel@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>, Jiri Slaby <jslaby@suse.cz>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, reiserfs-devel@vger.kernel.org

From: Jeff Mahoney <jeffm@suse.com>

Reiserfs is currently able to be deadlocked by having two NFS clients
where one has removed and recreated a file and another is accessing the
file with an open file handle.

If one client deletes and recreates a file with timing such that the
recreated file obtains the same [dirid, objectid] pair as the original
file while another client accesses the file via file handle, the create
and lookup can race and deadlock if the lookup manages to create the
in-memory inode first.

The create thread, in insert_inode_locked4, will hold the write lock
while waiting on the other inode to be unlocked. The lookup thread,
anywhere in the iget path, will release and reacquire the write lock while
it schedules. If it needs to reacquire the lock while the create thread
has it, it will never be able to make forward progress because it needs
to reacquire the lock before ultimately unlocking the inode.

This patch drops the write lock across the insert_inode_locked4 call so
that the ordering of inode_wait -> write lock is retained. Since this
would have been the case before the BKL push-down, this is safe.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: linux-fsdevel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: reiserfs-devel@vger.kernel.org
---
 fs/reiserfs/inode.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 77d6d47..f844533 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -1811,11 +1811,16 @@ int reiserfs_new_inode(struct reiserfs_transaction_handle *th,
 				  TYPE_STAT_DATA, SD_SIZE, MAX_US_INT);
 	memcpy(INODE_PKEY(inode), &(ih.ih_key), KEY_SIZE);
 	args.dirid = le32_to_cpu(ih.ih_key.k_dir_id);
-	if (insert_inode_locked4(inode, args.objectid,
-			     reiserfs_find_actor, &args) < 0) {
+
+	reiserfs_write_unlock(inode->i_sb);
+	err = insert_inode_locked4(inode, args.objectid,
+			     reiserfs_find_actor, &args);
+	reiserfs_write_lock(inode->i_sb);
+	if (err) {
 		err = -EINVAL;
 		goto out_bad_inode;
 	}
+
 	if (old_format_only(sb))
 		/* not a perfect generation count, as object ids can be reused, but
 		 ** this is as good as reiserfs can do right now.
-- 
1.8.2.1
