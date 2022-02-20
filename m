From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiserfs: get rid of AOP_FLAG_CONT_EXPAND flag
Date: Mon, 21 Feb 2022 00:22:19 +0100
Message-ID: <20220220232219.1235-1-edward.shishkin@gmail.com>
References: <fbc744c9-e22f-138c-2da3-f76c3edfcc3d@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+/6FVXbQ7tm987ktGB+50LSyqQ0w7Psn1nbQn39v9Mk=;
        b=jh2B04F4bFkcklCxKRTTZz0yBhTx7u775Sqvphij1AvQP67vOcwiZ8O+cZNkibc0n0
         LWAX/XeaLXXDQYPV2G8mZxF6BZmPFXlS1NDwUts88vpGhXC2PXF6dJRo5CrsMQRW+uyq
         SgQ5LaPPGoC+01nVCq5mlzWVJthO76ECbX+x+PdJcNbwgMbh/5KH4uuAKCUuUhQ37xgp
         dnsciCyQS5W5gFzgG7x8AIk1rUorxKQE2orvzMEnz9pFhNujB39Xyt1le0fGVpOB22mb
         pyMCURUTQ0Pb1j3jeXg5NxzjXrwRqfpIZ1rwd3JTrX6dMUNWgJzqHy5E56PNvdPQ1+Fw
         O+kA==
In-Reply-To: <fbc744c9-e22f-138c-2da3-f76c3edfcc3d@gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: willy@infradead.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org, jack@suse.cz
Cc: Edward Shishkin <edward.shishkin@gmail.com>

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiserfs/inode.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index f49b72ccac4c..e943930939f5 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -2763,13 +2763,6 @@ static int reiserfs_write_begin(struct file *file,
 	int old_ref = 0;
 
  	inode = mapping->host;
-	*fsdata = NULL;
- 	if (flags & AOP_FLAG_CONT_EXPAND &&
- 	    (pos & (inode->i_sb->s_blocksize - 1)) == 0) {
- 		pos ++;
-		*fsdata = (void *)(unsigned long)flags;
-	}
-
 	index = pos >> PAGE_SHIFT;
 	page = grab_cache_page_write_begin(mapping, index, flags);
 	if (!page)
@@ -2896,9 +2889,6 @@ static int reiserfs_write_end(struct file *file, struct address_space *mapping,
 	unsigned start;
 	bool locked = false;
 
-	if ((unsigned long)fsdata & AOP_FLAG_CONT_EXPAND)
-		pos ++;
-
 	reiserfs_wait_on_write_block(inode->i_sb);
 	if (reiserfs_transaction_running(inode->i_sb))
 		th = current->journal_info;
@@ -3316,7 +3306,11 @@ int reiserfs_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
 
 		/* fill in hole pointers in the expanding truncate case. */
 		if (attr->ia_size > inode->i_size) {
-			error = generic_cont_expand_simple(inode, attr->ia_size);
+			loff_t pos = attr->ia_size;
+
+			if ((pos & (inode->i_sb->s_blocksize - 1)) == 0)
+				pos++;
+			error = generic_cont_expand_simple(inode, pos);
 			if (REISERFS_I(inode)->i_prealloc_count > 0) {
 				int err;
 				struct reiserfs_transaction_handle th;
-- 
2.21.3

