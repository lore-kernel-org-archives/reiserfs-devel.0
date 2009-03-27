From: Coly Li <coly.li@suse.de>
Subject: [PATCH] fs/reiserfs: return f_fsid for statfs(2), v3
Date: Fri, 27 Mar 2009 16:46:37 +0800
Message-ID: <49CC926D.7030101@suse.de>
Reply-To: coly.li@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: LKML <linux-kernel@vger.kernel.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, reiserfs-devel@vger.kernel.org

This patch makes reiserfs3 return f_fsid info for statfs(2). By Andreas'
suggestion, this patch populates a persistent f_fsid between boots/mounts with
help of on-disk uuid record.

Randy Dunlap reported a compiling error from v2 patch like:
    fs/built-in.o: In function `reiserfs_statfs':
    super.c:(.text+0x7332b): undefined reference to `crc32_le'
    super.c:(.text+0x7333f): undefined reference to `crc32_le'
Also he provided helpful solution to fix this error. The modification of v3
patch is based on Randy's suggestion, add 'select CRC32' in fs/reiserfs/Kconfig.

Signed-off-by: Coly Li <coly.li@suse.de>
Cc: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: reiserfs-devel@vger.kernel.org
---
 fs/reiserfs/Kconfig |    1 +
 fs/reiserfs/super.c |    5 +++++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/fs/reiserfs/Kconfig b/fs/reiserfs/Kconfig
index 949b8c6..513f431 100644
--- a/fs/reiserfs/Kconfig
+++ b/fs/reiserfs/Kconfig
@@ -1,5 +1,6 @@
 config REISERFS_FS
 	tristate "Reiserfs support"
+	select CRC32
 	help
 	  Stores not just filenames but the files themselves in a balanced
 	  tree.  Uses journalling.
diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index f3c820b..cb8e7ee 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -27,6 +27,7 @@
 #include <linux/mnt_namespace.h>
 #include <linux/mount.h>
 #include <linux/namei.h>
+#include <linux/crc32.h>

 struct file_system_type reiserfs_fs_type;

@@ -1892,6 +1893,10 @@ static int reiserfs_statfs(struct dentry *dentry, struct
kstatfs *buf)
 	buf->f_bsize = dentry->d_sb->s_blocksize;
 	/* changed to accommodate gcc folks. */
 	buf->f_type = REISERFS_SUPER_MAGIC;
+	buf->f_fsid.val[0] = (u32)crc32_le(0, rs->s_uuid, sizeof(rs->s_uuid)/2);
+	buf->f_fsid.val[1] = (u32)crc32_le(0, rs->s_uuid + sizeof(rs->s_uuid)/2,
+				sizeof(rs->s_uuid)/2);
+
 	return 0;
 }

-- 
Coly Li
SuSE Labs
