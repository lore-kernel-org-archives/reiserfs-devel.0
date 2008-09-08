From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH] reiserfs: add missing llseek method
Date: Mon, 8 Sep 2008 19:42:50 +0200
Message-ID: <20080908174250.GA19912@lst.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@zeniv.linux.org.uk
Cc: reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org

Reiserfs currently doesn't set a llseek method for regular files, which
means it will fall back to default_llseek.  This means no one can seek
beyond 2 Gigabytes on reiserfs, and that there's not protection vs
the i_size updates from writers.


Signed-off-by: Christoph Hellwig <hch@lst.de>

Index: linux-2.6/fs/reiserfs/file.c
===================================================================
--- linux-2.6.orig/fs/reiserfs/file.c	2008-09-08 19:39:09.000000000 +0200
+++ linux-2.6/fs/reiserfs/file.c	2008-09-08 19:40:14.000000000 +0200
@@ -296,6 +296,7 @@ const struct file_operations reiserfs_fi
 	.aio_write = generic_file_aio_write,
 	.splice_read = generic_file_splice_read,
 	.splice_write = generic_file_splice_write,
+	.llseek = generic_file_llseek,
 };
 
 const struct inode_operations reiserfs_file_inode_operations = {
