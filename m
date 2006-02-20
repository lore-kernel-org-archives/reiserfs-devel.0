From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 01/11] reiserfs: make internal xattr operations use vfs ops
Date: Mon, 20 Feb 2006 15:14:57 -0500
Message-ID: <20060220201457.GA23216@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28096-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: "E. Gryaznova" <grev@namesys.com>


 The reiserfs xattr code makes use of hidden files to contain the xattrs.
 The writing of these files is needlessly complex and can be replaced by
 vfs-level operations.

 fs/reiserfs/xattr.c |  223 ++++++++++++++++++----------------------------------
 1 files changed, 81 insertions(+), 142 deletions(-)

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/xattr.c linux-2.6.15-staging2/fs/reiserfs/xattr.c
--- linux-2.6.15-staging1/fs/reiserfs/xattr.c	2006-02-13 11:06:53.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/xattr.c	2006-02-13 14:21:00.000000000 -0500
@@ -438,38 +438,6 @@ int xattr_readdir(struct file *file, fil
 	return res;
 }
 
-/* Internal operations on file data */
-static inline void reiserfs_put_page(struct page *page)
-{
-	kunmap(page);
-	page_cache_release(page);
-}
-
-static struct page *reiserfs_get_page(struct inode *dir, unsigned long n)
-{
-	struct address_space *mapping = dir->i_mapping;
-	struct page *page;
-	/* We can deadlock if we try to free dentries,
-	   and an unlink/rmdir has just occured - GFP_NOFS avoids this */
-	mapping_set_gfp_mask(mapping, GFP_NOFS);
-	page = read_cache_page(mapping, n,
-			       (filler_t *) mapping->a_ops->readpage, NULL);
-	if (!IS_ERR(page)) {
-		wait_on_page_locked(page);
-		kmap(page);
-		if (!PageUptodate(page))
-			goto fail;
-
-		if (PageError(page))
-			goto fail;
-	}
-	return page;
-
-      fail:
-	reiserfs_put_page(page);
-	return ERR_PTR(-EIO);
-}
-
 static inline __u32 xattr_hash(const char *msg, int len)
 {
 	return csum_partial(msg, len, 0);
@@ -486,21 +454,28 @@ reiserfs_xattr_set(struct inode *inode, 
 {
 	int err = 0;
 	struct file *fp;
-	struct page *page;
-	char *data;
-	struct address_space *mapping;
-	size_t file_pos = 0;
-	size_t buffer_pos = 0;
 	struct inode *xinode;
-	struct iattr newattrs;
-	__u32 xahash = 0;
+	loff_t pos = 0;
+	mm_segment_t old_fs = get_fs();
+	struct reiserfs_xattr_header rxh = {
+		.h_magic = __constant_cpu_to_le32(REISERFS_XATTR_MAGIC),
+	};
+	gfp_t gfp_mask;
 
 	if (get_inode_sd_version(inode) == STAT_DATA_V1)
 		return -EOPNOTSUPP;
 
-	/* Empty xattrs are ok, they're just empty files, no hash */
-	if (buffer && buffer_size)
-		xahash = xattr_hash(buffer, buffer_size);
+	if (!buffer) {
+		struct reiserfs_xattr_handler *xah =
+					find_xattr_handler_prefix(name);
+		/* Deletion pre-operation */
+		if (xah->del) {
+			err = xah->del(inode, name);
+			if (err)
+				goto out;
+		}
+		return reiserfs_xattr_del(inode, name);
+	}
 
       open_file:
 	fp = open_xa_file(inode, name, flags);
@@ -524,62 +499,50 @@ reiserfs_xattr_set(struct inode *inode, 
 		goto open_file;
 	}
 
-	/* Resize it so we're ok to write there */
-	newattrs.ia_size = buffer_size;
-	newattrs.ia_valid = ATTR_SIZE | ATTR_CTIME;
-	mutex_lock(&xinode->i_mutex);
-	err = notify_change(fp->f_dentry, &newattrs);
-	if (err)
-		goto out_filp;
+	rxh.h_hash = le32_to_cpu (xattr_hash(buffer, buffer_size));
 
-	mapping = xinode->i_mapping;
-	while (buffer_pos < buffer_size || buffer_pos == 0) {
-		size_t chunk;
-		size_t skip = 0;
-		size_t page_offset = (file_pos & (PAGE_CACHE_SIZE - 1));
-		if (buffer_size - buffer_pos > PAGE_CACHE_SIZE)
-			chunk = PAGE_CACHE_SIZE;
-		else
-			chunk = buffer_size - buffer_pos;
-
-		page = reiserfs_get_page(xinode, file_pos >> PAGE_CACHE_SHIFT);
-		if (IS_ERR(page)) {
-			err = PTR_ERR(page);
-			goto out_filp;
-		}
+	/* We've got a transaction open - we don't want to be dropping down
+	 * into other file system code. Not the nicest thing, but it's not
+	 * like this code is poetry to begin with. */
+	gfp_mask = mapping_gfp_mask(xinode->i_mapping);
+	mapping_set_gfp_mask(xinode->i_mapping, gfp_mask & ~__GFP_FS);
+
+	set_fs(KERNEL_DS);
+	err = fp->f_op->write(fp, (char *)&rxh, sizeof (rxh), &pos);
+	set_fs(old_fs);
+
+	if (err != sizeof (rxh)) {
+		if (err > 0)
+			err = -EIO;
+		goto out_filp;
+	}
 
-		lock_page(page);
-		data = page_address(page);
+	if (buffer_size) {
+		set_fs(KERNEL_DS);
+		err = fp->f_op->write(fp, buffer, buffer_size, &pos);
+		set_fs(old_fs);
 
-		if (file_pos == 0) {
-			struct reiserfs_xattr_header *rxh;
-			skip = file_pos = sizeof(struct reiserfs_xattr_header);
-			if (chunk + skip > PAGE_CACHE_SIZE)
-				chunk = PAGE_CACHE_SIZE - skip;
-			rxh = (struct reiserfs_xattr_header *)data;
-			rxh->h_magic = cpu_to_le32(REISERFS_XATTR_MAGIC);
-			rxh->h_hash = cpu_to_le32(xahash);
+		if (err != buffer_size) {
+			if (err > 0)
+				err = -EIO;
+			goto out_filp;
 		}
+	}
 
-		err = mapping->a_ops->prepare_write(fp, page, page_offset,
-						    page_offset + chunk + skip);
-		if (!err) {
-			if (buffer)
-				memcpy(data + skip, buffer + buffer_pos, chunk);
-			err =
-			    mapping->a_ops->commit_write(fp, page, page_offset,
-							 page_offset + chunk +
-							 skip);
-		}
-		unlock_page(page);
-		reiserfs_put_page(page);
-		buffer_pos += chunk;
-		file_pos += chunk;
-		skip = 0;
-		if (err || buffer_size == 0 || !buffer)
-			break;
+	if (buffer_size + sizeof (rxh) < i_size_read(xinode)) {
+		struct iattr newattrs = {
+			.ia_size = buffer_size + sizeof (rxh),
+			.ia_valid = ATTR_SIZE | ATTR_CTIME,
+		};
+
+		mutex_lock(&xinode->i_mutex);
+		err = notify_change(fp->f_dentry, &newattrs);
+		mutex_unlock(&xinode->i_mutex);
+		goto out_filp;
 	}
 
+	err = 0;
+
 	/* We can't mark the inode dirty if it's not hashed. This is the case
 	 * when we're inheriting the default ACL. If we dirty it, the inode
 	 * gets marked dirty, but won't (ever) make it onto the dirty list until
@@ -590,7 +553,7 @@ reiserfs_xattr_set(struct inode *inode, 
 	}
 
       out_filp:
-	mutex_unlock(&xinode->i_mutex);
+	mapping_set_gfp_mask(xinode->i_mapping, gfp_mask);
 	fput(fp);
 
       out:
@@ -607,11 +570,10 @@ reiserfs_xattr_get(const struct inode *i
 	ssize_t err = 0;
 	struct file *fp;
 	size_t isize;
-	size_t file_pos = 0;
-	size_t buffer_pos = 0;
-	struct page *page;
 	struct inode *xinode;
-	__u32 hash = 0;
+	loff_t pos = 0;
+	mm_segment_t old_fs = get_fs();
+	struct reiserfs_xattr_header rxh;
 
 	if (name == NULL)
 		return -EINVAL;
@@ -628,66 +590,43 @@ reiserfs_xattr_get(const struct inode *i
 	}
 
 	xinode = fp->f_dentry->d_inode;
-	isize = xinode->i_size;
+	isize = i_size_read(xinode) - sizeof (rxh);
 	REISERFS_I(inode)->i_flags |= i_has_xattr_dir;
 
 	/* Just return the size needed */
 	if (buffer == NULL) {
-		err = isize - sizeof(struct reiserfs_xattr_header);
+		err = isize;
 		goto out_dput;
 	}
 
-	if (buffer_size < isize - sizeof(struct reiserfs_xattr_header)) {
+	if (buffer_size < isize) {
 		err = -ERANGE;
 		goto out_dput;
 	}
 
-	while (file_pos < isize) {
-		size_t chunk;
-		char *data;
-		size_t skip = 0;
-		if (isize - file_pos > PAGE_CACHE_SIZE)
-			chunk = PAGE_CACHE_SIZE;
-		else
-			chunk = isize - file_pos;
-
-		page = reiserfs_get_page(xinode, file_pos >> PAGE_CACHE_SHIFT);
-		if (IS_ERR(page)) {
-			err = PTR_ERR(page);
-			goto out_dput;
-		}
+	buffer_size = isize;
 
-		lock_page(page);
-		data = page_address(page);
-		if (file_pos == 0) {
-			struct reiserfs_xattr_header *rxh =
-			    (struct reiserfs_xattr_header *)data;
-			skip = file_pos = sizeof(struct reiserfs_xattr_header);
-			chunk -= skip;
-			/* Magic doesn't match up.. */
-			if (rxh->h_magic != cpu_to_le32(REISERFS_XATTR_MAGIC)) {
-				unlock_page(page);
-				reiserfs_put_page(page);
-				reiserfs_warning(inode->i_sb,
-						 "Invalid magic for xattr (%s) "
-						 "associated with %k", name,
-						 INODE_PKEY(inode));
-				err = -EIO;
-				goto out_dput;
-			}
-			hash = le32_to_cpu(rxh->h_hash);
-		}
-		memcpy(buffer + buffer_pos, data + skip, chunk);
-		unlock_page(page);
-		reiserfs_put_page(page);
-		file_pos += chunk;
-		buffer_pos += chunk;
-		skip = 0;
+	set_fs(KERNEL_DS);
+	err = fp->f_op->read(fp, (char *)&rxh, sizeof (rxh), &pos);
+	set_fs(old_fs);
+
+	if (err != sizeof (rxh)) {
+		if (err > 0)
+			err = -EIO;
+		goto out_dput;
+	}
+
+	set_fs(KERNEL_DS);
+	err = fp->f_op->read(fp, buffer, buffer_size, &pos);
+	set_fs(old_fs);
+
+	if (err != buffer_size) {
+		if (err > 0)
+			err = -EIO;
+		goto out_dput;
 	}
-	err = isize - sizeof(struct reiserfs_xattr_header);
 
-	if (xattr_hash(buffer, isize - sizeof(struct reiserfs_xattr_header)) !=
-	    hash) {
+	if (xattr_hash(buffer, buffer_size) != le32_to_cpu(rxh.h_hash)) {
 		reiserfs_warning(inode->i_sb,
 				 "Invalid hash for xattr (%s) associated "
 				 "with %k", name, INODE_PKEY(inode));
