From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] reiserfs: Delete an unnecessary check before brelse()
Date: Tue, 3 Sep 2019 20:42:11 +0200
Message-ID: <b3b79aaf-279b-4f5a-b9ee-3a38b74da98e@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1567536134;
        bh=3IcwgWfePYuRvZdhAhTPFnsEeC4pHahDVAulfsv8+/s=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=WcjriP/9xdtN+GN4rVegSIynHSBCV0p8sPR6eapV3Mlv6QC95g2fyjFtQEfYyFFWz
         SnQxwVZqqVQui/8sW3f+ZLQjdl8SqNtheyyleZwLxyihFsddVKXAVxhxkRmwyMJEQ3
         XNs3hvKmR8QSanJYIaXjGjI03HwwC3uER8IXFSI0=
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, "Darrick J. Wong" <darrick.wong@oracle.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Jeff Layton <jlayton@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 3 Sep 2019 20:00:16 +0200

The brelse() function tests whether its argument is NULL
and then returns immediately.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 fs/reiserfs/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index d69b4ac0ae2f..b412ef9a24a6 100644
=2D-- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -2229,8 +2229,7 @@ static int reiserfs_fill_super(struct super_block *s=
, void *data, int silent)
 	reiserfs_cancel_old_flush(s);

 	reiserfs_free_bitmap_cache(s);
-	if (SB_BUFFER_WITH_SB(s))
-		brelse(SB_BUFFER_WITH_SB(s));
+	brelse(SB_BUFFER_WITH_SB(s));
 #ifdef CONFIG_QUOTA
 	{
 		int j;
=2D-
2.23.0

