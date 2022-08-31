From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 10/14] udf: replace ll_rw_block()
Date: Wed, 31 Aug 2022 13:05:41 +0200
Message-ID: <20220831110541.gq4pqyb2b2kc5avt@quack3>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
 <20220831072111.3569680-11-yi.zhang@huawei.com>
Mime-Version: 1.0
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1661943941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wjFNeuDmnSdi4atjC35RmIYpin0KTe8MFHXFLhg136I=;
        b=eh/mtM7OvdKM100QKHqjnEnIeTvSh7jPvX6F39ozEjvde8Dd+ndhdMppBWba/sJ1tnzFdf
        ewlMfhj5VaCXrOBwKGzIXCxnxFIrtVFY4CivK/tntKqVIuBTKX4Zo2E2eFXyxxJABECRKz
        Lgneaa/EaYURl2bbQylWiSQIGnw4t/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1661943941;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wjFNeuDmnSdi4atjC35RmIYpin0KTe8MFHXFLhg136I=;
        b=/X6EjebPK/nXjdXs0OkjNJJCQa9lrq6MrM4FOvrkmtBBl0K4x7HHQHNTru+hzyjfCCPSAp
        cFjSgDUKZJqweqBA==
Content-Disposition: inline
In-Reply-To: <20220831072111.3569680-11-yi.zhang@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, jack@suse.cz, tytso@mit.edu, akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, rpeterso@redhat.com, agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, hch@infradead.org, chengzhihao1@huawei.com, yukuai3@huawei.com

On Wed 31-08-22 15:21:07, Zhang Yi wrote:
> ll_rw_block() is not safe for the sync read path because it cannot
> guarantee that submitting read IO if the buffer has been locked. We
> could get false positive EIO after wait_on_buffer() if the buffer has
> been locked by others. So stop using ll_rw_block(). We also switch to
> new bh_readahead_batch() helper for the buffer array readahead path.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/udf/dir.c       | 2 +-
>  fs/udf/directory.c | 2 +-
>  fs/udf/inode.c     | 5 +----
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/udf/dir.c b/fs/udf/dir.c
> index cad3772f9dbe..15a98aa33aa8 100644
> --- a/fs/udf/dir.c
> +++ b/fs/udf/dir.c
> @@ -130,7 +130,7 @@ static int udf_readdir(struct file *file, struct dir_context *ctx)
>  					brelse(tmp);
>  			}
>  			if (num) {
> -				ll_rw_block(REQ_OP_READ | REQ_RAHEAD, num, bha);
> +				bh_readahead_batch(bha, num, REQ_RAHEAD);
>  				for (i = 0; i < num; i++)
>  					brelse(bha[i]);
>  			}
> diff --git a/fs/udf/directory.c b/fs/udf/directory.c
> index a2adf6293093..469bc22d6bff 100644
> --- a/fs/udf/directory.c
> +++ b/fs/udf/directory.c
> @@ -89,7 +89,7 @@ struct fileIdentDesc *udf_fileident_read(struct inode *dir, loff_t *nf_pos,
>  					brelse(tmp);
>  			}
>  			if (num) {
> -				ll_rw_block(REQ_OP_READ | REQ_RAHEAD, num, bha);
> +				bh_readahead_batch(bha, num, REQ_RAHEAD);
>  				for (i = 0; i < num; i++)
>  					brelse(bha[i]);
>  			}
> diff --git a/fs/udf/inode.c b/fs/udf/inode.c
> index 8d06daed549f..0971f09d20fc 100644
> --- a/fs/udf/inode.c
> +++ b/fs/udf/inode.c
> @@ -1214,10 +1214,7 @@ struct buffer_head *udf_bread(struct inode *inode, udf_pblk_t block,
>  	if (buffer_uptodate(bh))
>  		return bh;
>  
> -	ll_rw_block(REQ_OP_READ, 1, &bh);
> -
> -	wait_on_buffer(bh);
> -	if (buffer_uptodate(bh))
> +	if (!bh_read(bh, 0))
>  		return bh;
>  
>  	brelse(bh);
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
