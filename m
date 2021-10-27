From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] fs: reiserfs: free new_opts in reiserfs_remount
Date: Wed, 27 Oct 2021 11:46:44 +0200
Message-ID: <20211027094644.GA28650@quack2.suse.cz>
References: <20211027033947.3992059-1-mudongliangabcd@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1635328004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QOaGRGXD0H4nAMtowdLuFZCJQWrMmL8XSspoY0iadQM=;
        b=LFhokB2Xu2F6JuySRm6q8NUO7LbRF3OJcV/9yjlVF1DxhFYKRY6c6lRMTkEuYk+ZWLDIMA
        0qi5ZYQy0skUm6hnCTdDapfrEywuSPJtmMrGhat81hjUvcAIR3ElhzFD9zObOS3d+Cd6Ik
        yW53DinJMfHDoqUvGhunO4FDNcvBDf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1635328004;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QOaGRGXD0H4nAMtowdLuFZCJQWrMmL8XSspoY0iadQM=;
        b=ASqfEBZkKr5KcIsxKQ5Nog8xnwLc0n3Tfl2rxxJdU2fAbS4k8RE7up8qr+1OvgOJrkXIyV
        cpQ6JAlcqY8fYsAg==
Content-Disposition: inline
In-Reply-To: <20211027033947.3992059-1-mudongliangabcd@gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Yu Kuai <yukuai3@huawei.com>, Jan Kara <jack@suse.cz>, Miklos Szeredi <mszeredi@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed 27-10-21 11:39:25, Dongliang Mu wrote:
> Since the commit c3d98ea08291 ("VFS: Don't use save/replace_mount_options
> if not using generic_show_options") eliminates replace_mount_options
> in reiserfs, but did not handle the allocated new_opts,
> it will cause memory leak in the reiserfs_remount.
> 
> Fix this by freeing new_opts in the reiserfs_remount temporarily.
> 
> Fixes: c3d98ea08291 ("VFS: Don't use save/replace_mount_options if not using generic_show_options")
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>

Thanks for the patch but I can see that new_opts is not actually used at
all in reiserfs_remount() so we should perhaps just remove them (including
kstrdup() et al).

								Honza

> ---
>  fs/reiserfs/super.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
> index 58481f8d63d5..b36865c8b66a 100644
> --- a/fs/reiserfs/super.c
> +++ b/fs/reiserfs/super.c
> @@ -1594,6 +1594,7 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
>  	}
>  
>  out_ok_unlocked:
> +	kfree(new_opts);
>  	return 0;
>  
>  out_err_unlock:
> -- 
> 2.25.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
