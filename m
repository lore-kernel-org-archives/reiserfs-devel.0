From: Vladimir Saveliev <vs@namesys.com>
Subject: reiserfs bug fix: add missing pair of lock_kernel()/unlock_kernel()
Date: Thu, 23 Dec 2004 18:35:36 +0300
Message-ID: <1103816136.8064.136.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-/5hXGKpWNF1ZZrGIOTaJ"
Return-path: <reiserfs-list-return-22894-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@osdl.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com

--=-/5hXGKpWNF1ZZrGIOTaJ
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

Andrew, please apply this reiserfs bug fix.

--=-/5hXGKpWNF1ZZrGIOTaJ
Content-Disposition: attachment; filename=reiserfs-add-missing-lock_kernel.patch
Content-Type: text/plain; name=reiserfs-add-missing-lock_kernel.patch; charset=koi8-r
Content-Transfer-Encoding: 7bit


This patch adds missing lock_kernel()/unlock_kernel() pair in reiserfs_get_dentry


 fs/reiserfs/inode.c |    2 ++
 1 files changed, 2 insertions(+)

diff -puN fs/reiserfs/inode.c~reiserfs-add-missing-lock_kernel fs/reiserfs/inode.c
--- linux-2.6.10-rc3-mm1/fs/reiserfs/inode.c~reiserfs-add-missing-lock_kernel	2004-12-23 18:23:53.557228800 +0300
+++ linux-2.6.10-rc3-mm1-vs/fs/reiserfs/inode.c	2004-12-23 18:23:53.583230368 +0300
@@ -1447,12 +1447,14 @@ struct dentry *reiserfs_get_dentry(struc
     
     key.on_disk_key.k_objectid = data[0] ;
     key.on_disk_key.k_dir_id = data[1] ;
+    reiserfs_write_lock(sb);
     inode = reiserfs_iget(sb, &key) ;
     if (inode && !IS_ERR(inode) && data[2] != 0 &&
 	data[2] != inode->i_generation) {
 	    iput(inode) ;
 	    inode = NULL ;
     }
+    reiserfs_write_unlock(sb);
     if (!inode)
 	    inode = ERR_PTR(-ESTALE);
     if (IS_ERR(inode))

_

--=-/5hXGKpWNF1ZZrGIOTaJ--

