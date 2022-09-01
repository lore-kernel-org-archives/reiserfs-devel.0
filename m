From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v2 08/14] ocfs2: replace ll_rw_block()
Date: Thu, 1 Sep 2022 17:51:05 +0200
Message-ID: <20220901155105.q56thxo7hcudwgrx@quack3>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-9-yi.zhang@huawei.com>
Mime-Version: 1.0
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1662047465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5I0mKqUw3QSCLqCj5YIpAi2jtZ5obLRbYrhgg3fEUoY=;
        b=U7Un8DCOE4vHaNWAjnV1RHJvIkAJvwVTD1iy5tLgzFzn0yi3st4XwSnjHZ/fW2kX5uI0R+
        8giwSrL7sQmTu8X13dL0oCRXv81or0G6HiV5h4tVqsSN1kkb7nNO8hOshvQBw2Jv9VtVKb
        asX++mLhndXWdZAcD15WQ2NnJi/AApA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1662047465;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5I0mKqUw3QSCLqCj5YIpAi2jtZ5obLRbYrhgg3fEUoY=;
        b=Yk5d8GzmcdpIlqYUaOt3CYZpv7xi85ztTzS8BwutP7VVFVQTqz0Tihub+VeK5FtVBlJBXC
        wJZX9dP1SI+QWQDQ==
Content-Disposition: inline
In-Reply-To: <20220901133505.2510834-9-yi.zhang@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, jack@suse.cz, tytso@mit.edu, akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, rpeterso@redhat.com, agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, hch@infradead.org, chengzhihao1@huawei.com, yukuai3@huawei.com

On Thu 01-09-22 21:34:59, Zhang Yi wrote:
> ll_rw_block() is not safe for the sync read path because it cannot
> guarantee that submitting read IO if the buffer has been locked. We
> could get false positive EIO after wait_on_buffer() if the buffer has
> been locked by others. So stop using ll_rw_block() in ocfs2.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ocfs2/aops.c  | 2 +-
>  fs/ocfs2/super.c | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
> index af4157f61927..1d65f6ef00ca 100644
> --- a/fs/ocfs2/aops.c
> +++ b/fs/ocfs2/aops.c
> @@ -636,7 +636,7 @@ int ocfs2_map_page_blocks(struct page *page, u64 *p_blkno,
>  			   !buffer_new(bh) &&
>  			   ocfs2_should_read_blk(inode, page, block_start) &&
>  			   (block_start < from || block_end > to)) {
> -			ll_rw_block(REQ_OP_READ, 1, &bh);
> +			bh_read_nowait(bh, 0);
>  			*wait_bh++=bh;
>  		}
>  
> diff --git a/fs/ocfs2/super.c b/fs/ocfs2/super.c
> index e2cc9eec287c..26b4c2bfee49 100644
> --- a/fs/ocfs2/super.c
> +++ b/fs/ocfs2/super.c
> @@ -1764,9 +1764,7 @@ static int ocfs2_get_sector(struct super_block *sb,
>  	if (!buffer_dirty(*bh))
>  		clear_buffer_uptodate(*bh);
>  	unlock_buffer(*bh);
> -	ll_rw_block(REQ_OP_READ, 1, bh);
> -	wait_on_buffer(*bh);
> -	if (!buffer_uptodate(*bh)) {
> +	if (bh_read(*bh, 0) < 0) {
>  		mlog_errno(-EIO);
>  		brelse(*bh);
>  		*bh = NULL;
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
