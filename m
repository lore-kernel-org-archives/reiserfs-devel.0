From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v2 04/14] gfs2: replace ll_rw_block()
Date: Thu, 1 Sep 2022 17:46:44 +0200
Message-ID: <20220901154644.uxxzwa7gvzlnbw7j@quack3>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-5-yi.zhang@huawei.com>
Mime-Version: 1.0
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1662047204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ER5/wzctY1JkhCLGtz3EQTHmS/rSylXbZsr8bP56n58=;
        b=pYpvEB1TmGjm8w9ZO025ZJi1mKJ5APp3kAmy6ytuh7FOsOF4aT2GnAY5QPFTbV78lJf3i6
        S6owfPABPJ7q8tVDcvQhOhAD9xrqNabulW59Ye+JNuQPSEu3Hc/F5Fm+XiXmcXqODVUWQg
        QBCOoh/GgMlVi4vLG7nrbaTVJuZHykU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1662047204;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ER5/wzctY1JkhCLGtz3EQTHmS/rSylXbZsr8bP56n58=;
        b=CQHn61+Ymblc4OV77OAZiRc+28mY55tAzplOZrHAIEIhFvwR7MSOVwzpIrthiIC6RR5nTj
        AZXQC1qsdzYhkRCw==
Content-Disposition: inline
In-Reply-To: <20220901133505.2510834-5-yi.zhang@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, jack@suse.cz, tytso@mit.edu, akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, rpeterso@redhat.com, agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, hch@infradead.org, chengzhihao1@huawei.com, yukuai3@huawei.com

On Thu 01-09-22 21:34:55, Zhang Yi wrote:
> ll_rw_block() is not safe for the sync read path because it cannot
> guarantee that always submitting read IO if the buffer has been locked,
> so stop using it. We also switch to new bh_readahead() helper for the
> readahead path.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/gfs2/meta_io.c | 7 ++-----
>  fs/gfs2/quota.c   | 8 ++------
>  2 files changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
> index 7e70e0ba5a6c..6ed728aae9a5 100644
> --- a/fs/gfs2/meta_io.c
> +++ b/fs/gfs2/meta_io.c
> @@ -525,8 +525,7 @@ struct buffer_head *gfs2_meta_ra(struct gfs2_glock *gl, u64 dblock, u32 extlen)
>  
>  	if (buffer_uptodate(first_bh))
>  		goto out;
> -	if (!buffer_locked(first_bh))
> -		ll_rw_block(REQ_OP_READ | REQ_META | REQ_PRIO, 1, &first_bh);
> +	bh_read_nowait(first_bh, REQ_META | REQ_PRIO);
>  
>  	dblock++;
>  	extlen--;
> @@ -534,9 +533,7 @@ struct buffer_head *gfs2_meta_ra(struct gfs2_glock *gl, u64 dblock, u32 extlen)
>  	while (extlen) {
>  		bh = gfs2_getbuf(gl, dblock, CREATE);
>  
> -		if (!buffer_uptodate(bh) && !buffer_locked(bh))
> -			ll_rw_block(REQ_OP_READ | REQ_RAHEAD | REQ_META |
> -				    REQ_PRIO, 1, &bh);
> +		bh_readahead(bh, REQ_RAHEAD | REQ_META | REQ_PRIO);
>  		brelse(bh);
>  		dblock++;
>  		extlen--;
> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> index f201eaf59d0d..1ed17226d9ed 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -745,12 +745,8 @@ static int gfs2_write_buf_to_page(struct gfs2_inode *ip, unsigned long index,
>  		}
>  		if (PageUptodate(page))
>  			set_buffer_uptodate(bh);
> -		if (!buffer_uptodate(bh)) {
> -			ll_rw_block(REQ_OP_READ | REQ_META | REQ_PRIO, 1, &bh);
> -			wait_on_buffer(bh);
> -			if (!buffer_uptodate(bh))
> -				goto unlock_out;
> -		}
> +		if (bh_read(bh, REQ_META | REQ_PRIO) < 0)
> +			goto unlock_out;
>  		if (gfs2_is_jdata(ip))
>  			gfs2_trans_add_data(ip->i_gl, bh);
>  		else
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
