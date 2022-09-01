From: Zhang Yi <yi.zhang@huawei.com>
Subject: [PATCH v2 12/14] fs/buffer: remove ll_rw_block()
 helper
Date: Thu, 1 Sep 2022 21:35:03 +0800
Message-ID: <20220901133505.2510834-13-yi.zhang@huawei.com>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cluster-devel-bounces@redhat.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662038741;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ehvbqx7DcyCVokGvFhW3lwAccm0KpOqDuQKWURqnvYk=;
	b=XX68wXgp3plr9snUUZCxgfwTQpCGt6jbijIItea1eCJ9Pg4w7+4Mt58Js123HkGFRlrIuK
	UTjXw2aaAsQqdsDukbn+b0uVmKInJU/B+ywtOdNl18JVhqwvcPMxcqho0BhvpvI6NvKIXp
	7rKYSPnUBI1KZwJid7QnCol1Xzysi0k=
In-Reply-To: <20220901133505.2510834-1-yi.zhang@huawei.com>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, jack@suse.cz
Cc: axboe@kernel.dk, tytso@mit.edu, yi.zhang@huawei.com, mark@fasheh.com, almaz.alexandrovich@paragon-software.com, viro@zeniv.linux.org.uk, yukuai3@huawei.com, dushistov@mail.ru, akpm@linux-foundation.org, chengzhihao1@huawei.com

Now that all ll_rw_block() users has been replaced to new safe helpers,
we just remove it here.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 fs/buffer.c                 | 63 +++----------------------------------
 include/linux/buffer_head.h |  1 -
 2 files changed, 4 insertions(+), 60 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index aec568b3ae52..2cccc7586b99 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -152,7 +152,7 @@ static void __end_buffer_read_notouch(struct buffer_hea=
d *bh, int uptodate)
=20
 /*
  * Default synchronous end-of-IO handler..  Just mark it up-to-date and
- * unlock the buffer. This is what ll_rw_block uses too.
+ * unlock the buffer.
  */
 void end_buffer_read_sync(struct buffer_head *bh, int uptodate)
 {
@@ -491,8 +491,8 @@ int inode_has_buffers(struct inode *inode)
  * all already-submitted IO to complete, but does not queue any new
  * writes to the disk.
  *
- * To do O_SYNC writes, just queue the buffer writes with ll_rw_block as
- * you dirty the buffers, and then use osync_inode_buffers to wait for
+ * To do O_SYNC writes, just queue the buffer writes with write_dirty_buff=
er
+ * as you dirty the buffers, and then use osync_inode_buffers to wait for
  * completion.  Any other dirty buffers which are not yet queued for
  * write will not be flushed to disk by the osync.
  */
@@ -1806,7 +1806,7 @@ int __block_write_full_page(struct inode *inode, stru=
ct page *page,
 =09=09/*
 =09=09 * The page was marked dirty, but the buffers were
 =09=09 * clean.  Someone wrote them back by hand with
-=09=09 * ll_rw_block/submit_bh.  A rare case.
+=09=09 * write_dirty_buffer/submit_bh.  A rare case.
 =09=09 */
 =09=09end_page_writeback(page);
=20
@@ -2713,61 +2713,6 @@ int submit_bh(blk_opf_t opf, struct buffer_head *bh)
 }
 EXPORT_SYMBOL(submit_bh);
=20
-/**
- * ll_rw_block: low-level access to block devices (DEPRECATED)
- * @opf: block layer request operation and flags.
- * @nr: number of &struct buffer_heads in the array
- * @bhs: array of pointers to &struct buffer_head
- *
- * ll_rw_block() takes an array of pointers to &struct buffer_heads, and
- * requests an I/O operation on them, either a %REQ_OP_READ or a %REQ_OP_W=
RITE.
- * @opf contains flags modifying the detailed I/O behavior, most notably
- * %REQ_RAHEAD.
- *
- * This function drops any buffer that it cannot get a lock on (with the
- * BH_Lock state bit), any buffer that appears to be clean when doing a wr=
ite
- * request, and any buffer that appears to be up-to-date when doing read
- * request.  Further it marks as clean buffers that are processed for
- * writing (the buffer cache won't assume that they are actually clean
- * until the buffer gets unlocked).
- *
- * ll_rw_block sets b_end_io to simple completion handler that marks
- * the buffer up-to-date (if appropriate), unlocks the buffer and wakes
- * any waiters.=20
- *
- * All of the buffers must be for the same device, and must also be a
- * multiple of the current approved size for the device.
- */
-void ll_rw_block(const blk_opf_t opf, int nr, struct buffer_head *bhs[])
-{
-=09const enum req_op op =3D opf & REQ_OP_MASK;
-=09int i;
-
-=09for (i =3D 0; i < nr; i++) {
-=09=09struct buffer_head *bh =3D bhs[i];
-
-=09=09if (!trylock_buffer(bh))
-=09=09=09continue;
-=09=09if (op =3D=3D REQ_OP_WRITE) {
-=09=09=09if (test_clear_buffer_dirty(bh)) {
-=09=09=09=09bh->b_end_io =3D end_buffer_write_sync;
-=09=09=09=09get_bh(bh);
-=09=09=09=09submit_bh(opf, bh);
-=09=09=09=09continue;
-=09=09=09}
-=09=09} else {
-=09=09=09if (!buffer_uptodate(bh)) {
-=09=09=09=09bh->b_end_io =3D end_buffer_read_sync;
-=09=09=09=09get_bh(bh);
-=09=09=09=09submit_bh(opf, bh);
-=09=09=09=09continue;
-=09=09=09}
-=09=09}
-=09=09unlock_buffer(bh);
-=09}
-}
-EXPORT_SYMBOL(ll_rw_block);
-
 void write_dirty_buffer(struct buffer_head *bh, blk_opf_t op_flags)
 {
 =09lock_buffer(bh);
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index 6d09785bed9f..b415d8bc2a09 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -223,7 +223,6 @@ struct buffer_head *alloc_buffer_head(gfp_t gfp_flags);
 void free_buffer_head(struct buffer_head * bh);
 void unlock_buffer(struct buffer_head *bh);
 void __lock_buffer(struct buffer_head *bh);
-void ll_rw_block(blk_opf_t, int, struct buffer_head * bh[]);
 int sync_dirty_buffer(struct buffer_head *bh);
 int __sync_dirty_buffer(struct buffer_head *bh, blk_opf_t op_flags);
 void write_dirty_buffer(struct buffer_head *bh, blk_opf_t op_flags);
--=20
2.31.1

