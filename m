From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 05/12] BKL: Remove BKL from ReiserFS
Date: Thu, 16 Sep 2010 19:46:18 +0200
Message-ID: <1284659185-8942-6-git-send-email-arnd@arndb.de>
References: <1284659185-8942-1-git-send-email-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1284659185-8942-1-git-send-email-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, reiserfs-devel@vger.kernel.org

The BKL only got into reiserfs through the pushdown into
->fill_super. This function is already sufficiently
serialized using reiserfs_write_lock(), so we can
safely remove the BKL here.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: reiserfs-devel@vger.kernel.org
---
 fs/reiserfs/super.c |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 6874489..b8df814 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -28,7 +28,6 @@
 #include <linux/mount.h>
 #include <linux/namei.h>
 #include <linux/crc32.h>
-#include <linux/smp_lock.h>
 
 struct file_system_type reiserfs_fs_type;
 
@@ -1628,8 +1627,6 @@ static int reiserfs_fill_super(struct super_block *s, void *data, int silent)
 	char *qf_names[MAXQUOTAS] = {};
 	unsigned int qfmt = 0;
 
-	lock_kernel();
-
 	save_mount_options(s, data);
 
 	sbi = kzalloc(sizeof(struct reiserfs_sb_info), GFP_KERNEL);
@@ -1887,8 +1884,6 @@ static int reiserfs_fill_super(struct super_block *s, void *data, int silent)
 	spin_lock_init(&sbi->bitmap_lock);
 
 	reiserfs_write_unlock(s);
-
-	unlock_kernel();
 	return (0);
 
 error:
@@ -1911,7 +1906,6 @@ error:
 	kfree(sbi);
 
 	s->s_fs_info = NULL;
-	unlock_kernel();
 	return errval;
 }
 
-- 
1.7.1
