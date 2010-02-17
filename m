From: Dmitry Monakhov <dmonakhov@openvz.org>
Subject: [PATCH 15/19] reiserfs: replace inode uid,gid,mode initialization with helper function
Date: Wed, 17 Feb 2010 21:45:17 +0300
Message-ID: <1266432317-9771-1-git-send-email-dmonakhov@openvz.org>
References: <1266431353-8549-1-git-send-email-dmonakhov@openvz.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=odL6fymo5i4iBcQMYoSbmzO6YzNI4LKXJouifPrZ2Ws=;
        b=kawLdMR+b9coICzOq25ifg9kxA0EqTMwE73dl1dZAGp5OB7fHrJdnGAQp0Q/W9AOrL
         iiQPd5FoEioi12QElGUCPLFRSuMa7a10KroaKphzPgPymz1DZVpPvvs6QBAK3m0AJaCO
         ByjCJxx8bk64OLinMyN3q/Emq1btR4WcZOfWw=
In-Reply-To: <1266431353-8549-1-git-send-email-dmonakhov@openvz.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org
Cc: reiserfs-devel@vger.kernel.org, Dmitry Monakhov <dmonakhov@openvz.org>


Signed-off-by: Dmitry Monakhov <dmonakhov@openvz.org>
---
 fs/reiserfs/namei.c |   17 ++++-------------
 1 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index 9d4dcf0..e138e0a 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -561,22 +561,13 @@ static int drop_new_inode(struct inode *inode)
 static int new_inode_init(struct inode *inode, struct inode *dir, int mode)
 {
 
-	/* the quota init calls have to know who to charge the quota to, so
-	 ** we have to set uid and gid here
-	 */
-	inode->i_uid = current_fsuid();
-	inode->i_mode = mode;
 	/* Make inode invalid - just in case we are going to drop it before
 	 * the initialization happens */
 	INODE_PKEY(inode)->k_objectid = 0;
-
-	if (dir->i_mode & S_ISGID) {
-		inode->i_gid = dir->i_gid;
-		if (S_ISDIR(mode))
-			inode->i_mode |= S_ISGID;
-	} else {
-		inode->i_gid = current_fsgid();
-	}
+	/* the quota init calls have to know who to charge the quota to, so
+	 ** we have to set uid and gid here
+	 */
+	inode_init_owner(inode, dir, mode);
 	vfs_dq_init(inode);
 	return 0;
 }
-- 
1.6.6

