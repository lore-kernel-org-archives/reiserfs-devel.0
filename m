From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.8 063/101] reiserfs: only call unlock_new_inode() if I_NEW
Date: Sun, 18 Oct 2020 15:19:48 -0400
Message-ID: <20201018192026.4053674-63-sashal@kernel.org>
References: <20201018192026.4053674-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603048902;
        bh=hAYIdHO7/WDzE4XJhYurmHtjVgByz5Wp4pXVuqmlTbA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tnbzsUndsOQK1noeLh/WFJBPg3VzwurXsVZqZqGBXoSR/votsk96+xazRzKOrwXWm
         TioHG3x0jsPt0kHkpjc/bN9oLctBv+1t6zzkgExfvMIkKTeiPVz9wkXqMPr0Tn+7I6
         UOC0pNim8vODaQO6DWo5YzWXmPeq/STuooQZKw0o=
In-Reply-To: <20201018192026.4053674-1-sashal@kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Eric Biggers <ebiggers@google.com>, syzbot+187510916eb6a14598f7@syzkaller.appspotmail.com, Jan Kara <jack@suse.cz>, Sasha Levin <sashal@kernel.org>, reiserfs-devel@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

[ Upstream commit 8859bf2b1278d064a139e3031451524a49a56bd0 ]

unlock_new_inode() is only meant to be called after a new inode has
already been inserted into the hash table.  But reiserfs_new_inode() can
call it even before it has inserted the inode, triggering the WARNING in
unlock_new_inode().  Fix this by only calling unlock_new_inode() if the
inode has the I_NEW flag set, indicating that it's in the table.

This addresses the syzbot report "WARNING in unlock_new_inode"
(https://syzkaller.appspot.com/bug?extid=187510916eb6a14598f7).

Link: https://lore.kernel.org/r/20200628070057.820213-1-ebiggers@kernel.org
Reported-by: syzbot+187510916eb6a14598f7@syzkaller.appspotmail.com
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Jan Kara <jack@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/reiserfs/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 1509775da040a..e3af44c61524d 100644
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
2.25.1

