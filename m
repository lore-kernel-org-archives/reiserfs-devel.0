From: Bharath Vedartham <linux.bhar@gmail.com>
Subject: [PATCH] reiserfs: Add comment to explain endianness issue in
 xattr_hash
Date: Tue, 23 Apr 2019 21:48:31 +0530
Message-ID: <20190423161831.GA15387@bharath12345-Inspiron-5559>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=GSv/lNk+cqbIXgSZ96lvblwQ8cpdLHfK+N8P3Q4pHOQ=;
        b=kA8UUDwAkrFY1VmNWIKvOo0XihlU5W9LhPC4hdsnB0kv5YI+W2cwCRR7SdiKpBc0B6
         h3UlUKAKnhgO33C+dC4j6q94CPQ2dqJ/SzYxQlxWj7jW+klThfeXvX3dlM0ZmXDEHeBY
         e1GV4Bisy3AIEWs+PrBhmziN7kYSobkjj0fVLlcOwyE0LITeiiafBbbiRryO6moLzBwQ
         NgnMxDnuU+2CMEOWCRsOoxP8mH/JtO2zSK6LpjVPDkqULZwwixYjw+jHAHRLgoksGoCB
         NjvjHBtw5gPLTJ7n/hQgf0W1mK1RtgnLODEVMWnB4ctyFxeVJB1UsizF0mYFFtnGe0JS
         zybA==
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, viro@zeniv.linux.org.uk
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux.bhar@gmail.com

csum_partial() gives different results for little-endian and big-endian
hosts. This causes images created on little-endian hosts and mounted on
big endian hosts to see csum mismatches. This causes an endianness bug.
Sparse gives a warning as csum_partial returns a restricted integer type
__wsum_t and xattr_hash expects __u32. This warning acts as a reminder
for this bug and should not be suppressed.

This comment aims to convey these endianness issues.

Signed-off-by: Bharath Vedartham <linux.bhar@gmail.com>
---
 fs/reiserfs/xattr.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 32d8986..0ea6654 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -450,6 +450,16 @@ static struct page *reiserfs_get_page(struct inode *dir, size_t n)
 
 static inline __u32 xattr_hash(const char *msg, int len)
 {
+	/*
+	 * csum_partial() gives different results for little-endian and
+	 * big endian hosts. Images created on little-endian hosts and
+	 * mounted on big-endian hosts(and vice versa) will see csum mismatches
+	 * when trying to fetch xattrs. Treating the hash as __wsum_t would
+	 * lower the frequency of mismatch. This is an endianness bug in reiserfs.
+	 * The return statement would result in a sparse warning. Do not fix the sparse
+	 * warning so as to not hide the reminder of the bug.
+	 */
+
 	return csum_partial(msg, len, 0);
 }
 
-- 
2.7.4

