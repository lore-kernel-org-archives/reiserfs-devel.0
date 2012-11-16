From: Jan Kara <jack@suse.cz>
Subject: [PATCH 2/4] reiserfs: Protect reiserfs_quota_on() with write lock
Date: Fri, 16 Nov 2012 12:33:38 +0100
Message-ID: <1353065620-27279-3-git-send-email-jack@suse.cz>
References: <1353065620-27279-1-git-send-email-jack@suse.cz>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1353065620-27279-1-git-send-email-jack@suse.cz>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <"jack@suse.cz>, stable"@vger.kernel.org#>, =@suse.cz, 3.0@suse.cz

In reiserfs_quota_on() we do quite some work - for example unpacking
tail of a quota file. Thus we have to hold write lock until a moment
we call back into the quota code.

CC: stable@vger.kernel.org # >= 3.0
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/super.c |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 5372980..e59d6dd 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -2216,8 +2216,11 @@ static int reiserfs_quota_on(struct super_block *sb, int type, int format_id,
 	struct reiserfs_transaction_handle th;
 	int opt = type == USRQUOTA ? REISERFS_USRQUOTA : REISERFS_GRPQUOTA;
 
-	if (!(REISERFS_SB(sb)->s_mount_opt & (1 << opt)))
-		return -EINVAL;
+	reiserfs_write_lock(sb);
+	if (!(REISERFS_SB(sb)->s_mount_opt & (1 << opt))) {
+		err = -EINVAL;
+		goto out;
+	}
 
 	/* Quotafile not on the same filesystem? */
 	if (path->dentry->d_sb != sb) {
@@ -2259,8 +2262,10 @@ static int reiserfs_quota_on(struct super_block *sb, int type, int format_id,
 		if (err)
 			goto out;
 	}
-	err = dquot_quota_on(sb, type, format_id, path);
+	reiserfs_write_unlock(sb);
+	return dquot_quota_on(sb, type, format_id, path);
 out:
+	reiserfs_write_unlock(sb);
 	return err;
 }
 
-- 
1.7.1

