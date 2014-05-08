From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCH 2/2] Add aal_device_discard() function and implement it for file-based device.
Date: Thu,  8 May 2014 23:13:24 +0400
Message-ID: <1399576404-5527-3-git-send-email-intelfx100@gmail.com>
References: <1399576404-5527-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GV3kfMGE4yDLmgsgv9iBLku4jeE+lhCk95z3tJ+00sE=;
        b=j1knDqNjVxjO5FGXO64g2rnECMHD0yPBkAq++MnM1JFHwF7o1te1lp0mmNia5I/9ng
         Sqpxvd5QD3mbvq7RzXGmHqCpqbAWOIOooZlFfaXDCf1yadzJddF6qYPAfgvaQ7JJInkw
         pieaUWuxLAQMY6iRdoD1n2r2NBcIxRHAyXEQsx0zvXjtlnbK4VnqBHVer5LBfXjijOFw
         GAdxGT/7m+pYhxMFi+8cTUorKCkLdb9fRraiSJwEbd/O1sxkLMa4EUlydshJilQeJkFZ
         +47rv9tftaQbIauwds7H9EMakMGYVCQ7VDs2iMmmrsQvlNS6vebYf/qhc24VslP+Hi+o
         dpiQ==
In-Reply-To: <1399576404-5527-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Internally, ioctl(BLKDISCARD) or fallocate(FALLOC_FL_PUNCH_HOLE) is used
depending on whether the file is actually a block device.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 include/aal/device.h |  4 +++
 include/aal/types.h  |  3 +++
 src/device.c         | 15 +++++++++++
 src/file.c           | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 96 insertions(+)

diff --git a/include/aal/device.h b/include/aal/device.h
index 535fb79..c1ea19d 100644
--- a/include/aal/device.h
+++ b/include/aal/device.h
@@ -22,6 +22,10 @@ extern errno_t aal_device_reopen(aal_device_t *device,
 				 uint32_t blksize,
 				 int flags);
 
+extern errno_t aal_device_discard(aal_device_t *device,
+				blk_t block,
+				count_t count);
+
 extern errno_t aal_device_write(aal_device_t *device, 
 				void *buff, blk_t block,
 				count_t count);
diff --git a/include/aal/types.h b/include/aal/types.h
index e26edda..1dd8fce 100644
--- a/include/aal/types.h
+++ b/include/aal/types.h
@@ -203,6 +203,9 @@ struct aal_device_ops {
 	errno_t (*write) (aal_device_t *, 
 			  void *, blk_t, count_t);
     
+	errno_t (*discard) (aal_device_t *,
+			  blk_t, count_t);
+
 	errno_t (*sync) (aal_device_t *);
     
 	errno_t (*equals) (aal_device_t *, 
diff --git a/src/device.c b/src/device.c
index fe0a539..43edd1d 100644
--- a/src/device.c
+++ b/src/device.c
@@ -114,6 +114,21 @@ errno_t aal_device_write(
 	return device->ops->write(device, buff, block, count);
 }
 
+/* Performs discard operation on specified device. Actualqy it calls corresponding
+   operation (discard) from assosiated with device operations. Returns error code,
+   see types.h for more detailed description of errno_t. */
+errno_t aal_device_discard(
+	aal_device_t *device,	/* device instance we will discard */
+	blk_t block,		/* block we will begin discarding from */
+	count_t count)		/* number of blocks to be discarded */
+{
+	aal_assert("intelfx-1", device != NULL);
+	aal_assert("intelfx-2", buff != NULL);
+
+	aal_device_check_routine(device, discard, return -EINVAL);
+	return device->ops->discard(device, block, count);
+}
+
 /* Performs sync operation on specified device. Actualy it calls corresponding
    operation (sync) from assosiated with device operations. Returns error code,
    see types.h for more detailed description of errno_t. */
diff --git a/src/file.c b/src/file.c
index 451c5d4..dd36e3a 100644
--- a/src/file.c
+++ b/src/file.c
@@ -6,6 +6,10 @@
 
 #ifndef ENABLE_MINIMAL
 
+#ifndef _GNU_SOURCE
+#  define _GNU_SOURCE
+#endif
+
 #ifdef HAVE_CONFIG_H
 #  include <config.h>
 #endif
@@ -18,9 +22,22 @@
 #include <sys/stat.h>
 #include <sys/ioctl.h>
 
+#ifdef HAVE_LINUX_FALLOC_H
+#  include <linux/falloc.h>
+#endif
+
+#ifdef HAVE_LINUX_TYPES_H
+#  include <linux/types.h>
+#endif
+
 /* BLKGETSIZE & BLKGETSIZE64 defines: */
 #include <sys/mount.h>
 
+/* BLKDISCARD define: */
+#if defined(__linux__) && !defined(BLKDISCARD)
+#  define BLKDISCARD _IO(0x12,119)
+#endif
+
 #include <aal/libaal.h>
 
 /* Function for saving last error message into device assosiated buffer */
@@ -160,6 +177,62 @@ static errno_t file_write(
 	return 0;
 }
 
+/* Handler for "discard" operation for use with file device. See below for
+   understanding where it is used. */
+static errno_t file_discard(
+	aal_device_t *device,	    /* file device to discard */
+	blk_t block,		    /* start position for discarding */
+	count_t count)		    /* number of blocks to be discarded */
+{
+	struct stat st;
+	int ret;
+
+	if (!device)
+		return -EINVAL;
+
+	/* Stat the file */
+	if(stat(device->name, &st) != 0) {
+		file_error(device);
+		return errno;
+	}
+
+	/* Discard or punch hole depending on whether this is a block device */
+	if (S_ISBLK(st.st_mode)) {
+#ifdef BLKDISCARD
+		__u64 range[2];
+
+		range[0] = (__u64)block * device->blksize;
+		range[1] = (__u64)count * device->blksize;
+
+		ret = ioctl(*((int *)device->entity), BLKDISCARD, &range);
+#else
+		errno = EOPNOTSUPP;
+		ret = -1;
+#endif
+	} else {
+#if defined(HAVE_FALLOCATE) && defined(FALLOC_FL_PUNCH_HOLE)
+		off_t blk, len;
+
+		blk = (off_t)block * device->blksize;
+		len = (off_t)count * device->blksize;
+
+		ret = fallocate(*((int *)device->entity),
+				FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
+				blk, len);
+#else
+		errno = EOPNOTSUPP;
+		ret = -1;
+#endif
+	}
+
+	if (ret != 0) {
+		file_error(device);
+		return errno;
+	}
+
+	return 0;
+}
+
 /* Handler for "sync" operation for use with file device. See bellow for
    understanding where it is used. */
 static errno_t file_sync(
@@ -245,6 +318,7 @@ struct aal_device_ops file_ops = {
 	.close  = file_close,       /* handler for "create" operation */
 	.read   = file_read,	    /* handler for "read" operation */	    
 	.write  = file_write,	    /* handler for "write" operation */
+	.discard = file_discard,    /* handler for "discard" operation */
 	.sync   = file_sync,	    /* handler for "sync" operation */
 	.equals = file_equals,	    /* handler for comparing two devices */
 	.len    = file_len	    /* handler for length obtaining */
-- 
1.9.2

