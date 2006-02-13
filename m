From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: fix potential (unlikely) oops in reiserfs_get_acl
Date: Mon, 13 Feb 2006 11:12:36 -0500
Message-ID: <20060213161234.GA8931@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750809AbWBMQMi@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: ReiserFS List <reiserfs-list@namesys.com>

 This patch fixes a potential oops if there is an error reported by
 posix_acl_from_disk(). This is mostly theoretical due to the use of 
 magics and checksums in xattrs, but is still possible.

 fs/reiserfs/xattr_acl.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletion(-)

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/xattr_acl.c linux-2.6.15-staging2/fs/reiserfs/xattr_acl.c
--- linux-2.6.15-staging1/fs/reiserfs/xattr_acl.c	2006-02-10 16:27:18.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/xattr_acl.c	2006-02-10 16:40:56.000000000 -0500
@@ -228,7 +228,8 @@ struct posix_acl *reiserfs_get_acl(struc
 		acl = ERR_PTR(retval);
 	} else {
 		acl = posix_acl_from_disk(value, retval);
-		*p_acl = posix_acl_dup(acl);
+		if (!IS_ERR(acl))
+			*p_acl = posix_acl_dup(acl);
 	}
 
 	kfree(value);
-- 
Jeff Mahoney
SuSE Labs
