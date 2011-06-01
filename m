From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH v2 2/2] reiserfs: use hweight_long()
Date: Wed,  1 Jun 2011 23:39:58 +0900
Message-ID: <1306939198-11356-2-git-send-email-akinobu.mita@gmail.com>
References: <1306939198-11356-1-git-send-email-akinobu.mita@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
         :in-reply-to:references;
        bh=3aGJ04OS2HOwz+rWA2amH+cDbUHRxJ2QdSkmaBkrhxo=;
        b=Vuo9PgGMsX/u1l0qKCuG43ls4S3n82DZ3ZiamPPFpwyiQH2iE99RFlicq1m0zJ8dMR
         XVRf7emJuFpgGJn9Uw+7K50KhmJhLjX6oL9XyJsxI7efCEj9CPJqmN3MDySXtEZE7dFn
         SqTJ1Hbn5xW5os/wXkqcT+zx1qPPJnk+4R/jk=
In-Reply-To: <1306939198-11356-1-git-send-email-akinobu.mita@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, reiserfs-devel@vger.kernel.org

Use hweight_long() to count free bits in the bitmap.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: reiserfs-devel@vger.kernel.org
---
v2: rewritten to keep reiserfs_*_le_bit() macros

 fs/reiserfs/bitmap.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/fs/reiserfs/bitmap.c b/fs/reiserfs/bitmap.c
index 567385a..d1aca1d 100644
--- a/fs/reiserfs/bitmap.c
+++ b/fs/reiserfs/bitmap.c
@@ -1222,15 +1222,11 @@ void reiserfs_cache_bitmap_metadata(struct super_block *sb,
 	info->free_count = 0;
 
 	while (--cur >= (unsigned long *)bh->b_data) {
-		int i;
-
 		/* 0 and ~0 are special, we can optimize for them */
 		if (*cur == 0)
 			info->free_count += BITS_PER_LONG;
 		else if (*cur != ~0L)	/* A mix, investigate */
-			for (i = BITS_PER_LONG - 1; i >= 0; i--)
-				if (!reiserfs_test_le_bit(i, cur))
-					info->free_count++;
+			info->free_count += BITS_PER_LONG - hweight_long(*cur);
 	}
 }
 
-- 
1.7.4.4

