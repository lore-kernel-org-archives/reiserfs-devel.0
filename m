From: Fabian Frederick <fabf@skynet.be>
Subject: [PATCH 1/1] fs/reiserfs/super.c: add __init to init_inodecache
Date: Fri, 21 Mar 2014 17:16:26 +0100
Message-ID: <20140321171626.d835c81af6c795cb3ae2fb6a@skynet.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: reiserfs-devel@vger.kernel.org, akpm <akpm@linux-foundation.org>

init_inodecache is only called by __init init_reiserfs_fs.

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/reiserfs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 2c80335..7035087 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -597,7 +597,7 @@ static void init_once(void *foo)
 	inode_init_once(&ei->vfs_inode);
 }
 
-static int init_inodecache(void)
+static int __init init_inodecache(void)
 {
 	reiserfs_inode_cachep = kmem_cache_create("reiser_inode_cache",
 						  sizeof(struct
-- 
1.8.4.5

