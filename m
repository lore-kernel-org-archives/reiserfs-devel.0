From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] fs: reiserfs/xattr.c: Make reiserfs_xattr_handlers static
Date: Thu,  2 Aug 2012 15:39:17 +0530
Message-ID: <1343902157-2267-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: viro@zeniv.linux.org.uk, sachin.kamat@linaro.org, patches@linaro.org

Silences the following sparse warning:
fs/reiserfs/xattr.c:899:28: warning:
symbol 'reiserfs_xattr_handlers' was not declared. Should it be static?

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 fs/reiserfs/xattr.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index d319963..c196369 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -896,7 +896,7 @@ static int create_privroot(struct dentry *dentry) { return 0; }
 #endif
 
 /* Actual operations that are exported to VFS-land */
-const struct xattr_handler *reiserfs_xattr_handlers[] = {
+static const struct xattr_handler *reiserfs_xattr_handlers[] = {
 #ifdef CONFIG_REISERFS_FS_XATTR
 	&reiserfs_xattr_user_handler,
 	&reiserfs_xattr_trusted_handler,
-- 
1.7.4.1

