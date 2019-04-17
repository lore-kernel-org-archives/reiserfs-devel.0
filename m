From: Bharath Vedartham <linux.bhar@gmail.com>
Subject: [PATCH] reiserfs: Force type conversion in xattr_hash
Date: Wed, 17 Apr 2019 17:22:00 +0530
Message-ID: <20190417115200.GA10168@bharath12345-Inspiron-5559>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=+Jy3DWbk9Qv0+8KvNBKbZ1gEm4HZaoLcJzKvfJBaD5E=;
        b=SWYe3Yj8ETbkBw2gpbitdQ6xGaO7BY7HmyqPT6TI5waSzG52Mfd2/z7yP5BjuvOimo
         o1obi4wwEbJwGgbrcbRkdnfTnAHtNnWr6r9DfaX5ff1Z0hmUjs5fKPqIi5uTAb2at/kF
         0nI9i87wZfVcYnsQjKPzfO4smxxS8R/86PdjvgGVMrMbyo7dlH/58L+w+0HtRHq5okH5
         pmQCPfOrh2vc7oHlT8OgxlrwVHbAHMJdT3r7COXZppIEm8n8YqeZa176q7sXakPrCh6g
         cS3SG5fu00wNPYCdloDp/qJ1jfP/Zp5+Uq5DKJydwKpW5L2NxcWp4NHxjZopOHWOEKgT
         CoRQ==
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, jannh@google.com
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

This patch fixes the sparse warning:

fs/reiserfs//xattr.c:453:28: warning: incorrect type in return
expression (different base types)
fs/reiserfs//xattr.c:453:28:    expected unsigned int
fs/reiserfs//xattr.c:453:28:    got restricted __wsum
fs/reiserfs//xattr.c:453:28: warning: incorrect type in return
expression (different base types)
fs/reiserfs//xattr.c:453:28:    expected unsigned int
fs/reiserfs//xattr.c:453:28:    got restricted __wsum

csum_partial returns restricted integer __wsum whereas xattr_hash
expects a return type of __u32.

Signed-off-by: Bharath Vedartham <linux.bhar@gmail.com>
---
 fs/reiserfs/xattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 32d8986..60b29a0 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -450,7 +450,7 @@ static struct page *reiserfs_get_page(struct inode *dir, size_t n)
 
 static inline __u32 xattr_hash(const char *msg, int len)
 {
-	return csum_partial(msg, len, 0);
+	return (__force __u32)csum_partial(msg, len, 0);
 }
 
 int reiserfs_commit_write(struct file *f, struct page *page,
-- 
2.7.4

