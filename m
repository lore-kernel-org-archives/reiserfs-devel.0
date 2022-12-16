From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH 3/8] reiserfs: Convert direct2indirect() to call folio_zero_range()
Date: Fri, 16 Dec 2022 20:53:42 +0000
Message-ID: <20221216205348.3781217-4-willy@infradead.org>
References: <20221216205348.3781217-1-willy@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=55nhYCS2WM3aurKUD+8s2RoJARzCY1JdmvCeXT5Y8QY=; b=nlitUDEFlHX2XXYYOLhJDj9iyH
        Qz6l3ieE+x1UsWd4+fXvEvnwyMSQ/TczBGGcPXIF4BLQwWtogcFKhqLcqzIdJJuLp6R6tTRphcj0D
        CYjd6IBNAak7qlOIc/HG5yVUxvY/aXothrN9EZ4UUP4Iy2cBDCO2CCtUSkutL8ye6R/eNUiNfGzdg
        Xyd7ChvLBFPKjY9hLtj3qlkm0sirP8hrhE2cHX3944bvKof+nRZluMfAE9/E3YNqGB2acveA0mDTc
        AqbWTc5qnOyQCx2Y2MO36U1nMOB7HC5f5heO4Ixi9Q26JqTp0qOamKN/1/vSyyPb4KaDubg1rErus
        ZFijNRvg==;
In-Reply-To: <20221216205348.3781217-1-willy@infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Ira Weiny <ira.weiny@intel.com>

Remove this open-coded call to kmap()/memset()/kunmap() with the
higher-level abstraction folio_zero_range().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/reiserfs/tail_conversion.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/reiserfs/tail_conversion.c b/fs/reiserfs/tail_conversion.c
index a61bca73c45f..ca36bb88b8b0 100644
--- a/fs/reiserfs/tail_conversion.c
+++ b/fs/reiserfs/tail_conversion.c
@@ -151,11 +151,11 @@ int direct2indirect(struct reiserfs_transaction_handle *th, struct inode *inode,
 	 * out the unused part of the block (it was not up to date before)
 	 */
 	if (up_to_date_bh) {
-		unsigned pgoff =
-		    (tail_offset + total_tail - 1) & (PAGE_SIZE - 1);
-		char *kaddr = kmap_atomic(up_to_date_bh->b_page);
-		memset(kaddr + pgoff, 0, blk_size - total_tail);
-		kunmap_atomic(kaddr);
+		size_t start = offset_in_folio(up_to_date_bh->b_folio,
+					(tail_offset + total_tail - 1));
+
+		folio_zero_range(up_to_date_bh->b_folio, start,
+				blk_size - total_tail);
 	}
 
 	REISERFS_I(inode)->i_first_direct_byte = U32_MAX;
-- 
2.35.1

