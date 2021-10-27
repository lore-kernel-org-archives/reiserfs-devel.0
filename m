From: Dongliang Mu <mudongliangabcd@gmail.com>
Subject: [PATCH] fs: reiserfs: remove useless new_opts in reiserfs_remount
Date: Wed, 27 Oct 2021 22:34:41 +0800
Message-ID: <20211027143445.4156459-1-mudongliangabcd@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=thGbGpMmDBLVFCgnHjtOHQz7SQaxdSW9d+9l+tEtUqc=;
        b=ldKmAOyUDN64FyhAHEjvFrdt6dBfRGeA7ig2+ULovFnlu9zQDtg5/RdNkjY5+o1gww
         Qzu7x0ToRdIuf7fotbHgkKtG0j0lKjJaTacuWipZCwwNynjegtF3KrkkjrnhRHNg3S6M
         0Ef4VWYFM1KE+8mH8JsbkYEnn0blhU4p04hDpXawndaMLprISgHBAszpqujvhLAsivkN
         GQ2nFpe1noGxMD6hmOIu/FkkD4xQ/CRCyERLdOZFuB/0WSC/DX0PZK2c80uCGo9cBcD6
         EJzDuZaJMIZ4YulniDBNLJ5N5XRxd+G6yHPL24IMXgIo7XryV6CPBxLQjmIDE3W4Sj8/
         /Buw==
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>, Dongliang Mu <mudongliangabcd@gmail.com>, Miklos Szeredi <mszeredi@redhat.com>, Yu Kuai <yukuai3@huawei.com>, Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Since the commit c3d98ea08291 ("VFS: Don't use save/replace_mount_options
if not using generic_show_options") eliminates replace_mount_options
in reiserfs_remount, but does not handle the allocated new_opts,
it will cause memory leak in the reiserfs_remount.

Because new_opts is useless in reiserfs_mount, so we fix this bug by
removing the useless new_opts in reiserfs_remount.

Fixes: c3d98ea08291 ("VFS: Don't use save/replace_mount_options if not using generic_show_options")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 fs/reiserfs/super.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 58481f8d63d5..f7b05c6b3dcf 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1437,7 +1437,6 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 	unsigned long safe_mask = 0;
 	unsigned int commit_max_age = (unsigned int)-1;
 	struct reiserfs_journal *journal = SB_JOURNAL(s);
-	char *new_opts;
 	int err;
 	char *qf_names[REISERFS_MAXQUOTAS];
 	unsigned int qfmt = 0;
@@ -1445,10 +1444,6 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 	int i;
 #endif
 
-	new_opts = kstrdup(arg, GFP_KERNEL);
-	if (arg && !new_opts)
-		return -ENOMEM;
-
 	sync_filesystem(s);
 	reiserfs_write_lock(s);
 
@@ -1599,7 +1594,6 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 out_err_unlock:
 	reiserfs_write_unlock(s);
 out_err:
-	kfree(new_opts);
 	return err;
 }
 
-- 
2.25.1

