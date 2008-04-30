From: Jan Kara <jack@suse.cz>
Subject: [PATCH] reiserfs: Fix typos in messages and comments (journalled -> journaled)
Date: Wed, 30 Apr 2008 17:06:17 +0200
Message-ID: <12095679812717-git-send-email-jack@suse.cz>
References: y
 <12095679813226-git-send-email-jack@suse.cz>
 <12095679812375-git-send-email-jack@suse.cz>
 <12095679812452-git-send-email-jack@suse.cz>
 <1209567981639-git-send-email-jack@suse.cz>
 <1209567981323-git-send-email-jack@suse.cz>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1209567981323-git-send-email-jack@suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org

Cc: reiserfs-devel@vger.kernel.org
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/super.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 072116a..118b059 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -182,7 +182,7 @@ static int finish_unfinished(struct super_block *s)
 			int ret = reiserfs_quota_on_mount(s, i);
 			if (ret < 0)
 				reiserfs_warning(s,
-						 "reiserfs: cannot turn on journalled quota: error %d",
+						 "reiserfs: cannot turn on journaled quota: error %d",
 						 ret);
 		}
 	}
@@ -994,7 +994,7 @@ static int reiserfs_parse_options(struct super_block *s, char *options,	/* strin
 
 			if (sb_any_quota_enabled(s)) {
 				reiserfs_warning(s,
-						 "reiserfs_parse_options: cannot change journalled quota options when quota turned on.");
+						 "reiserfs_parse_options: cannot change journaled quota options when quota turned on.");
 				return 0;
 			}
 			if (*arg) {	/* Some filename specified? */
@@ -1039,7 +1039,7 @@ static int reiserfs_parse_options(struct super_block *s, char *options,	/* strin
 #else
 		if (c == 'u' || c == 'g' || c == 'f') {
 			reiserfs_warning(s,
-					 "reiserfs_parse_options: journalled quota options not supported.");
+					 "reiserfs_parse_options: journaled quota options not supported.");
 			return 0;
 		}
 #endif
@@ -1050,7 +1050,7 @@ static int reiserfs_parse_options(struct super_block *s, char *options,	/* strin
 	    && (REISERFS_SB(s)->s_qf_names[USRQUOTA]
 		|| REISERFS_SB(s)->s_qf_names[GRPQUOTA])) {
 		reiserfs_warning(s,
-				 "reiserfs_parse_options: journalled quota format not specified.");
+				 "reiserfs_parse_options: journaled quota format not specified.");
 		return 0;
 	}
 	/* This checking is not precise wrt the quota type but for our purposes it is sufficient */
@@ -1980,7 +1980,7 @@ static int reiserfs_release_dquot(struct dquot *dquot)
 
 static int reiserfs_mark_dquot_dirty(struct dquot *dquot)
 {
-	/* Are we journalling quotas? */
+	/* Are we journaling quotas? */
 	if (REISERFS_SB(dquot->dq_sb)->s_qf_names[USRQUOTA] ||
 	    REISERFS_SB(dquot->dq_sb)->s_qf_names[GRPQUOTA]) {
 		dquot_mark_dquot_dirty(dquot);
-- 
1.5.2.4

