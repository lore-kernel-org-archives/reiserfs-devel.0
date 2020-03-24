From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 16/21] block: remove block/partitions/sun.h
Date: Tue, 24 Mar 2020 08:25:25 +0100
Message-ID: <20200324072530.544483-17-hch@lst.de>
References: <20200324072530.544483-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-raid-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=r3d8FSs7qf8eFJptJEIKInacOughT5PJjt7ce+bRV7g=; b=CEibCPeSW7I0vPJNQTd+Sut4be
        tYalCMwxxFZ1aEmLq6PNqW2WKfpo8RCTi4yUgI4lG5/rRePFRSoSmaRfu/meRetZM3sjGMSVDP90Z
        pPt5SWMk7s5pqR2PWwXGe0FpUWLolKFy+3dPdX1eU1cgmip/2kmcNMpimCW6w5wv8YhXjcsI2BA8U
        rUe5lWHmJ+DE+NS7hS4+/wIvIvWr6Of1KgKeTTGptK+W7Mc+23QGYm+grkvnbobQzquVj4JjcK15g
        Z6bWs4nbxJ7JTCLfOVmVzfASYDKVxu2O8RUDCQGf99a0KS5hPynAY4TZMnoePENrZpM+J2q3LY13F
        btBFR/cw==;
In-Reply-To: <20200324072530.544483-1-hch@lst.de>
Sender: linux-raid-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org

Just move the two defines to block/partitions/sun.c.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/partitions/sun.c | 4 +++-
 block/partitions/sun.h | 8 --------
 2 files changed, 3 insertions(+), 9 deletions(-)
 delete mode 100644 block/partitions/sun.h

diff --git a/block/partitions/sun.c b/block/partitions/sun.c
index 90f36724e796..28b44100f2b1 100644
--- a/block/partitions/sun.c
+++ b/block/partitions/sun.c
@@ -9,7 +9,9 @@
  */
 
 #include "check.h"
-#include "sun.h"
+
+#define SUN_LABEL_MAGIC          0xDABE
+#define SUN_VTOC_SANITY          0x600DDEEE
 
 int sun_partition(struct parsed_partitions *state)
 {
diff --git a/block/partitions/sun.h b/block/partitions/sun.h
deleted file mode 100644
index 4c8877a5b52d..000000000000
--- a/block/partitions/sun.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *  fs/partitions/sun.h
- */
-
-#define SUN_LABEL_MAGIC          0xDABE
-#define SUN_VTOC_SANITY          0x600DDEEE
-
-- 
2.25.1

