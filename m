From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH 3/3] reiserfs: use hweight_long
Date: Mon, 30 May 2011 22:53:15 +0900
Message-ID: <1306763595-13908-3-git-send-email-akinobu.mita@gmail.com>
References: <1306763595-13908-1-git-send-email-akinobu.mita@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
         :in-reply-to:references;
        bh=k3ZGzUK353SFWnaFXJWHEU0ythYGk6gFDP5panTOmVM=;
        b=EhVn60tE1yiG/hyghy8c1N3+ObHkPgc1YXUvOLpf80CS/gjdFNi3AIJsY4THo+pjcs
         EMg78e62M5e0CduYwQm5rfWeDqvm1wlPq0klLHjUVmPnfoQgovHo9zlKUwIsapjGDfup
         x/+qgbP5+Lsej+6AnONXhYHA4e7FaUnqg3qX0=
In-Reply-To: <1306763595-13908-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
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
 fs/reiserfs/bitmap.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/fs/reiserfs/bitmap.c b/fs/reiserfs/bitmap.c
index f9e26c1..69d7137 100644
--- a/fs/reiserfs/bitmap.c
+++ b/fs/reiserfs/bitmap.c
@@ -1219,15 +1219,11 @@ void reiserfs_cache_bitmap_metadata(struct super_block *sb,
 	info->free_count = 0;
 
 	while (--cur >= (unsigned long *)bh->b_data) {
-		int i;
-
 		/* 0 and ~0 are special, we can optimize for them */
 		if (*cur == 0)
 			info->free_count += BITS_PER_LONG;
 		else if (*cur != ~0L)	/* A mix, investigate */
-			for (i = BITS_PER_LONG - 1; i >= 0; i--)
-				if (!test_bit_le(i, cur))
-					info->free_count++;
+			info->free_count += BITS_PER_LONG - hweight_long(*cur);
 	}
 }
 
-- 
1.7.4.4
