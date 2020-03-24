From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 14/21] block: remove block/partitions/osf.h
Date: Tue, 24 Mar 2020 08:25:23 +0100
Message-ID: <20200324072530.544483-15-hch@lst.de>
References: <20200324072530.544483-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=Pr/RehRPh8nFjGKjHemQk7hDj8UU9w6ywzXadoPeoUo=; b=bXJRFSqChPaWB9F1oMcZ3p2vgk
        DkbJU+4bWGiIi9O0DPcjaWIUb9KKBIF+vrzotnKajiSovFENLf+19X5LKMyBbeb20MhZkkibUL9hO
        hYIX6xDSK3pHa0XiWqmTwzbFgcZNcRmkV3UgrnCDl66ZXOAwdEb3NhInBcZEi8ESOGcbFG89MgGtK
        zdPFBPbmeuyAYgq+/5V8+yx/+MracnStxpljGQffq8S6Hiz0Xti/fq63x9SvPqA+NivJfsHQtMd9t
        5T+XzfOSoOs+X1jsSuRw1WS/i0utAZtQoulL05ZFBkfNowz4xP0Rl7pr85B1jBPduJvoon1CJLtwH
        z/c3+Khw==;
In-Reply-To: <20200324072530.544483-1-hch@lst.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org

Just move the single define to block/partitions/osf.c.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/partitions/osf.c | 2 +-
 block/partitions/osf.h | 7 -------
 2 files changed, 1 insertion(+), 8 deletions(-)
 delete mode 100644 block/partitions/osf.h

diff --git a/block/partitions/osf.c b/block/partitions/osf.c
index 4b873973d6c0..84560d0765ed 100644
--- a/block/partitions/osf.c
+++ b/block/partitions/osf.c
@@ -9,9 +9,9 @@
  */
 
 #include "check.h"
-#include "osf.h"
 
 #define MAX_OSF_PARTITIONS 18
+#define DISKLABELMAGIC (0x82564557UL)
 
 int osf_partition(struct parsed_partitions *state)
 {
diff --git a/block/partitions/osf.h b/block/partitions/osf.h
deleted file mode 100644
index 80a58c382b3f..000000000000
--- a/block/partitions/osf.h
+++ /dev/null
@@ -1,7 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *  fs/partitions/osf.h
- */
-
-#define DISKLABELMAGIC (0x82564557UL)
-
-- 
2.25.1

