From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: prevent NULL pointer dereference in
 reiserfs_insert_item()
Date: Mon, 16 Dec 2019 18:05:53 +0100
Message-ID: <20191216170553.GA16051@quack2.suse.cz>
References: <79c5135d-ff25-1cc9-4e99-9f572b88cc00@huawei.com>
 <20c04f55-aa48-d28a-f8ff-1efed8a38f3a@huawei.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20c04f55-aa48-d28a-f8ff-1efed8a38f3a@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yunfeng Ye <yeyunfeng@huawei.com>
Cc: akpm@linux-foundation.org, zhengbin13@huawei.com, jack@suse.cz, yanaijie@huawei.com, darrick.wong@oracle.com, linux.bhar@gmail.com, hariprasad.kelam@gmail.com, deepa.kernel@gmail.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, "hushiyuan@huawei.com" <hushiyuan@huawei.com>, "linfeilong@huawei.com" <linfeilong@huawei.com>

On Mon 16-12-19 20:05:32, Yunfeng Ye wrote:
> The variable inode may be NULL in reiserfs_insert_item(), but there is
> no check before accessing the member of inode.
> 
> Fix this by adding NULL pointer check before calling reiserfs_debug().
> 
> Signed-off-by: Yunfeng Ye <yeyunfeng@huawei.com>

Thanks, I've added the patch to my tree.

								Honza

> ---
>  fs/reiserfs/stree.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
> index da9ebe33882b..bb4973aefbb1 100644
> --- a/fs/reiserfs/stree.c
> +++ b/fs/reiserfs/stree.c
> @@ -2246,7 +2246,8 @@ int reiserfs_insert_item(struct reiserfs_transaction_handle *th,
>  	/* also releases the path */
>  	unfix_nodes(&s_ins_balance);
>  #ifdef REISERQUOTA_DEBUG
> -	reiserfs_debug(th->t_super, REISERFS_DEBUG_CODE,
> +	if (inode)
> +		reiserfs_debug(th->t_super, REISERFS_DEBUG_CODE,
>  		       "reiserquota insert_item(): freeing %u id=%u type=%c",
>  		       quota_bytes, inode->i_uid, head2type(ih));
>  #endif
> -- 
> 2.7.4
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
