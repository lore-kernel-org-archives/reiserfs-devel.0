From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 10/11] reiserfs: use generic readdir for operations across all xattrs
Date: Mon, 20 Feb 2006 15:14:58 -0500
Message-ID: <20060220201458.GA23321@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28101-reiserfs=m.gmane.org@namesys.com>
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


 The current reiserfs xattr implementation open codes reiserfs_readdir and
 frees the path before calling the filldir function. Typically, the filldir
 function is something that modifies the file system, such as a chown or
 an inode deletion that also require reading of an inode associated with each
 direntry. Since the file system is modified, the path retained becomes
 invalid for the next run. In addition, it runs backwards in attempt to
 minimize activity.

 This is clearly suboptimal from a code cleanliness perspective as well as
 performance-wise.

 This patch implements a generic reiserfs_for_each_xattr that uses the generic
 readdir and a specific filldir routine that simply populates an array of
 dentries and then performs a specific operation on them. When all files have
 been operated on, it then calls the operation on the directory itself.

 The result is a noticable code reduction and better performance.

 fs/reiserfs/xattr.c |  434 ++++++++++++++--------------------------------------
 1 files changed, 125 insertions(+), 309 deletions(-)

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/xattr.c linux-2.6.15-staging2/fs/reiserfs/xattr.c
--- linux-2.6.15-staging1/fs/reiserfs/xattr.c	2006-02-13 14:21:15.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/xattr.c	2006-02-13 14:21:15.000000000 -0500
@@ -230,181 +230,6 @@ static struct file *open_xattr_file(stru
 	return ERR_PTR(err);
 }
 
-/*
- * this is very similar to fs/reiserfs/dir.c:reiserfs_readdir, but
- * we need to drop the path before calling the filldir struct.  That
- * would be a big performance hit to the non-xattr case, so I've copied
- * the whole thing for now. --clm
- *
- * the big difference is that I go backwards through the directory,
- * and don't mess with f->f_pos, but the idea is the same.  Do some
- * action on each and every entry in the directory.
- *
- * we're called with i_mutex held, so there are no worries about the directory
- * changing underneath us.
- */
-static int __xattr_readdir(struct file *filp, void *dirent, filldir_t filldir)
-{
-	struct inode *inode = filp->f_dentry->d_inode;
-	struct cpu_key pos_key;	/* key of current position in the directory (key of directory entry) */
-	INITIALIZE_PATH(path_to_entry);
-	struct buffer_head *bh;
-	int entry_num;
-	struct item_head *ih, tmp_ih;
-	int search_res;
-	char *local_buf;
-	loff_t next_pos;
-	char small_buf[32];	/* avoid kmalloc if we can */
-	struct reiserfs_de_head *deh;
-	int d_reclen;
-	char *d_name;
-	off_t d_off;
-	ino_t d_ino;
-	struct reiserfs_dir_entry de;
-
-	/* form key for search the next directory entry using f_pos field of
-	   file structure */
-	next_pos = max_reiserfs_offset(inode);
-
-	while (1) {
-	      research:
-		if (next_pos <= DOT_DOT_OFFSET)
-			break;
-		make_cpu_key(&pos_key, inode, next_pos, TYPE_DIRENTRY, 3);
-
-		search_res =
-		    search_by_entry_key(inode->i_sb, &pos_key, &path_to_entry,
-					&de);
-		if (search_res == IO_ERROR) {
-			// FIXME: we could just skip part of directory which could
-			// not be read
-			pathrelse(&path_to_entry);
-			return -EIO;
-		}
-
-		if (search_res == NAME_NOT_FOUND)
-			de.de_entry_num--;
-
-		set_de_name_and_namelen(&de);
-		entry_num = de.de_entry_num;
-		deh = &(de.de_deh[entry_num]);
-
-		bh = de.de_bh;
-		ih = de.de_ih;
-
-		if (!is_direntry_le_ih(ih)) {
-			reiserfs_warning(inode->i_sb, "not direntry %h", ih);
-			break;
-		}
-		copy_item_head(&tmp_ih, ih);
-
-		/* we must have found item, that is item of this directory, */
-		RFALSE(COMP_SHORT_KEYS(&(ih->ih_key), &pos_key),
-		       "vs-9000: found item %h does not match to dir we readdir %K",
-		       ih, &pos_key);
-
-		if (deh_offset(deh) <= DOT_DOT_OFFSET) {
-			break;
-		}
-
-		/* look for the previous entry in the directory */
-		next_pos = deh_offset(deh) - 1;
-
-		if (!de_visible(deh))
-			/* it is hidden entry */
-			continue;
-
-		d_reclen = entry_length(bh, ih, entry_num);
-		d_name = B_I_DEH_ENTRY_FILE_NAME(bh, ih, deh);
-		d_off = deh_offset(deh);
-		d_ino = deh_objectid(deh);
-
-		if (!d_name[d_reclen - 1])
-			d_reclen = strlen(d_name);
-
-		if (d_reclen > REISERFS_MAX_NAME(inode->i_sb->s_blocksize)) {
-			/* too big to send back to VFS */
-			continue;
-		}
-
-		/* Ignore the .reiserfs_priv entry */
-		if (reiserfs_xattrs(inode->i_sb) &&
-		    !old_format_only(inode->i_sb) &&
-		    deh_objectid(deh) ==
-		    le32_to_cpu(INODE_PKEY
-				(REISERFS_SB(inode->i_sb)->priv_root->d_inode)->
-				k_objectid))
-			continue;
-
-		if (d_reclen <= 32) {
-			local_buf = small_buf;
-		} else {
-			local_buf = kmalloc(d_reclen, GFP_NOFS);
-			if (!local_buf) {
-				pathrelse(&path_to_entry);
-				return -ENOMEM;
-			}
-			if (item_moved(&tmp_ih, &path_to_entry)) {
-				kfree(local_buf);
-
-				/* sigh, must retry.  Do this same offset again */
-				next_pos = d_off;
-				goto research;
-			}
-		}
-
-		// Note, that we copy name to user space via temporary
-		// buffer (local_buf) because filldir will block if
-		// user space buffer is swapped out. At that time
-		// entry can move to somewhere else
-		memcpy(local_buf, d_name, d_reclen);
-
-		/* the filldir function might need to start transactions,
-		 * or do who knows what.  Release the path now that we've
-		 * copied all the important stuff out of the deh
-		 */
-		pathrelse(&path_to_entry);
-
-		if (filldir(dirent, local_buf, d_reclen, d_off, d_ino,
-			    DT_UNKNOWN) < 0) {
-			if (local_buf != small_buf) {
-				kfree(local_buf);
-			}
-			goto end;
-		}
-		if (local_buf != small_buf) {
-			kfree(local_buf);
-		}
-	}			/* while */
-
-      end:
-	pathrelse(&path_to_entry);
-	return 0;
-}
-
-/*
- * this could be done with dedicated readdir ops for the xattr files,
- * but I want to get something working asap
- * this is stolen from vfs_readdir
- *
- */
-static
-int xattr_readdir(struct file *file, filldir_t filler, void *buf)
-{
-	struct inode *inode = file->f_dentry->d_inode;
-	int res = -ENOTDIR;
-	if (!file->f_op || !file->f_op->readdir)
-		goto out;
-	res = -ENOENT;
-	if (!IS_DEADDIR(inode)) {
-		lock_kernel();
-		res = __xattr_readdir(file, buf, filler);
-		unlock_kernel();
-	}
-      out:
-	return res;
-}
-
 static inline __u32 xattr_hash(const char *msg, int len)
 {
 	return csum_partial(msg, len, 0);
@@ -638,46 +463,83 @@ reiserfs_xattr_get(struct inode *inode, 
 	return err;
 }
 
+#if 0
+static int __restart_transaction_if_needed(struct inode *inode, int chunk)
+{
+	struct reiserfs_transaction_handle *th = current->journal_info;
+	struct super_block *s = th->t_super;
+	int len = th->t_blocks_allocated;
+	int err;
+
+	BUG_ON(!th->t_trans_id);
+	BUG_ON(!th->t_refcount);
+
+	if (!journal_transaction_should_end(th, len))
+		return 0;
+
+	/* we cannot restart while nested */
+	if (th->t_refcount > 1) {
+		reiserfs_warning(th->t_super, "can't restart nested transaction in %s\n", __FUNCTION__);
+		return 0;
+	}
+
+	err = journal_end(th, s, len);
+	if (!err) {
+		err = journal_begin(th, s, chunk);
+		if (!err)
+			reiserfs_update_inode_transaction(inode);
+	}
+
+	return err;
+}
+#endif
+
 /* The following are side effects of other operations that aren't explicitly
  * modifying extended attributes. This includes operations such as permissions
  * or ownership changes, object deletions, etc. */
+struct reiserfs_dentry_buf {
+	struct dentry *xadir;
+	int count;
+	struct dentry *dentries[8];
+};
 
 static int
-reiserfs_delete_xattrs_filler(void *buf, const char *name, int namelen,
-			      loff_t offset, ino_t ino, unsigned int d_type)
+fill_with_dentries(void *buf, const char *name, int namelen, loff_t offset,
+                   ino_t ino, unsigned int d_type)
 {
-	struct dentry *xadir = (struct dentry *)buf;
+	struct reiserfs_dentry_buf *dbuf = buf;
 	struct dentry *dentry;
-	int err = 0;
 
-	dentry = lookup_one_len(name, xadir, namelen);
+	if (dbuf->count == ARRAY_SIZE(dbuf->dentries))
+		return -ENOSPC;
+
+	if (name[0] == '.' && (name[1] == '\0' || (name[1] == '.' && name[2] == '\0')))
+		return 0;
+
+	dentry = lookup_one_len(name, dbuf->xadir, namelen);
 	if (IS_ERR(dentry)) {
-		err = PTR_ERR(dentry);
-		goto out;
+		return PTR_ERR(dentry);
 	} else if (!dentry->d_inode) {
-		err = -ENODATA;
-		goto out_file;
+		/* This should never happen */
+		dput(dentry);
+		return -ENODATA;
 	}
 
-	/* Skip directories.. */
-	if (S_ISDIR(dentry->d_inode->i_mode))
-		goto out_file;
-
-	err = vfs_unlink(xadir->d_inode, dentry);
-
-      out_file:
-	dput(dentry);
-
-      out:
-	return err;
+	dbuf->dentries[dbuf->count++] = dentry;
+	return 0;
 }
 
-/* This is called w/ inode->i_mutex downed */
-int reiserfs_delete_xattrs(struct inode *inode)
+typedef int(*xattr_action)(struct dentry *dentry, void *data);
+
+static int reiserfs_for_each_xattr(struct inode *inode, xattr_action action,
+                                   void *data)
 {
 	struct file *fp;
-	struct dentry *dir, *root;
+	struct dentry *dir;
 	int err = 0;
+	struct reiserfs_dentry_buf buf = {
+		.count = 0,
+	};
 
 	/* Skip out, an xattr has no xattrs associated with it */
 	if (is_reiserfs_priv_object(inode) ||
@@ -703,44 +565,34 @@ int reiserfs_delete_xattrs(struct inode 
 		goto out;
 	}
 
-	lock_kernel();
-	err = xattr_readdir(fp, reiserfs_delete_xattrs_filler, dir);
-	if (err) {
-		unlock_kernel();
-		goto out_dir;
-	}
+	buf.xadir = dir;
 
-	/* Leftovers besides . and .. -- that's not good. */
-	if (dir->d_inode->i_nlink <= 2) {
-		struct reiserfs_transaction_handle th;
-		int jbegin_count;
-		int jerr;
+	err = fp->f_op->readdir(fp, &buf, fill_with_dentries);
+	while ((err == 0 || err == -ENOSPC) && buf.count) {
+		int i;
+		err = 0;
+
+		for (i = 0; i < buf.count && buf.dentries[i]; i++) {
+			int lerr = 0;
+			struct dentry *dentry = buf.dentries[i];
+
+			if (err == 0 && !S_ISDIR(dentry->d_inode->i_mode))
+				lerr = action(dentry, data);
+
+			dput(dentry);
+			buf.dentries[i] = NULL;
 
-		jbegin_count = JOURNAL_PER_BALANCE_CNT * 2 + 2 + 4 *
-		               REISERFS_QUOTA_TRANS_BLOCKS(inode->i_sb);
-		reiserfs_write_lock(inode->i_sb);
-		err = journal_begin (&th, inode->i_sb, jbegin_count);
-		if (err) {
-			reiserfs_write_unlock(inode->i_sb);
-			unlock_kernel();
-			goto out_dir;
+			if (lerr)
+				err = lerr;
 		}
-		root = dget(REISERFS_SB(inode->i_sb)->xattr_root);
-		mutex_lock(&root->d_inode->i_mutex);
-		err = vfs_rmdir(root->d_inode, dir);
-		mutex_unlock(&root->d_inode->i_mutex);
-		jerr = journal_end (&th, inode->i_sb, jbegin_count);
-		reiserfs_write_unlock(inode->i_sb);
-		dput(root);
-		if (!err && jerr)
-			err = jerr;
-	} else {
-		reiserfs_warning(inode->i_sb,
-				 "Couldn't remove all entries in directory");
+		buf.count = 0;
+		if (err == 0)
+			err = fp->f_op->readdir(fp, &buf, fill_with_dentries);
 	}
-	unlock_kernel();
 
-      out_dir:
+	if (err == 0)
+		err = action(dir, data);
+
 	fput(fp);
 
       out:
@@ -748,92 +600,56 @@ int reiserfs_delete_xattrs(struct inode 
 	return err;
 }
 
-struct reiserfs_chown_buf {
-	struct inode *inode;
-	struct dentry *xadir;
-	struct iattr *attrs;
-};
-
-/* XXX: If there is a better way to do this, I'd love to hear about it */
-static int
-reiserfs_chown_xattrs_filler(void *buf, const char *name, int namelen,
-			     loff_t offset, ino_t ino, unsigned int d_type)
+static int delete_one_xattr(struct dentry *dentry, void *data)
 {
-	struct reiserfs_chown_buf *chown_buf = (struct reiserfs_chown_buf *)buf;
-	struct dentry *xafile, *xadir = chown_buf->xadir;
-	struct iattr *attrs = chown_buf->attrs;
-	int err = 0;
+	struct inode *dir = dentry->d_parent->d_inode;
 
-	xafile = lookup_one_len(name, xadir, namelen);
-	if (IS_ERR(xafile))
-		return PTR_ERR(xafile);
-	else if (!xafile->d_inode) {
-		dput(xafile);
-		return -ENODATA;
-	}
+	if (S_ISDIR(dentry->d_inode->i_mode)) {
+		int err;
+		struct reiserfs_transaction_handle th;
+		int nblocks = JOURNAL_PER_BALANCE_CNT * 2 + 2 +
+		              4 * REISERFS_QUOTA_TRANS_BLOCKS(dir->i_sb);
 
-	if (!S_ISDIR(xafile->d_inode->i_mode))
-		err = notify_change(xafile, attrs);
-	dput(xafile);
+		BUG_ON(dentry == dentry->d_parent);
+		if (dir == dentry->d_inode) {
+			printk ("dir = %s\n", dentry->d_parent->d_name.name);
+			printk ("dentry = %s\n", dentry->d_name.name);
+			return -EBUSY;
+		}
+
+		/* reiserfs_rmdir is going to start a transaction itself,
+		 * but we need to start it outside of locking the xattr
+		 * root to preserve lock ordering. */
+		err = journal_begin(&th, dir->i_sb, nblocks);
+		if (err == 0) {
+			int err2;
+			mutex_lock(&dir->i_mutex);
+			err = vfs_rmdir(dir, dentry);
+			err2 = journal_end(&th, dir->i_sb, nblocks);
+			mutex_unlock(&dir->i_mutex);
+			if (err2)
+				err = err2;
+		}
+		return err;
+	}
 
-	return err;
+	return vfs_unlink(dir, dentry);
 }
 
-int reiserfs_chown_xattrs(struct inode *inode, struct iattr *attrs)
+static int chown_one_xattr(struct dentry *dentry, void *data)
 {
-	struct file *fp;
-	struct dentry *dir;
-	int err = 0;
-	struct reiserfs_chown_buf buf;
-	unsigned int ia_valid = attrs->ia_valid;
-
-	/* Skip out, an xattr has no xattrs associated with it */
-	if (is_reiserfs_priv_object(inode) ||
-	    get_inode_sd_version(inode) == STAT_DATA_V1 ||
-	    !reiserfs_xattrs(inode->i_sb)) {
-		return 0;
-	}
-	down_write(&REISERFS_I(inode)->xattr_sem);
-	dir = open_xa_dir(inode, XATTR_REPLACE);
-	if (IS_ERR(dir)) {
-		if (PTR_ERR(dir) != -ENODATA)
-			err = PTR_ERR(dir);
-		goto out;
-	} else if (!dir->d_inode) {
-		dput(dir);
-		goto out;
-	}
-
-	fp = dentry_open(dir, NULL, O_RDWR|O_NOATIME|O_DIRECTORY);
-	if (IS_ERR(fp)) {
-		err = PTR_ERR(fp);
-		/* dentry_open dputs the dentry if it fails */
-		goto out;
-	}
-
-	lock_kernel();
-
-	attrs->ia_valid &= (ATTR_UID | ATTR_GID | ATTR_CTIME);
-	buf.xadir = dir;
-	buf.attrs = attrs;
-	buf.inode = inode;
-
-	err = xattr_readdir(fp, reiserfs_chown_xattrs_filler, &buf);
-	if (err) {
-		unlock_kernel();
-		goto out_dir;
-	}
-
-	err = notify_change(dir, attrs);
-	unlock_kernel();
+	struct iattr *attrs = data;
+	return notify_change(dentry, attrs);
+}
 
-      out_dir:
-	fput(fp);
+int reiserfs_delete_xattrs(struct inode *inode)
+{
+	return reiserfs_for_each_xattr(inode, delete_one_xattr, NULL);
+}
 
-      out:
-	attrs->ia_valid = ia_valid;
-	up_write(&REISERFS_I(inode)->xattr_sem);
-	return err;
+int reiserfs_chown_xattrs(struct inode *inode, struct iattr *attrs)
+{
+	return reiserfs_for_each_xattr(inode, chown_one_xattr, attrs);
 }
 
 /* Actual operations that are exported to VFS-land */
@@ -968,7 +784,7 @@ ssize_t reiserfs_listxattr(struct dentry
 		goto out;
 	}
 
-	err = xattr_readdir(fp, listxattr_filler, &buf);
+	err = fp->f_op->readdir(fp, &buf, listxattr_filler);
 	if (err)
 		goto out_dir;
 
