From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: assertion failed: can_hit_entd(ctx, s)
Date: Fri, 25 Aug 2006 22:42:36 +0400
Message-ID: <200608252242.36985.zam@namesys.com>
References: <200608211759.04151.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608211841.12071.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29692-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608211841.12071.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com, Andrew James Wade <andrew.j.wade@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

On 22 August 2006 02:41, Andrew James Wade wrote:

btw, is <ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> 
your mail address (it is from Reply-To:) ?

> This is the most common panic I've been getting. It looks like this:
> (2.6.18-rc4-mm1)
>
> reiser4 panicked cowardly: reiser4[scatteredwrites(4506)]:
> reiser4_writepage (fs/reiser4/page_cache.c:522)[]: assertion failed:
> can_hit_entd(ctx, s)
> Kernel panic - not syncing: reiser4[scatteredwrites(4506)]:
> reiser4_writepage (fs/reiser4/page_cache.c:522)[]: assertion failed:
> can_hit_entd(ctx, s)
>
> With the extra patches it looks like this:
> (2.6.18-rc4-mm2)
>
> reiser4 panicked cowardly: reiser4[grep(4918)]: can_hit_entd
> (fs/reiser4/page_cache.c:494)[ajw-3]: assertion failed:
> ctx->trans->atom == NULL

can you please try the following patch:

---
 fs/reiser4/super_ops.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6-git/fs/reiser4/super_ops.c
===================================================================
--- linux-2.6-git.orig/fs/reiser4/super_ops.c
+++ linux-2.6-git/fs/reiser4/super_ops.c
@@ -92,7 +92,7 @@ static struct inode *reiser4_alloc_inode
 	reiser4_inode_object *obj;
 
 	assert("nikita-1696", super != NULL);
-	obj = kmem_cache_alloc(inode_cache, SLAB_KERNEL);
+	obj = kmem_cache_alloc(inode_cache, reiser4_ctx_gfp_mask_get());
 	if (obj != NULL) {
 		reiser4_inode *info;
 

