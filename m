From: Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] reiserfs: only call unlock_new_inode() if I_NEW
Date: Sun, 28 Jun 2020 00:00:57 -0700
Message-ID: <20200628070057.820213-1-ebiggers@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593327689;
        bh=LYiWGqhuibBKH+a+dZQwq8XA2JNHsSqHlHrxb93HHY4=;
        h=From:To:Cc:Subject:Date:From;
        b=fvwVcGIpBm5O34hr2mOI48xAS5F6/Szmr5TmIqrbtgZbos1qjw+aGdKhDX4uvphjB
         4lkcyNX4TPYDR4pa5hxYSdUfWMuWgGK13HPKF+1M4iNWK6OYmqfyKX5+a1wSDWpkAg
         2OqIdHy1Pj2+pfWwY5GsqZy7VDCrC2FsyR5FVM+M=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, syzbot+187510916eb6a14598f7@syzkaller.appspotmail.com

From: Eric Biggers <ebiggers@google.com>

unlock_new_inode() is only meant to be called after a new inode has
already been inserted into the hash table.  But reiserfs_new_inode() can
call it even before it has inserted the inode, triggering the WARNING in
unlock_new_inode().  Fix this by only calling unlock_new_inode() if the
inode has the I_NEW flag set, indicating that it's in the table.

This addresses the syzbot report "WARNING in unlock_new_inode"
(https://syzkaller.appspot.com/bug?extid=187510916eb6a14598f7).

Reported-by: syzbot+187510916eb6a14598f7@syzkaller.appspotmail.com
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/reiserfs/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 1509775da040..e3af44c61524 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -2163,7 +2163,8 @@ int reiserfs_new_inode(struct reiserfs_transaction_handle *th,
 out_inserted_sd:
 	clear_nlink(inode);
 	th->t_trans_id = 0;	/* so the caller can't use this handle later */
-	unlock_new_inode(inode); /* OK to do even if we hadn't locked it */
+	if (inode->i_state & I_NEW)
+		unlock_new_inode(inode);
 	iput(inode);
 	return err;
 }
-- 
2.27.0

