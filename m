From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: Replace kmalloc with kcalloc in the comment
Date: Fri, 29 May 2020 08:52:58 +0200
Message-ID: <20200529065258.GK14550@quack2.suse.cz>
References: <1590714150-15895-1-git-send-email-wang.yi59@zte.com.cn>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1590714150-15895-1-git-send-email-wang.yi59@zte.com.cn>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yi Wang <wang.yi59@zte.com.cn>
Cc: jeffm@suse.com, jack@suse.cz, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, xue.zhihong@zte.com.cn, wang.liang82@zte.com.cn, Liao Pingfang <liao.pingfang@zte.com.cn>

On Fri 29-05-20 09:02:30, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Use kcalloc instead of kmalloc in the comment according to
> the previous kcalloc() call.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>

Thanks. I've added the patch to my tree.

								Honza

> ---
>  fs/reiserfs/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
> index 6419e6d..21ad762 100644
> --- a/fs/reiserfs/inode.c
> +++ b/fs/reiserfs/inode.c
> @@ -1066,7 +1066,7 @@ int reiserfs_get_block(struct inode *inode, sector_t block,
>  			} else {
>  				/* paste hole to the indirect item */
>  				/*
> -				 * If kmalloc failed, max_to_insert becomes
> +				 * If kcalloc failed, max_to_insert becomes
>  				 * zero and it means we only have space for
>  				 * one block
>  				 */
> -- 
> 2.9.5
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
