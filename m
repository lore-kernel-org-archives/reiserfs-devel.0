From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 06/21] scsi: simplify scsi_bios_ptable
Date: Tue, 24 Mar 2020 08:25:15 +0100
Message-ID: <20200324072530.544483-7-hch@lst.de>
References: <20200324072530.544483-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-scsi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=xzOt8fMvCstpG82eCFr8C95sNdlwqPKce2JTRvr80yo=; b=q4dxPpHXc130e2M77FRt/+pUHc
        L1S+CekGinGo87SipqWc3r1LkZcyY2GCryHn/NJYAawYcQdlHrcBIgoTZbErCorp+iBvAEAKEBQqP
        iehmBFcxzlq6h5UvOcQlu+kni0vrM+MhWEHjm0zyHSqQbeCOmMOykm8wFhwk6cudx7WugX0XePKPq
        RUfYDBMDDo6uMgxidDOvR6Die5phfY9o3ernra6SHUqsbBMoaHLWD0Id9H7NP/BQmxZeLrn5S4DPt
        TwXUSBHo+Ygtn1uFluk0Ljy7YRccqVXuutMn3GKstNHR7qkYhOLBy/nw8xaQaHaDfMI42PzbumbWF
        /E/ONhIg==;
In-Reply-To: <20200324072530.544483-1-hch@lst.de>
Sender: linux-scsi-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org

Use read_mapping_page and kmemdup instead of the odd read_dev_sector and
put_dev_sector helpers from the partitioning code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/scsicam.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/scsi/scsicam.c b/drivers/scsi/scsicam.c
index e969138051c7..91a9530a4dcb 100644
--- a/drivers/scsi/scsicam.c
+++ b/drivers/scsi/scsicam.c
@@ -35,19 +35,17 @@ static int setsize(unsigned long capacity, unsigned int *cyls, unsigned int *hds
  */
 unsigned char *scsi_bios_ptable(struct block_device *dev)
 {
-	unsigned char *res = kmalloc(66, GFP_KERNEL);
-	if (res) {
-		struct block_device *bdev = dev->bd_contains;
-		Sector sect;
-		void *data = read_dev_sector(bdev, 0, &sect);
-		if (data) {
-			memcpy(res, data + 0x1be, 66);
-			put_dev_sector(sect);
-		} else {
-			kfree(res);
-			res = NULL;
-		}
-	}
+	struct address_space *mapping = dev->bd_contains->bd_inode->i_mapping;
+	unsigned char *res = NULL;
+	struct page *page;
+
+	page = read_mapping_page(mapping, 0, NULL);
+	if (IS_ERR(page))
+		return NULL;
+
+	if (!PageError(page))
+		res = kmemdup(page_address(page) + 0x1be, 66, GFP_KERNEL);
+	put_page(page);
 	return res;
 }
 EXPORT_SYMBOL(scsi_bios_ptable);
-- 
2.25.1

