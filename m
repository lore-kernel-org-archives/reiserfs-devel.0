From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: 2.6.21-rc7 new aops patchset
Date: Mon, 23 Apr 2007 14:17:55 +0200
Message-ID: <E1HfxUR-0006Ta-00@dorka.pomaz.szeredi.hu>
References: <20070421143200.GA23326@wotan.suse.de>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-reply-to: <20070421143200.GA23326@wotan.suse.de> (message from Nick Piggin
	on Sat, 21 Apr 2007 16:32:04 +0200)
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: npiggin@suse.de
Cc: linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, mark.fasheh@oracle.com, reiserfs-dev@namesys.com, reiserfs-list@namesys.com

Nick,

Thanks for converting fuse, and testing.  Here's a minor update to
fs-fuse-aops.patch.

Miklos

----
Convert fuse to new aops.

[mszeredi]
 - don't send zero length write requests
 - it is not legal for the filesystem to return with zero written bytes

Signed-off-by: Nick Piggin <npiggin@suse.de>
Signed-off-by: Miklos Szeredi <mszeredi@suse.cz>

Index: linux/fs/fuse/file.c
===================================================================
--- linux.orig/fs/fuse/file.c	2007-04-23 12:04:10.000000000 +0200
+++ linux/fs/fuse/file.c	2007-04-23 13:56:48.000000000 +0200
@@ -443,22 +443,25 @@ static size_t fuse_send_write(struct fus
 	return outarg.size;
 }
 
-static int fuse_prepare_write(struct file *file, struct page *page,
-			      unsigned offset, unsigned to)
-{
-	/* No op */
+static int fuse_write_begin(struct file *file, struct address_space *mapping,
+			loff_t pos, unsigned len, unsigned flags,
+			struct page **pagep, void **fsdata)
+{
+	pgoff_t index = pos >> PAGE_CACHE_SHIFT;
+
+	*pagep = __grab_cache_page(mapping, index);
+	if (!*pagep)
+		return -ENOMEM;
 	return 0;
 }
 
-static int fuse_commit_write(struct file *file, struct page *page,
-			     unsigned offset, unsigned to)
+static int fuse_buffered_write(struct file *file, struct inode *inode,
+			       loff_t pos, unsigned count, struct page *page)
 {
 	int err;
 	size_t nres;
-	unsigned count = to - offset;
-	struct inode *inode = page->mapping->host;
 	struct fuse_conn *fc = get_fuse_conn(inode);
-	loff_t pos = page_offset(page) + offset;
+	unsigned offset = pos & (PAGE_CACHE_SIZE - 1);
 	struct fuse_req *req;
 
 	if (is_bad_inode(inode))
@@ -474,20 +477,35 @@ static int fuse_commit_write(struct file
 	nres = fuse_send_write(req, file, inode, pos, count);
 	err = req->out.h.error;
 	fuse_put_request(fc, req);
-	if (!err && nres != count)
+	if (!err && !nres)
 		err = -EIO;
 	if (!err) {
-		pos += count;
+		pos += nres;
 		spin_lock(&fc->lock);
 		if (pos > inode->i_size)
 			i_size_write(inode, pos);
 		spin_unlock(&fc->lock);
 
-		if (offset == 0 && to == PAGE_CACHE_SIZE)
+		if (count == PAGE_CACHE_SIZE)
 			SetPageUptodate(page);
 	}
 	fuse_invalidate_attr(inode);
-	return err;
+	return err ? err : nres;
+}
+
+static int fuse_write_end(struct file *file, struct address_space *mapping,
+			loff_t pos, unsigned len, unsigned copied,
+			struct page *page, void *fsdata)
+{
+	struct inode *inode = mapping->host;
+	int res = 0;
+
+	if (copied)
+		res = fuse_buffered_write(file, inode, pos, copied, page);
+
+	unlock_page(page);
+	page_cache_release(page);
+	return res;
 }
 
 static void fuse_release_user_pages(struct fuse_req *req, int write)
@@ -817,8 +835,8 @@ static const struct file_operations fuse
 
 static const struct address_space_operations fuse_file_aops  = {
 	.readpage	= fuse_readpage,
-	.prepare_write	= fuse_prepare_write,
-	.commit_write	= fuse_commit_write,
+	.write_begin	= fuse_write_begin,
+	.write_end	= fuse_write_end,
 	.readpages	= fuse_readpages,
 	.set_page_dirty	= fuse_set_page_dirty,
 	.bmap		= fuse_bmap,
