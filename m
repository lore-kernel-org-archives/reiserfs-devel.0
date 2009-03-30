From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: fix build breakage
Date: Mon, 30 Mar 2009 16:45:31 -0400
Message-ID: <49D12F6B.6060408@suse.com>
References: <20090330203240.GA19456@orion>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090330203240.GA19456@orion>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alexander Beregalov wrote:
> fs/reiserfs/inode.c: In function 'reiserfs_new_inode':
> fs/reiserfs/inode.c:1919: warning: passing argument 1 of
> 'reiserfs_inherit_default_acl' from incompatible pointer type
> fs/reiserfs/inode.c:1919: warning: passing argument 2 of
> 'reiserfs_inherit_default_acl' from incompatible pointer type
> fs/reiserfs/inode.c:1919: warning: passing argument 3 of
> 'reiserfs_inherit_default_acl' from incompatible pointer type
> fs/reiserfs/inode.c:1919: error: too many arguments to function
> 'reiserfs_inherit_default_acl'
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> ---
> 
>  include/linux/reiserfs_acl.h |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/include/linux/reiserfs_acl.h b/include/linux/reiserfs_acl.h
> index 52240e0..8cc6575 100644
> --- a/include/linux/reiserfs_acl.h
> +++ b/include/linux/reiserfs_acl.h
> @@ -80,7 +80,8 @@ static inline int reiserfs_acl_chmod(struct inode *inode)
>  }
>  
>  static inline int
> -reiserfs_inherit_default_acl(const struct inode *dir, struct dentry *dentry,
> +reiserfs_inherit_default_acl(struct reiserfs_transaction_handle *th,
> +			     const struct inode *dir, struct dentry *dentry,
>  			     struct inode *inode)
>  {
>  	return 0;

Acked-by: Jeff Mahoney <jeffm@suse.com>

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAknRL2sACgkQLPWxlyuTD7KPRQCeKLggyevsf27KTS+CujDnR23G
2XoAnRqE0fO0PAbqmL1DSXwK3HhRxQ+2
=ed4M
-----END PGP SIGNATURE-----
