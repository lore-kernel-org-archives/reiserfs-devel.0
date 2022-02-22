From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: get rid of AOP_FLAG_CONT_EXPAND flag
Date: Tue, 22 Feb 2022 11:27:27 +0100
Message-ID: <20220222102727.2sqf4wfdtjaxrqat@quack3.lan>
References: <fbc744c9-e22f-138c-2da3-f76c3edfcc3d@gmail.com>
 <20220220232219.1235-1-edward.shishkin@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1645525648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kivNo8O9f0xYdBqHOtHR3oHQM1HkqlcvyLe3qAUWobY=;
        b=OD3gFnKo7vYSPf0M6Q5CNxsfzibqhnX4oBnpSLy2F73DdB4ifZmFeLOHzvIxpCmVmlf4lt
        sUHHaFa+CtBDX6blVzU5QkaXCdpny30+e9IA0d7v+vg5ygQoEStTbM/leiuFymCkWLLUSC
        cco/yI4FRUSM/SAvtCEnRBBQ26TtTzM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1645525648;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kivNo8O9f0xYdBqHOtHR3oHQM1HkqlcvyLe3qAUWobY=;
        b=G9Z0zmq5ir/7qZPyQYVxgNCfrAofxXD+88eqbF9cKeLcTgtSjsn5IOEAIc2P2/I6wThVq9
        Ow06trvVykuB6sDg==
Content-Disposition: inline
In-Reply-To: <20220220232219.1235-1-edward.shishkin@gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: willy@infradead.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org, jack@suse.cz

On Mon 21-02-22 00:22:19, Edward Shishkin wrote:
> Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
> ---
>  fs/reiserfs/inode.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)

Thanks! I have queued this patch into my tree.

								Honza

> 
> diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
> index f49b72ccac4c..e943930939f5 100644
> --- a/fs/reiserfs/inode.c
> +++ b/fs/reiserfs/inode.c
> @@ -2763,13 +2763,6 @@ static int reiserfs_write_begin(struct file *file,
>  	int old_ref = 0;
>  
>   	inode = mapping->host;
> -	*fsdata = NULL;
> - 	if (flags & AOP_FLAG_CONT_EXPAND &&
> - 	    (pos & (inode->i_sb->s_blocksize - 1)) == 0) {
> - 		pos ++;
> -		*fsdata = (void *)(unsigned long)flags;
> -	}
> -
>  	index = pos >> PAGE_SHIFT;
>  	page = grab_cache_page_write_begin(mapping, index, flags);
>  	if (!page)
> @@ -2896,9 +2889,6 @@ static int reiserfs_write_end(struct file *file, struct address_space *mapping,
>  	unsigned start;
>  	bool locked = false;
>  
> -	if ((unsigned long)fsdata & AOP_FLAG_CONT_EXPAND)
> -		pos ++;
> -
>  	reiserfs_wait_on_write_block(inode->i_sb);
>  	if (reiserfs_transaction_running(inode->i_sb))
>  		th = current->journal_info;
> @@ -3316,7 +3306,11 @@ int reiserfs_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
>  
>  		/* fill in hole pointers in the expanding truncate case. */
>  		if (attr->ia_size > inode->i_size) {
> -			error = generic_cont_expand_simple(inode, attr->ia_size);
> +			loff_t pos = attr->ia_size;
> +
> +			if ((pos & (inode->i_sb->s_blocksize - 1)) == 0)
> +				pos++;
> +			error = generic_cont_expand_simple(inode, pos);
>  			if (REISERFS_I(inode)->i_prealloc_count > 0) {
>  				int err;
>  				struct reiserfs_transaction_handle th;
> -- 
> 2.21.3
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
