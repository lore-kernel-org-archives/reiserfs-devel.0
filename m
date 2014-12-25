From: Fabian Frederick <fabf@skynet.be>
Subject: [PATCH 1/1 linux-next] fs/reiserfs/inode.c: replace 0 by NULL for pointers
Date: Thu, 25 Dec 2014 10:43:15 +0100
Message-ID: <1419500596-12760-1-git-send-email-fabf@skynet.be>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Fabian Frederick <fabf@skynet.be>, reiserfs-devel@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>, Andrew Morton <akpm@linux-foundation.org>

Fix sparse warning:
fs/reiserfs/inode.c:2769:19: warning: Using plain integer as NULL pointer

Cc: reiserfs-devel@vger.kernel.org
Cc: Jeff Mahoney <jeffm@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/reiserfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index a7eec98..e72401e 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -2766,7 +2766,7 @@ static int reiserfs_write_begin(struct file *file,
 	int old_ref = 0;
 
  	inode = mapping->host;
-	*fsdata = 0;
+	*fsdata = NULL;
  	if (flags & AOP_FLAG_CONT_EXPAND &&
  	    (pos & (inode->i_sb->s_blocksize - 1)) == 0) {
  		pos ++;
-- 
1.9.1

