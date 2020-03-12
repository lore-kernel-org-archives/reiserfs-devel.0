From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 11/21] block: remove warn_no_part
Date: Thu, 12 Mar 2020 16:19:29 +0100
Message-ID: <20200312151939.645254-12-hch@lst.de>
References: <20200312151939.645254-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-scsi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=hMpMs5/uCHisOGza6BAoVgV7XqUrMgBsdg7vYtAzuK0=; b=HG0UWaUTkqqumruRAlbqkIO1nd
        RlITBTdPZSgSkBd82NCcufwBn6pwYp/zrl22TCXoUbPs3gDMXGBLHIIOJjWZpCTHwRHwBs2CXKYdY
        3It/kHl/Kvl7PMlWNmmvz4P1C2yECd79Io7RogjL3a04UM2wzSIcbNf6wrKqR3Pd8sASmDroYxYeX
        9j4Uc1Wn+w2FA9OahcOTyR1CAWX+Ye7ntwmjHyzOBgFFtXcKGwsjjPMjJmf1o4CeQZlTE/CsujTwx
        iJNTZcVfD5UmZf5ibFFTgzaCaemZhhGtgDLacxZXVpZ0IllNA2E1Ml/HZF8WN2t8bM+Lg5kcdD1Rb
        yFT3QPMA==;
In-Reply-To: <20200312151939.645254-1-hch@lst.de>
Sender: linux-scsi-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, linux-ext4@vger.kernel.org, reiserfs-devel@vger.kernel.org

The warn_no_part is initialized to 1 and never changed.  Remove
it and execute the code keyed off from it unconditionally.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/partitions/amiga.c | 10 ++++------
 block/partitions/check.c |  7 ++-----
 block/partitions/check.h |  3 ---
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/block/partitions/amiga.c b/block/partitions/amiga.c
index 560936617d9c..7fecc760b78f 100644
--- a/block/partitions/amiga.c
+++ b/block/partitions/amiga.c
@@ -42,9 +42,8 @@ int amiga_partition(struct parsed_partitions *state)
 			goto rdb_done;
 		data = read_part_sector(state, blk, &sect);
 		if (!data) {
-			if (warn_no_part)
-				pr_err("Dev %s: unable to read RDB block %d\n",
-				       bdevname(state->bdev, b), blk);
+			pr_err("Dev %s: unable to read RDB block %d\n",
+			       bdevname(state->bdev, b), blk);
 			res = -1;
 			goto rdb_done;
 		}
@@ -85,9 +84,8 @@ int amiga_partition(struct parsed_partitions *state)
 		blk *= blksize;	/* Read in terms partition table understands */
 		data = read_part_sector(state, blk, &sect);
 		if (!data) {
-			if (warn_no_part)
-				pr_err("Dev %s: unable to read partition block %d\n",
-				       bdevname(state->bdev, b), blk);
+			pr_err("Dev %s: unable to read partition block %d\n",
+			       bdevname(state->bdev, b), blk);
 			res = -1;
 			goto rdb_done;
 		}
diff --git a/block/partitions/check.c b/block/partitions/check.c
index ffe408fead0c..8fe46881ef63 100644
--- a/block/partitions/check.c
+++ b/block/partitions/check.c
@@ -37,8 +37,6 @@
 #include "sysv68.h"
 #include "cmdline.h"
 
-int warn_no_part = 1; /*This is ugly: should make genhd removable media aware*/
-
 static int (*check_part[])(struct parsed_partitions *) = {
 	/*
 	 * Probe partition formats with tables at disk address 0
@@ -186,9 +184,8 @@ check_partition(struct gendisk *hd, struct block_device *bdev)
 	/* The partition is unrecognized. So report I/O errors if there were any */
 		res = err;
 	if (res) {
-		if (warn_no_part)
-			strlcat(state->pp_buf,
-				" unable to read partition table\n", PAGE_SIZE);
+		strlcat(state->pp_buf,
+			" unable to read partition table\n", PAGE_SIZE);
 		printk(KERN_INFO "%s", state->pp_buf);
 	}
 
diff --git a/block/partitions/check.h b/block/partitions/check.h
index 0fcf80117887..19852b494e93 100644
--- a/block/partitions/check.h
+++ b/block/partitions/check.h
@@ -50,6 +50,3 @@ put_partition(struct parsed_partitions *p, int n, sector_t from, sector_t size)
 		strlcat(p->pp_buf, tmp, PAGE_SIZE);
 	}
 }
-
-extern int warn_no_part;
-
-- 
2.24.1

