From: Jan Kara <jack@suse.cz>
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: reiserfs: xattr: Fix null
 pointer derefernce in open_xa_root()
Date: Thu, 1 Oct 2020 11:28:41 +0200
Message-ID: <20201001092841.GC17860@quack2.suse.cz>
References: <20201001090547.431840-1-anmol.karan123@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20201001090547.431840-1-anmol.karan123@gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anmol Karn <anmol.karan123@gmail.com>
Cc: jack@suse.cz, jeffm@suse.com, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, syzkaller-bugs@googlegroups.com, syzbot+9b33c9b118d77ff59b6f@syzkaller.appspotmail.com

On Thu 01-10-20 14:35:47, Anmol Karn wrote:
> d_really_is_negative() checks for the dentry->d_inode whether it's NULL
> or not, but in open_xa_root(), when it checks 'privroot->d_inode', it
> doesn't check whether privroot is NULL or not, this leads to a null
> pointer dereference while calling it from open_xa_dir() while
> initializing xaroot.
> 
> - fs/reiserfs/xattr.c
> The bug seems to get triggered at this line:
> 	
> if (d_really_is_negative(privroot))
> 		return ERR_PTR(-EOPNOTSUPP);
> 
> Fix it by adding a NULL check for privroot. 
> 
> Reported-and-tested-by: syzbot+9b33c9b118d77ff59b6f@syzkaller.appspotmail.com 
> Link: https://syzkaller.appspot.com/bug?extid=9b33c9b118d77ff59b6f 
> Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>

Thanks for the patch! I've already fixed the problem myself (slightly
differently) but I'll comment about your patch below for educational
purposes :). See
https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git/commit/?h=for_next&id=c2bb80b8bdd04dfe32364b78b61b6a47f717af52

> diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
> index 28b241cd6987..a75480d0ee7e 100644
> --- a/fs/reiserfs/xattr.c
> +++ b/fs/reiserfs/xattr.c
> @@ -121,8 +121,9 @@ static struct dentry *open_xa_root(struct super_block *sb, int flags)
>  	struct dentry *privroot = REISERFS_SB(sb)->priv_root;
>  	struct dentry *xaroot;
>  
> -	if (d_really_is_negative(privroot))
> +	if (!privroot || d_really_is_negative(privroot)) {
>  		return ERR_PTR(-EOPNOTSUPP);

I don't think EOPNOTSUPP is correct return code for !privroot case. AFAICS
it would propagate out of reiserfs xattr code and would result in denying
access to lookup_one_len() so xattr dir could never be initialized for such
filesystem. So we need to return 0 (success, no xattrs present) in this
case and because this is just a special case when we are initializing xattr
dir and recurse back into xattr code, I've decided to perform this check
directly in reiserfs_xattr_get().

> +	}

There's no need for additional braces in this 'if'.
>  
>  	inode_lock_nested(d_inode(privroot), I_MUTEX_XATTR);

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
