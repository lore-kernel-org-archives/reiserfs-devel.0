From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: [PATCH] reiser4: fix readv
Date: Wed, 13 Sep 2006 22:12:54 +0400
Message-ID: <200609132212.54871.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29871-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: akpm@osdl.org
Cc: reiserfs-list@namesys.com

Hello, Andrew

reiser4 in 2.6.18-rc6-mm2 has a bug. It can not do readv.

The attached patch fixes it by implementing reiser4' aio_read file operation.
Unfortunately, it appeared to get a loop which is very similar to the one of
fs/read_write.c:do_loop_readv_writev().
Alternatively, if do_loop_readv_writev were EXPORT_SYMBOL-ed
reiser4' aio_read could use it instead. But, there is a problem with do_loop_readv_writev EXPORT_SYMBOL-ing:
one if its arguments is io_fn_t, which is declared in fs/read_write.h.
If it is ok to move io_fn_t and do_loop_readv_writev declarations to include/linux/fs.h and to EXPORT_SYMBOL 
do_loop_readv_writev the fix will be smaller. Please, let me know what would you prefer.


From: Vladimir Saveliev <vs@namesys.com>

This patch adds implementation of aio_read file operation for reiser4.
It is needed because in reiser4 there are files which can not be dealt
with via generic page cache routines.
In case of readv, reiser4 has no meaning to find out file type and to choose proper
way to read it. As result generic page cache read gets called for files which can not be 
read that way. Reiser4' aio_read method is to fix that problem. 

Signed-off-by: Vladimir Saveliev <vs@namesys.com>




diff -puN fs/reiser4/plugin/object.c~reiser4-add-aio_read fs/reiser4/plugin/object.c
--- linux-2.6.18-rc6-mm2/fs/reiser4/plugin/object.c~reiser4-add-aio_read	2006-09-13 20:18:23.000000000 +0400
+++ linux-2.6.18-rc6-mm2-vs/fs/reiser4/plugin/object.c	2006-09-13 20:18:23.000000000 +0400
@@ -101,7 +101,7 @@ file_plugin file_plugins[LAST_FILE_PLUGI
 			.llseek = generic_file_llseek,
 			.read = read_unix_file,
 			.write = do_sync_write,
-			.aio_read = generic_file_aio_read,
+			.aio_read = aio_read_unix_file,
 			.aio_write = generic_file_aio_write,
 			.ioctl = ioctl_unix_file,
 			.mmap = mmap_unix_file,
diff -puN fs/reiser4/plugin/file/file.c~reiser4-add-aio_read fs/reiser4/plugin/file/file.c
--- linux-2.6.18-rc6-mm2/fs/reiser4/plugin/file/file.c~reiser4-add-aio_read	2006-09-13 20:18:23.000000000 +0400
+++ linux-2.6.18-rc6-mm2-vs/fs/reiser4/plugin/file/file.c	2006-09-13 20:52:30.000000000 +0400
@@ -2011,6 +2011,54 @@ out:
        return result;
 }
 
+/**
+ * aio_read_unix_file - aio_read of struct file_operations
+ * @iocb: i/o control block
+ * @iov: i/o vector
+ * @nr_segs: number of segments in the i/o vector
+ * @pos: file position to read from
+ *
+ * When it is called within reiser4 context (this happens when sys_read is
+ * reading a file built of extents) - just call generic_file_aio_read to
+ * perform read into page cache. When it is called without reiser4 context
+ * (sys_readv) - call read_unix_file for each segments of i/o vector, so that
+ * read_unix_file will be able to choose whether the file is to be read into
+ * page cache or the file is built of tail items and page cache read is not
+ * suitable for it.
+ */
+ssize_t aio_read_unix_file(struct kiocb *iocb, const struct iovec *iov,
+			   unsigned long nr_segs, loff_t pos)
+{
+	ssize_t ret = 0;
+
+	if (is_in_reiser4_context())
+		return generic_file_aio_read(iocb, iov, nr_segs, pos);
+
+	while (nr_segs > 0) {
+		void __user *base;
+		size_t len;
+		ssize_t nr;
+
+		base = iov->iov_base;
+		len = iov->iov_len;
+		iov++;
+		nr_segs--;
+
+		nr = read_unix_file(iocb->ki_filp, base, len, &iocb->ki_pos);
+		if (nr < 0) {
+			if (!ret)
+				ret = nr;
+			break;
+		}
+		ret += nr;
+		if (nr != len)
+			break;
+	}
+
+	return ret;
+
+}
+
 static ssize_t read_unix_file_container_tails(
 	struct file *file, char __user *buf, size_t read_amount, loff_t *off)
 {
diff -puN fs/reiser4/plugin/file/file.h~reiser4-add-aio_read fs/reiser4/plugin/file/file.h
--- linux-2.6.18-rc6-mm2/fs/reiser4/plugin/file/file.h~reiser4-add-aio_read	2006-09-13 20:18:23.000000000 +0400
+++ linux-2.6.18-rc6-mm2-vs/fs/reiser4/plugin/file/file.h	2006-09-13 20:18:23.000000000 +0400
@@ -15,6 +15,8 @@ int setattr_unix_file(struct dentry *, s
 /* file operations */
 ssize_t read_unix_file(struct file *, char __user *buf, size_t read_amount,
 		       loff_t *off);
+ssize_t aio_read_unix_file(struct kiocb *, const struct iovec *,
+			   unsigned long nr_segs, loff_t pos);
 ssize_t write_unix_file(struct file *, const char __user *buf, size_t write_amount,
 			loff_t * off);
 int ioctl_unix_file(struct inode *, struct file *, unsigned int cmd,

_

