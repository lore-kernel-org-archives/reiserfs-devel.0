From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH 5/8] reiserfs: Convert do_journal_end() to use kmap_local_folio()
Date: Fri, 16 Dec 2022 20:53:44 +0000
Message-ID: <20221216205348.3781217-6-willy@infradead.org>
References: <20221216205348.3781217-1-willy@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=nZjqb/pnX3kUAIPhMQGB+kKLtRzP7goj+6JV9G39dj8=; b=vLn6w77XxVWd5b0UsMTcj9FN/Y
        5l4ix4o6FMXDXQETHjrPHgHfsKci9/ryEqP1b/+7kdR5AhQa7KhcoaOzzy7SMR+dpJaxILM0AKco+
        ilQwpLMww65c9mcsRUgAspuvTcJksBWo0GlPJ9huThpp03GzdKvWs9jzwfnqcaXPfuZdY7v74vqbr
        k6GrzJyiDpHrlZVA3CZsGnTCJNUznq3LC//OV3CJoMBmJtSCYy6zPTdSEVo5nCfE0gz0qVWzPZ5We
        XTNKDY7iZwALrAJ2Tl8d9Oxz6Pyicch1kXhnZKr0CtWmBHrsfv2wGqX856B3OHytrc6SombuwTBud
        Brlw5wkA==;
In-Reply-To: <20221216205348.3781217-1-willy@infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Ira Weiny <ira.weiny@intel.com>

Remove uses of kmap() and b_page.  Also move the set_buffer_uptodate()
call to after the memcpy() so that the memory barrier in
set_buffer_uptodate() actually ensures that the old data can't be visible.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/reiserfs/journal.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 9ce4ec296b74..faf2f09d82e1 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -4200,21 +4200,19 @@ static int do_journal_end(struct reiserfs_transaction_handle *th, int flags)
 		/* copy all the real blocks into log area.  dirty log blocks */
 		if (buffer_journaled(cn->bh)) {
 			struct buffer_head *tmp_bh;
+			size_t offset = offset_in_folio(cn->bh->b_folio,
+							cn->bh->b_data);
 			char *addr;
-			struct page *page;
 			tmp_bh =
 			    journal_getblk(sb,
 					   SB_ONDISK_JOURNAL_1st_BLOCK(sb) +
 					   ((cur_write_start +
 					     jindex) %
 					    SB_ONDISK_JOURNAL_SIZE(sb)));
+			addr = kmap_local_folio(cn->bh->b_folio, offset);
+			memcpy(tmp_bh->b_data, addr, cn->bh->b_size);
+			kunmap_local(addr);
 			set_buffer_uptodate(tmp_bh);
-			page = cn->bh->b_page;
-			addr = kmap(page);
-			memcpy(tmp_bh->b_data,
-			       addr + offset_in_page(cn->bh->b_data),
-			       cn->bh->b_size);
-			kunmap(page);
 			mark_buffer_dirty(tmp_bh);
 			jindex++;
 			set_buffer_journal_dirty(cn->bh);
-- 
2.35.1

