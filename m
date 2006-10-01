From: Jeff Mahoney <jeffm@suse.com>
Subject: reiser3: on-demand bitmaps accepted into 2.6.19-rc1
Date: Sun, 01 Oct 2006 10:27:28 -0400
Message-ID: <451FD050.9050607@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030409080103000209060906"
Return-path: <reiserfs-list-return-29989-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--------------030409080103000209060906
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


For those waiting on on-demand bitmap loading, it has been committed to
mainline. (Commit 5065227b46235ec0131b383cc2f537069b55c6b6)

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFFH9BPLPWxlyuTD7IRAj7PAJ0bLgsQHObEBwuDB308GTaYGnuIDgCfS3m/
UnTrpZ8jX2jVWvDdKp/gYA4=
=ITNl
-----END PGP SIGNATURE-----

--------------030409080103000209060906
Content-Type: message/rfc822;
 name*0="- reiserfs-on-demand-bitmap-loading.patch removed from -mm tree"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="- reiserfs-on-demand-bitmap-loading.patch removed from -mm t";
 filename*1="ree"

Return-Path: <akpm@osdl.org>
Received: from imap.suse.de ([unix socket])
	by imap-dhs (Cyrus v2.1.16) with LMTP; Sun, 01 Oct 2006 10:50:51 +0200
X-Sieve: CMU Sieve 2.2
Received: from Relay1.suse.de (relay1.suse.de [149.44.160.87])
	(using TLSv1 with cipher EDH-RSA-DES-CBC3-SHA (168/168 bits))
	(Client CN "relay.suse.de", Issuer "SuSE Linux AG internal IMAP-Server CA" (verified OK))
	by imap.suse.de (Postfix) with ESMTP id 20DB79110CA
	for <jeffm@imap-dhs.suse.de>; Sun,  1 Oct 2006 10:50:51 +0200 (CEST)
Received: by Relay1.suse.de (Postfix)
	id 141459CA5E; Sun,  1 Oct 2006 10:50:51 +0200 (CEST)
Received: from Relay1.suse.de (localhost [127.0.0.1])
	by Relay1.suse.de (Postfix) with ESMTP id 0809DA11A1
	for <jeffm@suse.com>; Sun,  1 Oct 2006 10:50:51 +0200 (CEST)
Received: from Relay1.suse.de ([127.0.0.1])
 by Relay1.suse.de (Relay1 [127.0.0.1]) (amavisd-new, port 10026) with ESMTP
 id 15052-09 for <jeffm@suse.com>; Sun,  1 Oct 2006 10:50:50 +0200 (CEST)
Received: from mx2.suse.de (cantor2.suse.de [195.135.220.15])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by Relay1.suse.de (Postfix) with ESMTP id E792D99801
	for <jeffm@suse.com>; Sun,  1 Oct 2006 10:50:49 +0200 (CEST)
Received: from smtp.osdl.org (smtp.osdl.org [65.172.181.4])
	(using TLSv1 with cipher EDH-RSA-DES-CBC3-SHA (168/168 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 19B4820D74
	for <jeffm@suse.com>; Sun,  1 Oct 2006 10:50:48 +0200 (CEST)
Received: from shell0.pdx.osdl.net (fw.osdl.org [65.172.181.6])
	by smtp.osdl.org (8.12.8/8.12.8) with ESMTP id k918obaX021555
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO);
	Sun, 1 Oct 2006 01:50:37 -0700
Received: from localhost.localdomain (shell0.pdx.osdl.net [10.9.0.31])
	by shell0.pdx.osdl.net (8.13.1/8.11.6) with ESMTP id k918obn1014173;
	Sun, 1 Oct 2006 01:50:37 -0700
Message-Id: <200610010850.k918obn1014173@shell0.pdx.osdl.net>
Subject: - reiserfs-on-demand-bitmap-loading.patch removed from -mm tree
To: jeffm@suse.com, reiserfs-dev@namesys.com,
	mm-commits@vger.kernel.org
From: akpm@osdl.org
Date: Sun, 01 Oct 2006 01:50:37 -0700
X-MIMEDefang-Filter: osdl$Revision: 1.155 $
X-Virus-Scanned: by amavisd-new at Relay1.suse.de
X-Spam-Status: No, hits=-2.5 tagged_above=-20.0 required=5.0 tests=BAYES_00,
 FORGED_RCVD_HELO, MY_LINUX, NO_REAL_NAME
X-Spam-Level: 


The patch titled

     reiserfs: on-demand bitmap loading

has been removed from the -mm tree.  Its filename is

     reiserfs-on-demand-bitmap-loading.patch

This patch was dropped because it was merged into mainline or a subsystem tree

------------------------------------------------------
Subject: reiserfs: on-demand bitmap loading
From: Jeff Mahoney <jeffm@suse.com>

This is the patch the three previous ones have been leading up to.

It changes the behavior of ReiserFS from loading and caching all the bitmaps
as special, to treating the bitmaps like any other bit of metadata and just
letting the system-wide caches figure out what to hang on to.

Buffer heads are allocated on the fly, so there is no need to retain pointers
to all of them.  The caching of the metadata occurs when the data is read and
updated, and is considered invalid and uncached until then.

I needed to remove the vs-4040 check for performing a duplicate operation on a
particular bit.  The reason is that while the other sites for working with
bitmaps are allowed to schedule, is_reusable() is called from do_balance(),
which will panic if a schedule occurs in certain places.

The benefit of on-demand bitmaps clearly outweighs a sanity check that depends
on a compile-time option that is discouraged.

[akpm@osdl.org: warning fix]
Signed-off-by: Jeff Mahoney <jeffm@suse.com>
Cc: <reiserfs-dev@namesys.com>
Signed-off-by: Andrew Morton <akpm@osdl.org>
---

 fs/reiserfs/bitmap.c           |   97 ++++++++++++++-----------------
 fs/reiserfs/resize.c           |   24 +++++--
 fs/reiserfs/super.c            |   39 ++----------
 include/linux/reiserfs_fs_sb.h |    1 
 4 files changed, 70 insertions(+), 91 deletions(-)

diff -puN fs/reiserfs/bitmap.c~reiserfs-on-demand-bitmap-loading fs/reiserfs/bitmap.c
--- a/fs/reiserfs/bitmap.c~reiserfs-on-demand-bitmap-loading
+++ a/fs/reiserfs/bitmap.c
@@ -60,7 +60,6 @@ static inline void get_bit_address(struc
 int is_reusable(struct super_block *s, b_blocknr_t block, int bit_value)
 {
 	int bmap, offset;
-	struct buffer_head *bh;
 
 	if (block == 0 || block >= SB_BLOCK_COUNT(s)) {
 		reiserfs_warning(s,
@@ -98,22 +97,6 @@ int is_reusable(struct super_block *s, b
 		return 0;
 	}
 
-	bh = SB_AP_BITMAP(s)[bmap].bh;
-	get_bh(bh);
-
-	if ((bit_value == 0 && reiserfs_test_le_bit(offset, bh->b_data)) ||
-	    (bit_value == 1 && reiserfs_test_le_bit(offset, bh->b_data) == 0)) {
-		reiserfs_warning(s,
-				 "vs-4040: is_reusable: corresponding bit of block %lu does not "
-				 "match required value (bmap==%d, offset==%d) test_bit==%d",
-				 block, bmap, offset,
-				 reiserfs_test_le_bit(offset, bh->b_data));
-
-		brelse(bh);
-		return 0;
-	}
-	brelse(bh);
-
 	if (bit_value == 0 && block == SB_ROOT_BLOCK(s)) {
 		reiserfs_warning(s,
 				 "vs-4050: is_reusable: this is root block (%u), "
@@ -173,13 +156,10 @@ static int scan_bitmap_block(struct reis
 				 bmap_n);
 		return 0;
 	}
-	bh = bi->bh;
-	get_bh(bh);
 
-	if (buffer_locked(bh)) {
-		PROC_INFO_INC(s, scan_bitmap.wait);
-		__wait_on_buffer(bh);
-	}
+	bh = reiserfs_read_bitmap_block(s, bmap_n);
+	if (bh == NULL)
+		return 0;
 
 	while (1) {
 	      cont:
@@ -285,9 +265,20 @@ static int bmap_hash_id(struct super_blo
  */
 static inline int block_group_used(struct super_block *s, u32 id)
 {
-	int bm;
-	bm = bmap_hash_id(s, id);
-	if (SB_AP_BITMAP(s)[bm].free_count > ((s->s_blocksize << 3) * 60 / 100)) {
+	int bm = bmap_hash_id(s, id);
+	struct reiserfs_bitmap_info *info = &SB_AP_BITMAP(s)[bm];
+
+	/* If we don't have cached information on this bitmap block, we're
+	 * going to have to load it later anyway. Loading it here allows us
+	 * to make a better decision. This favors long-term performace gain
+	 * with a better on-disk layout vs. a short term gain of skipping the
+	 * read and potentially having a bad placement. */
+	if (info->first_zero_hint == 0) {
+		struct buffer_head *bh = reiserfs_read_bitmap_block(s, bm);
+		brelse(bh);
+	}
+
+	if (info->free_count > ((s->s_blocksize << 3) * 60 / 100)) {
 		return 0;
 	}
 	return 1;
@@ -413,8 +404,9 @@ static void _reiserfs_free_block(struct 
 		return;
 	}
 
-	bmbh = apbi[nr].bh;
-	get_bh(bmbh);
+	bmbh = reiserfs_read_bitmap_block(s, nr);
+	if (!bmbh)
+		return;
 
 	reiserfs_prepare_for_journal(s, bmbh, 1);
 
@@ -1320,6 +1312,7 @@ struct buffer_head *reiserfs_read_bitmap
                                                unsigned int bitmap)
 {
 	b_blocknr_t block = (sb->s_blocksize << 3) * bitmap;
+	struct reiserfs_bitmap_info *info = SB_AP_BITMAP(sb) + bitmap;
 	struct buffer_head *bh;
 
 	/* Way old format filesystems had the bitmaps packed up front.
@@ -1330,9 +1323,21 @@ struct buffer_head *reiserfs_read_bitmap
 	else if (bitmap == 0)
 		block = (REISERFS_DISK_OFFSET_IN_BYTES >> sb->s_blocksize_bits) + 1;
 
-	bh = sb_getblk(sb, block);
-	if (!buffer_uptodate(bh))
-		ll_rw_block(READ, 1, &bh);
+	bh = sb_bread(sb, block);
+	if (bh == NULL)
+		reiserfs_warning(sb, "sh-2029: %s: bitmap block (#%lu) "
+		                 "reading failed", __FUNCTION__, bh->b_blocknr);
+	else {
+		if (buffer_locked(bh)) {
+			PROC_INFO_INC(sb, scan_bitmap.wait);
+			__wait_on_buffer(bh);
+		}
+		BUG_ON(!buffer_uptodate(bh));
+		BUG_ON(atomic_read(&bh->b_count) == 0);
+
+		if (info->first_zero_hint == 0)
+			reiserfs_cache_bitmap_metadata(sb, bh, info);
+	}
 
 	return bh;
 }
@@ -1340,7 +1345,6 @@ struct buffer_head *reiserfs_read_bitmap
 int reiserfs_init_bitmap_cache(struct super_block *sb)
 {
 	struct reiserfs_bitmap_info *bitmap;
-	int i;
 
 	bitmap = vmalloc(sizeof (*bitmap) * SB_BMAP_NR(sb));
 	if (bitmap == NULL)
@@ -1348,28 +1352,15 @@ int reiserfs_init_bitmap_cache(struct su
 
 	memset(bitmap, 0, sizeof (*bitmap) * SB_BMAP_NR(sb));
 
-	for (i = 0; i < SB_BMAP_NR(sb); i++)
-		bitmap[i].bh = reiserfs_read_bitmap_block(sb, i);
-
-	/* make sure we have them all */
-	for (i = 0; i < SB_BMAP_NR(sb); i++) {
-		wait_on_buffer(bitmap[i].bh);
-		if (!buffer_uptodate(bitmap[i].bh)) {
-			reiserfs_warning(sb, "sh-2029: %s: "
-					 "bitmap block (#%lu) reading failed",
-			                 __FUNCTION__, bitmap[i].bh->b_blocknr);
-			for (i = 0; i < SB_BMAP_NR(sb); i++)
-				brelse(bitmap[i].bh);
-			vfree(bitmap);
-			return -EIO;
-		}
-	}
-
-	/* Cache the info on the bitmaps before we get rolling */
-	for (i = 0; i < SB_BMAP_NR(sb); i++)
-		reiserfs_cache_bitmap_metadata(sb, bitmap[i].bh, &bitmap[i]);
-
 	SB_AP_BITMAP(sb) = bitmap;
 
 	return 0;
 }
+
+void reiserfs_free_bitmap_cache(struct super_block *sb)
+{
+	if (SB_AP_BITMAP(sb)) {
+		vfree(SB_AP_BITMAP(sb));
+		SB_AP_BITMAP(sb) = NULL;
+	}
+}
diff -puN fs/reiserfs/resize.c~reiserfs-on-demand-bitmap-loading fs/reiserfs/resize.c
--- a/fs/reiserfs/resize.c~reiserfs-on-demand-bitmap-loading
+++ a/fs/reiserfs/resize.c
@@ -128,8 +128,9 @@ int reiserfs_resize(struct super_block *
 		 * transaction begins, and the new bitmaps don't matter if the
 		 * transaction fails. */
 		for (i = bmap_nr; i < bmap_nr_new; i++) {
-			bh = sb_getblk(s, i * s->s_blocksize * 8);
-			get_bh(bh);
+			/* don't use read_bitmap_block since it will cache
+			 * the uninitialized bitmap */
+			bh = sb_bread(s, i * s->s_blocksize * 8);
 			memset(bh->b_data, 0, sb_blocksize(sb));
 			reiserfs_test_and_set_le_bit(0, bh->b_data);
 			reiserfs_cache_bitmap_metadata(s, bh, bitmap + i);
@@ -140,7 +141,6 @@ int reiserfs_resize(struct super_block *
 			// update bitmap_info stuff
 			bitmap[i].first_zero_hint = 1;
 			bitmap[i].free_count = sb_blocksize(sb) * 8 - 1;
-			bitmap[i].bh = bh;
 			brelse(bh);
 		}
 		/* free old bitmap blocks array */
@@ -157,8 +157,13 @@ int reiserfs_resize(struct super_block *
 
 	/* Extend old last bitmap block - new blocks have been made available */
 	info = SB_AP_BITMAP(s) + bmap_nr - 1;
-	bh = info->bh;
-	get_bh(bh);
+	bh = reiserfs_read_bitmap_block(s, bmap_nr - 1);
+	if (!bh) {
+		int jerr = journal_end(&th, s, 10);
+		if (jerr)
+			return jerr;
+		return -EIO;
+	}
 
 	reiserfs_prepare_for_journal(s, bh, 1);
 	for (i = block_r; i < s->s_blocksize * 8; i++)
@@ -172,8 +177,13 @@ int reiserfs_resize(struct super_block *
 
 	/* Correct new last bitmap block - It may not be full */
 	info = SB_AP_BITMAP(s) + bmap_nr_new - 1;
-	bh = info->bh;
-	get_bh(bh);
+	bh = reiserfs_read_bitmap_block(s, bmap_nr_new - 1);
+	if (!bh) {
+		int jerr = journal_end(&th, s, 10);
+		if (jerr)
+			return jerr;
+		return -EIO;
+	}
 
 	reiserfs_prepare_for_journal(s, bh, 1);
 	for (i = block_r_new; i < s->s_blocksize * 8; i++)
diff -puN fs/reiserfs/super.c~reiserfs-on-demand-bitmap-loading fs/reiserfs/super.c
--- a/fs/reiserfs/super.c~reiserfs-on-demand-bitmap-loading
+++ a/fs/reiserfs/super.c
@@ -432,7 +432,6 @@ int remove_save_link(struct inode *inode
 
 static void reiserfs_put_super(struct super_block *s)
 {
-	int i;
 	struct reiserfs_transaction_handle th;
 	th.t_trans_id = 0;
 
@@ -462,10 +461,7 @@ static void reiserfs_put_super(struct su
 	 */
 	journal_release(&th, s);
 
-	for (i = 0; i < SB_BMAP_NR(s); i++)
-		brelse(SB_AP_BITMAP(s)[i].bh);
-
-	vfree(SB_AP_BITMAP(s));
+	reiserfs_free_bitmap_cache(s);
 
 	brelse(SB_BUFFER_WITH_SB(s));
 
@@ -1344,7 +1340,6 @@ static int read_super_block(struct super
 /* after journal replay, reread all bitmap and super blocks */
 static int reread_meta_blocks(struct super_block *s)
 {
-	int i;
 	ll_rw_block(READ, 1, &(SB_BUFFER_WITH_SB(s)));
 	wait_on_buffer(SB_BUFFER_WITH_SB(s));
 	if (!buffer_uptodate(SB_BUFFER_WITH_SB(s))) {
@@ -1353,20 +1348,7 @@ static int reread_meta_blocks(struct sup
 		return 1;
 	}
 
-	for (i = 0; i < SB_BMAP_NR(s); i++) {
-		ll_rw_block(READ, 1, &(SB_AP_BITMAP(s)[i].bh));
-		wait_on_buffer(SB_AP_BITMAP(s)[i].bh);
-		if (!buffer_uptodate(SB_AP_BITMAP(s)[i].bh)) {
-			reiserfs_warning(s,
-					 "reread_meta_blocks, error reading bitmap block number %d at %llu",
-					 i,
-					 (unsigned long long)SB_AP_BITMAP(s)[i].
-					 bh->b_blocknr);
-			return 1;
-		}
-	}
 	return 0;
-
 }
 
 /////////////////////////////////////////////////////
@@ -1547,7 +1529,6 @@ static int function2code(hashf_t func)
 static int reiserfs_fill_super(struct super_block *s, void *data, int silent)
 {
 	struct inode *root_inode;
-	int j;
 	struct reiserfs_transaction_handle th;
 	int old_format = 0;
 	unsigned long blocks;
@@ -1793,19 +1774,17 @@ static int reiserfs_fill_super(struct su
 	if (jinit_done) {	/* kill the commit thread, free journal ram */
 		journal_release_error(NULL, s);
 	}
-	if (SB_DISK_SUPER_BLOCK(s)) {
-		for (j = 0; j < SB_BMAP_NR(s); j++) {
-			if (SB_AP_BITMAP(s))
-				brelse(SB_AP_BITMAP(s)[j].bh);
-		}
-		vfree(SB_AP_BITMAP(s));
-	}
+
+	reiserfs_free_bitmap_cache(s);
 	if (SB_BUFFER_WITH_SB(s))
 		brelse(SB_BUFFER_WITH_SB(s));
 #ifdef CONFIG_QUOTA
-	for (j = 0; j < MAXQUOTAS; j++) {
-		kfree(sbi->s_qf_names[j]);
-		sbi->s_qf_names[j] = NULL;
+	{
+		int j;
+		for (j = 0; j < MAXQUOTAS; j++) {
+			kfree(sbi->s_qf_names[j]);
+			sbi->s_qf_names[j] = NULL;
+		}
 	}
 #endif
 	kfree(sbi);
diff -puN include/linux/reiserfs_fs_sb.h~reiserfs-on-demand-bitmap-loading include/linux/reiserfs_fs_sb.h
--- a/include/linux/reiserfs_fs_sb.h~reiserfs-on-demand-bitmap-loading
+++ a/include/linux/reiserfs_fs_sb.h
@@ -267,7 +267,6 @@ struct reiserfs_bitmap_info {
 	// FIXME: Won't work with block sizes > 8K
 	__u16 first_zero_hint;
 	__u16 free_count;
-	struct buffer_head *bh;	/* the actual bitmap */
 };
 
 struct proc_dir_entry;
_

Patches currently in -mm which might be from jeffm@suse.com are

origin.patch


--------------030409080103000209060906--
