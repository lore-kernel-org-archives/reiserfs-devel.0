From: Jan Kara <jack@suse.cz>
Subject: [PATCH 1/2] reiserfs: Fix resuming of quotas on remount read-write
Date: Tue, 25 May 2010 16:02:23 +0200
Message-ID: <1274796144-4993-1-git-send-email-jack@suse.cz>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org
Cc: Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org

When quota was suspended on remount-ro, finish_unfinished() will try to turn
it on again (which fails) and also turns the quotas off on exit. Fix the
function to check whether quotas are already on at function entry and do
not turn them off in that case.

CC: reiserfs-devel@vger.kernel.org
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/super.c |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

  I plan to send this fix to Linus soon. Review is welcome.

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index f0ab5c9..9822fa1 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -158,6 +158,7 @@ static int finish_unfinished(struct super_block *s)
 #ifdef CONFIG_QUOTA
 	int i;
 	int ms_active_set;
+	int quota_enabled[MAXQUOTAS];
 #endif
 
 	/* compose key to look for "save" links */
@@ -179,8 +180,15 @@ static int finish_unfinished(struct super_block *s)
 	}
 	/* Turn on quotas so that they are updated correctly */
 	for (i = 0; i < MAXQUOTAS; i++) {
+		quota_enabled[i] = 1;
 		if (REISERFS_SB(s)->s_qf_names[i]) {
-			int ret = reiserfs_quota_on_mount(s, i);
+			int ret;
+
+			if (sb_has_quota_active(s, i)) {
+				quota_enabled[i] = 0;
+				continue;
+			}
+			ret = reiserfs_quota_on_mount(s, i);
 			if (ret < 0)
 				reiserfs_warning(s, "reiserfs-2500",
 						 "cannot turn on journaled "
@@ -304,7 +312,7 @@ static int finish_unfinished(struct super_block *s)
 #ifdef CONFIG_QUOTA
 	/* Turn quotas off */
 	for (i = 0; i < MAXQUOTAS; i++) {
-		if (sb_dqopt(s)->files[i])
+		if (sb_dqopt(s)->files[i] && quota_enabled[i])
 			dquot_quota_off(s, i);
 	}
 	if (ms_active_set)
-- 
1.6.4.2

