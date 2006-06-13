From: Eric Sesterhenn <snakebyte@gmx.de>
Subject: [Patch] Remove unneeded check for xadir in fs/reiserfs/xattr.c
Date: Tue, 13 Jun 2006 23:54:01 +0200
Message-ID: <1150235641.6537.2.camel@alice>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28777-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

hi,

coverity complained that xadir is checked for !=NULL
and then passed to lookup_one_len() where it might get dereferenced.
This patch removes the check since open_xa_dir() returns an ERR_PTR() or
a valid dentry pointer. Coverity id #1194

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.17-rc5/fs/reiserfs/xattr.c.orig	2006-06-13 23:50:10.000000000 +0200
+++ linux-2.6.17-rc5/fs/reiserfs/xattr.c	2006-06-13 23:50:45.000000000 +0200
@@ -200,7 +200,7 @@ static struct dentry *get_xa_file_dentry
 	xadir = open_xa_dir(inode, flags);
 	if (IS_ERR(xadir)) {
 		return ERR_PTR(PTR_ERR(xadir));
-	} else if (xadir && !xadir->d_inode) {
+	} else if (!xadir->d_inode) {
 		dput(xadir);
 		return ERR_PTR(-ENODATA);
 	}


