From: zengjx95@gmail.com
Subject: [PATCH] fs/reiserfs/inode: remove dead code in _get_block_create_0()
Date: Wed, 20 Jul 2022 14:33:10 +0800
Message-ID: <20220720063310.992149-1-zengjx95@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ip8sfT3MomUNm29brPu+2k5VsrDURTEoCZs6KvoAjCg=;
        b=mPCN2m2YAamRuXjOWWlyImJNiFeyt9Ei44tMgjZzOD0xokfqaWnWh0tbE50km4Eq9u
         gaRLkV6Wbul9wu4a6BAlyq1P6IAJe11QlDd5TJGgVQft0yuno8FMpFEOe9OMGhbQQiXF
         ovmm3I8q+Vtmunej3wNf5sPEVr7GUPp0uSN9lDzGqtV/8Ll1xU4+P2+7KefkLjQyxztT
         5Dno5OwJ1iWi3FF1bV6r/RvY/g5k32Zoi5RXelQJNeIz5K19w7BDpIWXnWlyiPR7CmE9
         WPFM50xagworbq55Zia6FJgqN+QYxveWfeDg/afGny+xCu0hqZ5aA4XfDfODXCY1KMvP
         543g==
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: willy@infradead.org, jlayton@kernel.org, damien.lemoal@opensource.wdc.com, jack@suse.cz, edward.shishkin@gmail.com, linux-kernel@vger.kernel.org, Zeng Jingxiang <linuszeng@tencent.com>

From: Zeng Jingxiang <linuszeng@tencent.com>

Fix "control flow" issues found by Coverity
Logically dead code (DEADCODE)
Execution cannot reach this statement.

Assigned_value: Assigning value NULL to p here
293	char *p = NULL;
In the following conditional expression, the value of p is always NULL,
as a result, the kunmap() cannot be executed.
308	if (p)
309		kunmap(bh_result->b_page);

355	if (p)
356		kunmap(bh_result->b_page);

366	if (p)
367		kunmap(bh_result->b_page);

Signed-off-by: Zeng Jingxiang <linuszeng@tencent.com>
---
 fs/reiserfs/inode.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 0cffe054b78e..d1b0c7645fcb 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -305,8 +305,6 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
 	result = search_for_position_by_key(inode->i_sb, &key, &path);
 	if (result != POSITION_FOUND) {
 		pathrelse(&path);
-		if (p)
-			kunmap(bh_result->b_page);
 		if (result == IO_ERROR)
 			return -EIO;
 		/*
@@ -352,8 +350,6 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
 		}
 
 		pathrelse(&path);
-		if (p)
-			kunmap(bh_result->b_page);
 		return ret;
 	}
 	/* requested data are in direct item(s) */
@@ -363,8 +359,6 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
 		 * when it is stored in direct item(s)
 		 */
 		pathrelse(&path);
-		if (p)
-			kunmap(bh_result->b_page);
 		return -ENOENT;
 	}
 
-- 
2.27.0

