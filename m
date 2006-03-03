From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 00/11] reiserfs: xattr rework
Date: Fri, 03 Mar 2006 17:17:36 -0500
Message-ID: <4408C080.4070600@suse.com>
References: <20060220201457.GA23204@locomotive.unixthugs.org> <20060301123406.GA20367@atrey.karlin.mff.cuni.cz> <44076975.70609@suse.com> <20060303002917.GD4261@atrey.karlin.mff.cuni.cz> <4407944F.5030206@suse.com> <20060303100407.GF2855@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010402000609050801070400"
Return-path: <reiserfs-list-return-28206-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060303100407.GF2855@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: ReiserFS List <reiserfs-list@namesys.com>, "E. Gryaznova" <grev@namesys.com>

--------------010402000609050801070400
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jan Kara wrote:
>> The data journaling mode can be set as a flag associated with the inode.
>>  Currently, i_data_log is set in REISERFS_I(inode)->i_flags. I add
>> i_data_ordered in one of my later patches. They can be tested easily
>> with reiserfs_file_data_{log,ordered}. There's no reason that one
>> couldn't be moved up and made a prerequisite for the first patch.
>   Fine. So we can just set proper journaling flags in reiserfs_quota_on
> and then honor them in the internal writing functions.

Ok, how do the attached patches look to you? The internal I/O changes
need to be applied after the journaled xattr patch or we get an Oops
trying to start a transaction without calling reiserfs_write_lock()
first. I've modified the first patch in the xattr series to abstract out
the fp->f_op->{read,write} calls to an xattr_{read,write} pair of
functions. This makes it easier to move to the internal i/o code later.
I've included it for clarity, but that is the only change.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFECMCALPWxlyuTD7IRAlqfAJ0bQnHuNqzEif4hVfvGKI8tR2bUrACfU1Mg
BFbe0xayAJHhvNgtGl7N6Jk=
=P6ED
-----END PGP SIGNATURE-----

--------------010402000609050801070400
Content-Type: text/x-patch;
 name="reiserfs-10-internal-file-io.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfs-10-internal-file-io.diff"

From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 10/13] reiserfs: make quota file i/o routines generic

 Jan Kara, with his work on journaled quotas, discovered some conditions
 were lock inversions can occur between pdflush and the internal file i/o
 paths when transactions are involved.

 This patch modifies the quota code in a few ways:
 1) Makes the reiserfs_quota_{read,write} generic and adds wrappers to
    map the quota type to the appropriate inode.
 2) Uses the i_data_log flag to mark whether the quota file is journaled
    or not. This is the standard way of doing this, and allows the generic
    code to work without knowledge of quotas.

 fs/reiserfs/super.c         |  212 ++++++++++++++++++++++++--------------------
 include/linux/reiserfs_fs.h |    5 +
 2 files changed, 122 insertions(+), 95 deletions(-)

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/super.c linux-2.6.15-staging2/fs/reiserfs/super.c
--- linux-2.6.15-staging1/fs/reiserfs/super.c	2006-03-03 17:09:01.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/super.c	2006-03-03 17:09:04.000000000 -0500
@@ -1949,6 +1949,109 @@ static int reiserfs_statfs(struct super_
 	return 0;
 }
 
+#if defined(CONFIG_QUOTA) || defined(CONFIG_REISERFS_FS_XATTR)
+/* Read data from quotafile - avoid pagecache and such because we cannot afford
+ * acquiring the locks... As quota files are never truncated and quota code
+ * itself serializes the operations (and noone else should touch the files)
+ * we don't have to be afraid of races */
+ssize_t reiserfs_internal_read(struct inode *inode, char *data, size_t len,
+                               loff_t off)
+{
+	struct super_block *sb = inode->i_sb;
+	unsigned long blk = off >> sb->s_blocksize_bits;
+	int err = 0, offset = off & (sb->s_blocksize - 1), tocopy;
+	size_t toread;
+	struct buffer_head tmp_bh, *bh;
+	loff_t i_size = i_size_read(inode);
+
+	if (off > i_size)
+		return 0;
+	if (off + len > i_size)
+		len = i_size - off;
+	toread = len;
+	while (toread > 0) {
+		tocopy =
+		    sb->s_blocksize - offset <
+		    toread ? sb->s_blocksize - offset : toread;
+		tmp_bh.b_state = 0;
+		/* Quota files are without tails so we can safely use this function */
+		reiserfs_write_lock(sb);
+		err = reiserfs_get_block(inode, blk, &tmp_bh, 0);
+		reiserfs_write_unlock(sb);
+		if (err)
+			return err;
+		if (!buffer_mapped(&tmp_bh))	/* A hole? */
+			memset(data, 0, tocopy);
+		else {
+			bh = sb_bread(sb, tmp_bh.b_blocknr);
+			if (!bh)
+				return -EIO;
+			memcpy(data, bh->b_data + offset, tocopy);
+			brelse(bh);
+		}
+		offset = 0;
+		toread -= tocopy;
+		data += tocopy;
+		blk++;
+	}
+	return len;
+}
+
+/* Write to quotafile (we know the transaction is already started and has
+ * enough credits) */
+ssize_t reiserfs_internal_write(struct inode *inode, const char *data,
+                                size_t len, loff_t off)
+{
+	struct super_block *sb = inode->i_sb;
+	unsigned long blk = off >> sb->s_blocksize_bits;
+	int err = 0, offset = off & (sb->s_blocksize - 1), tocopy;
+	size_t towrite = len;
+	struct buffer_head tmp_bh, *bh;
+
+	mutex_lock(&inode->i_mutex);
+	while (towrite > 0) {
+		tocopy = sb->s_blocksize - offset < towrite ?
+		    sb->s_blocksize - offset : towrite;
+		tmp_bh.b_state = 0;
+		err = reiserfs_get_block(inode, blk, &tmp_bh, GET_BLOCK_CREATE);
+		if (err)
+			goto out;
+		if (offset || tocopy != sb->s_blocksize)
+			bh = sb_bread(sb, tmp_bh.b_blocknr);
+		else
+			bh = sb_getblk(sb, tmp_bh.b_blocknr);
+		if (!bh) {
+			err = -EIO;
+			goto out;
+		}
+		lock_buffer(bh);
+		memcpy(bh->b_data + offset, data, tocopy);
+		flush_dcache_page(bh->b_page);
+		set_buffer_uptodate(bh);
+		unlock_buffer(bh);
+		reiserfs_prepare_for_journal(sb, bh, 1);
+		journal_mark_dirty(current->journal_info, sb, bh);
+		if (!reiserfs_file_data_log(inode))
+			reiserfs_add_ordered_list(inode, bh);
+		brelse(bh);
+		offset = 0;
+		towrite -= tocopy;
+		data += tocopy;
+		blk++;
+	}
+      out:
+	if (len == towrite)
+		return err;
+	if (inode->i_size < off + len - towrite)
+		i_size_write(inode, off + len - towrite);
+	inode->i_version++;
+	inode->i_mtime = inode->i_ctime = CURRENT_TIME;
+	mark_inode_dirty(inode);
+	mutex_unlock(&inode->i_mutex);
+	return len - towrite;
+}
+#endif
+
 #ifdef CONFIG_QUOTA
 static int reiserfs_dquot_initialize(struct inode *inode, int type)
 {
@@ -2097,8 +2200,12 @@ static int reiserfs_write_info(struct su
  */
 static int reiserfs_quota_on_mount(struct super_block *sb, int type)
 {
-	return vfs_quota_on_mount(sb, REISERFS_SB(sb)->s_qf_names[type],
-				  REISERFS_SB(sb)->s_jquota_fmt, type);
+	int ret = vfs_quota_on_mount(sb, REISERFS_SB(sb)->s_qf_names[type],
+				     REISERFS_SB(sb)->s_jquota_fmt, type);
+	if (ret == 0)
+		REISERFS_I(sb_dqopt(sb)->files[type])->i_flags |= i_data_log;
+
+	return ret;
 }
 
 /*
@@ -2139,109 +2246,24 @@ static int reiserfs_quota_on(struct supe
 				 "reiserfs: Quota file not on filesystem root. "
 				 "Journalled quota will not work.");
 	path_release(&nd);
-	return vfs_quota_on(sb, type, format_id, path);
+	err = vfs_quota_on(sb, type, format_id, path);
+	if (err == 0)
+		REISERFS_I(sb_dqopt(sb)->files[type])->i_flags |= i_data_log;
+	return err;
 }
 
-/* Read data from quotafile - avoid pagecache and such because we cannot afford
- * acquiring the locks... As quota files are never truncated and quota code
- * itself serializes the operations (and noone else should touch the files)
- * we don't have to be afraid of races */
-static ssize_t reiserfs_quota_read(struct super_block *sb, int type, char *data,
-				   size_t len, loff_t off)
+static ssize_t reiserfs_quota_read(struct super_block *sb, int type,
+                                   char *data, size_t len, loff_t off)
 {
 	struct inode *inode = sb_dqopt(sb)->files[type];
-	unsigned long blk = off >> sb->s_blocksize_bits;
-	int err = 0, offset = off & (sb->s_blocksize - 1), tocopy;
-	size_t toread;
-	struct buffer_head tmp_bh, *bh;
-	loff_t i_size = i_size_read(inode);
-
-	if (off > i_size)
-		return 0;
-	if (off + len > i_size)
-		len = i_size - off;
-	toread = len;
-	while (toread > 0) {
-		tocopy =
-		    sb->s_blocksize - offset <
-		    toread ? sb->s_blocksize - offset : toread;
-		tmp_bh.b_state = 0;
-		/* Quota files are without tails so we can safely use this function */
-		reiserfs_write_lock(sb);
-		err = reiserfs_get_block(inode, blk, &tmp_bh, 0);
-		reiserfs_write_unlock(sb);
-		if (err)
-			return err;
-		if (!buffer_mapped(&tmp_bh))	/* A hole? */
-			memset(data, 0, tocopy);
-		else {
-			bh = sb_bread(sb, tmp_bh.b_blocknr);
-			if (!bh)
-				return -EIO;
-			memcpy(data, bh->b_data + offset, tocopy);
-			brelse(bh);
-		}
-		offset = 0;
-		toread -= tocopy;
-		data += tocopy;
-		blk++;
-	}
-	return len;
+	return reiserfs_internal_read(inode, data, len, off);
 }
 
-/* Write to quotafile (we know the transaction is already started and has
- * enough credits) */
 static ssize_t reiserfs_quota_write(struct super_block *sb, int type,
 				    const char *data, size_t len, loff_t off)
 {
 	struct inode *inode = sb_dqopt(sb)->files[type];
-	unsigned long blk = off >> sb->s_blocksize_bits;
-	int err = 0, offset = off & (sb->s_blocksize - 1), tocopy;
-	int journal_quota = REISERFS_SB(sb)->s_qf_names[type] != NULL;
-	size_t towrite = len;
-	struct buffer_head tmp_bh, *bh;
-
-	mutex_lock(&inode->i_mutex);
-	while (towrite > 0) {
-		tocopy = sb->s_blocksize - offset < towrite ?
-		    sb->s_blocksize - offset : towrite;
-		tmp_bh.b_state = 0;
-		err = reiserfs_get_block(inode, blk, &tmp_bh, GET_BLOCK_CREATE);
-		if (err)
-			goto out;
-		if (offset || tocopy != sb->s_blocksize)
-			bh = sb_bread(sb, tmp_bh.b_blocknr);
-		else
-			bh = sb_getblk(sb, tmp_bh.b_blocknr);
-		if (!bh) {
-			err = -EIO;
-			goto out;
-		}
-		lock_buffer(bh);
-		memcpy(bh->b_data + offset, data, tocopy);
-		flush_dcache_page(bh->b_page);
-		set_buffer_uptodate(bh);
-		unlock_buffer(bh);
-		reiserfs_prepare_for_journal(sb, bh, 1);
-		journal_mark_dirty(current->journal_info, sb, bh);
-		if (!journal_quota)
-			reiserfs_add_ordered_list(inode, bh);
-		brelse(bh);
-		offset = 0;
-		towrite -= tocopy;
-		data += tocopy;
-		blk++;
-	}
-      out:
-	if (len == towrite)
-		return err;
-	if (inode->i_size < off + len - towrite)
-		i_size_write(inode, off + len - towrite);
-	inode->i_version++;
-	inode->i_mtime = inode->i_ctime = CURRENT_TIME;
-	mark_inode_dirty(inode);
-	mutex_unlock(&inode->i_mutex);
-	return len - towrite;
+	return reiserfs_internal_write(inode, data, len, off);
 }
 
 #endif
diff -ruNpX ../dontdiff linux-2.6.15-staging1/include/linux/reiserfs_fs.h linux-2.6.15-staging2/include/linux/reiserfs_fs.h
--- linux-2.6.15-staging1/include/linux/reiserfs_fs.h	2006-03-03 17:09:03.000000000 -0500
+++ linux-2.6.15-staging2/include/linux/reiserfs_fs.h	2006-03-03 17:09:04.000000000 -0500
@@ -2188,4 +2188,9 @@ int reiserfs_ioctl(struct inode *inode, 
 #define reiserfs_write_lock( sb ) lock_kernel()
 #define reiserfs_write_unlock( sb ) unlock_kernel()
 
+ssize_t reiserfs_internal_read(struct inode *inode, char *data,
+                                size_t len, loff_t off);
+ssize_t reiserfs_internal_write(struct inode *inode, const char *data,
+                                size_t len, loff_t off);
+
 #endif				/* _LINUX_REISER_FS_H */

--------------010402000609050801070400
Content-Type: text/x-patch;
 name="reiserfs-11-use-internal-file-io.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfs-11-use-internal-file-io.diff"

From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 11/13] reiserfs: use generic internal i/o methods for xattrs

 This patch modifies the xattr code to use the generic internal file i/o
 methods from the previous patch.

 fs/reiserfs/xattr.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/xattr.c linux-2.6.15-staging2/fs/reiserfs/xattr.c
--- linux-2.6.15-staging1/fs/reiserfs/xattr.c	2006-03-03 17:09:04.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/xattr.c	2006-03-03 17:09:05.000000000 -0500
@@ -415,26 +415,26 @@ static inline __u32 xattr_hash(const cha
 static ssize_t xattr_read(struct file *file, char *data, size_t count,
                           loff_t *pos)
 {
-	mm_segment_t old_fs = get_fs();
 	ssize_t err;
+	struct inode *inode = file->f_dentry->d_inode;
 
-	set_fs(KERNEL_DS);
-	err = file->f_op->read(file, data, count, pos);
-	set_fs(old_fs);
+	err = reiserfs_internal_read(file, data, count, *pos);
 
+	if (err >= 0)
+		*pos += err;
 	return err;
 }
 
 static ssize_t xattr_write(struct file *file, const char *data, size_t count,
                            loff_t *pos)
 {
-	mm_segment_t old_fs = get_fs();
 	ssize_t err;
+	struct inode *inode = file->f_dentry->d_inode;
 
-	set_fs(KERNEL_DS);
-	err = file->f_op->write(file, data, count, pos);
-	set_fs(old_fs);
+	err = reiserfs_internal_write(file, data, count, *pos);
 
+	if (err >= 0)
+		*pos += err;
 	return err;
 }
 

--------------010402000609050801070400
Content-Type: text/x-patch;
 name="reiserfs-01-make-internal-xattr-operations-use-vfs-ops.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfs-01-make-internal-xattr-operations-use-vfs-ops.diff"

From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 01/13] reiserfs: make internal xattr operations use vfs ops

 The reiserfs xattr code makes use of hidden files to contain the xattrs.
 The writing of these files is needlessly complex and can be replaced by
 vfs-level operations.

 fs/reiserfs/xattr.c |  234 +++++++++++++++++++++-------------------------------
 1 files changed, 95 insertions(+), 139 deletions(-)

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/xattr.c linux-2.6.15-staging2/fs/reiserfs/xattr.c
--- linux-2.6.15-staging1/fs/reiserfs/xattr.c	2006-03-02 12:09:57.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/xattr.c	2006-03-03 17:08:53.000000000 -0500
@@ -438,44 +438,38 @@ int xattr_readdir(struct file *file, fil
 	return res;
 }
 
-/* Internal operations on file data */
-static inline void reiserfs_put_page(struct page *page)
+static inline __u32 xattr_hash(const char *msg, int len)
 {
-	kunmap(page);
-	page_cache_release(page);
+	return csum_partial(msg, len, 0);
 }
 
-static struct page *reiserfs_get_page(struct inode *dir, unsigned long n)
+/* Generic extended attribute operations that can be used by xa plugins */
+
+static ssize_t xattr_read(struct file *file, char *data, size_t count,
+                          loff_t *pos)
 {
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
+	mm_segment_t old_fs = get_fs();
+	ssize_t err;
+
+	set_fs(KERNEL_DS);
+	err = file->f_op->read(file, data, count, pos);
+	set_fs(old_fs);
+
+	return err;
 }
 
-static inline __u32 xattr_hash(const char *msg, int len)
+static ssize_t xattr_write(struct file *file, const char *data, size_t count,
+                           loff_t *pos)
 {
-	return csum_partial(msg, len, 0);
-}
+	mm_segment_t old_fs = get_fs();
+	ssize_t err;
 
-/* Generic extended attribute operations that can be used by xa plugins */
+	set_fs(KERNEL_DS);
+	err = file->f_op->write(file, data, count, pos);
+	set_fs(old_fs);
+
+	return err;
+}
 
 /*
  * inode->i_mutex: down
@@ -486,21 +480,27 @@ reiserfs_xattr_set(struct inode *inode, 
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
@@ -524,62 +524,47 @@ reiserfs_xattr_set(struct inode *inode, 
 		goto open_file;
 	}
 
-	/* Resize it so we're ok to write there */
-	newattrs.ia_size = buffer_size;
-	newattrs.ia_valid = ATTR_SIZE | ATTR_CTIME;
-	mutex_lock(&xinode->i_mutex);
-	err = notify_change(fp->f_dentry, &newattrs);
-	if (err)
+	rxh.h_hash = le32_to_cpu (xattr_hash(buffer, buffer_size));
+
+	/* We've got a transaction open - we don't want to be dropping down
+	 * into other file system code. Not the nicest thing, but it's not
+	 * like this code is poetry to begin with. */
+	gfp_mask = mapping_gfp_mask(xinode->i_mapping);
+	mapping_set_gfp_mask(xinode->i_mapping, gfp_mask & ~__GFP_FS);
+
+	err = xattr_write(fp, (char *)&rxh, sizeof (rxh), &pos);
+
+	if (err != sizeof (rxh)) {
+		if (err > 0)
+			err = -EIO;
 		goto out_filp;
+	}
 
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
 
-		lock_page(page);
-		data = page_address(page);
+	if (buffer_size) {
+		err = xattr_write(fp, buffer, buffer_size, &pos);
 
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
@@ -590,7 +575,7 @@ reiserfs_xattr_set(struct inode *inode, 
 	}
 
       out_filp:
-	mutex_unlock(&xinode->i_mutex);
+	mapping_set_gfp_mask(xinode->i_mapping, gfp_mask);
 	fput(fp);
 
       out:
@@ -607,11 +592,9 @@ reiserfs_xattr_get(const struct inode *i
 	ssize_t err = 0;
 	struct file *fp;
 	size_t isize;
-	size_t file_pos = 0;
-	size_t buffer_pos = 0;
-	struct page *page;
 	struct inode *xinode;
-	__u32 hash = 0;
+	loff_t pos = 0;
+	struct reiserfs_xattr_header rxh;
 
 	if (name == NULL)
 		return -EINVAL;
@@ -628,66 +611,39 @@ reiserfs_xattr_get(const struct inode *i
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
+	err = xattr_read(fp, (char *)&rxh, sizeof (rxh), &pos);
+
+	if (err != sizeof (rxh)) {
+		if (err > 0)
+			err = -EIO;
+		goto out_dput;
+	}
+
+	err = xattr_read(fp, buffer, buffer_size, &pos);
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

--------------010402000609050801070400--
