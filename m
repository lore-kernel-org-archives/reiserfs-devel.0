From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 15/21] block: remove block/partitions/sgi.h
Date: Tue, 24 Mar 2020 08:25:24 +0100
Message-ID: <20200324072530.544483-16-hch@lst.de>
References: <20200324072530.544483-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=zz3z8LEy22DKtLeYbwznT4mKh/7OHKNntu1EmMbjvSQ=; b=td9gpJl7naridlw1z7+XzNOlCs
        dXgLf1z30L0jHMqtepi1ccp9P6jhL29hZ++1M5jeLmNun2gJt8QdHbuqLypWR1sktUYXVmh/FANFw
        BhGSWosxeJQJ6exjpjYTEDBtYA40y8DMBhHu5xzVjUHDbvF4bL1TEOBrOSM/DjGc+qsbNVksjtcPj
        yV8G6miKe7KJwzw5z2vN+51lz5Gk2vfUl4BUNRdbD0E5KoCwcj0mXpG4ZdV8G2lRmsqLO7TndKEcn
        nB/Od2OfEVTdVRSReMcO3IEk+CWhg+aAZfJk2LtuFHeFr2SA6JXSHMXgto2YP8bU2f1paDMm45Dyy
        ZYhbUKYA==;
In-Reply-To: <20200324072530.544483-1-hch@lst.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org

Just move the single define to block/partitions/sgi.c.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/partitions/sgi.c | 3 ++-
 block/partitions/sgi.h | 8 --------
 2 files changed, 2 insertions(+), 9 deletions(-)
 delete mode 100644 block/partitions/sgi.h

diff --git a/block/partitions/sgi.c b/block/partitions/sgi.c
index d7b421c6e530..927cf501603e 100644
--- a/block/partitions/sgi.c
+++ b/block/partitions/sgi.c
@@ -6,7 +6,8 @@
  */
 
 #include "check.h"
-#include "sgi.h"
+
+#define SGI_LABEL_MAGIC 0x0be5a941
 
 struct sgi_disklabel {
 	__be32 magic_mushroom;		/* Big fat spliff... */
diff --git a/block/partitions/sgi.h b/block/partitions/sgi.h
deleted file mode 100644
index 372cdad19fea..000000000000
--- a/block/partitions/sgi.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *  fs/partitions/sgi.h
- */
-
-
-#define SGI_LABEL_MAGIC 0x0be5a941
-
-- 
2.25.1

