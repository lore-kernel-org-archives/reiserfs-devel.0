From: Jesper Juhl <juhl-lkml@dif.dk>
Subject: Re: [PATCH] reiserfs: fix a few  'empty body in an if-statement' 
 warnings.
Date: Fri, 15 Apr 2005 11:44:51 +0200 (CEST)
Message-ID: <Pine.LNX.4.62.0504151143370.2475@dragon.hyggekrogen.localhost>
References: <Pine.LNX.4.62.0504150255090.3466@dragon.hyggekrogen.localhost>
 <20050414184913.72831860.rddunlap@osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23882-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050414184913.72831860.rddunlap@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Randy.Dunlap" <rddunlap@osdl.org>
Cc: reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On Thu, 14 Apr 2005, Randy.Dunlap wrote:

> On Fri, 15 Apr 2005 02:58:54 +0200 (CEST) Jesper Juhl wrote:
> 
> | When building with  gcc -W  fs/reiserfs/namei.c:602 has a few warnings 
> | about 'empty body in an if-statement'. This patch silences those warnings.
> 
> So fix include/linux/reiserfs_xattr.h:
> change
> #define reiserfs_mark_inode_private(inode)
> to
> #define reiserfs_mark_inode_private(inode)	do { } while (0)
> 
> 
Right, that's better...

Signed-off-by: Jesper Juhl <juhl-lkml@dif.dk>

--- linux-2.6.12-rc2-mm3-orig/include/linux/reiserfs_xattr.h	2005-04-05 21:21:50.000000000 +0200
+++ linux-2.6.12-rc2-mm3/include/linux/reiserfs_xattr.h	2005-04-15 11:41:25.000000000 +0200
@@ -112,20 +112,20 @@
 #else
 
 #define is_reiserfs_priv_object(inode) 0
-#define reiserfs_mark_inode_private(inode)
+#define reiserfs_mark_inode_private(inode) do { } while (0)
 #define reiserfs_getxattr NULL
 #define reiserfs_setxattr NULL
 #define reiserfs_listxattr NULL
 #define reiserfs_removexattr NULL
-#define reiserfs_write_lock_xattrs(sb)
-#define reiserfs_write_unlock_xattrs(sb)
-#define reiserfs_read_lock_xattrs(sb)
-#define reiserfs_read_unlock_xattrs(sb)
+#define reiserfs_write_lock_xattrs(sb) do { } while (0)
+#define reiserfs_write_unlock_xattrs(sb) do { } while (0)
+#define reiserfs_read_lock_xattrs(sb) do { } while (0)
+#define reiserfs_read_unlock_xattrs(sb) do { } while (0)
 
 #define reiserfs_permission NULL
 
 #define reiserfs_xattr_register_handlers() 0
-#define reiserfs_xattr_unregister_handlers()
+#define reiserfs_xattr_unregister_handlers() do { } while (0)
 
 static inline int reiserfs_delete_xattrs (struct inode *inode) { return 0; };
 static inline int reiserfs_chown_xattrs (struct inode *inode, struct iattr *attrs) { return 0; };


