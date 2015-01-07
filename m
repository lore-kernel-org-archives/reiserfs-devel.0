From: Luis Henriques <luis.henriques@canonical.com>
Subject: [3.16.y-ckt stable] Patch "reiserfs: destroy allocated commit workqueue" has been added to staging queue
Date: Wed,  7 Jan 2015 10:31:12 +0000
Message-ID: <1420626672-27946-1-git-send-email-luis.henriques@canonical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Jiri Slaby <jslaby@suse.cz>
Cc: auxsvr@gmail.com, =?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@gmx.fr>, Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org, Luis Henriques <luis.henriques@canonical.com>, kernel-team@lists.ubuntu.com

This is a note to let you know that I have just added a patch titled

    reiserfs: destroy allocated commit workqueue

to the linux-3.16.y-queue branch of the 3.16.y-ckt extended stable tree=
=20
which can be found at:

 http://kernel.ubuntu.com/git?p=3Dubuntu/linux.git;a=3Dshortlog;h=3Dref=
s/heads/linux-3.16.y-queue

This patch is scheduled to be released in version 3.16.7-ckt4.

If you, or anyone else, feels it should not be added to this tree, plea=
se=20
reply to this email.

=46or more information about the 3.16.y-ckt tree, see
https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable

Thanks.
-Luis

------

=46rom edf1c15209a6b3af591eeb384b17ca888811b727 Mon Sep 17 00:00:00 200=
1
=46rom: Jiri Slaby <jslaby@suse.cz>
Date: Fri, 12 Dec 2014 16:29:29 +0100
Subject: reiserfs: destroy allocated commit workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

commit fa0c5540739320258c3e3a45aaae9dae467b2504 upstream.

When resirefs is trying to mount a partition, it creates a commit
workqueue (sbi->commit_wq). But when mount fails later, the workqueue
is not freed.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Reported-by: auxsvr@gmail.com
Reported-by: Beno=C3=AEt Monin <benoit.monin@gmx.fr>
Cc: Jan Kara <jack@suse.cz>
Cc: reiserfs-devel@vger.kernel.org
=46ixes: 797d9016ceca69879bb273218810fa0beef46aac
Signed-off-by: Jan Kara <jack@suse.cz>
Signed-off-by: Luis Henriques <luis.henriques@canonical.com>
---
 fs/reiserfs/super.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 5fd8f57e07fc..27575041bea3 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -2161,6 +2161,9 @@ error_unlocked:
 		reiserfs_write_unlock(s);
 	}

+	if (sbi->commit_wq)
+		destroy_workqueue(sbi->commit_wq);
+
 	cancel_delayed_work_sync(&REISERFS_SB(s)->old_work);

 	reiserfs_free_bitmap_cache(s);
--
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
