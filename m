From: Zhang Yi <yi.zhang@huawei.com>
Subject: [PATCH v2 04/14] gfs2: replace ll_rw_block()
Date: Thu, 1 Sep 2022 21:34:55 +0800
Message-ID: <20220901133505.2510834-5-yi.zhang@huawei.com>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cluster-devel-bounces@redhat.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662038670;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UiCRaL9PjWXEN3AqEUb2tu2GKRx16EGxbqfRcjlA6t4=;
	b=M/zYIaspYiLXbwPusb1zPL0vrUvS/U/9lIULR8pjXlng3eGJh67+YxN5gfAeP/ZiKm0hXW
	gbcJe5HbykZ1uaJNOlT7XPgHoUutuqi6+6I+Mv9J8N50MTa0WrSFWzqJn5TZE1jR4ScV6n
	AsAeckTlkvRqnKr/vF9L/maQoBJqyEk=
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

ll_rw_block() is not safe for the sync read path because it cannot
guarantee that always submitting read IO if the buffer has been locked,
so stop using it. We also switch to new bh_readahead() helper for the
readahead path.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/gfs2/meta_io.c | 7 ++-----
 fs/gfs2/quota.c   | 8 ++------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 7e70e0ba5a6c..6ed728aae9a5 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -525,8 +525,7 @@ struct buffer_head *gfs2_meta_ra(struct gfs2_glock *gl,=
 u64 dblock, u32 extlen)
=20
 =09if (buffer_uptodate(first_bh))
 =09=09goto out;
-=09if (!buffer_locked(first_bh))
-=09=09ll_rw_block(REQ_OP_READ | REQ_META | REQ_PRIO, 1, &first_bh);
+=09bh_read_nowait(first_bh, REQ_META | REQ_PRIO);
=20
 =09dblock++;
 =09extlen--;
@@ -534,9 +533,7 @@ struct buffer_head *gfs2_meta_ra(struct gfs2_glock *gl,=
 u64 dblock, u32 extlen)
 =09while (extlen) {
 =09=09bh =3D gfs2_getbuf(gl, dblock, CREATE);
=20
-=09=09if (!buffer_uptodate(bh) && !buffer_locked(bh))
-=09=09=09ll_rw_block(REQ_OP_READ | REQ_RAHEAD | REQ_META |
-=09=09=09=09    REQ_PRIO, 1, &bh);
+=09=09bh_readahead(bh, REQ_RAHEAD | REQ_META | REQ_PRIO);
 =09=09brelse(bh);
 =09=09dblock++;
 =09=09extlen--;
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index f201eaf59d0d..1ed17226d9ed 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -745,12 +745,8 @@ static int gfs2_write_buf_to_page(struct gfs2_inode *i=
p, unsigned long index,
 =09=09}
 =09=09if (PageUptodate(page))
 =09=09=09set_buffer_uptodate(bh);
-=09=09if (!buffer_uptodate(bh)) {
-=09=09=09ll_rw_block(REQ_OP_READ | REQ_META | REQ_PRIO, 1, &bh);
-=09=09=09wait_on_buffer(bh);
-=09=09=09if (!buffer_uptodate(bh))
-=09=09=09=09goto unlock_out;
-=09=09}
+=09=09if (bh_read(bh, REQ_META | REQ_PRIO) < 0)
+=09=09=09goto unlock_out;
 =09=09if (gfs2_is_jdata(ip))
 =09=09=09gfs2_trans_add_data(ip->i_gl, bh);
 =09=09else
--=20
2.31.1

