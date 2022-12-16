From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH 2/8] reiserfs: use kmap_local_folio() in _get_block_create_0()
Date: Fri, 16 Dec 2022 20:53:41 +0000
Message-ID: <20221216205348.3781217-3-willy@infradead.org>
References: <20221216205348.3781217-1-willy@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=DCrauRLt2EmPZPaFIh9kpV6gYQG4jQQqkdRBmcKkleQ=; b=ao2aqhzjy8BrR4/3l+tH2zQFRf
        acW92hIwDg8JLqfV5XjgbmOGc/DXA0rjsJ5RlRs8GNS/6DVxp3y9vFhYqqC+f+0SZOzKu0UY1zvVz
        F3/s3lLlNo5pmTA+dK5dOz3nO/D5KtsaNn04wcsKz+yFxGTYc4ICpucZJcpds3V8o626YPhaaSwjp
        oZXrAUkhZgA+LSP2Bc8PDclnDFHlkWmyay6BEhst5KdEogj3r3C6EhuAnmFVyuRPC9ZYczX8xsHUb
        TmFGP+n66GIecZVaOg9LPOPo/7zWn4uWWBi4HBR9DS3IQF6Nz2ITBYkQ8fxV67lZHsHWBmLXKXkAs
        FHqQwVwg==;
In-Reply-To: <20221216205348.3781217-1-willy@infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Ira Weiny <ira.weiny@intel.com>

Switch from the deprecated kmap() to kmap_local_folio().  For the
kunmap_local(), I subtract off 'chars' to prevent the possibility that
p has wrapped into the next page.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/reiserfs/inode.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 41c0a785e9ab..0ca2d439510a 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -390,8 +390,7 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
 	 * sure we need to.  But, this means the item might move if
 	 * kmap schedules
 	 */
-	p = (char *)kmap(bh_result->b_page);
-	p += offset;
+	p = kmap_local_folio(bh_result->b_folio, offset);
 	memset(p, 0, inode->i_sb->s_blocksize);
 	do {
 		if (!is_direct_le_ih(ih)) {
@@ -439,8 +438,8 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
 		ih = tp_item_head(&path);
 	} while (1);
 
-	flush_dcache_page(bh_result->b_page);
-	kunmap(bh_result->b_page);
+	flush_dcache_folio(bh_result->b_folio);
+	kunmap_local(p - chars);
 
 finished:
 	pathrelse(&path);
-- 
2.35.1

