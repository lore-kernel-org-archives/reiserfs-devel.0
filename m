From: Dmitriy Monakhov <dmonakhov@sw.ru>
Subject: [patch] reiserfs: possible null pointer dereference during resize
Date: Tue, 20 Feb 2007 10:58:21 +0300
Message-ID: <87ps85z2ea.fsf@sw.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S964866AbXBTH56@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: reiserfs-list@namesys.com

--=-=-=

sb_read may return NULL, let's explicitly check it.
If so free new bitmap blocks array, after this we may safely exit as it done
above during bitmap allocation.
Signed-off-by: Dmitriy Monakhov <dmonakhov@openvz.org>
-------------

--=-=-=
Content-Disposition: inline;
 filename=diff-mm-reiserfs-resize-sb_read-errh-fix

diff --git a/fs/reiserfs/resize.c b/fs/reiserfs/resize.c
index 3156847..976cc78 100644
--- a/fs/reiserfs/resize.c
+++ b/fs/reiserfs/resize.c
@@ -131,6 +131,10 @@ int reiserfs_resize(struct super_block *s, unsigned long block_count_new)
 			/* don't use read_bitmap_block since it will cache
 			 * the uninitialized bitmap */
 			bh = sb_bread(s, i * s->s_blocksize * 8);
+			if (!bh) {
+				vfree(bitmap);
+				return -EIO;
+			}
 			memset(bh->b_data, 0, sb_blocksize(sb));
 			reiserfs_test_and_set_le_bit(0, bh->b_data);
 			reiserfs_cache_bitmap_metadata(s, bh, bitmap + i);

--=-=-=--
