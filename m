From: rwhron@earthlink.net
Subject: Re: oops from 2.5.42-mm3 running lilo on reiserfs
Date: Wed, 16 Oct 2002 00:34:49 -0400
Message-ID: <20021016043449.GA11922@rushmore>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11710-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@digeo.com
Cc: mason@suse.com, reiserfs-list@namesys.com

Andrew Morton wrote:
> Bah, stupid reiserfs list bounces non-subscribers.

:) that's why i'm on the list.

> Could you please let me know if this patch fixed it?

Yes, your patch below fixes it.


 fs/reiserfs/ioctl.c |    1 -
 1 files changed, 1 deletion(-)

--- 2.5.42/fs/reiserfs/ioctl.c~reiserfs-kmap-fix        Tue Oct 15 20:15:01 2002
+++ 2.5.42-akpm/fs/reiserfs/ioctl.c     Tue Oct 15 20:15:39 2002
@@ -80,7 +80,6 @@ int reiserfs_unpack (struct inode * inod
     /* conversion can change page contents, must flush */
     flush_dcache_page(page) ;
     REISERFS_I(inode)->i_flags |= i_nopack_mask;
-    kunmap(page) ; /* mapped by prepare_write */

 out_unlock:
     unlock_page(page) ;

-- 
Randy Hron
http://home.earthlink.net/~rwhron/kernel/bigbox.html

