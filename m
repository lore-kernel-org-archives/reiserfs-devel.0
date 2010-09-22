From: Jarek Poplawski <jarkao2@gmail.com>
Subject: Re: Re: [Bug] possible circular locking in reiserfs_unpack
Date: Wed, 22 Sep 2010 19:22:31 +0200
Message-ID: <20100922172231.GA1924@del.dom.local>
References: <20100905113121.GA1876@del.dom.local>
 <20100908153730.5ad13f71.akpm@linux-foundation.org>
 <20100909015346.GA5999@nowhere>
 <4C88F566.7080600@gmail.com>
 <20100922134944.GA6549@nowhere>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=aZmgCMr/5v1S3twv2cM64Zm6yQJDIDAtSyKXCwnXQFc=;
        b=ONChASMWX3jU95YwRBMVUf4BCFYkcOa2+D+HTsFIwsf/RrwyH3+LKeQ1x+iaVFiR9o
         sBqwyjU/iMiPDr0gtoz+I33r0KFUYFoG/BUZUpqfbnvDPiQiAYkg0Cch5ZOXAzpQyP3b
         VHnraWE+yMCpteCxI740xQiy9rGqw/QNkk7po=
Content-Disposition: inline
In-Reply-To: <20100922134944.GA6549@nowhere>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>

On Wed, Sep 22, 2010 at 03:49:48PM +0200, Frederic Weisbecker wrote:
> 
> I can reproduce your first case, but not this one.
> 
> So, I hope you can give a try to the following fix,
> 
> Thanks!
> 

With this patch I don't have any lockdep warnings during lilo writes.

Well done, thanks!

Tested-by: Jarek Poplawski <jarkao2@gmail.com>

> 
> diff --git a/fs/reiserfs/ioctl.c b/fs/reiserfs/ioctl.c
> index f53505d..90a757b 100644
> --- a/fs/reiserfs/ioctl.c
> +++ b/fs/reiserfs/ioctl.c
> @@ -170,7 +170,7 @@ int reiserfs_prepare_write(struct file *f, struct page *page,
>  int reiserfs_unpack(struct inode *inode, struct file *filp)
>  {
>  	int retval = 0;
> -	int index;
> +	int index, depth;
>  	struct page *page;
>  	struct address_space *mapping;
>  	unsigned long write_from;
> @@ -185,11 +185,12 @@ int reiserfs_unpack(struct inode *inode, struct file *filp)
>  		return 0;
>  	}
>  
> +	depth = reiserfs_write_lock_once(inode->i_sb);
> +
>  	/* we need to make sure nobody is changing the file size beneath
>  	 ** us
>  	 */
> -	mutex_lock(&inode->i_mutex);
> -	reiserfs_write_lock(inode->i_sb);
> +	reiserfs_mutex_lock_safe(&inode->i_mutex, inode->i_sb);
>  
>  	write_from = inode->i_size & (blocksize - 1);
>  	/* if we are on a block boundary, we are already unpacked.  */
> @@ -224,6 +225,6 @@ int reiserfs_unpack(struct inode *inode, struct file *filp)
>  
>        out:
>  	mutex_unlock(&inode->i_mutex);
> -	reiserfs_write_unlock(inode->i_sb);
> +	reiserfs_write_unlock_once(inode->i_sb, depth);
>  	return retval;
>  }
> 
