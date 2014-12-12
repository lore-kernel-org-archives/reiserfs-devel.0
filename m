From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv4 07/10] reiser4: batch discard support: add a dummy FITRIM ioctl handler for directories.
Date: Sat, 13 Dec 2014 00:00:43 +0300
Message-ID: <1418418046-10933-8-git-send-email-intelfx100@gmail.com>
References: <1418418046-10933-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dEr4dEXsP3xrdbTDKfGJsrSl7pDibl5IC3RgDDYXTpg=;
        b=E00hsJvAvSveCPg+LHFsvq+GOzzFxCSn/D06q/HnzpKoNRcsUy6LPe2QIyYcQp11B+
         xceHp3nB+WM14AVqbBx9/ZuwHQhUPShq3PQ49K63cQ5ffmeo0fYIYqaZEI2f9f/QfZEU
         reQWiKYsTUQ2UWocnTyfu6NMEQAmOIhr5uGu1vC6sA2MnFkKHkvjaj+Ry71rjePVfZlT
         T9iVC5qV3ROm8ANRN07zDiTzRqREhS0UBvjRGQmUKg8hQAzNHdchjNQ9FtlREylT25fW
         8A4YSZYDcD4hmoGKuLMgWlc8ZjkyX/Dljr2nZkaMBHS0Bb/9wK5abx63/A4sUAR08kOA
         MO5w==
In-Reply-To: <1418418046-10933-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

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
2.1.3

