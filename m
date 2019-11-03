From: Nikitas Angelinas <nikitas.angelinas@gmail.com>
Subject: [PATCH] reiserfs: replace open-coded atomic_dec_and_mutex_lock()
Date: Sun, 3 Nov 2019 01:44:54 -0800
Message-ID: <20191103094431.GA18576-nikitas.angelinas@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=E5t0jS8GRvsiApUx+zMF9sOBkkg/xnXP7ZhDzMQ5uJU=;
        b=eFHlFTmGQNdtnA4UEV5HUa1B+VTp9mejM6wQWUS9qTNDQeFl1guWoWa2WL/En44+kP
         mdKdhcPpXbd6FlXDoCJdAOetqsIAu4YliQB/wYRNMXkdNPINeILi6nx9wXo75KUuS9jw
         vSZO4BjpoH9RHnCfqEtkKutHcO2bmai+julIURXDpHE4377+MMwWn0hio8jlbl5wuvSx
         faMm0BZzmm09esZB/x8I1LYlw7eepkB9u5Yyc2WcTxxHXwRDaZV8pLpHcPw81buuYUVs
         PFrroOSH6tpguZromxEiX7TP/nSrnC24XX0Jct7nyphwXn97jN5YpyP3l72DcdD7jt39
         iYcA==
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, zhengbin@vostro, zhengbin13@huawei.com, Jan Kara <jack@suse.cz>
Cc: Al Viro <viro@zeniv.linux.org.uk>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, nikitas.angelinas@gmail.com

Replace the open-coded logic of atomic_dec_and_mutex_lock() in
reiserfs_file_release().

Signed-off-by: Nikitas Angelinas <nikitas.angelinas@gmail.com>
---
 fs/reiserfs/file.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/fs/reiserfs/file.c b/fs/reiserfs/file.c
index 843aadc..84cf8bd 100644
--- a/fs/reiserfs/file.c
+++ b/fs/reiserfs/file.c
@@ -38,16 +38,10 @@ static int reiserfs_file_release(struct inode *inode, struct file *filp)
 
 	BUG_ON(!S_ISREG(inode->i_mode));
 
-        if (atomic_add_unless(&REISERFS_I(inode)->openers, -1, 1))
+	if (!atomic_dec_and_mutex_lock(&REISERFS_I(inode)->openers,
+				       &REISERFS_I(inode)->tailpack))
 		return 0;
 
-	mutex_lock(&REISERFS_I(inode)->tailpack);
-
-        if (!atomic_dec_and_test(&REISERFS_I(inode)->openers)) {
-		mutex_unlock(&REISERFS_I(inode)->tailpack);
-		return 0;
-	}
-
 	/* fast out for when nothing needs to be done */
 	if ((!(REISERFS_I(inode)->i_flags & i_pack_on_close_mask) ||
 	     !tail_has_to_be_packed(inode)) &&
-- 
2.10.0

