From: Andrew Morton <akpm@osdl.org>
Subject: Re: [PATCH] Fix reiserfs deadlock
Date: Fri, 21 Apr 2006 15:19:22 -0700
Message-ID: <20060421151922.7a4f9986.akpm@osdl.org>
References: <20060421170030.GB8151@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28521-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060421170030.GB8151@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: reiserfs-list@namesys.com

Jan Kara <jack@suse.cz> wrote:
>
> reiserfs_cache_default_acl() should return whether we successfully found the
> acl or not. We have to return correct value even if reiserfs_get_acl() returns
> error code and not just 0. Otherwise callers such as reiserfs_mkdir() can
> unnecessarily lock the xattrs and later functions such as reiserfs_new_inode()
> fail to notice that we have already taken the lock and try to take it again
> with obvious consequences.
> 
> Signed-off-by: Jan Kara <jack@suse.cz>
> 
> diff -rupX /home/jack/.kerndiffexclude linux-2.6.5-SLES9_SP3_BRANCH/fs/reiserfs/xattr_acl.c linux-2.6.5-SLES9_SP3_BRANCH-1-reiser_xattr_fix/fs/reiserfs/xattr_acl.c
> --- linux-2.6.5-SLES9_SP3_BRANCH/fs/reiserfs/xattr_acl.c	2006-01-21 03:02:06.000000000 +0100
> +++ linux-2.6.5-SLES9_SP3_BRANCH-1-reiser_xattr_fix/fs/reiserfs/xattr_acl.c	2006-01-21 09:09:04.000000000 +0100
> @@ -410,8 +410,10 @@ reiserfs_cache_default_acl (struct inode
>          acl = reiserfs_get_acl (inode, ACL_TYPE_DEFAULT);
>          reiserfs_read_unlock_xattrs (inode->i_sb);
>          reiserfs_read_unlock_xattr_i (inode);
> -        ret = acl ? 1 : 0;
> +	if (!acl || IS_ERR(acl))
> +		return 0;
>          posix_acl_release (acl);
> +	ret = 1;
>      }
>  
>      return ret;

Your email client did something ghastly to this patch.  Please fix it.

I typed it in again.  While I was there I structured it a bit more nicely.

--- 25/fs/reiserfs/xattr_acl.c~fix-reiserfs-deadlock	Fri Apr 21 15:15:10 2006
+++ 25-akpm/fs/reiserfs/xattr_acl.c	Fri Apr 21 15:17:40 2006
@@ -408,8 +408,9 @@ int reiserfs_cache_default_acl(struct in
 		acl = reiserfs_get_acl(inode, ACL_TYPE_DEFAULT);
 		reiserfs_read_unlock_xattrs(inode->i_sb);
 		reiserfs_read_unlock_xattr_i(inode);
-		ret = acl ? 1 : 0;
-		posix_acl_release(acl);
+		ret = (acl && !IS_ERR(acl));
+		if (ret)
+			posix_acl_release(acl);
 	}
 
 	return ret;
_

