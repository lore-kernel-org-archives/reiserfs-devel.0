From: zengjx95@gmail.com
Subject: [PATCH] fs/reiserfs/inode: remove dead code in _get_block_create_0()
Date: Wed, 20 Jul 2022 16:30:29 +0800
Message-ID: <20220720083029.1065578-1-zengjx95@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a4hnXU+gPzGHldVhXjvL5+wspZw5HKKLAhcUlf3OAD8=;
        b=bJmh8wkgWva5xdCx1aG3wwUoj8xELEjbIMuXU331lihAZGLYCF5HJByv3Yq8mnhKz9
         T+hp/Wbww+vpaw5kZecvQU6nZxBCyg+6NBQJ2aLNsm5YlmK/X1wPJt1iXSRVpFSB+FyG
         vF6o+yIav6X9ECvw8KTNGLZ9L5sKDD1W7DJPbsuwBHZas/yDnXi/w1a7umvY54J4W3kt
         ZZjrArbBWMcjxVAakrZir3qJzTynOti+J+klnI60HhCtGZ8/0OfvWoCq5zqfddFx+5jL
         Wz8PNDGVlRgIMVqwEwSzfl+MVVIEB9or19MnkbM8h4DZzd0Jtz98o/YwMVkCI0EVDGEK
         ZPmA==
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: willy@infradead.org, jlayton@kernel.org, damien.lemoal@opensource.wdc.com, jack@suse.cz, edward.shishkin@gmail.com, linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk, kasong@tencent.com, Zeng Jingxiang <linuszeng@tencent.com>

From: Zeng Jingxiang <linuszeng@tencent.com>

Since commit 27b3a5c51b50 ("kill-the-bkl/reiserfs: drop the fs race
watchdog from _get_block_create_0()"), which removed a label that may
have the pointer 'p' touched in its control flow, related if statements
now eval to constant value now. Just remove them.

Assigning value NULL to p here
293     char *p = NULL;

In the following conditional expression, the value of p is always NULL,
As a result, the kunmap() cannot be executed.
308	if (p)
309		kunmap(bh_result->b_page);

355	if (p)
356		kunmap(bh_result->b_page);

366	if (p)
367		kunmap(bh_result->b_page);

Also, the kmap() cannot be executed.
399	if (!p)
400		p = (char *)kmap(bh_result->b_page);

Signed-off-by: Zeng Jingxiang <linuszeng@tencent.com>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 fs/reiserfs/inode.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 0cffe054b78e..fe26e1746af9 100644
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
 
@@ -396,9 +390,7 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
 	 * sure we need to.  But, this means the item might move if
 	 * kmap schedules
 	 */
-	if (!p)
-		p = (char *)kmap(bh_result->b_page);
-
+	p = (char *)kmap(bh_result->b_page);
 	p += offset;
 	memset(p, 0, inode->i_sb->s_blocksize);
 	do {
-- 
2.27.0

