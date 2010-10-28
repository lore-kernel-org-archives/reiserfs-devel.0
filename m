From: Jan Kara <jack@suse.cz>
Subject: [PATCH] reiserfs: Fix locking in reiserfs_quota_on()
Date: Thu, 28 Oct 2010 02:28:23 +0200
Message-ID: <1288225703-8170-1-git-send-email-jack@suse.cz>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>, Jan Kara <jack@suse.cz>

reiserfs_quota_on() unpacks a tail of quota file in case it has one. But after
BKL conversion, reiserfs_unpack() expects to be called with write_lock held.
So acquire the lock before calling reiserfs_unpack() to avoid assertion
failures.

Reported-by: markus.gapp@gmx.net
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/super.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

 Frederic, would you merge this patch or should I merge it?

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 6e85cfd..73c000f 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -2059,7 +2059,9 @@ static int reiserfs_quota_on(struct super_block *sb, int type, int format_id,
 	inode = path->dentry->d_inode;
 	/* We must not pack tails for quota files on reiserfs for quota IO to work */
 	if (!(REISERFS_I(inode)->i_flags & i_nopack_mask)) {
+		reiserfs_write_lock(sb);
 		err = reiserfs_unpack(inode, NULL);
+		reiserfs_write_unlock(sb);
 		if (err) {
 			reiserfs_warning(sb, "super-6520",
 				"Unpacking tail of quota file failed"
-- 
1.7.1

