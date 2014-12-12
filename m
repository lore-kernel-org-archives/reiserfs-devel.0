From: Jiri Slaby <jslaby@suse.cz>
Subject: [PATCH 1/1] reiserfs: destroy allocated commit workqueue
Date: Fri, 12 Dec 2014 16:29:29 +0100
Message-ID: <1418398169-19820-1-git-send-email-jslaby@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>, Jan Kara <jack@suse.cz>, All Versions <stable@vger.kernel.org>

When resirefs is trying to mount a partition, it creates a commit
workqueue (sbi->commit_wq). But when mount fails later, the workqueue
is not freed.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Reported-by: auxsvr@gmail.com
Reported-by: Beno=C3=AEt Monin <benoit.monin@gmx.fr>
Cc: Jan Kara <jack@suse.cz>
Cc: All Versions <stable@vger.kernel.org>
Cc: reiserfs-devel@vger.kernel.org
---
 fs/reiserfs/super.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index ea63ab13ef92..71fbbe3e2dab 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -2172,6 +2172,9 @@ error_unlocked:
 		reiserfs_write_unlock(s);
 	}
=20
+	if (sbi->commit_wq)
+		destroy_workqueue(sbi->commit_wq);
+
 	cancel_delayed_work_sync(&REISERFS_SB(s)->old_work);
=20
 	reiserfs_free_bitmap_cache(s);
--=20
2.2.0
