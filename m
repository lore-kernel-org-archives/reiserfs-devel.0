From: Chris Mason <mason@suse.com>
Subject: [patch 6/6] reiserfs v3 patches
Date: Sun, 15 Jan 2006 19:50:08 -0500
Message-ID: <20060116005314.959522000@watt.suse.com>
References: <20060116005002.398989000@watt.suse.com>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs-old-format-size.diff
From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 6/6] reiserfs: check for files > 2GB on 3.5.x disks
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@osdl.org, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

When a filesystem has been converted from 3.5.x to 3.6.x, we need
an extra check during file write to make sure we are not trying
to make a 3.5.x file > 2GB.

diff -r ee81eb208598 fs/reiserfs/file.c
--- a/fs/reiserfs/file.c	Fri Jan 13 14:01:37 2006 -0500
+++ b/fs/reiserfs/file.c	Fri Jan 13 14:08:12 2006 -0500
@@ -1285,6 +1285,23 @@ static ssize_t reiserfs_file_write(struc
 	struct reiserfs_transaction_handle th;
 	th.t_trans_id = 0;
 
+	/* If a filesystem is converted from 3.5 to 3.6, we'll have v3.5 items
+	* lying around (most of the disk, in fact). Despite the filesystem
+	* now being a v3.6 format, the old items still can't support large
+	* file sizes. Catch this case here, as the rest of the VFS layer is
+	* oblivious to the different limitations between old and new items.
+	* reiserfs_setattr catches this for truncates. This chunk is lifted
+	* from generic_write_checks. */
+	if (get_inode_item_key_version (inode) == KEY_FORMAT_3_5 && 
+	    *ppos + count > MAX_NON_LFS) {
+		if (*ppos >= MAX_NON_LFS) {
+			send_sig(SIGXFSZ, current, 0);
+			return -EFBIG;
+		}
+		if (count > MAX_NON_LFS - (unsigned long)*ppos)
+			count = MAX_NON_LFS - (unsigned long)*ppos;
+	}
+
 	if (file->f_flags & O_DIRECT) {	// Direct IO needs treatment
 		ssize_t result, after_file_end = 0;
 		if ((*ppos + count >= inode->i_size)

--
