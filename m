From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: EACCESS vs ENOENT for nonexistent files-within-files
Date: Mon, 13 Sep 2004 20:13:26 +0400
Message-ID: <20040913161326.GB2252@backtop.namesys.com>
References: <20040913140637.GB29591@redhat.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21719-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040913140637.GB29591@redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Orton <jorton@redhat.com>
Cc: reiserfs-list@namesys.com

On Mon, Sep 13, 2004 at 03:06:37PM +0100, Joe Orton wrote:
> Hi, we had a bug report that Apache httpd logs a spurious error for
> every file served from a reiser4 filesystem, because httpd assumes that
> /path/to/file/.htaccess (where /path/to/file is a normal file) returns
> ENOENT or ENOTDIR, but reiser4 returns EACCES in this case.
> 
> Can someone explain the justification behind reiser4's behaviour? 
> httpd's assumption does not seem unreasonable, and EACCES seems to make
> little sense for this error case.

It is because open(name, O_DIRECTORY) is successful for regular files in
reiser4.  Once it succedes, Apache2 thinks that is a directory and tries to
open .htaccess under it.  It does not matter what error code is receives there,
the problem is that apache2 has decided that the file is a directory.

There are two solutions:

1) mount reiser4 partition with "nopseudo" mount option.  it makes /metas/* files
unaccessible.

2) apply the patch:

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
===============================

> Regards,
> 
> joe

-- 
Alex.
