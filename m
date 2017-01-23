From: Fabian Frederick <fabf@skynet.be>
Subject: [PATCH 1/1 linux-next] fs/reiserfs: atomically read inode size
Date: Mon, 23 Jan 2017 18:47:01 +0100
Message-ID: <20170123174701.30394-1-fabf@skynet.be>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, fabf@skynet.be

See i_size_read() comments in include/linux/fs.h

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/reiserfs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index e314cb3..feabcde 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1166,7 +1166,7 @@ static int reiserfs_parse_options(struct super_block *s,
 			if (!strcmp(arg, "auto")) {
 				/* From JFS code, to auto-get the size. */
 				*blocks =
-				    s->s_bdev->bd_inode->i_size >> s->
+				    i_size_read(s->s_bdev->bd_inode) >> s->
 				    s_blocksize_bits;
 			} else {
 				*blocks = simple_strtoul(arg, &p, 0);
-- 
2.9.3

