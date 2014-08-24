From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 1/1] reiser4: implement ->remount_fs() super operation
Date: Sun, 24 Aug 2014 14:04:13 +0200
Message-ID: <53F9D4BD.9000600@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080603050103000600020905"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=yu8TJZ46EyZ2vCgM69NKVb+6RiDBkM1i135C223Y5sY=;
        b=S0WmJy/f65m0rxgCuV0gVydfdEfOndIVBPZLgEz3sOsRq4hI7RJY6cawdZ+yNnuIaD
         xuSPDCy2FopoJsx/dzYDxLAMXRws8QmVhzhblW5zPoylqilrZGM7rCUKZFFGBBmcMW3n
         9A2yzEaUp8QmJW5mNQbB4Lj8WdMczLkFmHb4+i4DsxxcvURyRPLeLNbMIoCzUIbxDAFB
         8/5A8PjRsNIFbfYt2cwclKU5V2yf1KifoK4PWHmJO1wUIcSyBxpSKbBC7dp0TmndZAGA
         a5uLRL2JDd8T5QGS3Jm19jSEf0CkSqBRsYaAcnULwK0WuTh6/KEBvzYOySU6eWXjeYGD
         x6rA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080603050103000600020905
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

This patch prevents panic during reboot/shutdown caused by VFS changes 
in 3.15

Thanks,
Edward.

--------------080603050103000600020905
Content-Type: text/x-patch;
 name="reiser4-add-remount_fs-super_op.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-add-remount_fs-super_op.patch"

Add ->remount_fs() super option, which performs sync_filesystem()
needed when when transitioning from read-write to read-only, see
http://marc.info/?l=samba-technical&m=139550798721412&w=2 for details.

Panic when flushing read-only file system.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/flush.c     |    2 ++
 fs/reiser4/super_ops.c |    7 +++++++
 2 files changed, 9 insertions(+)

--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -445,6 +445,12 @@ static int reiser4_sync_fs(struct super_
 	return 0;
 }
 
+static int reiser4_remount(struct super_block *s, int *mount_flags, char *arg)
+{
+	sync_filesystem(s);
+	return 0;
+}
+
 /**
  * reiser4_show_options - show_options of super operations
  * @m: file where to write information
@@ -479,6 +485,7 @@ struct super_operations reiser4_super_op
 	.put_super = reiser4_put_super,
 	.sync_fs = reiser4_sync_fs,
 	.statfs = reiser4_statfs,
+	.remount_fs = reiser4_remount,
 	.writeback_inodes = reiser4_writeback_inodes,
 	.show_options = reiser4_show_options
 };
--- a/fs/reiser4/flush.c
+++ b/fs/reiser4/flush.c
@@ -1037,6 +1037,8 @@ flush_current_atom(int flags, long nr_to
 	assert_spin_locked(&((*atom)->alock));
 	assert("zam-892", get_current_context()->trans->atom == *atom);
 
+	BUG_ON(rofs_super(get_current_context()->super));
+
 	nr_to_write = LONG_MAX;
 	while (1) {
 		ret = reiser4_fq_by_atom(*atom, &fq);

--------------080603050103000600020905--
