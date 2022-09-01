From: Zhang Yi <yi.zhang@huawei.com>
Subject: [PATCH v2 06/14] jbd2: replace ll_rw_block()
Date: Thu, 1 Sep 2022 21:34:57 +0800
Message-ID: <20220901133505.2510834-7-yi.zhang@huawei.com>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cluster-devel-bounces@redhat.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662038702;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KhgbaL5crNi/E4nYaP+fn6HyaRGCZCiBaKofpPXOBpk=;
	b=LRuFUnbGS3aVxYcJ6xNcKLp5JUFhAzi0TywrQTqgbp/IuJbSH/NtD+kJC4W7/IJl+Hdqf0
	gyLO5fNHF8vPQFSQU2oji0KHNX2vi+YTRL+uUIxilLSFZ9a9EluaROsrUu0G2XuwBz70/c
	pTFTw/2NMcnUVF4a7PfdGbkQzPU4Pg8=
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
guarantee that submitting read IO if the buffer has been locked. We
could get false positive EIO after wait_on_buffer() if the buffer has
been locked by others. So stop using ll_rw_block() in
journal_get_superblock(). We also switch to new bh_readahead_batch()
for the buffer array readahead path.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/jbd2/journal.c  | 15 ++++++---------
 fs/jbd2/recovery.c | 16 ++++++++++------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/fs/jbd2/journal.c b/fs/jbd2/journal.c
index 6350d3857c89..140b070471c0 100644
--- a/fs/jbd2/journal.c
+++ b/fs/jbd2/journal.c
@@ -1893,19 +1893,16 @@ static int journal_get_superblock(journal_t *journa=
l)
 {
 =09struct buffer_head *bh;
 =09journal_superblock_t *sb;
-=09int err =3D -EIO;
+=09int err;
=20
 =09bh =3D journal->j_sb_buffer;
=20
 =09J_ASSERT(bh !=3D NULL);
-=09if (!buffer_uptodate(bh)) {
-=09=09ll_rw_block(REQ_OP_READ, 1, &bh);
-=09=09wait_on_buffer(bh);
-=09=09if (!buffer_uptodate(bh)) {
-=09=09=09printk(KERN_ERR
-=09=09=09=09"JBD2: IO error reading journal superblock\n");
-=09=09=09goto out;
-=09=09}
+=09err =3D bh_read(bh, 0);
+=09if (err < 0) {
+=09=09printk(KERN_ERR
+=09=09=09"JBD2: IO error reading journal superblock\n");
+=09=09goto out;
 =09}
=20
 =09if (buffer_verified(bh))
diff --git a/fs/jbd2/recovery.c b/fs/jbd2/recovery.c
index f548479615c6..1f878c315b03 100644
--- a/fs/jbd2/recovery.c
+++ b/fs/jbd2/recovery.c
@@ -100,7 +100,7 @@ static int do_readahead(journal_t *journal, unsigned in=
t start)
 =09=09if (!buffer_uptodate(bh) && !buffer_locked(bh)) {
 =09=09=09bufs[nbufs++] =3D bh;
 =09=09=09if (nbufs =3D=3D MAXBUF) {
-=09=09=09=09ll_rw_block(REQ_OP_READ, nbufs, bufs);
+=09=09=09=09bh_readahead_batch(nbufs, bufs, 0);
 =09=09=09=09journal_brelse_array(bufs, nbufs);
 =09=09=09=09nbufs =3D 0;
 =09=09=09}
@@ -109,7 +109,7 @@ static int do_readahead(journal_t *journal, unsigned in=
t start)
 =09}
=20
 =09if (nbufs)
-=09=09ll_rw_block(REQ_OP_READ, nbufs, bufs);
+=09=09bh_readahead_batch(nbufs, bufs, 0);
 =09err =3D 0;
=20
 failed:
@@ -152,9 +152,14 @@ static int jread(struct buffer_head **bhp, journal_t *=
journal,
 =09=09return -ENOMEM;
=20
 =09if (!buffer_uptodate(bh)) {
-=09=09/* If this is a brand new buffer, start readahead.
-                   Otherwise, we assume we are already reading it.  */
-=09=09if (!buffer_req(bh))
+=09=09/*
+=09=09 * If this is a brand new buffer, start readahead.
+=09=09 * Otherwise, we assume we are already reading it.
+=09=09 */
+=09=09bool need_readahead =3D !buffer_req(bh);
+
+=09=09bh_read_nowait(bh, 0);
+=09=09if (need_readahead)
 =09=09=09do_readahead(journal, offset);
 =09=09wait_on_buffer(bh);
 =09}
@@ -687,7 +692,6 @@ static int do_one_pass(journal_t *journal,
 =09=09=09=09=09mark_buffer_dirty(nbh);
 =09=09=09=09=09BUFFER_TRACE(nbh, "marking uptodate");
 =09=09=09=09=09++info->nr_replays;
-=09=09=09=09=09/* ll_rw_block(WRITE, 1, &nbh); */
 =09=09=09=09=09unlock_buffer(nbh);
 =09=09=09=09=09brelse(obh);
 =09=09=09=09=09brelse(nbh);
--=20
2.31.1

