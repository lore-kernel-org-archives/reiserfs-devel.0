From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 1/3] Adjust reiser4 for 3.19: ->f_dentry is gone, use file_inode() instead of ->f_dentry->d_inode.
Date: Sat, 14 Feb 2015 03:44:41 +0300
Message-ID: <1423874683-7787-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=f5D6HpyQ4cc7V86mMY33hvLjAHHuuSVhBcXzL2zYZpU=;
        b=ZkXMy+Fk+NBN4EkMtc1sP/BuV2/xKBfpHNuLSAh0fA3ZHCOx5oYKnn+mBokhsFOvWu
         sqmAgdPnI0FwuuPhQ76O3/ml51xVrmtnZ1hmsvECM/xJGdEj55OUsunJSncDo0WgU6RC
         hcIi2VuvZzUJ34sI9Zyd/GjNnprFOTtSwb+6fdX5xk8At6DvdgOYVQBeS6Rt/uzujwfS
         qBumZYiekQ5WLOTE1onKOkkR+CYGhauwDd9k5hjx29VNNqajRrHQ61P/ojAQZtEe8gLT
         ZqlZlOp5XSDlR2jslIkSzcMJ05917LAovwBzi3O32tKAckCdHhzmxFt88NVFWyQxPeHJ
         o/qg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Upstream commit fb32c76d16aa40f3057f53273ac483a8e2468004
"VFS: Convert file->f_dentry->d_inode to file_inode()".

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/read_write.c                          |  4 ++--
 fs/reiser4/fsdata.c                      | 10 +++++-----
 fs/reiser4/plugin/dir_plugin_common.c    |  2 +-
 fs/reiser4/plugin/file/cryptcompress.c   |  8 ++++----
 fs/reiser4/plugin/file/file.c            | 26 +++++++++++++-------------
 fs/reiser4/plugin/file/file_conversion.c | 12 ++++++------
 fs/reiser4/plugin/file/tail_conversion.c |  2 +-
 fs/reiser4/plugin/file_ops_readdir.c     | 10 +++++-----
 fs/reiser4/plugin/item/ctail.c           |  4 ++--
 fs/reiser4/plugin/item/extent_file_ops.c |  2 +-
 10 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/fs/read_write.c b/fs/read_write.c
index ea7a433..4adcc96 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -254,9 +254,9 @@ loff_t default_llseek(struct file *file, loff_t offset, int origin)
 {
 	loff_t retval;
 
-	mutex_lock(&file->f_dentry->d_inode->i_mutex);
+	mutex_lock(&file_inode(file)->i_mutex);
 	retval = default_llseek_unlocked(file, offset, origin);
-	mutex_unlock(&file->f_dentry->d_inode->i_mutex);
+	mutex_unlock(&file_inode(file)->i_mutex);
 	return retval;
 }
 EXPORT_SYMBOL(default_llseek);
diff --git a/fs/reiser4/fsdata.c b/fs/reiser4/fsdata.c
index 0bb3518..7b77b7d 100644
--- a/fs/reiser4/fsdata.c
+++ b/fs/reiser4/fsdata.c
@@ -585,7 +585,7 @@ void reiser4_detach_fsdata(struct file *file)
 	if (!file_is_stateless(file))
 		return;
 
-	inode = file->f_dentry->d_inode;
+	inode = file_inode(file);
 	spin_lock_inode(inode);
 	clean_fsdata(file);
 	spin_unlock_inode(inode);
@@ -741,7 +741,7 @@ reiser4_file_fsdata *reiser4_get_file_fsdata(struct file *file)
 		if (fsdata == NULL)
 			return ERR_PTR(RETERR(-ENOMEM));
 
-		inode = file->f_dentry->d_inode;
+		inode = file_inode(file);
 		spin_lock_inode(inode);
 		if (file->private_data == NULL) {
 			file->private_data = fsdata;
@@ -767,7 +767,7 @@ static void free_file_fsdata_nolock(struct file *file)
 {
 	reiser4_file_fsdata *fsdata;
 
-	assert("", spin_inode_is_locked(file->f_dentry->d_inode));
+	assert("", spin_inode_is_locked(file_inode(file)));
 	fsdata = file->private_data;
 	if (fsdata != NULL) {
 		list_del_init(&fsdata->dir.linkage);
@@ -785,9 +785,9 @@ static void free_file_fsdata_nolock(struct file *file)
  */
 void reiser4_free_file_fsdata(struct file *file)
 {
-	spin_lock_inode(file->f_dentry->d_inode);
+	spin_lock_inode(file_inode(file));
 	free_file_fsdata_nolock(file);
-	spin_unlock_inode(file->f_dentry->d_inode);
+	spin_unlock_inode(file_inode(file));
 }
 
 /*
diff --git a/fs/reiser4/plugin/dir_plugin_common.c b/fs/reiser4/plugin/dir_plugin_common.c
index 4eb6165..c65ee72 100644
--- a/fs/reiser4/plugin/dir_plugin_common.c
+++ b/fs/reiser4/plugin/dir_plugin_common.c
@@ -97,7 +97,7 @@ int build_readdir_key_common(struct file *dir /* directory being read */ ,
 	assert("nikita-1361", dir != NULL);
 	assert("nikita-1362", result != NULL);
 	assert("nikita-1363", dir->f_dentry != NULL);
-	inode = dir->f_dentry->d_inode;
+	inode = file_inode(dir);
 	assert("nikita-1373", inode != NULL);
 
 	fdata = reiser4_get_file_fsdata(dir);
diff --git a/fs/reiser4/plugin/file/cryptcompress.c b/fs/reiser4/plugin/file/cryptcompress.c
index 06b9856..63bfff1 100644
--- a/fs/reiser4/plugin/file/cryptcompress.c
+++ b/fs/reiser4/plugin/file/cryptcompress.c
@@ -1263,7 +1263,7 @@ int readpage_cryptcompress(struct file *file, struct page *page)
 	}
 	assert("edward-113",
 	       ergo(file != NULL,
-		    page->mapping == file->f_dentry->d_inode->i_mapping));
+		    page->mapping == file_inode(file)->i_mapping));
 
 	if (PageUptodate(page)) {
 		warning("edward-1338", "page is already uptodate\n");
@@ -2869,7 +2869,7 @@ ssize_t write_cryptcompress(struct file *file, const char __user *buf,
 
   	assert("edward-1449", cont->state == DISPATCH_INVAL_STATE);
 
-	inode = file->f_dentry->d_inode;
+	inode = file_inode(file);
 	assert("edward-196", cryptcompress_inode_ok(inode));
 
 	info = cryptcompress_inode_data(inode);
@@ -2949,7 +2949,7 @@ ssize_t read_cryptcompress(struct file * file, char __user *buf, size_t size,
 	struct cryptcompress_info *info;
 	reiser4_block_nr needed;
 
-	inode = file->f_dentry->d_inode;
+	inode = file_inode(file);
 	assert("edward-1194", !reiser4_inode_get_flag(inode, REISER4_NO_SD));
 
 	ctx = reiser4_init_context(inode->i_sb);
@@ -3692,7 +3692,7 @@ int mmap_cryptcompress(struct file *file, struct vm_area_struct *vma)
 	struct inode *inode;
 	reiser4_context *ctx;
 
-	inode = file->f_dentry->d_inode;
+	inode = file_inode(file);
 	ctx = reiser4_init_context(inode->i_sb);
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
diff --git a/fs/reiser4/plugin/file/file.c b/fs/reiser4/plugin/file/file.c
index 82ecb59..23a62b7 100644
--- a/fs/reiser4/plugin/file/file.c
+++ b/fs/reiser4/plugin/file/file.c
@@ -663,12 +663,12 @@ int load_file_hint(struct file *file, hint_t *hint)
 		if (IS_ERR(fsdata))
 			return PTR_ERR(fsdata);
 
-		spin_lock_inode(file->f_dentry->d_inode);
+		spin_lock_inode(file_inode(file));
 		if (reiser4_seal_is_set(&fsdata->reg.hint.seal)) {
 			memcpy(hint, &fsdata->reg.hint, sizeof(*hint));
 			init_lh(&hint->lh);
 			hint->ext_coord.lh = &hint->lh;
-			spin_unlock_inode(file->f_dentry->d_inode);
+			spin_unlock_inode(file_inode(file));
 			/*
 			 * force re-validation of the coord on the first
 			 * iteration of the read/write loop.
@@ -680,7 +680,7 @@ int load_file_hint(struct file *file, hint_t *hint)
 			return 0;
 		}
 		memset(&fsdata->reg.hint, 0, sizeof(hint_t));
-		spin_unlock_inode(file->f_dentry->d_inode);
+		spin_unlock_inode(file_inode(file));
 	}
 	hint_init_zero(hint);
 	return 0;
@@ -707,9 +707,9 @@ void save_file_hint(struct file *file, const hint_t *hint)
 	assert("nikita-19891",
 	       coords_equal(&hint->seal.coord1, &hint->ext_coord.coord));
 	assert("vs-30", hint->lh.owner == NULL);
-	spin_lock_inode(file->f_dentry->d_inode);
+	spin_lock_inode(file_inode(file));
 	fsdata->reg.hint = *hint;
-	spin_unlock_inode(file->f_dentry->d_inode);
+	spin_unlock_inode(file_inode(file));
 	return;
 }
 
@@ -1656,7 +1656,7 @@ static ssize_t do_read_compound_file(hint_t *hint, struct file *file,
 	coord_t *coord;
 	znode *loaded;
 
-	inode = file->f_dentry->d_inode;
+	inode = file_inode(file);
 
 	/* build flow */
 	assert("vs-1250",
@@ -1726,7 +1726,7 @@ ssize_t read_unix_file(struct file *file, char __user *buf,
 	if (unlikely(read_amount == 0))
 		return 0;
 
-	inode = file->f_dentry->d_inode;
+	inode = file_inode(file);
 	assert("vs-972", !reiser4_inode_get_flag(inode, REISER4_NO_SD));
 
 	ctx = reiser4_init_context(inode->i_sb);
@@ -1795,7 +1795,7 @@ static ssize_t read_compound_file(struct file *file, char __user *buf,
 	size_t was_read = 0;
 	loff_t i_size;
 
-	inode = file->f_dentry->d_inode;
+	inode = file_inode(file);
 	assert("vs-972", !reiser4_inode_get_flag(inode, REISER4_NO_SD));
 
 	i_size = i_size_read(inode);
@@ -1887,7 +1887,7 @@ int mmap_unix_file(struct file *file, struct vm_area_struct *vma)
 	struct unix_file_info *uf_info;
 	reiser4_block_nr needed;
 
-	inode = file->f_dentry->d_inode;
+	inode = file_inode(file);
 	ctx = reiser4_init_context(inode->i_sb);
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
@@ -2096,7 +2096,7 @@ ssize_t write_unix_file(struct file *file,
 	loff_t new_size;
 
 	ctx = get_current_context();
-	inode = file->f_dentry->d_inode;
+	inode = file_inode(file);
 
 	assert("vs-947", !reiser4_inode_get_flag(inode, REISER4_NO_SD));
 	assert("vs-9471", (!reiser4_inode_get_flag(inode, REISER4_PART_MIXED)));
@@ -2730,7 +2730,7 @@ int write_begin_unix_file(struct file *file, struct page *page,
 	struct inode * inode;
 	struct unix_file_info *info;
 
-	inode = file->f_dentry->d_inode;
+	inode = file_inode(file);
 	info = unix_file_inode_data(inode);
 
 	ret = reiser4_grab_space_force(estimate_one_insert_into_item
@@ -2739,7 +2739,7 @@ int write_begin_unix_file(struct file *file, struct page *page,
 	if (ret)
 		return ret;
 	get_exclusive_access(info);
-	ret = find_file_state(file->f_dentry->d_inode, info);
+	ret = find_file_state(file_inode(file), info);
 	if (unlikely(ret != 0)) {
 		drop_exclusive_access(info);
 		return ret;
@@ -2768,7 +2768,7 @@ int write_end_unix_file(struct file *file, struct page *page,
 	struct inode *inode;
 	struct unix_file_info *info;
 
-	inode = file->f_dentry->d_inode;
+	inode = file_inode(file);
 	info = unix_file_inode_data(inode);
 
 	unlock_page(page);
diff --git a/fs/reiser4/plugin/file/file_conversion.c b/fs/reiser4/plugin/file/file_conversion.c
index 3ce4898..d4661cd 100644
--- a/fs/reiser4/plugin/file/file_conversion.c
+++ b/fs/reiser4/plugin/file/file_conversion.c
@@ -524,7 +524,7 @@ ssize_t reiser4_write_dispatch(struct file *file, const char __user *buf,
 	ssize_t written_old = 0; /* bytes written with initial plugin */
 	ssize_t written_new = 0; /* bytes written with new plugin */
 	struct dispatch_context cont;
-	struct inode * inode = file->f_dentry->d_inode;
+	struct inode * inode = file_inode(file);
 
 	ctx = reiser4_init_context(inode->i_sb);
 	if (IS_ERR(ctx))
@@ -603,20 +603,20 @@ int reiser4_open_dispatch(struct inode *inode, struct file *file)
 ssize_t reiser4_read_dispatch(struct file * file, char __user * buf,
 			      size_t size, loff_t * off)
 {
-	struct inode * inode = file->f_dentry->d_inode;
+	struct inode * inode = file_inode(file);
 	return PROT_PASSIVE(ssize_t, read, (file, buf, size, off));
 }
 
 long reiser4_ioctl_dispatch(struct file *filp, unsigned int cmd,
 			    unsigned long arg)
 {
-	struct inode * inode = filp->f_dentry->d_inode;
+	struct inode * inode = file_inode(filp);
 	return PROT_PASSIVE(int, ioctl, (filp, cmd, arg));
 }
 
 int reiser4_mmap_dispatch(struct file *file, struct vm_area_struct *vma)
 {
-	struct inode *inode = file->f_dentry->d_inode;
+	struct inode *inode = file_inode(file);
 	return PROT_PASSIVE(int, mmap, (file, vma));
 }
 
@@ -649,7 +649,7 @@ int reiser4_write_begin_dispatch(struct file *file,
 	struct page *page;
 	pgoff_t index;
 	reiser4_context *ctx;
-	struct inode * inode = file->f_dentry->d_inode;
+	struct inode * inode = file_inode(file);
 
 	index = pos >> PAGE_CACHE_SHIFT;
 	page = grab_cache_page_write_begin(mapping, index,
@@ -658,7 +658,7 @@ int reiser4_write_begin_dispatch(struct file *file,
 	if (!page)
 		return -ENOMEM;
 
-	ctx = reiser4_init_context(file->f_dentry->d_inode->i_sb);
+	ctx = reiser4_init_context(file_inode(file)->i_sb);
 	if (IS_ERR(ctx)) {
 		ret = PTR_ERR(ctx);
 		goto err2;
diff --git a/fs/reiser4/plugin/file/tail_conversion.c b/fs/reiser4/plugin/file/tail_conversion.c
index 1763cb1..ed9e4f8 100644
--- a/fs/reiser4/plugin/file/tail_conversion.c
+++ b/fs/reiser4/plugin/file/tail_conversion.c
@@ -670,7 +670,7 @@ int extent2tail(struct file * file, struct unix_file_info *uf_info)
 			assert("edward-1537",
 			       file != NULL && file->f_dentry != NULL);
 			assert("edward-1538",
-			       file->f_dentry->d_inode == inode);
+			       file_inode(file) == inode);
 
 			result = reiser4_write_tail_noreserve(file, inode,
 						 (char __user *)kmap(page),
diff --git a/fs/reiser4/plugin/file_ops_readdir.c b/fs/reiser4/plugin/file_ops_readdir.c
index e359dec..00b9f45 100644
--- a/fs/reiser4/plugin/file_ops_readdir.c
+++ b/fs/reiser4/plugin/file_ops_readdir.c
@@ -136,7 +136,7 @@ static int dir_go_to(struct file *dir, struct readdir_pos *pos, tap_t *tap)
 
 	assert("nikita-2554", pos != NULL);
 
-	inode = dir->f_dentry->d_inode;
+	inode = file_inode(dir);
 	result = inode_dir_plugin(inode)->build_readdir_key(dir, &key);
 	if (result != 0)
 		return result;
@@ -232,7 +232,7 @@ static int dir_rewind(struct file *dir, loff_t *fpos, struct readdir_pos *pos, t
 	 * to */
 	destination = pos->entry_no + shift;
 
-	inode = dir->f_dentry->d_inode;
+	inode = file_inode(dir);
 	if (dirpos < 0)
 		return RETERR(-EINVAL);
 	else if (destination == 0ll || dirpos == 0) {
@@ -442,7 +442,7 @@ static int dir_readdir_init(struct file *f, loff_t* fpos, tap_t *tap,
 	int result;
 
 	assert("nikita-1359", f != NULL);
-	inode = f->f_dentry->d_inode;
+	inode = file_inode(f);
 	assert("nikita-1360", inode != NULL);
 
 	if (!S_ISDIR(inode->i_mode))
@@ -481,7 +481,7 @@ loff_t reiser4_llseek_dir_common(struct file *file, loff_t off, int origin)
 	loff_t result;
 	struct inode *inode;
 
-	inode = file->f_dentry->d_inode;
+	inode = file_inode(file);
 
 	ctx = reiser4_init_context(inode->i_sb);
 	if (IS_ERR(ctx))
@@ -570,7 +570,7 @@ int reiser4_iterate_common(struct file *f /* directory file being read */,
 	struct readdir_pos *pos;
 
 	assert("nikita-1359", f != NULL);
-	inode = f->f_dentry->d_inode;
+	inode = file_inode(f);
 	assert("nikita-1360", inode != NULL);
 
 	if (!S_ISDIR(inode->i_mode))
diff --git a/fs/reiser4/plugin/item/ctail.c b/fs/reiser4/plugin/item/ctail.c
index ea197ce..6475eb7 100644
--- a/fs/reiser4/plugin/item/ctail.c
+++ b/fs/reiser4/plugin/item/ctail.c
@@ -814,7 +814,7 @@ static int ctail_readpages_filler(void * data, struct page * page)
 {
 	int ret = 0;
 	struct cluster_handle * clust = data;
-	struct inode * inode = clust->file->f_dentry->d_inode;
+	struct inode * inode = file_inode(clust->file);
 
 	assert("edward-1525", page->mapping == inode->i_mapping);
 
@@ -852,7 +852,7 @@ int readpages_ctail(struct file *file, struct address_space *mapping,
 	struct cluster_handle clust;
 	struct inode *inode = mapping->host;
 
-	assert("edward-1521", inode == file->f_dentry->d_inode);
+	assert("edward-1521", inode == file_inode(file));
 
 	cluster_init_read(&clust, NULL);
 	clust.file = file;
diff --git a/fs/reiser4/plugin/item/extent_file_ops.c b/fs/reiser4/plugin/item/extent_file_ops.c
index cb57379..89828d5 100644
--- a/fs/reiser4/plugin/item/extent_file_ops.c
+++ b/fs/reiser4/plugin/item/extent_file_ops.c
@@ -1224,7 +1224,7 @@ int reiser4_read_extent(struct file *file, flow_t *flow, hint_t *hint)
 	assert("vs-1120", znode_is_loaded(coord->node));
 	assert("vs-1256", coord_matches_key_extent(coord, &flow->key));
 
-	mapping = file->f_dentry->d_inode->i_mapping;
+	mapping = file_inode(file)->i_mapping;
 	ext_coord = &uf_coord->extension.extent;
 
 	file_off = get_key_offset(&flow->key);
-- 
2.3.0

