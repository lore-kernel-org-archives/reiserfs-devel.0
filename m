From: Firo Yang <firogm@gmail.com>
Subject: [PATCH] reiserfs: Avoid pointless casts in alloc codes.
Date: Thu, 23 Apr 2015 17:01:09 +0800
Message-ID: <1429779669-5334-1-git-send-email-firogm@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=/QosSWGcM5xY8CMv+yJ/TEl+NkhwL+wzqGa+TIXhQ58=;
        b=Ybku0qsVX3wsbqdeUGoq2VDX2Vl/LMC5It5VfHZW8AS6bgUWjJKqBBCxoUQl3XJ+yP
         1k6xLuRUouMSo66wDKqPfZfqDqiN/yOE6vs9gwKQz5e9l+J+2Q3qw0bh73oZ56ObbLRw
         vFUhVtEyHWYqqz/Cs9JM5ZSSBG1qmY4kAL9UwIQzUxeW+jS4LjfiQDj/TJ/l8FWk/jFo
         dRvAb8Hb0C4bQa2ahjd3XEYvbRwF7ZJiFrRFzqXIYQhD+k15fmn5HImbDjw7XqvIRrhv
         651X408YB3VxZoABEHC8gVOR1W0TxRkHK8lNebJm9GacTT8dZOaHCoUrCDboz1UA90n0
         6mYg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org
Cc: reiserfs-devel@vger.kernel.org, Firo Yang <firogm@gmail.com>

Get rid of pointless cast of kmem_cache_alloc() return value in
fs/reiserfs/super.c::reiserfs_alloc_inode().

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 fs/reiserfs/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 68b5f18..36177d5 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -588,8 +588,7 @@ static struct kmem_cache *reiserfs_inode_cachep;
 static struct inode *reiserfs_alloc_inode(struct super_block *sb)
 {
 	struct reiserfs_inode_info *ei;
-	ei = (struct reiserfs_inode_info *)
-	    kmem_cache_alloc(reiserfs_inode_cachep, GFP_KERNEL);
+	ei = kmem_cache_alloc(reiserfs_inode_cachep, GFP_KERNEL);
 	if (!ei)
 		return NULL;
 	atomic_set(&ei->openers, 0);
-- 
2.1.0

