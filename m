From: Jan Kara <jack@suse.cz>
Subject: [PATCH 3/5] reiserfs: Don't use MAXQUOTAS value
Date: Wed, 10 Sep 2014 21:22:50 +0200
Message-ID: <1410376972-18417-4-git-send-email-jack@suse.cz>
References: <1410376972-18417-1-git-send-email-jack@suse.cz>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1410376972-18417-1-git-send-email-jack@suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org
Cc: Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org, Jeff Mahoney <jeffm@suse.de>

MAXQUOTAS value defines maximum number of quota types VFS supports.
This isn't necessarily the number of types reiserfs supports and with
addition of project quotas these two numbers stop matching. So make
reiserfs use its private definition.

CC: reiserfs-devel@vger.kernel.org
CC: Jeff Mahoney <jeffm@suse.de>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/reiserfs.h |  5 ++++-
 fs/reiserfs/super.c    | 16 ++++++++--------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index 735c2c2b4536..1894d96ccb7c 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -506,6 +506,9 @@ typedef struct reiserfs_proc_info_data {
 } reiserfs_proc_info_data_t;
 #endif
 
+/* Number of quota types we support */
+#define REISERFS_MAXQUOTAS 2
+
 /* reiserfs union of in-core super block data */
 struct reiserfs_sb_info {
 	/* Buffer containing the super block */
@@ -615,7 +618,7 @@ struct reiserfs_sb_info {
 	spinlock_t old_work_lock;     /* protects old_work and work_queued */
 
 #ifdef CONFIG_QUOTA
-	char *s_qf_names[MAXQUOTAS];
+	char *s_qf_names[REISERFS_MAXQUOTAS];
 	int s_jquota_fmt;
 #endif
 	char *s_jdev;		/* Stored jdev for mount option showing */
diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index d46e88a33b02..f1376c92cf74 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -206,7 +206,7 @@ static int finish_unfinished(struct super_block *s)
 #ifdef CONFIG_QUOTA
 	int i;
 	int ms_active_set;
-	int quota_enabled[MAXQUOTAS];
+	int quota_enabled[REISERFS_MAXQUOTAS];
 #endif
 
 	/* compose key to look for "save" links */
@@ -227,7 +227,7 @@ static int finish_unfinished(struct super_block *s)
 		s->s_flags |= MS_ACTIVE;
 	}
 	/* Turn on quotas so that they are updated correctly */
-	for (i = 0; i < MAXQUOTAS; i++) {
+	for (i = 0; i < REISERFS_MAXQUOTAS; i++) {
 		quota_enabled[i] = 1;
 		if (REISERFS_SB(s)->s_qf_names[i]) {
 			int ret;
@@ -370,7 +370,7 @@ static int finish_unfinished(struct super_block *s)
 #ifdef CONFIG_QUOTA
 	/* Turn quotas off */
 	reiserfs_write_unlock(s);
-	for (i = 0; i < MAXQUOTAS; i++) {
+	for (i = 0; i < REISERFS_MAXQUOTAS; i++) {
 		if (sb_dqopt(s)->files[i] && quota_enabled[i])
 			dquot_quota_off(s, i);
 	}
@@ -1360,7 +1360,7 @@ static void handle_quota_files(struct super_block *s, char **qf_names,
 {
 	int i;
 
-	for (i = 0; i < MAXQUOTAS; i++) {
+	for (i = 0; i < REISERFS_MAXQUOTAS; i++) {
 		if (qf_names[i] != REISERFS_SB(s)->s_qf_names[i])
 			kfree(REISERFS_SB(s)->s_qf_names[i]);
 		REISERFS_SB(s)->s_qf_names[i] = qf_names[i];
@@ -1381,7 +1381,7 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 	struct reiserfs_journal *journal = SB_JOURNAL(s);
 	char *new_opts = kstrdup(arg, GFP_KERNEL);
 	int err;
-	char *qf_names[MAXQUOTAS];
+	char *qf_names[REISERFS_MAXQUOTAS];
 	unsigned int qfmt = 0;
 #ifdef CONFIG_QUOTA
 	int i;
@@ -1400,7 +1400,7 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 	    (s, arg, &mount_options, &blocks, NULL, &commit_max_age,
 	    qf_names, &qfmt)) {
 #ifdef CONFIG_QUOTA
-		for (i = 0; i < MAXQUOTAS; i++)
+		for (i = 0; i < REISERFS_MAXQUOTAS; i++)
 			if (qf_names[i] != REISERFS_SB(s)->s_qf_names[i])
 				kfree(qf_names[i]);
 #endif
@@ -1844,7 +1844,7 @@ static int reiserfs_fill_super(struct super_block *s, void *data, int silent)
 	char *jdev_name;
 	struct reiserfs_sb_info *sbi;
 	int errval = -EINVAL;
-	char *qf_names[MAXQUOTAS] = {};
+	char *qf_names[REISERFS_MAXQUOTAS] = {};
 	unsigned int qfmt = 0;
 
 	save_mount_options(s, data);
@@ -2169,7 +2169,7 @@ error_unlocked:
 #ifdef CONFIG_QUOTA
 	{
 		int j;
-		for (j = 0; j < MAXQUOTAS; j++)
+		for (j = 0; j < REISERFS_MAXQUOTAS; j++)
 			kfree(qf_names[j]);
 	}
 #endif
-- 
1.8.1.4

