From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 03/21] block: move disk_name and related helpers out of partition-generic.c
Date: Thu, 12 Mar 2020 16:19:21 +0100
Message-ID: <20200312151939.645254-4-hch@lst.de>
References: <20200312151939.645254-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-raid-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=EfilLAFrncTsSsa8TOfejZ7S+JTiW9Crgihh310E1a4=; b=dCV23XyI+/V+gi2QLomFmVpDa8
        GTjHgZ/i0PjIUmP8XRsXqPmg6rzyF494hxLHMleFE4FfFdboW/LoRudM+/btiye4JZ/zAGLCj3Z52
        wovqAwCMhBBK+wyYEf+zKWy+S4ykaFd66VwsuVNNPO8Jsi2v6v0Aryx/X1BMmNYAYdjTpZIG+8rHE
        O81XDIyHxgbSL33c+tFLHiEuUel/Kp22CVtVZEvfOPG85KLEsELp//RFuO9wO8ibPJjKqrcjL1kVM
        iE/DC/lH2vzkZriuyrTgNaPAf+tLEcCTSm2fVeTuTUlhXu9CTZLgfJ3OPkcS2LPmUOXzVCivR9K4I
        yzIaGoYA==;
In-Reply-To: <20200312151939.645254-1-hch@lst.de>
Sender: linux-raid-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, linux-ext4@vger.kernel.org, reiserfs-devel@vger.kernel.org

Thes functions aren't really related to partition support, so move them
to a more suitable place.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio.c               |  6 ++++++
 block/genhd.c             | 22 ++++++++++++++++++++++
 block/partition-generic.c | 32 --------------------------------
 3 files changed, 28 insertions(+), 32 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 94d697217887..816c81780888 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -679,6 +679,12 @@ struct bio *bio_clone_fast(struct bio *bio, gfp_t gfp_mask, struct bio_set *bs)
 }
 EXPORT_SYMBOL(bio_clone_fast);
 
+const char *bio_devname(struct bio *bio, char *buf)
+{
+	return disk_name(bio->bi_disk, bio->bi_partno, buf);
+}
+EXPORT_SYMBOL(bio_devname);
+
 static inline bool page_is_mergeable(const struct bio_vec *bv,
 		struct page *page, unsigned int len, unsigned int off,
 		bool *same_page)
diff --git a/block/genhd.c b/block/genhd.c
index 56e9547870ee..18435524e51c 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -46,6 +46,28 @@ static void disk_add_events(struct gendisk *disk);
 static void disk_del_events(struct gendisk *disk);
 static void disk_release_events(struct gendisk *disk);
 
+/*
+ * Format the devicename of the indicated disk into the supplied buffer and
+ * return a pointer to that same buffer for convenience.
+ */
+char *disk_name(struct gendisk *hd, int partno, char *buf)
+{
+	if (!partno)
+		snprintf(buf, BDEVNAME_SIZE, "%s", hd->disk_name);
+	else if (isdigit(hd->disk_name[strlen(hd->disk_name)-1]))
+		snprintf(buf, BDEVNAME_SIZE, "%sp%d", hd->disk_name, partno);
+	else
+		snprintf(buf, BDEVNAME_SIZE, "%s%d", hd->disk_name, partno);
+
+	return buf;
+}
+
+const char *bdevname(struct block_device *bdev, char *buf)
+{
+	return disk_name(bdev->bd_disk, bdev->bd_part->partno, buf);
+}
+EXPORT_SYMBOL(bdevname);
+
 void part_inc_in_flight(struct request_queue *q, struct hd_struct *part, int rw)
 {
 	if (queue_is_mq(q))
diff --git a/block/partition-generic.c b/block/partition-generic.c
index 1d91ea3b4f6b..6f48aa406aaf 100644
--- a/block/partition-generic.c
+++ b/block/partition-generic.c
@@ -25,38 +25,6 @@
 extern void md_autodetect_dev(dev_t dev);
 #endif
  
-/*
- * disk_name() is used by partition check code and the genhd driver.
- * It formats the devicename of the indicated disk into
- * the supplied buffer (of size at least 32), and returns
- * a pointer to that same buffer (for convenience).
- */
-
-char *disk_name(struct gendisk *hd, int partno, char *buf)
-{
-	if (!partno)
-		snprintf(buf, BDEVNAME_SIZE, "%s", hd->disk_name);
-	else if (isdigit(hd->disk_name[strlen(hd->disk_name)-1]))
-		snprintf(buf, BDEVNAME_SIZE, "%sp%d", hd->disk_name, partno);
-	else
-		snprintf(buf, BDEVNAME_SIZE, "%s%d", hd->disk_name, partno);
-
-	return buf;
-}
-
-const char *bdevname(struct block_device *bdev, char *buf)
-{
-	return disk_name(bdev->bd_disk, bdev->bd_part->partno, buf);
-}
-
-EXPORT_SYMBOL(bdevname);
-
-const char *bio_devname(struct bio *bio, char *buf)
-{
-	return disk_name(bio->bi_disk, bio->bi_partno, buf);
-}
-EXPORT_SYMBOL(bio_devname);
-
 static ssize_t part_partition_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
-- 
2.24.1

