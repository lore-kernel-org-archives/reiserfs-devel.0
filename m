From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4[StorageManager(2383)]: lzo1_alloc...
Date: Tue, 22 Aug 2017 21:49:21 +0300
Message-ID: <599C7CB1.6080408@gmail.com>
References: <20170820171513.B783215FEAF@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000609000102040708030503"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to;
        bh=Qw2wAGDKsiPDqm+IiiQ7nNO/Jqqj5PAX8RVhkaqPbiM=;
        b=Gol2OUg/WUPq3hgsJJ0on1WsdkjJhCBm5AJ9rMbSItxS9FwCYmcWIqY2+4S5n/P+SP
         PMnsXEY3xY63265U2bYcJlBwdVuHDV5g0JArjuRq3K6zfqGSRferssX7QIMoLxlyweJN
         StMVGskVwKRgCPjpF3BOq1hHUL9wLgrQXis9d4+Dx+UXFwtMNecmUOazjcTIMHmIzgxg
         zZQY4/aQAQx5ayRL1eg1qKWx4vQSk7aEHfKBIz2c1JHPwzOwR7ReKS7AtYM5+QwSy8z7
         T52dvCDnKwvQq5S0BAq8BAzsnIcFK/GMVKlZhedGOQFeKZ2qkQFwTlX4dZD55p55LU5J
         phDg==
In-Reply-To: <20170820171513.B783215FEAF@huitzilopochtli.metztli-it.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>
Cc: Mathieu Belanger <admin@korinar.com>

This is a multi-part message in MIME format.
--------------000609000102040708030503
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Please, try the attached patches.
The first patch improves responsiveness to vm subsystem
(modified version of ->migratepage() from Ivan Shapovalov).
The second patch performs memory allocation in the critical
place with __GFP_NOFAIL flag.
Let us know about results.

Thanks,
Edward.

On 08/20/2017 07:15 PM, Metztli Information Technology wrote:
> Niltze, Ed-
>
> Although I am using your latest Reiser4 patch for Linux kernel 4.12.x on a test 1.2TB (transparent compression) reiser4 root fs, I have seen
> dmesg generate the following in lesser version patches and in much smaller partitions, i.e., 20Gb -- with transparent compression, too.
>
> Your input would be greatly appreciated:
>
> [ 3449.944653] reiser4[StorageManager(2383)]: lzo1_alloc (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> [ 3449.944674] reiser4[StorageManager(2383)]: lzo1_alloc (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> [ 3449.944694] reiser4[StorageManager(2383)]: lzo1_alloc (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> [ 3449.944715] reiser4[StorageManager(2383)]: lzo1_alloc (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> [snip]
> ( the above replicate for about two(2) thousand lines )
>
> Please note that the error above is not immediate but is triggered possibly by multiple events run simultaneously, i.e.,
>   plugged 1TB USB hard disk with multiple partitions where copy operation to local disk is being run; another copy operation to-from local hard
> disk itself on same filesystem; installing additional packages, building local software, etc.
>
> Subsequently system slows down in latency and fan use increases in all instances.
>
> Thank you in advance for your insight.
>
>
> Best Professional Regards.
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message tomajordomo@vger.kernel.org
> More majordomo info athttp://vger.kernel.org/majordomo-info.html


--------------000609000102040708030503
Content-Type: text/x-patch;
 name="reiser4-migratepage.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-migratepage.patch"

diff --git a/as_ops.c b/as_ops.c
index 393e9d1..df856df 100644
--- a/as_ops.c
+++ b/as_ops.c
@@ -309,9 +309,45 @@ int reiser4_releasepage(struct page *page, gfp_t gfp UNUSED_ARG)
 int reiser4_migratepage(struct address_space *mapping, struct page *newpage,
 			struct page *page, enum migrate_mode mode)
 {
-	/* TODO: implement movable mapping
+	int result;
+	jnode *node;
+
+	assert("intelfx-62", PageLocked(page));
+	assert("intelfx-63", !PageWriteback(page));
+	assert("intelfx-64", reiser4_schedulable());
+	assert("intelfx-65", page->mapping != NULL);
+	assert("intelfx-66", page->mapping->host != NULL);
+
+	if (!PagePrivate(page))
+		/*
+		 * anonymous, not yet captured page
+		 */
+		return migrate_page(mapping, newpage, page, mode);
+	/*
+	 * page has an attached jnode. That jnode should be
+	 * linked with the new page. Otherwise, everyone
+	 * calling jnode_page(), etc will get invalid data
 	 */
-	return -EIO;
+	node = jnode_by_page(page);
+	spin_lock_jnode(node);
+	spin_lock(&(node->load));
+
+	page_clear_jnode(page, node);
+	set_page_private(newpage, 0ul);
+
+	result = migrate_page(mapping, newpage, page, mode);
+	if (unlikely(result))
+		/*
+		 * migration failed - reattach the old page
+		 */
+		jnode_attach_page(node, page);
+	else
+		jnode_attach_page(node, newpage);
+	spin_unlock(&(node->load));
+	spin_unlock_jnode(node);
+
+	assert("intelfx-67", reiser4_schedulable());
+	return result;
 }
 #endif /* CONFIG_MIGRATION */
 



--------------000609000102040708030503
Content-Type: text/x-patch;
 name="reiser4-alloc-compression-workspace-with-nofail-flag.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="reiser4-alloc-compression-workspace-with-nofail-flag.patch"

diff --git a/plugin/item/ctail.c b/plugin/item/ctail.c
index 3f46c38..42a3134 100644
--- a/plugin/item/ctail.c
+++ b/plugin/item/ctail.c
@@ -1565,6 +1565,7 @@ static int assign_conversion_mode(flush_pos_t * pos, ctail_convert_mode_t *mode)
 	if (!convert_data_attached(pos)) {
 		if (should_attach_convert_idata(pos)) {
 			struct inode *inode;
+			gfp_t old_mask = get_current_context()->gfp_mask;
 
 			assert("edward-264", pos->child != NULL);
 			assert("edward-265", jnode_page(pos->child) != NULL);
@@ -1577,7 +1578,9 @@ static int assign_conversion_mode(flush_pos_t * pos, ctail_convert_mode_t *mode)
 			/*
 			 * attach new convert item info
 			 */
+			get_current_context()->gfp_mask |= __GFP_NOFAIL;
 			ret = attach_convert_idata(pos, inode);
+			get_current_context()->gfp_mask = old_mask;
 			pos->child = NULL;
 			if (ret == -E_REPEAT) {
 				/*



--------------000609000102040708030503--
