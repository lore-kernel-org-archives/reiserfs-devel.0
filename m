From: Alex Zarochentsev <zam@namesys.com>
Subject: [PATCH] use S_ISDIR() in link_path_walk() to decide whether the last path component is a directory
Date: Mon, 13 Sep 2004 11:49:22 +0400
Message-ID: <20040913074921.GA2252@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21708-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>, viro@parcelfarce.linux.theplanet.co.uk
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hi,

This patch does not allow open(name, O_DIRECTORY) to be successful for
non-directories in reiser4.  It replaces ->i_op->lookup != NULL "is dir" check
for the last path component by explicit S_ISDIR(->i_mode) check. 

Regardless to reiser4, S_ISDIR() looks more clear there.

Thanks in advance.

===== fs/namei.c 1.104 vs edited =====
--- 1.104/fs/namei.c	Tue Aug 10 16:59:38 2004
+++ edited/fs/namei.c	Sun Sep 12 11:00:18 2004
@@ -816,7 +816,7 @@
 			break;
 		if (lookup_flags & LOOKUP_DIRECTORY) {
 			err = -ENOTDIR; 
-			if (!inode->i_op || !inode->i_op->lookup)
+			if (!S_ISDIR(inode->i_mode))
 				break;
 		}
 		goto return_base;
