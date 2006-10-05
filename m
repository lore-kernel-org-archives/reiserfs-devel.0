From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: Dereference in fs/reiserfs/bitmap.c
Date: Thu, 5 Oct 2006 16:19:12 +0400
Message-ID: <200610051619.13520.zam@namesys.com>
References: <1160045402.6153.6.camel@alice>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30001-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1160045402.6153.6.camel@alice>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Eric Sesterhenn <snakebyte@gmx.de>

On 5 October 2006 14:50, Eric Sesterhenn wrote:
> hi,
>
> coverity spotted another dereference in the reiser code,
> which i am able to verify, but not sure how to fix:
>
>
> 1305 		bh = sb_bread(sb, block);
> 1306 		if (bh == NULL)
> 1307 			reiserfs_warning(sb, "sh-2029: %s: bitmap block (#%lu) "
> 1308 			                 "reading failed", __FUNCTION__,
> bh->b_blocknr);

Thanks Eric

> if bh is NULL, we dereference it in the warning as bh->b_blocknr.
> Maybe one of you guys knows what warning is useful to print in this
> case and can cook up a patch for this.

From: Eric Eric Sesterhenn <snakebyte@gmx.de>

null pointer dereferencing in reiserfs_read_bitmap_block.

Signed-off-by: Alexander Zarochentsev <zam@namesys.com>

---
 fs/reiserfs/bitmap.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux.orig/fs/reiserfs/bitmap.c
+++ linux/fs/reiserfs/bitmap.c
@@ -1304,8 +1304,8 @@ struct buffer_head *reiserfs_read_bitmap
 
 	bh = sb_bread(sb, block);
 	if (bh == NULL)
-		reiserfs_warning(sb, "sh-2029: %s: bitmap block (#%lu) "
-		                 "reading failed", __FUNCTION__, bh->b_blocknr);
+		reiserfs_warning(sb, "sh-2029: %s: bitmap block (#%u) "
+		                 "reading failed", __FUNCTION__, block);
 	else {
 		if (buffer_locked(bh)) {
 			PROC_INFO_INC(sb, scan_bitmap.wait);


-- 
Alex.
