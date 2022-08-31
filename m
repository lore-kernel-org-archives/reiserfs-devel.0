From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 03/14] fs/buffer: replace ll_rw_block()
Date: Wed, 31 Aug 2022 12:51:25 +0200
Message-ID: <20220831105125.mv2674t37yhns2sf@quack3>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
 <20220831072111.3569680-4-yi.zhang@huawei.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1661943086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8KZxa7BkROWFtCJZpT4HFztv+uWtNZCErlyLPEOrTQ4=;
        b=sqmJ9PM0wpZHkNAS85aj9uz518aQ2XnQtkbTq/O+CTY3nfacrgxywR/5cynYnfgirgp9mH
        Mc+/x/hRkOKlr1sZDklZX/YrxZjwAFo4p3eMzt36CDeqygI9aLvHxUWUqnT65uRq802lIS
        1p6vD3j0ryv2VAaez7Shfs81KmCDhX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1661943086;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8KZxa7BkROWFtCJZpT4HFztv+uWtNZCErlyLPEOrTQ4=;
        b=bHu1UtCzvIt7Rh3BTdHNRRaTnSEFRz0PBvomL6mPmvV1ZkUGR3oA+CEMQxkTi5SFa1noE4
        NpUjHxUvdUsUFCBQ==
Content-Disposition: inline
In-Reply-To: <20220831072111.3569680-4-yi.zhang@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, jack@suse.cz, tytso@mit.edu, akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, rpeterso@redhat.com, agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, hch@infradead.org, chengzhihao1@huawei.com, yukuai3@huawei.com

On Wed 31-08-22 15:21:00, Zhang Yi wrote:
> ll_rw_block() is not safe for the sync IO path because it skip buffers
> which has been locked by others, it could lead to false positive EIO
> when submitting read IO. So stop using ll_rw_block(), switch to use new
> helpers which could guarantee buffer locked and submit IO if needed.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
> ---
>  fs/buffer.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/buffer.c b/fs/buffer.c
> index a663191903ed..e14adc638bfe 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
...
> @@ -1342,7 +1342,8 @@ void __breadahead(struct block_device *bdev, sector_t block, unsigned size)
>  {
>  	struct buffer_head *bh = __getblk(bdev, block, size);
>  	if (likely(bh)) {
> -		ll_rw_block(REQ_OP_READ | REQ_RAHEAD, 1, &bh);
> +		if (trylock_buffer(bh))
> +			__bh_read(bh, REQ_RAHEAD, false);

I suppose this can be bh_readahead()?

>  		brelse(bh);
>  	}
>  }

Otherwise the patch looks good.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
