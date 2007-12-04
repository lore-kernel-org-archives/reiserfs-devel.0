From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch] reiser4: specify splice file operations
Date: Tue, 04 Dec 2007 19:44:27 +0300
Message-ID: <475583EB.4050608@gmail.com>
References: <200710212347.l9LNlD6K000649@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090705090407000300000206"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200710212347.l9LNlD6K000649@imap1.linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: jens.axboe@oracle.com, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------090705090407000300000206
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

akpm@linux-foundation.org wrote:

>The patch titled
>     git-block-vs-reiser4
>has been removed from the -mm tree.  Its filename was
>     git-block-vs-reiser4.patch
>
>This patch was dropped because it was folded into reiser4.patch
>
>------------------------------------------------------
>Subject: git-block-vs-reiser4
>From: Andrew Morton
>
>Hope this is right.
>
>Hope you know what you're doing ;)
>

This is a fixup for broken loopback functionality.

Thanks,
Edward.

--------------090705090407000300000206
Content-Type: text/x-patch;
 name="reiser4-specify-splice_ops.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-specify-splice_ops.patch"

Specify splice_read, splice_write file operations for
loopback functionality.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 linux-2.6.24-rc3-mm2/fs/reiser4/plugin/file/cryptcompress.c |    3 ++-
 linux-2.6.24-rc3-mm2/fs/reiser4/plugin/object.c             |    4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

--- linux-2.6.24-rc3-mm2/fs/reiser4/plugin/file/cryptcompress.c.orig
+++ linux-2.6.24-rc3-mm2/fs/reiser4/plugin/file/cryptcompress.c
@@ -3747,13 +3747,14 @@
 int prepare_write_cryptcompress(struct file *file, struct page *page,
 				unsigned from, unsigned to)
 {
-	return 0;
+	return -EINVAL;
 }
 
 /* plugin->commit_write */
 int commit_write_cryptcompress(struct file *file, struct page *page,
 			       unsigned from, unsigned to)
 {
+	BUG();
 	return 0;
 }
 
--- linux-2.6.24-rc3-mm2/fs/reiser4/plugin/object.c.orig
+++ linux-2.6.24-rc3-mm2/fs/reiser4/plugin/object.c
@@ -103,7 +103,9 @@
 	.mmap = reiser4_mmap_careful,
 	.open = reiser4_open_careful,
 	.release = reiser4_release_careful,
-	.fsync = reiser4_sync_file_common
+	.fsync = reiser4_sync_file_common,
+	.splice_read = generic_file_splice_read,
+	.splice_write = generic_file_splice_write
 };
 static struct address_space_operations regular_file_a_ops = {
 	.writepage = reiser4_writepage,

--------------090705090407000300000206--
