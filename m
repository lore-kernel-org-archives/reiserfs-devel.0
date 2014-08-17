From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCH 6/7] reiser4: batch discard support: add a dummy FITRIM ioctl handler for directories.
Date: Sun, 17 Aug 2014 19:43:25 +0400
Message-ID: <1408290206-7427-7-git-send-email-intelfx100@gmail.com>
References: <1408290206-7427-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kcYkrjJH1FcfhVzv8dUHpao7oiRw1SRyMbhBNiODgfk=;
        b=I0Txo7ZIhkgGNGO/wuojBK8fcACYme2h0ISzypxynSqqv3y9KlooGJ6HzN+2zdX4N5
         0QBzKb2zadFawKw1I2HHcexXv3hvKT4QoGcgRs5c9MIShdk4zgwZ4vxP1Wb+WntzSxhj
         zYDabhMroQqhnUumwqKzf27g4ZCBWrHQLoHAccQoR+Q/UIbuGq/LRHHYb1sQOIFp2GqU
         /QrHk2mxVekVAAbnb+k1zFc9qC79aZZMO48/KNAu8yZDSbpEz2lQWf+ECTqkkejsksgv
         RPWSGLC9sxa9t3sUTNdK0MVBvN1nj6rs65UK6kObi7Sg/hSBzV3kFj7Ef5497MX/WeOW
         Mf7Q==
In-Reply-To: <1408290206-7427-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/plugin/dir/dir.h  |  2 ++
 fs/reiser4/plugin/file_ops.c | 27 +++++++++++++++++++++++++++
 fs/reiser4/plugin/object.c   |  6 +++++-
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/fs/reiser4/plugin/dir/dir.h b/fs/reiser4/plugin/dir/dir.h
index 4a91ebe..5eb7bda 100644
--- a/fs/reiser4/plugin/dir/dir.h
+++ b/fs/reiser4/plugin/dir/dir.h
@@ -10,6 +10,8 @@
 
 #include <linux/fs.h>*/
 
+long reiser4_ioctl_dir_common(struct file *file, unsigned int cmd, unsigned long arg);
+
 /* declarations of functions implementing HASHED_DIR_PLUGIN_ID dir plugin */
 
 /* "hashed" directory methods of dir plugin */
diff --git a/fs/reiser4/plugin/file_ops.c b/fs/reiser4/plugin/file_ops.c
index 466da64..65e2b02 100644
--- a/fs/reiser4/plugin/file_ops.c
+++ b/fs/reiser4/plugin/file_ops.c
@@ -107,6 +107,33 @@ int reiser4_sync_file_common(struct file *file, loff_t start, loff_t end, int da
 	return 0;
 }
 
+/** reiser4_ioctl_dir_common - ioctl of struct file_operations for typical directory
+ */
+long reiser4_ioctl_dir_common(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct inode *inode = file_inode(file);
+	struct super_block *super = inode->i_sb;
+	reiser4_context *ctx;
+	int ret;
+
+	ctx = reiser4_init_context(super);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	switch (cmd) {
+	case FITRIM:
+		warning("intelfx-62", "FITRIM ioctl not implemented");
+		/* fall-through to -ENOSYS */
+
+	default:
+		ret = RETERR(-ENOSYS);
+		break;
+	}
+
+	reiser4_exit_context(ctx);
+	return ret;
+}
+
 /*
  * Local variables:
  * c-indentation-style: "K&R"
diff --git a/fs/reiser4/plugin/object.c b/fs/reiser4/plugin/object.c
index 553f1e2..ce09a8a 100644
--- a/fs/reiser4/plugin/object.c
+++ b/fs/reiser4/plugin/object.c
@@ -251,7 +251,11 @@ static struct file_operations directory_f_ops = {
 	.read = generic_read_dir,
 	.iterate = reiser4_iterate_common,
 	.release = reiser4_release_dir_common,
-	.fsync = reiser4_sync_common
+	.fsync = reiser4_sync_common,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = reiser4_ioctl_dir_common,
+#endif
+	.unlocked_ioctl = reiser4_ioctl_dir_common
 };
 static struct address_space_operations directory_a_ops = {
 	.writepage = writepage_bugop,
-- 
2.0.4

