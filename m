From: Oleg Drokin <green@namesys.com>
Subject: Re: Reiserfs broken in 2.5.50 (possibly nanosecond stat timefields?)
Date: Sat, 30 Nov 2002 20:06:14 +0300
Message-ID: <20021130200614.A7766@namesys.com>
References: <20021130.114825.78703224.hoho@tacomeat.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12075-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021130.114825.78703224.hoho@tacomeat.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Slater <hoho@tacomeat.net>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Nov 30, 2002 at 11:48:25AM -0500, Colin Slater wrote:
 
> ld.so? My systems is completely reiserfs (3.6), and nothing has
> changed in my config file between 2.5.47 and 2.5.50. Upon looking
> through the source tree, it seems like lines 1134-7 in
> fs/reiserfs/namei.c seem to be throwing this panic. Only changesets to
> touch namei.c in the past 4 months are "nanosecond stat timefields" and
> "*_mknod prototype". I really can't see why these would cause this
> problem, so maybe someone else does. Hand-copied output from the
> BUG() follows, so this is only what I thought was important and might
> contain errors. If you need any other information I will gladly supply
> it.

Just to make sure, does this patch helps?

===== fs/namei.c 1.59 vs 1.60 =====
--- 1.59/fs/namei.c	Thu Nov 28 02:11:14 2002
+++ 1.60/fs/namei.c	Fri Nov 29 12:05:33 2002
@@ -1648,7 +1648,7 @@
 		error = -EBUSY;
 	else {
 		error = security_inode_unlink(dir, dentry);
-		if (error)
+		if (!error)
 			error = dir->i_op->unlink(dir, dentry);
 	}
 	up(&dentry->d_inode->i_sem);
