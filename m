From: Wei Tang <tangwei@cmss.chinamobile.com>
Subject: [PATCH] reiserfs: do not initialise statics to NULL
Date: Tue,  7 Jun 2016 09:58:31 +0800
Message-ID: <1465264711-14554-1-git-send-email-tangwei@cmss.chinamobile.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: roland@hack.frob.com, oleg@redhat.com
Cc: viro@zeniv.linux.org.uk, dmonakhov@openvz.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Tang <tangwei@cmss.chinamobile.com>

This patch fixes the checkpatch.pl error to procfs.c:

ERROR:INITIALISED_STATIC: do not initialise statics to NULL

Signed-off-by: Wei Tang <tangwei@cmss.chinamobile.com>
---
 fs/reiserfs/procfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/procfs.c b/fs/reiserfs/procfs.c
index fe99915..22882e6 100644
--- a/fs/reiserfs/procfs.c
+++ b/fs/reiserfs/procfs.c
@@ -402,7 +402,7 @@ static const struct file_operations r_file_operations = {
 	.release = single_release,
 };
 
-static struct proc_dir_entry *proc_info_root = NULL;
+static struct proc_dir_entry *proc_info_root;
 static const char proc_info_root_name[] = "fs/reiserfs";
 
 static void add_file(struct super_block *sb, char *name,
-- 
1.9.1


