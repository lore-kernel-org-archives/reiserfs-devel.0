From: Yaowei Bai <bywxiaobai@163.com>
Subject: [PATCH 15/17] fs/reiserfs: remove unnecessary new_valid_dev check
Date: Mon, 28 Sep 2015 22:47:07 +0800
Message-ID: <1443451627-5740-1-git-send-email-bywxiaobai@163.com>
References: <1443446807-4838-1-git-send-email-bywxiaobai@163.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=05N3uMLEltwbWCkcPB
	pxLmFPv1szVjhxhl7dGfVafsA=; b=fsy9wfYLtQduIgW8M5kwPdB4g8Pc8cc2nT
	JREFO2BcGh1CYoMrAdY2Ku2Y9PTKPcULjNmz53SqfMFDtqKMf5STd9/zFTaRbvZM
	+dXm1QlYkIzUfBNAjOxim7jOT2HgW2P0sZE5sXQeUD7OSW2l4UgDrLE+U9+I7OBz
	b3uh3vGeo=
In-Reply-To: <1443446807-4838-1-git-send-email-bywxiaobai@163.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@zeniv.linux.org.uk, jack@suse.cz, akpm@linux-foundation.org, osandov@osandov.com, keescook@chromium.org, fabf@skynet.be, dhowells@redhat.com
Cc: reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

As new_valid_dev always returns 1, so !new_valid_dev check is not
needed, remove it.

Signed-off-by: Yaowei Bai <bywxiaobai@163.com>
---
 fs/reiserfs/namei.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index 5f1c9c2..47f9698 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -712,9 +712,6 @@ static int reiserfs_mknod(struct inode *dir, struct dentry *dentry, umode_t mode
 	    2 * (REISERFS_QUOTA_INIT_BLOCKS(dir->i_sb) +
 		 REISERFS_QUOTA_TRANS_BLOCKS(dir->i_sb));
 
-	if (!new_valid_dev(rdev))
-		return -EINVAL;
-
 	retval = dquot_initialize(dir);
 	if (retval)
 		return retval;
-- 
1.9.1


