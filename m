From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH 8/10] Reiser4: inode.i_blksize suppression
Date: Sun, 03 Dec 2006 14:51:19 +0100
Message-ID: <4572D657.1020409@free.fr>
References: <4571D852.3080401@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30288-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4571D852.3080401@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

This patch updates the reiser4 code to reflect the suppression of the
inode.i_blksize field (see commit
ba52de123d454b57369f291348266d86f4b35070).
---
fs/reiser4/plugin/item/static_stat.c |    2 --
1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/fs/reiser4/plugin/item/static_stat.c b/fs/reiser4/plugin/item/static_stat.c
index 0ef01e6..f53a5aa 100644
--- a/fs/reiser4/plugin/item/static_stat.c
+++ b/fs/reiser4/plugin/item/static_stat.c
@@ -168,8 +168,6 @@ int init_inode_static_sd(struct inode *inode /* object being processed */ ,
			break;
	}
	state->extmask = bigmask;
-	/* common initialisations */
-	inode->i_blksize = get_super_private(inode->i_sb)->optimal_io_size;
	if (len - (bit / 16 * sizeof(d16)) > 0) {
		/* alignment in save_len_static_sd() is taken into account
		   -edward */
-- 1.4.4.1.gaed4 


