From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] Fix of quota deadlock on pagelock
Date: Fri, 19 Nov 2004 11:09:51 +0100
Message-ID: <20041119100951.GG15189@atrey.karlin.mff.cuni.cz>
References: <20041119095515.GD15189@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="tEFtbjk+mNEviIIX"
Return-path: <reiserfs-list-return-22432-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041119095515.GD15189@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
To: akpm@osdl.org
Cc: linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

--tEFtbjk+mNEviIIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hello!

  Attached patch implements quota_read() and quota_write() functions for
ext2. Please apply.
								Honza

-- 
Jan Kara <jack@suse.cz>
SuSE CR Labs

--tEFtbjk+mNEviIIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="quota-new-2.6.10-rc2-mm1-6-ext2.diff"

Implementation of quota reading and writing functions for ext2.

Signed-off-by: Jan Kara <jack@suse.cz>

diff -rupNX /home/jack/.kerndiffexclude linux-2.6.10-rc2-mm1-5-quotacore/fs/ext2/ext2.h linux-2.6.10-rc2-mm1-6-ext2/fs/ext2/ext2.h
--- linux-2.6.10-rc2-mm1-5-quotacore/fs/ext2/ext2.h	2004-11-16 16:39:07.000000000 +0100
+++ linux-2.6.10-rc2-mm1-6-ext2/fs/ext2/ext2.h	2004-11-18 20:28:58.000000000 +0100
@@ -119,6 +119,7 @@ extern int ext2_write_inode (struct inod
 extern void ext2_delete_inode (struct inode *);
 extern int ext2_sync_inode (struct inode *);
 extern void ext2_discard_prealloc (struct inode *);
+extern int ext2_get_block(struct inode *, sector_t, struct buffer_head *, int);
 extern void ext2_truncate (struct inode *);
 extern int ext2_setattr (struct dentry *, struct iattr *);
 extern void ext2_set_inode_flags(struct inode *inode);
diff -rupNX /home/jack/.kerndiffexclude linux-2.6.10-rc2-mm1-5-quotacore/fs/ext2/inode.c linux-2.6.10-rc2-mm1-6-ext2/fs/ext2/inode.c
--- linux-2.6.10-rc2-mm1-5-quotacore/fs/ext2/inode.c	2004-11-16 16:39:07.000000000 +0100
+++ linux-2.6.10-rc2-mm1-6-ext2/fs/ext2/inode.c	2004-11-18 20:28:58.000000000 +0100
@@ -524,7 +524,7 @@ changed:
  * reachable from inode.
  */
 
-static int ext2_get_block(struct inode *inode, sector_t iblock, struct buffer_head *bh_result, int create)
+int ext2_get_block(struct inode *inode, sector_t iblock, struct buffer_head *bh_result, int create)
 {
 	int err = -EIO;
 	int offsets[4];
diff -rupNX /home/jack/.kerndiffexclude linux-2.6.10-rc2-mm1-5-quotacore/fs/ext2/super.c linux-2.6.10-rc2-mm1-6-ext2/fs/ext2/super.c
--- linux-2.6.10-rc2-mm1-5-quotacore/fs/ext2/super.c	2004-11-16 16:39:07.000000000 +0100
+++ linux-2.6.10-rc2-mm1-6-ext2/fs/ext2/super.c	2004-11-18 20:28:58.000000000 +0100
@@ -200,6 +200,11 @@ static void ext2_clear_inode(struct inod
 }
 
 
+#ifdef CONFIG_QUOTA
+static ssize_t ext2_quota_read(struct super_block *sb, int type, char *data, size_t len, loff_t off);
+static ssize_t ext2_quota_write(struct super_block *sb, int type, const char *data, size_t len, loff_t off);
+#endif
+
 static struct super_operations ext2_sops = {
 	.alloc_inode	= ext2_alloc_inode,
 	.destroy_inode	= ext2_destroy_inode,
@@ -211,6 +216,10 @@ static struct super_operations ext2_sops
 	.statfs		= ext2_statfs,
 	.remount_fs	= ext2_remount,
 	.clear_inode	= ext2_clear_inode,
+#ifdef CONFIG_QUOTA
+	.quota_read	= ext2_quota_read,
+	.quota_write	= ext2_quota_write,
+#endif
 };
 
 /* Yes, most of these are left as NULL!!
@@ -1001,6 +1010,102 @@ static struct super_block *ext2_get_sb(s
 	return get_sb_bdev(fs_type, flags, dev_name, data, ext2_fill_super);
 }
 
+#ifdef CONFIG_QUOTA
+
+/* Read data from quotafile - avoid pagecache and such because we cannot afford
+ * acquiring the locks... As quota files are never truncated and quota code
+ * itself serializes the operations (and noone else should touch the files)
+ * we don't have to be afraid of races */
+static ssize_t ext2_quota_read(struct super_block *sb, int type, char *data,
+			       size_t len, loff_t off)
+{
+	struct inode *inode = sb_dqopt(sb)->files[type];
+	unsigned long blk = off >> EXT2_BLOCK_SIZE_BITS(sb);
+	int err = 0, offset = off & (sb->s_blocksize - 1), tocopy;
+	size_t toread;
+	struct buffer_head tmp_bh, *bh;
+	loff_t i_size = i_size_read(inode);
+
+	if (off > i_size)
+		return 0;
+	if (off+len > i_size)
+		len = i_size-off;
+	toread = len;
+	while (toread > 0) {
+		tocopy = sb->s_blocksize - offset < toread ?
+				sb->s_blocksize - offset : toread;
+
+		tmp_bh.b_state = 0;
+		err = ext2_get_block(inode, blk, &tmp_bh, 0);
+		if (err)
+			return err;
+		if (!buffer_mapped(&tmp_bh))	/* A hole? */
+			memset(data, 0, tocopy);
+		else {
+			bh = sb_bread(sb, tmp_bh.b_blocknr);
+			if (!bh)
+				return -EIO;
+			memcpy(data, bh->b_data+offset, tocopy);
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
+/* Write to quotafile */
+static ssize_t ext2_quota_write(struct super_block *sb, int type,
+				const char *data, size_t len, loff_t off)
+{
+	struct inode *inode = sb_dqopt(sb)->files[type];
+	unsigned long blk = off >> EXT2_BLOCK_SIZE_BITS(sb);
+	int err = 0, offset = off & (sb->s_blocksize - 1), tocopy;
+	size_t towrite = len;
+	struct buffer_head tmp_bh, *bh;
+
+	down(&inode->i_sem);
+	while (towrite > 0) {
+		tocopy = sb->s_blocksize - offset < towrite ?
+				sb->s_blocksize - offset : towrite;
+
+		tmp_bh.b_state = 0;
+		err = ext2_get_block(inode, blk, &tmp_bh, 1);
+		if (err)
+			goto out;
+		if (offset || tocopy != EXT2_BLOCK_SIZE(sb))
+			bh = sb_bread(sb, tmp_bh.b_blocknr);
+		else
+			bh = sb_getblk(sb, tmp_bh.b_blocknr);
+		if (!bh) {
+			err = -EIO;
+			goto out;
+		}
+		memcpy(bh->b_data+offset, data, tocopy);
+		set_buffer_uptodate(bh);
+		mark_buffer_dirty(bh);
+		brelse(bh);
+		offset = 0;
+		towrite -= tocopy;
+		data += tocopy;
+		blk++;
+	}
+out:
+	if (len == towrite)
+		return err;
+	if (inode->i_size < off+len-towrite)
+		i_size_write(inode, off+len-towrite);
+	inode->i_version++;
+	inode->i_mtime = inode->i_ctime = CURRENT_TIME;
+	mark_inode_dirty(inode);
+	up(&inode->i_sem);
+	return len - towrite;
+}
+
+#endif
+
 static struct file_system_type ext2_fs_type = {
 	.owner		= THIS_MODULE,
 	.name		= "ext2",

--tEFtbjk+mNEviIIX--
