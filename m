From: Himangi Saraogi <himangi774@gmail.com>
Subject: [PATCH] fs/reiserfs/super.c : Drop memory allocation cast
Date: Tue, 10 Jun 2014 20:08:05 +0530
Message-ID: <20140610143805.GA3091@himangi-Dell>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=HKKk3M68VXxmtllP4crRUoeEQ66iAkWPu/qwC4Bx+qY=;
        b=BkzVt02LvlvnIRCAEJ/4iHhtulvlqEiQDG30jPTidsWRXJkdxalI1IUSOwmh2nuCJE
         LdNQanXyye3ri3zUdJy3fjWGgMNVcAaD0VqoMWQ23wGIvSGSseXom5SFLjk8oEUhAxHo
         LkLnJ/JOIVoNnkdTrqJKEDW11g+inYS6lWI6PsGNsWnWJ25kT/uCUQEWQEHT3HDedMwL
         hIETZR0yJnAhPairmg6YBMVwjfukyqJLpbbHR1c5tvedufZyN3tQ4fyN2lIryVXXafRU
         uiGSOkQEVUCp6K7rxwiBrGPoj77xOdXRee/UXWVFtum4ke7rwR47FW9L94HxjOZQwmAg
         /ViQ==
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Jeff Mahoney <jeffm@suse.com>
Cc: julia.lawall@lip6.fr

Drop cast on the result of kmem_cache_alloc.

The Coccinelle semantic patch that makes this change is as follows:

// <smpl>
@@
type T;
@@

- (T *)
  (\(kmalloc\|kzalloc\|kcalloc\|kmem_cache_alloc\|kmem_cache_zalloc\|
   kmem_cache_alloc_node\|kmalloc_node\|kzalloc_node\)(...))
// </smpl>

Signed-off-by: Himangi Saraogi <himangi774@gmail.com>
Acked-by: Julia Lawall <julia.lawall@lip6.fr>
---
 fs/reiserfs/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 9fb2042..3902028 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -568,8 +568,7 @@ static struct kmem_cache *reiserfs_inode_cachep;
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
1.9.1

