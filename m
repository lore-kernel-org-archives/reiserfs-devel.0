From: Dongliang Mu <mudongliangabcd@gmail.com>
Subject: [PATCH] fs: reiserfs: free new_opts in reiserfs_remount
Date: Wed, 27 Oct 2021 11:39:25 +0800
Message-ID: <20211027033947.3992059-1-mudongliangabcd@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zyqIHjUAZJUCPVU3obv7Mk0Xb8zYZpGJ80LlJg4jvSA=;
        b=ThXkgHlwcFlR5t3Zi8ceXLze5pCjjdvbb5o6Z3sbnHH3j6fPHbtgyNj4cO8yJnrZ/Q
         bbGNAP9VRfv6r3DDTZK956aPTqzp+plwYOxbjr8fAwrybTiGrUcoZPAxbHu4zte+CkzW
         fXW3hl0nhHuVzCFmzlQZp0fL9hNn2raNNfuerV0b20jvOcXK0brd8Mt8rbPE7kbn5wkV
         JjeUyC7iP0asn9z8OcjexjvzbM7gzcVBP0uUUIcRSsBhBhU5zgwI6r2oRmrTDT9hDmgc
         u1Mr7EwiHV+zcUL4AWdG9sze6PXIlk4sJq5SbfYM+XaSc/9/U5qK0srGHbN8CZ7+AoF4
         yizQ==
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yu Kuai <yukuai3@huawei.com>, Dongliang Mu <mudongliangabcd@gmail.com>, Jan Kara <jack@suse.cz>, Miklos Szeredi <mszeredi@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Since the commit c3d98ea08291 ("VFS: Don't use save/replace_mount_options
if not using generic_show_options") eliminates replace_mount_options
in reiserfs, but did not handle the allocated new_opts,
it will cause memory leak in the reiserfs_remount.

Fix this by freeing new_opts in the reiserfs_remount temporarily.

Fixes: c3d98ea08291 ("VFS: Don't use save/replace_mount_options if not using generic_show_options")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 fs/reiserfs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 58481f8d63d5..b36865c8b66a 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1594,6 +1594,7 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 	}
 
 out_ok_unlocked:
+	kfree(new_opts);
 	return 0;
 
 out_err_unlock:
-- 
2.25.1

