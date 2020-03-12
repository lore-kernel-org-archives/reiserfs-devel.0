From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 01/21] block: remove the blk_lookup_devt export
Date: Thu, 12 Mar 2020 16:19:19 +0100
Message-ID: <20200312151939.645254-2-hch@lst.de>
References: <20200312151939.645254-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=39tT0OaEKs+SldBNXJomJ786zlNa0gY40ejPQEQMio4=; b=g4U/44sO4BPPbyhpZEzGz422ow
        RJ2+HAqJuUWeNdVmlczT3DYeTU9DXfSF1gNgVehKiY55UP2yAmsUi4lyoFzyqFjAU2hiuRM6VFql6
        K1Sr081QEobpqYGa3c28ajvEeN3UA5djaNaRIMI7LqHuPZ8niMaRZ9YY1VgyL2SJIt0F02Qp+l+5M
        mMO7jJO1oTLdGv4BcLALa6Sr5LHI9DlHuRBZhicTl4TlipKdN3PqSYIardmJr6ugOhWaZI1+MkDol
        QET92HOYtb2IQv69RmkDlhB0xOo4+dkQoE/AjrWpbZHLPsQykwgJ6Jf43h9mp+/qvjlc6zXqDEVSE
        wQO/idQA==;
In-Reply-To: <20200312151939.645254-1-hch@lst.de>
Sender: linux-ext4-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, linux-ext4@vger.kernel.org, reiserfs-devel@vger.kernel.org

This function is only used by init/do_mounts.c, which can't be modular.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/genhd.c b/block/genhd.c
index ff6268970ddc..56e9547870ee 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1463,7 +1463,6 @@ dev_t blk_lookup_devt(const char *name, int partno)
 	class_dev_iter_exit(&iter);
 	return devt;
 }
-EXPORT_SYMBOL(blk_lookup_devt);
 
 struct gendisk *__alloc_disk_node(int minors, int node_id)
 {
-- 
2.24.1

