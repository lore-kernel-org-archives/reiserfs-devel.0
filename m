From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4: port for Linux-4.2
Date: Tue, 22 Sep 2015 13:34:04 +0200
Message-ID: <56013CAC.50207@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080205090702070108090106"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-type;
        bh=TpT2bOjDoeaXTNFwIMLzCvpPU20pQGDhgh/SooDrbm0=;
        b=KKQa98+yazZnKfJjOhWqJSq7CqoqxEWZnSTrcEJ4nZQh5ZKDL8hI0ayUWW20C1lsze
         XzIulcPIIWE04K+6ZMT1wp1f3nj+ybSOQfqOsqZ0kXzE/wCBHSuu+Q/w6RjTHx6ayurz
         gnAKdD0Lw2NZB9ZR5+aIrDfXHXmQChHKOwG2Rna2XR7x1wZ3XLkvGfbjF39YeAk2636A
         KNGNOITI2whMpDbUknYIwyKFW7Wvs8/khg8DhfzZs6EVbNH7dCpBkPNCuSZcIXexvh42
         +5u9GPO3ZBzAuf3MMbrwZNpdkDAS1lALNnAZf9uidBxwHQV6anAv/+lV4f8thVQzJfr2
         Y0zA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080205090702070108090106
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------080205090702070108090106
Content-Type: text/x-patch;
 name="reiser4-port-for-4.2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-port-for-4.2.patch"

diff -u -r linux-4.1.7/fs/reiser4/flush_queue.c linux-4.2/fs/reiser4/flush_queue.c
--- linux-4.1.7/fs/reiser4/flush_queue.c	2015-09-17 12:07:53.030274225 +0200
+++ linux-4.2/fs/reiser4/flush_queue.c	2015-09-18 14:32:11.491733319 +0200
@@ -402,9 +402,6 @@
 
 	assert("zam-958", bio->bi_rw & WRITE);
 
-	if (err == -EOPNOTSUPP)
-		set_bit(BIO_EOPNOTSUPP, &bio->bi_flags);
-
 	/* we expect that bio->private is set to NULL or fq object which is used
 	 * for synchronization and error counting. */
 	fq = bio->bi_private;
diff -u -r linux-4.1.7/fs/reiser4/page_cache.c linux-4.2/fs/reiser4/page_cache.c
--- linux-4.1.7/fs/reiser4/page_cache.c	2015-09-17 12:07:53.035274226 +0200
+++ linux-4.2/fs/reiser4/page_cache.c	2015-09-18 14:36:40.301602905 +0200
@@ -218,6 +218,7 @@
 {
 	assert("nikita-2168", fake->i_state & I_NEW);
 	fake->i_mapping->a_ops = &formatted_fake_as_ops;
+	inode_attach_wb(fake, NULL);
 	*pfake = fake;
 	/* NOTE-NIKITA something else? */
 	unlock_new_inode(fake);
@@ -281,16 +282,19 @@
 	sinfo = get_super_private_nocheck(super);
 
 	if (sinfo->fake != NULL) {
+		inode_detach_wb(sinfo->fake);
 		iput(sinfo->fake);
 		sinfo->fake = NULL;
 	}
 
 	if (sinfo->bitmap != NULL) {
+		inode_detach_wb(sinfo->bitmap);
 		iput(sinfo->bitmap);
 		sinfo->bitmap = NULL;
 	}
 
 	if (sinfo->cc != NULL) {
+		inode_detach_wb(sinfo->cc);
 		iput(sinfo->cc);
 		sinfo->cc = NULL;
 	}
diff -u -r linux-4.1.7/fs/reiser4/page_cache.h linux-4.2/fs/reiser4/page_cache.h
--- linux-4.1.7/fs/reiser4/page_cache.h	2015-09-17 12:07:53.036274227 +0200
+++ linux-4.2/fs/reiser4/page_cache.h	2015-09-18 14:32:11.497733317 +0200
@@ -43,12 +43,6 @@
 			 PAGE_KERNEL);
 }
 
-static inline void reiser4_cancel_dirty_page(struct page *page)
-{
-	if (TestClearPageDirty(page))
-		account_page_cleaned(page, page->mapping);
-}
-
 #define PAGECACHE_TAG_REISER4_MOVED PAGECACHE_TAG_DIRTY
 
 #if REISER4_DEBUG
diff -u -r linux-4.1.7/fs/reiser4/plugin/file/cryptcompress.c linux-4.2/fs/reiser4/plugin/file/cryptcompress.c
--- linux-4.1.7/fs/reiser4/plugin/file/cryptcompress.c	2015-09-17 12:07:53.040274228 +0200
+++ linux-4.2/fs/reiser4/plugin/file/cryptcompress.c	2015-09-18 14:32:11.502733314 +0200
@@ -1946,7 +1946,9 @@
 		 * page is no longer relevant. However, the uptodate
 		 * status of the page is still relevant!
 		 */
-		reiser4_cancel_dirty_page(clust->pages[i]);
+		if (PageDirty(clust->pages[i]))
+			cancel_dirty_page(clust->pages[i]);
+
 		unlock_page(clust->pages[i]);
 
 		if (in_page < PAGE_CACHE_SIZE)
@@ -2908,7 +2910,7 @@
 	info = cryptcompress_inode_data(inode);
 	ctx = get_current_context();
 
-	result = file_remove_suid(file);
+	result = file_remove_privs(file);
 	if (unlikely(result != 0)) {
 		context_set_commit_async(ctx);
 		return result;
diff -u -r linux-4.1.7/fs/reiser4/plugin/file/file.c linux-4.2/fs/reiser4/plugin/file/file.c
--- linux-4.1.7/fs/reiser4/plugin/file/file.c	2015-09-17 12:07:53.042274228 +0200
+++ linux-4.2/fs/reiser4/plugin/file/file.c	2015-09-18 14:32:11.503733314 +0200
@@ -2101,7 +2101,7 @@
 	assert("vs-947", !reiser4_inode_get_flag(inode, REISER4_NO_SD));
 	assert("vs-9471", (!reiser4_inode_get_flag(inode, REISER4_PART_MIXED)));
 
-	result = file_remove_suid(file);
+	result = file_remove_privs(file);
 	if (result) {
 		context_set_commit_async(ctx);
 		return result;
diff -u -r linux-4.1.7/fs/reiser4/plugin/inode_ops.c linux-4.2/fs/reiser4/plugin/inode_ops.c
--- linux-4.1.7/fs/reiser4/plugin/inode_ops.c	2015-09-17 12:07:53.045274229 +0200
+++ linux-4.2/fs/reiser4/plugin/inode_ops.c	2015-09-18 14:32:11.506733312 +0200
@@ -402,7 +402,7 @@
  * inode_operations.
  * Assumes that inode's i_private points to the content of symbolic link.
  */
-void *reiser4_follow_link_common(struct dentry *dentry, struct nameidata *nd)
+const char *reiser4_follow_link_common(struct dentry *dentry, void **cookie)
 {
 	assert("vs-851", S_ISLNK(dentry->d_inode->i_mode));
 
@@ -410,8 +410,7 @@
 	    || !reiser4_inode_get_flag(dentry->d_inode,
 				       REISER4_GENERIC_PTR_USED))
 		return ERR_PTR(RETERR(-EINVAL));
-	nd_set_link(nd, dentry->d_inode->i_private);
-	return NULL;
+	return *cookie = dentry->d_inode->i_private;
 }
 
 /**
diff -u -r linux-4.1.7/fs/reiser4/plugin/object.h linux-4.2/fs/reiser4/plugin/object.h
--- linux-4.1.7/fs/reiser4/plugin/object.h	2015-09-17 12:07:53.053274231 +0200
+++ linux-4.2/fs/reiser4/plugin/object.h	2015-09-18 14:32:11.516733307 +0200
@@ -24,7 +24,7 @@
 		 umode_t mode, dev_t rdev);
 int reiser4_rename_common(struct inode *old_dir, struct dentry *old_name,
 			  struct inode *new_dir, struct dentry *new_name);
-void *reiser4_follow_link_common(struct dentry *, struct nameidata *data);
+const char *reiser4_follow_link_common(struct dentry *, void **cookie);
 int reiser4_permission_common(struct inode *, int mask);
 int reiser4_setattr_common(struct dentry *, struct iattr *);
 int reiser4_getattr_common(struct vfsmount *mnt, struct dentry *,
diff -u -r linux-4.1.7/fs/reiser4/wander.c linux-4.2/fs/reiser4/wander.c
--- linux-4.1.7/fs/reiser4/wander.c	2015-09-17 12:07:53.065274235 +0200
+++ linux-4.2/fs/reiser4/wander.c	2015-09-18 14:32:11.527733302 +0200
@@ -841,15 +841,10 @@
 			if (super->s_flags & MS_RDONLY)
 				undo_bio(bio);
 			else {
-				int not_supported;
-
 				add_fq_to_bio(fq, bio);
 				bio_get(bio);
 				reiser4_submit_bio(write_op, bio);
-				not_supported = bio_flagged(bio, BIO_EOPNOTSUPP);
 				bio_put(bio);
-				if (not_supported)
-					return -EOPNOTSUPP;
 			}
 
 			block += nr_used - 1;

--------------080205090702070108090106--
