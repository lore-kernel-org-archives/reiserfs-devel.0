From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH 4/8] reiserfs: Convert reiserfs_delete_item() to use kmap_local_folio()
Date: Fri, 16 Dec 2022 20:53:43 +0000
Message-ID: <20221216205348.3781217-5-willy@infradead.org>
References: <20221216205348.3781217-1-willy@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=Axde40IIYnLKGgHM+KLoKUK+4c/QX0KAEOS8G4YPE4k=; b=uafEFe2OC9tj5Bfbw7SW+6Q9VS
        qUrULM2Nu6G2v9FnuwFtal6ZWyOdUi4TAm77ZhTRrW8Y9SM2ZW6iL90wbrt2BIAagseKjOE7bIO/L
        FoAA97k1Twq/d4KOarYci6kYF6wVNC9mHfVA2vI5OQJToAIbwlf75w9mi0rELiMTBhTJDMnNnlmxp
        1NdKtBiYdqRp7NeG63PjGe1ZGHwN7+O4pDHOHMZ8GFT7bMQBecrVpXX3luji5DOPqYF9yyIk7wPmR
        PJS5vVTCEOdgmta/CCsg0apK1hY6e+MxRahh1Z/ngZaQp/UEzKfabdxfYpMFS/5xyjD629WqrG+aZ
        WzkBO6kw==;
In-Reply-To: <20221216205348.3781217-1-willy@infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Ira Weiny <ira.weiny@intel.com>

kmap_atomic() is deprecated, and so is bh->b_page.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/reiserfs/stree.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index 84c12a1947b2..309c61bd90e0 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -1359,12 +1359,13 @@ int reiserfs_delete_item(struct reiserfs_transaction_handle *th,
 		 * -clm
 		 */
 
-		data = kmap_atomic(un_bh->b_page);
-		off = ((le_ih_k_offset(&s_ih) - 1) & (PAGE_SIZE - 1));
-		memcpy(data + off,
+		off = offset_in_folio(un_bh->b_folio,
+					le_ih_k_offset(&s_ih) - 1);
+		data = kmap_local_folio(un_bh->b_folio, off);
+		memcpy(data,
 		       ih_item_body(PATH_PLAST_BUFFER(path), &s_ih),
 		       ret_value);
-		kunmap_atomic(data);
+		kunmap_local(data);
 	}
 
 	/* Perform balancing after all resources have been collected at once. */
-- 
2.35.1

