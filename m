From: Coly Li <coly.li@suse.de>
Subject: [PATCH 15/20] fs/reiserfs: return f_fsid for statfs(2), v2
Date: Tue, 20 Jan 2009 15:09:32 +0800
Message-ID: <497578AC.9060806@suse.de>
Reply-To: coly.li@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: reiserfs-devel@vger.kernel.org

This patch makes reiserfs3 return f_fsid info for statfs(2). By Andreas' suggestion, this patch
populates a persistent f_fsid between boots/mounts with help of on-disk uuid record.

Signed-off-by: Coly Li <coly.li@suse.de>
Cc: reiserfs-devel@vger.kernel.org
---
 fs/reiserfs/super.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

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

@@ -1892,6 +1893,10 @@ static int reiserfs_statfs(struct dentry *dentry, struct kstatfs *buf)
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



