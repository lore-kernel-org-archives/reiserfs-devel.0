From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 2/3] Adjust reiser4 for 3.19: ->f_dentry is gone, convert remaining uses to an equivalent.
Date: Sat, 14 Feb 2015 03:44:42 +0300
Message-ID: <1423874683-7787-2-git-send-email-intelfx100@gmail.com>
References: <1423874683-7787-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ay1isvDOiWWKOGqyWVUgRplN1rqP//BsFX8Op0aa/ZU=;
        b=l5vTcKqO8RfvluWz+wWqT1YDjH1ED9h0aL9xleKcPNLmF83WCjRcNf4UL5iK7RLAlZ
         X4sj87MFKC+GpPDTLM332eKLVKxN6efJZjEKtT62iXDJJQmM0plqtUget3wF/TekgzTg
         EXu67o3e5KwRFH9PIV93B/lW+/n9Yk3pc6n9PB+81mdWe6AMBueLInzmCXkgbi7tK8ty
         En1Gj9YEqtacGQh0pTVkmPnMUl46WkRXPmP9CiTo0U9KfQDpUeVRhN5+lb8GYRVBSwGf
         4pRjP80sl47GX1Z/wi3IOg1QFXT2L61DVPHKL/mAeMGLNPpapOweEzvD4tNnRmfL1TPs
         MshQ==
In-Reply-To: <1423874683-7787-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Upstream commit 78d28e651f97866d608d9b41f8ad291e65d47dd5
"kill f_dentry macro".

"f_dentry is gone; use f_path.dentry, or, better yet, see if you can
avoid it entirely."

Avoiding has been done in the previous commit. This commit blindly
replaces the remaining uses with an equivalent f_path.dentry.
Probably, these will need to be revisited someday...

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/fsdata.c                      | 2 +-
 fs/reiser4/plugin/dir_plugin_common.c    | 2 +-
 fs/reiser4/plugin/file/file.c            | 2 +-
 fs/reiser4/plugin/file/tail_conversion.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/reiser4/fsdata.c b/fs/reiser4/fsdata.c
index 7b77b7d..ad3f410 100644
--- a/fs/reiser4/fsdata.c
+++ b/fs/reiser4/fsdata.c
@@ -489,7 +489,7 @@ void reiser4_kill_cursors(struct inode *inode)
  */
 static int file_is_stateless(struct file *file)
 {
-	return reiser4_get_dentry_fsdata(file->f_dentry)->stateless;
+	return reiser4_get_dentry_fsdata(file->f_path.dentry)->stateless;
 }
 
 /**
diff --git a/fs/reiser4/plugin/dir_plugin_common.c b/fs/reiser4/plugin/dir_plugin_common.c
index c65ee72..5e72fa6 100644
--- a/fs/reiser4/plugin/dir_plugin_common.c
+++ b/fs/reiser4/plugin/dir_plugin_common.c
@@ -96,7 +96,7 @@ int build_readdir_key_common(struct file *dir /* directory being read */ ,
 
 	assert("nikita-1361", dir != NULL);
 	assert("nikita-1362", result != NULL);
-	assert("nikita-1363", dir->f_dentry != NULL);
+	assert("nikita-1363", dir->f_path.dentry != NULL);
 	inode = file_inode(dir);
 	assert("nikita-1373", inode != NULL);
 
diff --git a/fs/reiser4/plugin/file/file.c b/fs/reiser4/plugin/file/file.c
index 23a62b7..49c4c68 100644
--- a/fs/reiser4/plugin/file/file.c
+++ b/fs/reiser4/plugin/file/file.c
@@ -2317,7 +2317,7 @@ int release_unix_file(struct inode *inode, struct file *file)
 		uf_info = unix_file_inode_data(inode);
 
 		get_exclusive_access_careful(uf_info, inode);
-		if (file->f_dentry->d_lockref.count == 1 &&
+		if (file->f_path.dentry->d_lockref.count == 1 &&
 		    uf_info->container == UF_CONTAINER_EXTENTS &&
 		    !should_have_notail(uf_info, inode->i_size) &&
 		    !rofs_inode(inode)) {
diff --git a/fs/reiser4/plugin/file/tail_conversion.c b/fs/reiser4/plugin/file/tail_conversion.c
index ed9e4f8..196bff6 100644
--- a/fs/reiser4/plugin/file/tail_conversion.c
+++ b/fs/reiser4/plugin/file/tail_conversion.c
@@ -668,7 +668,7 @@ int extent2tail(struct file * file, struct unix_file_info *uf_info)
 			loff_t pos = start_byte;
 
 			assert("edward-1537",
-			       file != NULL && file->f_dentry != NULL);
+			       file != NULL && file->f_path.dentry != NULL);
 			assert("edward-1538",
 			       file_inode(file) == inode);
 
-- 
2.3.0

