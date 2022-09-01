From: Zhang Yi <yi.zhang@huawei.com>
Subject: [PATCH v2 05/14] isofs: replace ll_rw_block()
Date: Thu, 1 Sep 2022 21:34:56 +0800
Message-ID: <20220901133505.2510834-6-yi.zhang@huawei.com>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cluster-devel-bounces@redhat.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662038677;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6b52LrbeOpVUxp042jrr0ZMV8eVNLfD7Uy5GIKcLctQ=;
	b=R+XRypo8gCps3Nhx8Mfyrf9iCV1tdT+/F58x8Sa2y1/YgK4t0H6Vb4oWL2QyqV5lRcKPPp
	2OFD58hhqsai0OE0wBmiqCRF5/pihvkklfRibQQ4UAx54W54G2FGlxZy8FvBCHzshDN99e
	FVJYcrEpXMUjjuj3yB+/v0TmYHeD8eo=
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
could get false positive EIO return from zisofs_uncompress_block() if
he buffer has been locked by others. So stop using ll_rw_block(),
switch to sync helper instead.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 fs/isofs/compress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/isofs/compress.c b/fs/isofs/compress.c
index b466172eec25..59b03d74ecbe 100644
--- a/fs/isofs/compress.c
+++ b/fs/isofs/compress.c
@@ -82,7 +82,7 @@ static loff_t zisofs_uncompress_block(struct inode *inode=
, loff_t block_start,
 =09=09return 0;
 =09}
 =09haveblocks =3D isofs_get_blocks(inode, blocknum, bhs, needblocks);
-=09ll_rw_block(REQ_OP_READ, haveblocks, bhs);
+=09bh_read_batch(haveblocks, bhs);
=20
 =09curbh =3D 0;
 =09curpage =3D 0;
--=20
2.31.1

