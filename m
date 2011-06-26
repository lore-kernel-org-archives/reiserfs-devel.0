From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH resend 4/6] reiserfs: use proper little-endian bitops
Date: Sun, 26 Jun 2011 14:57:54 +0900
Message-ID: <1309067876-3537-5-git-send-email-akinobu.mita@gmail.com>
References: <1309067876-3537-1-git-send-email-akinobu.mita@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
         :in-reply-to:references;
        bh=QTdSRRA7R7yft3bsuSrFCMLvSwEp+Hxk3nsT6CDgPsY=;
        b=VwvVl9M+D5KhtKMKcl6HwBMvPyJga0wum9o/+c4WRxzsVvt7+9rRCM5aqgt3rRnDTZ
         B2xKPZ8UznSiL4eTXu3GNTX6DJAmkzylmYegenAfCwSzu4b+4qMU9JL/sjEl6vldJVoT
         +L3JChm5sROoXEtQS/hZJ6XRbV1ki5fvXSCHw=
In-Reply-To: <1309067876-3537-1-git-send-email-akinobu.mita@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, reiserfs-devel@vger.kernel.org

Using __test_and_{set,clear}_bit_le() with ignoring its return value
can be replaced with __{set,clear}_bit_le().

This introduces reiserfs_{set,clear}_le_bit for __{set,clear}_bit_le
and does the above change with them.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: reiserfs-devel@vger.kernel.org
---
 fs/reiserfs/bitmap.c        |    2 +-
 fs/reiserfs/resize.c        |    6 +++---
 include/linux/reiserfs_fs.h |    2 ++
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/reiserfs/bitmap.c b/fs/reiserfs/bitmap.c
index 483442e..567385a 100644
--- a/fs/reiserfs/bitmap.c
+++ b/fs/reiserfs/bitmap.c
@@ -214,7 +214,7 @@ static int scan_bitmap_block(struct reiserfs_transaction_handle *th,
 					}
 					/* otherwise we clear all bit were set ... */
 					while (--i >= *beg)
-						reiserfs_test_and_clear_le_bit
+						reiserfs_clear_le_bit
 						    (i, bh->b_data);
 					reiserfs_restore_prepared_buffer(s, bh);
 					*beg = org;
diff --git a/fs/reiserfs/resize.c b/fs/reiserfs/resize.c
index b3a94d2..b6b9b1f 100644
--- a/fs/reiserfs/resize.c
+++ b/fs/reiserfs/resize.c
@@ -136,7 +136,7 @@ int reiserfs_resize(struct super_block *s, unsigned long block_count_new)
 				return -EIO;
 			}
 			memset(bh->b_data, 0, sb_blocksize(sb));
-			reiserfs_test_and_set_le_bit(0, bh->b_data);
+			reiserfs_set_le_bit(0, bh->b_data);
 			reiserfs_cache_bitmap_metadata(s, bh, bitmap + i);
 
 			set_buffer_uptodate(bh);
@@ -172,7 +172,7 @@ int reiserfs_resize(struct super_block *s, unsigned long block_count_new)
 
 	reiserfs_prepare_for_journal(s, bh, 1);
 	for (i = block_r; i < s->s_blocksize * 8; i++)
-		reiserfs_test_and_clear_le_bit(i, bh->b_data);
+		reiserfs_clear_le_bit(i, bh->b_data);
 	info->free_count += s->s_blocksize * 8 - block_r;
 
 	journal_mark_dirty(&th, s, bh);
@@ -190,7 +190,7 @@ int reiserfs_resize(struct super_block *s, unsigned long block_count_new)
 
 	reiserfs_prepare_for_journal(s, bh, 1);
 	for (i = block_r_new; i < s->s_blocksize * 8; i++)
-		reiserfs_test_and_set_le_bit(i, bh->b_data);
+		reiserfs_set_le_bit(i, bh->b_data);
 	journal_mark_dirty(&th, s, bh);
 	brelse(bh);
 
diff --git a/include/linux/reiserfs_fs.h b/include/linux/reiserfs_fs.h
index eca75df..96d465f 100644
--- a/include/linux/reiserfs_fs.h
+++ b/include/linux/reiserfs_fs.h
@@ -2332,7 +2332,9 @@ __u32 keyed_hash(const signed char *msg, int len);
 __u32 yura_hash(const signed char *msg, int len);
 __u32 r5_hash(const signed char *msg, int len);
 
+#define reiserfs_set_le_bit		__set_bit_le
 #define reiserfs_test_and_set_le_bit	__test_and_set_bit_le
+#define reiserfs_clear_le_bit		__clear_bit_le
 #define reiserfs_test_and_clear_le_bit	__test_and_clear_bit_le
 #define reiserfs_test_le_bit		test_bit_le
 #define reiserfs_find_next_zero_le_bit	find_next_zero_bit_le
-- 
1.7.4.4

