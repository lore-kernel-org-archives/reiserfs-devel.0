From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch] reiser4: port for Linux-4.1
Date: Fri, 26 Jun 2015 16:06:42 +0200
Message-ID: <558D5C72.2040203@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060801000300090302090305"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=hyYV+VZ7cJhhhqYn3oMn5QoA44Fd4CYI8uJZ30zveQ0=;
        b=fZPllqO22SiZzZ8273EOxuCrnz/CTV0vgaMieU8wACPbSM3gJGn5d8+7CWEgtdZHvq
         WHwZb0ZPlYF3UMM2IZrLc/qV4+egM4hCSMcGujFXledmjSug7erGFshX+DMz33Duvm4s
         /b2jaE6T//rsteOsJMpkQAO9+FwLC0fw5cfMfLP5Lz6xIas9Qd1s/iHvbr+AQ8adLgkf
         +loKYT5yIfyI8B+oM6mLKeeMdDdVs8TWzg320glxvGBkx/ZrxxWurEBL5j3jIyAfiWAC
         9UO7Qu+WwldNIjXMyOlYSNDGn8V+7v++ybgIW6TC5OjcPjqYvLIz4z2VwlU8yb5zrX5B
         jbGA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------060801000300090302090305
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------060801000300090302090305
Content-Type: text/x-patch;
 name="reiser4-port-for-4.1.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-port-for-4.1.patch"

. move generic_write_checks() up to the dispatcher;
. cancel_dirty_pages(), invented by akpm and me in 2007, gone:
  https://lkml.org/lkml/2015/2/20/241

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/read_write.c                          |    3 ++-
 fs/reiser4/plugin/file/cryptcompress.c   |   19 ++++++++-----------
 fs/reiser4/plugin/file/file.c            |    7 -------
 fs/reiser4/plugin/file/file_conversion.c |   18 +++++++++++++++---
 include/linux/fs.h                       |    1 +
 5 files changed, 26 insertions(+), 22 deletions(-)

--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -417,7 +417,7 @@ int rw_verify_area(int read_write, struc
 	return count > MAX_RW_COUNT ? MAX_RW_COUNT : count;
 }
 
-static ssize_t new_sync_read(struct file *filp, char __user *buf, size_t len, loff_t *ppos)
+ssize_t new_sync_read(struct file *filp, char __user *buf, size_t len, loff_t *ppos)
 {
 	struct iovec iov = { .iov_base = buf, .iov_len = len };
 	struct kiocb kiocb;
@@ -433,6 +433,7 @@ static ssize_t new_sync_read(struct file
 	*ppos = kiocb.ki_pos;
 	return ret;
 }
+EXPORT_SYMBOL(new_sync_read);
 
 ssize_t __vfs_read(struct file *file, char __user *buf, size_t count,
 		   loff_t *pos)
--- a/fs/reiser4/plugin/file/cryptcompress.c
+++ b/fs/reiser4/plugin/file/cryptcompress.c
@@ -1921,10 +1921,14 @@ static void checkout_page_cluster(struct
 		memcpy(tfm_stream_data(tc, INPUT_STREAM) + pg_to_off(i),
 		       data, in_page);
 		kunmap_atomic(data);
-
-		if (PageDirty(clust->pages[i]))
-			cancel_dirty_page(clust->pages[i], PAGE_CACHE_SIZE);
-
+		/*
+		 * modifications have been checked out and will be
+		 * committed later. Anyway, the dirty status of the
+		 * page is no longer relevant. However, the uptodate
+		 * status of the page is still relevant!
+		 */
+		if (TestClearPageDirty(clust->pages[i]))
+			account_page_cleaned(clust->pages[i], inode->i_mapping);
 		unlock_page(clust->pages[i]);
 
 		if (in_page < PAGE_CACHE_SIZE)
@@ -2875,13 +2879,6 @@ ssize_t write_cryptcompress(struct file
 	info = cryptcompress_inode_data(inode);
 	ctx = get_current_context();
 
-	result = generic_write_checks(file, &pos, &count, 0);
-  	if (unlikely(result != 0)) {
-		context_set_commit_async(ctx);
-		return result;
-	}
-  	if (unlikely(count == 0))
-		return 0;
 	result = file_remove_suid(file);
 	if (unlikely(result != 0)) {
 		context_set_commit_async(ctx);
--- a/fs/reiser4/plugin/file/file.c
+++ b/fs/reiser4/plugin/file/file.c
@@ -2101,13 +2101,6 @@ ssize_t write_unix_file(struct file *fil
 	assert("vs-947", !reiser4_inode_get_flag(inode, REISER4_NO_SD));
 	assert("vs-9471", (!reiser4_inode_get_flag(inode, REISER4_PART_MIXED)));
 
-	/* check amount of bytes to write and writing position */
-	result = generic_write_checks(file, pos, &count, 0);
-	if (result) {
-		context_set_commit_async(ctx);
-		return result;
-	}
-
 	result = file_remove_suid(file);
 	if (result) {
 		context_set_commit_async(ctx);
--- a/fs/reiser4/plugin/file/file_conversion.c
+++ b/fs/reiser4/plugin/file/file_conversion.c
@@ -28,6 +28,7 @@
  * are CS readers.
  */
 
+#include <linux/uio.h>
 #include "../../inode.h"
 #include "../cluster.h"
 #include "file.h"
@@ -519,19 +520,31 @@ static inline void done_dispatch_context
 ssize_t reiser4_write_dispatch(struct file *file, const char __user *buf,
 			       size_t count, loff_t *off)
 {
-	int result;
+	ssize_t result;
 	reiser4_context *ctx;
 	ssize_t written_old = 0; /* bytes written with initial plugin */
 	ssize_t written_new = 0; /* bytes written with new plugin */
 	struct dispatch_context cont;
 	struct inode * inode = file_inode(file);
 
+	struct iovec iov = { .iov_base = (void __user *)buf, .iov_len = count };
+	struct kiocb iocb;
+	struct iov_iter iter;
+
+	init_sync_kiocb(&iocb, file);
+	iocb.ki_pos = *off;
+	iov_iter_init(&iter, WRITE, &iov, 1, count);
+
 	ctx = reiser4_init_context(inode->i_sb);
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
 	current->backing_dev_info = inode_to_bdi(inode);
 	init_dispatch_context(&cont);
 	mutex_lock(&inode->i_mutex);
+
+	result = generic_write_checks(&iocb, &iter);
+	if (unlikely(result <= 0))
+		goto exit;
 	/**
 	 * First step.
 	 * Start write with initial file plugin.
@@ -556,8 +569,7 @@ ssize_t reiser4_write_dispatch(struct fi
 		warning("edward-1544",
 			"Inode %llu: file plugin conversion failed (%d)",
 			(unsigned long long)get_inode_oid(inode),
-			result);
-		context_set_commit_async(ctx);
+			(int)result);
 		goto exit;
 	}
 	reiser4_txn_restart(ctx);
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2605,6 +2605,7 @@ extern ssize_t generic_file_write_iter(s
 extern ssize_t generic_file_direct_write(struct kiocb *, struct iov_iter *, loff_t);
 extern ssize_t generic_perform_write(struct file *, struct iov_iter *, loff_t);
 
+ssize_t new_sync_read(struct file *filp, char __user *buf, size_t len, loff_t *ppos);
 ssize_t vfs_iter_read(struct file *file, struct iov_iter *iter, loff_t *ppos);
 ssize_t vfs_iter_write(struct file *file, struct iov_iter *iter, loff_t *ppos);
 

--------------060801000300090302090305--
