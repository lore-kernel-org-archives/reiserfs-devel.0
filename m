From: Jan Kara <jack@suse.cz>
Subject: [PATCH 1/2] reiserfs: Fix memory leak of journal device string
Date: Thu, 12 Dec 2019 11:50:17 +0100
Message-ID: <20191212105018.910-2-jack@suse.cz>
References: <20191212105018.910-1-jack@suse.cz>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20191212105018.910-1-jack@suse.cz>
Sender: stable-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>, stable@vger.kernel.org

When a filesystem is mounted with jdev mount option, we store the
journal device name in an allocated string in superblock. However we
fail to ever free that string. Fix it.

Reported-by: syzbot+1c6756baf4b16b94d2a6@syzkaller.appspotmail.com
Fixes: c3aa077648e1 ("reiserfs: Properly display mount options in /proc/mounts")
CC: stable@vger.kernel.org
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 3244037b1286..d127af64283e 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -629,6 +629,7 @@ static void reiserfs_put_super(struct super_block *s)
 	reiserfs_write_unlock(s);
 	mutex_destroy(&REISERFS_SB(s)->lock);
 	destroy_workqueue(REISERFS_SB(s)->commit_wq);
+	kfree(REISERFS_SB(s)->s_jdev);
 	kfree(s->s_fs_info);
 	s->s_fs_info = NULL;
 }
@@ -2240,6 +2241,7 @@ static int reiserfs_fill_super(struct super_block *s, void *data, int silent)
 			kfree(qf_names[j]);
 	}
 #endif
+	kfree(sbi->s_jdev);
 	kfree(sbi);
 
 	s->s_fs_info = NULL;
-- 
2.16.4

