From: akpm@linux-foundation.org
Subject: [patch 084/277] reiserfs: fix typos in messages and comments (journalled -> journaled)
Date: Fri, 25 Jul 2008 01:46:37 -0700
Message-ID: <200807250846.m6P8kbuc001189@imap1.linux-foundation.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: torvalds@linux-foundation.org
Cc: akpm@linux-foundation.org, jack@suse.cz, reiserfs-devel@vger.kernel.org

From: Jan Kara <jack@suse.cz>

Cc: <reiserfs-devel@vger.kernel.org>
Signed-off-by: Jan Kara <jack@suse.cz>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 fs/reiserfs/super.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff -puN fs/reiserfs/super.c~reiserfs-fix-typos-in-messages-and-comments-journalled-journaled fs/reiserfs/super.c
--- a/fs/reiserfs/super.c~reiserfs-fix-typos-in-messages-and-comments-journalled-journaled
+++ a/fs/reiserfs/super.c
@@ -182,7 +182,7 @@ static int finish_unfinished(struct supe
 			int ret = reiserfs_quota_on_mount(s, i);
 			if (ret < 0)
 				reiserfs_warning(s,
-						 "reiserfs: cannot turn on journalled quota: error %d",
+						 "reiserfs: cannot turn on journaled quota: error %d",
 						 ret);
 		}
 	}
@@ -994,7 +994,7 @@ static int reiserfs_parse_options(struct
 
 			if (sb_any_quota_enabled(s)) {
 				reiserfs_warning(s,
-						 "reiserfs_parse_options: cannot change journalled quota options when quota turned on.");
+						 "reiserfs_parse_options: cannot change journaled quota options when quota turned on.");
 				return 0;
 			}
 			if (*arg) {	/* Some filename specified? */
@@ -1039,7 +1039,7 @@ static int reiserfs_parse_options(struct
 #else
 		if (c == 'u' || c == 'g' || c == 'f') {
 			reiserfs_warning(s,
-					 "reiserfs_parse_options: journalled quota options not supported.");
+					 "reiserfs_parse_options: journaled quota options not supported.");
 			return 0;
 		}
 #endif
@@ -1050,7 +1050,7 @@ static int reiserfs_parse_options(struct
 	    && (REISERFS_SB(s)->s_qf_names[USRQUOTA]
 		|| REISERFS_SB(s)->s_qf_names[GRPQUOTA])) {
 		reiserfs_warning(s,
-				 "reiserfs_parse_options: journalled quota format not specified.");
+				 "reiserfs_parse_options: journaled quota format not specified.");
 		return 0;
 	}
 	/* This checking is not precise wrt the quota type but for our purposes it is sufficient */
@@ -1980,7 +1980,7 @@ static int reiserfs_release_dquot(struct
 
 static int reiserfs_mark_dquot_dirty(struct dquot *dquot)
 {
-	/* Are we journalling quotas? */
+	/* Are we journaling quotas? */
 	if (REISERFS_SB(dquot->dq_sb)->s_qf_names[USRQUOTA] ||
 	    REISERFS_SB(dquot->dq_sb)->s_qf_names[GRPQUOTA]) {
 		dquot_mark_dquot_dirty(dquot);
_
