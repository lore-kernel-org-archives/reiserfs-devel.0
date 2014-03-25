From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 1/1] fs/reiserfs/super.c: add __init to init_inodecache
Date: Tue, 25 Mar 2014 12:26:40 -0400
Message-ID: <5331AE40.5040903@suse.com>
References: <20140321171626.d835c81af6c795cb3ae2fb6a@skynet.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20140321171626.d835c81af6c795cb3ae2fb6a@skynet.be>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabian Frederick <fabf@skynet.be>, linux-kernel <linux-kernel@vger.kernel.org>
Cc: reiserfs-devel@vger.kernel.org, akpm <akpm@linux-foundation.org>

On 3/21/14, 12:16 PM, Fabian Frederick wrote:
> init_inodecache is only called by __init init_reiserfs_fs.
> 
> Signed-off-by: Fabian Frederick <fabf@skynet.be>
Acked-by: Jeff Mahoney <jeffm@suse.com>
> ---
>  fs/reiserfs/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
> index 2c80335..7035087 100644
> --- a/fs/reiserfs/super.c
> +++ b/fs/reiserfs/super.c
> @@ -597,7 +597,7 @@ static void init_once(void *foo)
>  	inode_init_once(&ei->vfs_inode);
>  }
>  
> -static int init_inodecache(void)
> +static int __init init_inodecache(void)
>  {
>  	reiserfs_inode_cachep = kmem_cache_create("reiser_inode_cache",
>  						  sizeof(struct
> 


-- 
Jeff Mahoney
SUSE Labs
