From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 13/21] block: remove block/partitions/karma.h
Date: Thu, 12 Mar 2020 16:19:31 +0100
Message-ID: <20200312151939.645254-14-hch@lst.de>
References: <20200312151939.645254-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-block-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=ABEU/z7lsXGuGe1amIkhjXTbw805aSLYXuvorFP/c3k=; b=T/4LYR/akk9J+gFFrv/ViLv2an
        JbyCsYuHTCufoMBEiaU1qhf95fHWQ70Uur5ME2p4xxztO2ZqecS5iPT+dxt0vTuJYlJq0TPnGmuPY
        Ej3CfkeKY/YiRPsuLhefs4KfJHPTfuqTmd6Cz6woBT6OZBGOVBSO7jtE1n8GxdHuWuyim5QhEug3o
        Wv1U4ziLSqadY5UiLruOkuUFU1N2b6u7b3iVNvBoawleHe9VMPBOLCDZEyO+rHiseWSCYaDO3tbuv
        g1r5Hn1T9rIwko5J3R5mzRW00u5kuEebPFsJUplpkPMLBTcfeYc85zvlLwFxEorVeTXp/BjHhMo/f
        eyDiq9AQ==;
In-Reply-To: <20200312151939.645254-1-hch@lst.de>
Sender: linux-block-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, linux-ext4@vger.kernel.org, reiserfs-devel@vger.kernel.org

Just move the single define to block/partitions/karma.c.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/partitions/karma.c | 3 ++-
 block/partitions/karma.h | 6 ------
 2 files changed, 2 insertions(+), 7 deletions(-)
 delete mode 100644 block/partitions/karma.h

diff --git a/block/partitions/karma.c b/block/partitions/karma.c
index 59812d705c3d..4d93512f4bd4 100644
--- a/block/partitions/karma.c
+++ b/block/partitions/karma.c
@@ -8,9 +8,10 @@
  */
 
 #include "check.h"
-#include "karma.h"
 #include <linux/compiler.h>
 
+#define KARMA_LABEL_MAGIC		0xAB56
+
 int karma_partition(struct parsed_partitions *state)
 {
 	int i;
diff --git a/block/partitions/karma.h b/block/partitions/karma.h
deleted file mode 100644
index 1b5eec57ee0c..000000000000
--- a/block/partitions/karma.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *  fs/partitions/karma.h
- */
-
-#define KARMA_LABEL_MAGIC		0xAB56
-- 
2.24.1

