From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 15/21] block: remove block/partitions/sgi.h
Date: Thu, 12 Mar 2020 16:19:33 +0100
Message-ID: <20200312151939.645254-16-hch@lst.de>
References: <20200312151939.645254-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=kLwglDMh0TVz4LfdfVy31AKX5i4dfmAxdHb0FAmOyYI=; b=LIqb4I1iQKYZjDizrHubTytfPV
        qi150L1ksPz/QYLF29sQS+zzBACSqgvXE2bZAi3IFbDIeOWButtgj1dsGSD1+V4aHJrKj+1uJyJhP
        1L/iQaQvLCa80SJDRoO+CK1dNJf0urKxrx7GuJWfjhr1pVKzF/FAjt2F67GBl42W9kJa/DrF3bQcN
        icGXwSbC4SRvF12NbxU3lYHiXJeQL8BgRsAEmNocjgBXb/2tet+vQpRRA5O14drsEx55B65uHXgrx
        Pkeldy7rH2RWNkoMQ8Qaa9XU5Vbmohdq4og6F6a+2Gh12lXKWcII3SBhnleeIuq6pITG9X4CzJ3Sv
        IMUovNjQ==;
In-Reply-To: <20200312151939.645254-1-hch@lst.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, linux-ext4@vger.kernel.org, reiserfs-devel@vger.kernel.org

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
2.24.1

