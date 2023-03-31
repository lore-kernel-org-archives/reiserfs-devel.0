From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: remove unused iter variable
Date: Fri, 31 Mar 2023 14:21:46 +0200
Message-ID: <20230331122146.3rmw3dqv6y573pg2@quack3>
References: <20230331120325.1855111-1-trix@redhat.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1680265306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3GnhdEVRiXpY8fy5LwSvQ63l1Tv95/C9yEYwE8xQJFI=;
        b=N3AdQR8s1TpV+AIiNrFfqeZy5037pMRRncNNTN3rVp2pe18xJ4gOo8krnHaamj4CAwfSMJ
        6hfvdnwbCEtFbldvm4Nqb3UJMDAGVD568HeGtT7fdK2KLDwJQU0ftYJeRDM5MbNOk8QE7h
        6YwYLuH5fmPWULZzs+jKsWpVy+JJpGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1680265306;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3GnhdEVRiXpY8fy5LwSvQ63l1Tv95/C9yEYwE8xQJFI=;
        b=J1L5ruveSfJbRzEnimD3K36YgonuEJferAtuRSPRvGN2nTxLuFeATWN5VftGwUvqgMco/b
        QpQuM8adArlSXoCg==
Content-Disposition: inline
In-Reply-To: <20230331120325.1855111-1-trix@redhat.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Rix <trix@redhat.com>
Cc: nathan@kernel.org, ndesaulniers@google.com, axboe@kernel.dk, akpm@linux-foundation.org, bvanassche@acm.org, jack@suse.cz, yi.zhang@huawei.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev

On Fri 31-03-23 08:03:25, Tom Rix wrote:
> clang with W=1 reports
> fs/reiserfs/stree.c:1265:6: error: variable
>   'iter' set but not used [-Werror,-Wunused-but-set-variable]
>         int iter = 0;
>             ^
> This variable is not used so remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks. I've merged the patch to my tree.

								Honza

> ---
>  fs/reiserfs/stree.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
> index 84c12a1947b2..ce5003986789 100644
> --- a/fs/reiserfs/stree.c
> +++ b/fs/reiserfs/stree.c
> @@ -1262,7 +1262,6 @@ int reiserfs_delete_item(struct reiserfs_transaction_handle *th,
>  
>  #ifdef CONFIG_REISERFS_CHECK
>  	char mode;
> -	int iter = 0;
>  #endif
>  
>  	BUG_ON(!th->t_trans_id);
> @@ -1274,7 +1273,6 @@ int reiserfs_delete_item(struct reiserfs_transaction_handle *th,
>  		removed = 0;
>  
>  #ifdef CONFIG_REISERFS_CHECK
> -		iter++;
>  		mode =
>  #endif
>  		    prepare_for_delete_or_cut(th, inode, path,
> -- 
> 2.27.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
