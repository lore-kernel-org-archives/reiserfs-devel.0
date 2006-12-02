From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH 8/10] Reiser4: inode.i_blksize suppression
Date: Sat,  2 Dec 2006 14:16:29 +0100
Message-ID: <11650653923903-git-send-email-laurent.riffard@free.fr>
References: <1165065391908-git-send-email-laurent.riffard@free.fr> <1165065391122-git-send-email-laurent.riffard@free.fr> <1165065391534-git-send-email-laurent.riffard@free.fr> <11650653912299-git-send-email-laurent.riffard@free.fr> <11650653921903-git-send-email-laurent.riffard@free.fr> <11650653921405-git-send-email-laurent.riffard@free.fr> <11650653923297-git-send-email-laurent.riffard@free.fr> <11650653921199-git-send-email-laurent.riffard@free.fr>
Return-path: <reiserfs-list-return-30275-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <11650653921199-git-send-email-laurent.riffard@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: Laurent Riffard <laurent.riffard@free.fr>

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
-- 
1.4.4.1.gaed4

