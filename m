From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 1/7] roll back reiser4-fixed-null-pointer-dereference.patch
Date: Tue, 2 Feb 2010 02:56:06 +0100
Message-ID: <201002020256.06845.edward.shishkin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:from:to:subject:date
         :user-agent:mime-version:message-id:content-type
         :content-transfer-encoding;
        bh=tSqW/WrND+uFXE4KK2YSJU/6mMUMwy1NTpLpBGibDzc=;
        b=x+3onUEKDMbuHqYIPueVnSeYl7CQqUnr8TNZch5HQhcH5CaJVG+hzSkil7l/BlITxE
         MIPriVWbbLo2LhqAcnn/N5wquGCF/m8G5sVXcUl2b3DUQpeuITbbt/S63TH6ofaTyaG9
         do1fsguwZEMeexHApe/e44K/li+x6CsR8cOmM=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Roll back reiser4-fixed-null-pointer-dereference.patch
(wrong stuff)

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/super_ops.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
Index: linux-2.6.33-rc5-mm1/fs/reiser4/super_ops.c
===================================================================
--- linux-2.6.33-rc5-mm1.orig/fs/reiser4/super_ops.c
+++ linux-2.6.33-rc5-mm1/fs/reiser4/super_ops.c
@@ -395,7 +395,7 @@ static void reiser4_sync_inodes(struct s
 	reiser4_context *ctx;
 	long to_write;
 
-	if (wbc == NULL || wbc->for_kupdate)
+	if (wbc->for_kupdate)
 		/* reiser4 has its own means of periodical write-out */
 		return;
 
