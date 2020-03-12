From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 16/21] block: remove block/partitions/sun.h
Date: Thu, 12 Mar 2020 16:19:34 +0100
Message-ID: <20200312151939.645254-17-hch@lst.de>
References: <20200312151939.645254-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-raid-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=2LWz+IqIM5pjnYsoc6C9Se72Jf2MPu2WCdsKyWxUKKQ=; b=hvqAl2QwtsESlC0QcXbeueYJ6E
        bFFRnDazECe5tzJ9APUzrk40tYC7iu1EmAi5O/tt0pY/Hxf6JBlEfj0ug//hJ0KrW+uG8SKqVKTRF
        wwuutPcGZbpWPi6dh41UR81Lr32S7K4/Lp2tPsDQdtvb0wdzZIUFh4U9NrcDo8NM7ibMXmlsGlRTk
        csJAHs/f0sJn/QFfwGWAlMws11cZSneQvN/Lj3+VNj7SoYuvstGyTme7v5EcQoAxgRKp66xkwJ4vW
        dQk43MKhWA30pJMSFYfL/xom6dDhALyzOyK7YGZKsSBEwqBFwJ2ADgNY5Bm2oH+2KqqQLksDDFK20
        EIctOeHA==;
In-Reply-To: <20200312151939.645254-1-hch@lst.de>
Sender: linux-raid-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, linux-ext4@vger.kernel.org, reiserfs-devel@vger.kernel.org

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
2.24.1

