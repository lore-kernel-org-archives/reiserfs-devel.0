From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH 2/3] reiserfs: use proper little-endian bitops
Date: Mon, 30 May 2011 22:53:14 +0900
Message-ID: <1306763595-13908-2-git-send-email-akinobu.mita@gmail.com>
References: <1306763595-13908-1-git-send-email-akinobu.mita@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
         :in-reply-to:references;
        bh=DmZags5pF7W7qL5SoNlPJTu54ZvbmrTflku8VN6pIJ8=;
        b=HVXSnJ81uMW/pmLDU28B4NBmNKQiNg7m/2kylRxji84koLHkpGkSsucsvcQ4nFw/mx
         SMAB1LQ/1aG2QWB96RHnaz4liBs6iNUH7DgRmQUziD4HvxXzj7NaGdhZCPL0X3It2jdX
         QjQtCAA8k6wW8++bSrzFM7TnRQJvrQsL+zOik=
In-Reply-To: <1306763595-13908-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, reiserfs-devel@vger.kernel.org

Using __test_and_{set,clear}_bit_le() with ignoring its return value
can be replaced with __{set,clear}_bit_le().

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: reiserfs-devel@vger.kernel.org
---
 fs/reiserfs/bitmap.c |    3 +--
 fs/reiserfs/resize.c |    6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/reiserfs/bitmap.c b/fs/reiserfs/bitmap.c
index f70dd69..f9e26c1 100644
--- a/fs/reiserfs/bitmap.c
+++ b/fs/reiserfs/bitmap.c
@@ -212,8 +212,7 @@ static int scan_bitmap_block(struct reiserfs_transaction_handle *th,
 					}
 					/* otherwise we clear all bit were set ... */
 					while (--i >= *beg)
-						__test_and_clear_bit_le
-						    (i, bh->b_data);
+						__clear_bit_le(i, bh->b_data);
 					reiserfs_restore_prepared_buffer(s, bh);
 					*beg = org;
 					/* ... and search again in current block from beginning */
diff --git a/fs/reiserfs/resize.c b/fs/reiserfs/resize.c
index 1e6f4c2..cd17ae2 100644
--- a/fs/reiserfs/resize.c
+++ b/fs/reiserfs/resize.c
@@ -136,7 +136,7 @@ int reiserfs_resize(struct super_block *s, unsigned long block_count_new)
 				return -EIO;
 			}
 			memset(bh->b_data, 0, sb_blocksize(sb));
-			__test_and_set_bit_le(0, bh->b_data);
+			__set_bit_le(0, bh->b_data);
 			reiserfs_cache_bitmap_metadata(s, bh, bitmap + i);
 
 			set_buffer_uptodate(bh);
@@ -172,7 +172,7 @@ int reiserfs_resize(struct super_block *s, unsigned long block_count_new)
 
 	reiserfs_prepare_for_journal(s, bh, 1);
 	for (i = block_r; i < s->s_blocksize * 8; i++)
-		__test_and_clear_bit_le(i, bh->b_data);
+		__clear_bit_le(i, bh->b_data);
 	info->free_count += s->s_blocksize * 8 - block_r;
 
 	journal_mark_dirty(&th, s, bh);
@@ -190,7 +190,7 @@ int reiserfs_resize(struct super_block *s, unsigned long block_count_new)
 
 	reiserfs_prepare_for_journal(s, bh, 1);
 	for (i = block_r_new; i < s->s_blocksize * 8; i++)
-		__test_and_set_bit_le(i, bh->b_data);
+		__set_bit_le(i, bh->b_data);
 	journal_mark_dirty(&th, s, bh);
 	brelse(bh);
 
-- 
1.7.4.4
