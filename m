From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH resend 5/6] reiserfs: use hweight_long()
Date: Sun, 26 Jun 2011 14:57:55 +0900
Message-ID: <1309067876-3537-6-git-send-email-akinobu.mita@gmail.com>
References: <1309067876-3537-1-git-send-email-akinobu.mita@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
         :in-reply-to:references;
        bh=ohg2pqtLrOloZGO5wUtnfFH712Q72FQetKbif9eJD5M=;
        b=LFmJ2lQTtxZQGhzXdldIzVR9P5GEA6016rgFc3e9Mk48+DYDcgCmVDxOyUWohHOyeQ
         lQhUT/oFTMh1WMSsiACr6WnctI1HOyGF4oroP0ymOZsadEwwlmuMpO9wKtXgtRsXPg0x
         A9AYBmTn9BTAHAxIKEbre5HfNwhMmAlAnuGdg=
In-Reply-To: <1309067876-3537-1-git-send-email-akinobu.mita@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, reiserfs-devel@vger.kernel.org

Use hweight_long() to count free bits in the bitmap.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: reiserfs-devel@vger.kernel.org
---
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

