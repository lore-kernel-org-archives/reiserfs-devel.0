From: Jan Kara <jack@suse.cz>
Subject: [PATCH 08/14] reiserfs: Use sb_any_quota_loaded() instead of sb_any_quota_enabled().
Date: Mon, 27 Oct 2008 13:11:46 +0100
Message-ID: <12251095133646-git-send-email-jack@suse.cz>
References: <1225109512852-git-send-email-jack@suse.cz>
 <12251095123763-git-send-email-jack@suse.cz>
 <12251095124166-git-send-email-jack@suse.cz>
 <1225109512758-git-send-email-jack@suse.cz>
 <12251095122803-git-send-email-jack@suse.cz>
 <12251095124165-git-send-email-jack@suse.cz>
 <1225109513735-git-send-email-jack@suse.cz>
 <12251095131095-git-send-email-jack@suse.cz>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <12251095131095-git-send-email-jack@suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org

CC: reiserfs-devel@vger.kernel.org
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/super.c |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 663a91f..a9b393a 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -994,8 +994,7 @@ static int reiserfs_parse_options(struct super_block *s, char *options,	/* strin
 		if (c == 'u' || c == 'g') {
 			int qtype = c == 'u' ? USRQUOTA : GRPQUOTA;
 
-			if ((sb_any_quota_enabled(s) ||
-			     sb_any_quota_suspended(s)) &&
+			if (sb_any_quota_loaded(s) &&
 			    (!*arg != !REISERFS_SB(s)->s_qf_names[qtype])) {
 				reiserfs_warning(s,
 						 "reiserfs_parse_options: cannot change journaled quota options when quota turned on.");
@@ -1041,8 +1040,7 @@ static int reiserfs_parse_options(struct super_block *s, char *options,	/* strin
 						 "reiserfs_parse_options: unknown quota format specified.");
 				return 0;
 			}
-			if ((sb_any_quota_enabled(s) ||
-			     sb_any_quota_suspended(s)) &&
+			if (sb_any_quota_loaded(s) &&
 			    *qfmt != REISERFS_SB(s)->s_jquota_fmt) {
 				reiserfs_warning(s,
 						 "reiserfs_parse_options: cannot change journaled quota options when quota turned on.");
@@ -1067,7 +1065,7 @@ static int reiserfs_parse_options(struct super_block *s, char *options,	/* strin
 	}
 	/* This checking is not precise wrt the quota type but for our purposes it is sufficient */
 	if (!(*mount_options & (1 << REISERFS_QUOTA))
-	    && sb_any_quota_enabled(s)) {
+	    && sb_any_quota_loaded(s)) {
 		reiserfs_warning(s,
 				 "reiserfs_parse_options: quota options must be present when quota is turned on.");
 		return 0;
-- 
1.5.6

