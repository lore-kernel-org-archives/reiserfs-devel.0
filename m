From: Tahsin Erdogan <tahsin@google.com>
Subject: [PATCH 24/28] ext4: rename mb block cache functions
Date: Wed, 31 May 2017 01:15:13 -0700
Message-ID: <20170531081517.11438-24-tahsin@google.com>
References: <20170531081517.11438-1-tahsin@google.com>
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=y7vbbcYxea1Ch5sV7P5DQqMJmAi52RzMp/Dy00NJ4jY=;
        b=NhJMc3nu1tZVHg8gXkwNNTnQqdLZHF0F1ypmHzdv7JwFARHR6PBdC+JfcBFhuBIJnV
         wB0ZLozdoAueDWCfgz8nBZRlyv6G03kedZQ6Q0FmDr8XLZBwR4BNn8ZzbNunhYCbVLoA
         +gmR2bXYast2Pl4TEfJDLUVPeA8rBwhZV9uBUN17YKYnVfDqaO/kEE/J4FuxhAWTMJ24
         UVR14s8HYV/GlX9l2xX7nhq8SAWRkGraPnSV5zy+SLhlUhkBCLEhUl6hWJ7XT0Ubvqcm
         wK7JIWANCUVC7IIoAvycKKgCNYNOyO6teai0XfTfB3LqVKAMXjXzSaWDWFsnHtLFb+ZN
         APrA==
In-Reply-To: <20170531081517.11438-1-tahsin@google.com>
Sender: linux-ext4-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, Jens Axboe <axboe@fb.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Mike Christie <mchristi@redhat.com>, Fabian Frederick <fabf@skynet.be>, linux-ext4@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, Tahsin Erdogan <tahsin@google.com>

There will be a second cache instance that tracks ea_inodes. Make
existing names more explicit so that it is clear that they refer to
xattr block cache.

Signed-off-by: Tahsin Erdogan <tahsin@google.com>
---
 fs/ext4/xattr.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
index 772948f168c3..3ee7e2f68476 100644
--- a/fs/ext4/xattr.c
+++ b/fs/ext4/xattr.c
@@ -72,10 +72,11 @@
 # define ea_bdebug(bh, fmt, ...)	no_printk(fmt, ##__VA_ARGS__)
 #endif
 
-static void ext4_xattr_cache_insert(struct mb_cache *, struct buffer_head *);
-static struct buffer_head *ext4_xattr_cache_find(struct inode *,
-						 struct ext4_xattr_header *,
-						 struct mb_cache_entry **);
+static void ext4_xattr_block_cache_insert(struct mb_cache *,
+					  struct buffer_head *);
+static struct buffer_head *
+ext4_xattr_block_cache_find(struct inode *, struct ext4_xattr_header *,
+			    struct mb_cache_entry **);
 static void ext4_xattr_rehash(struct ext4_xattr_header *,
 			      struct ext4_xattr_entry *);
 
@@ -395,7 +396,7 @@ ext4_xattr_block_get(struct inode *inode, int name_index, const char *name,
 		error = -EFSCORRUPTED;
 		goto cleanup;
 	}
-	ext4_xattr_cache_insert(ext4_mb_cache, bh);
+	ext4_xattr_block_cache_insert(ext4_mb_cache, bh);
 	entry = BFIRST(bh);
 	error = ext4_xattr_find_entry(&entry, name_index, name, 1);
 	if (error)
@@ -563,7 +564,7 @@ ext4_xattr_block_list(struct dentry *dentry, char *buffer, size_t buffer_size)
 		error = -EFSCORRUPTED;
 		goto cleanup;
 	}
-	ext4_xattr_cache_insert(ext4_mb_cache, bh);
+	ext4_xattr_block_cache_insert(ext4_mb_cache, bh);
 	error = ext4_xattr_list_entries(dentry, BFIRST(bh), buffer, buffer_size);
 
 cleanup:
@@ -1123,8 +1124,8 @@ ext4_xattr_block_set(handle_t *handle, struct inode *inode,
 				if (!IS_LAST_ENTRY(s->first))
 					ext4_xattr_rehash(header(s->base),
 							  s->here);
-				ext4_xattr_cache_insert(ext4_mb_cache,
-					bs->bh);
+				ext4_xattr_block_cache_insert(ext4_mb_cache,
+							      bs->bh);
 			}
 			ext4_xattr_block_csum_set(inode, bs->bh);
 			unlock_buffer(bs->bh);
@@ -1177,7 +1178,8 @@ ext4_xattr_block_set(handle_t *handle, struct inode *inode,
 
 inserted:
 	if (!IS_LAST_ENTRY(s->first)) {
-		new_bh = ext4_xattr_cache_find(inode, header(s->base), &ce);
+		new_bh = ext4_xattr_block_cache_find(inode, header(s->base),
+						     &ce);
 		if (new_bh) {
 			/* We found an identical block in the cache. */
 			if (new_bh == bs->bh)
@@ -1292,7 +1294,7 @@ ext4_xattr_block_set(handle_t *handle, struct inode *inode,
 			ext4_xattr_block_csum_set(inode, new_bh);
 			set_buffer_uptodate(new_bh);
 			unlock_buffer(new_bh);
-			ext4_xattr_cache_insert(ext4_mb_cache, new_bh);
+			ext4_xattr_block_cache_insert(ext4_mb_cache, new_bh);
 			error = ext4_handle_dirty_metadata(handle, inode,
 							   new_bh);
 			if (error)
@@ -2150,15 +2152,16 @@ void ext4_xattr_inode_array_free(struct ext4_xattr_inode_array *ea_inode_array)
 }
 
 /*
- * ext4_xattr_cache_insert()
+ * ext4_xattr_block_cache_insert()
  *
- * Create a new entry in the extended attribute cache, and insert
+ * Create a new entry in the extended attribute block cache, and insert
  * it unless such an entry is already in the cache.
  *
  * Returns 0, or a negative error number on failure.
  */
 static void
-ext4_xattr_cache_insert(struct mb_cache *ext4_mb_cache, struct buffer_head *bh)
+ext4_xattr_block_cache_insert(struct mb_cache *ext4_mb_cache,
+			      struct buffer_head *bh)
 {
 	struct ext4_xattr_header *header = BHDR(bh);
 	__u32 hash = le32_to_cpu(header->h_hash);
@@ -2216,7 +2219,7 @@ ext4_xattr_cmp(struct ext4_xattr_header *header1,
 }
 
 /*
- * ext4_xattr_cache_find()
+ * ext4_xattr_block_cache_find()
  *
  * Find an identical extended attribute block.
  *
@@ -2224,8 +2227,9 @@ ext4_xattr_cmp(struct ext4_xattr_header *header1,
  * not found or an error occurred.
  */
 static struct buffer_head *
-ext4_xattr_cache_find(struct inode *inode, struct ext4_xattr_header *header,
-		      struct mb_cache_entry **pce)
+ext4_xattr_block_cache_find(struct inode *inode,
+			    struct ext4_xattr_header *header,
+			    struct mb_cache_entry **pce)
 {
 	__u32 hash = le32_to_cpu(header->h_hash);
 	struct mb_cache_entry *ce;
-- 
2.13.0.219.gdb65acc882-goog

