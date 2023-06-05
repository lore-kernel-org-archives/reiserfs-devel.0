From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH] reiserfs: Check the return value from __getblk()
Date: Mon,  5 Jun 2023 15:23:34 +0100
Message-ID: <20230605142335.2883264-1-willy@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=nqbacqYZqdaTLSdq8WdcklSNR+rRKGJ6t+mfKXpJf+w=; b=tHg1IFN1El5qctk9bEViczJsa5
        fv/TI/p170O3RrWljCjla+k//0frzq4O0c5I92bdSyQ5xCg1nuFcaDxBWYKlz4wp0CJUcH2Mz/9ng
        rbRLkLgDKYpUceOs9ooQ1daiBZQN5BRqSiy6q1juRHQAyZMV4QJsqu3pwsbAZ/9ET1xMGmNPhlvsW
        bh6FZjyq9jSwbTUWSKJ5YMoi3oqGq8DfQVAyCvpC5mvnWMfvh9uLP5HCGHsAQ6noO1ccoY7ektR4T
        q8onyxKXdlbqbl0YMvtA/R4H7b5Ogvd0aoApp4ePGcJ9CdAjg8cdZupu6agd2sF/p4+JFc63XxBdx
        1cimY+Sg==;
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, butt3rflyh4ck <butterflyhuangxx@gmail.com>

__getblk() can return a NULL pointer if we run out of memory or if
we try to access beyond the end of the device; check it and handle it
appropriately.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Link: https://lore.kernel.org/lkml/CAFcO6XOacq3hscbXevPQP7sXRoYFz34ZdKPYjmd6k5sZuhGFDw@mail.gmail.com/
Tested-by: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") # probably introduced in 2002
---
 fs/reiserfs/journal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 4d11d60f493c..dd58e0dca5e5 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2326,7 +2326,7 @@ static struct buffer_head *reiserfs_breada(struct block_device *dev,
 	int i, j;
 
 	bh = __getblk(dev, block, bufsize);
-	if (buffer_uptodate(bh))
+	if (!bh || buffer_uptodate(bh))
 		return (bh);
 
 	if (block + BUFNR > max_block) {
@@ -2336,6 +2336,8 @@ static struct buffer_head *reiserfs_breada(struct block_device *dev,
 	j = 1;
 	for (i = 1; i < blocks; i++) {
 		bh = __getblk(dev, block + i, bufsize);
+		if (!bh)
+			break;
 		if (buffer_uptodate(bh)) {
 			brelse(bh);
 			break;
-- 
2.39.2

